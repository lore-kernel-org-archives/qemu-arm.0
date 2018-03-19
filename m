Received: by 10.28.91.67 with SMTP id p64csp2685275wmb;
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtan6xXUFlSLyKSKXxAz5mPcGXaTn1wSefcE1VxBQa1EhQ8eVKxJ2w2bZpuKBb3q7d9hr+N
X-Received: by 10.55.110.197 with SMTP id j188mr17744762qkc.155.1521470286415;
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521470286; cv=none;
        d=google.com; s=arc-20160816;
        b=rYiE5gjC1+DFhMsb8Cc7jIDBucNBIlailJQRvd4Uxnr+N1ycYwBrVP+TclAJUkwGFR
         kvWyd3YqQSRhy9jXYS+Wb613ccimnyS+JlTAW52RmPYKW4y7xRUIpqj4Dm4igxaekNwf
         FlkX1C4V+9U/7pGIZxIaBZzqTNYCXjlS0eam61GdASixWy42JWV+ImBkJ+S78sdvRIIR
         8DYpqvsuLjmUQHFybIIo3d/r4JPaNvnxYwtCNF5tA+yeuISirJUrDwrZCoxGBfOoMspg
         tPukKb9akoKYPSgmetgIkkfcrkAWRm/zUQuqGrI5zVlBQRJJlHRJ/7Pdsau0z0Jkz1ll
         sW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=ND/6IoypmRjcwftxiIXzDLHMcbkrRlRFzQLcrLEQeO0=;
        b=mNEvbprqbbymEmv1btIRxM6VcSVoi0H6322Zm71y4F68j9z3J7ROdhgBymQwYfc+aM
         ZkVHHToFzR/PdAVLMcnPijoN3zoeS5caAv55OQTAUC6Og18chFogl8GF+Y+GU9PXyTa2
         kT0tuHYXkHp1srlE9Ai3FaGIdFdvSNcP5rlSUolgT7MoG4reKyIaUeTa2QZ65OgZJjty
         RN90ETUMFQZ4QL3NpvPl3t44T57NwvFNeITjwtzjI/7D38NRNkGgtnr3+XKSv6sjtLUQ
         HdQ+umwY/7lpAjZEyndZyayG3GtymZsK0rm9zthGVL/cowcI391jJrp44ZSfkIQgqA6M
         mzJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o37si158355qte.241.2018.03.19.07.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 07:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exvvJ-0000lf-RS
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 10:38:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvv9-0000lD-Vi
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1exvv5-0005ya-8t
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:37:56 -0400
Received: from [45.249.212.32] (port=46587 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1exvv4-0005sh-Ty; Mon, 19 Mar 2018 10:37:51 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D563E91A66C29;
	Mon, 19 Mar 2018 22:37:44 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.361.1; Mon, 19 Mar 2018 22:37:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Mon, 19 Mar 2018 22:36:16 +0800
Message-ID: <1521470177-14760-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
References: <1521470177-14760-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH 1/2] arm_gicv3_kvm: increase clroffset accordingly
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
X-TUID: wpK22yPOZuyD

It forgot to increase clroffset during the loop. So it only clear the
first 4 bytes.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ec37177..7000716 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -232,9 +232,10 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
 static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
                             uint32_t clroffset, uint32_t *bmp)
 {
-    uint32_t reg;
+    uint32_t reg, clroffset_index;
     int irq;
 
+    clroffset_index = clroffset;
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         /* If this bitmap is a set/clear register pair, first write to the
          * clear-reg to clear all bits before using the set-reg to write
@@ -242,7 +243,8 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
          */
         if (clroffset != 0) {
             reg = 0;
-            kvm_gicd_access(s, clroffset, &reg, true);
+            kvm_gicd_access(s, clroffset_index, &reg, true);
+            clroffset_index += 4;
         }
         reg = *gic_bmp_ptr32(bmp, irq);
         kvm_gicd_access(s, offset, &reg, true);
-- 
2.0.4


