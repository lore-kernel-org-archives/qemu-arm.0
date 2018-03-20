Received: by 10.28.91.67 with SMTP id p64csp3505099wmb;
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu94OgxklbcWc2sPy6HwQJLLoz9JSVWEzJ8euWGJ1jAtpi8fyABKjkFJmpJNsEWPwLfUkog
X-Received: by 10.200.9.121 with SMTP id z54mr22381399qth.87.1521530880653;
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521530880; cv=none;
        d=google.com; s=arc-20160816;
        b=zF8LOXV20qs2g4OimSP+cR8jXpAYAMIIKGjxAa8ALYCmm2g2XAfZnCdtbvDAq7CPgZ
         ywm200zvcrT9oDwaZPCZ7Hd7VeAYRGgjFlMYlMfkfM3f8EianXs4fgD7VZ0Jbicjmdj5
         GMXRyHf9CUgCKKRbs6o71sI4ahBDschO6wqMqfFznCwINICD3GHZwavsXJTaTaKyED1/
         9cSwBAhF3tbZNq0WG9LHeMdR4Qj0WF48ZBPN7T0SIFCSntxdWYV5QwGULlhhiM8HUdmr
         Z/BiE6FHZ6q2BLNTWvg0+b48yFRFQo1uTj4p+iaY0Q7yVvVnE4AuqJAqppSXNqsF2Joo
         PsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=WNGZJAuEqaaVeD61UKCbBV5sMlCBq7reBlFwCPRqwPk=;
        b=eOmPwLm90+iKT7ywgjWK+uopvxjj5KAnD4wBh3EwLX2LHvuckFBg34GHoSKWgisgqV
         YK4uGZP49H0GXxVGfPRC1jTe11oS+zeMTSG5Ukmazcd+rCboYQmKUIeD9kWfcw8J+NNC
         IEZypcD3OW1hOF/aEsDSbRAvyk58n9xOOLamuR+sYF6UZf6upDy5UPBRffRcRw6WyKOe
         3Vu5Suc7UKSLNnI0a7ofJYh4GggyCDXO145wzgDe/sI4poe441mliR+M31rc0LNSj8mQ
         ib1c5y3eyQO8gUoFmSV3f0YRP5rOFF6aLJlLprAqhDy8tV/+9XmKfeZdjwYCrT3H9rpI
         jiwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si1347919qtb.199.2018.03.20.00.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyBge-0001Bx-56
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 03:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgU-0001BP-Hc
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgQ-0008SS-J7
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:50 -0400
Received: from [45.249.212.35] (port=43375 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyBgQ-0008PZ-7q; Tue, 20 Mar 2018 03:27:46 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4446877A7E910;
	Tue, 20 Mar 2018 15:27:41 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.361.1; Tue, 20 Mar 2018 15:27:35 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Tue, 20 Mar 2018 15:26:48 +0800
Message-ID: <1521530809-11780-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 1/2] arm_gicv3_kvm: increase clroffset
 accordingly
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZWiN1T66Ddf

It forgot to increase clroffset during the loop. So it only clear the
first 4 bytes.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ec37177..3536795 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -243,6 +243,7 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
         if (clroffset != 0) {
             reg = 0;
             kvm_gicd_access(s, clroffset, &reg, true);
+            clroffset += 4;
         }
         reg = *gic_bmp_ptr32(bmp, irq);
         kvm_gicd_access(s, offset, &reg, true);
-- 
2.0.4


