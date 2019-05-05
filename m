Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1434850wrh;
        Sun, 5 May 2019 07:04:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKqAwg1TO9KFBzSgYkWlhts48lP979C8S65Gggiu7Zs+1L1lYI9qFbEHpCWiwETxOiJDCc
X-Received: by 2002:a5d:608f:: with SMTP id w15mr13719324wrt.74.1557065089065;
        Sun, 05 May 2019 07:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065089; cv=none;
        d=google.com; s=arc-20160816;
        b=DWSirzE5phMAHudlTycxbUZCHIFakIzei08euoPwTYsstBh/HegsMj0l1K1cT+1eZB
         ptJRKbkiko92Zjbq60CW2qmg7bMWH6k9+TkzT5fLMUal15E7so0Tk48bPw6C2lAZOqt9
         HsaPH8HinvS9Vn4qUZ1VXD15vTiX06Xh6xh9IH1qOguxsYTgH0eeKbdAx0wH1HrFzVtU
         h2VLyn2YVVdNguSYZ12rgVXb7FuhqtCI9OMy801lysWUVRaaUthU3zzcHOGgxvsubLuT
         vxFIzeHUskhNihAjowNmC92+QVCs55M8vI6S2L/B/+otdu7xxXSq6gAZH5qRlOJGkzUp
         9nnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/rSGl+XtseAGrSy7MqTMg2dWBxwIwX5+HttID8oEMw0=;
        b=jjbMD/nYCmHxzwEy+FLxxUyZH0tddYuExXgJ+L66yReXhfWwZOOBVxJDClUk2fKz2C
         X+75NfPwGMAKR13k1w2/l34VFaDZL2y1RhyZjetcUvcLer6B102RnT6gRZ2caWQoiBBR
         yUOmzL2VfzrPscnAt5+htCuFRZZ7xOFAm3nhoZWCpS23Mm6z9fmFfMEBT2W0qMetu74z
         EwJi4k/AzHazCRfASAUj1gl3w3LI2tQfkS2aLiXpWEBY3ElEcVbEUE/J8mgDNz3u8R3x
         DOaEvm+GsjxLDU03zVkyjpzkmpaJTWNKKpqRHg47ZamJpWTPjFL7Q8jF/8/cCC4DxGvx
         LGQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si6046064wrd.431.2019.05.05.07.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHl2-0002Et-3L
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:04:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeK-0004Um-Tq
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeI-0004uj-D3
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27783)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeG-0004t0-FU; Sun, 05 May 2019 09:57:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B70F530820E4;
	Sun,  5 May 2019 13:57:47 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA12560C18;
	Sun,  5 May 2019 13:57:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:06 +0200
Message-Id: <20190505135714.11277-21-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sun, 05 May 2019 13:57:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 20/28] hw/arm: Express dependencies of canon-a1100
 with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rb9r4rjDw4wp

Add Kconfig dependencies for the DIGIC / canon-a1100 machine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 2 +-
 hw/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 22bff20b32..76508e3910 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -32,12 +32,12 @@ CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
+CONFIG_DIGIC=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_DIGIC=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 40be78303c..abf2af0967 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,6 +32,7 @@ config CUBIEBOARD
 config DIGIC
     bool
     select PTIMER
+    select PFLASH_CFI02
=20
 config EXYNOS4
     bool
--=20
2.21.0

