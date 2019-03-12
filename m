Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp156688wrs;
        Tue, 12 Mar 2019 00:13:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL2l+V5lZFbxA2sskR9l7xE0c98WJkBVKsjtzrvIsm+0dENuz3u3vVpaz+F3/QvbnSQZSl
X-Received: by 2002:a81:4b8a:: with SMTP id y132mr8066872ywa.486.1552374814083;
        Tue, 12 Mar 2019 00:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552374814; cv=none;
        d=google.com; s=arc-20160816;
        b=R72IYXRvMeL4cp/oZ9kBqleeCs0Tr7dIpkMWjz3vh3eJsiiL98o4uXJDAMzBGVuufa
         qSraZvJmCsI+kxadEMLKry52UTqnbx/s+NQS+jhnho7KgMh/EIn3ox/Hb4KAnhY0PS0D
         w066Mot9A8MVYiBDB15Lqvs4GIqgiY5g80vJJc8ynemOfMxv7UgCvrEestLeo9B7gnb/
         uexuDxl8NzoRGGl526XzlUPU2JYmrSVISLpazxBtgqkotTFsEG9JpFqhnvSQLe5KW7vG
         I16anXgRRcjFZXoEp+M38pZkZtOS9Wp9ugCuWx18NEDPp7JdNwynpsVZ1UG8h/vdDxPQ
         rB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YzWtyi+8NUdBJAooREaqMawHPAqCnENb9b6Go+WeYkc=;
        b=gfZ5QjHEgcDaaXkduDYDiRInUpzM/8zV0RRExfoazqbDzS0qTSwk8N42dkLkK0P0mn
         HkEsG6bwGYegDk6jdp5bmvSXQAzvZhEDC8mgA08suzJTXGYLZ2x2LQRPFsoqsPiPgVZ+
         5qsylO117QibGTdy5IFuv/xgVOiGxsW1VmSxpP5Cq8pf2SMcv9YTGjqfujq0bzL/E4pn
         3neTlHrmsWJlc5t48z1/kljN6r/m7p1HB2t4FPLgvOiMI6jPPL9SdLWtuCYjG8/4ZbzY
         APzyjhF3m7zrDHok3Up2JmXW9GEXZzAwLBTCpol3VseU2PBjcVutXSkqHH34IpXJyVs8
         W1Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si4347970ybz.279.2019.03.12.00.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bbR-0005Uj-Gx
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:13:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb0-0005Uc-Pq
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3baz-0006E3-CA
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1h3baz-0006DD-2S
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08847883AC;
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D843A60A9A;
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DFA0DA1E2; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:49 +0100
Message-Id: <20190312071250.12168-14-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/14] wavaudio: port to -audiodev config
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Kővágó@redhat.com, libvir-list@redhat.com, Alistair Francis <alistair@alistair23.me>, Markus Armbruster <armbru@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d3lUDuIAPmWp

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 28c2bf374c447c20937a192695c7b9f5367dea7e.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_legacy.c | 16 ++++++++++++
 audio/wavaudio.c     | 58 +++++++-------------------------------------
 2 files changed, 25 insertions(+), 49 deletions(-)

diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 478cf76d5fc0..6d140119d98a 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -289,6 +289,18 @@ static void handle_sdl(Audiodev *dev)
                          &dev->u.sdl.out->has_buffer_length, dev->u.sdl.=
out);
 }
=20
+/* wav */
+static void handle_wav(Audiodev *dev)
+{
+    get_int("QEMU_WAV_FREQUENCY",
+            &dev->u.wav.out->frequency, &dev->u.wav.out->has_frequency);
+    get_fmt("QEMU_WAV_FORMAT", &dev->u.wav.out->format,
+            &dev->u.wav.out->has_format);
+    get_int("QEMU_WAV_DAC_FIXED_CHANNELS",
+            &dev->u.wav.out->channels, &dev->u.wav.out->has_channels);
+    get_str("QEMU_WAV_PATH", &dev->u.wav.path, &dev->u.wav.has_path);
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -354,6 +366,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_sdl(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_WAV:
+        handle_wav(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 9eff3555b35f..8d30f572965e 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/timer.h"
+#include "qapi/opts-visitor.h"
 #include "audio.h"
=20
 #define AUDIO_CAP "wav"
@@ -37,11 +38,6 @@ typedef struct WAVVoiceOut {
     int total_samples;
 } WAVVoiceOut;
=20
-typedef struct {
-    struct audsettings settings;
-    const char *wav_path;
-} WAVConf;
-
 static int wav_run_out (HWVoiceOut *hw, int live)
 {
     WAVVoiceOut *wav =3D (WAVVoiceOut *) hw;
@@ -112,8 +108,10 @@ static int wav_init_out(HWVoiceOut *hw, struct audse=
ttings *as,
         0x02, 0x00, 0x44, 0xac, 0x00, 0x00, 0x10, 0xb1, 0x02, 0x00, 0x04=
,
         0x00, 0x10, 0x00, 0x64, 0x61, 0x74, 0x61, 0x00, 0x00, 0x00, 0x00
     };
-    WAVConf *conf =3D drv_opaque;
-    struct audsettings wav_as =3D conf->settings;
+    Audiodev *dev =3D drv_opaque;
+    AudiodevWavOptions *wopts =3D &dev->u.wav;
+    struct audsettings wav_as =3D audiodev_to_audsettings(dev->u.wav.out=
);
+    const char *wav_path =3D wopts->has_path ? wopts->path : "qemu.wav";
=20
     stereo =3D wav_as.nchannels =3D=3D 2;
     switch (wav_as.fmt) {
@@ -154,10 +152,10 @@ static int wav_init_out(HWVoiceOut *hw, struct auds=
ettings *as,
     le_store (hdr + 28, hw->info.freq << (bits16 + stereo), 4);
     le_store (hdr + 32, 1 << (bits16 + stereo), 2);
=20
-    wav->f =3D fopen (conf->wav_path, "wb");
+    wav->f =3D fopen(wav_path, "wb");
     if (!wav->f) {
         dolog ("Failed to open wave file `%s'\nReason: %s\n",
-               conf->wav_path, strerror (errno));
+               wav_path, strerror(errno));
         g_free (wav->pcm_buf);
         wav->pcm_buf =3D NULL;
         return -1;
@@ -225,54 +223,17 @@ static int wav_ctl_out (HWVoiceOut *hw, int cmd, ..=
.)
     return 0;
 }
=20
-static WAVConf glob_conf =3D {
-    .settings.freq      =3D 44100,
-    .settings.nchannels =3D 2,
-    .settings.fmt       =3D AUDIO_FORMAT_S16,
-    .wav_path           =3D "qemu.wav"
-};
-
 static void *wav_audio_init(Audiodev *dev)
 {
-    WAVConf *conf =3D g_malloc(sizeof(WAVConf));
-    *conf =3D glob_conf;
-    return conf;
+    assert(dev->driver =3D=3D AUDIODEV_DRIVER_WAV);
+    return dev;
 }
=20
 static void wav_audio_fini (void *opaque)
 {
     ldebug ("wav_fini");
-    g_free(opaque);
 }
=20
-static struct audio_option wav_options[] =3D {
-    {
-        .name  =3D "FREQUENCY",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.settings.freq,
-        .descr =3D "Frequency"
-    },
-    {
-        .name  =3D "FORMAT",
-        .tag   =3D AUD_OPT_FMT,
-        .valp  =3D &glob_conf.settings.fmt,
-        .descr =3D "Format"
-    },
-    {
-        .name  =3D "DAC_FIXED_CHANNELS",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.settings.nchannels,
-        .descr =3D "Number of channels (1 - mono, 2 - stereo)"
-    },
-    {
-        .name  =3D "PATH",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.wav_path,
-        .descr =3D "Path to wave file"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops wav_pcm_ops =3D {
     .init_out =3D wav_init_out,
     .fini_out =3D wav_fini_out,
@@ -284,7 +245,6 @@ static struct audio_pcm_ops wav_pcm_ops =3D {
 static struct audio_driver wav_audio_driver =3D {
     .name           =3D "wav",
     .descr          =3D "WAV renderer http://wikipedia.org/wiki/WAV",
-    .options        =3D wav_options,
     .init           =3D wav_audio_init,
     .fini           =3D wav_audio_fini,
     .pcm_ops        =3D &wav_pcm_ops,
--=20
2.18.1

