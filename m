Received: by 10.25.159.19 with SMTP id i19csp1784521lfe;
        Thu, 14 Jan 2016 05:49:48 -0800 (PST)
X-Received: by 10.140.143.68 with SMTP id 65mr6032941qhp.25.1452779387135;
        Thu, 14 Jan 2016 05:49:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si7511627qhc.40.2016.01.14.05.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJiHa-00062O-MY
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 08:49:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1aJiEC-00012e-W0
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 08:46:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1aJiE8-0003Mx-Sn
	for qemu-devel@nongnu.org; Thu, 14 Jan 2016 08:46:16 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1aJiE8-0003Ml-GT; Thu, 14 Jan 2016 08:46:12 -0500
Received: by mail-wm0-x244.google.com with SMTP id u188so43607908wmu.0;
	Thu, 14 Jan 2016 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=qJNRADsBCqgAKI/niKE59xpVRGutY1lVZgkIuaoHw5A=;
	b=0dr0X9OcqfmwcslbsTPSE6QgyFIRQjyhb9m1gD1Cs3AOPnk2sMjgbFfKKr8RaHiuvY
	v3Wo1H9SbmTECDkMUV3O9nHQw+bfamURqXMCxqvcp5EEK4xu0+xfMDE8cWFfxdZZ7B7o
	8OFQ20HWYdeuIviwd2E8I9+kSrDobR1QwC2o0ve6EzRVRAX5xtlOu8us8VeW7PI4Ln7t
	PMRY1ocjk7LjypQd9pH4XGbZjmqD7w2WNo9aBT5U7gu/o2ALZwqM6CvA8yrIyhvymo79
	1vkKTXsZTLjZw2xRuy8E9xR5qCUvowe3F3X/+jrLQStMq5y/BG/5lrQAgG+t0aLnMsAV
	vsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=qJNRADsBCqgAKI/niKE59xpVRGutY1lVZgkIuaoHw5A=;
	b=auusgY76X477qu95nYpnoM+vSfuo3gBjghKA1FXjYYjcEYGpeI2dGDUVBUvdjPVVYF
	aQUUTnAcrd841oOOCQj4mAKlF0eZiQceFJmVGyRCD8e8eMB9LuXzdU1dS6B7gtmW4t1T
	iBJm6XeVv3LBi/dxhIJq23gNbs6STmERhyn3aJLnJLpAhO+62k36rw5YbjiFr5oRgb12
	YHvav2XharbzK98lRnAR84LpChw8mFJKna/vbec+01Fk2AM7Dn0NwnOgJTX58+UPfQM7
	J0Ec5CM9a1WlcRkgGvIz8i3TlRlBS0fGl3ke6bpEKBIPdB0oPy9ZzdKgr4/8eKozHHeh
	Gziw==
X-Gm-Message-State: ALoCoQks+PmxZEU8TWoWTVmMCjOZVCSucV43yiCe3UL3xfnXrf7YV3SeUBGCNKWosIyL1CmpBiLt7D7VfxM6mn69OQj/jTQRjw==
X-Received: by 10.194.203.99 with SMTP id kp3mr4211293wjc.3.1452779171952;
	Thu, 14 Jan 2016 05:46:11 -0800 (PST)
Received: from nullptr.home.dirty-ice.org (188-143-126-18.pool.digikabel.hu.
	[188.143.126.18])
	by smtp.gmail.com with ESMTPSA id 79sm7398061wmo.7.2016.01.14.05.46.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 05:46:11 -0800 (PST)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
	<dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
	<DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jan 2016 14:45:17 +0100
Message-Id: <f3a051e05cf1d6258627ff8a88ea5f2ae97165cc.1452776884.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1452776884.git.DirtY.iCE.hu@gmail.com>
References: <cover.1452776884.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-devel] [PATCH 04/51] audio: use qapi AudioFormat instead of
	audfmt_e
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZMGKiKjPNH0C

I had to include an enum for audio sampling formats into qapi, but that
meant duplicating the audfmt_e enum.  This patch replaces audfmt_e and
associated values with the qapi generated AudioFormat enum.

This patch is mostly a search-and-replace, except for switches where the
qapi generated AUDIO_FORMAT_MAX caused problems.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/alsaaudio.c         | 53 ++++++++++++++------------
 audio/audio.c             | 97 ++++++++++++++++++++++++++---------------------
 audio/audio.h             | 11 +-----
 audio/audio_win_int.c     | 18 ++++-----
 audio/ossaudio.c          | 30 +++++++--------
 audio/paaudio.c           | 28 +++++++-------
 audio/sdlaudio.c          | 26 ++++++-------
 audio/spiceaudio.c        |  4 +-
 audio/wavaudio.c          | 17 +++++----
 audio/wavcapture.c        |  2 +-
 hw/arm/omap2.c            |  2 +-
 hw/audio/ac97.c           |  2 +-
 hw/audio/adlib.c          |  2 +-
 hw/audio/cs4231a.c        |  6 +--
 hw/audio/es1370.c         |  4 +-
 hw/audio/gus.c            |  2 +-
 hw/audio/hda-codec.c      | 18 ++++-----
 hw/audio/lm4549.c         |  6 +--
 hw/audio/milkymist-ac97.c |  2 +-
 hw/audio/pcspk.c          |  2 +-
 hw/audio/sb16.c           | 14 +++----
 hw/audio/wm8750.c         |  4 +-
 hw/input/tsc210x.c        |  2 +-
 hw/usb/dev-audio.c        |  2 +-
 ui/vnc.c                  | 14 +++----
 25 files changed, 187 insertions(+), 181 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 6315b2d..2b28b99 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -88,7 +88,7 @@ struct alsa_params_req {
 
 struct alsa_params_obt {
     int freq;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int endianness;
     int nchannels;
     snd_pcm_uframes_t samples;
@@ -295,16 +295,16 @@ static int alsa_write (SWVoiceOut *sw, void *buf, int len)
     return audio_pcm_sw_write (sw, buf, len);
 }
 
-static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
+static snd_pcm_format_t aud_to_alsafmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return SND_PCM_FORMAT_S8;
 
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return SND_PCM_FORMAT_U8;
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         if (endianness) {
             return SND_PCM_FORMAT_S16_BE;
         }
@@ -312,7 +312,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
             return SND_PCM_FORMAT_S16_LE;
         }
 
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         if (endianness) {
             return SND_PCM_FORMAT_U16_BE;
         }
@@ -320,7 +320,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
             return SND_PCM_FORMAT_U16_LE;
         }
 
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         if (endianness) {
             return SND_PCM_FORMAT_S32_BE;
         }
@@ -328,7 +328,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
             return SND_PCM_FORMAT_S32_LE;
         }
 
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         if (endianness) {
             return SND_PCM_FORMAT_U32_BE;
         }
@@ -345,58 +345,58 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
     }
 }
 
-static int alsa_to_audfmt (snd_pcm_format_t alsafmt, audfmt_e *fmt,
+static int alsa_to_audfmt (snd_pcm_format_t alsafmt, AudioFormat *fmt,
                            int *endianness)
 {
     switch (alsafmt) {
     case SND_PCM_FORMAT_S8:
         *endianness = 0;
-        *fmt = AUD_FMT_S8;
+        *fmt = AUDIO_FORMAT_S8;
         break;
 
     case SND_PCM_FORMAT_U8:
         *endianness = 0;
-        *fmt = AUD_FMT_U8;
+        *fmt = AUDIO_FORMAT_U8;
         break;
 
     case SND_PCM_FORMAT_S16_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case SND_PCM_FORMAT_U16_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     case SND_PCM_FORMAT_S16_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case SND_PCM_FORMAT_U16_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     case SND_PCM_FORMAT_S32_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_S32;
+        *fmt = AUDIO_FORMAT_S32;
         break;
 
     case SND_PCM_FORMAT_U32_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_U32;
+        *fmt = AUDIO_FORMAT_U32;
         break;
 
     case SND_PCM_FORMAT_S32_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_S32;
+        *fmt = AUDIO_FORMAT_S32;
         break;
 
     case SND_PCM_FORMAT_U32_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_U32;
+        *fmt = AUDIO_FORMAT_U32;
         break;
 
     default:
@@ -639,19 +639,22 @@ static int alsa_open (int in, struct alsa_params_req *req,
         bytes_per_sec = freq << (nchannels == 2);
 
         switch (obt->fmt) {
-        case AUD_FMT_S8:
-        case AUD_FMT_U8:
+        case AUDIO_FORMAT_S8:
+        case AUDIO_FORMAT_U8:
             break;
 
-        case AUD_FMT_S16:
-        case AUD_FMT_U16:
+        case AUDIO_FORMAT_S16:
+        case AUDIO_FORMAT_U16:
             bytes_per_sec <<= 1;
             break;
 
-        case AUD_FMT_S32:
-        case AUD_FMT_U32:
+        case AUDIO_FORMAT_S32:
+        case AUDIO_FORMAT_U32:
             bytes_per_sec <<= 2;
             break;
+
+        default:
+            abort();
         }
 
         threshold = (conf->threshold * bytes_per_sec) / 1000;
diff --git a/audio/audio.c b/audio/audio.c
index 5be4b15..334c935 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -75,7 +75,7 @@ static struct {
         .settings = {
             .freq = 44100,
             .nchannels = 2,
-            .fmt = AUD_FMT_S16,
+            .fmt = AUDIO_FORMAT_S16,
             .endianness =  AUDIO_HOST_ENDIANNESS,
         }
     },
@@ -87,7 +87,7 @@ static struct {
         .settings = {
             .freq = 44100,
             .nchannels = 2,
-            .fmt = AUD_FMT_S16,
+            .fmt = AUDIO_FORMAT_S16,
             .endianness = AUDIO_HOST_ENDIANNESS,
         }
     },
@@ -219,58 +219,61 @@ static char *audio_alloc_prefix (const char *s)
     return r;
 }
 
-static const char *audio_audfmt_to_string (audfmt_e fmt)
+static const char *audio_audfmt_to_string (AudioFormat fmt)
 {
     switch (fmt) {
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return "U8";
 
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         return "U16";
 
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return "S8";
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         return "S16";
 
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         return "U32";
 
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         return "S32";
+
+    default:
+        abort();
     }
 
     dolog ("Bogus audfmt %d returning S16\n", fmt);
     return "S16";
 }
 
-static audfmt_e audio_string_to_audfmt (const char *s, audfmt_e defval,
+static AudioFormat audio_string_to_audfmt (const char *s, AudioFormat defval,
                                         int *defaultp)
 {
     if (!strcasecmp (s, "u8")) {
         *defaultp = 0;
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     }
     else if (!strcasecmp (s, "u16")) {
         *defaultp = 0;
-        return AUD_FMT_U16;
+        return AUDIO_FORMAT_U16;
     }
     else if (!strcasecmp (s, "u32")) {
         *defaultp = 0;
-        return AUD_FMT_U32;
+        return AUDIO_FORMAT_U32;
     }
     else if (!strcasecmp (s, "s8")) {
         *defaultp = 0;
-        return AUD_FMT_S8;
+        return AUDIO_FORMAT_S8;
     }
     else if (!strcasecmp (s, "s16")) {
         *defaultp = 0;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     }
     else if (!strcasecmp (s, "s32")) {
         *defaultp = 0;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     }
     else {
         dolog ("Bogus audio format `%s' using %s\n",
@@ -280,8 +283,8 @@ static audfmt_e audio_string_to_audfmt (const char *s, audfmt_e defval,
     }
 }
 
-static audfmt_e audio_get_conf_fmt (const char *envname,
-                                    audfmt_e defval,
+static AudioFormat audio_get_conf_fmt (const char *envname,
+                                    AudioFormat defval,
                                     int *defaultp)
 {
     const char *var = getenv (envname);
@@ -384,7 +387,7 @@ static void audio_print_options (const char *prefix,
 
         case AUD_OPT_FMT:
             {
-                audfmt_e *fmtp = opt->valp;
+                AudioFormat *fmtp = opt->valp;
                 printf (
                     "format, %s = %s, (one of: U8 S8 U16 S16 U32 S32)\n",
                     state,
@@ -471,7 +474,7 @@ static void audio_process_options (const char *prefix,
 
         case AUD_OPT_FMT:
             {
-                audfmt_e *fmtp = opt->valp;
+                AudioFormat *fmtp = opt->valp;
                 *fmtp = audio_get_conf_fmt (optname, *fmtp, &def);
             }
             break;
@@ -502,22 +505,22 @@ static void audio_print_settings (struct audsettings *as)
     dolog ("frequency=%d nchannels=%d fmt=", as->freq, as->nchannels);
 
     switch (as->fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         AUD_log (NULL, "S8");
         break;
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         AUD_log (NULL, "U8");
         break;
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         AUD_log (NULL, "S16");
         break;
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         AUD_log (NULL, "U16");
         break;
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         AUD_log (NULL, "S32");
         break;
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         AUD_log (NULL, "U32");
         break;
     default:
@@ -548,12 +551,12 @@ static int audio_validate_settings (struct audsettings *as)
     invalid |= as->endianness != 0 && as->endianness != 1;
 
     switch (as->fmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         break;
     default:
         invalid = 1;
@@ -569,25 +572,28 @@ static int audio_pcm_info_eq (struct audio_pcm_info *info, struct audsettings *a
     int bits = 8, sign = 0;
 
     switch (as->fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         sign = 1;
         /* fall through */
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         break;
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         sign = 1;
         /* fall through */
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         bits = 16;
         break;
 
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         sign = 1;
         /* fall through */
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         bits = 32;
         break;
+
+    default:
+        abort();
     }
     return info->freq == as->freq
         && info->nchannels == as->nchannels
@@ -601,24 +607,27 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as)
     int bits = 8, sign = 0, shift = 0;
 
     switch (as->fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         sign = 1;
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         break;
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         sign = 1;
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         bits = 16;
         shift = 1;
         break;
 
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         sign = 1;
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         bits = 32;
         shift = 2;
         break;
+
+    default:
+        abort();
     }
 
     info->freq = as->freq;
diff --git a/audio/audio.h b/audio/audio.h
index e7ea397..e300511 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -29,15 +29,6 @@
 
 typedef void (*audio_callback_fn) (void *opaque, int avail);
 
-typedef enum {
-    AUD_FMT_U8,
-    AUD_FMT_S8,
-    AUD_FMT_U16,
-    AUD_FMT_S16,
-    AUD_FMT_U32,
-    AUD_FMT_S32
-} audfmt_e;
-
 #ifdef HOST_WORDS_BIGENDIAN
 #define AUDIO_HOST_ENDIANNESS 1
 #else
@@ -47,7 +38,7 @@ typedef enum {
 struct audsettings {
     int freq;
     int nchannels;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int endianness;
 };
 
diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index e132405..a8cfa77 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -23,20 +23,20 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
     wfx->cbSize = 0;
 
     switch (as->fmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         wfx->wBitsPerSample = 8;
         break;
 
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         wfx->wBitsPerSample = 16;
         wfx->nAvgBytesPerSec <<= 1;
         wfx->nBlockAlign <<= 1;
         break;
 
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         wfx->wBitsPerSample = 32;
         wfx->nAvgBytesPerSec <<= 2;
         wfx->nBlockAlign <<= 2;
@@ -84,15 +84,15 @@ int waveformat_to_audio_settings (WAVEFORMATEX *wfx,
 
     switch (wfx->wBitsPerSample) {
     case 8:
-        as->fmt = AUD_FMT_U8;
+        as->fmt = AUDIO_FORMAT_U8;
         break;
 
     case 16:
-        as->fmt = AUD_FMT_S16;
+        as->fmt = AUDIO_FORMAT_S16;
         break;
 
     case 32:
-        as->fmt = AUD_FMT_S32;
+        as->fmt = AUDIO_FORMAT_S32;
         break;
 
     default:
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 7dbe333..3ea7d27 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -72,7 +72,7 @@ typedef struct OSSVoiceIn {
 
 struct oss_params {
     int freq;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int nchannels;
     int nfrags;
     int fragsize;
@@ -150,16 +150,16 @@ static int oss_write (SWVoiceOut *sw, void *buf, int len)
     return audio_pcm_sw_write (sw, buf, len);
 }
 
-static int aud_to_ossfmt (audfmt_e fmt, int endianness)
+static int aud_to_ossfmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return AFMT_S8;
 
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return AFMT_U8;
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         if (endianness) {
             return AFMT_S16_BE;
         }
@@ -167,7 +167,7 @@ static int aud_to_ossfmt (audfmt_e fmt, int endianness)
             return AFMT_S16_LE;
         }
 
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         if (endianness) {
             return AFMT_U16_BE;
         }
@@ -184,37 +184,37 @@ static int aud_to_ossfmt (audfmt_e fmt, int endianness)
     }
 }
 
-static int oss_to_audfmt (int ossfmt, audfmt_e *fmt, int *endianness)
+static int oss_to_audfmt (int ossfmt, AudioFormat *fmt, int *endianness)
 {
     switch (ossfmt) {
     case AFMT_S8:
         *endianness = 0;
-        *fmt = AUD_FMT_S8;
+        *fmt = AUDIO_FORMAT_S8;
         break;
 
     case AFMT_U8:
         *endianness = 0;
-        *fmt = AUD_FMT_U8;
+        *fmt = AUDIO_FORMAT_U8;
         break;
 
     case AFMT_S16_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case AFMT_U16_LE:
         *endianness = 0;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     case AFMT_S16_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case AFMT_U16_BE:
         *endianness = 1;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     default:
@@ -502,7 +502,7 @@ static int oss_init_out(HWVoiceOut *hw, struct audsettings *as,
     int endianness;
     int err;
     int fd;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
     OSSConf *conf = drv_opaque;
 
@@ -671,7 +671,7 @@ static int oss_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     int endianness;
     int err;
     int fd;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
     OSSConf *conf = drv_opaque;
 
diff --git a/audio/paaudio.c b/audio/paaudio.c
index fea6071..cfdbdc6 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -384,21 +384,21 @@ static int qpa_read (SWVoiceIn *sw, void *buf, int len)
     return audio_pcm_sw_read (sw, buf, len);
 }
 
-static pa_sample_format_t audfmt_to_pa (audfmt_e afmt, int endianness)
+static pa_sample_format_t audfmt_to_pa (AudioFormat afmt, int endianness)
 {
     int format;
 
     switch (afmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         format = PA_SAMPLE_U8;
         break;
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         format = endianness ? PA_SAMPLE_S16BE : PA_SAMPLE_S16LE;
         break;
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         format = endianness ? PA_SAMPLE_S32BE : PA_SAMPLE_S32LE;
         break;
     default:
@@ -409,26 +409,26 @@ static pa_sample_format_t audfmt_to_pa (audfmt_e afmt, int endianness)
     return format;
 }
 
-static audfmt_e pa_to_audfmt (pa_sample_format_t fmt, int *endianness)
+static AudioFormat pa_to_audfmt (pa_sample_format_t fmt, int *endianness)
 {
     switch (fmt) {
     case PA_SAMPLE_U8:
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     case PA_SAMPLE_S16BE:
         *endianness = 1;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     case PA_SAMPLE_S16LE:
         *endianness = 0;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     case PA_SAMPLE_S32BE:
         *endianness = 1;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     case PA_SAMPLE_S32LE:
         *endianness = 0;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     default:
         dolog ("Internal logic error: Bad pa_sample_format %d\n", fmt);
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     }
 }
 
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 1140f2e..db0f95a 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -115,19 +115,19 @@ static int sdl_unlock_and_post (SDLAudioState *s, const char *forfn)
     return sdl_post (s, forfn);
 }
 
-static int aud_to_sdlfmt (audfmt_e fmt)
+static int aud_to_sdlfmt (AudioFormat fmt)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return AUDIO_S8;
 
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return AUDIO_U8;
 
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         return AUDIO_S16LSB;
 
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         return AUDIO_U16LSB;
 
     default:
@@ -139,37 +139,37 @@ static int aud_to_sdlfmt (audfmt_e fmt)
     }
 }
 
-static int sdl_to_audfmt(int sdlfmt, audfmt_e *fmt, int *endianness)
+static int sdl_to_audfmt(int sdlfmt, AudioFormat *fmt, int *endianness)
 {
     switch (sdlfmt) {
     case AUDIO_S8:
         *endianness = 0;
-        *fmt = AUD_FMT_S8;
+        *fmt = AUDIO_FORMAT_S8;
         break;
 
     case AUDIO_U8:
         *endianness = 0;
-        *fmt = AUD_FMT_U8;
+        *fmt = AUDIO_FORMAT_U8;
         break;
 
     case AUDIO_S16LSB:
         *endianness = 0;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case AUDIO_U16LSB:
         *endianness = 0;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     case AUDIO_S16MSB:
         *endianness = 1;
-        *fmt = AUD_FMT_S16;
+        *fmt = AUDIO_FORMAT_S16;
         break;
 
     case AUDIO_U16MSB:
         *endianness = 1;
-        *fmt = AUD_FMT_U16;
+        *fmt = AUDIO_FORMAT_U16;
         break;
 
     default:
@@ -341,7 +341,7 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
     SDL_AudioSpec req, obt;
     int endianness;
     int err;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
 
     req.freq = as->freq;
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 42ae4a4..141fd8d 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -128,7 +128,7 @@ static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
     settings.freq       = SPICE_INTERFACE_PLAYBACK_FREQ;
 #endif
     settings.nchannels  = SPICE_INTERFACE_PLAYBACK_CHAN;
-    settings.fmt        = AUD_FMT_S16;
+    settings.fmt        = AUDIO_FORMAT_S16;
     settings.endianness = AUDIO_HOST_ENDIANNESS;
 
     audio_pcm_init_info (&hw->info, &settings);
@@ -256,7 +256,7 @@ static int line_in_init(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     settings.freq       = SPICE_INTERFACE_RECORD_FREQ;
 #endif
     settings.nchannels  = SPICE_INTERFACE_RECORD_CHAN;
-    settings.fmt        = AUD_FMT_S16;
+    settings.fmt        = AUDIO_FORMAT_S16;
     settings.endianness = AUDIO_HOST_ENDIANNESS;
 
     audio_pcm_init_info (&hw->info, &settings);
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index c586020..81250e6 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -116,20 +116,23 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     stereo = wav_as.nchannels == 2;
     switch (wav_as.fmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         bits16 = 0;
         break;
 
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         bits16 = 1;
         break;
 
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         dolog ("WAVE files can not handle 32bit formats\n");
         return -1;
+
+    default:
+        abort();
     }
 
     hdr[34] = bits16 ? 0x10 : 0x08;
@@ -224,7 +227,7 @@ static int wav_ctl_out (HWVoiceOut *hw, int cmd, ...)
 static WAVConf glob_conf = {
     .settings.freq      = 44100,
     .settings.nchannels = 2,
-    .settings.fmt       = AUD_FMT_S16,
+    .settings.fmt       = AUDIO_FORMAT_S16,
     .wav_path           = "qemu.wav"
 };
 
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index 86e9056..798acdd 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -136,7 +136,7 @@ int wav_start_capture (CaptureState *s, const char *path, int freq,
 
     as.freq = freq;
     as.nchannels = 1 << stereo;
-    as.fmt = bits16 ? AUD_FMT_S16 : AUD_FMT_U8;
+    as.fmt = bits16 ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_U8;
     as.endianness = 0;
 
     ops.notify = wav_notify;
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 98ee19f..f1abf95 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -269,7 +269,7 @@ static void omap_eac_format_update(struct omap_eac_s *s)
      * does I2S specify it?  */
     /* All register writes are 16 bits so we we store 16-bit samples
      * in the buffers regardless of AGCFR[B8_16] value.  */
-    fmt.fmt = AUD_FMT_U16;
+    fmt.fmt = AUDIO_FORMAT_U16;
 
     s->codec.in_voice = AUD_open_in(&s->codec.card, s->codec.in_voice,
                     "eac.codec.in", s, omap_eac_in_cb, &fmt);
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index b173835..fa75f33 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -360,7 +360,7 @@ static void open_voice (AC97LinkState *s, int index, int freq)
 
     as.freq = freq;
     as.nchannels = 2;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = 0;
 
     if (freq > 0) {
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 334935f..ca8de05 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -318,7 +318,7 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
 
     as.freq = s->freq;
     as.nchannels = SHIFT;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = AUDIO_HOST_ENDIANNESS;
 
     AUD_register_card ("adlib", &s->card);
diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index f96f561..626a173 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -284,7 +284,7 @@ static void cs_reset_voices (CSState *s, uint32_t val)
 
     switch ((val >> 5) & ((s->dregs[MODE_And_ID] & MODE2) ? 7 : 3)) {
     case 0:
-        as.fmt = AUD_FMT_U8;
+        as.fmt = AUDIO_FORMAT_U8;
         s->shift = as.nchannels == 2;
         break;
 
@@ -294,7 +294,7 @@ static void cs_reset_voices (CSState *s, uint32_t val)
     case 3:
         s->tab = ALawDecompressTable;
     x_law:
-        as.fmt = AUD_FMT_S16;
+        as.fmt = AUDIO_FORMAT_S16;
         as.endianness = AUDIO_HOST_ENDIANNESS;
         s->shift = as.nchannels == 2;
         break;
@@ -302,7 +302,7 @@ static void cs_reset_voices (CSState *s, uint32_t val)
     case 6:
         as.endianness = 1;
     case 2:
-        as.fmt = AUD_FMT_S16;
+        as.fmt = AUDIO_FORMAT_S16;
         s->shift = as.nchannels;
         break;
 
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 592578b..a1c21b8 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -409,14 +409,14 @@ static void es1370_update_voices (ES1370State *s, uint32_t ctl, uint32_t sctl)
                     i,
                     new_freq,
                     1 << (new_fmt & 1),
-                    (new_fmt & 2) ? AUD_FMT_S16 : AUD_FMT_U8,
+                    (new_fmt & 2) ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_U8,
                     d->shift);
             if (new_freq) {
                 struct audsettings as;
 
                 as.freq = new_freq;
                 as.nchannels = 1 << (new_fmt & 1);
-                as.fmt = (new_fmt & 2) ? AUD_FMT_S16 : AUD_FMT_U8;
+                as.fmt = (new_fmt & 2) ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_U8;
                 as.endianness = 0;
 
                 if (i == ADC_CHANNEL) {
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index e0c8a4e..0e1d15f 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -237,7 +237,7 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
 
     as.freq = s->freq;
     as.nchannels = 2;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = GUS_ENDIANNESS;
 
     s->voice = AUD_open_out (
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 3c03ff5..8693b7a 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -97,9 +97,9 @@ static void hda_codec_parse_fmt(uint32_t format, struct audsettings *as)
     }
 
     switch (format & AC_FMT_BITS_MASK) {
-    case AC_FMT_BITS_8:  as->fmt = AUD_FMT_S8;  break;
-    case AC_FMT_BITS_16: as->fmt = AUD_FMT_S16; break;
-    case AC_FMT_BITS_32: as->fmt = AUD_FMT_S32; break;
+    case AC_FMT_BITS_8:  as->fmt = AUDIO_FORMAT_S8;  break;
+    case AC_FMT_BITS_16: as->fmt = AUDIO_FORMAT_S16; break;
+    case AC_FMT_BITS_32: as->fmt = AUDIO_FORMAT_S32; break;
     }
 
     as->nchannels = ((format & AC_FMT_CHAN_MASK) >> AC_FMT_CHAN_SHIFT) + 1;
@@ -128,12 +128,12 @@ static void hda_codec_parse_fmt(uint32_t format, struct audsettings *as)
 /* -------------------------------------------------------------------------- */
 
 static const char *fmt2name[] = {
-    [ AUD_FMT_U8  ] = "PCM-U8",
-    [ AUD_FMT_S8  ] = "PCM-S8",
-    [ AUD_FMT_U16 ] = "PCM-U16",
-    [ AUD_FMT_S16 ] = "PCM-S16",
-    [ AUD_FMT_U32 ] = "PCM-U32",
-    [ AUD_FMT_S32 ] = "PCM-S32",
+    [ AUDIO_FORMAT_U8  ] = "PCM-U8",
+    [ AUDIO_FORMAT_S8  ] = "PCM-S8",
+    [ AUDIO_FORMAT_U16 ] = "PCM-U16",
+    [ AUDIO_FORMAT_S16 ] = "PCM-S16",
+    [ AUDIO_FORMAT_U32 ] = "PCM-U32",
+    [ AUDIO_FORMAT_S32 ] = "PCM-S32",
 };
 
 typedef struct HDAAudioState HDAAudioState;
diff --git a/hw/audio/lm4549.c b/hw/audio/lm4549.c
index 380ef60..9d4f4b5 100644
--- a/hw/audio/lm4549.c
+++ b/hw/audio/lm4549.c
@@ -185,7 +185,7 @@ void lm4549_write(lm4549_state *s,
         struct audsettings as;
         as.freq = value;
         as.nchannels = 2;
-        as.fmt = AUD_FMT_S16;
+        as.fmt = AUDIO_FORMAT_S16;
         as.endianness = 0;
 
         s->voice = AUD_open_out(
@@ -255,7 +255,7 @@ static int lm4549_post_load(void *opaque, int version_id)
     struct audsettings as;
     as.freq = freq;
     as.nchannels = 2;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = 0;
 
     s->voice = AUD_open_out(
@@ -292,7 +292,7 @@ void lm4549_init(lm4549_state *s, lm4549_callback data_req_cb, void* opaque)
     /* Open a default voice */
     as.freq = 48000;
     as.nchannels = 2;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = 0;
 
     s->voice = AUD_open_out(
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 28f55e8..15169e2 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -297,7 +297,7 @@ static int milkymist_ac97_init(SysBusDevice *dev)
 
     as.freq = 48000;
     as.nchannels = 2;
-    as.fmt = AUD_FMT_S16;
+    as.fmt = AUDIO_FORMAT_S16;
     as.endianness = 1;
 
     s->voice_in = AUD_open_in(&s->card, s->voice_in,
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 5266fb5..302debf 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -112,7 +112,7 @@ static void pcspk_callback(void *opaque, int free)
 static int pcspk_audio_init(ISABus *bus)
 {
     PCSpkState *s = pcspk_state;
-    struct audsettings as = {PCSPK_SAMPLE_RATE, 1, AUD_FMT_U8, 0};
+    struct audsettings as = {PCSPK_SAMPLE_RATE, 1, AUDIO_FORMAT_U8, 0};
 
     AUD_register_card(s_spk, &s->card);
 
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 995435f..163ced0 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -61,7 +61,7 @@ typedef struct SB16State {
     int fmt_stereo;
     int fmt_signed;
     int fmt_bits;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int dma_auto;
     int block_size;
     int fifo;
@@ -216,7 +216,7 @@ static void continue_dma8 (SB16State *s)
 
 static void dma_cmd8 (SB16State *s, int mask, int dma_len)
 {
-    s->fmt = AUD_FMT_U8;
+    s->fmt = AUDIO_FORMAT_U8;
     s->use_hdma = 0;
     s->fmt_bits = 8;
     s->fmt_signed = 0;
@@ -311,18 +311,18 @@ static void dma_cmd (SB16State *s, uint8_t cmd, uint8_t d0, int dma_len)
 
     if (16 == s->fmt_bits) {
         if (s->fmt_signed) {
-            s->fmt = AUD_FMT_S16;
+            s->fmt = AUDIO_FORMAT_S16;
         }
         else {
-            s->fmt = AUD_FMT_U16;
+            s->fmt = AUDIO_FORMAT_U16;
         }
     }
     else {
         if (s->fmt_signed) {
-            s->fmt = AUD_FMT_S8;
+            s->fmt = AUDIO_FORMAT_S8;
         }
         else {
-            s->fmt = AUD_FMT_U8;
+            s->fmt = AUDIO_FORMAT_U8;
         }
     }
 
@@ -834,7 +834,7 @@ static void legacy_reset (SB16State *s)
 
     as.freq = s->freq;
     as.nchannels = 1;
-    as.fmt = AUD_FMT_U8;
+    as.fmt = AUDIO_FORMAT_U8;
     as.endianness = 0;
 
     s->voice = AUD_open_out (
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index b50b331..4c4333c 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -201,7 +201,7 @@ static void wm8750_set_format(WM8750State *s)
     in_fmt.endianness = 0;
     in_fmt.nchannels = 2;
     in_fmt.freq = s->adc_hz;
-    in_fmt.fmt = AUD_FMT_S16;
+    in_fmt.fmt = AUDIO_FORMAT_S16;
 
     s->adc_voice[0] = AUD_open_in(&s->card, s->adc_voice[0],
                     CODEC ".input1", s, wm8750_audio_in_cb, &in_fmt);
@@ -214,7 +214,7 @@ static void wm8750_set_format(WM8750State *s)
     out_fmt.endianness = 0;
     out_fmt.nchannels = 2;
     out_fmt.freq = s->dac_hz;
-    out_fmt.fmt = AUD_FMT_S16;
+    out_fmt.fmt = AUDIO_FORMAT_S16;
 
     s->dac_voice[0] = AUD_open_out(&s->card, s->dac_voice[0],
                     CODEC ".speaker", s, wm8750_audio_out_cb, &out_fmt);
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 1073bbf..961906f 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -315,7 +315,7 @@ static void tsc2102_audio_output_update(TSC210xState *s)
     fmt.endianness = 0;
     fmt.nchannels = 2;
     fmt.freq = s->codec.tx_rate;
-    fmt.fmt = AUD_FMT_S16;
+    fmt.fmt = AUDIO_FORMAT_S16;
 
     s->dac_voice[0] = AUD_open_out(&s->card, s->dac_voice[0],
                     "tsc2102.sink", s, (void *) tsc210x_audio_out_cb, &fmt);
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 02fb110..9a60569 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -646,7 +646,7 @@ static void usb_audio_realize(USBDevice *dev, Error **errp)
     s->out.vol[1]        = 240; /* 0 dB */
     s->out.as.freq       = USBAUDIO_SAMPLE_RATE;
     s->out.as.nchannels  = 2;
-    s->out.as.fmt        = AUD_FMT_S16;
+    s->out.as.fmt        = AUDIO_FORMAT_S16;
     s->out.as.endianness = 0;
     streambuf_init(&s->out.buf, s->buffer);
 
diff --git a/ui/vnc.c b/ui/vnc.c
index 09756cd..2dd269b 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2285,12 +2285,12 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
                 if (len == 4)
                     return 10;
                 switch (read_u8(data, 4)) {
-                case 0: vs->as.fmt = AUD_FMT_U8; break;
-                case 1: vs->as.fmt = AUD_FMT_S8; break;
-                case 2: vs->as.fmt = AUD_FMT_U16; break;
-                case 3: vs->as.fmt = AUD_FMT_S16; break;
-                case 4: vs->as.fmt = AUD_FMT_U32; break;
-                case 5: vs->as.fmt = AUD_FMT_S32; break;
+                case 0: vs->as.fmt = AUDIO_FORMAT_U8; break;
+                case 1: vs->as.fmt = AUDIO_FORMAT_S8; break;
+                case 2: vs->as.fmt = AUDIO_FORMAT_U16; break;
+                case 3: vs->as.fmt = AUDIO_FORMAT_S16; break;
+                case 4: vs->as.fmt = AUDIO_FORMAT_U32; break;
+                case 5: vs->as.fmt = AUDIO_FORMAT_S32; break;
                 default:
                     VNC_DEBUG("Invalid audio format %d\n", read_u8(data, 4));
                     vnc_client_error(vs);
@@ -3015,7 +3015,7 @@ void vnc_init_state(VncState *vs)
 
     vs->as.freq = 44100;
     vs->as.nchannels = 2;
-    vs->as.fmt = AUD_FMT_S16;
+    vs->as.fmt = AUDIO_FORMAT_S16;
     vs->as.endianness = 0;
 
     qemu_mutex_init(&vs->output_mutex);
-- 
2.7.0

