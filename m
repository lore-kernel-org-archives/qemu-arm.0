Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172609wrs;
        Tue, 12 Mar 2019 00:36:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzA2QlY+5Ba6S61ppsKvpS+8eIp14pBklFUMDj71l7snUQtoVPSW2QgfyT64R743RMz2XQN
X-Received: by 2002:a81:ee03:: with SMTP id l3mr639811ywm.237.1552376163354;
        Tue, 12 Mar 2019 00:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376163; cv=none;
        d=google.com; s=arc-20160816;
        b=GifE5IysJvlIStRHwS301WdEANEwkesUnBN6PYqaGGv0SGqy0nCdGJyDPwv4csIIva
         Qt3N6fHrnZxnxL5+1c5LHZwvDDYgPKLckyekIR3fkIMk76MgUyrcJJJWUe8WCqLc2Jrm
         s9hgPBNacNYSgNLAn2hdSOzpjFi9GUyWyzJy3+Bis1aWOVxE5dNKpQTFxcsURouH8ddH
         TiA2icXaQvHUVEh6Ekc4R7EnfkdAd4UazfAdTf9TYkslcrJcCQMkLur4/d4Nb3jYr37i
         l8RMZ5dj3Yur+ex5Onvo8RMOjM0Ou0Ts/5k4CQxlBjg5ZIZ3/Wu4toKl7i0QNU0UA5Kq
         6CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HppoRttH4C6tGulYxFQRU/fk2dYtCwW1Q1R//IflRWE=;
        b=GNgaashAtv2YG/ViksQi6+SZe3HMwNBfyC07Eh5MFV4VGnrJCBS26hWZzbY6ennwJ3
         YygpRP+tiEUfj68lKK7dp+WIFKOsWQiSnvRzsETN19JkJMdeD18GjC6PRw4GAK6zcLiK
         Nwddx8weaX3RVunfYTL7WpX5fEaZU73Xivgm6+ViI4DebTMm9JjBIwoARfrXIvRBAHSB
         B/Lbhv0RIoU1XhRsG5ZCzKJfluTV4RuJFCmiI3EOgVS7JApOqvdr9h0H4+211G56a65o
         hwv9BT6iWbE77Bb1qSFRmWzCThw3iecmeJ405d50kFkEt1nQ6fgcbFBdfZ+EzHugOFRA
         7KGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z137si4317841ywa.462.2019.03.12.00.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bxC-0005u7-Fq
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:36:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btU-0002fy-78
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bgK-0000sV-DF
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bgJ-0000s4-Vg; Tue, 12 Mar 2019 03:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DAE73092657;
	Tue, 12 Mar 2019 07:13:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1B660C9B;
	Tue, 12 Mar 2019 07:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6236917535; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:38 +0100
Message-Id: <20190312071250.12168-3-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 12 Mar 2019 07:13:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 02/14] audio: use qapi AudioFormat instead of
 audfmt_e
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Kővágó@redhat.com, libvir-list@redhat.com, Andrzej Zaborowski <balrogg@gmail.com>, Alistair Francis <alistair@alistair23.me>, Markus Armbruster <armbru@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDaexWuXbKZ3

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

I had to include an enum for audio sampling formats into qapi, but that
meant duplicating the audfmt_e enum.  This patch replaces audfmt_e and
associated values with the qapi generated AudioFormat enum.

This patch is mostly a search-and-replace, except for switches where the
qapi generated AUDIO_FORMAT_MAX caused problems.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 01251b2758a1679c66842120b77c0fb46d7d0eaf.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.h             | 12 +----
 audio/alsaaudio.c         | 53 +++++++++++----------
 audio/audio.c             | 97 +++++++++++++++++++++------------------
 audio/audio_win_int.c     | 18 ++++----
 audio/ossaudio.c          | 30 ++++++------
 audio/paaudio.c           | 28 +++++------
 audio/sdlaudio.c          | 26 +++++------
 audio/spiceaudio.c        |  4 +-
 audio/wavaudio.c          | 17 ++++---
 audio/wavcapture.c        |  2 +-
 hw/arm/omap2.c            |  2 +-
 hw/audio/ac97.c           |  2 +-
 hw/audio/adlib.c          |  2 +-
 hw/audio/cs4231a.c        |  6 +--
 hw/audio/es1370.c         |  4 +-
 hw/audio/gus.c            |  2 +-
 hw/audio/hda-codec.c      | 18 ++++----
 hw/audio/lm4549.c         |  6 +--
 hw/audio/milkymist-ac97.c |  2 +-
 hw/audio/pcspk.c          |  2 +-
 hw/audio/sb16.c           | 14 +++---
 hw/audio/wm8750.c         |  6 +--
 hw/display/xlnx_dp.c      |  2 +-
 hw/input/tsc210x.c        |  2 +-
 hw/usb/dev-audio.c        |  2 +-
 ui/vnc.c                  | 26 +++++------
 26 files changed, 196 insertions(+), 189 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index f4339a185e4e..02f29a3b3ef7 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -26,18 +26,10 @@
 #define QEMU_AUDIO_H
=20
 #include "qemu/queue.h"
+#include "qapi/qapi-types-audio.h"
=20
 typedef void (*audio_callback_fn) (void *opaque, int avail);
=20
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
@@ -47,7 +39,7 @@ typedef enum {
 struct audsettings {
     int freq;
     int nchannels;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int endianness;
 };
=20
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 635be73bf495..5bd034267fce 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -87,7 +87,7 @@ struct alsa_params_req {
=20
 struct alsa_params_obt {
     int freq;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int endianness;
     int nchannels;
     snd_pcm_uframes_t samples;
@@ -294,16 +294,16 @@ static int alsa_write (SWVoiceOut *sw, void *buf, i=
nt len)
     return audio_pcm_sw_write (sw, buf, len);
 }
=20
-static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt, int endianness)
+static snd_pcm_format_t aud_to_alsafmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return SND_PCM_FORMAT_S8;
=20
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return SND_PCM_FORMAT_U8;
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         if (endianness) {
             return SND_PCM_FORMAT_S16_BE;
         }
@@ -311,7 +311,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt,=
 int endianness)
             return SND_PCM_FORMAT_S16_LE;
         }
=20
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         if (endianness) {
             return SND_PCM_FORMAT_U16_BE;
         }
@@ -319,7 +319,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt,=
 int endianness)
             return SND_PCM_FORMAT_U16_LE;
         }
=20
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         if (endianness) {
             return SND_PCM_FORMAT_S32_BE;
         }
@@ -327,7 +327,7 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fmt,=
 int endianness)
             return SND_PCM_FORMAT_S32_LE;
         }
=20
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         if (endianness) {
             return SND_PCM_FORMAT_U32_BE;
         }
@@ -344,58 +344,58 @@ static snd_pcm_format_t aud_to_alsafmt (audfmt_e fm=
t, int endianness)
     }
 }
=20
-static int alsa_to_audfmt (snd_pcm_format_t alsafmt, audfmt_e *fmt,
+static int alsa_to_audfmt (snd_pcm_format_t alsafmt, AudioFormat *fmt,
                            int *endianness)
 {
     switch (alsafmt) {
     case SND_PCM_FORMAT_S8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S8;
+        *fmt =3D AUDIO_FORMAT_S8;
         break;
=20
     case SND_PCM_FORMAT_U8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U8;
+        *fmt =3D AUDIO_FORMAT_U8;
         break;
=20
     case SND_PCM_FORMAT_S16_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case SND_PCM_FORMAT_U16_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     case SND_PCM_FORMAT_S16_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case SND_PCM_FORMAT_U16_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     case SND_PCM_FORMAT_S32_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S32;
+        *fmt =3D AUDIO_FORMAT_S32;
         break;
=20
     case SND_PCM_FORMAT_U32_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U32;
+        *fmt =3D AUDIO_FORMAT_U32;
         break;
=20
     case SND_PCM_FORMAT_S32_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_S32;
+        *fmt =3D AUDIO_FORMAT_S32;
         break;
=20
     case SND_PCM_FORMAT_U32_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_U32;
+        *fmt =3D AUDIO_FORMAT_U32;
         break;
=20
     default:
@@ -638,19 +638,22 @@ static int alsa_open (int in, struct alsa_params_re=
q *req,
         bytes_per_sec =3D freq << (nchannels =3D=3D 2);
=20
         switch (obt->fmt) {
-        case AUD_FMT_S8:
-        case AUD_FMT_U8:
+        case AUDIO_FORMAT_S8:
+        case AUDIO_FORMAT_U8:
             break;
=20
-        case AUD_FMT_S16:
-        case AUD_FMT_U16:
+        case AUDIO_FORMAT_S16:
+        case AUDIO_FORMAT_U16:
             bytes_per_sec <<=3D 1;
             break;
=20
-        case AUD_FMT_S32:
-        case AUD_FMT_U32:
+        case AUDIO_FORMAT_S32:
+        case AUDIO_FORMAT_U32:
             bytes_per_sec <<=3D 2;
             break;
+
+        default:
+            abort();
         }
=20
         threshold =3D (conf->threshold * bytes_per_sec) / 1000;
diff --git a/audio/audio.c b/audio/audio.c
index 909c817103c8..77216e50102e 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -113,7 +113,7 @@ static struct {
         .settings =3D {
             .freq =3D 44100,
             .nchannels =3D 2,
-            .fmt =3D AUD_FMT_S16,
+            .fmt =3D AUDIO_FORMAT_S16,
             .endianness =3D  AUDIO_HOST_ENDIANNESS,
         }
     },
@@ -125,7 +125,7 @@ static struct {
         .settings =3D {
             .freq =3D 44100,
             .nchannels =3D 2,
-            .fmt =3D AUD_FMT_S16,
+            .fmt =3D AUDIO_FORMAT_S16,
             .endianness =3D AUDIO_HOST_ENDIANNESS,
         }
     },
@@ -257,58 +257,61 @@ static char *audio_alloc_prefix (const char *s)
     return r;
 }
=20
-static const char *audio_audfmt_to_string (audfmt_e fmt)
+static const char *audio_audfmt_to_string (AudioFormat fmt)
 {
     switch (fmt) {
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return "U8";
=20
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         return "U16";
=20
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return "S8";
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         return "S16";
=20
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         return "U32";
=20
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         return "S32";
+
+    default:
+        abort();
     }
=20
     dolog ("Bogus audfmt %d returning S16\n", fmt);
     return "S16";
 }
=20
-static audfmt_e audio_string_to_audfmt (const char *s, audfmt_e defval,
+static AudioFormat audio_string_to_audfmt (const char *s, AudioFormat de=
fval,
                                         int *defaultp)
 {
     if (!strcasecmp (s, "u8")) {
         *defaultp =3D 0;
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     }
     else if (!strcasecmp (s, "u16")) {
         *defaultp =3D 0;
-        return AUD_FMT_U16;
+        return AUDIO_FORMAT_U16;
     }
     else if (!strcasecmp (s, "u32")) {
         *defaultp =3D 0;
-        return AUD_FMT_U32;
+        return AUDIO_FORMAT_U32;
     }
     else if (!strcasecmp (s, "s8")) {
         *defaultp =3D 0;
-        return AUD_FMT_S8;
+        return AUDIO_FORMAT_S8;
     }
     else if (!strcasecmp (s, "s16")) {
         *defaultp =3D 0;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     }
     else if (!strcasecmp (s, "s32")) {
         *defaultp =3D 0;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     }
     else {
         dolog ("Bogus audio format `%s' using %s\n",
@@ -318,8 +321,8 @@ static audfmt_e audio_string_to_audfmt (const char *s=
, audfmt_e defval,
     }
 }
=20
-static audfmt_e audio_get_conf_fmt (const char *envname,
-                                    audfmt_e defval,
+static AudioFormat audio_get_conf_fmt (const char *envname,
+                                    AudioFormat defval,
                                     int *defaultp)
 {
     const char *var =3D getenv (envname);
@@ -421,7 +424,7 @@ static void audio_print_options (const char *prefix,
=20
         case AUD_OPT_FMT:
             {
-                audfmt_e *fmtp =3D opt->valp;
+                AudioFormat *fmtp =3D opt->valp;
                 printf (
                     "format, %s =3D %s, (one of: U8 S8 U16 S16 U32 S32)\=
n",
                     state,
@@ -492,7 +495,7 @@ static void audio_process_options (const char *prefix=
,
=20
         case AUD_OPT_FMT:
             {
-                audfmt_e *fmtp =3D opt->valp;
+                AudioFormat *fmtp =3D opt->valp;
                 *fmtp =3D audio_get_conf_fmt (optname, *fmtp, &def);
             }
             break;
@@ -524,22 +527,22 @@ static void audio_print_settings (struct audsetting=
s *as)
     dolog ("frequency=3D%d nchannels=3D%d fmt=3D", as->freq, as->nchanne=
ls);
=20
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
@@ -570,12 +573,12 @@ static int audio_validate_settings (struct audsetti=
ngs *as)
     invalid |=3D as->endianness !=3D 0 && as->endianness !=3D 1;
=20
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
         invalid =3D 1;
@@ -591,25 +594,28 @@ static int audio_pcm_info_eq (struct audio_pcm_info=
 *info, struct audsettings *a
     int bits =3D 8, sign =3D 0;
=20
     switch (as->fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         sign =3D 1;
         /* fall through */
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         break;
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         sign =3D 1;
         /* fall through */
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         bits =3D 16;
         break;
=20
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         sign =3D 1;
         /* fall through */
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         bits =3D 32;
         break;
+
+    default:
+        abort();
     }
     return info->freq =3D=3D as->freq
         && info->nchannels =3D=3D as->nchannels
@@ -623,24 +629,27 @@ void audio_pcm_init_info (struct audio_pcm_info *in=
fo, struct audsettings *as)
     int bits =3D 8, sign =3D 0, shift =3D 0;
=20
     switch (as->fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         sign =3D 1;
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         break;
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         sign =3D 1;
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         bits =3D 16;
         shift =3D 1;
         break;
=20
-    case AUD_FMT_S32:
+    case AUDIO_FORMAT_S32:
         sign =3D 1;
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_U32:
         bits =3D 32;
         shift =3D 2;
         break;
+
+    default:
+        abort();
     }
=20
     info->freq =3D as->freq;
diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index 6900008d0c47..b938fd667bae 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -24,20 +24,20 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx=
,
     wfx->cbSize =3D 0;
=20
     switch (as->fmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         wfx->wBitsPerSample =3D 8;
         break;
=20
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         wfx->wBitsPerSample =3D 16;
         wfx->nAvgBytesPerSec <<=3D 1;
         wfx->nBlockAlign <<=3D 1;
         break;
=20
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         wfx->wBitsPerSample =3D 32;
         wfx->nAvgBytesPerSec <<=3D 2;
         wfx->nBlockAlign <<=3D 2;
@@ -85,15 +85,15 @@ int waveformat_to_audio_settings (WAVEFORMATEX *wfx,
=20
     switch (wfx->wBitsPerSample) {
     case 8:
-        as->fmt =3D AUD_FMT_U8;
+        as->fmt =3D AUDIO_FORMAT_U8;
         break;
=20
     case 16:
-        as->fmt =3D AUD_FMT_S16;
+        as->fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case 32:
-        as->fmt =3D AUD_FMT_S32;
+        as->fmt =3D AUDIO_FORMAT_S32;
         break;
=20
     default:
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 6c69622b4c7e..355e8fbda519 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -70,7 +70,7 @@ typedef struct OSSVoiceIn {
=20
 struct oss_params {
     int freq;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int nchannels;
     int nfrags;
     int fragsize;
@@ -148,16 +148,16 @@ static int oss_write (SWVoiceOut *sw, void *buf, in=
t len)
     return audio_pcm_sw_write (sw, buf, len);
 }
=20
-static int aud_to_ossfmt (audfmt_e fmt, int endianness)
+static int aud_to_ossfmt (AudioFormat fmt, int endianness)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return AFMT_S8;
=20
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return AFMT_U8;
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         if (endianness) {
             return AFMT_S16_BE;
         }
@@ -165,7 +165,7 @@ static int aud_to_ossfmt (audfmt_e fmt, int endiannes=
s)
             return AFMT_S16_LE;
         }
=20
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         if (endianness) {
             return AFMT_U16_BE;
         }
@@ -182,37 +182,37 @@ static int aud_to_ossfmt (audfmt_e fmt, int endiann=
ess)
     }
 }
=20
-static int oss_to_audfmt (int ossfmt, audfmt_e *fmt, int *endianness)
+static int oss_to_audfmt (int ossfmt, AudioFormat *fmt, int *endianness)
 {
     switch (ossfmt) {
     case AFMT_S8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S8;
+        *fmt =3D AUDIO_FORMAT_S8;
         break;
=20
     case AFMT_U8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U8;
+        *fmt =3D AUDIO_FORMAT_U8;
         break;
=20
     case AFMT_S16_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case AFMT_U16_LE:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     case AFMT_S16_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case AFMT_U16_BE:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     default:
@@ -500,7 +500,7 @@ static int oss_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     int endianness;
     int err;
     int fd;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
     OSSConf *conf =3D drv_opaque;
=20
@@ -667,7 +667,7 @@ static int oss_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
     int endianness;
     int err;
     int fd;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
     OSSConf *conf =3D drv_opaque;
=20
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 6153b908dae1..8246f260a8ac 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -385,21 +385,21 @@ static int qpa_read (SWVoiceIn *sw, void *buf, int =
len)
     return audio_pcm_sw_read (sw, buf, len);
 }
=20
-static pa_sample_format_t audfmt_to_pa (audfmt_e afmt, int endianness)
+static pa_sample_format_t audfmt_to_pa (AudioFormat afmt, int endianness=
)
 {
     int format;
=20
     switch (afmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         format =3D PA_SAMPLE_U8;
         break;
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         format =3D endianness ? PA_SAMPLE_S16BE : PA_SAMPLE_S16LE;
         break;
-    case AUD_FMT_S32:
-    case AUD_FMT_U32:
+    case AUDIO_FORMAT_S32:
+    case AUDIO_FORMAT_U32:
         format =3D endianness ? PA_SAMPLE_S32BE : PA_SAMPLE_S32LE;
         break;
     default:
@@ -410,26 +410,26 @@ static pa_sample_format_t audfmt_to_pa (audfmt_e af=
mt, int endianness)
     return format;
 }
=20
-static audfmt_e pa_to_audfmt (pa_sample_format_t fmt, int *endianness)
+static AudioFormat pa_to_audfmt (pa_sample_format_t fmt, int *endianness=
)
 {
     switch (fmt) {
     case PA_SAMPLE_U8:
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     case PA_SAMPLE_S16BE:
         *endianness =3D 1;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     case PA_SAMPLE_S16LE:
         *endianness =3D 0;
-        return AUD_FMT_S16;
+        return AUDIO_FORMAT_S16;
     case PA_SAMPLE_S32BE:
         *endianness =3D 1;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     case PA_SAMPLE_S32LE:
         *endianness =3D 0;
-        return AUD_FMT_S32;
+        return AUDIO_FORMAT_S32;
     default:
         dolog ("Internal logic error: Bad pa_sample_format %d\n", fmt);
-        return AUD_FMT_U8;
+        return AUDIO_FORMAT_U8;
     }
 }
=20
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index f7ee70b15347..4cd4cbaf0043 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -68,19 +68,19 @@ static void GCC_FMT_ATTR (1, 2) sdl_logerr (const cha=
r *fmt, ...)
     AUD_log (AUDIO_CAP, "Reason: %s\n", SDL_GetError ());
 }
=20
-static int aud_to_sdlfmt (audfmt_e fmt)
+static int aud_to_sdlfmt (AudioFormat fmt)
 {
     switch (fmt) {
-    case AUD_FMT_S8:
+    case AUDIO_FORMAT_S8:
         return AUDIO_S8;
=20
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_U8:
         return AUDIO_U8;
=20
-    case AUD_FMT_S16:
+    case AUDIO_FORMAT_S16:
         return AUDIO_S16LSB;
=20
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_U16:
         return AUDIO_U16LSB;
=20
     default:
@@ -92,37 +92,37 @@ static int aud_to_sdlfmt (audfmt_e fmt)
     }
 }
=20
-static int sdl_to_audfmt(int sdlfmt, audfmt_e *fmt, int *endianness)
+static int sdl_to_audfmt(int sdlfmt, AudioFormat *fmt, int *endianness)
 {
     switch (sdlfmt) {
     case AUDIO_S8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S8;
+        *fmt =3D AUDIO_FORMAT_S8;
         break;
=20
     case AUDIO_U8:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U8;
+        *fmt =3D AUDIO_FORMAT_U8;
         break;
=20
     case AUDIO_S16LSB:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case AUDIO_U16LSB:
         *endianness =3D 0;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     case AUDIO_S16MSB:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_S16;
+        *fmt =3D AUDIO_FORMAT_S16;
         break;
=20
     case AUDIO_U16MSB:
         *endianness =3D 1;
-        *fmt =3D AUD_FMT_U16;
+        *fmt =3D AUDIO_FORMAT_U16;
         break;
=20
     default:
@@ -265,7 +265,7 @@ static int sdl_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     SDL_AudioSpec req, obt;
     int endianness;
     int err;
-    audfmt_e effective_fmt;
+    AudioFormat effective_fmt;
     struct audsettings obt_as;
=20
     req.freq =3D as->freq;
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 6ad0eafbc67f..3aeb0cb35722 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -130,7 +130,7 @@ static int line_out_init(HWVoiceOut *hw, struct audse=
ttings *as,
     settings.freq       =3D SPICE_INTERFACE_PLAYBACK_FREQ;
 #endif
     settings.nchannels  =3D SPICE_INTERFACE_PLAYBACK_CHAN;
-    settings.fmt        =3D AUD_FMT_S16;
+    settings.fmt        =3D AUDIO_FORMAT_S16;
     settings.endianness =3D AUDIO_HOST_ENDIANNESS;
=20
     audio_pcm_init_info (&hw->info, &settings);
@@ -258,7 +258,7 @@ static int line_in_init(HWVoiceIn *hw, struct audsett=
ings *as, void *drv_opaque)
     settings.freq       =3D SPICE_INTERFACE_RECORD_FREQ;
 #endif
     settings.nchannels  =3D SPICE_INTERFACE_RECORD_CHAN;
-    settings.fmt        =3D AUD_FMT_S16;
+    settings.fmt        =3D AUDIO_FORMAT_S16;
     settings.endianness =3D AUDIO_HOST_ENDIANNESS;
=20
     audio_pcm_init_info (&hw->info, &settings);
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 40adfa30c33a..35a614785ece 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -117,20 +117,23 @@ static int wav_init_out(HWVoiceOut *hw, struct auds=
ettings *as,
=20
     stereo =3D wav_as.nchannels =3D=3D 2;
     switch (wav_as.fmt) {
-    case AUD_FMT_S8:
-    case AUD_FMT_U8:
+    case AUDIO_FORMAT_S8:
+    case AUDIO_FORMAT_U8:
         bits16 =3D 0;
         break;
=20
-    case AUD_FMT_S16:
-    case AUD_FMT_U16:
+    case AUDIO_FORMAT_S16:
+    case AUDIO_FORMAT_U16:
         bits16 =3D 1;
         break;
=20
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
=20
     hdr[34] =3D bits16 ? 0x10 : 0x08;
@@ -225,7 +228,7 @@ static int wav_ctl_out (HWVoiceOut *hw, int cmd, ...)
 static WAVConf glob_conf =3D {
     .settings.freq      =3D 44100,
     .settings.nchannels =3D 2,
-    .settings.fmt       =3D AUD_FMT_S16,
+    .settings.fmt       =3D AUDIO_FORMAT_S16,
     .wav_path           =3D "qemu.wav"
 };
=20
diff --git a/audio/wavcapture.c b/audio/wavcapture.c
index cd24570aa70c..74320dfecc76 100644
--- a/audio/wavcapture.c
+++ b/audio/wavcapture.c
@@ -136,7 +136,7 @@ int wav_start_capture (CaptureState *s, const char *p=
ath, int freq,
=20
     as.freq =3D freq;
     as.nchannels =3D 1 << stereo;
-    as.fmt =3D bits16 ? AUD_FMT_S16 : AUD_FMT_U8;
+    as.fmt =3D bits16 ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_U8;
     as.endianness =3D 0;
=20
     ops.notify =3D wav_notify;
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 94dffb2f577c..446223906e47 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -273,7 +273,7 @@ static void omap_eac_format_update(struct omap_eac_s =
*s)
      * does I2S specify it?  */
     /* All register writes are 16 bits so we we store 16-bit samples
      * in the buffers regardless of AGCFR[B8_16] value.  */
-    fmt.fmt =3D AUD_FMT_U16;
+    fmt.fmt =3D AUDIO_FORMAT_U16;
=20
     s->codec.in_voice =3D AUD_open_in(&s->codec.card, s->codec.in_voice,
                     "eac.codec.in", s, omap_eac_in_cb, &fmt);
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index d799533aa991..2265622d44a2 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -365,7 +365,7 @@ static void open_voice (AC97LinkState *s, int index, =
int freq)
=20
     as.freq =3D freq;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D 0;
=20
     if (freq > 0) {
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 97b876c7e08c..0957780a3dc0 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -269,7 +269,7 @@ static void adlib_realizefn (DeviceState *dev, Error =
**errp)
=20
     as.freq =3D s->freq;
     as.nchannels =3D SHIFT;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D AUDIO_HOST_ENDIANNESS;
=20
     AUD_register_card ("adlib", &s->card);
diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 9089dcb47e84..62da75eefebb 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -288,7 +288,7 @@ static void cs_reset_voices (CSState *s, uint32_t val=
)
=20
     switch ((val >> 5) & ((s->dregs[MODE_And_ID] & MODE2) ? 7 : 3)) {
     case 0:
-        as.fmt =3D AUD_FMT_U8;
+        as.fmt =3D AUDIO_FORMAT_U8;
         s->shift =3D as.nchannels =3D=3D 2;
         break;
=20
@@ -298,7 +298,7 @@ static void cs_reset_voices (CSState *s, uint32_t val=
)
     case 3:
         s->tab =3D ALawDecompressTable;
     x_law:
-        as.fmt =3D AUD_FMT_S16;
+        as.fmt =3D AUDIO_FORMAT_S16;
         as.endianness =3D AUDIO_HOST_ENDIANNESS;
         s->shift =3D as.nchannels =3D=3D 2;
         break;
@@ -307,7 +307,7 @@ static void cs_reset_voices (CSState *s, uint32_t val=
)
         as.endianness =3D 1;
         /* fall through */
     case 2:
-        as.fmt =3D AUD_FMT_S16;
+        as.fmt =3D AUDIO_FORMAT_S16;
         s->shift =3D as.nchannels;
         break;
=20
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 97789a077196..a5314d66fdc2 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -414,14 +414,14 @@ static void es1370_update_voices (ES1370State *s, u=
int32_t ctl, uint32_t sctl)
                     i,
                     new_freq,
                     1 << (new_fmt & 1),
-                    (new_fmt & 2) ? AUD_FMT_S16 : AUD_FMT_U8,
+                    (new_fmt & 2) ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_U8,
                     d->shift);
             if (new_freq) {
                 struct audsettings as;
=20
                 as.freq =3D new_freq;
                 as.nchannels =3D 1 << (new_fmt & 1);
-                as.fmt =3D (new_fmt & 2) ? AUD_FMT_S16 : AUD_FMT_U8;
+                as.fmt =3D (new_fmt & 2) ? AUDIO_FORMAT_S16 : AUDIO_FORM=
AT_U8;
                 as.endianness =3D 0;
=20
                 if (i =3D=3D ADC_CHANNEL) {
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 8e0b27e0f237..b3e2a7fdd504 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -251,7 +251,7 @@ static void gus_realizefn (DeviceState *dev, Error **=
errp)
=20
     as.freq =3D s->freq;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D GUS_ENDIANNESS;
=20
     s->voice =3D AUD_open_out (
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 617a1c1016b8..c25bfa38b143 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -99,9 +99,9 @@ static void hda_codec_parse_fmt(uint32_t format, struct=
 audsettings *as)
     }
=20
     switch (format & AC_FMT_BITS_MASK) {
-    case AC_FMT_BITS_8:  as->fmt =3D AUD_FMT_S8;  break;
-    case AC_FMT_BITS_16: as->fmt =3D AUD_FMT_S16; break;
-    case AC_FMT_BITS_32: as->fmt =3D AUD_FMT_S32; break;
+    case AC_FMT_BITS_8:  as->fmt =3D AUDIO_FORMAT_S8;  break;
+    case AC_FMT_BITS_16: as->fmt =3D AUDIO_FORMAT_S16; break;
+    case AC_FMT_BITS_32: as->fmt =3D AUDIO_FORMAT_S32; break;
     }
=20
     as->nchannels =3D ((format & AC_FMT_CHAN_MASK) >> AC_FMT_CHAN_SHIFT)=
 + 1;
@@ -134,12 +134,12 @@ static void hda_codec_parse_fmt(uint32_t format, st=
ruct audsettings *as)
 /* ---------------------------------------------------------------------=
----- */
=20
 static const char *fmt2name[] =3D {
-    [ AUD_FMT_U8  ] =3D "PCM-U8",
-    [ AUD_FMT_S8  ] =3D "PCM-S8",
-    [ AUD_FMT_U16 ] =3D "PCM-U16",
-    [ AUD_FMT_S16 ] =3D "PCM-S16",
-    [ AUD_FMT_U32 ] =3D "PCM-U32",
-    [ AUD_FMT_S32 ] =3D "PCM-S32",
+    [ AUDIO_FORMAT_U8  ] =3D "PCM-U8",
+    [ AUDIO_FORMAT_S8  ] =3D "PCM-S8",
+    [ AUDIO_FORMAT_U16 ] =3D "PCM-U16",
+    [ AUDIO_FORMAT_S16 ] =3D "PCM-S16",
+    [ AUDIO_FORMAT_U32 ] =3D "PCM-U32",
+    [ AUDIO_FORMAT_S32 ] =3D "PCM-S32",
 };
=20
 typedef struct HDAAudioState HDAAudioState;
diff --git a/hw/audio/lm4549.c b/hw/audio/lm4549.c
index a46f2301af82..af8b22b541e9 100644
--- a/hw/audio/lm4549.c
+++ b/hw/audio/lm4549.c
@@ -185,7 +185,7 @@ void lm4549_write(lm4549_state *s,
         struct audsettings as;
         as.freq =3D value;
         as.nchannels =3D 2;
-        as.fmt =3D AUD_FMT_S16;
+        as.fmt =3D AUDIO_FORMAT_S16;
         as.endianness =3D 0;
=20
         s->voice =3D AUD_open_out(
@@ -255,7 +255,7 @@ static int lm4549_post_load(void *opaque, int version=
_id)
     struct audsettings as;
     as.freq =3D freq;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D 0;
=20
     s->voice =3D AUD_open_out(
@@ -292,7 +292,7 @@ void lm4549_init(lm4549_state *s, lm4549_callback dat=
a_req_cb, void* opaque)
     /* Open a default voice */
     as.freq =3D 48000;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D 0;
=20
     s->voice =3D AUD_open_out(
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index bc8db71ae0dd..90cce1e6eded 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -308,7 +308,7 @@ static void milkymist_ac97_realize(DeviceState *dev, =
Error **errp)
=20
     as.freq =3D 48000;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D 1;
=20
     s->voice_in =3D AUD_open_in(&s->card, s->voice_in,
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index b80a62ce90a4..fdbb4b6e9923 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -162,7 +162,7 @@ static void pcspk_initfn(Object *obj)
=20
 static void pcspk_realizefn(DeviceState *dev, Error **errp)
 {
-    struct audsettings as =3D {PCSPK_SAMPLE_RATE, 1, AUD_FMT_U8, 0};
+    struct audsettings as =3D {PCSPK_SAMPLE_RATE, 1, AUDIO_FORMAT_U8, 0}=
;
     ISADevice *isadev =3D ISA_DEVICE(dev);
     PCSpkState *s =3D PC_SPEAKER(dev);
=20
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index c5b9bf79e819..65ea0cd93832 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -66,7 +66,7 @@ typedef struct SB16State {
     int fmt_stereo;
     int fmt_signed;
     int fmt_bits;
-    audfmt_e fmt;
+    AudioFormat fmt;
     int dma_auto;
     int block_size;
     int fifo;
@@ -224,7 +224,7 @@ static void continue_dma8 (SB16State *s)
=20
 static void dma_cmd8 (SB16State *s, int mask, int dma_len)
 {
-    s->fmt =3D AUD_FMT_U8;
+    s->fmt =3D AUDIO_FORMAT_U8;
     s->use_hdma =3D 0;
     s->fmt_bits =3D 8;
     s->fmt_signed =3D 0;
@@ -319,18 +319,18 @@ static void dma_cmd (SB16State *s, uint8_t cmd, uin=
t8_t d0, int dma_len)
=20
     if (16 =3D=3D s->fmt_bits) {
         if (s->fmt_signed) {
-            s->fmt =3D AUD_FMT_S16;
+            s->fmt =3D AUDIO_FORMAT_S16;
         }
         else {
-            s->fmt =3D AUD_FMT_U16;
+            s->fmt =3D AUDIO_FORMAT_U16;
         }
     }
     else {
         if (s->fmt_signed) {
-            s->fmt =3D AUD_FMT_S8;
+            s->fmt =3D AUDIO_FORMAT_S8;
         }
         else {
-            s->fmt =3D AUD_FMT_U8;
+            s->fmt =3D AUDIO_FORMAT_U8;
         }
     }
=20
@@ -852,7 +852,7 @@ static void legacy_reset (SB16State *s)
=20
     as.freq =3D s->freq;
     as.nchannels =3D 1;
-    as.fmt =3D AUD_FMT_U8;
+    as.fmt =3D AUDIO_FORMAT_U8;
     as.endianness =3D 0;
=20
     s->voice =3D AUD_open_out (
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index 169b006ade2d..ca0ad73caf7d 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -201,7 +201,7 @@ static void wm8750_set_format(WM8750State *s)
     in_fmt.endianness =3D 0;
     in_fmt.nchannels =3D 2;
     in_fmt.freq =3D s->adc_hz;
-    in_fmt.fmt =3D AUD_FMT_S16;
+    in_fmt.fmt =3D AUDIO_FORMAT_S16;
=20
     s->adc_voice[0] =3D AUD_open_in(&s->card, s->adc_voice[0],
                     CODEC ".input1", s, wm8750_audio_in_cb, &in_fmt);
@@ -214,7 +214,7 @@ static void wm8750_set_format(WM8750State *s)
     out_fmt.endianness =3D 0;
     out_fmt.nchannels =3D 2;
     out_fmt.freq =3D s->dac_hz;
-    out_fmt.fmt =3D AUD_FMT_S16;
+    out_fmt.fmt =3D AUDIO_FORMAT_S16;
=20
     s->dac_voice[0] =3D AUD_open_out(&s->card, s->dac_voice[0],
                     CODEC ".speaker", s, wm8750_audio_out_cb, &out_fmt);
@@ -681,7 +681,7 @@ uint32_t wm8750_adc_dat(void *opaque)
     if (s->idx_in >=3D sizeof(s->data_in)) {
         wm8750_in_load(s);
         if (s->idx_in >=3D sizeof(s->data_in)) {
-            return 0x80008000; /* silence in AUD_FMT_S16 sample format *=
/
+            return 0x80008000; /* silence in AUDIO_FORMAT_S16 sample for=
mat */
         }
     }
=20
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index cc0f9bc9cc8b..11b09bd18c19 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1260,7 +1260,7 @@ static void xlnx_dp_realize(DeviceState *dev, Error=
 **errp)
=20
     as.freq =3D 44100;
     as.nchannels =3D 2;
-    as.fmt =3D AUD_FMT_S16;
+    as.fmt =3D AUDIO_FORMAT_S16;
     as.endianness =3D 0;
=20
     AUD_register_card("xlnx_dp.audio", &s->aud_card);
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 2eb3cb951878..41731619bb6a 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -318,7 +318,7 @@ static void tsc2102_audio_output_update(TSC210xState =
*s)
     fmt.endianness =3D 0;
     fmt.nchannels =3D 2;
     fmt.freq =3D s->codec.tx_rate;
-    fmt.fmt =3D AUD_FMT_S16;
+    fmt.fmt =3D AUDIO_FORMAT_S16;
=20
     s->dac_voice[0] =3D AUD_open_out(&s->card, s->dac_voice[0],
                     "tsc2102.sink", s, (void *) tsc210x_audio_out_cb, &f=
mt);
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 28ac7c5165ff..c46d5eeb79a3 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -650,7 +650,7 @@ static void usb_audio_realize(USBDevice *dev, Error *=
*errp)
     s->out.vol[1]        =3D 240; /* 0 dB */
     s->out.as.freq       =3D USBAUDIO_SAMPLE_RATE;
     s->out.as.nchannels  =3D 2;
-    s->out.as.fmt        =3D AUD_FMT_S16;
+    s->out.as.fmt        =3D AUDIO_FORMAT_S16;
     s->out.as.endianness =3D 0;
     streambuf_init(&s->out.buf, s->buffer);
=20
diff --git a/ui/vnc.c b/ui/vnc.c
index da4a21d4ce94..b724e998bab6 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1013,16 +1013,16 @@ static void vnc_update_throttle_offset(VncState *=
vs)
         int bps;
         switch (vs->as.fmt) {
         default:
-        case  AUD_FMT_U8:
-        case  AUD_FMT_S8:
+        case  AUDIO_FORMAT_U8:
+        case  AUDIO_FORMAT_S8:
             bps =3D 1;
             break;
-        case  AUD_FMT_U16:
-        case  AUD_FMT_S16:
+        case  AUDIO_FORMAT_U16:
+        case  AUDIO_FORMAT_S16:
             bps =3D 2;
             break;
-        case  AUD_FMT_U32:
-        case  AUD_FMT_S32:
+        case  AUDIO_FORMAT_U32:
+        case  AUDIO_FORMAT_S32:
             bps =3D 4;
             break;
         }
@@ -2369,12 +2369,12 @@ static int protocol_client_msg(VncState *vs, uint=
8_t *data, size_t len)
                 if (len =3D=3D 4)
                     return 10;
                 switch (read_u8(data, 4)) {
-                case 0: vs->as.fmt =3D AUD_FMT_U8; break;
-                case 1: vs->as.fmt =3D AUD_FMT_S8; break;
-                case 2: vs->as.fmt =3D AUD_FMT_U16; break;
-                case 3: vs->as.fmt =3D AUD_FMT_S16; break;
-                case 4: vs->as.fmt =3D AUD_FMT_U32; break;
-                case 5: vs->as.fmt =3D AUD_FMT_S32; break;
+                case 0: vs->as.fmt =3D AUDIO_FORMAT_U8; break;
+                case 1: vs->as.fmt =3D AUDIO_FORMAT_S8; break;
+                case 2: vs->as.fmt =3D AUDIO_FORMAT_U16; break;
+                case 3: vs->as.fmt =3D AUDIO_FORMAT_S16; break;
+                case 4: vs->as.fmt =3D AUDIO_FORMAT_U32; break;
+                case 5: vs->as.fmt =3D AUDIO_FORMAT_S32; break;
                 default:
                     VNC_DEBUG("Invalid audio format %d\n", read_u8(data,=
 4));
                     vnc_client_error(vs);
@@ -3105,7 +3105,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelS=
ocket *sioc,
=20
     vs->as.freq =3D 44100;
     vs->as.nchannels =3D 2;
-    vs->as.fmt =3D AUD_FMT_S16;
+    vs->as.fmt =3D AUDIO_FORMAT_S16;
     vs->as.endianness =3D 0;
=20
     qemu_mutex_init(&vs->output_mutex);
--=20
2.18.1

