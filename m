Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp157196wrs;
        Tue, 12 Mar 2019 00:14:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUW+xiNG+5lFyRUJWxwrvF4DuBmtR6wq8QNj5SPXoraDlvhMbT0ws4mpM9yjPw6sPdDU4L
X-Received: by 2002:a5b:642:: with SMTP id o2mr29891106ybq.32.1552374852458;
        Tue, 12 Mar 2019 00:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552374852; cv=none;
        d=google.com; s=arc-20160816;
        b=u/eaW70xOQe7l/OF6fcyZ6qpZcxUikIsQ+yBaPKNa3o/1qrpRA9ORDNt0Yir1xAqeb
         GIdXIUQd3UcHas4jSwv2xrYQ6XB7E1NwiukwT2mRrzgm+Njz8zyUbYoXwJsEfNUGutcf
         FQEMKQ34eiO3MT5g8WUysTymA5VrnFsvSScw58l2QEXQF3eIUNqITEJnBGIY6L6kjjqG
         ino9Q2dXfHYksp56KboJcQTIrCdPirVTNmg6RcB8yNChNE740u2oM++zf57LGMBH9RVb
         cYFpJOsSU6bub4BODdr2ypGMMtnsIwNbYX4qcNKxwleMuEWmXLs5PnrtTxBeUP7AQdYJ
         UBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=t3lm0wa4ISwR1toJCwVl8D05NWVHZ8UB+6ctz6HPdZQ=;
        b=YQgb3x2G9eLm6UY+7Pt+rwN14lIPdKFm+w2wDDVTBBMGzF/LGGI3OB0933U4ASZIxt
         Trye74SRwnNA13WwRQQyWcLXnrmyTcTIlEM+YtQiHIHee/tK5dp83HA6q0sB7uBnf8ss
         dk06bv7wrXBoXXdGJoee5gjwSWECdT04fx6ZGe98xTcw5jJ52mz5RD8FO0Q6MuoQeiJE
         98hVr0TG0v4X51Rtz9hnxSYay7gvF7Hm2l2nrXk8UZ0TtgzaIiJaLMTfmurGEUK4Pagj
         H71SJQ0qWcAoAKnxumivenME91GfBox26ggSpxXyqt3A/N9MAyVzvP0byBa400gAGnRM
         rRKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si4780395ywa.41.2019.03.12.00.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bc3-0005um-RE
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:14:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb4-0005Xm-Bl
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb0-0006EU-3b
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1h3baz-0006DX-9d
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:13:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F793082E05;
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1FF019724;
	Tue, 12 Mar 2019 07:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 89E1517538; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:40 +0100
Message-Id: <20190312071250.12168-5-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/14] audio: -audiodev command line option
 basic implementation
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
X-TUID: IZTrRM4AWPV6

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Audio drivers now get an Audiodev * as config paramters, instead of the
global audio_option structs.  There is some code in audio/audio_legacy.c
that converts the old environment variables to audiodev options (this
way backends do not have to worry about legacy options).  It also
contains a replacement of -audio-help, which prints out the equivalent
-audiodev based config of the currently specified environment variables.

Note that backends are not updated and still rely on environment
variables.

Also note that (due to moving try-poll from global to backend specific
option) currently ALSA and OSS will always try poll mode, regardless of
environment variables or -audiodev options.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: e99a7cbdac0d13512743880660b2032024703e4c.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.h          |  18 +-
 audio/audio_int.h      |  20 +-
 audio/audio_template.h |  42 ++-
 audio/alsaaudio.c      |   2 +-
 audio/audio.c          | 630 ++++++++++++++++++-----------------------
 audio/audio_legacy.c   | 293 +++++++++++++++++++
 audio/coreaudio.c      |   2 +-
 audio/dsoundaudio.c    |   2 +-
 audio/noaudio.c        |   2 +-
 audio/ossaudio.c       |   2 +-
 audio/paaudio.c        |   2 +-
 audio/sdlaudio.c       |   2 +-
 audio/spiceaudio.c     |   2 +-
 audio/wavaudio.c       |   2 +-
 vl.c                   |   7 +-
 audio/Makefile.objs    |   2 +-
 16 files changed, 650 insertions(+), 380 deletions(-)
 create mode 100644 audio/audio_legacy.c

diff --git a/audio/audio.h b/audio/audio.h
index 02f29a3b3ef7..64b0f761bcaa 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -36,12 +36,21 @@ typedef void (*audio_callback_fn) (void *opaque, int =
avail);
 #define AUDIO_HOST_ENDIANNESS 0
 #endif
=20
-struct audsettings {
+typedef struct audsettings {
     int freq;
     int nchannels;
     AudioFormat fmt;
     int endianness;
-};
+} audsettings;
+
+audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo);
+int audioformat_bytes_per_sample(AudioFormat fmt);
+int audio_buffer_frames(AudiodevPerDirectionOptions *pdo,
+                        audsettings *as, int def_usecs);
+int audio_buffer_samples(AudiodevPerDirectionOptions *pdo,
+                         audsettings *as, int def_usecs);
+int audio_buffer_bytes(AudiodevPerDirectionOptions *pdo,
+                       audsettings *as, int def_usecs);
=20
 typedef enum {
     AUD_CNOTIFY_ENABLE,
@@ -81,7 +90,6 @@ typedef struct QEMUAudioTimeStamp {
 void AUD_vlog (const char *cap, const char *fmt, va_list ap) GCC_FMT_ATT=
R(2, 0);
 void AUD_log (const char *cap, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
=20
-void AUD_help (void);
 void AUD_register_card (const char *name, QEMUSoundCard *card);
 void AUD_remove_card (QEMUSoundCard *card);
 CaptureVoiceOut *AUD_add_capture (
@@ -163,4 +171,8 @@ void audio_sample_to_uint64(void *samples, int pos,
 void audio_sample_from_uint64(void *samples, int pos,
                             uint64_t left, uint64_t right);
=20
+void audio_parse_option(const char *opt);
+void audio_init_audiodevs(void);
+void audio_legacy_help(void);
+
 #endif /* QEMU_AUDIO_H */
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 6c451b995ccc..7bf5dfc0b5f6 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -146,7 +146,7 @@ struct audio_driver {
     const char *name;
     const char *descr;
     struct audio_option *options;
-    void *(*init) (void);
+    void *(*init) (Audiodev *);
     void (*fini) (void *);
     struct audio_pcm_ops *pcm_ops;
     int can_be_default;
@@ -193,6 +193,7 @@ struct SWVoiceCap {
=20
 typedef struct AudioState {
     struct audio_driver *drv;
+    Audiodev *dev;
     void *drv_opaque;
=20
     QEMUTimer *ts;
@@ -203,10 +204,13 @@ typedef struct AudioState {
     int nb_hw_voices_out;
     int nb_hw_voices_in;
     int vm_running;
+    int64_t period_ticks;
 } AudioState;
=20
 extern const struct mixeng_volume nominal_volume;
=20
+extern const char *audio_prio_list[];
+
 void audio_driver_register(audio_driver *drv);
 audio_driver *audio_driver_lookup(const char *name);
=20
@@ -248,4 +252,18 @@ static inline int audio_ring_dist (int dst, int src,=
 int len)
 #define AUDIO_STRINGIFY_(n) #n
 #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
=20
+typedef struct AudiodevListEntry {
+    Audiodev *dev;
+    QSIMPLEQ_ENTRY(AudiodevListEntry) next;
+} AudiodevListEntry;
+
+typedef QSIMPLEQ_HEAD(, AudiodevListEntry) AudiodevListHead;
+AudiodevListHead audio_handle_legacy_opts(void);
+
+void audio_free_audiodev_list(AudiodevListHead *head);
+
+void audio_create_pdos(Audiodev *dev);
+AudiodevPerDirectionOptions *audio_get_pdo_in(Audiodev *dev);
+AudiodevPerDirectionOptions *audio_get_pdo_out(Audiodev *dev);
+
 #endif /* QEMU_AUDIO_INT_H */
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7de227d2d10c..1232bb54db0e 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -299,11 +299,42 @@ static HW *glue (audio_pcm_hw_add_new_, TYPE) (stru=
ct audsettings *as)
     return NULL;
 }
=20
+AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
+{
+    switch (dev->driver) {
+    case AUDIODEV_DRIVER_NONE:
+        return dev->u.none.TYPE;
+    case AUDIODEV_DRIVER_ALSA:
+        return qapi_AudiodevAlsaPerDirectionOptions_base(dev->u.alsa.TYP=
E);
+    case AUDIODEV_DRIVER_COREAUDIO:
+        return qapi_AudiodevCoreaudioPerDirectionOptions_base(
+            dev->u.coreaudio.TYPE);
+    case AUDIODEV_DRIVER_DSOUND:
+        return dev->u.dsound.TYPE;
+    case AUDIODEV_DRIVER_OSS:
+        return qapi_AudiodevOssPerDirectionOptions_base(dev->u.oss.TYPE)=
;
+    case AUDIODEV_DRIVER_PA:
+        return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
+    case AUDIODEV_DRIVER_SDL:
+        return dev->u.sdl.TYPE;
+    case AUDIODEV_DRIVER_SPICE:
+        return dev->u.spice.TYPE;
+    case AUDIODEV_DRIVER_WAV:
+        return dev->u.wav.TYPE;
+
+    case AUDIODEV_DRIVER__MAX:
+        break;
+    }
+    abort();
+}
+
 static HW *glue (audio_pcm_hw_add_, TYPE) (struct audsettings *as)
 {
     HW *hw;
+    AudioState *s =3D &glob_audio_state;
+    AudiodevPerDirectionOptions *pdo =3D glue(audio_get_pdo_, TYPE)(s->d=
ev);
=20
-    if (glue (conf.fixed_, TYPE).enabled && glue (conf.fixed_, TYPE).gre=
edy) {
+    if (pdo->fixed_settings) {
         hw =3D glue (audio_pcm_hw_add_new_, TYPE) (as);
         if (hw) {
             return hw;
@@ -331,9 +362,11 @@ static SW *glue (audio_pcm_create_voice_pair_, TYPE)=
 (
     SW *sw;
     HW *hw;
     struct audsettings hw_as;
+    AudioState *s =3D &glob_audio_state;
+    AudiodevPerDirectionOptions *pdo =3D glue(audio_get_pdo_, TYPE)(s->d=
ev);
=20
-    if (glue (conf.fixed_, TYPE).enabled) {
-        hw_as =3D glue (conf.fixed_, TYPE).settings;
+    if (pdo->fixed_settings) {
+        hw_as =3D audiodev_to_audsettings(pdo);
     }
     else {
         hw_as =3D *as;
@@ -398,6 +431,7 @@ SW *glue (AUD_open_, TYPE) (
     )
 {
     AudioState *s =3D &glob_audio_state;
+    AudiodevPerDirectionOptions *pdo =3D glue(audio_get_pdo_, TYPE)(s->d=
ev);
=20
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=3D%p name=3D%p callback_fn=3D%p as=3D%p\n",
@@ -422,7 +456,7 @@ SW *glue (AUD_open_, TYPE) (
         return sw;
     }
=20
-    if (!glue (conf.fixed_, TYPE).enabled && sw) {
+    if (!pdo->fixed_settings && sw) {
         glue (AUD_close_, TYPE) (card, sw);
         sw =3D NULL;
     }
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 5bd034267fce..8302f3e882d7 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -1125,7 +1125,7 @@ static ALSAConf glob_conf =3D {
     .pcm_name_in =3D "default",
 };
=20
-static void *alsa_audio_init (void)
+static void *alsa_audio_init(Audiodev *dev)
 {
     ALSAConf *conf =3D g_malloc(sizeof(ALSAConf));
     *conf =3D glob_conf;
diff --git a/audio/audio.c b/audio/audio.c
index 77216e50102e..79ed36066604 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -26,6 +26,9 @@
 #include "audio.h"
 #include "monitor/monitor.h"
 #include "qemu/timer.h"
+#include "qapi/error.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-audio.h"
 #include "sysemu/sysemu.h"
 #include "qemu/cutils.h"
 #include "sysemu/replay.h"
@@ -46,14 +49,16 @@
    The 1st one is the one used by default, that is the reason
     that we generate the list.
 */
-static const char *audio_prio_list[] =3D {
+const char *audio_prio_list[] =3D {
     "spice",
     CONFIG_AUDIO_DRIVERS
     "none",
     "wav",
+    NULL
 };
=20
 static QLIST_HEAD(, audio_driver) audio_drivers;
+static AudiodevListHead audiodevs =3D QSIMPLEQ_HEAD_INITIALIZER(audiodev=
s);
=20
 void audio_driver_register(audio_driver *drv)
 {
@@ -80,61 +85,6 @@ audio_driver *audio_driver_lookup(const char *name)
     return NULL;
 }
=20
-static void audio_module_load_all(void)
-{
-    int i;
-
-    for (i =3D 0; i < ARRAY_SIZE(audio_prio_list); i++) {
-        audio_driver_lookup(audio_prio_list[i]);
-    }
-}
-
-struct fixed_settings {
-    int enabled;
-    int nb_voices;
-    int greedy;
-    struct audsettings settings;
-};
-
-static struct {
-    struct fixed_settings fixed_out;
-    struct fixed_settings fixed_in;
-    union {
-        int hertz;
-        int64_t ticks;
-    } period;
-    int try_poll_in;
-    int try_poll_out;
-} conf =3D {
-    .fixed_out =3D { /* DAC fixed settings */
-        .enabled =3D 1,
-        .nb_voices =3D 1,
-        .greedy =3D 1,
-        .settings =3D {
-            .freq =3D 44100,
-            .nchannels =3D 2,
-            .fmt =3D AUDIO_FORMAT_S16,
-            .endianness =3D  AUDIO_HOST_ENDIANNESS,
-        }
-    },
-
-    .fixed_in =3D { /* ADC fixed settings */
-        .enabled =3D 1,
-        .nb_voices =3D 1,
-        .greedy =3D 1,
-        .settings =3D {
-            .freq =3D 44100,
-            .nchannels =3D 2,
-            .fmt =3D AUDIO_FORMAT_S16,
-            .endianness =3D AUDIO_HOST_ENDIANNESS,
-        }
-    },
-
-    .period =3D { .hertz =3D 100 },
-    .try_poll_in =3D 1,
-    .try_poll_out =3D 1,
-};
-
 static AudioState glob_audio_state;
=20
 const struct mixeng_volume nominal_volume =3D {
@@ -151,9 +101,6 @@ const struct mixeng_volume nominal_volume =3D {
 #ifdef AUDIO_IS_FLAWLESS_AND_NO_CHECKS_ARE_REQURIED
 #error No its not
 #else
-static void audio_print_options (const char *prefix,
-                                 struct audio_option *opt);
-
 int audio_bug (const char *funcname, int cond)
 {
     if (cond) {
@@ -161,16 +108,9 @@ int audio_bug (const char *funcname, int cond)
=20
         AUD_log (NULL, "A bug was just triggered in %s\n", funcname);
         if (!shown) {
-            struct audio_driver *d;
-
             shown =3D 1;
             AUD_log (NULL, "Save all your work and restart without audio=
\n");
-            AUD_log (NULL, "Please send bug report to av1474@comtv.ru\n"=
);
             AUD_log (NULL, "I am sorry\n");
-            d =3D glob_audio_state.drv;
-            if (d) {
-                audio_print_options (d->name, d->options);
-            }
         }
         AUD_log (NULL, "Context:\n");
=20
@@ -232,31 +172,6 @@ void *audio_calloc (const char *funcname, int nmemb,=
 size_t size)
     return g_malloc0 (len);
 }
=20
-static char *audio_alloc_prefix (const char *s)
-{
-    const char qemu_prefix[] =3D "QEMU_";
-    size_t len, i;
-    char *r, *u;
-
-    if (!s) {
-        return NULL;
-    }
-
-    len =3D strlen (s);
-    r =3D g_malloc (len + sizeof (qemu_prefix));
-
-    u =3D r + sizeof (qemu_prefix) - 1;
-
-    pstrcpy (r, len + sizeof (qemu_prefix), qemu_prefix);
-    pstrcat (r, len + sizeof (qemu_prefix), s);
-
-    for (i =3D 0; i < len; ++i) {
-        u[i] =3D qemu_toupper(u[i]);
-    }
-
-    return r;
-}
-
 static const char *audio_audfmt_to_string (AudioFormat fmt)
 {
     switch (fmt) {
@@ -382,78 +297,6 @@ void AUD_log (const char *cap, const char *fmt, ...)
     va_end (ap);
 }
=20
-static void audio_print_options (const char *prefix,
-                                 struct audio_option *opt)
-{
-    char *uprefix;
-
-    if (!prefix) {
-        dolog ("No prefix specified\n");
-        return;
-    }
-
-    if (!opt) {
-        dolog ("No options\n");
-        return;
-    }
-
-    uprefix =3D audio_alloc_prefix (prefix);
-
-    for (; opt->name; opt++) {
-        const char *state =3D "default";
-        printf ("  %s_%s: ", uprefix, opt->name);
-
-        if (opt->overriddenp && *opt->overriddenp) {
-            state =3D "current";
-        }
-
-        switch (opt->tag) {
-        case AUD_OPT_BOOL:
-            {
-                int *intp =3D opt->valp;
-                printf ("boolean, %s =3D %d\n", state, *intp ? 1 : 0);
-            }
-            break;
-
-        case AUD_OPT_INT:
-            {
-                int *intp =3D opt->valp;
-                printf ("integer, %s =3D %d\n", state, *intp);
-            }
-            break;
-
-        case AUD_OPT_FMT:
-            {
-                AudioFormat *fmtp =3D opt->valp;
-                printf (
-                    "format, %s =3D %s, (one of: U8 S8 U16 S16 U32 S32)\=
n",
-                    state,
-                    audio_audfmt_to_string (*fmtp)
-                    );
-            }
-            break;
-
-        case AUD_OPT_STR:
-            {
-                const char **strp =3D opt->valp;
-                printf ("string, %s =3D %s\n",
-                        state,
-                        *strp ? *strp : "(not set)");
-            }
-            break;
-
-        default:
-            printf ("???\n");
-            dolog ("Bad value tag for option %s_%s %d\n",
-                   uprefix, opt->name, opt->tag);
-            break;
-        }
-        printf ("    %s\n", opt->descr);
-    }
-
-    g_free (uprefix);
-}
-
 static void audio_process_options (const char *prefix,
                                    struct audio_option *opt)
 {
@@ -1141,11 +984,11 @@ static void audio_reset_timer (AudioState *s)
 {
     if (audio_is_timer_needed ()) {
         timer_mod_anticipate_ns(s->ts,
-            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + conf.period.ticks);
+            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + s->period_ticks);
         if (!audio_timer_running) {
             audio_timer_running =3D true;
             audio_timer_last =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-            trace_audio_timer_start(conf.period.ticks / SCALE_MS);
+            trace_audio_timer_start(s->period_ticks / SCALE_MS);
         }
     } else {
         timer_del(s->ts);
@@ -1159,16 +1002,17 @@ static void audio_reset_timer (AudioState *s)
 static void audio_timer (void *opaque)
 {
     int64_t now, diff;
+    AudioState *s =3D opaque;
=20
     now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     diff =3D now - audio_timer_last;
-    if (diff > conf.period.ticks * 3 / 2) {
+    if (diff > s->period_ticks * 3 / 2) {
         trace_audio_timer_delayed(diff / SCALE_MS);
     }
     audio_timer_last =3D now;
=20
-    audio_run ("timer");
-    audio_reset_timer (opaque);
+    audio_run("timer");
+    audio_reset_timer(s);
 }
=20
 /*
@@ -1228,7 +1072,7 @@ void AUD_set_active_out (SWVoiceOut *sw, int on)
             if (!hw->enabled) {
                 hw->enabled =3D 1;
                 if (s->vm_running) {
-                    hw->pcm_ops->ctl_out (hw, VOICE_ENABLE, conf.try_pol=
l_out);
+                    hw->pcm_ops->ctl_out(hw, VOICE_ENABLE, true);
                     audio_reset_timer (s);
                 }
             }
@@ -1273,7 +1117,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
             if (!hw->enabled) {
                 hw->enabled =3D 1;
                 if (s->vm_running) {
-                    hw->pcm_ops->ctl_in (hw, VOICE_ENABLE, conf.try_poll=
_in);
+                    hw->pcm_ops->ctl_in(hw, VOICE_ENABLE, true);
                     audio_reset_timer (s);
                 }
             }
@@ -1594,169 +1438,13 @@ void audio_run (const char *msg)
 #endif
 }
=20
-static struct audio_option audio_options[] =3D {
-    /* DAC */
-    {
-        .name  =3D "DAC_FIXED_SETTINGS",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &conf.fixed_out.enabled,
-        .descr =3D "Use fixed settings for host DAC"
-    },
-    {
-        .name  =3D "DAC_FIXED_FREQ",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_out.settings.freq,
-        .descr =3D "Frequency for fixed host DAC"
-    },
-    {
-        .name  =3D "DAC_FIXED_FMT",
-        .tag   =3D AUD_OPT_FMT,
-        .valp  =3D &conf.fixed_out.settings.fmt,
-        .descr =3D "Format for fixed host DAC"
-    },
-    {
-        .name  =3D "DAC_FIXED_CHANNELS",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_out.settings.nchannels,
-        .descr =3D "Number of channels for fixed DAC (1 - mono, 2 - ster=
eo)"
-    },
-    {
-        .name  =3D "DAC_VOICES",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_out.nb_voices,
-        .descr =3D "Number of voices for DAC"
-    },
-    {
-        .name  =3D "DAC_TRY_POLL",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &conf.try_poll_out,
-        .descr =3D "Attempt using poll mode for DAC"
-    },
-    /* ADC */
-    {
-        .name  =3D "ADC_FIXED_SETTINGS",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &conf.fixed_in.enabled,
-        .descr =3D "Use fixed settings for host ADC"
-    },
-    {
-        .name  =3D "ADC_FIXED_FREQ",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_in.settings.freq,
-        .descr =3D "Frequency for fixed host ADC"
-    },
-    {
-        .name  =3D "ADC_FIXED_FMT",
-        .tag   =3D AUD_OPT_FMT,
-        .valp  =3D &conf.fixed_in.settings.fmt,
-        .descr =3D "Format for fixed host ADC"
-    },
-    {
-        .name  =3D "ADC_FIXED_CHANNELS",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_in.settings.nchannels,
-        .descr =3D "Number of channels for fixed ADC (1 - mono, 2 - ster=
eo)"
-    },
-    {
-        .name  =3D "ADC_VOICES",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.fixed_in.nb_voices,
-        .descr =3D "Number of voices for ADC"
-    },
-    {
-        .name  =3D "ADC_TRY_POLL",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &conf.try_poll_in,
-        .descr =3D "Attempt using poll mode for ADC"
-    },
-    /* Misc */
-    {
-        .name  =3D "TIMER_PERIOD",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.period.hertz,
-        .descr =3D "Timer period in HZ (0 - use lowest possible)"
-    },
-    { /* End of list */ }
-};
-
-static void audio_pp_nb_voices (const char *typ, int nb)
-{
-    switch (nb) {
-    case 0:
-        printf ("Does not support %s\n", typ);
-        break;
-    case 1:
-        printf ("One %s voice\n", typ);
-        break;
-    case INT_MAX:
-        printf ("Theoretically supports many %s voices\n", typ);
-        break;
-    default:
-        printf ("Theoretically supports up to %d %s voices\n", nb, typ);
-        break;
-    }
-
-}
-
-void AUD_help (void)
-{
-    struct audio_driver *d;
-
-    /* make sure we print the help text for modular drivers too */
-    audio_module_load_all();
-
-    audio_process_options ("AUDIO", audio_options);
-    QLIST_FOREACH(d, &audio_drivers, next) {
-        if (d->options) {
-            audio_process_options (d->name, d->options);
-        }
-    }
-
-    printf ("Audio options:\n");
-    audio_print_options ("AUDIO", audio_options);
-    printf ("\n");
-
-    printf ("Available drivers:\n");
-
-    QLIST_FOREACH(d, &audio_drivers, next) {
-
-        printf ("Name: %s\n", d->name);
-        printf ("Description: %s\n", d->descr);
-
-        audio_pp_nb_voices ("playback", d->max_voices_out);
-        audio_pp_nb_voices ("capture", d->max_voices_in);
-
-        if (d->options) {
-            printf ("Options:\n");
-            audio_print_options (d->name, d->options);
-        }
-        else {
-            printf ("No options\n");
-        }
-        printf ("\n");
-    }
-
-    printf (
-        "Options are settable through environment variables.\n"
-        "Example:\n"
-#ifdef _WIN32
-        "  set QEMU_AUDIO_DRV=3Dwav\n"
-        "  set QEMU_WAV_PATH=3Dc:\\tune.wav\n"
-#else
-        "  export QEMU_AUDIO_DRV=3Dwav\n"
-        "  export QEMU_WAV_PATH=3D$HOME/tune.wav\n"
-        "(for csh replace export with setenv in the above)\n"
-#endif
-        "  qemu ...\n\n"
-        );
-}
-
-static int audio_driver_init(AudioState *s, struct audio_driver *drv, bo=
ol msg)
+static int audio_driver_init(AudioState *s, struct audio_driver *drv,
+                             bool msg, Audiodev *dev)
 {
     if (drv->options) {
         audio_process_options (drv->name, drv->options);
     }
-    s->drv_opaque =3D drv->init ();
+    s->drv_opaque =3D drv->init(dev);
=20
     if (s->drv_opaque) {
         audio_init_nb_voices_out (drv);
@@ -1782,11 +1470,11 @@ static void audio_vm_change_state_handler (void *=
opaque, int running,
=20
     s->vm_running =3D running;
     while ((hwo =3D audio_pcm_hw_find_any_enabled_out (hwo))) {
-        hwo->pcm_ops->ctl_out (hwo, op, conf.try_poll_out);
+        hwo->pcm_ops->ctl_out(hwo, op, true);
     }
=20
     while ((hwi =3D audio_pcm_hw_find_any_enabled_in (hwi))) {
-        hwi->pcm_ops->ctl_in (hwi, op, conf.try_poll_in);
+        hwi->pcm_ops->ctl_in(hwi, op, true);
     }
     audio_reset_timer (s);
 }
@@ -1836,6 +1524,11 @@ void audio_cleanup(void)
         s->drv->fini (s->drv_opaque);
         s->drv =3D NULL;
     }
+
+    if (s->dev) {
+        qapi_free_Audiodev(s->dev);
+        s->dev =3D NULL;
+    }
 }
=20
 static const VMStateDescription vmstate_audio =3D {
@@ -1847,19 +1540,58 @@ static const VMStateDescription vmstate_audio =3D=
 {
     }
 };
=20
-static void audio_init (void)
+static void audio_validate_opts(Audiodev *dev, Error **errp);
+
+static AudiodevListEntry *audiodev_find(
+    AudiodevListHead *head, const char *drvname)
+{
+    AudiodevListEntry *e;
+    QSIMPLEQ_FOREACH(e, head, next) {
+        if (strcmp(AudiodevDriver_str(e->dev->driver), drvname) =3D=3D 0=
) {
+            return e;
+        }
+    }
+
+    return NULL;
+}
+
+static int audio_init(Audiodev *dev)
 {
     size_t i;
     int done =3D 0;
-    const char *drvname;
+    const char *drvname =3D NULL;
     VMChangeStateEntry *e;
     AudioState *s =3D &glob_audio_state;
     struct audio_driver *driver;
+    /* silence gcc warning about uninitialized variable */
+    AudiodevListHead head =3D QSIMPLEQ_HEAD_INITIALIZER(head);
=20
     if (s->drv) {
-        return;
+        if (dev) {
+            dolog("Cannot create more than one audio backend, sorry\n");
+            qapi_free_Audiodev(dev);
+        }
+        return -1;
     }
=20
+    if (dev) {
+        /* -audiodev option */
+        drvname =3D AudiodevDriver_str(dev->driver);
+    } else {
+        /* legacy implicit initialization */
+        head =3D audio_handle_legacy_opts();
+        /*
+         * In case of legacy initialization, all Audiodevs in the list w=
ill have
+         * the same configuration (except the driver), so it does't matt=
er which
+         * one we chose.  We need an Audiodev to set up AudioState befor=
e we can
+         * init a driver.  Also note that dev at this point is still in =
the
+         * list.
+         */
+        dev =3D QSIMPLEQ_FIRST(&head)->dev;
+        audio_validate_opts(dev, &error_abort);
+    }
+    s->dev =3D dev;
+
     QLIST_INIT (&s->hw_head_out);
     QLIST_INIT (&s->hw_head_in);
     QLIST_INIT (&s->cap_head);
@@ -1867,10 +1599,8 @@ static void audio_init (void)
=20
     s->ts =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
=20
-    audio_process_options ("AUDIO", audio_options);
-
-    s->nb_hw_voices_out =3D conf.fixed_out.nb_voices;
-    s->nb_hw_voices_in =3D conf.fixed_in.nb_voices;
+    s->nb_hw_voices_out =3D audio_get_pdo_out(dev)->voices;
+    s->nb_hw_voices_in =3D audio_get_pdo_in(dev)->voices;
=20
     if (s->nb_hw_voices_out <=3D 0) {
         dolog ("Bogus number of playback voices %d, setting to 1\n",
@@ -1884,46 +1614,42 @@ static void audio_init (void)
         s->nb_hw_voices_in =3D 0;
     }
=20
-    {
-        int def;
-        drvname =3D audio_get_conf_str ("QEMU_AUDIO_DRV", NULL, &def);
-    }
-
     if (drvname) {
         driver =3D audio_driver_lookup(drvname);
         if (driver) {
-            done =3D !audio_driver_init(s, driver, true);
+            done =3D !audio_driver_init(s, driver, true, dev);
         } else {
             dolog ("Unknown audio driver `%s'\n", drvname);
-            dolog ("Run with -audio-help to list available drivers\n");
         }
-    }
-
-    if (!done) {
-        for (i =3D 0; !done && i < ARRAY_SIZE(audio_prio_list); i++) {
+    } else {
+        for (i =3D 0; audio_prio_list[i]; i++) {
+            AudiodevListEntry *e =3D audiodev_find(&head, audio_prio_lis=
t[i]);
             driver =3D audio_driver_lookup(audio_prio_list[i]);
-            if (driver && driver->can_be_default) {
-                done =3D !audio_driver_init(s, driver, false);
+
+            if (e && driver) {
+                s->dev =3D dev =3D e->dev;
+                audio_validate_opts(dev, &error_abort);
+                done =3D !audio_driver_init(s, driver, false, dev);
+                if (done) {
+                    e->dev =3D NULL;
+                    break;
+                }
             }
         }
     }
+    audio_free_audiodev_list(&head);
=20
     if (!done) {
         driver =3D audio_driver_lookup("none");
-        done =3D !audio_driver_init(s, driver, false);
+        done =3D !audio_driver_init(s, driver, false, dev);
         assert(done);
         dolog("warning: Using timer based audio emulation\n");
     }
=20
-    if (conf.period.hertz <=3D 0) {
-        if (conf.period.hertz < 0) {
-            dolog ("warning: Timer period is negative - %d "
-                   "treating as zero\n",
-                   conf.period.hertz);
-        }
-        conf.period.ticks =3D 1;
+    if (dev->timer_period <=3D 0) {
+        s->period_ticks =3D 1;
     } else {
-        conf.period.ticks =3D NANOSECONDS_PER_SECOND / conf.period.hertz=
;
+        s->period_ticks =3D NANOSECONDS_PER_SECOND / dev->timer_period;
     }
=20
     e =3D qemu_add_vm_change_state_handler (audio_vm_change_state_handle=
r, s);
@@ -1934,11 +1660,22 @@ static void audio_init (void)
=20
     QLIST_INIT (&s->card_head);
     vmstate_register (NULL, 0, &vmstate_audio, s);
+    return 0;
+}
+
+void audio_free_audiodev_list(AudiodevListHead *head)
+{
+    AudiodevListEntry *e;
+    while ((e =3D QSIMPLEQ_FIRST(head))) {
+        QSIMPLEQ_REMOVE_HEAD(head, next);
+        qapi_free_Audiodev(e->dev);
+        g_free(e);
+    }
 }
=20
 void AUD_register_card (const char *name, QEMUSoundCard *card)
 {
-    audio_init ();
+    audio_init(NULL);
     card->name =3D g_strdup (name);
     memset (&card->entries, 0, sizeof (card->entries));
     QLIST_INSERT_HEAD (&glob_audio_state.card_head, card, entries);
@@ -2078,3 +1815,174 @@ void AUD_set_volume_in (SWVoiceIn *sw, int mute, =
uint8_t lvol, uint8_t rvol)
         }
     }
 }
+
+void audio_create_pdos(Audiodev *dev)
+{
+    switch (dev->driver) {
+#define CASE(DRIVER, driver, pdo_name)                              \
+    case AUDIODEV_DRIVER_##DRIVER:                                  \
+        if (!dev->u.driver.has_in) {                                \
+            dev->u.driver.in =3D g_malloc0(                           \
+                sizeof(Audiodev##pdo_name##PerDirectionOptions));   \
+            dev->u.driver.has_in =3D true;                            \
+        }                                                           \
+        if (!dev->u.driver.has_out) {                               \
+            dev->u.driver.out =3D g_malloc0(                          \
+                sizeof(AudiodevAlsaPerDirectionOptions));           \
+            dev->u.driver.has_out =3D true;                           \
+        }                                                           \
+        break
+
+        CASE(NONE, none, );
+        CASE(ALSA, alsa, Alsa);
+        CASE(COREAUDIO, coreaudio, Coreaudio);
+        CASE(DSOUND, dsound, );
+        CASE(OSS, oss, Oss);
+        CASE(PA, pa, Pa);
+        CASE(SDL, sdl, );
+        CASE(SPICE, spice, );
+        CASE(WAV, wav, );
+
+    case AUDIODEV_DRIVER__MAX:
+        abort();
+    };
+}
+
+static void audio_validate_per_direction_opts(
+    AudiodevPerDirectionOptions *pdo, Error **errp)
+{
+    if (!pdo->has_fixed_settings) {
+        pdo->has_fixed_settings =3D true;
+        pdo->fixed_settings =3D true;
+    }
+    if (!pdo->fixed_settings &&
+        (pdo->has_frequency || pdo->has_channels || pdo->has_format)) {
+        error_setg(errp,
+                   "You can't use frequency, channels or format with fix=
ed-settings=3Doff");
+        return;
+    }
+
+    if (!pdo->has_frequency) {
+        pdo->has_frequency =3D true;
+        pdo->frequency =3D 44100;
+    }
+    if (!pdo->has_channels) {
+        pdo->has_channels =3D true;
+        pdo->channels =3D 2;
+    }
+    if (!pdo->has_voices) {
+        pdo->has_voices =3D true;
+        pdo->voices =3D 1;
+    }
+    if (!pdo->has_format) {
+        pdo->has_format =3D true;
+        pdo->format =3D AUDIO_FORMAT_S16;
+    }
+}
+
+static void audio_validate_opts(Audiodev *dev, Error **errp)
+{
+    Error *err =3D NULL;
+
+    audio_create_pdos(dev);
+
+    audio_validate_per_direction_opts(audio_get_pdo_in(dev), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    audio_validate_per_direction_opts(audio_get_pdo_out(dev), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (!dev->has_timer_period) {
+        dev->has_timer_period =3D true;
+        dev->timer_period =3D 10000; /* 100Hz -> 10ms */
+    }
+}
+
+void audio_parse_option(const char *opt)
+{
+    AudiodevListEntry *e;
+    Audiodev *dev =3D NULL;
+
+    Visitor *v =3D qobject_input_visitor_new_str(opt, "driver", &error_f=
atal);
+    visit_type_Audiodev(v, NULL, &dev, &error_fatal);
+    visit_free(v);
+
+    audio_validate_opts(dev, &error_fatal);
+
+    e =3D g_malloc0(sizeof(AudiodevListEntry));
+    e->dev =3D dev;
+    QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
+}
+
+void audio_init_audiodevs(void)
+{
+    AudiodevListEntry *e;
+
+    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
+        audio_init(e->dev);
+    }
+}
+
+audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo)
+{
+    return (audsettings) {
+        .freq =3D pdo->frequency,
+        .nchannels =3D pdo->channels,
+        .fmt =3D pdo->format,
+        .endianness =3D AUDIO_HOST_ENDIANNESS,
+    };
+}
+
+int audioformat_bytes_per_sample(AudioFormat fmt)
+{
+    switch (fmt) {
+    case AUDIO_FORMAT_U8:
+    case AUDIO_FORMAT_S8:
+        return 1;
+
+    case AUDIO_FORMAT_U16:
+    case AUDIO_FORMAT_S16:
+        return 2;
+
+    case AUDIO_FORMAT_U32:
+    case AUDIO_FORMAT_S32:
+        return 4;
+
+    case AUDIO_FORMAT__MAX:
+        ;
+    }
+    abort();
+}
+
+
+/* frames =3D freq * usec / 1e6 */
+int audio_buffer_frames(AudiodevPerDirectionOptions *pdo,
+                        audsettings *as, int def_usecs)
+{
+    uint64_t usecs =3D pdo->has_buffer_length ? pdo->buffer_length : def=
_usecs;
+    return (as->freq * usecs + 500000) / 1000000;
+}
+
+/* samples =3D channels * frames =3D channels * freq * usec / 1e6 */
+int audio_buffer_samples(AudiodevPerDirectionOptions *pdo,
+                         audsettings *as, int def_usecs)
+{
+    return as->nchannels * audio_buffer_frames(pdo, as, def_usecs);
+}
+
+/*
+ * bytes =3D bytes_per_sample * samples =3D
+ *     bytes_per_sample * channels * freq * usec / 1e6
+ */
+int audio_buffer_bytes(AudiodevPerDirectionOptions *pdo,
+                       audsettings *as, int def_usecs)
+{
+    return audio_buffer_samples(pdo, as, def_usecs) *
+        audioformat_bytes_per_sample(as->fmt);
+}
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
new file mode 100644
index 000000000000..ad3b781addf8
--- /dev/null
+++ b/audio/audio_legacy.c
@@ -0,0 +1,293 @@
+/*
+ * QEMU Audio subsystem: legacy configuration handling
+ *
+ * Copyright (c) 2015-2019 Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3 <DirtY.iCE.=
hu@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "audio.h"
+#include "audio_int.h"
+#include "qemu-common.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-audio.h"
+#include "qapi/visitor-impl.h"
+
+#define AUDIO_CAP "audio-legacy"
+#include "audio_int.h"
+
+static uint32_t toui32(const char *str)
+{
+    unsigned long long ret;
+    if (parse_uint_full(str, &ret, 10) || ret > UINT32_MAX) {
+        dolog("Invalid integer value `%s'\n", str);
+        exit(1);
+    }
+    return ret;
+}
+
+/* helper functions to convert env variables */
+static void get_bool(const char *env, bool *dst, bool *has_dst)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D toui32(val) !=3D 0;
+        *has_dst =3D true;
+    }
+}
+
+static void get_int(const char *env, uint32_t *dst, bool *has_dst)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D toui32(val);
+        *has_dst =3D true;
+    }
+}
+
+static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        size_t i;
+        for (i =3D 0; AudioFormat_lookup.size; ++i) {
+            if (strcasecmp(val, AudioFormat_lookup.array[i]) =3D=3D 0) {
+                *dst =3D i;
+                *has_dst =3D true;
+                return;
+            }
+        }
+
+        dolog("Invalid audio format `%s'\n", val);
+        exit(1);
+    }
+}
+
+/* backend specific functions */
+/* todo */
+
+/* general */
+static void handle_per_direction(
+    AudiodevPerDirectionOptions *pdo, const char *prefix)
+{
+    char buf[64];
+    size_t len =3D strlen(prefix);
+
+    memcpy(buf, prefix, len);
+    strcpy(buf + len, "FIXED_SETTINGS");
+    get_bool(buf, &pdo->fixed_settings, &pdo->has_fixed_settings);
+
+    strcpy(buf + len, "FIXED_FREQ");
+    get_int(buf, &pdo->frequency, &pdo->has_frequency);
+
+    strcpy(buf + len, "FIXED_FMT");
+    get_fmt(buf, &pdo->format, &pdo->has_format);
+
+    strcpy(buf + len, "FIXED_CHANNELS");
+    get_int(buf, &pdo->channels, &pdo->has_channels);
+
+    strcpy(buf + len, "VOICES");
+    get_int(buf, &pdo->voices, &pdo->has_voices);
+}
+
+static AudiodevListEntry *legacy_opt(const char *drvname)
+{
+    AudiodevListEntry *e =3D g_malloc0(sizeof(AudiodevListEntry));
+    e->dev =3D g_malloc0(sizeof(Audiodev));
+    e->dev->id =3D g_strdup(drvname);
+    e->dev->driver =3D qapi_enum_parse(
+        &AudiodevDriver_lookup, drvname, -1, &error_abort);
+
+    audio_create_pdos(e->dev);
+
+    handle_per_direction(audio_get_pdo_in(e->dev), "QEMU_AUDIO_ADC_");
+    handle_per_direction(audio_get_pdo_out(e->dev), "QEMU_AUDIO_DAC_");
+
+    get_int("QEMU_AUDIO_TIMER_PERIOD",
+            &e->dev->timer_period, &e->dev->has_timer_period);
+
+    return e;
+}
+
+AudiodevListHead audio_handle_legacy_opts(void)
+{
+    const char *drvname =3D getenv("QEMU_AUDIO_DRV");
+    AudiodevListHead head =3D QSIMPLEQ_HEAD_INITIALIZER(head);
+
+    if (drvname) {
+        AudiodevListEntry *e;
+        audio_driver *driver =3D audio_driver_lookup(drvname);
+        if (!driver) {
+            dolog("Unknown audio driver `%s'\n", drvname);
+            exit(1);
+        }
+        e =3D legacy_opt(drvname);
+        QSIMPLEQ_INSERT_TAIL(&head, e, next);
+    } else {
+        for (int i =3D 0; audio_prio_list[i]; i++) {
+            audio_driver *driver =3D audio_driver_lookup(audio_prio_list=
[i]);
+            if (driver && driver->can_be_default) {
+                AudiodevListEntry *e =3D legacy_opt(driver->name);
+                QSIMPLEQ_INSERT_TAIL(&head, e, next);
+            }
+        }
+        if (QSIMPLEQ_EMPTY(&head)) {
+            dolog("Internal error: no default audio driver available\n")=
;
+            exit(1);
+        }
+    }
+
+    return head;
+}
+
+/* visitor to print -audiodev option */
+typedef struct {
+    Visitor visitor;
+
+    bool comma;
+    GList *path;
+} LegacyPrintVisitor;
+
+static void lv_start_struct(Visitor *v, const char *name, void **obj,
+                            size_t size, Error **errp)
+{
+    LegacyPrintVisitor *lv =3D (LegacyPrintVisitor *) v;
+    lv->path =3D g_list_append(lv->path, g_strdup(name));
+}
+
+static void lv_end_struct(Visitor *v, void **obj)
+{
+    LegacyPrintVisitor *lv =3D (LegacyPrintVisitor *) v;
+    lv->path =3D g_list_delete_link(lv->path, g_list_last(lv->path));
+}
+
+static void lv_print_key(Visitor *v, const char *name)
+{
+    GList *e;
+    LegacyPrintVisitor *lv =3D (LegacyPrintVisitor *) v;
+    if (lv->comma) {
+        putchar(',');
+    } else {
+        lv->comma =3D true;
+    }
+
+    for (e =3D lv->path; e; e =3D e->next) {
+        if (e->data) {
+            printf("%s.", (const char *) e->data);
+        }
+    }
+
+    printf("%s=3D", name);
+}
+
+static void lv_type_int64(Visitor *v, const char *name, int64_t *obj,
+                          Error **errp)
+{
+    lv_print_key(v, name);
+    printf("%" PRIi64, *obj);
+}
+
+static void lv_type_uint64(Visitor *v, const char *name, uint64_t *obj,
+                           Error **errp)
+{
+    lv_print_key(v, name);
+    printf("%" PRIu64, *obj);
+}
+
+static void lv_type_bool(Visitor *v, const char *name, bool *obj, Error =
**errp)
+{
+    lv_print_key(v, name);
+    printf("%s", *obj ? "on" : "off");
+}
+
+static void lv_type_str(Visitor *v, const char *name, char **obj, Error =
**errp)
+{
+    const char *str =3D *obj;
+    lv_print_key(v, name);
+
+    while (*str) {
+        if (*str =3D=3D ',') {
+            putchar(',');
+        }
+        putchar(*str++);
+    }
+}
+
+static void lv_complete(Visitor *v, void *opaque)
+{
+    LegacyPrintVisitor *lv =3D (LegacyPrintVisitor *) v;
+    assert(lv->path =3D=3D NULL);
+}
+
+static void lv_free(Visitor *v)
+{
+    LegacyPrintVisitor *lv =3D (LegacyPrintVisitor *) v;
+
+    g_list_free_full(lv->path, g_free);
+    g_free(lv);
+}
+
+static Visitor *legacy_visitor_new(void)
+{
+    LegacyPrintVisitor *lv =3D g_malloc0(sizeof(LegacyPrintVisitor));
+
+    lv->visitor.start_struct =3D lv_start_struct;
+    lv->visitor.end_struct =3D lv_end_struct;
+    /* lists not supported */
+    lv->visitor.type_int64 =3D lv_type_int64;
+    lv->visitor.type_uint64 =3D lv_type_uint64;
+    lv->visitor.type_bool =3D lv_type_bool;
+    lv->visitor.type_str =3D lv_type_str;
+
+    lv->visitor.type =3D VISITOR_OUTPUT;
+    lv->visitor.complete =3D lv_complete;
+    lv->visitor.free =3D lv_free;
+
+    return &lv->visitor;
+}
+
+void audio_legacy_help(void)
+{
+    AudiodevListHead head;
+    AudiodevListEntry *e;
+
+    printf("Environment variable based configuration deprecated.\n");
+    printf("Please use the new -audiodev option.\n");
+
+    head =3D audio_handle_legacy_opts();
+    printf("\nEquivalent -audiodev to your current environment variables=
:\n");
+    if (!getenv("QEMU_AUDIO_DRV")) {
+        printf("(Since you didn't specify QEMU_AUDIO_DRV, I'll list all =
"
+               "possibilities)\n");
+    }
+
+    QSIMPLEQ_FOREACH(e, &head, next) {
+        Visitor *v;
+        Audiodev *dev =3D e->dev;
+        printf("-audiodev ");
+
+        v =3D legacy_visitor_new();
+        visit_type_Audiodev(v, NULL, &dev, &error_abort);
+        visit_free(v);
+
+        printf("\n");
+    }
+    audio_free_audiodev_list(&head);
+}
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 638c60b300b2..7d4225dbeeff 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -685,7 +685,7 @@ static CoreaudioConf glob_conf =3D {
     .nbuffers =3D 4,
 };
=20
-static void *coreaudio_audio_init (void)
+static void *coreaudio_audio_init(Audiodev *dev)
 {
     CoreaudioConf *conf =3D g_malloc(sizeof(CoreaudioConf));
     *conf =3D glob_conf;
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 3ed73a30d1e3..02fe777cba75 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -783,7 +783,7 @@ static void dsound_audio_fini (void *opaque)
     g_free(s);
 }
=20
-static void *dsound_audio_init (void)
+static void *dsound_audio_init(Audiodev *dev)
 {
     int err;
     HRESULT hr;
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 1bfebeca7da9..79690af1eabd 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -136,7 +136,7 @@ static int no_ctl_in (HWVoiceIn *hw, int cmd, ...)
     return 0;
 }
=20
-static void *no_audio_init (void)
+static void *no_audio_init(Audiodev *dev)
 {
     return &no_audio_init;
 }
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 355e8fbda519..e0cadbef29df 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -842,7 +842,7 @@ static OSSConf glob_conf =3D {
     .policy =3D 5
 };
=20
-static void *oss_audio_init (void)
+static void *oss_audio_init(Audiodev *dev)
 {
     OSSConf *conf =3D g_malloc(sizeof(OSSConf));
     *conf =3D glob_conf;
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 8246f260a8ac..d649c58e3d4c 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -812,7 +812,7 @@ static PAConf glob_conf =3D {
     .samples =3D 4096,
 };
=20
-static void *qpa_audio_init (void)
+static void *qpa_audio_init(Audiodev *dev)
 {
     if (glob_conf.server =3D=3D NULL) {
         char pidfile[64];
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 4cd4cbaf0043..b9ae506a5651 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -315,7 +315,7 @@ static int sdl_ctl_out (HWVoiceOut *hw, int cmd, ...)
     return 0;
 }
=20
-static void *sdl_audio_init (void)
+static void *sdl_audio_init(Audiodev *dev)
 {
     SDLAudioState *s =3D &glob_sdl;
     if (s->driver_created) {
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 3aeb0cb35722..affc3df17f90 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -77,7 +77,7 @@ static const SpiceRecordInterface record_sif =3D {
     .base.minor_version =3D SPICE_INTERFACE_RECORD_MINOR,
 };
=20
-static void *spice_audio_init (void)
+static void *spice_audio_init(Audiodev *dev)
 {
     if (!using_spice) {
         return NULL;
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 35a614785ece..9eff3555b35f 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -232,7 +232,7 @@ static WAVConf glob_conf =3D {
     .wav_path           =3D "qemu.wav"
 };
=20
-static void *wav_audio_init (void)
+static void *wav_audio_init(Audiodev *dev)
 {
     WAVConf *conf =3D g_malloc(sizeof(WAVConf));
     *conf =3D glob_conf;
diff --git a/vl.c b/vl.c
index 4a350de5cd19..db04aea7f8c9 100644
--- a/vl.c
+++ b/vl.c
@@ -3253,9 +3253,12 @@ int main(int argc, char **argv, char **envp)
                 add_device_config(DEV_BT, optarg);
                 break;
             case QEMU_OPTION_audio_help:
-                AUD_help ();
+                audio_legacy_help();
                 exit (0);
                 break;
+            case QEMU_OPTION_audiodev:
+                audio_parse_option(optarg);
+                break;
             case QEMU_OPTION_soundhw:
                 select_soundhw (optarg);
                 break;
@@ -4447,6 +4450,8 @@ int main(int argc, char **argv, char **envp)
     /* do monitor/qmp handling at preconfig state if requested */
     main_loop();
=20
+    audio_init_audiodevs();
+
     /* from here on runstate is RUN_STATE_PRELAUNCH */
     machine_run_board_init(current_machine);
=20
diff --git a/audio/Makefile.objs b/audio/Makefile.objs
index db4fa7f18f25..dca87f63470d 100644
--- a/audio/Makefile.objs
+++ b/audio/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-y =3D audio.o noaudio.o wavaudio.o mixeng.o
+common-obj-y =3D audio.o audio_legacy.o noaudio.o wavaudio.o mixeng.o
 common-obj-$(CONFIG_SPICE) +=3D spiceaudio.o
 common-obj-$(CONFIG_AUDIO_COREAUDIO) +=3D coreaudio.o
 common-obj-$(CONFIG_AUDIO_DSOUND) +=3D dsoundaudio.o
--=20
2.18.1

