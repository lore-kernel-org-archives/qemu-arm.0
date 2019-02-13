Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1671995wrp;
        Wed, 13 Feb 2019 01:07:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZAhkoyhO+ibCy+5agr7r5Ra9Jdl27gyhSN0FEyNmGWn+btHRnajTJzRuNnsF16TvmYRtZq
X-Received: by 2002:a81:94c6:: with SMTP id l189mr3691563ywg.485.1550048874706;
        Wed, 13 Feb 2019 01:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048874; cv=none;
        d=google.com; s=arc-20160816;
        b=Nw0nox44f+1h8NPtcEGB1mKtVCtfIknNWI3ZgLqn/fMMq/BRQzxeDS6/10MRBDLsPN
         BYuIZkQfeS7uRLY3PfyNxT9yojXkOgOpemPC/h1d1jvu8yzExOOQkGvOfDWZmWOv8J7n
         MgOzalXD/JMCUZP0I4lRw3neQncx0pEIomZM18/quEmHF/6Ns6GW6vivp4iKysZyHoQU
         hUVsX1y2hJXnWQA7ir0c1G924qFbzbqMvOzEWlTy3biCegsVDiOPYLH+kL8zRs3WMfFi
         dqA9sRM/0YhwJ6bYXDKZHW58p4g/U+jPvmLgDvb37mcjTvJpz9EVHWzQSbB/bruzLJT/
         TpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KorIoqxgCM0vOQXdg8n96965q40HERQNZTxvo70ZLrk=;
        b=UMcffKHduDOj3amI5Qh19pZCKl0eUzhXG2Ur0Ga0ywP+G/1LMxMmy3OoVTIiPJ/Keb
         9yyKKPT/pGRQMX3AwpW3bFL6JhNUBB58hpzXpRbc6XlBBBlM0UIOZ68Iefl2y/XF5kTE
         GqUuC8YpWFbTZvUFdRiuYyyedKrjGZra1UJuMYQ0T3Ci4WbjS1CvJv7ffe7CZmrvGpS5
         bU/Oss18oFYUeImqKZ3EoauCCGVqCK9iStoRjk4TwhEV/4IjE1JoXagHRPrV/wBToOYk
         nUIpP/rNtseMF0BuyF/CKLRWmr1b0GwAS1Ilgyo7xdPm+aHuPaWE6f7h/KOjCpz8RouL
         RkYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 76si8988245ybn.436.2019.02.13.01.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqWH-0007ra-UA
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG1-00024X-Ri
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4v-0005xz-Ik
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4v-0005uM-9V; Wed, 13 Feb 2019 03:39:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6982599CE1;
	Wed, 13 Feb 2019 08:39:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A87BB10021B6;
	Wed, 13 Feb 2019 08:39:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:11 +0100
Message-Id: <1550047098-1210-19-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 13 Feb 2019 08:39:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 18/25] hw/arm: Express dependencies of
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
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h47GFdGQUuyA

Add Kconfig dependencies for the DIGIC / canon-a1100 machine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 2 +-
 hw/arm/Kconfig                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6605786..20fcbcb 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -28,12 +28,12 @@ CONFIG_ASPEED_SOC=3Dy
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
index bb385a5..80a3b1f 100644
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

