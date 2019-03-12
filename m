Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp156584wrs;
        Tue, 12 Mar 2019 00:13:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzo/ezs87s3IMw4SttuHONhdC0tuy2GObuOKI1a+ZNvEAn19gKPWzBcqVGStNKhujQSipEB
X-Received: by 2002:a25:30d:: with SMTP id 13mr30731954ybd.3.1552374807685;
        Tue, 12 Mar 2019 00:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552374807; cv=none;
        d=google.com; s=arc-20160816;
        b=hmwaxa9nKr1z9n2a5VxSAIKflpUhJVWPcWBhPn5o/2tg0dqB+OXxpv05Wm1ZmG9Pga
         UYyxzbbA2pO9ACGANrZb55hT8a4juKawX1rZZLcorm90uzerRx0Y7kk8JrKnyjs7PIJq
         tQYRcmwfOMfbFrAw6/q9NAF6B9pDttNxo4aSETeT7ct+teWURLpZJxLNNemYIOIo3siD
         42eeMCpVsc3vO9Kww2PTh8rQR6rKeHqyLRVBnnjIUlVb9PJZebU6h7+nLM0BUs5oIIuF
         3MtzydRhTINH1MZnqEOLQJbYwLIZVVimBlmKxO8VfjiP0YlF8I0RGspcvlGlgBbkrv4Y
         bXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ssbh/2HTm60sUzudMY6rGl9/OHFpbTj1YnyrZJObVl0=;
        b=SoIg5wj4gBDIWa9Ee+PJTlSzOXpMmdWYfHvQak1rkuP6lqM8UkH0jXiIlolOHRUjmQ
         OONv749ypYzc/btuYiOD4WTAzttArURgJ07A0U0J7LaA0nVsNQ21tkFQPq/quwestPTt
         VJflZ8L3/L1/2c6pF9UQTXt4QqIMNfjjpxA5D2N91Y01IghRIJY9mI+pstMlmDPMLAii
         NW95RBAHpRbz3BBRvNaN9U99VpE7JiRUDwRH32Rked1swS3RPU3KbVvaRy4y8PLvR7PJ
         ElmvIOeT8KYbC6FfeqBSXvN/7EBgaTFf52zdrnVB7wsOlWPI5hox6GEmwFCeo0gpmbXR
         ngpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si490491ybt.246.2019.03.12.00.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bbL-0005YZ-3L
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:13:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb3-0005XW-Uz
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bb2-0006Fr-Pc
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:13:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bb2-0006FH-8j; Tue, 12 Mar 2019 03:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B7D5C057F5A;
	Tue, 12 Mar 2019 07:13:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4517A1001E63;
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D6174A1E1; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:48 +0100
Message-Id: <20190312071250.12168-13-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 12 Mar 2019 07:13:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 12/14] spiceaudio: port to -audiodev config
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
X-TUID: Lpk9cEpAxm2M

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 040d1241f29104ecfeecb26b0a14f0d042484fc5.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/spiceaudio.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index affc3df17f90..4f7873af5afd 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -373,10 +373,6 @@ static int line_in_ctl (HWVoiceIn *hw, int cmd, ...)
     return 0;
 }
=20
-static struct audio_option audio_options[] =3D {
-    { /* end of list */ },
-};
-
 static struct audio_pcm_ops audio_callbacks =3D {
     .init_out =3D line_out_init,
     .fini_out =3D line_out_fini,
@@ -394,7 +390,6 @@ static struct audio_pcm_ops audio_callbacks =3D {
 static struct audio_driver spice_audio_driver =3D {
     .name           =3D "spice",
     .descr          =3D "spice audio driver",
-    .options        =3D audio_options,
     .init           =3D spice_audio_init,
     .fini           =3D spice_audio_fini,
     .pcm_ops        =3D &audio_callbacks,
--=20
2.18.1

