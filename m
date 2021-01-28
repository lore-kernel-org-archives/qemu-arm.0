Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp622312lfo;
        Thu, 28 Jan 2021 14:45:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxebsLH1j9fbPFP1aWlATx8yjBMeDw0m6R2FqV55EHNNNgwmEYL2VyB6vCrX+teMBQUAfMb
X-Received: by 2002:a25:db41:: with SMTP id g62mr2077588ybf.439.1611873953723;
        Thu, 28 Jan 2021 14:45:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873953; cv=none;
        d=google.com; s=arc-20160816;
        b=OwX79dQznxr647Z9YQ4rrYQhzm+B0RZSVhEsrrblEsjkXRut6KyjfUu/8p0j8Y/kUf
         y+W4LvsJ+7aAAEBQwZ8zJMSCLbx6KVEPN5GYGGWeW+lQwnbijJrSKXT/UxlgP6hAk2CY
         jk1avqNQ4docd1uuWKelOZTb5l//Kg9bnmXvbeK8+bAhWlnUTfYdLeUjZJKwa3TAcii5
         2cTpdutRnh4J4tCjVGE+b2WsaY9rI9fDy15DPZD0KAVGPTM0pkB8nBhfMKnV7ZMJVKlT
         ljKxElAVNNxj+ENCwYN29xrGwNeV5g+OD7AfN10JCnZbXy7b3VnPes2PT2+MNKpvFIdV
         3aRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
        b=zB72upIkhYd3fq5LI4syva7gn7BOR0r851eTVYszKIRPrlYl384t5wraya4ctH5yRr
         IO0/qzN5hcuTdt6wqfCkIVyTP88S16Cln6z3eGJCgr4/4jXbtRKktcN78dQbk8Swr+PI
         T0Y43FaZaQ/+c+cepmjXk7wxhIe7BOCW0dsso3So25JxxwNcRtnsY7ljkgA3c22k3HMQ
         5jGNVFjfxfrEZsG/q9FnDvULCXjSwJ3LtDpsfGD6y99Pylrj88jI7AGcjAxaZDxDHv3J
         RNlJhbunLZVZlXDNYKB4k9zjLedpHrS34cF9RgkHIkdeixkaMVpwI8u9R/U90Oo6o4wU
         QWvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KNlwAW2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si6279325ybg.47.2021.01.28.14.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KNlwAW2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5G2z-0000rZ-3G
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzE-0005Rp-LX
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:00 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz7-00085R-6D
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:00 -0500
Received: by mail-pg1-x536.google.com with SMTP id n10so5268701pgl.10
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=KNlwAW2OtJHHam3IQR/lsRk9Kkd/FHpeb5a/HSmXLS9KqdjNR5vGwB1AsZNyaQbEx4
 HDXyNpvJTBMpL+DbLBomdUgTMjz3h5LZcDP0959pMNRP6UGQGWiqb0jKd5mzZG8HQciB
 CFhZEWcZ7u9anNLUUiCn8Uw5X3Hg/t4GwcWfW7wQmgiTWujJabCl2/p2TtNOMOrbyqlZ
 WqZ4nyyKgTgLVQfUZok5n1h1lp+QIhlg6W2sesBuflgJ5x+6+AnKdawZtdFtw6ZNlphg
 jFMfBZQc5g8GPcG/pcYhfKvXsUeJNO/1NcegO1td/u4W4r73BWFfRlJk1+YnD5l0tdgI
 P1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=cs+e1T/Tb3ua9c2mfZlBQUYoeMPsvH6Fdswi/H6LgOshXrb57aIcirP6hexbo4omUS
 B3mJUyRFoM/ZsERugFWgccl/vxz66ke5eaV+APTLdH9v3/jsbf1UfurGV7SsOfs8ypBX
 Jx5VZjEbcjKKPix1OnoZPaxMQYkc5b1cYLG923gzOvDsxU/FM5W9DstXdyssj93EIuXw
 KEqJ5KWE+JF0CfQwvin93XpD9SrS0E7OU1AeLPZnLKGK10Kv7g3jmAvVcHMG85oEPAWl
 twZ4pG4YKLTAuwyAJVe3gzqSMEyguGJEpFbdKkmWGXtyzxrXx7clohD/F8YT4pNVvtfj
 uM4Q==
X-Gm-Message-State: AOAM531k7wqzYZqLWet0aNOHy6byYZ4KxdpuHqHpq3PW+lye//GwpJJK
 0MNmLX3sKWyYbZwm5z91v04dyw==
X-Received: by 2002:a62:5c43:0:b029:1bb:9418:b59b with SMTP id
 q64-20020a625c430000b02901bb9418b59bmr1372979pfb.35.1611873711385; 
 Thu, 28 Jan 2021 14:41:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/23] exec: Use uintptr_t in cpu_ldst.h
Date: Thu, 28 Jan 2021 12:41:22 -1000
Message-Id: <20210128224141.638790-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RZ+wfQ4SB352

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f..3f9063aade 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,14 +70,14 @@ typedef uint64_t abi_ptr;
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
 #define guest_addr_valid(x) (1)
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
+#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
@@ -85,7 +85,7 @@ static inline int guest_range_valid(unsigned long start, unsigned long len)
 }
 
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.25.1

