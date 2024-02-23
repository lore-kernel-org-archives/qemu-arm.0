Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475898ejf;
        Fri, 23 Feb 2024 02:36:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUigdCSnwgfZ1zD4vHvQQ3dFXvBiq3XP98U0XrRzK83i9ja4vwFaE7ra/KD2fB9j9kbJVlxelvELGjAvwU9ubOfkZ0d+Mrq
X-Google-Smtp-Source: AGHT+IF10uAg1UEDCu1tCYV23xhnoEv3csWGtKT5vNYw0oYHnDGt8R3C7383GmYFrzNQwWD+/XE2
X-Received: by 2002:a05:622a:180a:b0:42c:14b7:b603 with SMTP id t10-20020a05622a180a00b0042c14b7b603mr2055799qtc.36.1708684597479;
        Fri, 23 Feb 2024 02:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684597; cv=none;
        d=google.com; s=arc-20160816;
        b=bFPZiVnrTCR+ff6Govw8dutjuzxhr5J7JczjMol2UvN1mU++jNRN6lNgDmqwl29H29
         iYQdqbBQ0Yx/FJrNvvvcx4X5bl/N+ky4sfPWLSfDj5Udd2RnXU8YELqOMYCPYJ+EYWox
         p/28j1ZbdB9+9Ox6B8+IqQNbsjEvgSLz9WAwmEozB+B3yI15KguHLLMRj+BuQ6bLyu2h
         szEwf7tMQiuP7ftdQDZpUDAHdyLLjw3/7tYAuFqxAbgU92gjxdSwOHWQrEz6jqFriYDU
         sALmfiaRaiweqDQ61zkP5Xt/ywrQ2sjF250FIfK4HP0Cuw1hOAG25xuqp2viLpnTx2ZI
         oyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=j31woLbKywazStwIVp+PXDkIn2PMNXUsb6QcArKR1ck=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=TbOnADvkVYvcoP/eVZ9x0784e5oWSaKPozFTGMwxzaMk2ZKvTvV9yPA5+oNdHvgnVD
         lW/3yF8DTrvkDgMGxqcTA6rzKk6XPvL+2tsB0QRB7lGgs9oHC91f4e9z6duSstgaED5L
         BPdsDRK49E4E1WYWczfCg0k9B2Tix34mks/XZzVQQE8SA8gX7aCSvhzx+UrawLoz9s1S
         SgyJSN5G4D7hS2XFy3vxJH5zYoHZc7DxDykIKM/Y2yxjfbF0szc7qJEnie2pDk0D7RyX
         +/FNKEi5bZwNkaKBlGTC4BToSPwIqLmUKUJXor/xmzFG+Lm7BsEKCC9WNRQFdQ/2TShc
         tk8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05622a15c400b0042c74f61410si16095223qty.725.2024.02.23.02.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdStQ-0004IA-RO; Fri, 23 Feb 2024 05:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsT-0003ba-RY; Fri, 23 Feb 2024 05:34:02 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001wF-Ot; Fri, 23 Feb 2024 05:34:01 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Th5sW4XNvzXhFj;
 Fri, 23 Feb 2024 18:31:43 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 130D71400CA;
 Fri, 23 Feb 2024 18:33:41 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:40 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 07/21] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Date: Fri, 23 Feb 2024 10:32:07 +0000
Message-ID: <20240223103221.1142518-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z/U+gR6VZj+O

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so handle NMI same as IRQ in
arm_phys_excp_target_el().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove nmi_is_irq flag in CPUARMState.
- Handle NMI same as IRQ in arm_phys_excp_target_el()
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 376e0d91ff..2f54413b01 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10571,6 +10571,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     hcr_el2 = arm_hcr_el2_eff(env);
     switch (excp_idx) {
     case EXCP_IRQ:
+    case EXCP_NMI:
         scr = ((env->cp15.scr_el3 & SCR_IRQ) == SCR_IRQ);
         hcr = hcr_el2 & HCR_IMO;
         break;
-- 
2.34.1

