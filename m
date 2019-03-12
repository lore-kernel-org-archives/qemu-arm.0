Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp157133wrs;
        Tue, 12 Mar 2019 00:14:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzK0/aQmXfQc7A03foAnyzso77YcTrsoGaFTT9DajzbyZLAH9ek6dqSooQClgw79sv1tGjn
X-Received: by 2002:a25:3dc4:: with SMTP id k187mr30920064yba.443.1552374847121;
        Tue, 12 Mar 2019 00:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552374847; cv=none;
        d=google.com; s=arc-20160816;
        b=kHqLy8KBz1QfQMM3qn+RNRR2yMQ9anPHjFXoTmyHwFQrUXO+zZybnOvSiI6xbpc7lq
         TA6fdT1pUoHWv4fkyqfbt+KXIJ175EZTNGRyqKX3ZtdqCZ3nevGi+95wVe0GlYGIMO75
         fr8mFbP+nq8NHpRq+AC4Zq1KCs4wD0zWPX/+Ni03yG36SUTz/dy+UJMOcjIuk7nzNj1s
         Hap/QhFQsLFjAnplQ4RcS4Uzc33hVQJNN3gwb+Eb9rFPG1QHiB9HGVZda2CuS9IWKCQe
         B6+6S8OjBa3BgzXIYuQR5O/1fnCx/HNob23TtqozvYKlp3Iq/3veJA3ZnXDUJ8j6oF5U
         96PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=N89chXN7psUKO+jNk6D2WTpmovABnbPqVLNluTUB0h8=;
        b=vcd9rya7RY0E33s4/JpXcRxHDsxtNV7NLhS3BMtvDgk/bX9hUAj+ezwDR7/AVNJJ+V
         BhBJx6iAlcMaNkvXnXlxlT1BuX7sPgt+z+o4t/G2dO4yvCPTr7nzQX1EtP9j5lnYluhN
         z4R3ayf3rcDf3g/xJxWAKkKdBXf1iUMZ23DbH/u/lmBkgOnvcXHJgeeL4aMDFOA0rS+0
         Q+OEoqLNif1/iFzhaNmBgUqwnD3e+AN0IXfLiCQ+JkxxuOuvg9xGwkJ0dfhfXC0x2ubV
         bVv2da08AXpjVAKgIO/a7z/cQKFkTBd00lD8csOBSIedJ5Mks1Yi+f1Xymifwxd8y//L
         bjLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si4265272ybg.168.2019.03.12.00.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bby-0005Za-Hz
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:14:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb6-0005Xz-0V
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb4-0006KO-18
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bb0-0006Ei-S5; Tue, 12 Mar 2019 03:13:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10EAE30832D1;
	Tue, 12 Mar 2019 07:13:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA856013D;
	Tue, 12 Mar 2019 07:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9DEC81753B; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:42 +0100
Message-Id: <20190312071250.12168-7-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 12 Mar 2019 07:13:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/14] coreaudio: port to -audiodev config
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
X-TUID: lHQTOdBuCcQb

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: ba58f7e2501b1454b5e0f91c03aad416a404fc6a.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_legacy.c | 28 +++++++++++++++++++++++++
 audio/coreaudio.c    | 49 ++++++++++----------------------------------
 2 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index f58c8b6aee62..5f557a2de9b7 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -109,6 +109,17 @@ static uint32_t frames_to_usecs(uint32_t frames,
     return (frames * 1000000 + freq / 2) / freq;
 }
=20
+
+static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *ha=
s_dst,
+                                AudiodevPerDirectionOptions *pdo)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D frames_to_usecs(toui32(val), pdo);
+        *has_dst =3D true;
+    }
+}
+
 /* backend specific functions */
 /* ALSA */
 static void handle_alsa_per_direction(
@@ -156,6 +167,19 @@ static void handle_alsa(Audiodev *dev)
                         &aopt->threshold, &aopt->has_threshold);
 }
=20
+/* coreaudio */
+static void handle_coreaudio(Audiodev *dev)
+{
+    get_frames_to_usecs(
+        "QEMU_COREAUDIO_BUFFER_SIZE",
+        &dev->u.coreaudio.out->buffer_length,
+        &dev->u.coreaudio.out->has_buffer_length,
+        qapi_AudiodevCoreaudioPerDirectionOptions_base(dev->u.coreaudio.=
out));
+    get_int("QEMU_COREAUDIO_BUFFER_COUNT",
+            &dev->u.coreaudio.out->buffer_count,
+            &dev->u.coreaudio.out->has_buffer_count);
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -201,6 +225,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_alsa(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_COREAUDIO:
+        handle_coreaudio(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 7d4225dbeeff..1ee43b7d5f12 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -36,11 +36,6 @@
 #define MAC_OS_X_VERSION_10_6 1060
 #endif
=20
-typedef struct {
-    int buffer_frames;
-    int nbuffers;
-} CoreaudioConf;
-
 typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
     pthread_mutex_t mutex;
@@ -507,7 +502,9 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct =
audsettings *as,
     int err;
     const char *typ =3D "playback";
     AudioValueRange frameRange;
-    CoreaudioConf *conf =3D drv_opaque;
+    Audiodev *dev =3D drv_opaque;
+    AudiodevCoreaudioPerDirectionOptions *cpdo =3D dev->u.coreaudio.out;
+    int frames;
=20
     /* create mutex */
     err =3D pthread_mutex_init(&core->mutex, NULL);
@@ -538,16 +535,17 @@ static int coreaudio_init_out(HWVoiceOut *hw, struc=
t audsettings *as,
         return -1;
     }
=20
-    if (frameRange.mMinimum > conf->buffer_frames) {
+    frames =3D audio_buffer_frames(
+        qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610)=
;
+    if (frameRange.mMinimum > frames) {
         core->audioDevicePropertyBufferFrameSize =3D (UInt32) frameRange=
.mMinimum;
         dolog ("warning: Upsizing Buffer Frames to %f\n", frameRange.mMi=
nimum);
-    }
-    else if (frameRange.mMaximum < conf->buffer_frames) {
+    } else if (frameRange.mMaximum < frames) {
         core->audioDevicePropertyBufferFrameSize =3D (UInt32) frameRange=
.mMaximum;
         dolog ("warning: Downsizing Buffer Frames to %f\n", frameRange.m=
Maximum);
     }
     else {
-        core->audioDevicePropertyBufferFrameSize =3D conf->buffer_frames=
;
+        core->audioDevicePropertyBufferFrameSize =3D frames;
     }
=20
     /* set Buffer Frame Size */
@@ -568,7 +566,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct =
audsettings *as,
                            "Could not get device buffer frame size\n");
         return -1;
     }
-    hw->samples =3D conf->nbuffers * core->audioDevicePropertyBufferFram=
eSize;
+    hw->samples =3D (cpdo->has_buffer_count ? cpdo->buffer_count : 4) *
+        core->audioDevicePropertyBufferFrameSize;
=20
     /* get StreamFormat */
     status =3D coreaudio_get_streamformat(core->outputDeviceID,
@@ -680,40 +679,15 @@ static int coreaudio_ctl_out (HWVoiceOut *hw, int c=
md, ...)
     return 0;
 }
=20
-static CoreaudioConf glob_conf =3D {
-    .buffer_frames =3D 512,
-    .nbuffers =3D 4,
-};
-
 static void *coreaudio_audio_init(Audiodev *dev)
 {
-    CoreaudioConf *conf =3D g_malloc(sizeof(CoreaudioConf));
-    *conf =3D glob_conf;
-
-    return conf;
+    return dev;
 }
=20
 static void coreaudio_audio_fini (void *opaque)
 {
-    g_free(opaque);
 }
=20
-static struct audio_option coreaudio_options[] =3D {
-    {
-        .name  =3D "BUFFER_SIZE",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.buffer_frames,
-        .descr =3D "Size of the buffer in frames"
-    },
-    {
-        .name  =3D "BUFFER_COUNT",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.nbuffers,
-        .descr =3D "Number of buffers"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops coreaudio_pcm_ops =3D {
     .init_out =3D coreaudio_init_out,
     .fini_out =3D coreaudio_fini_out,
@@ -725,7 +699,6 @@ static struct audio_pcm_ops coreaudio_pcm_ops =3D {
 static struct audio_driver coreaudio_audio_driver =3D {
     .name           =3D "coreaudio",
     .descr          =3D "CoreAudio http://developer.apple.com/audio/core=
audio.html",
-    .options        =3D coreaudio_options,
     .init           =3D coreaudio_audio_init,
     .fini           =3D coreaudio_audio_fini,
     .pcm_ops        =3D &coreaudio_pcm_ops,
--=20
2.18.1

