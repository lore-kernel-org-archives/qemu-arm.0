Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2671191njc;
        Tue, 23 Jul 2024 11:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnRhzeL5V203tcQGX9Ka4EebxisSJl02kL4JpFIJ1tqQIIdY2y3L+AWtyYnbNPaY47Zn1nhc4IIHKpJyWd7rzxEOaUwzH4
X-Google-Smtp-Source: AGHT+IEa5CN181XEAQJZz2d36SVJTNqAIAV7c5/a5aOOUiybtBeV2PGHO4a7uQE/v+CWxvMXgbS7
X-Received: by 2002:a05:6122:1e06:b0:4eb:12da:14c7 with SMTP id 71dfb90a1353d-4f50666846fmr13340770e0c.6.1721758263927;
        Tue, 23 Jul 2024 11:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758263; cv=none;
        d=google.com; s=arc-20160816;
        b=dWxv6ugCCdn/EEmtZilmNPiyMRO6ao/VU5avT6uGKSAQcH2v2a0wN09c13OBcT2O+y
         3/YgJ60hMUXEYiclYH5u8aTs5cBAonvcYdSqaPhlgK3xaoR9PNg2aQGgdLEPo8veL8+9
         UlfX+fE8GyBS8Bg43KnXDkxNg/wk96eaX8MVe8mz6cHsquUCDdJOEX4WFRfFqKkZnca/
         ypQy4DbCwlwGAaZ6KWvxQFrlxK6x/ykc3m/XEEEuldhoeuCXCSqiQlHPXf1CGr1/UbA8
         h+fGYIgR9tYhK4jNTMoD8H41jO0PmvqmTZVuaIdkdzVcAYrB5QKFEzCLPrYOZ+BZffQ1
         vOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
        fh=Fm/vKDVrWfMAUYotjNqFbX4fnzLwMH5y6VPX2CsRoes=;
        b=mzgLoV4nvyoiYOBkZx/7AtiTMDVB3B+D13aC/JWaR26UF5Mv4GNKtvM3ku90VqSwJl
         79FJpaKhqCJZ8K5dppVbEt2HQyvfne6EEp3ql/st9ahYMtiefTI1PSF6gMIXctPGdcYf
         ex8tWtiHvU5zs+k/ee/kSCZzpJ84qpEl7RmsgjSpW81G0cFd8Qlrb6ozCdTa+T74XeYa
         wbuc5cPPoHk9pPAWLADK0+FkU72C6Ijggd33vOqgTlovKK/3fqMpHAY8mUx7CmpuLGCt
         OfzYezmv3/3gwyqDBBHg1IP1mlHAI6lwWnFaNjl7a3qRMnr3R9pe5GOAQblCCWMbRVyP
         mmRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=o2U4dMg1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-826dcb2529dsi1419878241.74.2024.07.23.11.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=o2U4dMg1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sWJxZ-00036C-Eb; Tue, 23 Jul 2024 14:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwv-0001Ho-FI
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 14:09:25 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwp-0001Cs-NC
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 14:09:19 -0400
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-397052a7b63so23538045ab.1
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2024 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758144; x=1722362944;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
 b=o2U4dMg1+GveMy9MhEdt78KLhkPo/a4tguwZT2ZH2yF1mJnpiIvCoo8M676Ws0PEGe
 qfWkm00XjyNOoVnSL25XjqpLNvwz4V7VZzL4ME7zOBq+9pKCfysrhVPAmz+2GtZjAD7F
 OYH9xjp5mPNYpDosRVDiPMTe+q+a1v3YGMIV8WDsVmlx+3854ATi4liS7U5PT8tUvEOp
 I5SbUVJ+YDX9tSAROPe0xpy5zHfzy/SKxUohOeu/WjRGJE9aDCk+ArPMetrR9zuGUGPd
 kUG2uLY5tYdvMEK0pHXBUQ0wrpecrdjTbWenLbK++6Uy8k3W/PW5ZQ5q2O5w3xAqdPzb
 zVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758144; x=1722362944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
 b=uf8wqLEIJIZJIaEwNykM1KzAGS0yKwCQ8RhQ+gIiLf/bZyS+0fq3tMJU7UMRwLL7PO
 fZUGLLCkZ6rszlPRccZXQq3xofU3NshTv83tGOX0w4P6kLsgVAWbIbiMnRw7paiRknjt
 HUp4tDc3ZMJ30WwXeAmsZkpwwF0OyiNLcCt/yUFZUvXkzLDn/QSXDamt2nQHbwS0rHyS
 +w520mYW6kGQhfwfKYO0LOkSPUmviTcPA0I6iuNOxfkoKNRdl7sWZ6U5N5GthRVKSK/W
 T4Db93KaGqGVVvgEIXONzm1PIpEiOh/lQS1EICPsUya8Fm5KdWkURnVS5XHo3o0qlQIc
 oBHA==
X-Gm-Message-State: AOJu0YytgXDnsZa+3EBFK2e8AX4FAawqM3S1AQVe3CsG/Zixc3pJ3hJx
 u29s2UJuPWQk4jImD2M+u8jpO59C2ZWuYp/3Ifj4io4jFkn9R/TWmQGqmp04YiI97RCzs9K3zBC
 A0Kc=
X-Received: by 2002:a92:c56c:0:b0:39a:16c0:4bef with SMTP id
 e9e14a558f8ab-39a16c04e68mr9278115ab.23.1721758144376; 
 Tue, 23 Jul 2024 11:09:04 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/14] bsd-user:Add set_mcontext function for ARM AArch64
Date: Tue, 23 Jul 2024 12:07:18 -0600
Message-ID: <20240723180725.99114-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: e9P+510WnFC3

From: Stacey Son <sson@FreeBSD.org>

The function copies register values from the provided target_mcontext_t
structure to the CPUARMState registers.
Note:FP is unfinished upstream but will be a separate commit coming soon.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-8-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index 43c886e6036..13faac8ce60 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -95,3 +95,25 @@ abi_long setup_sigframe_arch(CPUARMState *env, abi_ulong frame_addr,
     return 0;
 }
 
+/*
+ * Compare to set_mcontext() in arm64/arm64/machdep.c
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int srflag)
+{
+    int err = 0, i;
+    const uint64_t *gr = mcp->mc_gpregs.gp_x;
+
+    for (i = 0; i < 30; i++) {
+        regs->xregs[i] = tswap64(gr[i]);
+    }
+
+    regs->xregs[TARGET_REG_SP] = tswap64(mcp->mc_gpregs.gp_sp);
+    regs->xregs[TARGET_REG_LR] = tswap64(mcp->mc_gpregs.gp_lr);
+    regs->pc = mcp->mc_gpregs.gp_elr;
+    pstate_write(regs, mcp->mc_gpregs.gp_spsr);
+
+    /* XXX FP? */
+
+    return err;
+}
-- 
2.45.1

