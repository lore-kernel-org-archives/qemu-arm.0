Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp264535njc;
        Fri, 13 Jun 2025 06:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvzcet3SwJNhuW8xCsxwMR5tXzQA/ZcNNh9140OustGoQ802URjwf84YFkqmJZMyel977EX2k1I+EPsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWaJkyWZg9hCn3oNXZZFEOJtqMUwZOAxzsVwqdLOOrI7XSaWRlBnZgVxO4LxK0KR5HALfr
X-Received: by 2002:a05:620a:4687:b0:7d3:ab8d:4eec with SMTP id af79cd13be357-7d3bc470a86mr485410085a.50.1749822196943;
        Fri, 13 Jun 2025 06:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749822196; cv=none;
        d=google.com; s=arc-20240605;
        b=TdUygXOMbawQhvr+0WuamZOPDYRcmGx+MRMEw60HsefebLZcC21wlsmhHWViGLQa65
         zdLa/Gy9WGKxGF5Fla1ZtwzPDbgGeNG0aGT4Rh/7a+TW31Tr75uWeTxwv8HtTaY+2FXn
         i/MTieZ8Kf7WUSBFyQ7IqXGJ5ncOaEypW4mZiAncFEgELXGhXLi7dEABYg3k1JRiT6v3
         T1d+xvlMK2CIHDxSemJjlcePzaybfrhtwDcQpJlonleDrt86FwbkmvMLuEF0HvkGbdcu
         nlO7wQUOv1d2s+hzPrstQ4L/00xhohTfwpuRXi5+OUAigPXUzGqnzasBXKPMQoRp0S7a
         btFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gBmjh7KSh/lXhoXTOuKukePRCVIS57DizEDl33AZgJw=;
        fh=X2dDt+3Lvg31+5nZKRV8fJCiaCcM59n0JDz7rKqnEUA=;
        b=iNK7A7Rqe7OeTVLwRbQPmLVBNxugaUu6neHWW+Y4uS0B9yETwneKB3yYesg0uVabjW
         OI0JVK+8l6N+2pJkqH2AhIYl6UfM26Ztsxwnvjc03iUI8p96LOgUM/9LE+DOLx88l0/q
         duz5PkoC+V2VuRTHyB0/MgRdUDtYa/vtvhFhp1XZrOweXWLLpg46hm1Ued/lBAGHWg5c
         e8Lfqe/94xuhFlWYHBnaXl0aHcCvJsFbo5y33tJlkMyHyYlbT48gwP9IgQUlxuCGxmqf
         UpU/FmCTcoX4+VtYH3XYlmKU5Qo6NFeql10iJ+BQ9KMguSqOq25SKcv0NZQ0wRR/3zRg
         73rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=RrBhSCwj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4cabb7si30367881cf.363.2025.06.13.06.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 06:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=RrBhSCwj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uQ4gA-0001uq-Im; Fri, 13 Jun 2025 09:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4fk-0001iI-Cw
 for qemu-devel@nongnu.org; Fri, 13 Jun 2025 09:42:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4fg-0006Gt-0X
 for qemu-devel@nongnu.org; Fri, 13 Jun 2025 09:42:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4530921461aso18725185e9.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jun 2025 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1749822134; x=1750426934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBmjh7KSh/lXhoXTOuKukePRCVIS57DizEDl33AZgJw=;
 b=RrBhSCwjuNc/LO2Sdnu6jrTAqIUHQrdKxrKoTrMMKNeKXKRKJuWDpis0HuhqTVcoU3
 giFJiUJM/e6ZwEwMFy50zXPVzGs9289qmzNjTQ102xk1LZHIodt0Z8Ex37MeQs3RNki1
 Aph49V9mcoWqKLqghT8Zj1wyejOLLzpxWtNkedL17tGshUmnlwujHVTbbgbOGULdLxrP
 ZAsxUFrrSYAavI8ehi+Y05ZYchwRDtRJbWaY4YGIgSXuRweYWrrM6akRN/XrOPHEtJQB
 PRA5uUcAnThWJmmf3mS0oM7Cq4j45djmrznvAgm9ZNGvzgrhI6sdcWGJgz5Wjdoo+GAA
 NiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749822134; x=1750426934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBmjh7KSh/lXhoXTOuKukePRCVIS57DizEDl33AZgJw=;
 b=rNc2PSR9SQWM2iYUZh6Q1O+t0DH2DRKV2y8LkIoFHlQCcFbXApEz+TCga38HyrXSHg
 /rqVtG/bIdP7E501fyfuQKDohJF9hfaJ3sQF4cQTTNH8oaV2CagSBIdKmReqRs2tzrjH
 ddgOClkOSJJdbusnYi7FVhPcKMorlbcPf9Ier/ExDlHUttPtKpidMxU0D61Re0VvnY0Q
 BT/TChLpNC3wBmROLasMo5dpUwnAVuCPRy8vRHPnTTZmOuDFtYn3LNzZsO8Wqo8t9KRx
 n0FnnAJfTLy6ALmCGXvTPv/BqbbHHwpEbaNuyn9qnlKTg4n1ux3tzrU/tOAnDr3dJp+m
 RCwg==
X-Gm-Message-State: AOJu0YzQL+mBrEvDsBdpEyBZpfMg+GpD/8RrYtcXJMzOJz+1fS0mG+TF
 qydthTYJPmuzUGvLgIPB9+ospfqeFkmZUA8nAvta01Y4XCUwWvJPT6nfFeFqZFVT+GJxjmvsw9V
 i/Y8=
X-Gm-Gg: ASbGnctpcPwjqgnwkUuy4+22CYGJxUD5Z3bCWZ/90oxcDvan7p6zL9SUMXsqb1EtYre
 Sl6i0XXYijld8HfYDk+htZ1LL7SeDq/skeRxzxfPz7ttaUh3Y52XmtmVhI7tHvMs/LrKIHwwkfP
 DlGFzUuxB++v6pIlYDuXnNPv+EKiga2XAIXZhkyVnlFn1TCd04VnIaa3XoMgSYGMVzbbw/wReGQ
 oO2z8WzJRoTrkiilP56fCuVl+Q4djZxbNeybAsv0AO5s7OxGp5bgmTohLn/SNHoUxxyeezqvKTW
 0OFzqDvt39I9T3fpCkpRcVciioPxPH7azeo4yY4M0NCK3QGMbUyUkOWy8P782iuOyk1MXsg=
X-Received: by 2002:a05:600c:8710:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-45334ad0716mr37715865e9.16.1749822134294; 
 Fri, 13 Jun 2025 06:42:14 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8100:3d00:9e4f:bbb8:63a3:78f3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224795sm53258035e9.7.2025.06.13.06.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:42:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 2/3] hw/intc/arm_gic: introduce a first-cpu-index property
Date: Fri, 13 Jun 2025 15:42:07 +0200
Message-Id: <20250613134208.1509436-3-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613134208.1509436-1-chigot@adacore.com>
References: <20250613134208.1509436-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x32c.google.com
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
X-TUID: jP+AT3cAKzuf

From: Frederic Konrad <konrad.frederic@yahoo.fr>

This introduces a first-cpu-index property to the arm-gic, as some SOCs
could have two separate GIC (ie: the zynqmp).

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c                | 2 +-
 hw/intc/arm_gic_common.c         | 1 +
 include/hw/intc/arm_gic.h        | 2 ++
 include/hw/intc/arm_gic_common.h | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d18bef40fc..899f133363 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] = {
 static inline int gic_get_current_cpu(GICState *s)
 {
     if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
+        return current_cpu->cpu_index - s->first_cpu_index;
     }
     return 0;
 }
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 0f0c48d89a..ed5be05645 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -350,6 +350,7 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
 
 static const Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
+    DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0),
     DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
     /* Revision can be 1 or 2 for GIC architecture specification
      * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 48f6a51a70..6faccf8ef6 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -27,6 +27,8 @@
  *    implement the security extensions
  *  + QOM property "has-virtualization-extensions": set true if the GIC should
  *    implement the virtualization extensions
+ *  + QOM property "first-cpu-index": index of the first cpu attached to the
+ *    GIC.
  *  + unnamed GPIO inputs: (where P is number of SPIs, i.e. num-irq - 32)
  *    [0..P-1]  SPIs
  *    [P..P+31] PPIs for CPU 0
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index 97fea4102d..93a3cc2bf8 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -129,6 +129,8 @@ struct GICState {
     uint32_t num_lrs;
 
     uint32_t num_cpu;
+    /* cpu_index of the first CPU, attached to this GIC.  */
+    uint32_t first_cpu_index;
 
     MemoryRegion iomem; /* Distributor */
     /* This is just so we can have an opaque pointer which identifies
-- 
2.34.1

