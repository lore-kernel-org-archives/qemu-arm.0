Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp171401wrs;
        Tue, 12 Mar 2019 00:34:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFgxrGMc209mdcOEPuRovHP8iauLkS8qTIc75S4qh8+6xcLXPvgwXWBWLMKwPbHZABZrRf
X-Received: by 2002:a81:1dd6:: with SMTP id d205mr29962132ywd.352.1552376050366;
        Tue, 12 Mar 2019 00:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376050; cv=none;
        d=google.com; s=arc-20160816;
        b=JQhyY32HX2lChyAOH9q2dif5QOfksuD/X8QouZyqLUeqB6o6xB1mZr8gVY3j1dhHlA
         vfDPbz7aUQwhe0O3EbRIwhOfK/eX+zuvCXbNejaqoaJ9E/YJsG/o7mUOCJ55dIThk+yQ
         Tzcv0wYp7OFzgxR48XQYkRxEIlqDZZ9W/xpA4Cxh0Lj6utBHoQUZJe6TOyuCOfwAWgyr
         HIoZP/2lzpnKMy7ad8GA+WiB39tMD7OQ0ReUr++lKBRmRPIJIYNvr5L2GgtTldw1la7O
         HRbQ3U5euxomMqrasgvc9cqEEjLp+AszQPNqHEpRTGWaFgH3ZO8Dsqu2R2c7ufdkTAYe
         0ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7pIHZtH8iDeacat/eypUBxmngXKHf/6e7Zs3UKj3NlI=;
        b=N70yCj1tlFvQG9GwVBTCYoHdkT43bVWqkcNi/O19/sp+HG2jXYHYbJw04lKcZmo3JW
         rvxXrrN1zCDh+3OvPtAAVWebRY5tKMGIWG4fh+tw1ONDNsa6qVHPufUPeJoMWHqVKrmm
         FV5f3KlRa2sTNB5O5p087JtjkPQ5R9Gr+w/6p4//cjclS258vaFsmg1lQljPgvXZZzx7
         VoXQV+tP5LME2K08zS0ucpxyHFXlfU8CLG8JFrNc6WnzdoevKcJWe7qFuMOf47vnY9na
         3+s0L0kDeF4ALo9iYtJ4niSy7nYmRsCHZSfDSDQkKWwecxFZ2xigjc2dZlaDgOEUc7+U
         f/DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si4681840ywd.416.2019.03.12.00.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bvN-00041I-Js
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:34:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bt2-0001vz-UN
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bjm-0002e5-0O
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:22:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bjf-0002ZV-7A; Tue, 12 Mar 2019 03:22:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4696B30718F1;
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFB02648D9;
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CE27EA1E0; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:47 +0100
Message-Id: <20190312071250.12168-12-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 11/14] sdlaudio: port to -audiodev config
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
X-TUID: qa0Rtum9ZGMH

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 1dc596cba39378df862582a0b952e497a16c6c31.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_legacy.c | 12 ++++++++++++
 audio/sdlaudio.c     | 22 ++++------------------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
index 8d7f1475b56a..478cf76d5fc0 100644
--- a/audio/audio_legacy.c
+++ b/audio/audio_legacy.c
@@ -281,6 +281,14 @@ static void handle_pa(Audiodev *dev)
     get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
 }
=20
+/* SDL */
+static void handle_sdl(Audiodev *dev)
+{
+    /* SDL is output only */
+    get_samples_to_usecs("QEMU_SDL_SAMPLES", &dev->u.sdl.out->buffer_len=
gth,
+                         &dev->u.sdl.out->has_buffer_length, dev->u.sdl.=
out);
+}
+
 /* general */
 static void handle_per_direction(
     AudiodevPerDirectionOptions *pdo, const char *prefix)
@@ -342,6 +350,10 @@ static AudiodevListEntry *legacy_opt(const char *drv=
name)
         handle_pa(e->dev);
         break;
=20
+    case AUDIODEV_DRIVER_SDL:
+        handle_sdl(e->dev);
+        break;
+
     default:
         break;
     }
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index b9ae506a5651..ff9248ba68e0 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -44,16 +44,11 @@ typedef struct SDLVoiceOut {
     int decr;
 } SDLVoiceOut;
=20
-static struct {
-    int nb_samples;
-} conf =3D {
-    .nb_samples =3D 1024
-};
-
 static struct SDLAudioState {
     int exit;
     int initialized;
     bool driver_created;
+    Audiodev *dev;
 } glob_sdl;
 typedef struct SDLAudioState SDLAudioState;
=20
@@ -271,7 +266,7 @@ static int sdl_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     req.freq =3D as->freq;
     req.format =3D aud_to_sdlfmt (as->fmt);
     req.channels =3D as->nchannels;
-    req.samples =3D conf.nb_samples;
+    req.samples =3D audio_buffer_samples(s->dev->u.sdl.out, as, 11610);
     req.callback =3D sdl_callback;
     req.userdata =3D sdl;
=20
@@ -329,6 +324,7 @@ static void *sdl_audio_init(Audiodev *dev)
     }
=20
     s->driver_created =3D true;
+    s->dev =3D dev;
     return s;
 }
=20
@@ -338,18 +334,9 @@ static void sdl_audio_fini (void *opaque)
     sdl_close (s);
     SDL_QuitSubSystem (SDL_INIT_AUDIO);
     s->driver_created =3D false;
+    s->dev =3D NULL;
 }
=20
-static struct audio_option sdl_options[] =3D {
-    {
-        .name  =3D "SAMPLES",
-        .tag   =3D AUD_OPT_INT,
-        .valp  =3D &conf.nb_samples,
-        .descr =3D "Size of SDL buffer in samples"
-    },
-    { /* End of list */ }
-};
-
 static struct audio_pcm_ops sdl_pcm_ops =3D {
     .init_out =3D sdl_init_out,
     .fini_out =3D sdl_fini_out,
@@ -361,7 +348,6 @@ static struct audio_pcm_ops sdl_pcm_ops =3D {
 static struct audio_driver sdl_audio_driver =3D {
     .name           =3D "sdl",
     .descr          =3D "SDL http://www.libsdl.org",
-    .options        =3D sdl_options,
     .init           =3D sdl_audio_init,
     .fini           =3D sdl_audio_fini,
     .pcm_ops        =3D &sdl_pcm_ops,
--=20
2.18.1

