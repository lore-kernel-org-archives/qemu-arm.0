Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp156810wrs;
        Tue, 12 Mar 2019 00:13:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd/nTOj6hhZXDg0/z97A/jj/lUylRlcbVQFWzwSZTRwMsAdEhhH2xJUF1PKsCQ9rFyEeyC
X-Received: by 2002:a25:b211:: with SMTP id i17mr30337715ybj.122.1552374822243;
        Tue, 12 Mar 2019 00:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552374822; cv=none;
        d=google.com; s=arc-20160816;
        b=N4bQ2mJI97bX+3bp+sIhILCSadALYa4j/rwDoCa1DZ3mCS3YKx/kTOdQjZo5Y9W2sH
         ATYxTbkcZ+P5fGbTx05WfKcIRQ6lehsgbu7PcMW3ID/EdwLz2CCVPu3TXbQk0dTTb2ad
         J7PkSR5ZqCmjWUFhrnGjOynb/dOkcYsT3lboVmiT1mYwkaBayE/vyJE3LjpZml/L4Wzp
         Q4XQh7Vyf2ICJ0LnUMWFcacKFzSdH/sP1jhMR6tNzWMt6T4vpnURyktbYNgYlxud4/Fb
         h6PN9fC9QOVuja2j2YuvUpnIzrG4TogUYDrLFG3Nuv3PEtewtYD0P/xP6l96A5MqXfSZ
         3gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Lb6+BD2tUmRMhtiJmOaGMSxdPgCw+ynhcZ/qkM/hvdU=;
        b=taFDSgMRI/dotJ2Jpw8qKzLjmWL1HavZIr54Xe3/XRPAGQ84QjNdm41oI6lUlg41LJ
         AFEhpOrqVRYDCB3/L0sEyLOM4k4o7uIDwhT7dAHRdD9AdXfn3vKpmRDYz0OmrLXZqOq+
         zpnrUBskLMCB/k4RZNSCvUooApBCju0KjdqTLafAkJ+/dxnsBMdid960XANeQLuhpbz9
         IabSAOYZs42nD6lPZdQcPCX+iuIRXrA7lBS4ayoBf8XLuYQCIhobB6QjPhirEBVg2x2N
         9ua/QEnFdRcVe2fVRTrLZRMfqyzz2TwqJqhHdSjzGjtEhxwkxp5LIaqT4MEFP0WpNztt
         oVTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y140si4565494yby.11.2019.03.12.00.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bbZ-0005k5-Lw
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:13:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb4-0005Xv-Sq
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb3-0006Gz-CO
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:13:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bb2-0006FN-Dq; Tue, 12 Mar 2019 03:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F3FFC04959C;
	Tue, 12 Mar 2019 07:13:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABBCE5D70E;
	Tue, 12 Mar 2019 07:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A8DE71753C; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:43 +0100
Message-Id: <20190312071250.12168-8-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Mar 2019 07:13:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 07/14] dsoundaudio: port to -audiodev config
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
X-TUID: qJK2ec4vmk4D

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: f25562cb88246b41c3e6380685a108fd341d5b50.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsound_template.h |  6 ++---
 audio/audio_legacy.c    | 43 ++++++++++++++++++++++++++++++
 audio/dsoundaudio.c     | 59 ++++++++++++-----------------------------
 3 files changed, 63 insertions(+), 45 deletions(-)

diff --git a/audio/dsound_template.h b/audio/dsound_template.h
index b439f33f58c1..8ece870c9ef7 100644
--- a/audio/dsound_template.h
+++ b/audio/dsound_template.h
@@ -167,17 +167,18 @@ static int dsound_init_out(HWVoiceOut *hw, struct a=
udsettings *as,
     dsound *s =3D drv_opaque;
     WAVEFORMATEX wfx;
     struct audsettings obt_as;
-    DSoundConf *conf =3D &s->conf;
 #ifdef DSBTYPE_IN
     const char *typ =3D "ADC";
     DSoundVoiceIn *ds =3D (DSoundVoiceIn *) hw;
     DSCBUFFERDESC bd;
     DSCBCAPS bc;
+    AudiodevPerDirectionOptions *pdo =3D s->dev->u.dsound.in;
 #else
     const char *typ =3D "DAC";
     DSoundVoiceOut *ds =3D (DSoundVoiceOut *) hw;
     DSBUFFERDESC bd;
     DSBCAPS bc;
+    AudiodevPerDirectionOptions *pdo =3D s->dev->u.dsound.out;
 #endif
=20
     if (!s->FIELD2) {
@@ -193,8 +194,8 @@ static int dsound_init_out(HWVoiceOut *hw, struct aud=
settings *as,
     memset (&bd, 0, sizeof (bd));
     bd.dwSize =3D sizeof (bd);
     bd.lpwfxFormat =3D &wfx;
+    bd.dwBufferBytes =3D audio_buffer_bytes(pdo, as, 92880);
 #ifdef DSBTYPE_IN
-    bd.dwBufferBytes =3D conf->bufsize_in;
     hr =3D IDirectSoundCapture_CreateCaptureBuffer (
         s->dsound_capture,
         &bd,
@@ -203,7 +204,6 @@ static int dsound_init_out(HWVoiceOut *hw, struct aud=
settings *as,
         );
 #else
     bd.dwFlags =3D DSBCAPS_STICKYFOCUS | DSBCAPS_GETCURRENTPOSITION2;
-    bd.dwBufferBytes =3D conf->bufsize_out;
     hr =3D IDirectSound_CreateSoundBuffer (
         s->dsound,
         &bd,
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 5f557a2de9b7..bf326bd36060 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -120,6 +120,30 @@ static void get_frames_to_usecs(const char *env, uin=
t32_t *dst, bool *has_dst,
     }
 }
=20
+static uint32_t samples_to_usecs(uint32_t samples,
+                                 AudiodevPerDirectionOptions *pdo)
+{
+    uint32_t channels =3D pdo->has_channels ? pdo->channels : 2;
+    return frames_to_usecs(samples / channels, pdo);
+}
+
+static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptio=
ns *pdo)
+{
+    AudioFormat fmt =3D pdo->has_format ? pdo->format : AUDIO_FORMAT_S16=
;
+    uint32_t bytes_per_sample =3D audioformat_bytes_per_sample(fmt);
+    return samples_to_usecs(bytes / bytes_per_sample, pdo);
+}
+
+static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has=
_dst,
+                               AudiodevPerDirectionOptions *pdo)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D bytes_to_usecs(toui32(val), pdo);
+        *has_dst =3D true;
+    }
+}
+
 /* backend specific functions */
 /* ALSA */
 static void handle_alsa_per_direction(
@@ -180,6 +204,21 @@ static void handle_coreaudio(Audiodev *dev)
             &dev->u.coreaudio.out->has_buffer_count);
 }
=20
+/* dsound */
+static void handle_dsound(Audiodev *dev)
+{
+    get_millis_to_usecs("QEMU_DSOUND_LATENCY_MILLIS",
+                        &dev->u.dsound.latency, &dev->u.dsound.has_laten=
cy);
+    get_bytes_to_usecs("QEMU_DSOUND_BUFSIZE_OUT",
+                       &dev->u.dsound.out->buffer_length,
+                       &dev->u.dsound.out->has_buffer_length,
+                       dev->u.dsound.out);
+    get_bytes_to_usecs("QEMU_DSOUND_BUFSIZE_IN",
+                       &dev->u.dsound.in->buffer_length,
+                       &dev->u.dsound.in->has_buffer_length,
+                       dev->u.dsound.in);
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -229,6 +268,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_coreaudio(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_DSOUND:
+        handle_dsound(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 02fe777cba75..a7d04b5033a3 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -32,6 +32,7 @@
=20
 #define AUDIO_CAP "dsound"
 #include "audio_int.h"
+#include "qemu/host-utils.h"
=20
 #include <windows.h>
 #include <mmsystem.h>
@@ -42,17 +43,11 @@
=20
 /* #define DEBUG_DSOUND */
=20
-typedef struct {
-    int bufsize_in;
-    int bufsize_out;
-    int latency_millis;
-} DSoundConf;
-
 typedef struct {
     LPDIRECTSOUND dsound;
     LPDIRECTSOUNDCAPTURE dsound_capture;
     struct audsettings settings;
-    DSoundConf conf;
+    Audiodev *dev;
 } dsound;
=20
 typedef struct {
@@ -248,9 +243,9 @@ static void GCC_FMT_ATTR (3, 4) dsound_logerr2 (
     dsound_log_hresult (hr);
 }
=20
-static DWORD millis_to_bytes (struct audio_pcm_info *info, DWORD millis)
+static uint64_t usecs_to_bytes(struct audio_pcm_info *info, uint32_t use=
cs)
 {
-    return (millis * info->bytes_per_second) / 1000;
+    return muldiv64(usecs, info->bytes_per_second, 1000000);
 }
=20
 #ifdef DEBUG_DSOUND
@@ -478,7 +473,7 @@ static int dsound_run_out (HWVoiceOut *hw, int live)
     LPVOID p1, p2;
     int bufsize;
     dsound *s =3D ds->s;
-    DSoundConf *conf =3D &s->conf;
+    AudiodevDsoundOptions *dso =3D &s->dev->u.dsound;
=20
     if (!dsb) {
         dolog ("Attempt to run empty with playback buffer\n");
@@ -501,14 +496,14 @@ static int dsound_run_out (HWVoiceOut *hw, int live=
)
     len =3D live << hwshift;
=20
     if (ds->first_time) {
-        if (conf->latency_millis) {
+        if (dso->latency) {
             DWORD cur_blat;
=20
             cur_blat =3D audio_ring_dist (wpos, ppos, bufsize);
             ds->first_time =3D 0;
             old_pos =3D wpos;
             old_pos +=3D
-                millis_to_bytes (&hw->info, conf->latency_millis) - cur_=
blat;
+                usecs_to_bytes(&hw->info, dso->latency) - cur_blat;
             old_pos %=3D bufsize;
             old_pos &=3D ~hw->info.align;
         }
@@ -747,12 +742,6 @@ static int dsound_run_in (HWVoiceIn *hw)
     return decr;
 }
=20
-static DSoundConf glob_conf =3D {
-    .bufsize_in         =3D 16384,
-    .bufsize_out        =3D 16384,
-    .latency_millis     =3D 10
-};
-
 static void dsound_audio_fini (void *opaque)
 {
     HRESULT hr;
@@ -788,8 +777,17 @@ static void *dsound_audio_init(Audiodev *dev)
     int err;
     HRESULT hr;
     dsound *s =3D g_malloc0(sizeof(dsound));
+    AudiodevDsoundOptions *dso;
+
+    assert(dev->driver =3D=3D AUDIODEV_DRIVER_DSOUND);
+    s->dev =3D dev;
+    dso =3D &dev->u.dsound;
+
+    if (!dso->has_latency) {
+        dso->has_latency =3D true;
+        dso->latency =3D 10000; /* 10 ms */
+    }
=20
-    s->conf =3D glob_conf;
     hr =3D CoInitialize (NULL);
     if (FAILED (hr)) {
         dsound_logerr (hr, "Could not initialize COM\n");
@@ -854,28 +852,6 @@ static void *dsound_audio_init(Audiodev *dev)
     return s;
 }
=20
-static struct audio_option dsound_options[] =3D {
-    {
-        .name  =3D "LATENCY_MILLIS",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.latency_millis,
-        .descr =3D "(undocumented)"
-    },
-    {
-        .name  =3D "BUFSIZE_OUT",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.bufsize_out,
-        .descr =3D "(undocumented)"
-    },
-    {
-        .name  =3D "BUFSIZE_IN",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.bufsize_in,
-        .descr =3D "(undocumented)"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops dsound_pcm_ops =3D {
     .init_out =3D dsound_init_out,
     .fini_out =3D dsound_fini_out,
@@ -893,7 +869,6 @@ static struct audio_pcm_ops dsound_pcm_ops =3D {
 static struct audio_driver dsound_audio_driver =3D {
     .name           =3D "dsound",
     .descr          =3D "DirectSound http://wikipedia.org/wiki/DirectSou=
nd",
-    .options        =3D dsound_options,
     .init           =3D dsound_audio_init,
     .fini           =3D dsound_audio_fini,
     .pcm_ops        =3D &dsound_pcm_ops,
--=20
2.18.1

