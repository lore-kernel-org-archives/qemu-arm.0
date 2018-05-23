Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp325741wre;
        Tue, 22 May 2018 20:55:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKAhpppLvX69AOKIOUS0gOT/kbiezTY5CTJCO7PWZnWqVH6OM1zcMAiZB/Qt2XZoruw3QXW
X-Received: by 2002:ac8:2c98:: with SMTP id 24-v6mr1091958qtw.420.1527047736732;
        Tue, 22 May 2018 20:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527047736; cv=none;
        d=google.com; s=arc-20160816;
        b=uqHUVpNiEbCbsk0rf6Fuw+Odt49T0k52yzffbFZ3LtT8Jv3u5ljw2J3UC4N+vz0fjE
         UjyziRHhF+njOFAMSMABdVka3BQdFgpNst+KH2uuDkURonc8AAJj8je8eD83vAVVAalh
         0yz9DGqR1V8u53QwvEgoBulB6af9I+3b8k5ba0hvAxJFLU4t7GDx0aftH+Ocoz4wwGgi
         NhW8l5Lp1yp748aKLl0YN31eTVgWGnjsdScX5zlh+8oQp2FGeN83fYjGA4p+hKldq4Hn
         vQlqxAZrqemTgYsuzhsjD2yX13YFDPemgpEc1nbBG7Nu29cUM/fyBMVYM0PDRJCidxzo
         xAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=1atNZpoSeW4VeX3mLRFlv6YKH+JJi9Bi3gRNIBBPvkE=;
        b=ybqroQ+kzPYXt+x8OebfzLnhxqWbxBiMGHqqZ9UM8Sa5p6+445lMrijWuJP8kX/hs8
         AP/iIF7saCRzQrVHb+BNFztBvtiqt0X9jLfoaHJa3uvbB+/nrHVevMAhKX+EdSqkvPyN
         jhvPGrZUyDtbZml9JtbxgrC5UdNQW1z+wQsYRn7/Pg1O06BMMNAZepHXR6dUc1redfrE
         tj28NCwUzZtNoiD47XdnHdXn4cw61pHEfThWCkWS2zdVDWQoizbUqwZZBQXLthZ3K6mb
         VgIt/ilaVZrQ4Kd6GYgZFS4PI5HCy1ifyCXx8GJC+erAZ849ZLclFkm/lkA1c+wuXiMs
         m1JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2-v6si4179373qvf.281.2018.05.22.20.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 20:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLKsC-00009P-7U
	for alex.bennee@linaro.org; Tue, 22 May 2018 23:55:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLKs2-00008x-BG
	for qemu-arm@nongnu.org; Tue, 22 May 2018 23:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLKry-0000Y5-17
	for qemu-arm@nongnu.org; Tue, 22 May 2018 23:55:26 -0400
Received: from [45.249.212.35] (port=33498 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fLKrx-0000UD-Hs; Tue, 22 May 2018 23:55:21 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3751458FD13D4;
	Wed, 23 May 2018 11:55:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Wed, 23 May 2018 11:55:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Wed, 23 May 2018 11:53:52 +0800
Message-ID: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH V3 1/2] arm_gicv3_kvm: increase clroffset
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dVFq/vBr0+Ef

It forgot to increase clroffset during the loop. So it only clear the
first 4 bytes.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in V3: Add reviewed-by tag
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


