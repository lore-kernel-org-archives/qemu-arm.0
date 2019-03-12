Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp170156wrs;
        Tue, 12 Mar 2019 00:32:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvJx1t6bhI1mJ6eGaXpJBHA+0OcwtOXkJjURw+bawSwBdug/lBlzPbjzky0qOdVR4NZwJC
X-Received: by 2002:a81:1a48:: with SMTP id a69mr222923ywa.507.1552375951850;
        Tue, 12 Mar 2019 00:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552375951; cv=none;
        d=google.com; s=arc-20160816;
        b=u1O9y6Rop2tAiYmstItaY09R5VpqDuy0FAJsn9tAgwNkzJg2b1nt8P7PGAAo9/H+Y7
         Wau3FlV3mP3Aa95AAeBxUixRSHAPbM8OBVuOWSWOjy3S4JiPPqgim2BQZaZ7zSVMvd2f
         S5z5ORPqZUcc7BNBzWHV+JuIKFFlMuq5p++Au104PrxoMpjY30vpQ5Af0QstuI9VFg4q
         X654qo7Bd5j3rzfccv04O9qkhXJbJLo/50Z74Kr9xdsQahG15cd69uKcxdwMHMcGHW2v
         dAzbuVuq6y4v8T7+iMs33ILrvKL34Olto2hqYMagPAJ6EdCxLmrXquO3Fr+Fi1qZhu70
         A2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Gdu3PkDl0zW+zeGu6ghNJQ3NwCfyZ3gapBUf9hBkhhU=;
        b=yXYiUYhmk62a+z30bMFqMGNNfQvb5hyodIL2gxuOqufVgyFMkqjW2xMmz6NAGeQk+B
         pwy+xJhVWe02NJpYwRgGcClJ3cgI2jrMl6ht+bfK8oh8eh0BEr8ByFrXFT1pzbENlm6M
         IIiq3ttpseffCdOwVHQI7O/vzuRGUZxctB9G0nhGHPBg9XbuVXC3uo30NPBvrM2mUblB
         QUaw27kD6xbeDwH4IKnqIDy5mRqsjW44PlBtH/ZxD3PP2RCghyeT/HO4msd0AD1zLCGr
         02+vlxK3KLU10KHr3JGbzIWZBgOJgEWZjeBqta7vnFGErvEEsYKt3hEUz7AxwNGVgBjJ
         +w1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62si4306729ywa.134.2019.03.12.00.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3btn-0002eE-3M
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:32:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btG-0002Ug-JY
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bhG-0001CP-K2
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:19:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bhE-0001B5-Qw; Tue, 12 Mar 2019 03:19:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E128B307EA93;
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 586EE60C9C;
	Tue, 12 Mar 2019 07:13:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C4A841753F; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:46 +0100
Message-Id: <20190312071250.12168-11-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 12 Mar 2019 07:13:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/14] paaudio: port to -audiodev config
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
X-TUID: SFudLHimE2VC

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: c74dc9c282075fba6928c40b2deae057fa0d4049.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_legacy.c | 38 +++++++++++++++++++++
 audio/paaudio.c      | 81 ++++++++++++++++----------------------------
 2 files changed, 67 insertions(+), 52 deletions(-)

diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 94f95bbc7318..8d7f1475b56a 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -127,6 +127,16 @@ static uint32_t samples_to_usecs(uint32_t samples,
     return frames_to_usecs(samples / channels, pdo);
 }
=20
+static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *h=
as_dst,
+                                 AudiodevPerDirectionOptions *pdo)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D samples_to_usecs(toui32(val), pdo);
+        *has_dst =3D true;
+    }
+}
+
 static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptio=
ns *pdo)
 {
     AudioFormat fmt =3D pdo->has_format ? pdo->format : AUDIO_FORMAT_S16=
;
@@ -247,6 +257,30 @@ static void handle_oss(Audiodev *dev)
     get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy)=
;
 }
=20
+/* pulseaudio */
+static void handle_pa_per_direction(
+    AudiodevPaPerDirectionOptions *ppdo, const char *env)
+{
+    get_str(env, &ppdo->name, &ppdo->has_name);
+}
+
+static void handle_pa(Audiodev *dev)
+{
+    handle_pa_per_direction(dev->u.pa.in, "QEMU_PA_SOURCE");
+    handle_pa_per_direction(dev->u.pa.out, "QEMU_PA_SINK");
+
+    get_samples_to_usecs(
+        "QEMU_PA_SAMPLES", &dev->u.pa.in->buffer_length,
+        &dev->u.pa.in->has_buffer_length,
+        qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.in));
+    get_samples_to_usecs(
+        "QEMU_PA_SAMPLES", &dev->u.pa.out->buffer_length,
+        &dev->u.pa.out->has_buffer_length,
+        qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.out));
+
+    get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -304,6 +338,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_oss(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_PA:
+        handle_pa(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/paaudio.c b/audio/paaudio.c
index d649c58e3d4c..5d410ed73f50 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -2,6 +2,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "audio.h"
+#include "qapi/opts-visitor.h"
=20
 #include <pulse/pulseaudio.h>
=20
@@ -10,14 +11,7 @@
 #include "audio_pt_int.h"
=20
 typedef struct {
-    int samples;
-    char *server;
-    char *sink;
-    char *source;
-} PAConf;
-
-typedef struct {
-    PAConf conf;
+    Audiodev *dev;
     pa_threaded_mainloop *mainloop;
     pa_context *context;
 } paaudio;
@@ -32,6 +26,7 @@ typedef struct {
     void *pcm_buf;
     struct audio_pt pt;
     paaudio *g;
+    int samples;
 } PAVoiceOut;
=20
 typedef struct {
@@ -46,6 +41,7 @@ typedef struct {
     const void *read_data;
     size_t read_index, read_length;
     paaudio *g;
+    int samples;
 } PAVoiceIn;
=20
 static void qpa_audio_fini(void *opaque);
@@ -227,7 +223,7 @@ static void *qpa_thread_out (void *arg)
             }
         }
=20
-        decr =3D to_mix =3D audio_MIN(pa->live, pa->g->conf.samples >> 5=
);
+        decr =3D to_mix =3D audio_MIN(pa->live, pa->samples >> 5);
         rpos =3D pa->rpos;
=20
         if (audio_pt_unlock(&pa->pt, __func__)) {
@@ -319,7 +315,7 @@ static void *qpa_thread_in (void *arg)
             }
         }
=20
-        incr =3D to_grab =3D audio_MIN(pa->dead, pa->g->conf.samples >> =
5);
+        incr =3D to_grab =3D audio_MIN(pa->dead, pa->samples >> 5);
         wpos =3D pa->wpos;
=20
         if (audio_pt_unlock(&pa->pt, __func__)) {
@@ -546,6 +542,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     struct audsettings obt_as =3D *as;
     PAVoiceOut *pa =3D (PAVoiceOut *) hw;
     paaudio *g =3D pa->g =3D drv_opaque;
+    AudiodevPaOptions *popts =3D &g->dev->u.pa;
+    AudiodevPaPerDirectionOptions *ppdo =3D popts->out;
=20
     ss.format =3D audfmt_to_pa (as->fmt, as->endianness);
     ss.channels =3D as->nchannels;
@@ -566,7 +564,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audset=
tings *as,
         g,
         "qemu",
         PA_STREAM_PLAYBACK,
-        g->conf.sink,
+        ppdo->has_name ? ppdo->name : NULL,
         &ss,
         NULL,                   /* channel map */
         &ba,                    /* buffering attributes */
@@ -578,7 +576,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     }
=20
     audio_pcm_init_info (&hw->info, &obt_as);
-    hw->samples =3D g->conf.samples;
+    hw->samples =3D pa->samples =3D audio_buffer_samples(
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
     pa->pcm_buf =3D audio_calloc(__func__, hw->samples, 1 << hw->info.sh=
ift);
     pa->rpos =3D hw->rpos;
     if (!pa->pcm_buf) {
@@ -612,6 +611,8 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
     struct audsettings obt_as =3D *as;
     PAVoiceIn *pa =3D (PAVoiceIn *) hw;
     paaudio *g =3D pa->g =3D drv_opaque;
+    AudiodevPaOptions *popts =3D &g->dev->u.pa;
+    AudiodevPaPerDirectionOptions *ppdo =3D popts->in;
=20
     ss.format =3D audfmt_to_pa (as->fmt, as->endianness);
     ss.channels =3D as->nchannels;
@@ -623,7 +624,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
         g,
         "qemu",
         PA_STREAM_RECORD,
-        g->conf.source,
+        ppdo->has_name ? ppdo->name : NULL,
         &ss,
         NULL,                   /* channel map */
         NULL,                   /* buffering attributes */
@@ -635,7 +636,8 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
     }
=20
     audio_pcm_init_info (&hw->info, &obt_as);
-    hw->samples =3D g->conf.samples;
+    hw->samples =3D pa->samples =3D audio_buffer_samples(
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
     pa->pcm_buf =3D audio_calloc(__func__, hw->samples, 1 << hw->info.sh=
ift);
     pa->wpos =3D hw->wpos;
     if (!pa->pcm_buf) {
@@ -808,13 +810,13 @@ static int qpa_ctl_in (HWVoiceIn *hw, int cmd, ...)
 }
=20
 /* common */
-static PAConf glob_conf =3D {
-    .samples =3D 4096,
-};
-
 static void *qpa_audio_init(Audiodev *dev)
 {
-    if (glob_conf.server =3D=3D NULL) {
+    paaudio *g;
+    AudiodevPaOptions *popts =3D &dev->u.pa;
+    const char *server;
+
+    if (!popts->has_server) {
         char pidfile[64];
         char *runtime;
         struct stat st;
@@ -829,8 +831,12 @@ static void *qpa_audio_init(Audiodev *dev)
         }
     }
=20
-    paaudio *g =3D g_malloc(sizeof(paaudio));
-    g->conf =3D glob_conf;
+    assert(dev->driver =3D=3D AUDIODEV_DRIVER_PA);
+
+    g =3D g_malloc(sizeof(paaudio));
+    server =3D popts->has_server ? popts->server : NULL;
+
+    g->dev =3D dev;
     g->mainloop =3D NULL;
     g->context =3D NULL;
=20
@@ -840,14 +846,14 @@ static void *qpa_audio_init(Audiodev *dev)
     }
=20
     g->context =3D pa_context_new (pa_threaded_mainloop_get_api (g->main=
loop),
-                                 g->conf.server);
+                                 server);
     if (!g->context) {
         goto fail;
     }
=20
     pa_context_set_state_callback (g->context, context_state_cb, g);
=20
-    if (pa_context_connect (g->context, g->conf.server, 0, NULL) < 0) {
+    if (pa_context_connect(g->context, server, 0, NULL) < 0) {
         qpa_logerr (pa_context_errno (g->context),
                     "pa_context_connect() failed\n");
         goto fail;
@@ -910,34 +916,6 @@ static void qpa_audio_fini (void *opaque)
     g_free(g);
 }
=20
-struct audio_option qpa_options[] =3D {
-    {
-        .name  =3D "SAMPLES",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.samples,
-        .descr =3D "buffer size in samples"
-    },
-    {
-        .name  =3D "SERVER",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.server,
-        .descr =3D "server address"
-    },
-    {
-        .name  =3D "SINK",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.sink,
-        .descr =3D "sink device name"
-    },
-    {
-        .name  =3D "SOURCE",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.source,
-        .descr =3D "source device name"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops qpa_pcm_ops =3D {
     .init_out =3D qpa_init_out,
     .fini_out =3D qpa_fini_out,
@@ -955,7 +933,6 @@ static struct audio_pcm_ops qpa_pcm_ops =3D {
 static struct audio_driver pa_audio_driver =3D {
     .name           =3D "pa",
     .descr          =3D "http://www.pulseaudio.org/",
-    .options        =3D qpa_options,
     .init           =3D qpa_audio_init,
     .fini           =3D qpa_audio_fini,
     .pcm_ops        =3D &qpa_pcm_ops,
--=20
2.18.1

