Received: by 10.223.150.237 with SMTP id u100csp128074wrb;
        Fri, 3 Nov 2017 11:13:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TpG/SChFW0Z1+Xt61xCaIpXuJ3FT4cQnZQ6qm2X9zDBP4daet/Lrr3KtQxfRX6ONKc1Gb4
X-Received: by 10.37.106.86 with SMTP id f83mr4995283ybc.332.1509732794446;
        Fri, 03 Nov 2017 11:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509732794; cv=none;
        d=google.com; s=arc-20160816;
        b=YIZyhkt83Wga2tCW8omePs28EzU/0gRYh9YB0ZsnMPdBwxxiRrq2ihwM7jEoU2QLn5
         Qbq1Id08z83anapKRK6dM7oEmM0vYIUvSXjJ6eBjbLtdkxWOvVVv1qayWrKRla4fqiTO
         pXpdYlMcBs6n1xnD9H8XX+ZyWvJfC1dyYG4+1DHEr5r72rBt4cxKGeEKBHg0AeQAFaVJ
         8tJ3CRKvwrcDTDuEI8CMnMXxXHFSUuVZUDPmlHztqk+CQ8gdXRn9VchmT+pkn0CknUjl
         WUBA7VhOTFcstwXph7NCP2RfruC8Nkx1DZHLsMNCFyeq7r/O4HSHINTNxMMPOUftvjhs
         jefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=utVzXj62nawxjBGop6kRmvl0DDBGSdvhykAAt3XDWbk=;
        b=GjKRGI70/a8ErpFJ/X6TQaIB09ggg3EUl3nEob3gtLUvhghnIrRLwPIt8Il2NtMdAO
         ZQHP5R250A21TFd50twg3kwfO8yI0kdI4kRZid8OOdCFISie+2AHGK6dBpqPMwG6KzSL
         7AjE888kGvJ6WYXpYzpsWXfTcsEU8Qv7mX6bm2/sURLoPVnEgjrNKcU93gdkahleAsmZ
         SXQ10bZgwxoKPzVRBOyrp3vmCXhRcjYuWF4F8x6henGoAQUWK+7i4JqLXdfxBRqS9Wo2
         j3/QGrSA3DJFxYQFPSW5gTlG89cWFvvST0ipjzjk0/ZD+HV7zrfa4JGCubFqkjt3Jrnm
         vlbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j206si1202322ybb.707.2017.11.03.11.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 11:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAgSv-0004bE-Tu
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 14:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eAgSp-0004ax-TT
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 14:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eAgSp-0008MC-15
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 14:13:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eAgSo-0008Kt-QE; Fri, 03 Nov 2017 14:13:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eAgSl-0005GX-Mj; Fri, 03 Nov 2017 18:13:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 18:13:33 +0000
Message-Id: <1509732813-22957-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] nvic: Fix ARMv7M MPU_RBAR reads
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Js/YOFmvOYq

Fix an incorrect mask expression in the handling of v7M MPU_RBAR
reads that meant that we would always report the ADDR field as zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Doesn't affect v8M, which is a different codepath.

 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index be46639..5d9c883 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -977,7 +977,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         if (region >= cpu->pmsav7_dregion) {
             return 0;
         }
-        return (cpu->env.pmsav7.drbar[region] & 0x1f) | (region & 0xf);
+        return (cpu->env.pmsav7.drbar[region] & ~0x1f) | (region & 0xf);
     }
     case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
     case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */
-- 
2.7.4

