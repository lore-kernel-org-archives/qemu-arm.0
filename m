Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172358wrs;
        Tue, 12 Mar 2019 00:35:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4sprpDeK3p0JpUHeNIfS0bt6Ez6DUss1SceNjVSMVXEHXbGNL0EX+BYP8P+507zZw1k5x
X-Received: by 2002:a0d:ea0d:: with SMTP id t13mr4864097ywe.138.1552376143129;
        Tue, 12 Mar 2019 00:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376143; cv=none;
        d=google.com; s=arc-20160816;
        b=W30s6YGY7v9VRey0NW6lS/aFLwdWHzmPaGlRdSbhmeHAgPiABdhUSSWJ/S9KSFD9qE
         WsliSQPBMBA07+8XA/FRyD4locybIZHxhRQJpC35xCNaEvHeVtWoMCbUH2ae7/Y2ls+c
         gZgYQk6syY92vLShhbiU/O/MTAtAzL1uRK4nMpvAXctQyc3TfvZsRkDQ23bWpMAzO5+K
         Zu1SeshzHV5pt5QX/KCiqLa9QNbIKsMkU7UMbP7F10qZMUlc10/EdnyA024BQoGWdLgJ
         +UasmssanszdfNpu+6nTyA/0O+YEDaGsykFDXklC1eDodoSZCH++d1/PmmhN6actcEMg
         JK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dPSrXLmaAD86KI9x8WnqsUfgzdzSdsdIE6FMbnQtBx4=;
        b=vU6OeKhESl6jBMh+C8mHW+bjmP4PFFsX6T7we5vYbXxj6vLLnllczEJSuJ+iX50JdY
         NA0mkBK0Xg54GY6c7QMLlDtzqWpFv2ZBglOpbQvq1flgyTffpl0Ej5C4SxqcH7eih+mX
         JYbNm8vpZcYfKqEFoQCUWcrqf4AoO9Argu6UUuGlJF2xs2r6QEAa0Mng+CA4cZ7rK7eN
         hWNHZApRZ62IgB0bGPLsOmM8UtWmJNM/6P97sE2jjc7e9xk72iZ7zQhLGJsbWpxK2RFa
         4K7kgiE6Vd/cfDVawVy5m5THvrhhjHB9nW5Mg3eqnEvZq5x+Q/ysl3AgLnD22IvXH9DI
         p4Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si4427126yba.9.2019.03.12.00.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bws-0005g4-CY
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:35:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btR-0002cI-HS
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bgc-0000yn-2A
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bgb-0000yW-Of; Tue, 12 Mar 2019 03:18:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51AB63082E3F;
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDE960C98;
	Tue, 12 Mar 2019 07:13:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E97BEA1E3; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:50 +0100
Message-Id: <20190312071250.12168-15-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 12 Mar 2019 07:13:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 14/14] audio: -audiodev command line option:
 cleanup
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
X-TUID: /t1mSH/Q+VbQ

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Remove no longer needed code.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 82c176a5222a56e4fde45d2b423ada797caddd5d.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h |  17 -----
 audio/audio.c     | 186 +---------------------------------------------
 2 files changed, 4 insertions(+), 199 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 7bf5dfc0b5f6..3f14842709bf 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -33,22 +33,6 @@
=20
 struct audio_pcm_ops;
=20
-typedef enum {
-    AUD_OPT_INT,
-    AUD_OPT_FMT,
-    AUD_OPT_STR,
-    AUD_OPT_BOOL
-} audio_option_tag_e;
-
-struct audio_option {
-    const char *name;
-    audio_option_tag_e tag;
-    void *valp;
-    const char *descr;
-    int *overriddenp;
-    int overridden;
-};
-
 struct audio_callback {
     void *opaque;
     audio_callback_fn fn;
@@ -145,7 +129,6 @@ typedef struct audio_driver audio_driver;
 struct audio_driver {
     const char *name;
     const char *descr;
-    struct audio_option *options;
     void *(*init) (Audiodev *);
     void (*fini) (void *);
     struct audio_pcm_ops *pcm_ops;
diff --git a/audio/audio.c b/audio/audio.c
index 79ed36066604..5fd9a58a808f 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -172,113 +172,6 @@ void *audio_calloc (const char *funcname, int nmemb=
, size_t size)
     return g_malloc0 (len);
 }
=20
-static const char *audio_audfmt_to_string (AudioFormat fmt)
-{
-    switch (fmt) {
-    case AUDIO_FORMAT_U8:
-        return "U8";
-
-    case AUDIO_FORMAT_U16:
-        return "U16";
-
-    case AUDIO_FORMAT_S8:
-        return "S8";
-
-    case AUDIO_FORMAT_S16:
-        return "S16";
-
-    case AUDIO_FORMAT_U32:
-        return "U32";
-
-    case AUDIO_FORMAT_S32:
-        return "S32";
-
-    default:
-        abort();
-    }
-
-    dolog ("Bogus audfmt %d returning S16\n", fmt);
-    return "S16";
-}
-
-static AudioFormat audio_string_to_audfmt (const char *s, AudioFormat de=
fval,
-                                        int *defaultp)
-{
-    if (!strcasecmp (s, "u8")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_U8;
-    }
-    else if (!strcasecmp (s, "u16")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_U16;
-    }
-    else if (!strcasecmp (s, "u32")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_U32;
-    }
-    else if (!strcasecmp (s, "s8")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_S8;
-    }
-    else if (!strcasecmp (s, "s16")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_S16;
-    }
-    else if (!strcasecmp (s, "s32")) {
-        *defaultp =3D 0;
-        return AUDIO_FORMAT_S32;
-    }
-    else {
-        dolog ("Bogus audio format `%s' using %s\n",
-               s, audio_audfmt_to_string (defval));
-        *defaultp =3D 1;
-        return defval;
-    }
-}
-
-static AudioFormat audio_get_conf_fmt (const char *envname,
-                                    AudioFormat defval,
-                                    int *defaultp)
-{
-    const char *var =3D getenv (envname);
-    if (!var) {
-        *defaultp =3D 1;
-        return defval;
-    }
-    return audio_string_to_audfmt (var, defval, defaultp);
-}
-
-static int audio_get_conf_int (const char *key, int defval, int *default=
p)
-{
-    int val;
-    char *strval;
-
-    strval =3D getenv (key);
-    if (strval && !qemu_strtoi(strval, NULL, 10, &val)) {
-        *defaultp =3D 0;
-        return val;
-    }
-    else {
-        *defaultp =3D 1;
-        return defval;
-    }
-}
-
-static const char *audio_get_conf_str (const char *key,
-                                       const char *defval,
-                                       int *defaultp)
-{
-    const char *val =3D getenv (key);
-    if (!val) {
-        *defaultp =3D 1;
-        return defval;
-    }
-    else {
-        *defaultp =3D 0;
-        return val;
-    }
-}
-
 void AUD_vlog (const char *cap, const char *fmt, va_list ap)
 {
     if (cap) {
@@ -297,74 +190,6 @@ void AUD_log (const char *cap, const char *fmt, ...)
     va_end (ap);
 }
=20
-static void audio_process_options (const char *prefix,
-                                   struct audio_option *opt)
-{
-    gchar *prefix_upper;
-
-    if (audio_bug(__func__, !prefix)) {
-        dolog ("prefix =3D NULL\n");
-        return;
-    }
-
-    if (audio_bug(__func__, !opt)) {
-        dolog ("opt =3D NULL\n");
-        return;
-    }
-
-    prefix_upper =3D g_utf8_strup(prefix, -1);
-
-    for (; opt->name; opt++) {
-        char *optname;
-        int def;
-
-        if (!opt->valp) {
-            dolog ("Option value pointer for `%s' is not set\n",
-                   opt->name);
-            continue;
-        }
-
-        optname =3D g_strdup_printf("QEMU_%s_%s", prefix_upper, opt->nam=
e);
-
-        def =3D 1;
-        switch (opt->tag) {
-        case AUD_OPT_BOOL:
-        case AUD_OPT_INT:
-            {
-                int *intp =3D opt->valp;
-                *intp =3D audio_get_conf_int (optname, *intp, &def);
-            }
-            break;
-
-        case AUD_OPT_FMT:
-            {
-                AudioFormat *fmtp =3D opt->valp;
-                *fmtp =3D audio_get_conf_fmt (optname, *fmtp, &def);
-            }
-            break;
-
-        case AUD_OPT_STR:
-            {
-                const char **strp =3D opt->valp;
-                *strp =3D audio_get_conf_str (optname, *strp, &def);
-            }
-            break;
-
-        default:
-            dolog ("Bad value tag for option `%s' - %d\n",
-                   optname, opt->tag);
-            break;
-        }
-
-        if (!opt->overriddenp) {
-            opt->overriddenp =3D &opt->overridden;
-        }
-        *opt->overriddenp =3D !def;
-        g_free (optname);
-    }
-    g_free(prefix_upper);
-}
-
 static void audio_print_settings (struct audsettings *as)
 {
     dolog ("frequency=3D%d nchannels=3D%d fmt=3D", as->freq, as->nchanne=
ls);
@@ -1072,7 +897,7 @@ void AUD_set_active_out (SWVoiceOut *sw, int on)
             if (!hw->enabled) {
                 hw->enabled =3D 1;
                 if (s->vm_running) {
-                    hw->pcm_ops->ctl_out(hw, VOICE_ENABLE, true);
+                    hw->pcm_ops->ctl_out(hw, VOICE_ENABLE);
                     audio_reset_timer (s);
                 }
             }
@@ -1117,7 +942,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
             if (!hw->enabled) {
                 hw->enabled =3D 1;
                 if (s->vm_running) {
-                    hw->pcm_ops->ctl_in(hw, VOICE_ENABLE, true);
+                    hw->pcm_ops->ctl_in(hw, VOICE_ENABLE);
                     audio_reset_timer (s);
                 }
             }
@@ -1441,9 +1266,6 @@ void audio_run (const char *msg)
 static int audio_driver_init(AudioState *s, struct audio_driver *drv,
                              bool msg, Audiodev *dev)
 {
-    if (drv->options) {
-        audio_process_options (drv->name, drv->options);
-    }
     s->drv_opaque =3D drv->init(dev);
=20
     if (s->drv_opaque) {
@@ -1470,11 +1292,11 @@ static void audio_vm_change_state_handler (void *=
opaque, int running,
=20
     s->vm_running =3D running;
     while ((hwo =3D audio_pcm_hw_find_any_enabled_out (hwo))) {
-        hwo->pcm_ops->ctl_out(hwo, op, true);
+        hwo->pcm_ops->ctl_out(hwo, op);
     }
=20
     while ((hwi =3D audio_pcm_hw_find_any_enabled_in (hwi))) {
-        hwi->pcm_ops->ctl_in(hwi, op, true);
+        hwi->pcm_ops->ctl_in(hwi, op);
     }
     audio_reset_timer (s);
 }
--=20
2.18.1

