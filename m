Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp170575wrs;
        Tue, 12 Mar 2019 00:33:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSNgbVp9knLz0yMqQUxK0PyT/K37+++54aMFYiHvJoEGvrLTqfpUNCV3wVOi8WkZksJauF
X-Received: by 2002:a25:bb42:: with SMTP id b2mr30982846ybk.253.1552375985937;
        Tue, 12 Mar 2019 00:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552375985; cv=none;
        d=google.com; s=arc-20160816;
        b=W/1caQZVdOltoT+CG9lUvCxNw4U9Xfo4CYpE8BEx3MvHNoqmuZGzgOB6FNcKzWxycu
         MO5zH5syLGtaoFEkLsYZKvevyZnX0WlUR9X02J4pn8/Si9/ojrpTjbdgj+4xa2Yq4+OM
         PoVsFsZae++JxpO0r1QHnZroBEvypWcvedRlvauqfYAuSe1jrr7lp9gsvsWsaDJkFTDc
         ZTNLUdJVKSr/EXY304i0nzUPQEcwixV5Qy9LJlZAhHeONjQAc6IhzZ10yuFse0UUntmV
         YIDBDozQpCmxwRqMjepIwG2eBGr1/syZjI6XnPl+RPE9o/EYsu3Pf/nH520gHP4fjJ+O
         4onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=K9N2IEoZgkpJEd+JzW5eK41ew7xxV5CUmWCB1wZMfA8=;
        b=JdKqO9F9/RcbMKjxBXf/bVQCG3kQplyv4pk1U3Dp+xPTOxwlMzANyc8PU3ofR6VvKx
         FqySYe6jNLkG5dpXtp8K8xgRCpugQyM2/LVIQTuOkLV+xLU4OGVbN7L19lNR76NgTR2Y
         YnpK9mfXF6cbk0vasyfoNVzC2TMRlXg4qf9o/69Da+LzSx0+/gXinhqjk/j7jfWfoN4L
         0wlPA5PrzO+WlhoMknDiYzb/NzHk4NNKMKJcMiOFJG8BfqRjADAID2tS+Z9zAxqabjS8
         uBbCpaIj7HnYakt2PAfm3I9AjkCflLXkAGu7enFI6FmN0+ThlwHts1Ajfg196tlY+b48
         /ZYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h144si4383003ywa.384.2019.03.12.00.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3buL-0002nc-3t
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:33:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bsK-0001vz-Ps
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bjq-0002gS-Rc
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:22:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bjh-0002Zx-3I; Tue, 12 Mar 2019 03:22:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35D7881F09;
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54F1A60A9A;
	Tue, 12 Mar 2019 07:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9453C1753A; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:41 +0100
Message-Id: <20190312071250.12168-6-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/14] alsaaudio: port to -audiodev config
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
X-TUID: HTZIyoIzYqTx

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 663d2c918a11ef44d4042e56c796d6dbf40be70c.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/alsaaudio.c    | 329 +++++++++++++------------------------------
 audio/audio_legacy.c |  84 ++++++++++-
 2 files changed, 181 insertions(+), 232 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 8302f3e882d7..49e688430998 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -33,28 +33,9 @@
 #define AUDIO_CAP "alsa"
 #include "audio_int.h"
=20
-typedef struct ALSAConf {
-    int size_in_usec_in;
-    int size_in_usec_out;
-    const char *pcm_name_in;
-    const char *pcm_name_out;
-    unsigned int buffer_size_in;
-    unsigned int period_size_in;
-    unsigned int buffer_size_out;
-    unsigned int period_size_out;
-    unsigned int threshold;
-
-    int buffer_size_in_overridden;
-    int period_size_in_overridden;
-
-    int buffer_size_out_overridden;
-    int period_size_out_overridden;
-} ALSAConf;
-
 struct pollhlp {
     snd_pcm_t *handle;
     struct pollfd *pfds;
-    ALSAConf *conf;
     int count;
     int mask;
 };
@@ -66,6 +47,7 @@ typedef struct ALSAVoiceOut {
     void *pcm_buf;
     snd_pcm_t *handle;
     struct pollhlp pollhlp;
+    Audiodev *dev;
 } ALSAVoiceOut;
=20
 typedef struct ALSAVoiceIn {
@@ -73,16 +55,13 @@ typedef struct ALSAVoiceIn {
     snd_pcm_t *handle;
     void *pcm_buf;
     struct pollhlp pollhlp;
+    Audiodev *dev;
 } ALSAVoiceIn;
=20
 struct alsa_params_req {
     int freq;
     snd_pcm_format_t fmt;
     int nchannels;
-    int size_in_usec;
-    int override_mask;
-    unsigned int buffer_size;
-    unsigned int period_size;
 };
=20
 struct alsa_params_obt {
@@ -408,17 +387,18 @@ static int alsa_to_audfmt (snd_pcm_format_t alsafmt=
, AudioFormat *fmt,
=20
 static void alsa_dump_info (struct alsa_params_req *req,
                             struct alsa_params_obt *obt,
-                            snd_pcm_format_t obtfmt)
+                            snd_pcm_format_t obtfmt,
+                            AudiodevAlsaPerDirectionOptions *apdo)
 {
-    dolog ("parameter | requested value | obtained value\n");
-    dolog ("format    |      %10d |     %10d\n", req->fmt, obtfmt);
-    dolog ("channels  |      %10d |     %10d\n",
-           req->nchannels, obt->nchannels);
-    dolog ("frequency |      %10d |     %10d\n", req->freq, obt->freq);
-    dolog ("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\=
n");
-    dolog ("requested: buffer size %d period size %d\n",
-           req->buffer_size, req->period_size);
-    dolog ("obtained: samples %ld\n", obt->samples);
+    dolog("parameter | requested value | obtained value\n");
+    dolog("format    |      %10d |     %10d\n", req->fmt, obtfmt);
+    dolog("channels  |      %10d |     %10d\n",
+          req->nchannels, obt->nchannels);
+    dolog("frequency |      %10d |     %10d\n", req->freq, obt->freq);
+    dolog("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n")=
;
+    dolog("requested: buffer len %" PRId32 " period len %" PRId32 "\n",
+          apdo->buffer_length, apdo->period_length);
+    dolog("obtained: samples %ld\n", obt->samples);
 }
=20
 static void alsa_set_threshold (snd_pcm_t *handle, snd_pcm_uframes_t thr=
eshold)
@@ -451,23 +431,23 @@ static void alsa_set_threshold (snd_pcm_t *handle, =
snd_pcm_uframes_t threshold)
     }
 }
=20
-static int alsa_open (int in, struct alsa_params_req *req,
-                      struct alsa_params_obt *obt, snd_pcm_t **handlep,
-                      ALSAConf *conf)
+static int alsa_open(bool in, struct alsa_params_req *req,
+                     struct alsa_params_obt *obt, snd_pcm_t **handlep,
+                     Audiodev *dev)
 {
+    AudiodevAlsaOptions *aopts =3D &dev->u.alsa;
+    AudiodevAlsaPerDirectionOptions *apdo =3D in ? aopts->in : aopts->ou=
t;
     snd_pcm_t *handle;
     snd_pcm_hw_params_t *hw_params;
     int err;
-    int size_in_usec;
     unsigned int freq, nchannels;
-    const char *pcm_name =3D in ? conf->pcm_name_in : conf->pcm_name_out=
;
+    const char *pcm_name =3D apdo->has_dev ? apdo->dev : "default";
     snd_pcm_uframes_t obt_buffer_size;
     const char *typ =3D in ? "ADC" : "DAC";
     snd_pcm_format_t obtfmt;
=20
     freq =3D req->freq;
     nchannels =3D req->nchannels;
-    size_in_usec =3D req->size_in_usec;
=20
     snd_pcm_hw_params_alloca (&hw_params);
=20
@@ -527,79 +507,42 @@ static int alsa_open (int in, struct alsa_params_re=
q *req,
         goto err;
     }
=20
-    if (req->buffer_size) {
-        unsigned long obt;
+    if (apdo->buffer_length) {
+        int dir =3D 0;
+        unsigned int btime =3D apdo->buffer_length;
=20
-        if (size_in_usec) {
-            int dir =3D 0;
-            unsigned int btime =3D req->buffer_size;
+        err =3D snd_pcm_hw_params_set_buffer_time_near(
+            handle, hw_params, &btime, &dir);
=20
-            err =3D snd_pcm_hw_params_set_buffer_time_near (
-                handle,
-                hw_params,
-                &btime,
-                &dir
-                );
-            obt =3D btime;
-        }
-        else {
-            snd_pcm_uframes_t bsize =3D req->buffer_size;
-
-            err =3D snd_pcm_hw_params_set_buffer_size_near (
-                handle,
-                hw_params,
-                &bsize
-                );
-            obt =3D bsize;
-        }
         if (err < 0) {
-            alsa_logerr2 (err, typ, "Failed to set buffer %s to %d\n",
-                          size_in_usec ? "time" : "size", req->buffer_si=
ze);
+            alsa_logerr2(err, typ, "Failed to set buffer time to %" PRId=
32 "\n",
+                         apdo->buffer_length);
             goto err;
         }
=20
-        if ((req->override_mask & 2) && (obt - req->buffer_size))
-            dolog ("Requested buffer %s %u was rejected, using %lu\n",
-                   size_in_usec ? "time" : "size", req->buffer_size, obt=
);
+        if (apdo->has_buffer_length && btime !=3D apdo->buffer_length) {
+            dolog("Requested buffer time %" PRId32
+                  " was rejected, using %u\n", apdo->buffer_length, btim=
e);
+        }
     }
=20
-    if (req->period_size) {
-        unsigned long obt;
+    if (apdo->period_length) {
+        int dir =3D 0;
+        unsigned int ptime =3D apdo->period_length;
=20
-        if (size_in_usec) {
-            int dir =3D 0;
-            unsigned int ptime =3D req->period_size;
-
-            err =3D snd_pcm_hw_params_set_period_time_near (
-                handle,
-                hw_params,
-                &ptime,
-                &dir
-                );
-            obt =3D ptime;
-        }
-        else {
-            int dir =3D 0;
-            snd_pcm_uframes_t psize =3D req->period_size;
-
-            err =3D snd_pcm_hw_params_set_period_size_near (
-                handle,
-                hw_params,
-                &psize,
-                &dir
-                );
-            obt =3D psize;
-        }
+        err =3D snd_pcm_hw_params_set_period_time_near(handle, hw_params=
, &ptime,
+                                                     &dir);
=20
         if (err < 0) {
-            alsa_logerr2 (err, typ, "Failed to set period %s to %d\n",
-                          size_in_usec ? "time" : "size", req->period_si=
ze);
+            alsa_logerr2(err, typ, "Failed to set period time to %" PRId=
32 "\n",
+                         apdo->period_length);
             goto err;
         }
=20
-        if (((req->override_mask & 1) && (obt - req->period_size)))
-            dolog ("Requested period %s %u was rejected, using %lu\n",
-                   size_in_usec ? "time" : "size", req->period_size, obt=
);
+        if (apdo->has_period_length && ptime !=3D apdo->period_length) {
+            dolog("Requested period time %" PRId32 " was rejected, using=
 %d\n",
+                  apdo->period_length, ptime);
+        }
     }
=20
     err =3D snd_pcm_hw_params (handle, hw_params);
@@ -631,33 +574,12 @@ static int alsa_open (int in, struct alsa_params_re=
q *req,
         goto err;
     }
=20
-    if (!in && conf->threshold) {
-        snd_pcm_uframes_t threshold;
-        int bytes_per_sec;
-
-        bytes_per_sec =3D freq << (nchannels =3D=3D 2);
-
-        switch (obt->fmt) {
-        case AUDIO_FORMAT_S8:
-        case AUDIO_FORMAT_U8:
-            break;
-
-        case AUDIO_FORMAT_S16:
-        case AUDIO_FORMAT_U16:
-            bytes_per_sec <<=3D 1;
-            break;
-
-        case AUDIO_FORMAT_S32:
-        case AUDIO_FORMAT_U32:
-            bytes_per_sec <<=3D 2;
-            break;
-
-        default:
-            abort();
-        }
-
-        threshold =3D (conf->threshold * bytes_per_sec) / 1000;
-        alsa_set_threshold (handle, threshold);
+    if (!in && aopts->has_threshold && aopts->threshold) {
+        struct audsettings as =3D { .freq =3D freq };
+        alsa_set_threshold(
+            handle,
+            audio_buffer_frames(qapi_AudiodevAlsaPerDirectionOptions_bas=
e(apdo),
+                                &as, aopts->threshold));
     }
=20
     obt->nchannels =3D nchannels;
@@ -670,11 +592,11 @@ static int alsa_open (int in, struct alsa_params_re=
q *req,
          obt->nchannels !=3D req->nchannels ||
          obt->freq !=3D req->freq) {
         dolog ("Audio parameters for %s\n", typ);
-        alsa_dump_info (req, obt, obtfmt);
+        alsa_dump_info(req, obt, obtfmt, apdo);
     }
=20
 #ifdef DEBUG
-    alsa_dump_info (req, obt, obtfmt);
+    alsa_dump_info(req, obt, obtfmt, pdo);
 #endif
     return 0;
=20
@@ -800,19 +722,13 @@ static int alsa_init_out(HWVoiceOut *hw, struct aud=
settings *as,
     struct alsa_params_obt obt;
     snd_pcm_t *handle;
     struct audsettings obt_as;
-    ALSAConf *conf =3D drv_opaque;
+    Audiodev *dev =3D drv_opaque;
=20
     req.fmt =3D aud_to_alsafmt (as->fmt, as->endianness);
     req.freq =3D as->freq;
     req.nchannels =3D as->nchannels;
-    req.period_size =3D conf->period_size_out;
-    req.buffer_size =3D conf->buffer_size_out;
-    req.size_in_usec =3D conf->size_in_usec_out;
-    req.override_mask =3D
-        (conf->period_size_out_overridden ? 1 : 0) |
-        (conf->buffer_size_out_overridden ? 2 : 0);
=20
-    if (alsa_open (0, &req, &obt, &handle, conf)) {
+    if (alsa_open(0, &req, &obt, &handle, dev)) {
         return -1;
     }
=20
@@ -833,7 +749,7 @@ static int alsa_init_out(HWVoiceOut *hw, struct audse=
ttings *as,
     }
=20
     alsa->handle =3D handle;
-    alsa->pollhlp.conf =3D conf;
+    alsa->dev =3D dev;
     return 0;
 }
=20
@@ -873,16 +789,12 @@ static int alsa_voice_ctl (snd_pcm_t *handle, const=
 char *typ, int ctl)
 static int alsa_ctl_out (HWVoiceOut *hw, int cmd, ...)
 {
     ALSAVoiceOut *alsa =3D (ALSAVoiceOut *) hw;
+    AudiodevAlsaPerDirectionOptions *apdo =3D alsa->dev->u.alsa.out;
=20
     switch (cmd) {
     case VOICE_ENABLE:
         {
-            va_list ap;
-            int poll_mode;
-
-            va_start (ap, cmd);
-            poll_mode =3D va_arg (ap, int);
-            va_end (ap);
+            bool poll_mode =3D apdo->try_poll;
=20
             ldebug ("enabling voice\n");
             if (poll_mode && alsa_poll_out (hw)) {
@@ -911,19 +823,13 @@ static int alsa_init_in(HWVoiceIn *hw, struct audse=
ttings *as, void *drv_opaque)
     struct alsa_params_obt obt;
     snd_pcm_t *handle;
     struct audsettings obt_as;
-    ALSAConf *conf =3D drv_opaque;
+    Audiodev *dev =3D drv_opaque;
=20
     req.fmt =3D aud_to_alsafmt (as->fmt, as->endianness);
     req.freq =3D as->freq;
     req.nchannels =3D as->nchannels;
-    req.period_size =3D conf->period_size_in;
-    req.buffer_size =3D conf->buffer_size_in;
-    req.size_in_usec =3D conf->size_in_usec_in;
-    req.override_mask =3D
-        (conf->period_size_in_overridden ? 1 : 0) |
-        (conf->buffer_size_in_overridden ? 2 : 0);
=20
-    if (alsa_open (1, &req, &obt, &handle, conf)) {
+    if (alsa_open(1, &req, &obt, &handle, dev)) {
         return -1;
     }
=20
@@ -944,7 +850,7 @@ static int alsa_init_in(HWVoiceIn *hw, struct audsett=
ings *as, void *drv_opaque)
     }
=20
     alsa->handle =3D handle;
-    alsa->pollhlp.conf =3D conf;
+    alsa->dev =3D dev;
     return 0;
 }
=20
@@ -1086,16 +992,12 @@ static int alsa_read (SWVoiceIn *sw, void *buf, in=
t size)
 static int alsa_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
     ALSAVoiceIn *alsa =3D (ALSAVoiceIn *) hw;
+    AudiodevAlsaPerDirectionOptions *apdo =3D alsa->dev->u.alsa.in;
=20
     switch (cmd) {
     case VOICE_ENABLE:
         {
-            va_list ap;
-            int poll_mode;
-
-            va_start (ap, cmd);
-            poll_mode =3D va_arg (ap, int);
-            va_end (ap);
+            bool poll_mode =3D apdo->try_poll;
=20
             ldebug ("enabling voice\n");
             if (poll_mode && alsa_poll_in (hw)) {
@@ -1118,88 +1020,54 @@ static int alsa_ctl_in (HWVoiceIn *hw, int cmd, .=
..)
     return -1;
 }
=20
-static ALSAConf glob_conf =3D {
-    .buffer_size_out =3D 4096,
-    .period_size_out =3D 1024,
-    .pcm_name_out =3D "default",
-    .pcm_name_in =3D "default",
-};
+static void alsa_init_per_direction(AudiodevAlsaPerDirectionOptions *apd=
o)
+{
+    if (!apdo->has_try_poll) {
+        apdo->try_poll =3D true;
+        apdo->has_try_poll =3D true;
+    }
+}
=20
 static void *alsa_audio_init(Audiodev *dev)
 {
-    ALSAConf *conf =3D g_malloc(sizeof(ALSAConf));
-    *conf =3D glob_conf;
-    return conf;
+    AudiodevAlsaOptions *aopts;
+    assert(dev->driver =3D=3D AUDIODEV_DRIVER_ALSA);
+
+    aopts =3D &dev->u.alsa;
+    alsa_init_per_direction(aopts->in);
+    alsa_init_per_direction(aopts->out);
+
+    /*
+     * need to define them, as otherwise alsa produces no sound
+     * doesn't set has_* so alsa_open can identify it wasn't set by the =
user
+     */
+    if (!dev->u.alsa.out->has_period_length) {
+        /* 1024 frames assuming 44100Hz */
+        dev->u.alsa.out->period_length =3D 1024 * 1000000 / 44100;
+    }
+    if (!dev->u.alsa.out->has_buffer_length) {
+        /* 4096 frames assuming 44100Hz */
+        dev->u.alsa.out->buffer_length =3D 4096ll * 1000000 / 44100;
+    }
+
+    /*
+     * OptsVisitor sets unspecified optional fields to zero, but do not =
depend
+     * on it...
+     */
+    if (!dev->u.alsa.in->has_period_length) {
+        dev->u.alsa.in->period_length =3D 0;
+    }
+    if (!dev->u.alsa.in->has_buffer_length) {
+        dev->u.alsa.in->buffer_length =3D 0;
+    }
+
+    return dev;
 }
=20
 static void alsa_audio_fini (void *opaque)
 {
-    g_free(opaque);
 }
=20
-static struct audio_option alsa_options[] =3D {
-    {
-        .name        =3D "DAC_SIZE_IN_USEC",
-        .tag         =3D AUD_OPT_BOOL,
-        .valp        =3D &glob_conf.size_in_usec_out,
-        .descr       =3D "DAC period/buffer size in microseconds (otherw=
ise in frames)"
-    },
-    {
-        .name        =3D "DAC_PERIOD_SIZE",
-        .tag         =3D AUD_OPT_INT,
-        .valp        =3D &glob_conf.period_size_out,
-        .descr       =3D "DAC period size (0 to go with system default)"=
,
-        .overriddenp =3D &glob_conf.period_size_out_overridden
-    },
-    {
-        .name        =3D "DAC_BUFFER_SIZE",
-        .tag         =3D AUD_OPT_INT,
-        .valp        =3D &glob_conf.buffer_size_out,
-        .descr       =3D "DAC buffer size (0 to go with system default)"=
,
-        .overriddenp =3D &glob_conf.buffer_size_out_overridden
-    },
-    {
-        .name        =3D "ADC_SIZE_IN_USEC",
-        .tag         =3D AUD_OPT_BOOL,
-        .valp        =3D &glob_conf.size_in_usec_in,
-        .descr       =3D
-        "ADC period/buffer size in microseconds (otherwise in frames)"
-    },
-    {
-        .name        =3D "ADC_PERIOD_SIZE",
-        .tag         =3D AUD_OPT_INT,
-        .valp        =3D &glob_conf.period_size_in,
-        .descr       =3D "ADC period size (0 to go with system default)"=
,
-        .overriddenp =3D &glob_conf.period_size_in_overridden
-    },
-    {
-        .name        =3D "ADC_BUFFER_SIZE",
-        .tag         =3D AUD_OPT_INT,
-        .valp        =3D &glob_conf.buffer_size_in,
-        .descr       =3D "ADC buffer size (0 to go with system default)"=
,
-        .overriddenp =3D &glob_conf.buffer_size_in_overridden
-    },
-    {
-        .name        =3D "THRESHOLD",
-        .tag         =3D AUD_OPT_INT,
-        .valp        =3D &glob_conf.threshold,
-        .descr       =3D "(undocumented)"
-    },
-    {
-        .name        =3D "DAC_DEV",
-        .tag         =3D AUD_OPT_STR,
-        .valp        =3D &glob_conf.pcm_name_out,
-        .descr       =3D "DAC device name (for instance dmix)"
-    },
-    {
-        .name        =3D "ADC_DEV",
-        .tag         =3D AUD_OPT_STR,
-        .valp        =3D &glob_conf.pcm_name_in,
-        .descr       =3D "ADC device name"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops alsa_pcm_ops =3D {
     .init_out =3D alsa_init_out,
     .fini_out =3D alsa_fini_out,
@@ -1217,7 +1085,6 @@ static struct audio_pcm_ops alsa_pcm_ops =3D {
 static struct audio_driver alsa_audio_driver =3D {
     .name           =3D "alsa",
     .descr          =3D "ALSA http://www.alsa-project.org",
-    .options        =3D alsa_options,
     .init           =3D alsa_audio_init,
     .fini           =3D alsa_audio_fini,
     .pcm_ops        =3D &alsa_pcm_ops,
diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index ad3b781addf8..f58c8b6aee62 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -62,6 +62,18 @@ static void get_int(const char *env, uint32_t *dst, bo=
ol *has_dst)
     }
 }
=20
+static void get_str(const char *env, char **dst, bool *has_dst)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        if (*has_dst) {
+            g_free(*dst);
+        }
+        *dst =3D g_strdup(val);
+        *has_dst =3D true;
+    }
+}
+
 static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
 {
     const char *val =3D getenv(env);
@@ -80,8 +92,69 @@ static void get_fmt(const char *env, AudioFormat *dst,=
 bool *has_dst)
     }
 }
=20
+
+static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *ha=
s_dst)
+{
+    const char *val =3D getenv(env);
+    if (val) {
+        *dst =3D toui32(val) * 1000;
+        *has_dst =3D true;
+    }
+}
+
+static uint32_t frames_to_usecs(uint32_t frames,
+                                AudiodevPerDirectionOptions *pdo)
+{
+    uint32_t freq =3D pdo->has_frequency ? pdo->frequency : 44100;
+    return (frames * 1000000 + freq / 2) / freq;
+}
+
 /* backend specific functions */
-/* todo */
+/* ALSA */
+static void handle_alsa_per_direction(
+    AudiodevAlsaPerDirectionOptions *apdo, const char *prefix)
+{
+    char buf[64];
+    size_t len =3D strlen(prefix);
+    bool size_in_usecs =3D false;
+    bool dummy;
+
+    memcpy(buf, prefix, len);
+    strcpy(buf + len, "TRY_POLL");
+    get_bool(buf, &apdo->try_poll, &apdo->has_try_poll);
+
+    strcpy(buf + len, "DEV");
+    get_str(buf, &apdo->dev, &apdo->has_dev);
+
+    strcpy(buf + len, "SIZE_IN_USEC");
+    get_bool(buf, &size_in_usecs, &dummy);
+
+    strcpy(buf + len, "PERIOD_SIZE");
+    get_int(buf, &apdo->period_length, &apdo->has_period_length);
+    if (apdo->has_period_length && !size_in_usecs) {
+        apdo->period_length =3D frames_to_usecs(
+            apdo->period_length,
+            qapi_AudiodevAlsaPerDirectionOptions_base(apdo));
+    }
+
+    strcpy(buf + len, "BUFFER_SIZE");
+    get_int(buf, &apdo->buffer_length, &apdo->has_buffer_length);
+    if (apdo->has_buffer_length && !size_in_usecs) {
+        apdo->buffer_length =3D frames_to_usecs(
+            apdo->buffer_length,
+            qapi_AudiodevAlsaPerDirectionOptions_base(apdo));
+    }
+}
+
+static void handle_alsa(Audiodev *dev)
+{
+    AudiodevAlsaOptions *aopt =3D &dev->u.alsa;
+    handle_alsa_per_direction(aopt->in, "QEMU_ALSA_ADC_");
+    handle_alsa_per_direction(aopt->out, "QEMU_ALSA_DAC_");
+
+    get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
+                        &aopt->threshold, &aopt->has_threshold);
+}
=20
 /* general */
 static void handle_per_direction(
@@ -123,6 +196,15 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
     get_int("QEMU_AUDIO_TIMER_PERIOD",
             &e->dev->timer_period, &e->dev->has_timer_period);
=20
+    switch (e->dev->driver) {
+    case AUDIODEV_DRIVER_ALSA:
+        handle_alsa(e->dev);
+        break;
+
+    default:
+        break;
+    }
+
     return e;
 }
=20
--=20
2.18.1

