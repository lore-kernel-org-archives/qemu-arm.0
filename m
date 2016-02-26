Received: by 10.25.208.211 with SMTP id h202csp3334138lfg;
        Fri, 26 Feb 2016 04:45:50 -0800 (PST)
X-Received: by 10.140.133.133 with SMTP id 127mr1667651qhf.42.1456490750830;
        Fri, 26 Feb 2016 04:45:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si12990000qgd.110.2016.02.26.04.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 04:45:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZHmI-00036M-D9
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 07:45:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aZHmF-00032s-Dn
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 07:45:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aZHmE-00046D-JY
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 07:45:47 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:34426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aZHm9-00045Q-D1; Fri, 26 Feb 2016 07:45:41 -0500
Received: by mail-wm0-x242.google.com with SMTP id b205so8890655wmb.1;
	Fri, 26 Feb 2016 04:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a+JFbn0ekIVDp6qzJc5yhSSY6pSGKMoLpPgkpd3vxQs=;
	b=qVt4SY4rbcHqvjV062+XhGHK4CG9T/dF0/0RuDWGsqMggJtInTy67T8rde3kmHNNR9
	cidCLsfP/KGFOrBJq0vz9e1uPXp8F2+YCQtIUJN7p84fHiYyf7W4q/NWVHrv/gT+rgzc
	JzVdqtmQj905veJXWsB5jsr+VN5F3ngDlUemioHF3vw/WX8vPFOFcXUvdk1SZ/W9CmFv
	lWs30gN7V2cq71/EIc1BXTkq40OypLgSGj9Kv85rD0vJ/Lxj/SYatL/SkbGMyUUXtoTQ
	OsHBnCgs3PVKn20qYVSxZrJDD1Quw+PAig4Vdl8pSegMrTl2DoAl7kOCLTnNfGStEB7m
	4TwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a+JFbn0ekIVDp6qzJc5yhSSY6pSGKMoLpPgkpd3vxQs=;
	b=LpGXhUYjwoECD8idRZp3P2H3bHiozdNwWk2yJo66z6ZtlG0rw8PpUKtrRuJVMXvmZK
	XXt/vos5zrHMtjztBEhkkf/mXbXH4eKNZL7MENj82cDtpqucHk2tkjOemofmLEr7SAft
	HreQiFTGilPQRwcAUKq8Tj/8NZ6bFVxMJOZRq/q999t8CmI8yBor/tHHOHCxE7hbGpnG
	0Wuav+1/tzXIuPF411jHiRFSPE6M9w4bSpcrn9/qMbcJV1U5tBHg1pOMup5ROX9Ij7s/
	8+ZBbqduMxCS8GPcZsNuSPi1L1QInS8Q6pMvnOwUZZ2stG9LEsXXfPSolBIySZIKagxT
	6frg==
X-Gm-Message-State: AD7BkJLzvZaZSzHtQWozFcV9gZQZX5vFEN8ZTfkXP5YWCZmo/G17iGxZ6PKVOdOSci4Yxg==
X-Received: by 10.28.107.140 with SMTP id a12mr3184877wmi.77.1456490740666;
	Fri, 26 Feb 2016 04:45:40 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	i12sm2759156wmf.10.2016.02.26.04.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 04:45:39 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Fri, 26 Feb 2016 13:45:39 +0100
Message-Id: <1456490739-19343-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: edgar.iglesias@xilinx.com, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v1 1/1] target-arm: Mark CNTHP_TVAL_EL2 as
	ARM_CP_NO_RAW
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C9g2HtoDBfF3

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Mark CNTHP_TVAL_EL2 as ARM_CP_NO_RAW due to the register not
having any underlying state. This fixes an issue with booting
KVM enabled kernels when EL2 is on.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 85a6685..601e3c1 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3631,7 +3631,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = gt_hyp_cval_write, .raw_writefn = raw_write },
     { .name = "CNTHP_TVAL_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 2, .opc2 = 0,
-      .type = ARM_CP_IO, .access = PL2_RW,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
       .resetfn = gt_hyp_timer_reset,
       .readfn = gt_hyp_tval_read, .writefn = gt_hyp_tval_write },
     { .name = "CNTHP_CTL_EL2", .state = ARM_CP_STATE_BOTH,
-- 
2.5.0

