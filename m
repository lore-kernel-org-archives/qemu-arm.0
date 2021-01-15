Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp674735lfq;
        Fri, 15 Jan 2021 14:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOvNbFYA8eQXG5NsrdBxhXlgxZQ6KBYH/u71jUYFd105hu+eVKxcX1+6TQ8+453G7Y+e6b
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr20634769ybt.21.1610751043109;
        Fri, 15 Jan 2021 14:50:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751043; cv=none;
        d=google.com; s=arc-20160816;
        b=E3HcfAYJUvT7RC1TH0CjayKJHFReEvY5pkZp3RskaFh823LfpPW0+S86bGAcVAoz66
         Xk4QbeoUd5doN7a/2VBuT7hAz9L/mRI0ROAHaGIPYByUQtM8e5EO6/rBnFtVp8y4lkU6
         4k+i7t8nnpIiPCk+wacl9N+2vo8uGHw51OIRaI1wpN7GR7HCH0EBw/h9ASl93vTTnggJ
         kqL7+edw5eg7IYkwqQD1ac+e5bQb9vPVyjM8X6pnwwmCE2zu0kPSXchuxpay4IPXXNOx
         dZtnclShVkBZ4q4rBXwKVr4VnMwByYKgQyXiMokE2vx7El/NbHNS3F+vwT1nuoLBFvhf
         Tr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
        b=hzev6fQfhJSkp1GMyC5G1CQcDHX+gAkF0mjvYM3BOTtF8DP5t1Gl8Kl3Sa78rgEiGY
         iZDwxcgrCELBE2gvDATkKLh5h433Yh9k08GFg922YbL66U6wI3u+4hcbJwRORkVHygkF
         kPyAN+db7fkKZWjinxpQt4bqQy4ukSvLkeMV0lMq2kM8lYGv8tvQbB5GamCyj/kLEIRj
         jXfCDweXFPOPIIvQh1MBHA4TF1AX+jcfB6HeJvqQwLFv+1IYmXHjzoqmnfVYHxYPkkGZ
         16L36k0GJxhpTT6sW6pLV7gO5PDmGYsL+9yCispiFenOlgjoCHcHAV97mAN9VZSRko7j
         GK5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ii11emU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p187si9609453yba.163.2021.01.15.14.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ii11emU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0XvW-0007DU-DT
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs3-0003Xc-PN
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrt-0005D1-WF
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:04 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so5438227plh.12
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=Ii11emU21XXA52/szniJPxFW7eatwD+xZDT7o7o6j3R9fHAsGDCsRXujER8F9l0bV9
 qSFsWQUaSvCuosTkzdQHBEYqgy5E3uO+y66zlvQH6bmaVbyhmNMi4HMgmSERSNCNFF0a
 qr90BL4XHqOmZHQg9TGVCWCWX1r35lnVAxKZvyvb8z7PQ9oMAyss/4ZJ8IaWQ/9FqEgI
 WAI2nGwYzR+b6d7HYudUVrgXaHzrN2+OBADyBuqKXO8KBKOIgtyg6jYyDjZVtWZ7lqoq
 GEbdMwzoNSWo8WWZRHAiUmTNb6f9OmXGL162uoeHdIXzB8rWLeyxj6FBArY1DKBRWNMq
 Hmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=rZQS65RGN6gmF/nPkqwPBs67eimsSyBzg7WhPHov/xaD1Lc2YStjFJBHTYoM4xqfSu
 k++rRZmTm2e+Ckx3KaG6w5T1MfKtL5QOtIE/KC3MXA/lZ5e2HfbDDtLKEwmul67R6Ee9
 u2noeEKggiGvYzeUwPAxf0eYwUk6+B9MvZIJ/NGmTyRfmbdI3Kra0CxEDi26Z6nvRGn3
 iRVfxWNHjZf2UttZdJgvS5Ff6ElKL85GuMXIpcdOT+xKWV3jUoSylrHZUpIXd/comrAs
 2ft18xso01IqH3XiZIcvqWCwwiT7WrH8ISCyuUE3NZj4of8jDbVfH7GiJof9sSaFz9nZ
 MLyQ==
X-Gm-Message-State: AOAM531KbuqVo7KTehp42VRkAZB92FdwyT626w3eK75ZPVjJngho//El
 azBk+7ELaUzmCnWftgqBSIkZLQ==
X-Received: by 2002:a17:90a:5991:: with SMTP id
 l17mr1845333pji.187.1610750815323; 
 Fri, 15 Jan 2021 14:46:55 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/21] exec: Use uintptr_t in cpu_ldst.h
Date: Fri, 15 Jan 2021 12:46:28 -1000
Message-Id: <20210115224645.1196742-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-TUID: yoRhMyQeFBy/

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

