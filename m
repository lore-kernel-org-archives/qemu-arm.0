Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp495578lfo;
        Wed, 3 Feb 2021 11:22:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTRFQuqX05Tw+ET1NwqTLxJvf6tcRGacqXwXUA49AOhN4UwwPFR1LHjpuGm/f0FVl4a1K6
X-Received: by 2002:a25:7c46:: with SMTP id x67mr6172797ybc.464.1612380160175;
        Wed, 03 Feb 2021 11:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380160; cv=none;
        d=google.com; s=arc-20160816;
        b=Jq2NGYw/6h9Bvsu3+uNETXfAYIIE7DXQZKoF5b2psc6633LXW+YzpBWUDcYKE+oPqF
         2FADSzHuP/vvm+/o1NB6gNInM8DBqfTXm8h0jTatrQWkZvs5dN6suX4sR6Dwn1eRadvp
         iiBAHCcDebYvf4JkHccyPXfdyJwR8LeqCieJKjG0z2zG0NEQP1+y77Lz/j9qe6AkDT97
         ysl1wOiYKOM75Iu7oz2Xpvv6xwb+KmfMMwFlsZCEBUpzQRnFSvyxWTCrQTf1Q82mXwLk
         RSmI3t9VuE8g9h+MsXH2vkY5mo/s/j7oABZKNyynXagmcX7+Nq8/9RVHxogHC9puGkxV
         Ao0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
        b=aFsFuem1JG6+rJpoDySr8cTCtjdX362++j0Is+1Ah0d+ZhIm2oKP11pZqWCJET3QrP
         dPTEDYECLhfHHWizn4lVp7g8j/Z8wdddpM0oQKrqlzVEtHeF8xek45Nddhs4P0jmpDXw
         DK1s8ioQ+7QyprTlJKFv6gLnynvuzxxm1mRwOjrJe7n+BL8mR3IHEfQ3fgVSH+QC3CfE
         BIW+ZuSjxZV2sBEOU5kAdzp3uldFrNjPmEgyD4O8OeFit46MNHNbqFPRQjahZXPxZ9bx
         OuiCBxZjnmrZ2R1KdnaL84ZmgUvyMwJk6w0DGUiGWyzTeU4zbCMwO2OwKrCA8q9B0XDK
         kbcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rih5Wxio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si3356294ybk.471.2021.02.03.11.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rih5Wxio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Njb-0006mY-HD
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOL-0007Gh-Sy
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO6-0001Xt-VY
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: by mail-pg1-x529.google.com with SMTP id z21so391516pgj.4
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=Rih5WxioQvillJyGLi9Kv1x13x4S3l6j3fwoNV/X87/NtsYTrfY6i00RoeQSOXiKXs
 En2S9KdyLbqJ8D5onwOG5VOyMSSDw8YIqbSozyC4mFFcr3yN3H4YEqBff470qPzGVTCM
 0QhlUwtTs6ietDD4P4ElcvS4TsvtfkxwyCxZS14oEM9jCMgSU+fPd0sZRhNnp2lFE9dG
 Yd8tJmUktYMOe/cYxToEsQrqSpEP47AM7KiBfXfzP2w+slXpC6PlEqigdc1Sa7aKwAyG
 IHdpbWupg2wClSJd2Z0NXgwLn2tkF/G6RtP348Qh0s8+YeahtLUhOFxhYjRYErdHA9gi
 1oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=qXTWHpVfCtLnj3Q1m0SYqKUxqPpDKadfjBQGUY3chrrXQz9dZjLwKa+ukbGRSO2SVt
 t5aioV9ZX2mje7/iRqFvpR7v43EflP6pE38HSDCkNJdf5R2t8udrsQno+LJ+cvSEOZtj
 7xSIXOr9eIhYp3M4qRFjWgc1rvgjn6sg79mT/cLksCSCIwMwSj5hvjDvFcUTdZC8gI75
 glcZOXrEDvoSRJNyuIMfdxcXSOifsoOqS/ZAc68FsI0J1Wk/oQ8yf3IL7RXOXjQDKyH/
 cjWOYNmR8bXVckTGIdf02lLPcZOQwt3cCpPm8aVYKqcG1u8sU/EFavkeXs+BAgu73bz+
 W92w==
X-Gm-Message-State: AOAM532P3VJSwWTVxGh7A/PzXNuubADQwaGz2fJq/BLXC5RGTs7t1D0f
 7RN0cozWLNy+smSi3qZkROrlYA==
X-Received: by 2002:a62:190d:0:b029:1bd:e11c:4eff with SMTP id
 13-20020a62190d0000b02901bde11c4effmr4496067pfz.22.1612378822419; 
 Wed, 03 Feb 2021 11:00:22 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/31] exec: Use uintptr_t in cpu_ldst.h
Date: Wed,  3 Feb 2021 08:59:43 -1000
Message-Id: <20210203190010.759771-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ite2c79rSOyp

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

