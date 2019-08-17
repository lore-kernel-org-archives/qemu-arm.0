Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp452757wrs;
        Sat, 17 Aug 2019 03:20:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBuk4OSLk6qiMZWhzK/L4jKGqLJUTjpxdpfI/dbE5nmBAlLQYiOBf+WOXYbip57ceuDM7i
X-Received: by 2002:ac8:548c:: with SMTP id h12mr12359889qtq.273.1566037219839;
        Sat, 17 Aug 2019 03:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037219; cv=none;
        d=google.com; s=arc-20160816;
        b=ObosRTbRrW+O+VTSTCGSp9Qf8mhyX9rYi8g99tWMHi+dz7iUqAMtVLOrgOjTOqHri3
         Is0NPvZFtXX6lPfyA4wlI/HmlWdiHpAdGYysk1dDz0grr8H0XKIctGhopKgCwkIl+dfn
         mWN2szG5LodX1BOsis0b3vzr2v1DnuDY4BBYrq+Ct/SlD4q6eH72e/Irc/Eu7DfEXgl2
         11J/nbw4SQBvHwnz+yBKIvdmn+8wnILwCXx1tLBGajHlqahW3kEqveMpJqy3WHQiY4DM
         HrrfOAY+UWDfUxZ1IoT0WFkKqWAXW7KSIXbdgIQdxuRM4GR5QcE80rFVXSH0PM63WKLv
         wk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=amGg9fJJ2NoJvoMI470j7Cebxl7Guqw0ZeW0TJW2D1Q=;
        b=nky3q+xAEENYMbHvQYF126nkrYXchyfr/azWKsf8qBm7mydJ+1FW33uai9I5aRtd/X
         ZzWq7mvHoSEBY7iG3ekwpDDPYDYi0deYGtLXOb53HMPmBQhEh6Ac4zx7mNAdxAoXeP2N
         K63fyXjr4ae1gHCye+wJDHdEZ74M9hssL3dY0TH95qX751yRF9SZpvW/zU5ZEHX58fTk
         WSzl/iP6+oBeot3a4VyMamydPsqC8enPKLNmjOIYKdAzefhDbvCzrcjtyLF86Na9C5uY
         utcJ/StJbyjYpzx22AfnkU/nls76Bo1s3QGoC9RFKmrKbxfW/2+RL0tKwatMw5gnEMBk
         4+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l29si5010082qtk.192.2019.08.17.03.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:20:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvoo-00014c-PP
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoK-0000kF-TU
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoJ-0004Qa-6Y
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59776)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoJ-0004PQ-1c; Sat, 17 Aug 2019 06:19:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B3E7C1951D54;
 Sat, 17 Aug 2019 10:19:45 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 703ADD1E5;
 Sat, 17 Aug 2019 10:19:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:25 +0200
Message-Id: <20190817101931.28386-3-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Sat, 17 Aug 2019 10:19:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 2/8] hw/intc: Only build the xlnx-iomod-intc
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
X-TUID: FnTSoslWPYs1

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
2.18.1

