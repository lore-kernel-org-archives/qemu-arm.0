Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172669wrs;
        Tue, 12 Mar 2019 00:36:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEyygGaA+lPe1kRDu24ROLSsDrHTBJFe05zm5+wM/3ucpysA8JiveYcSg5S9mdwJdV2l6p
X-Received: by 2002:a25:28d:: with SMTP id 135mr29496113ybc.490.1552376168645;
        Tue, 12 Mar 2019 00:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376168; cv=none;
        d=google.com; s=arc-20160816;
        b=Td/767/x3ek8nVC+xzI7+jeGyf+XMjs6oL5OINH/LPsSxILcSrIKwAVsiI4UTJBSdF
         zxol9dKYzt6zl3BkaRvRZPSXXlt0Z/jHh0ZnWsDd2gppmfa54tud77OPekgPcwlFa8Kx
         5hy9oTb1A0fTKBBnxqX5tyNIb80UX9YxpsU7wrm9fVC2Vz76MkW1Y+HGI6x1xwGRLIsm
         uxDwBur5kHg8QtO9qFszUqqEkyWCmVuLIb13IT3a63/aSRkc1ejHEqrfko/U2wHYNKwX
         PpubsHryWiwiwu+L49fhYRQDiqKKa+vJ9ydRzT/Z6IUDH7J+rGHPDe8j6Z/5hwRSpJO7
         yNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=grbSra0CNGW3Hd8r9mNIqdaQprAQeZ86JA3UutHLu/U=;
        b=G+9Kpt/SifbOqxSywDasgcOW1sjpf+nb5927nv7MzBYkp34z1VXBBv+zy4IWHMcgU7
         Rjpf7sl2giJaDyLZ6zhdOccJ6NOxrwt40eEH60wOApNgG1XXxo3u7vcdJ5d0rzjWTK67
         BdaNxA1fYOK3Oi/hDXVal9DoG8v685BfDJFxBSWlK4XBavCqmIaYRU3t01aBK1wAkqD3
         aCIbW2pLvqFeX1EpK4wjBCszgGAmj2A+Fk9p7B5Q+uJ5QVVrUQJhklvidO8uyMl1elk0
         hmmW2WuaAFnJYNY4hteUMKLdnrmDvzXwGRQB7GW3PlS+ZdIiZnbjGoYEu4A1FTo6Ya98
         BzgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l77si4407784ywl.243.2019.03.12.00.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bxH-00061G-VO
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:36:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btK-0002Ug-0N
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bhF-0001BS-1v
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:19:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bhE-0001B4-RJ; Tue, 12 Mar 2019 03:19:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06D3B30832D8;
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1209648C3;
	Tue, 12 Mar 2019 07:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B0D311753D; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:44 +0100
Message-Id: <20190312071250.12168-9-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 12 Mar 2019 07:12:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 08/14] noaudio: port to -audiodev config
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
X-TUID: bmzsyLNbzTQE

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 0c35b1956ed1105244309a774c038816c040108c.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/noaudio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/audio/noaudio.c b/audio/noaudio.c
index 79690af1eabd..ccc611fc8470 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -163,7 +163,6 @@ static struct audio_pcm_ops no_pcm_ops =3D {
 static struct audio_driver no_audio_driver =3D {
     .name           =3D "none",
     .descr          =3D "Timer based audio emulation",
-    .options        =3D NULL,
     .init           =3D no_audio_init,
     .fini           =3D no_audio_fini,
     .pcm_ops        =3D &no_pcm_ops,
--=20
2.18.1

