Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp110110dlb;
        Wed, 28 Feb 2024 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVstyHtSL1RS5RV0FV/EYsp537Mk7JCpl3qVaj9rVGMiXcHqaWrzk5hFSPuunoxsZ56X2yp4+uCD2rwsxbc57l7IuS+gsdI
X-Google-Smtp-Source: AGHT+IFpWN4UKwLTEITLnuDnItnwz3rSYD2sNAGqr/pJb5e5F2oLiikmI59Hw6RU9y/KSj7WHITy
X-Received: by 2002:a05:620a:2946:b0:787:c0b9:e83 with SMTP id n6-20020a05620a294600b00787c0b90e83mr3309609qkp.22.1709112785931;
        Wed, 28 Feb 2024 01:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112785; cv=none;
        d=google.com; s=arc-20160816;
        b=RRPZw10CHsw3NCbe5VGtJxMf4xFwhDbmPoZUY6ef7P1GVtW2Xa0tpZwASLxlgMLa8G
         9dyXr455wOaxAXNh9fzWW8b8nESvjZOyEZo4IhXkV+WQZ3dR0bJO48J/qr744nlN9k5U
         7aPWPT1sRH36tPTP9radFQ1GdWVACC8KZA9LPkxwcNflMzhjvNQWTpYj9wUgE04s5eyI
         47AJScoUos6GcUdDQzokc4eS92AGGcgrqdmTjN26viiOaK4dfJPryFCkX8pvLC8nmYzd
         yBf8/tc/ygb7asrgSNOxbKRlUcx4F1qVEk0z53ypZPM2UW7nipLt9F6poc5HjS+xWXDI
         2w7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Z3EdLF9clAp9tSpaJE+9Jj3JRxyPU2DQSDQvQP1UcVI=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=i+CvRU7FwqDDxrvdn+LON5FrucdTocQ4ceVFHoyVL0rGQHosy+iC3knOXrDOReNgAy
         BL/YECJ3lzjqrS2DI6Z4pOCCwbpPBbGxNIIYMTT5zsTY/OXWc49DxvIpifrE/6AL6e5G
         BMqPMIoAOZNFwfwK9Mkvl0cA7NHTaAiwK6xSvoicPVfgGbgkdbuSlQ6arL7z+KbrLm9B
         CZorZVf5S7aTqgMEqgPyDxx+OhhE21qbD03+TLgqgiztHklP0claw/MIXed6N7rxdlAb
         Dv8X0FyJGBxjzQt4/1wJT+Ld/6ElJ+MOMydJryTybvapELvUuFdtJUfFPDWIR7Hlzo0s
         4H4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020ae9c00c000000b007879b80f197si9342982qkk.680.2024.02.28.01.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:33:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHW-00018g-N9; Wed, 28 Feb 2024 04:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHK-000111-Sl; Wed, 28 Feb 2024 04:31:07 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHI-0001Sa-FS; Wed, 28 Feb 2024 04:31:06 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tl8DN4YWPz1Q9PF;
 Wed, 28 Feb 2024 17:28:36 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E52D01402CC;
 Wed, 28 Feb 2024 17:30:51 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:51 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 02/22] target/arm: Add PSTATE.ALLINT
Date: Wed, 28 Feb 2024 09:29:26 +0000
Message-ID: <20240228092946.1768728-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228092946.1768728-1-ruanjinjie@huawei.com>
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZCct3bJsrDnl

When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
ELx, with or without superpriority is masked.

As Richard suggested, place ALLINT bit in PSTATE in env->pstate.

With the change to pstate_read/write, exception entry
and return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Update the commit message.
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 63f31e0d98..d6c3f8a935 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -224,6 +224,7 @@ typedef struct CPUArchState {
      *    semantics as for AArch32, as described in the comments on each field)
      *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
      *  DAIF (exception masks) are kept in env->daif
+     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->pstate
      *  BTYPE is kept in env->btype
      *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
@@ -1543,6 +1544,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

