Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172491wrs;
        Tue, 12 Mar 2019 00:35:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAzaZ/W5D4w4d7lz+fHBzgEczJljfmIt3V+T7UbIXcL18YZnLNVu9H4cr6LHRQC1+GQRVf
X-Received: by 2002:a25:b4a:: with SMTP id 71mr32114603ybl.104.1552376153290;
        Tue, 12 Mar 2019 00:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376153; cv=none;
        d=google.com; s=arc-20160816;
        b=AgMH889YM+aypEQi8++ye9rTmE2YugYOuM+NYNpS/etzE221GB2Og7JI2UFEa9hTT1
         tr7EZ9aXdLYxOmR+G3xcJSSmaodEorTgpC8+5JAP6jz1M2kz+LhNexKT8XRPrUUNsKeq
         lx5r/1rgmpmBjLq0RCv3JaIAq1DH9QqYtq9BRpwhsMp0fXz+4lADIs7CKyl8vtbR3Z3f
         YVQ3vnRGmttI/J1AltgLxdnDl1aHZ5FgzX7ZAtDOw+WSbsxpMeC6M9qEuGEps2L/OQdh
         fxn7qZYlupN/yRclqp1Tlu7+4rq7ZxtIhk5TZ7FIUt1S1mvSb2kIJQrj8CnShfGEZtqE
         939w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vLD4V4DN7B1DpYUmz172ug8lrwqUTJ97Zk7fXhmknCw=;
        b=0dMDnu8UdHqSw6RtYBTsjvebpE2/THfjXBnXpLL3mqUNBRxbEFPexx7AKN8k+wqx+b
         U6wrI/ihAPOEVD1foMeUr/UhklclLzJi5WKzCUpGhs3Z+q/Zs8Z1TVPA0j/byF2uVL19
         LijrxM4nHgM5UoHmBLMSPnSaZSG86iWN4oVJsem+MHd1Bp6owvIZ/5OllN466YMBipEd
         mbwEdkYkDy2gzs/h9s93/130mMhk01BT3uJ8IPHEvBCVJqhDDr+q+Bzu0tMlUeF1USpg
         UQNGseEjpUnhFbGNW5nt1C456sms4u46607GK9bVGs1hGOIMUEKTKMlYaWX9So2udqCL
         51Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f197si7943yba.77.2019.03.12.00.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bwz-0005l8-3O
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:35:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bt8-0001vz-H5
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bjf-0002Zn-7h
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:22:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bjd-0002Yj-76; Tue, 12 Mar 2019 03:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FED0308FED2;
	Tue, 12 Mar 2019 07:13:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D5EA648C3;
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BACBE1753E; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:45 +0100
Message-Id: <20190312071250.12168-10-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 12 Mar 2019 07:13:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 09/14] ossaudio: port to -audiodev config
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
X-TUID: fE/nZ3G6uV1h

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 31c899f2f78e40fbc01f563ee4829c98debb68db.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_legacy.c |  32 +++++++++
 audio/ossaudio.c     | 161 ++++++++++++++-----------------------------
 2 files changed, 83 insertions(+), 110 deletions(-)

diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index bf326bd36060..94f95bbc7318 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -219,6 +219,34 @@ static void handle_dsound(Audiodev *dev)
                        dev->u.dsound.in);
 }
=20
+/* OSS */
+static void handle_oss_per_direction(
+    AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
+    const char *dev_env)
+{
+    get_bool(try_poll_env, &opdo->try_poll, &opdo->has_try_poll);
+    get_str(dev_env, &opdo->dev, &opdo->has_dev);
+
+    get_bytes_to_usecs("QEMU_OSS_FRAGSIZE",
+                       &opdo->buffer_length, &opdo->has_buffer_length,
+                       qapi_AudiodevOssPerDirectionOptions_base(opdo));
+    get_int("QEMU_OSS_NFRAGS", &opdo->buffer_count,
+            &opdo->has_buffer_count);
+}
+
+static void handle_oss(Audiodev *dev)
+{
+    AudiodevOssOptions *oopt =3D &dev->u.oss;
+    handle_oss_per_direction(oopt->in, "QEMU_AUDIO_ADC_TRY_POLL",
+                             "QEMU_OSS_ADC_DEV");
+    handle_oss_per_direction(oopt->out, "QEMU_AUDIO_DAC_TRY_POLL",
+                             "QEMU_OSS_DAC_DEV");
+
+    get_bool("QEMU_OSS_MMAP", &oopt->try_mmap, &oopt->has_try_mmap);
+    get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusiv=
e);
+    get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy)=
;
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -272,6 +300,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_dsound(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_OSS:
+        handle_oss(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index e0cadbef29df..fc28981a3972 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -37,16 +37,6 @@
 #define USE_DSP_POLICY
 #endif
=20
-typedef struct OSSConf {
-    int try_mmap;
-    int nfrags;
-    int fragsize;
-    const char *devpath_out;
-    const char *devpath_in;
-    int exclusive;
-    int policy;
-} OSSConf;
-
 typedef struct OSSVoiceOut {
     HWVoiceOut hw;
     void *pcm_buf;
@@ -56,7 +46,7 @@ typedef struct OSSVoiceOut {
     int fragsize;
     int mmapped;
     int pending;
-    OSSConf *conf;
+    Audiodev *dev;
 } OSSVoiceOut;
=20
 typedef struct OSSVoiceIn {
@@ -65,12 +55,12 @@ typedef struct OSSVoiceIn {
     int fd;
     int nfrags;
     int fragsize;
-    OSSConf *conf;
+    Audiodev *dev;
 } OSSVoiceIn;
=20
 struct oss_params {
     int freq;
-    AudioFormat fmt;
+    int fmt;
     int nchannels;
     int nfrags;
     int fragsize;
@@ -262,19 +252,25 @@ static int oss_get_version (int fd, int *version, c=
onst char *typ)
 }
 #endif
=20
-static int oss_open (int in, struct oss_params *req,
-                     struct oss_params *obt, int *pfd, OSSConf* conf)
+static int oss_open(int in, struct oss_params *req, audsettings *as,
+                    struct oss_params *obt, int *pfd, Audiodev *dev)
 {
+    AudiodevOssOptions *oopts =3D &dev->u.oss;
+    AudiodevOssPerDirectionOptions *opdo =3D in ? oopts->in : oopts->out=
;
     int fd;
-    int oflags =3D conf->exclusive ? O_EXCL : 0;
+    int oflags =3D (oopts->has_exclusive && oopts->exclusive) ? O_EXCL :=
 0;
     audio_buf_info abinfo;
     int fmt, freq, nchannels;
     int setfragment =3D 1;
-    const char *dspname =3D in ? conf->devpath_in : conf->devpath_out;
+    const char *dspname =3D opdo->has_dev ? opdo->dev : "/dev/dsp";
     const char *typ =3D in ? "ADC" : "DAC";
+#ifdef USE_DSP_POLICY
+    int policy =3D oopts->has_dsp_policy ? oopts->dsp_policy : 5;
+#endif
=20
     /* Kludge needed to have working mmap on Linux */
-    oflags |=3D conf->try_mmap ? O_RDWR : (in ? O_RDONLY : O_WRONLY);
+    oflags |=3D (oopts->has_try_mmap && oopts->try_mmap) ?
+        O_RDWR : (in ? O_RDONLY : O_WRONLY);
=20
     fd =3D open (dspname, oflags | O_NONBLOCK);
     if (-1 =3D=3D fd) {
@@ -285,6 +281,9 @@ static int oss_open (int in, struct oss_params *req,
     freq =3D req->freq;
     nchannels =3D req->nchannels;
     fmt =3D req->fmt;
+    req->nfrags =3D opdo->has_buffer_count ? opdo->buffer_count : 4;
+    req->fragsize =3D audio_buffer_bytes(
+        qapi_AudiodevOssPerDirectionOptions_base(opdo), as, 23220);
=20
     if (ioctl (fd, SNDCTL_DSP_SAMPLESIZE, &fmt)) {
         oss_logerr2 (errno, typ, "Failed to set sample size %d\n", req->=
fmt);
@@ -308,18 +307,18 @@ static int oss_open (int in, struct oss_params *req=
,
     }
=20
 #ifdef USE_DSP_POLICY
-    if (conf->policy >=3D 0) {
+    if (policy >=3D 0) {
         int version;
=20
         if (!oss_get_version (fd, &version, typ)) {
             trace_oss_version(version);
=20
             if (version >=3D 0x040000) {
-                int policy =3D conf->policy;
-                if (ioctl (fd, SNDCTL_DSP_POLICY, &policy)) {
+                int policy2 =3D policy;
+                if (ioctl(fd, SNDCTL_DSP_POLICY, &policy2)) {
                     oss_logerr2 (errno, typ,
                                  "Failed to set timing policy to %d\n",
-                                 conf->policy);
+                                 policy);
                     goto err;
                 }
                 setfragment =3D 0;
@@ -502,17 +501,16 @@ static int oss_init_out(HWVoiceOut *hw, struct auds=
ettings *as,
     int fd;
     AudioFormat effective_fmt;
     struct audsettings obt_as;
-    OSSConf *conf =3D drv_opaque;
+    Audiodev *dev =3D drv_opaque;
+    AudiodevOssOptions *oopts =3D &dev->u.oss;
=20
     oss->fd =3D -1;
=20
     req.fmt =3D aud_to_ossfmt (as->fmt, as->endianness);
     req.freq =3D as->freq;
     req.nchannels =3D as->nchannels;
-    req.fragsize =3D conf->fragsize;
-    req.nfrags =3D conf->nfrags;
=20
-    if (oss_open (0, &req, &obt, &fd, conf)) {
+    if (oss_open(0, &req, as, &obt, &fd, dev)) {
         return -1;
     }
=20
@@ -539,7 +537,7 @@ static int oss_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     hw->samples =3D (obt.nfrags * obt.fragsize) >> hw->info.shift;
=20
     oss->mmapped =3D 0;
-    if (conf->try_mmap) {
+    if (oopts->has_try_mmap && oopts->try_mmap) {
         oss->pcm_buf =3D mmap (
             NULL,
             hw->samples << hw->info.shift,
@@ -597,7 +595,7 @@ static int oss_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     }
=20
     oss->fd =3D fd;
-    oss->conf =3D conf;
+    oss->dev =3D dev;
     return 0;
 }
=20
@@ -605,16 +603,12 @@ static int oss_ctl_out (HWVoiceOut *hw, int cmd, ..=
.)
 {
     int trig;
     OSSVoiceOut *oss =3D (OSSVoiceOut *) hw;
+    AudiodevOssPerDirectionOptions *opdo =3D oss->dev->u.oss.out;
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
+            bool poll_mode =3D opdo->try_poll;
=20
             ldebug ("enabling voice\n");
             if (poll_mode) {
@@ -669,16 +663,14 @@ static int oss_init_in(HWVoiceIn *hw, struct audset=
tings *as, void *drv_opaque)
     int fd;
     AudioFormat effective_fmt;
     struct audsettings obt_as;
-    OSSConf *conf =3D drv_opaque;
+    Audiodev *dev =3D drv_opaque;
=20
     oss->fd =3D -1;
=20
     req.fmt =3D aud_to_ossfmt (as->fmt, as->endianness);
     req.freq =3D as->freq;
     req.nchannels =3D as->nchannels;
-    req.fragsize =3D conf->fragsize;
-    req.nfrags =3D conf->nfrags;
-    if (oss_open (1, &req, &obt, &fd, conf)) {
+    if (oss_open(1, &req, as, &obt, &fd, dev)) {
         return -1;
     }
=20
@@ -712,7 +704,7 @@ static int oss_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
     }
=20
     oss->fd =3D fd;
-    oss->conf =3D conf;
+    oss->dev =3D dev;
     return 0;
 }
=20
@@ -803,16 +795,12 @@ static int oss_read (SWVoiceIn *sw, void *buf, int =
size)
 static int oss_ctl_in (HWVoiceIn *hw, int cmd, ...)
 {
     OSSVoiceIn *oss =3D (OSSVoiceIn *) hw;
+    AudiodevOssPerDirectionOptions *opdo =3D oss->dev->u.oss.out;
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
+            bool poll_mode =3D opdo->try_poll;
=20
             if (poll_mode) {
                 oss_poll_in (hw);
@@ -832,82 +820,36 @@ static int oss_ctl_in (HWVoiceIn *hw, int cmd, ...)
     return 0;
 }
=20
-static OSSConf glob_conf =3D {
-    .try_mmap =3D 0,
-    .nfrags =3D 4,
-    .fragsize =3D 4096,
-    .devpath_out =3D "/dev/dsp",
-    .devpath_in =3D "/dev/dsp",
-    .exclusive =3D 0,
-    .policy =3D 5
-};
+static void oss_init_per_direction(AudiodevOssPerDirectionOptions *opdo)
+{
+    if (!opdo->has_try_poll) {
+        opdo->try_poll =3D true;
+        opdo->has_try_poll =3D true;
+    }
+}
=20
 static void *oss_audio_init(Audiodev *dev)
 {
-    OSSConf *conf =3D g_malloc(sizeof(OSSConf));
-    *conf =3D glob_conf;
+    AudiodevOssOptions *oopts;
+    assert(dev->driver =3D=3D AUDIODEV_DRIVER_OSS);
=20
-    if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
-        access(conf->devpath_out, R_OK | W_OK) < 0) {
-        g_free(conf);
+    oopts =3D &dev->u.oss;
+    oss_init_per_direction(oopts->in);
+    oss_init_per_direction(oopts->out);
+
+    if (access(oopts->in->has_dev ? oopts->in->dev : "/dev/dsp",
+               R_OK | W_OK) < 0 ||
+        access(oopts->out->has_dev ? oopts->out->dev : "/dev/dsp",
+               R_OK | W_OK) < 0) {
         return NULL;
     }
-    return conf;
+    return dev;
 }
=20
 static void oss_audio_fini (void *opaque)
 {
-    g_free(opaque);
 }
=20
-static struct audio_option oss_options[] =3D {
-    {
-        .name  =3D "FRAGSIZE",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.fragsize,
-        .descr =3D "Fragment size in bytes"
-    },
-    {
-        .name  =3D "NFRAGS",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.nfrags,
-        .descr =3D "Number of fragments"
-    },
-    {
-        .name  =3D "MMAP",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &glob_conf.try_mmap,
-        .descr =3D "Try using memory mapped access"
-    },
-    {
-        .name  =3D "DAC_DEV",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.devpath_out,
-        .descr =3D "Path to DAC device"
-    },
-    {
-        .name  =3D "ADC_DEV",
-        .tag   =3D AUD_OPT_STR,
-        .valp  =3D &glob_conf.devpath_in,
-        .descr =3D "Path to ADC device"
-    },
-    {
-        .name  =3D "EXCLUSIVE",
-        .tag   =3D AUD_OPT_BOOL,
-        .valp  =3D &glob_conf.exclusive,
-        .descr =3D "Open device in exclusive mode (vmix won't work)"
-    },
-#ifdef USE_DSP_POLICY
-    {
-        .name  =3D "POLICY",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &glob_conf.policy,
-        .descr =3D "Set the timing policy of the device, -1 to use fragm=
ent mode",
-    },
-#endif
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops oss_pcm_ops =3D {
     .init_out =3D oss_init_out,
     .fini_out =3D oss_fini_out,
@@ -925,7 +867,6 @@ static struct audio_pcm_ops oss_pcm_ops =3D {
 static struct audio_driver oss_audio_driver =3D {
     .name           =3D "oss",
     .descr          =3D "OSS http://www.opensound.com",
-    .options        =3D oss_options,
     .init           =3D oss_audio_init,
     .fini           =3D oss_audio_fini,
     .pcm_ops        =3D &oss_pcm_ops,
--=20
2.18.1

