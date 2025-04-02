Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752011njd;
        Wed, 2 Apr 2025 15:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSNrwmONCnqi2JSd1brnyLPmhaTBaKVl6OVzHneFcyTsbMgI04vq8QaZXTO/mZTFzlJhxaBjrHCeIIEA==@linaro.org
X-Google-Smtp-Source: AGHT+IEF2M/UbpOHVZ2+kMW1nceQ7W4V7TZCAHyclWbPe4HcytdrDy9Ppd99KAT6NQj5g4YgVjab
X-Received: by 2002:ac8:5fcc:0:b0:467:6b6b:fc1 with SMTP id d75a77b69052e-479161b9831mr20710701cf.16.1743632681344;
        Wed, 02 Apr 2025 15:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632681; cv=none;
        d=google.com; s=arc-20240605;
        b=EaJoUWMnaf3lpopZair1Jqm9o//FwHpGU4LZCRWGuor2RlONC11Zy11Zky55gdBRfw
         S/LD+TMj3BGWPFaEvdmuZ18/7vLZN5UjxAwYoWRd4fnZJ5/WBI37LG4M2nyrGmpGrVjT
         1nRvW43+08v0oP3zjgsYol73NJdCWG3Bt6F3xM2+5O2n17HZXQ5cylcMaWLk7c44fXgy
         lku2ha0yTgi9hiaGzo7y3eFMkdk2mSR9DECUAiby7Akn6JZwr7m+x9xwUEdh0SJvHb8b
         PBtvyy+O4Zg2IdpWBToJLVm+0JcwX4Xgd6JuKha5whJSK37hIHbBLw4tbFh+a+MI/rEa
         i2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NVShLiex+VpxD1+UXUcJFbn1pbrK3CPKZRrEhd996ZI=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=CgucPhi5IPHIcMjj3P+9kATTPw1cEKBEgLRfcxQuD48q+AlRs5LfBsr0xer/ee9Cqb
         3BdILcufQwZyOe5fzyZl9UpACs73LWdXHzMxd1WjSK2K8sJGlZeybLT6Cq1Vm47dgHBF
         HqanHrrkfMiEDfTEDL/YlAkECKM2TCvOgZqLXD0Pq+d0d9s7rz7tdNMqfgdfRkhwkxLN
         AaDCo1lGBWUGF8n5/+af89UWa2gbE/60odVgQ1s5hwkzJTfz7BFUZi0o9A0RZ2gCgaEW
         rGsPgS80PnijBzKY4eqZbJZiGquR3oRwK+kMYl0edOH4By0kHalAfr2n0OHYyqHamCDQ
         c5hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRRqEPTg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4778303e4b4si121562811cf.327.2025.04.02.15.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DRRqEPTg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u06VD-0004gd-6F; Wed, 02 Apr 2025 18:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06VA-0004gD-Ps
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:24:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06V8-0002Qs-AR
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:24:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso1511135e9.0
 for <qemu-devel@nongnu.org>; Wed, 02 Apr 2025 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632640; x=1744237440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVShLiex+VpxD1+UXUcJFbn1pbrK3CPKZRrEhd996ZI=;
 b=DRRqEPTglOrbpVV2gN5or4erMAauYzpfmG0BOpJ3Wb3rktuprK/Qp/jqhPLMg6vSGz
 J5LudnUkG90aDIQRXYquqlTZk6/Nebhrw24g9lzzntlrCxEIQkakBnr3M+ogdGSbp9uu
 8kG9bR9JJ4v+LG/3E5hrV7qp2vKPV8G5IThghCyljgq+5EEM2ICOJ7cbqGSi3lhUrqzm
 V7QUbOuUoD/HzGOdkcCRYAuMrDPC2hfqvPbvw9gTFdqa2bDleTOL1ENgh0bx7LIki+qF
 5Zk7Me1JCMMrMOoDWeMBNENaqcKbJI+cNi++a3X8F5ZNG5mpsZ8S3HGB4TW5zlXSkRfg
 jKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632640; x=1744237440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVShLiex+VpxD1+UXUcJFbn1pbrK3CPKZRrEhd996ZI=;
 b=hvxP2iJs9F0uIk4ngk6zMGMCKL2gpKFAd8YXr3RL4IiZ61zF8tnmmouWCCb5V+KyJi
 c+ZbQxKLkpPXF6iqHzb6QVCSs4X4/8Hd8VxLhrUSsBZZkTocDeKKZouT3B1rjF8SW+ai
 415ej1pn06ccDF/k75hEUDuD5X0mIpRADMnREV9398im+nWrRPxYdTOWo/zsbjDH0d12
 tXlYccjjAWSs+yY5Zf6atiKISHM5Mb/Q9mljHw9XYMXWnmR2J6vld4tGcF/5OHjau2oE
 sNIwiiKD9MIrhFw3tsi7DH6EXfKMX0ykCGoMi5PHnknH8ZRdv+lnWlPmRz31zEaMSBqq
 2tLQ==
X-Gm-Message-State: AOJu0YzLdmYOIvez/S7flLM36N/ubwis78+2YszNR10k5/3NlJr5oGZ6
 dxLeiHMYSpc92yGMeSC1GT9Y6NtG9EPNn/G43W0UMWFsf+htBBTZc7ZQ+t3LbON9jqlGJC0vVtf
 Q
X-Gm-Gg: ASbGncsxA+PKlpwpqT88+iCHldTqCnqcJQvcPK8uxGFOUKSBDEc55ZBZdnHo2+MX4Xh
 G2V8vCkXYf4zWNg8KgCU8UkrW7cHjwv8vqn7Uk40gdPw5cyJFbx/yP6/tlcNz8cR7bcxXlnTDS5
 gfL+HzuG9qvy3zmZJu9RnELhCMknZ1GjM0zztM79rIviFUF1yckB52Kf4/fNskXT/DSIvpmgrZR
 q1aEUnSmFX7PC6Y4Zd4PYQDn2Xkc7cuUFQj7TTbSX7PuW+pJw6s2Yfx1EXCd81nPmMLRiUMqzzF
 81dDr9cjYx8JhQtwb6SE4Nh4jAJ/jMWaYZYlkKZa6qB+jX3SdYq2aNbzI5rrsND5AxuQVwXxCxs
 aA5xkdu4WtffR+fFXCCY=
X-Received: by 2002:a05:600c:8711:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-43ec13411f8mr3566545e9.5.1743632640284; 
 Wed, 02 Apr 2025 15:24:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec169b8a3sm3815005e9.19.2025.04.02.15.23.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 05/13] hw/arm: Remove unnecessary 'cpu.h' header
Date: Thu,  3 Apr 2025 00:23:25 +0200
Message-ID: <20250402222334.66511-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H4Mh5npYCCsg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 1 -
 hw/arm/highbank.c   | 1 -
 hw/arm/mps3r.c      | 1 -
 hw/arm/smmuv3.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index b452470598b..04439364370 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "exec/tswap.h"
-#include "cpu.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/irq.h"
 #include "system/blockdev.h"
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index ea3621e4f87..0caa08631ad 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -35,7 +35,6 @@
 #include "hw/cpu/a15mpcore.h"
 #include "qemu/log.h"
 #include "qom/object.h"
-#include "cpu.h"
 #include "target/arm/cpu-qom.h"
 
 #define SMP_BOOT_ADDR           0x100
diff --git a/hw/arm/mps3r.c b/hw/arm/mps3r.c
index e9abbf00b43..604f6845fde 100644
--- a/hw/arm/mps3r.c
+++ b/hw/arm/mps3r.c
@@ -29,7 +29,6 @@
 #include "qapi/error.h"
 #include "qobject/qlist.h"
 #include "system/address-spaces.h"
-#include "cpu.h"
 #include "system/system.h"
 #include "hw/boards.h"
 #include "hw/or-irq.h"
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4362ae6aa1c..df3f5a707a9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -24,7 +24,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
-#include "cpu.h"
 #include "exec/target_page.h"
 #include "trace.h"
 #include "qemu/log.h"
-- 
2.47.1

