Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7797732wrx;
        Sat, 23 Feb 2019 00:15:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYgz9JvEn9J3KXBBiul//IDD67PFbEkkRfTzrVfiHUlwa04C9umzqeFO/wKv8rQTDiFEia1
X-Received: by 2002:a81:7852:: with SMTP id t79mr6249743ywc.432.1550909726129;
        Sat, 23 Feb 2019 00:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909726; cv=none;
        d=google.com; s=arc-20160816;
        b=RK/jBmN/5NXmO4e7u9tqGRhrF3diKqsFSRvyQe3SOQOvPkxSZSBP93NoAgUutJBCIy
         3kmZ+3NolCLdbWMYKP/thr+E5vK1gEA5/oQtZ+fzGFQME/bLTxrqxhpXCxt+jLqK72ZQ
         9WJ1sWBEIvYWos5/AX8tfpwq9zHSU1KEemiy3/G9jA3PL089iQegf9/yBam1BRUlZWVa
         vUb3a4cyFicK2CwE+zyoeHvTP6CJjzV7+R6W4g1fXl+UsLU6lMmwlCnoZorzEQkehb7k
         qcj+xpfhEP4/FlAPlvFIRFvMRmQXA1PcsFYlsvqTB1Ds2bfCJdR5zLZ9dcnztMo5CXa2
         Z+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=uMnfloeqlfTA7eKuFqoy+w2Pz3igFh67uNMUKd0K3tA=;
        b=HhvdSEsLXCWUPA3+JbfEH9JpAlfTsr3FSBsWQVpwITng9mlW9Xd1Ll/2qg9cZ55/gE
         qzQpiVx+atDspQTznptKmlw6+O79Esu9EFT4WL1Zr1oDNdfclvdH/tj2kn/8xUvyl7GB
         l0GZXBAvNeeyB67MMpw+gqCPw4wonARrN1gGTeE7NYxM4B2QZy9qNhnqajQJ4Bh+DJbJ
         RWvwZCtR/QAODQTMEYVbWlMP/AW5Fl5e/Rc1miQ0yzH7T9J2+8QynpukVsC5tlBJ0Twn
         yeJ/uEbPk3CgYsJ+3qVeIRcbsLULCsKza4Fc+e13tE859lhmWgjSm3SvTWlK0i/woXeM
         V61w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si2176607ywc.459.2019.02.23.00.15.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:15:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSSz-0007Tb-I6
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:15:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5C-0005Nx-BB
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5B-0002xQ-H5
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS5B-0002im-9G; Sat, 23 Feb 2019 02:50:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F36E307B97A;
	Sat, 23 Feb 2019 07:50:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 666765D9CA;
	Sat, 23 Feb 2019 07:50:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:22 +0100
Message-Id: <1550908162-22644-31-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sat, 23 Feb 2019 07:50:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 30/30] hw/arm: Remove hard-enablement of the
 remaining PCI devices
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
X-TUID: UYCcxMSTXXcJ

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ee95cc0..6b1f6a8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -33,14 +33,6 @@ CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 CONFIG_MICROBIT=y
-
-CONFIG_VGA=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-
-CONFIG_PCIE_PORT=y
-CONFIG_XIO3130=y
-CONFIG_IOH3420=y
-CONFIG_I82801B11=y
-- 
1.8.3.1

