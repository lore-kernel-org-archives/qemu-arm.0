Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659717ejh;
        Sun, 7 Apr 2024 01:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvh5qOqGIMlB1RBUfdkk0vn9cjIuEz1Ue/eTvH6P6UOnZtJGEpOVsNiL6VzblfP5zxRkzw2bwXixTdnjbaQusoriT0jXhs
X-Google-Smtp-Source: AGHT+IHVm7hcO1Dxd3RPLm2ictQgyt6FP8LRyrWck4kyXK5sRsWlvAMxEp0Lz6uDQ9gxzKMvXG3t
X-Received: by 2002:ac8:59d4:0:b0:434:581e:e7a5 with SMTP id f20-20020ac859d4000000b00434581ee7a5mr8519839qtf.45.1712478171846;
        Sun, 07 Apr 2024 01:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478171; cv=none;
        d=google.com; s=arc-20160816;
        b=JjY0WfJT7YxRPWJB01W3GEkynmfBas1OLek0Ks+Bp57eXJJl8iArhjOdaPCtKOz+gl
         cYEIrYELWRiGHu6tj1dutlmDKwU03KDyui86IWTL3Z6qIai7EuG0YICvlruAy92G6cCZ
         Mgh5C00KxwNW/5p3XIscHvzAKaqXDQyprEO+L5ma6RJUjty9RlGUWh+r+EHHLimclYWM
         js2c41uxDE+rhXiz3HXdhxytdBR7Ey7hZsiki3qebGtwXfiOixJLt4pP8tUS55812SYh
         0P0J82RF2dMuqGBI0dPF4Zie04A9dZZOJgNUnJoTMbU39TdZZ3mXKlHFDwNFCB9QsZwk
         mYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ija190sL0bxNE23tBw2+qp9NFSUx63LTb5dhzhH3JPA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=rmmOPnzq1fvAo9nt8DM68Xq+Ws3rQZ7IrPOPL7yjTXdrVZeNjpVuebZNdkX+DVUe2M
         qphyLHx/nNi8Kw9krtZ3zkSRYD31RFpN1WLxE1NfsdyW08CZTB9eNm1txLT/f66OI1QY
         vYbh7gs5pELEMwz7RL3PO9ryIB1W8xieiPCneU+mKDJWczm6sZHF4sXuWeXisqsnDv5x
         AApZyBKqPOvxLSQm3nw7pcNNxhagH4WqxG/eVT+an5KgoYaF5Lp3+sJ51N+S748Rl/Hg
         VLt906JH8Bw46eT8NmE98nSTYiwMtAXyCVBxEm2HYA7yG4s7Wp096y2RCLJYHGU7flMd
         0shA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020ac8540c000000b0043473e37e45si2431073qtq.572.2024.04.07.01.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNlO-0004eX-PE; Sun, 07 Apr 2024 04:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl7-0004KT-Rg; Sun, 07 Apr 2024 04:20:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl1-0002D6-2s; Sun, 07 Apr 2024 04:20:09 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC4nx5fnCzwRRs;
 Sun,  7 Apr 2024 16:17:09 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id DCAFF1402C7;
 Sun,  7 Apr 2024 16:20:01 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:01 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 12/24] target/arm: Handle NMI in
 arm_cpu_do_interrupt_aarch64()
Date: Sun, 7 Apr 2024 08:17:21 +0000
Message-ID: <20240407081733.3231820-13-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YQmAZ8cuMSX5

According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
with superpriority is always IRQ, never FIQ, so the NMI exception trap entry
behave like IRQ. And VINMI(vIRQ with Superpriority) can be raised from the
GIC or come from the hcrx_el2.HCRX_VINMI bit, VFNMI(vFIQ with Superpriority)
come from the hcrx_el2.HCRX_VFNMI bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
v9:
- Update the commit message.
- Handle VINMI and VFNMI.
v7:
- Add Reviewed-by.
v6:
- Not combine VFNMI with CPU_INTERRUPT_VNMI.
v4:
- Also handle VNMI in arm_cpu_do_interrupt_aarch64().
v3:
- Remove the FIQ NMI handle.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65f2ddfa56..0455f20ccc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11649,10 +11649,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         break;
     case EXCP_IRQ:
     case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
         addr += 0x80;
         break;
     case EXCP_FIQ:
     case EXCP_VFIQ:
+    case EXCP_VFNMI:
         addr += 0x100;
         break;
     case EXCP_VSERR:
-- 
2.34.1

