Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156053njc;
        Mon, 22 Jul 2024 14:45:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIxVVbT8BmAE1L2obt0tp2g1OqenHVFGuRKsUnxIoasnb1YX1VuevhW3jaf3VJzFgcCV40Lu1NMNwjgubWv6RT5DFBAeUN
X-Google-Smtp-Source: AGHT+IFy9p+hk3RA0Ioe0o9Y/ppqwi/G3E111dA6SWoRfISK3JGuwCaqAAUowxqqolxQMkkO21Lg
X-Received: by 2002:ad4:5967:0:b0:6b5:7353:8996 with SMTP id 6a1803df08f44-6b96103ac76mr128716436d6.11.1721684752541;
        Mon, 22 Jul 2024 14:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684752; cv=none;
        d=google.com; s=arc-20160816;
        b=aqmoD+qeQ6G6Itg2Bx7yPX+o2z5enZRF9rLQjNZdOIdhl/lu1pmvs4G+vaeVUtFofr
         B7KvEGpQzCU7jHsbaYbn7BG8mBBCwLflMLZ8y38rBjYVpWSw7Zq2K1rMHj6WJ3X3I2X1
         fZjhKlSB31/J7+PqhVwTM0Tklg3kWd2242ynMFEbHzOSNo+/KUCYJIcPSbGAC3zJq9bX
         6zTpebkdFPRZMUkLsEFz6qy2LVNcEodef3FVcXzHr+LvfrQYpqz43mg/g19HEsnyI04S
         6gSBB6atVob2kVtS3uXeBLk+52T3CGdw21dfMqV3K+TrCRozFCpoepAUbaxEv81KRd8B
         OibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
        fh=b7Ni89tYqe3LgpmvN76IWpMzphXNGq83fdevfk6lp1I=;
        b=paR8u9L54m4K8ImYY3tk0njyZcn5exZbm2SC++gDCBEeX3y7DTjmCV5Ir2YrkUGZ9G
         KVDZCLDGEORx98fapVjKGbQ3wi8SiJgRJi2jkL0skpCYL/VJnU5YgjKLxhpvpMVqSi3r
         NcGq2v3BqNWjVJIUjPOA1J3c1TovuUVxNt2Ga5pg42KquLXsa5oHZpmv4cFL7Zv8c7cE
         oEf6j8X8JU/d6GSyvBkRww0BLFPQ3yHur5KvPOecj4f9bHDibrLnSrbzT43De+6pej0e
         BxFutDQfzerkM0tkjbmR9MNh654U++kNQ708vP9TMK1ExC3Zh1cKyzSL44ql8rv8ms+N
         A+JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=KiujD1oo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7c55ddsi92842446d6.180.2024.07.22.14.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=KiujD1oo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0q6-0005P5-ON; Mon, 22 Jul 2024 17:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0py-00052p-2X
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:55 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pt-0004JT-Du
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:53 -0400
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8046f65536dso229749839f.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684688; x=1722289488;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
 b=KiujD1ooZD027gZetN1OzZnkXhKtxtr5sUZZDYK+tq3F/J5lTvzwMbBs9rd7+XMcBY
 ZY/xDJS6hsA3XHC4NXZL4Ul8y8L8azF6LwnVRWn/I40AqZ/wiw0IyCarfDP1rXu4dH34
 y7uNOOtKFMAAe5/jWzGJ0bIrLAZOi4zKPkEk4EfCr+vQZwGukXbh8hUu/JiiaqjSLzfE
 0HdrkXpIqcnuA6Vc7AvPmu0W03EUObygsjlvOkTyczzIwGsOjwHroJCQnrSznM3v4IJQ
 rENiJkii5jBMqQFSMTVdHKOPtnmgBu4pKEOM/Hwhx+aqDZdWIB6fEi9uOke/7fUaFjQB
 C+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684688; x=1722289488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
 b=MrOxzXXt+uqeqqajxfPbIsARF0mnSRXglRo3TWJ5ESR6xbUxGNp2w3Y/98OcKkI3qY
 WfvzUskinP9CxpfGSY36eZE7G68QiUBbfMHJzk03qNejU93GminbRZyNxUA/TpgxZ/td
 yDXNDeaXCBpmtT+0b9+qPdcfI93keT7tBug1iHasdthAIseY/HjZuwA8bAkJkepKao8W
 ZoOsJISEfCEeYs5CcYZBX2LyCyhbLCdXOwfrCMkjqRKhw8O83aeqP5LsbWbN/LI80q5n
 GoshHB7hN4qF76Tq0p6a2GaNxy5sjJv1FjdZB8rr0ab1NglfEpHAPvKuiZT+TgfbcPzR
 3NqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4plKmTCMbG5s8nfUkrZcXtNppgrBryXBUYnhVOxjykXPKtWdefcLT+pIPVFLw2Ai+8dEemYQOspMNzUbxHgluIkh7
X-Gm-Message-State: AOJu0YyY6WYmwc4TlJ6NSkYwSmOAKI/lLa8gzKBCYLRJ/gV5j+uVX1nY
 g1J+sQ7P1kv7w/2vJEY6riUsnshab/JyN/NmD+iwNAjvkm93buuqRkQMYiNuxeY=
X-Received: by 2002:a05:6602:2d93:b0:803:85ba:3cf9 with SMTP id
 ca18e2360f4ac-81b33a0ca27mr1026733139f.10.1721684688327; 
 Mon, 22 Jul 2024 14:44:48 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/14] bsd-user:Add get_mcontext function for ARM AArch64
Date: Mon, 22 Jul 2024 15:43:04 -0600
Message-ID: <20240722214313.89503-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OoSJaX1v4dpB

From: Stacey Son <sson@FreeBSD.org>

function to retrieve machine context,it populates the provided
target_mcontext_t structure with information from the CPUARMState
registers.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Co-authored-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-6-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index 98861f9ab3b..ab3bf8558ab 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -51,3 +51,33 @@ abi_long set_sigtramp_args(CPUARMState *regs, int sig,
 
     return 0;
 }
+
+/*
+ * Compare to get_mcontext() in arm64/arm64/machdep.c
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags)
+{
+    int err = 0, i;
+    uint64_t *gr = mcp->mc_gpregs.gp_x;
+
+    mcp->mc_gpregs.gp_spsr = pstate_read(regs);
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[0] = 0UL;
+        mcp->mc_gpregs.gp_spsr &= ~CPSR_C;
+    } else {
+        gr[0] = tswap64(regs->xregs[0]);
+    }
+
+    for (i = 1; i < 30; i++) {
+        gr[i] = tswap64(regs->xregs[i]);
+    }
+
+    mcp->mc_gpregs.gp_sp = tswap64(regs->xregs[TARGET_REG_SP]);
+    mcp->mc_gpregs.gp_lr = tswap64(regs->xregs[TARGET_REG_LR]);
+    mcp->mc_gpregs.gp_elr = tswap64(regs->pc);
+
+    /* XXX FP? */
+
+    return err;
+}
-- 
2.45.1

