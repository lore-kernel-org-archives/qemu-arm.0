Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4308758lfm;
        Mon, 20 Apr 2020 14:22:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlKwwnWUEIugVj6SRU2UdbUB4hUxwHXvv7livsQ6CdaOPXAfQFWMj9v+31YGomey+GC+XF
X-Received: by 2002:ac8:3928:: with SMTP id s37mr18451854qtb.115.1587417762461;
        Mon, 20 Apr 2020 14:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587417762; cv=none;
        d=google.com; s=arc-20160816;
        b=POd1IiSBHbvgyCa9Zl4WoJNNy3uc2SyaA9caTeP57bRxyMorAejihavdhOREgHsZo2
         MsMXH2wfOaZyzsOD5303wdQgatIehlNEjIv2xHn3GIXdesb/OXi5d8bnZYWpfXn+vBKN
         GTKYexxnMPs1g/+J+qYdyobD0ZD5adV5WA5aNf2yXbOU4ZVIfGGFTMzrk8fzWWqaDxB+
         1eeS4mCtrTRJrTh/7w8IL/HK0jYqs85wYMbYVXy3c443CcjgVOBvwXyTWFJD0G6R6q2G
         LpdH+QkmHGlfscjd0ls0srCLX1HlFaOJLUrbrIYvNw55uvC2qQqVpvnZwJD9xBrSAA+a
         w8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KOErd88B3Ihy9IyTZFkOsxrNfUtKAovKUtVCpnPaODQ=;
        b=Z8gBawB4GKu02ZRU5AgY9YuD1xmPJ1FZEg5IU/ztfA8zMl8yM86G8si256PmZGDhqT
         xBW2v2U/IsjXzEWJLqjzUozS/FdZDtL6p1GRBCd91WDlhThvKHawHP/v5HFwbtE7MVKb
         YSCT47jx4M3snJyKcqPXUCkxwkKYSqzlxYnjqW1HuQbWRhwQEt5lifRW1VsK0aPf/PyJ
         4BH/GopH3zaP79LX4VblZwF+qIMgR/ymOyLtW7zwEtW42XTe8llpnLNuil48uJx8rEOO
         cRhRPj+kfA6Y70NTfaPQKB00QS9HyfGAitJfnvpJXksYl25v+MWFnlisDfixiWmrKdKJ
         smKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EM+ilBcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si271759qtk.109.2020.04.20.14.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 14:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EM+ilBcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQdsH-0006r7-Sv
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 17:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQdrr-0006pL-W3
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 17:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQdrp-0006r7-Kh
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 17:22:15 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQdrp-0006mT-7d
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 17:22:13 -0400
Received: by mail-wr1-x442.google.com with SMTP id k11so14030138wrp.5
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 14:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOErd88B3Ihy9IyTZFkOsxrNfUtKAovKUtVCpnPaODQ=;
 b=EM+ilBcBpdhJU/TQU193eMLKfo1Rs2Cgxf352fuHGupkA8tuLIFqHGtk/OAvzllU++
 xU05slbQE0dtdboUg1PtvGIRxNQJ6yNDlDzOC0BTMUurrrisSruqkkNXHoCU8FRnKydI
 Lpv2FbFF75Oa0uGvgrUQPH4DhOrCaIoyeJ6TuXLf7k0axW6CPTDRDk3tkxBNFqZ1+5ad
 T71wl65Ct5W6UxpWxTEw/bRwvt9+cK65nbvqnZrO3hG5C4S3wU3tjKSUVQHHRaECSjZI
 TSwPbFSFchhB2ZXvhTeE+VY91SntvGXnChF9ki03VS//zHxMFc0rYrQ5r4gt/XDnE4Cq
 cLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOErd88B3Ihy9IyTZFkOsxrNfUtKAovKUtVCpnPaODQ=;
 b=ui1VtUFPSQ2iA6LZEhw63fDPNOhMNiBm+sEIaCk5ZpIlPeuKFOkhrRgzVgsuDSwGjl
 NHJt25OFta+cJiKDurYn5PIhgnVH7pk5dcCZwe9h0kKjlGdDenpNggQSHX0T56GuHhuf
 vnbVPDD1hkYKtQ+aXXYizE5fdURYUchJzhDKdeMKhSM5cQ5O5Dvvs7xlZ9/VQMMUyOf8
 FZObWYjQFjmLWt5ba28tM9NAaIJ8JYHi3VJj6RHtLWhIfpTzJd9TKTN0I4lK4RwTi0/O
 ZVMmdwfHePiJdWxK7SFQBKfTJG/Mtcxi98BVib6GdmOgnTqx6UNLlt09kJR2PgTpX7Mo
 CMvA==
X-Gm-Message-State: AGi0PuaYVdXXCwbepNthHXWy9cSsuBmTdBqCr62YAAFLKVRwl1mb1asp
 xFHm27P/n+Hgw0lAI88HvQnLYVEBmgVpzg==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr20032471wrt.382.1587417731746; 
 Mon, 20 Apr 2020 14:22:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j10sm823663wmi.18.2020.04.20.14.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:22:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux-user/arm: Remove bogus SVC 0xf0002 handling
Date: Mon, 20 Apr 2020 22:22:04 +0100
Message-Id: <20200420212206.12776-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200420212206.12776-1-peter.maydell@linaro.org>
References: <20200420212206.12776-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: omerg681@gmail.com, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BJcvX0DKqzbF

We incorrectly treat SVC 0xf0002 as a cacheflush request (which is a
NOP for QEMU).  This is the wrong syscall number, because in the
svc-immediate OABI syscall numbers are all offset by the
ARM_SYSCALL_BASE value and so the correct insn is SVC 0x9f0002.
(This is handled further down in the code with the other Arm-specific
syscalls like NR_breakpoint.)

When this code was initially added in commit 6f1f31c069b20611 in
2004, ARM_NR_cacheflush was defined as (ARM_SYSCALL_BASE + 0xf0000 + 2)
so the value in the comparison took account of the extra 0x900000
offset. In commit fbb4a2e371f2fa7 in 2008, the ARM_SYSCALL_BASE
was removed from the definition of ARM_NR_cacheflush and handling
for this group of syscalls was added below the point where we subtract
ARM_SYSCALL_BASE from the SVC immediate value. However that commit
forgot to remove the now-obsolete earlier handling code.

Remove the spurious ARM_NR_cacheflush condition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/cpu_loop.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 82d0dd3c312..025887d6b86 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -308,9 +308,7 @@ void cpu_loop(CPUARMState *env)
                     n = insn & 0xffffff;
                 }
 
-                if (n == ARM_NR_cacheflush) {
-                    /* nop */
-                } else if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
+                if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
                     /* linux syscall */
                     if (env->thumb || n == 0) {
                         n = env->regs[7];
-- 
2.20.1

