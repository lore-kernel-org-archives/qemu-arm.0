Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659354ejh;
        Sun, 7 Apr 2024 01:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwx7kiBKAMND97X6q4d49VCIw2nt9XISr7OXtXvt9h9icmk65K1gIzAeWdK3wMM8Tr51j788VkD1wcM4KEn/TkymLrN7jo
X-Google-Smtp-Source: AGHT+IH+4OBSxetyqAsDzxuYfuB+5A1hjGd6wJ/x8Lgf3N964TpDD2QTOuKWOn2NZwcNkb1+5+UI
X-Received: by 2002:a05:620a:1998:b0:78d:5ef6:272f with SMTP id bm24-20020a05620a199800b0078d5ef6272fmr3050717qkb.36.1712478095062;
        Sun, 07 Apr 2024 01:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478095; cv=none;
        d=google.com; s=arc-20160816;
        b=gNdvCA32i2ULUMbjLIoyWHtPBlgpPb4YoOzfRveBx0i1eljeEOvea4teUdxwrKohyj
         NZoFyBXcnmxCO8Y/XczzckTvyQB/2CymbGdsUbhP7kUqHLo/bn90he1E4w4fIWid2DQj
         KEmf3dKJPE1IhWx3+txUH6FU9wM7xea6JGeDvY0hzEbKZXgBBAIg8JZZP6Y+WMDk70kO
         Bq9P8CbOTnGwhYdSnyexOhNRUBOQ8DAmUce/EsWJw/DEXA1Q8k7zGTp/9kB/7y05QG66
         O+ijG9VCIvrG7VldOHQQSkBSh1/F9lIjVgc8aNDyQGa3yigq+dVX89hE9B5wmAojJMmj
         a2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fVO97ZM86PJGUOU7R8aJM7nQWBdCfxJRarokNkNpGeg=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=j8L1I8FbGh0+XNFNGlEkmurYe/h3vkTppknqinkHkY1DoJFUlgUb0CVVWEgIuA8i9l
         OzuVHPLYsm2tgQvqKuZ6iFDRG+iI3byYZecqUd9KZyBqRChx41w9m67g95G4UnbNMcJM
         I7B/qy23eOAeaSfyCgcxcVUVHPuYJLHxxNGfzyfD7nhug86vXTU99hD/NiJczMPzn2CP
         hgwOBNxVER1h4InyHe6yQp9XNO0Hwe5AZyU329erzZwXXjc08M4+JjjTGNchCK/IEUeM
         BcQogkA9C16Q88ttMuYVQufji8L9zObTDv9ea39FY/8/lFO1RGKlE+/TSqZSCyr3NGmb
         +TVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a098a00b0078d55a0358csi2877080qkx.262.2024.04.07.01.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNks-0004Cr-IQ; Sun, 07 Apr 2024 04:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNko-0004AZ-Ax; Sun, 07 Apr 2024 04:19:54 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkk-0001zi-Ir; Sun, 07 Apr 2024 04:19:54 -0400
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VC4pQ1m6xzNn61;
 Sun,  7 Apr 2024 16:17:34 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id F0211180073;
 Sun,  7 Apr 2024 16:19:46 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 02/24] target/arm: Add PSTATE.ALLINT
Date: Sun, 7 Apr 2024 08:17:11 +0000
Message-ID: <20240407081733.3231820-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
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
X-TUID: tg9jlQYRl4HN

When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
ELx, with or without superpriority is masked. As Richard suggested, place
ALLINT bit in PSTATE in env->pstate.

In the pseudocode, AArch64.ExceptionReturn() calls SetPSTATEFromPSR(), which
treats PSTATE.ALLINT as one of the bits which are reinstated from SPSR to
PSTATE regardless of whether this is an illegal exception return or not. So
handle PSTATE.ALLINT the same way as PSTATE.DAIF in the illegal_return exit
path of the exception_return helper. With the change, exception entry and
return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Handle PSTATE.ALLINT the same way as PSTATE.DAIF in the illegal_return
  exit path.
- Update the commit message.
- Add Reviewed-by.
v5:
- Remove the ALLINT comment, as it is covered by "all other bits".
- Add Reviewed-by.
v4:
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Update the commit message.
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h            | 1 +
 target/arm/tcg/helper-a64.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bc0c84873f..de740d223f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1430,6 +1430,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index ebaa7f00df..29f3ef274a 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -892,8 +892,8 @@ illegal_return:
      */
     env->pstate |= PSTATE_IL;
     env->pc = new_pc;
-    spsr &= PSTATE_NZCV | PSTATE_DAIF;
-    spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF);
+    spsr &= PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT;
+    spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF | PSTATE_ALLINT);
     pstate_write(env, spsr);
     if (!arm_singlestep_active(env)) {
         env->pstate &= ~PSTATE_SS;
-- 
2.34.1

