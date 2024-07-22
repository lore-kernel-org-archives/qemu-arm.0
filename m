Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1739539njc;
        Sun, 21 Jul 2024 23:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXdf7r4goo+wY6FXbY/Q8H5FyMI50Voq8ramBzxyOTbmPhlqoFmRvbRKD3XV0NAz1b7MJHnHvPIyNCQ+7AUq83GX93H4i03
X-Google-Smtp-Source: AGHT+IEALRiKp+I9RQWG5jBYO7eCOc/IKW8WGVoNTRrl28QpKjgTfzeRa30UENCJgzQWqUI3ZKYE
X-Received: by 2002:a05:6358:290b:b0:1a1:fe6f:a2f3 with SMTP id e5c5f4694b2df-1acc5a620fdmr790155355d.1.1721630786237;
        Sun, 21 Jul 2024 23:46:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721630786; cv=pass;
        d=google.com; s=arc-20160816;
        b=PqNto1HpPFbDuZ6qBWY5hHnX50mL86r8nRUXRRT1f9piYvMnd0s9B6EhjY16zPTjwr
         9hOeGIzDsYebvnAqYRXqaeAJ3cS61HZPVFT5eCf7+cwnk9Sxm/HdqIIHlU4UBEnCeBii
         fNASxhOzT560e5zZCjkX6eSt4E2rnEH1LuyGy3iV1BXSRRvjnUZKwE1KQ58Dr7y5EQQh
         AEZ8rlebpOiGvabzB5NbvJccSSoIxeWUnwLw8JEiWgKAIWBMO1VzUzVeNhPQ/oN6dNsX
         nBdPQlDZbapXEsQb0M2ybU+veCSvn1uMkvS/ny0bplmWPOIBzY1iDAPsinvPWQ/TphXk
         wxFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=J1r4RQ1Lh/liVlFn3fp96U8K6fWHDlO19TLd8irv6oM=;
        fh=R1eEDosC1iqku8mu4M2yNrdLLumpWlfEUcZz63EFc9I=;
        b=ujVj2dJuI5poTjrijXEowri3SRYQyXGkQ3sRY1iFAlU05qZRBvyY+bsXc4+HaDB6VA
         A+4rfirLbAhX9hQJNbkYEpq3steUqSCiX9d9u0tFJteiZeorQGVUKctEThe6eo6P9BKL
         5SPKR4mcv2v8BYVl0DyQEjhqTElbbY8kHkCyT1nAb1qC5d4ESG9x9Yxc9mY+Gn/pBHw/
         XsB+gXULXCsdR81B42j1qrYzLxOX9fDadwiHhIBnU5lPc0tAekRtY+YugxHsXDrFw8Ur
         l/BvCDFedoQAfuTUQK4fgObsoJzl0fKCdhCGwR9/gN7PxOVclZOfgTTvJ0OXOKYswXaF
         MXHg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=egl5sfP2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-79f0f91ee19si5839772a12.524.2024.07.21.23.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=egl5sfP2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258512-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2556AB20DBE
	for <alex.bennee@linaro.org>; Mon, 22 Jul 2024 06:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE52318654;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egl5sfP2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDDD17BBF
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630776; cv=none; b=ENnzXdECXxluvKPHtFT6BPFAcB0aVcdRf8ylm9FQVdRevnH3CZ2RyKjgVqrGi+An5Xd7i4bV15Qld+Kdpw3IWD6Vh9fUA6IM5hbgwwtriKIIzNwFdTw/Vu+oUUXOqe+cGAtdyj3Mc9FTdnK8U7lVbq2wlQ3YJP7PtbO38/TO6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630776; c=relaxed/simple;
	bh=9YH+uN2FpTDfQsql9e3P4xbbtz8E4TbY1G0zlNhC2vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS4LKjusK2OFgmZjCLUH6h5XOxn7b29tQaYSK4UsXUKU/qBUN2dwYPbGGRB/D0rWomx9uxzwjToPWIhljGz7apUBWvHOv+vKweZ/MQcqymh+a8Tafwi3Xt+efUNmp+6bcXeTktirXIwlZ5pAtvP0TLR+1IDLAHpI3PihJvuhKzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egl5sfP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44259C4AF10;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630776;
	bh=9YH+uN2FpTDfQsql9e3P4xbbtz8E4TbY1G0zlNhC2vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=egl5sfP2vUcutHSmBLB0tmEwjOTSlzqbEc+dIR/c5tpPcocxInvv+A3asIbKjFOA4
	 L5ai+QTaZjsqsfpy8a2H6dhdyUBmPW/bfW603ZUoUTMXaO0QO+y6XSrA/Ahhbtt+zk
	 i7122QXfCj558UQboDJd/Bzxq81KUTkfymtvQOsABKy3qpYH0qcXzyVJ1P/0nqHS4h
	 q/Tjk5Loax4EcnTSo8JYFTgRoRjW/tf62UI5fHgj12By0orP245M6QLVHjc2owq36N
	 ErbSpua+irbPZK/+wgqluCFVTod9wnTwBYPfvmOxQhcgLi1OWEH84IpCj4e6PqITi6
	 FjMP5FLf65ojw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sVmoI-00000000WQy-1GvZ;
	Mon, 22 Jul 2024 08:46:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] target/arm: preserve mpidr value
Date: Mon, 22 Jul 2024 08:45:57 +0200
Message-ID: <acdc77f8b53ed570aa7a59fdc83fb8ab5f79ca19.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 7j4hn9GZvr+e

There is a logic at helper to properly fill the mpidr information.
This is needed for ARM Processor error injection, so store the
value inside a cpu opaque value, to allow it to be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a12859fc5335..d2e86f0877cc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1033,6 +1033,7 @@ struct ArchCPU {
         uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
+    uint64_t mpidr;
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint64_t ctr;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce319572354a..2432b5b09607 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4692,7 +4692,7 @@ static uint64_t mpidr_read_val(CPUARMState *env)
     return mpidr;
 }
 
-static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+static uint64_t mpidr_read(CPUARMState *env)
 {
     unsigned int cur_el = arm_current_el(env);
 
@@ -4702,6 +4702,11 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return mpidr_read_val(env);
 }
 
+static uint64_t mpidr_read_ri(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return mpidr_read(env);
+}
+
 static const ARMCPRegInfo lpae_cp_reginfo[] = {
     /* NOP AMAIR0/1 */
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
@@ -9723,7 +9728,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
               .fgt = FGT_MPIDR_EL1,
-              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
+              .access = PL1_R, .readfn = mpidr_read_ri, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
@@ -9733,6 +9738,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
 #endif
         define_arm_cp_regs(cpu, mpidr_cp_reginfo);
+        cpu->mpidr = mpidr_read(env);
     }
 
     if (arm_feature(env, ARM_FEATURE_AUXCR)) {
-- 
2.45.2

