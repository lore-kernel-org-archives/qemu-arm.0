Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5331913wrv;
        Wed, 31 Jul 2019 00:58:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxSLCHCqVYce1eTQq+wcDw0c1WY62vmrAeGU2iMb2P8fgDdnrt/jJNXWWgRtofqJHRUQ4Y
X-Received: by 2002:aa7:d68e:: with SMTP id d14mr105602256edr.253.1564559903612;
        Wed, 31 Jul 2019 00:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559903; cv=none;
        d=google.com; s=arc-20160816;
        b=mVPgvNCZUiqcDLJTCg3OgwsBgMVniWfKAGlYp1pQ3A3A0+lcSCYo97HuOVyoB3SDuk
         iZKTELWFrw+GoxYaKdWyz8IS3KMF/OQsrYOrhq4fADyh63EexCKrWVL5z8dSjpyZFetL
         /oQExT/LFv8ktZpgM5E6QEa15ivaPuzt9e/bVB3K3rvkcEVYO70xEpjQtNwOcmNYGCSv
         YXrm162ntdjFrOVn64mO4Rddrk5gZgdHTf3udQD1l9y14HHJjHnXYUc39VuZqc2yGvjQ
         W5FJCP+I0NWxqlMslcb5aF+o/9rQ8MnzPhMtTTnh/2DB8PFMf4mS4avtyn7/77WWFi7T
         e0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xgWp5HgXNMxFRa5TqN3l7Lkpf9xqYNKQHGMPLw9g228=;
        b=gY977DQ5vD+BlaaVwolmsuKHp0A3YOja8fxdDEuEALQH74pkezTWFE+txH0VfjBStw
         nKHpQCglZ9rqqO+FvxZT5v5xtKiKjyiVPODqQ7wktvrtTpViByg6ucMthkNp62ArJiKv
         H6OipxD8tJU34eWeCx7g0hcPwCffd1Jg/WhlPhUYbMe5VY+gzU3SjszqIaZHgkReEnzk
         5Jw3Ue4QUmWaSjDYs2uhP/8hQtUS94pc3vMve0JD7mNpiS1Yg2bmVTYkUp8UGJR4KD13
         Stzqp45y4cg7BKfewwKAFiBEJ+5faEdYKSnLd7aK0Z9G6bYOQHgyuFUbbbaqhzs3W416
         YEjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh1si17635398ejb.11.2019.07.31.00.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjV8-0004PJ-M9
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58604)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjTv-0001iS-Eb
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjTu-0007wX-EI
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjTu-0007w5-7m; Wed, 31 Jul 2019 03:57:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E2A73B71F;
 Wed, 31 Jul 2019 07:57:05 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFEB85C1B5;
 Wed, 31 Jul 2019 07:57:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:46 +0200
Message-Id: <20190731075652.17053-3-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 31 Jul 2019 07:57:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/8] hw/intc: Only build the xlnx-iomod-intc
 device for the MicroBlaze PMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVExd53tFkU/

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The Xilinx I/O Module Interrupt Controller is only used by the
MicroBlaze PMU, not by the AArch64 machine.
Move it from the generic ZynqMP object list to the PMU specific.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-3-philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/intc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 03019b9a03..f726d87532 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -3,7 +3,7 @@ common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
 common-obj-$(CONFIG_PL190) +=3D pl190.o
 common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
-common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
+common-obj-$(CONFIG_XLNX_ZYNQMP_PMU) +=3D xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
 common-obj-$(CONFIG_IMX) +=3D imx_avic.o imx_gpcv2.o
--=20
2.21.0

