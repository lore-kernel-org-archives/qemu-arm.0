Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672167njc;
        Tue, 23 Jul 2024 11:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUefelMpnRbY6kSUqcs1ggx6/NV+j/XM9r8xymHt7Ja426WRlqPIVnHVfVyDK7btl/dmWF5jMn6+8QVlALvOAMhnejMkl+7
X-Google-Smtp-Source: AGHT+IFnFr8tOSaDIWivLVg//Hngh0TXO4/r+Rkk9kIsE1AhFJSwgAaUSwDrUzcmUBCPQy9Bmg1q
X-Received: by 2002:a05:6830:6182:b0:703:6ab8:1fd9 with SMTP id 46e09a7af769-7092342f5famr884397a34.1.1721758378706;
        Tue, 23 Jul 2024 11:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758378; cv=none;
        d=google.com; s=arc-20160816;
        b=xWNhh0mNBM2tOeZmOI8CsjTs2/REmphd4JOoteIsil6fWDJMNZIXJR5uQ2RS3OX6m5
         VqeeZ0OHe7eTNCvS3U7IWyqX0RLU33NSG9t7Q94M4UGmtYD+sS0nlPDy+mYYEUfU68R/
         6OhBM52XTYE8uzbELOFgufowGH6/jLSJ7wkFRB2zf4Gfv8WZROtirkURLk7vCJ6a1CFY
         rMOt5Ij6niUCnhdswx+u1KIx67HolrRqHaE1o3eem7RFNFT4g2NxPSO40NumL38GvhJl
         QgLYPRPUHPTF9aEfJMT58paULvHr7XUO7TAL79apQleCkmfv2FDWc1QVql72VpnZ37vR
         0ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
        fh=A0j1mNEGlF51qiAgyf5NrSiQyyVvDgT5xfiVFgJkNwA=;
        b=P3/nqYvMOqUMdTAy1DpG37dtoxC9AZqHPvnBqtR17Svbfk3KsgBWAkabv3ibkn/Q0f
         C2Z8EvYxl+bJkUdVXJTG+NeOZv4zadzT+vlC7ZyQPnzvlunJyZn5ykeJTQEfOww2F0AO
         FZOxHHvJ6xo1R7BPmEtaN3GggMWo4w78Ju41iUm+gFRlHN5MU/nQW9lJvbzvtmoRdpKy
         3WymdoQm165p/fUkG9FOmHM3XkpHlwvrut9Z008KavgyZ8IK3c1iwSFXpK8ISviEUfi1
         fVEcZbT6CCEYG7Q66Gl71CwaX2KENQBy8a5WHYrmepNsHbzHsVT+EHodm5D0F5KQz6mb
         ko7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=GPdAFAtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac9b6337si108478326d6.313.2024.07.23.11.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=GPdAFAtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJxR-0002RO-Dz; Tue, 23 Jul 2024 14:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwo-0001AE-Tv
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:18 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwb-0001CG-Hx
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:12 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-397a363cb13so18997975ab.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758140; x=1722362940;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
 b=GPdAFAtwBtSjDT3KVSIm625+cLXZMUykRguhba/ibmdc4qvREnuLVRDU2vamcQw29p
 E6b2+es4yB4U47wyIxh4AV3/GFZX8ftmS2F1H/1hDsw8lQTm68ptyyp9muG4o+5Dqzo4
 ZmkHxwYdh2oh5yJhIcLJeN7gudKGW0H7QKKjq6nB6T/CUmTDNlLETSgHfKgFxSWdcWDY
 zxP6w2yTqNb8Nq0UPyIODj7jDiccdmhkg5B77Qzwfz/BZj0K7yiXFHZFdu+5/lmhcp/e
 2II6wBJUKs64JSPViweuxACUYsOZ20xeYwsT12oxM2HhxzbLTjtw4s3+kBC+/tmOvLVq
 vanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758140; x=1722362940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l2giQ2DgrY0GVfdS/Z1DlHyLIcTuXalMYf+UrzR91E=;
 b=j1VackNhFSCIEWaOVyujVg6UR9926v4/uJup/hy5R5EKonv0QT1DgC7Jx/I3iTGppc
 3p4KaHEag6IH3zAuxkobJY80Au0ejxVYvNChU+XncpqEQ0pZiWVKW2UsWE0GMLJ3s0+b
 piY29j74JuWWA4XnyCUe3b6MkICZm1ngCnS0W5EIJ/J3kwvvUT6H6SwMN+PehJ1echDD
 3JwpDifOa+sS5UJXq3c7tWNw66rjvYKDGuAjltalamcNUGlmKoHZSLwxe+h13aPG/BTq
 by3MMXWvGZXHaLcK4JTxCrENe2ksqg6EpBQxYAe10PyCycYJdNmknOJqDxmRAa1h4XWy
 XTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcx9KoS93d7san+XnLR/viNiJWmSd+Np2qA2A5nogZmJdKUkmJOoaK08D78SIeL98luBrw2OdZaS4Jd9xGeYo78pWA
X-Gm-Message-State: AOJu0YzC3J4tjeUGx/UDjvfq+KYMO98R12q/NXi/7YQA/o4zSqZHjVaA
 LLNoa9PAKY7iJzW0mOORpPiq9EHNxESwqbqF32rrQPHz6mtZsAPwThsMtNTebvM=
X-Received: by 2002:a05:6e02:1c46:b0:382:b3f8:9f72 with SMTP id
 e9e14a558f8ab-39a16c81e5fmr10957115ab.15.1721758140488; 
 Tue, 23 Jul 2024 11:09:00 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/14] bsd-user:Add get_mcontext function for ARM AArch64
Date: Tue, 23 Jul 2024 12:07:16 -0600
Message-ID: <20240723180725.99114-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
X-TUID: nUawes0wMwUA

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

