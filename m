Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3804767wrt;
        Fri, 19 Oct 2018 06:14:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63uW8DRGcsiIa64zmhI+9kjPD4gRj2s+if8xzY2Z0vQOt0SCgPWYHW4vZEftODVRXJ3/DMy
X-Received: by 2002:ad4:4143:: with SMTP id z3mr25934247qvp.18.1539954889288;
        Fri, 19 Oct 2018 06:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539954889; cv=none;
        d=google.com; s=arc-20160816;
        b=IxhR8IlD8DDv420AIR8yr3y+sWmpRJP3CRuxh6qytVWkZGvOtCCSghJeSgUfUMI6iq
         pmGXGmMNzzOw8jMTwvLu0m1WoyNTAkM14USYqTI7fIWot5o4leRtC2qwwyIVOxsug69D
         pdmtS5mZAdWFkZldfPDPSXhioz/e4hft0ftJHqsiP3sRdVLLDL12pZen2dRy7hrjPC4X
         3IRynlUrkhGRCLY7lz/I+fxaM+/RRbutiEIn2bYn7MWuYGPMrudymBtocE3RxsbU71oj
         YNQrxgY430ovR+c/XrPt0MSmbsyM0djbV7TQi2c2oOz3Q2sf9S/rP5zkmFs7h98HGFFi
         fDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=iHXnPo7fEiHDUzviuqYPRXJTAW6UpjOMGB/jeNB6jIo=;
        b=A4kOeplE1vvxHrUSzZAxmtoJeRcUvYFZXE5T272tWQrHqaYF+Q6uicV9Hw2hB6DCRh
         iCL94cqKlj5fiRy4e0V71SFxiE3soYoaDUeeuBJylg9hFX1K/5i0ZM338RyBmbfYpm9u
         zTGh6Xq7EbFoOSpws6zoD1YGTf1TY4jIKBKyI8Ef7hl5Zx4/a3M8QuzWyoyRmKSqzz9w
         EFuNxQif/sM2Ph3MovBA77bDT1k8W9zNcPfu060NUZOIoh5ZJhlmOeCWpVwpe+POn4BX
         YyhPEaaaLoc55rjPZUKeXeHDmfzOX3y3sMjn5UDZkWlRqPbKnJxa6zpx8bo1QtsrCD+R
         yJsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3-v6si1635250qts.306.2018.10.19.06.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 06:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDUc4-0008CK-Mi
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 09:14:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbd-0007zR-Vk
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gDUbc-0005xO-Bm
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 09:14:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gDUbb-0005tM-KX; Fri, 19 Oct 2018 09:14:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EE3188314;
	Fri, 19 Oct 2018 13:14:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFFF62A2CC;
	Fri, 19 Oct 2018 13:14:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:14:04 +0200
Message-Id: <1539954845-26716-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1539954845-26716-1-git-send-email-thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 19 Oct 2018 13:14:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for the
 "unimplemented-device"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hicemXFobJ3n

The "unimplemented-device" is currently only used for one arm board.
Let's add a CONFIG switch to make sure that we only compile it when
it is really necessary.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/misc/Makefile.objs           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 6f2ffc1..dc9730f 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_NAND=y
 CONFIG_OR_IRQ=y
 CONFIG_SPLIT_IRQ=y
 CONFIG_REGISTER=y
+CONFIG_UNIMP=y
 CONFIG_ECC=y
 CONFIG_SERIAL=y
 CONFIG_SERIAL_ISA=y
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 6d50b03..c604859 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-$(CONFIG_PCI_TESTDEV) += pci-testdev.o
 common-obj-$(CONFIG_EDU) += edu.o
 common-obj-$(CONFIG_PCA9552) += pca9552.o
 
-common-obj-y += unimp.o
+common-obj-$(CONFIG_UNIMP) += unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) += vmcoreinfo.o
 
 # ARM devices
-- 
1.8.3.1

