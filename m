Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7790889wrx;
        Sat, 23 Feb 2019 00:04:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYDEa8ELuAbJ/wM5Acwja22msGw7v+JecdcDe/2j+UncavEYrQA4OYWAJazvG4lMJ2oL1VS
X-Received: by 2002:a25:90a:: with SMTP id 10mr6559205ybj.48.1550909096523;
        Sat, 23 Feb 2019 00:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909096; cv=none;
        d=google.com; s=arc-20160816;
        b=IHJlquHJQK9FHSKeT5g2tqdSqP+7akbPueRyxFwzE638uxzDw14bJWs8OeZpNgwiCW
         Le4L38fm0iUwsYvPjj1GzVOixFb2aRMcafWdjBLVkERZEWZCwVGXixYR6oIWqGytZwpT
         p7egUjj6D7aIU3rCPECVSqfNh6v3kl08/xXanR108sZBb6eDbw1QPplg/vZGlBDFZczM
         rBGJorY+BoiHxelEURAznSUBKvGwPkWo5IqlB2Ey3SJdPwUVdS67CHzhMEu8UrMomVeU
         8v50yiFXXDNNFKj9qi7UXLqYhckQysEWy28GiyZuwyrHzEBr12GQIjAWM3T4SFXS1DlY
         8p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=68piPQwyRuVkS/Vg7V0tobYzyLixmjF0qnAcIcETeUc=;
        b=w96RhrOrS6fxz3AOxrsrOq1yaTTGHchtVUvn68T4ZdhoBOGjWGfro9Pdbs8X6DR0pb
         8eunlgvPvHkNcKFBKniazacJru/rmmzMpsHclbNNxQaETwgtfaAgHSNFIt3LL0taH2vS
         wJWkrpHIhip38N7SbF2djqs31Jyt6iyGwa0PBLi7Zyz0B92jSV49hcXtHvkv0X5Xv7PO
         aIBrWtgrtCu+H9o2cV2isuK4tdQU7GLxmy9+8DEckzv4IlcONVeP9MUCZHBz6r262eW6
         3C2IEA0Afuon5nEzB4La9zUJgLi43havWIcH4qvOgCBziLyhY+9mUy+UQCjOQizSO8o+
         +0mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i67si2164493ywb.181.2019.02.23.00.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSIp-0007Zg-UF
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4e-0004tj-3B
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4d-0002Tl-CM
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60874)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4d-0002TF-4X; Sat, 23 Feb 2019 02:50:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49D0A85A07;
	Sat, 23 Feb 2019 07:50:14 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E33D35D9D4;
	Sat, 23 Feb 2019 07:50:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:14 +0100
Message-Id: <1550908162-22644-23-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Sat, 23 Feb 2019 07:50:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 22/30] hw/arm: Express dependencies of
 canon-a1100 with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BAJ9vtlTRND7

Add Kconfig dependencies for the DIGIC / canon-a1100 machine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 2 +-
 hw/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 290023c..53609ea 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -29,12 +29,12 @@ CONFIG_ASPEED_SOC=3Dy
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
index 32495e6..dbdc02c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,7 @@ config CUBIEBOARD
 config DIGIC
     bool
     select PTIMER
+    select PFLASH_CFI02
=20
 config EXYNOS4
     bool
--=20
1.8.3.1

