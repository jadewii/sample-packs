# Sample Packs Repository

Organized audio sample packs for iOS/watchOS/iPadOS development, optimized for easy integration with Claude Code.

## Structure

All sample packs are organized in the `organized_packs/` directory with the following structure:

```
organized_packs/
├── [Pack Name]/
│   ├── 0/          # Melodic content (loops, chords, melodies)
│   ├── 1/          # Kicks
│   ├── 2/          # Snares
│   ├── 3/          # Hats
│   ├── 4/          # Claps
│   ├── 5/          # Percussion
│   ├── 6/          # Cymbals
│   ├── 7/          # FX/Fills
│   └── 8/          # Misc/Other
```

## Folder Numbering Convention

| Number | Content Type |
|--------|-------------|
| 0      | Melodic content (loops, chords, melodies) |
| 1      | Kicks |
| 2      | Snares |
| 3      | Hats |
| 4      | Claps |
| 5      | Percussion |
| 6      | Cymbals |
| 7      | FX/Fills |
| 8      | Misc/Other |

## Audio Format

All audio files are converted to **m4a format** for optimal iOS/watchOS/iPadOS compatibility and file size efficiency.

## Usage with Claude Code

You can now easily tell Claude Code to add sounds from specific kits to your projects:

### Examples:

**Add kicks from a specific kit:**
```
"Add all kicks from FB Lo-Fi Drums to my project"
```
*Claude Code will look in: `organized_packs/FB Lo-Fi Drums/1/`*

**Add snares from a specific kit:**
```
"Add snares from Physical Modeling Drums to my project"
```
*Claude Code will look in: `organized_packs/Physical Modeling Drums/2/`*

**Add hats from a specific kit:**
```
"Add all hats from Glitch Drum to my project"
```
*Claude Code will look in: `organized_packs/Glitch Drum/3/`*

**Add multiple elements:**
```
"Add kicks and snares from FB Lo-Fi Drums to my project"
```
*Claude Code will look in: `organized_packs/FB Lo-Fi Drums/1/` and `organized_packs/FB Lo-Fi Drums/2/`*

**Add melodic content:**
```
"Add chords from Ambient Chords to my project"
```
*Claude Code will look in: `organized_packs/Ambient Chords/0/`*

**Add everything from a kit:**
```
"Add all sounds from Shahi Baaja to my project"
```
*Claude Code will look in all numbered folders within `organized_packs/Shahi Baaja/`*

## Available Sample Packs

- **Ambient Chords** - Smooth ambient chord progressions
- **Anime Emotions Vol. 1 & 2** - Emotional melodic content
- **Bright Koto** - Traditional Japanese koto samples
- **FB Lo-Fi Drums** - Lo-fi drum kit with organized categories
- **FM Drums** - FM synthesized drum sounds
- **FX Vol.2** - Sound effects and textures
- **Glitch Drum** - Glitchy, experimental drum sounds
- **Koto Nagoya** - Additional koto samples
- **MU-15** - Vintage synthesizer samples
- **Mommas House & Mommas House 2** - Hip-hop style samples
- **Physical Modeling Drums** - Physically modeled drum sounds
- **Shahi Baaja** - Indian classical instrument samples
- **Shamisen** - Traditional Japanese shamisen samples
- **Suiko ST-50** - Vintage drum machine samples
- **Techno Shards** - Electronic techno elements

## Integration Tips

1. **Specific requests work best**: Instead of "add drums", say "add kicks from FB Lo-Fi Drums"
2. **Use exact pack names**: Reference the pack names as they appear in the `organized_packs/` directory
3. **Combine requests**: You can ask for multiple types from the same pack or different packs
4. **File paths**: All samples are in m4a format and ready for direct integration into iOS projects

## File Size Optimization

All samples have been converted to m4a format with:
- AAC compression at 128kbps
- Optimized for iOS playback
- Reduced file sizes for better app performance
- Maintained audio quality suitable for mobile apps

## Repository URL

https://github.com/jadewii/sample-packs

---

*This repository is optimized for use with Claude Code and iOS/watchOS/iPadOS development workflows.*