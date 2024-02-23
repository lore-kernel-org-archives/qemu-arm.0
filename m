Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp475650ejf;
        Fri, 23 Feb 2024 02:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVs/2GuKGqju02UEpStfDxnJIu0+sME196vEzd7G2RAXEjoTidu0bjryglwbCDXmZT5IVYsgRXnv58TkWRzlwnZPN7qvQTG
X-Google-Smtp-Source: AGHT+IH3IOnb7p3JzZkup0pvZ9gBPy/pXQjv7kOValonOFz6Z5Attq1eDQnyxUusr08tFyJk6s7K
X-Received: by 2002:a81:ad25:0:b0:5f6:cfc3:f5a3 with SMTP id l37-20020a81ad25000000b005f6cfc3f5a3mr1543657ywh.50.1708684558126;
        Fri, 23 Feb 2024 02:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708684558; cv=none;
        d=google.com; s=arc-20160816;
        b=iSLMXX/4A3rR/s1IcfZJViuDE0gVmrnln1wX2bj5XWrcwiBYEUOgafai3cm41v4i3x
         7suBnqPkaNjOzXSFXH6mR+G9DQ8immu1ShFcmh+ZFXxOUllodM3UJd5soYN7TRRxX2fh
         3Qnc4tJDeVN5UMqMjG2pP+phRDqEejlPHxQIj9KqYDzUSGvufiQhhqfj5TCMSvQfOBT7
         Mmw4tabkJhQa7hv8/WGe1emvuA4uegXrsfmi8DQ+t1GXviEe8w3siWo1kqKjHP72GfUk
         3xhHbuozaRbXLCtC6nZhBy3p7b9YicqSKaTsKp0g5845yn6rtaANUZGKzmi9EEetdFMX
         rg7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=kHSzJxyd8crox26InZGqZvE873xvwUOJuYcOOwydwho=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=tQESuLaIpazTiVXj57z3uDrXLiDNN9bZMEBSUJK/Cy48Ke0VDEc4qwaSnzzUMMZcKF
         B0qjRuJFUCO1gjIzjWJWuxrORoXJ6S/41YDEch+/0zcl5z7pM9GfzY+KsYc2QEv3+kBx
         RSWtngJpusUVv7c+vlJY7o4guvqPetwGUR+iH0X9udje3iO6ZX3u7IJiXH241JIehagF
         Vf6A4XdWtHsVb1FNvdieq6FJmxssWOzbkrRvoREm6rCkqSQvD9jCQWVwteGcwLv+D9fr
         0XFahFpDulrQnvyoXwSs2w2+E7Alga7euN6WMQb++QJl+gducD6jDr3/XxrQqQxQjlsB
         1OnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a05620a108f00b0078798929ce1si3492233qkk.769.2024.02.23.02.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 02:35:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdSsz-0003tB-TU; Fri, 23 Feb 2024 05:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsV-0003c0-AM; Fri, 23 Feb 2024 05:34:05 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rdSsP-0001vF-Os; Fri, 23 Feb 2024 05:34:03 -0500
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Th5p21p8sz1FHdW;
 Fri, 23 Feb 2024 18:28:42 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1F1CE1401E0;
 Fri, 23 Feb 2024 18:33:36 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 18:33:35 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 02/21] target/arm: Add PSTATE.ALLINT
Date: Fri, 23 Feb 2024 10:32:02 +0000
Message-ID: <20240223103221.1142518-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223103221.1142518-1-ruanjinjie@huawei.com>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IwyChuT0l2Bn

The ALLINT bit in PSTATE is used to mask all IRQ or FIQ interrupts.

Place this in its own field within ENV, as that will
make it easier to handle ALLINT set/clear.

With the change to pstate_read/write, exception entry
and return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 63f31e0d98..f9646dbbfb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -224,6 +224,7 @@ typedef struct CPUArchState {
      *    semantics as for AArch32, as described in the comments on each field)
      *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
      *  DAIF (exception masks) are kept in env->daif
+     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->allint
      *  BTYPE is kept in env->btype
      *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
@@ -261,6 +262,7 @@ typedef struct CPUArchState {
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
     uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
+    uint64_t allint; /* All IRQ or FIQ interrupt mask, in the bit in PSTATE */
 
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1543,6 +1545,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
@@ -1555,7 +1558,8 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_N (1U << 31)
 #define PSTATE_NZCV (PSTATE_N | PSTATE_Z | PSTATE_C | PSTATE_V)
 #define PSTATE_DAIF (PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F)
-#define CACHED_PSTATE_BITS (PSTATE_NZCV | PSTATE_DAIF | PSTATE_BTYPE)
+#define CACHED_PSTATE_BITS (PSTATE_NZCV | PSTATE_DAIF | PSTATE_BTYPE | \
+                            PSTATE_ALLINT)
 /* Mode values for AArch64 */
 #define PSTATE_MODE_EL3h 13
 #define PSTATE_MODE_EL3t 12
@@ -1595,7 +1599,7 @@ static inline uint32_t pstate_read(CPUARMState *env)
     ZF = (env->ZF == 0);
     return (env->NF & 0x80000000) | (ZF << 30)
         | (env->CF << 29) | ((env->VF & 0x80000000) >> 3)
-        | env->pstate | env->daif | (env->btype << 10);
+        | env->pstate | env->allint | env->daif | (env->btype << 10);
 }
 
 static inline void pstate_write(CPUARMState *env, uint32_t val)
@@ -1604,6 +1608,7 @@ static inline void pstate_write(CPUARMState *env, uint32_t val)
     env->NF = val;
     env->CF = (val >> 29) & 1;
     env->VF = (val << 3) & 0x80000000;
+    env->allint = val & PSTATE_ALLINT;
     env->daif = val & PSTATE_DAIF;
     env->btype = (val >> 10) & 3;
     env->pstate = val & ~CACHED_PSTATE_BITS;
-- 
2.34.1

