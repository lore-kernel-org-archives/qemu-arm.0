Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0264310854B2
	for <qemu-arm@archiver.kernel.org>; Sat, 14 Mar 2026 21:57:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1WyU-0000ce-Ta; Sat, 14 Mar 2026 17:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1w1WyU-0000cP-2A
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 17:56:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1w1WyS-0007kJ-JV
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 17:56:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-485409ab264so23190165e9.1
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773525402; x=1774130202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9YPOVjLnIngm/XdwqAsuk05kiixPnUAK1J03DTFzlQ=;
 b=Btflg1TLzmgRYhoFLgMwGFfpFKgTXLnfRFydBRFYh/MLc/eYNqQX8Ywn0NRml6dYrG
 kbHLmrOB08I+mgt5oHMVF7CwLBfciFTTlxT7a3+JFnIRuJf7DREoJyjOUKWyGqeTpkgK
 dRkO9vqIeHhxRuWwJWvzzjjRLOr6L+OYjmFOkJxJ/+JBrQa1G61ENkseCRmmYhQUepIC
 Lc3O+zWp8jWPIYJmJzYmzdvetDuwMMJ1QLmrQWheRNDtXqgxkA6+OrrUFyWmaYFKKVcT
 EM59E3adLywx4J6REWHPeRHFM46UYTyd4NEHChJEMHQHXUdJppIWgMvXXIIVJeb2kLeU
 RbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773525402; x=1774130202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9YPOVjLnIngm/XdwqAsuk05kiixPnUAK1J03DTFzlQ=;
 b=dJ5/ge7qjU/62qUvVIPdW2jWJ0G9llvfE6vdZaxIxQtLi8Sx850HI/3WGdlCQNrdCr
 zeAvIH06abvYnICwzSrpRUGiFtu/751Z8V33/3DeDYMBZ63TOicH3okCwwiWPPRPEjHY
 0pSPNGb8MQEyfWREHxSanyHbIzTmUOfB349STQd0KghLeNrc95g7q/8Kt93J3HnyON4d
 o27WMO1thxHd2rJsrDaCwuroYlj9/1awYet7AXnR92demtDVZr96joQLTXy3q6E07Xjb
 ZRDt/rE3B7c0KkhYNYTOHTuEwR/9Q7pIkvb/Joml7nYMoTy8EVdy+q5Anw/odu52FiBX
 3FUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFlbAj7VwKwTjGlTHQ1OoBgQ54jE0Q/cPPCBwQq5EmikHcm1M3JDGn5ZTMV2sOysYkkBuNDmukMw==@nongnu.org
X-Gm-Message-State: AOJu0YybyGqOR5gakgWex3C+a9axAmZ8ik0G3gOY7JLbh85bDRm4SHHw
 OSvccNwndvesL3my9SbGPaA7XNnkMJwKv8nnwvYT8fd4lmn1gEL8EJxr
X-Gm-Gg: ATEYQzx5pjXKxMSTnMieGGC8srI92Nu68pJSJF+nXGe4ha4m1+3qBCvXg/OKyq8Z//j
 Ucu5Od4pLI6sJudpjGvmHMMJaZmuG/+xBebHs8v/5C+fvtdhoNOs2w1uC26K3PObosRFRL//B1J
 TxqnrZ1y9v2v5vZLlzm9xt4VKpEJDMj4kz8QDA4/hpEEXeybwwxz+cyj/oUfHHKQZOMjmgIs/UK
 y7hJs5POuCnX9JcJJyvYvf59qoQkZRTyQs2lxXaUZBovsX5tKdFU4C7c4SmuaTg2SmjLgFCXlxF
 xFj+jdrJNkB6suPCDiJy2DA1U6DSLboAejpbp9DsUoj15rKsevUL7ry9hke31CGSYw/0jqJLgfP
 CxI/piON9Rjyps82NbNRorU7QYEi6GmF/eot3ZpCF4MzgYPS4pHq/FjPKe8eyR1QW60PjnpfYBk
 ccfWld55bu18dF8YkHv1Wh+yQ3eojQz1tJRU1f8bhOjLLqblr0dzqOWGV5L30=
X-Received: by 2002:a05:600c:3e05:b0:485:3428:774c with SMTP id
 5b1f17b1804b1-48555ab09e1mr118589455e9.4.1773525402358; 
 Sat, 14 Mar 2026 14:56:42 -0700 (PDT)
Received: from osama.. ([41.238.114.180]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fed7sm282505475e9.11.2026.03.14.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 14:56:41 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] whpx: arm: fix ID_AA64MMFR3_EL1 host feature register index
Date: Sat, 14 Mar 2026 22:56:13 +0100
Message-ID: <20260314215613.141373-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

IdAa64Mmfr3El1 was stored in idregs[ID_AA64MMFR2_EL1_IDX], overwriting
MMFR2 and leaving MMFR3 never set. Use ID_AA64MMFR3_EL1_IDX so the host
MMFR3 value is stored in the correct slot.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 target/arm/whpx/whpx-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 513551bec1..98889426d2 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -683,7 +683,7 @@ static bool whpx_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { WHvArm64RegisterIdAa64Mmfr0El1, &ahcf->isar.idregs[ID_AA64MMFR0_EL1_IDX] },
         { WHvArm64RegisterIdAa64Mmfr1El1, &ahcf->isar.idregs[ID_AA64MMFR1_EL1_IDX] },
         { WHvArm64RegisterIdAa64Mmfr2El1, &ahcf->isar.idregs[ID_AA64MMFR2_EL1_IDX] },
-        { WHvArm64RegisterIdAa64Mmfr3El1, &ahcf->isar.idregs[ID_AA64MMFR2_EL1_IDX] }
+        { WHvArm64RegisterIdAa64Mmfr3El1, &ahcf->isar.idregs[ID_AA64MMFR3_EL1_IDX] }
     };
 
     int i;
-- 
2.43.0


