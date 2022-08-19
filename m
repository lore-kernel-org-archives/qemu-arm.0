Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp900211ejf;
        Fri, 19 Aug 2022 04:09:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4xCZ/WY2IBnKtPpumliTBoQlD84S0IBw62KHcEFcJBebeIDyaRDY1HEDOSuZ2magvfsmOv
X-Received: by 2002:ac8:5c53:0:b0:344:76e1:4843 with SMTP id j19-20020ac85c53000000b0034476e14843mr5757671qtj.281.1660907385724;
        Fri, 19 Aug 2022 04:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660907385; cv=none;
        d=google.com; s=arc-20160816;
        b=B0piscmgykUnM9CuA0SRpoQrCEU02CETEeE14mKdfNdvlJkysJEBMlAfLoUcojx6dk
         nZO2BahXog+szJvFEJCXlVJEoRje7kbxjfcgPsI6K0X6VtXOeqSQOO6VUhLOsHknpYXY
         lqLcafmrODTZssAdB3XrpsqI3JNF5hNIaz98YUvrMnp7BFDyDZjtqFWUHh+BVydv5t1f
         rrBDi9YHS6uc0u8GLSE54IKEtyDAs71pCzrsqDU9tD9y2u590chqb4i8fOFtIfEK6eoX
         kVVQK4umtNVctrDfnzuwIeAaH4DZAQnyPAmfD5jraS59b6fqNLtHqifuVeJh52zFY875
         g3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2SwX3hUzWovagIgXNOcUYZeZcVjENtYaAi9CW1/+M/4=;
        b=p9aEYmiphSBjXpOj5kGwYuJNQdISjHf0/t6gbuQWqZjbWHyIdAJalmBRWwUrLlHhfx
         uYNoRl2NUV0vowB7nIA16wNhWw7Org9Eef0q7QApOGGmtf+oZ46TygIJx/9dc1cYUl6A
         jJDqgzMozdn/bn+ZLxDGFTCy43EuAxvkA2+V1jUTJqE7AaQc0ptfQ8ndg3IZMb4ssQjZ
         7GOcIQdfAVQuosrhQIxxiZlUybXsy7Sxdo/61EYR75mBNE/ydYqeQ1CPysys7ZQjGhLK
         1RaXf1/Ncl0UTcKUdECC9ZrS6XBCO6AQeKWPg3AEPyuYdwWJRe6X6h1SzS4/++W59MAR
         zFrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAPTz6qo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a05620a28c200b006b5c88e0c09si2057653qkp.221.2022.08.19.04.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAPTz6qo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOzsn-0005fi-63
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkO-0002DG-IU
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkH-0001QM-Bb
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j7so4768612wrh.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=2SwX3hUzWovagIgXNOcUYZeZcVjENtYaAi9CW1/+M/4=;
 b=SAPTz6qokLZqjkrdp23cbGRtyNxkarU+3wrGR7pD4C3qDbHsypxqx32HBy5LEMUqEk
 aM62J454dKBXHWtZA5e4cl2euedCqyzj1lAZJFeHyj5dEKuPMYU6CFktGATJIqZtfU4o
 49pWWtDDIJ/hw5r9WB7iv59/mL+ssAUvSDnZ+1gj5mLodAtyaQobP97f7sBZ8o5mUrGz
 sUKPZ39+Tz/ZcORxpyNnk8ymxMgeZynJZtiyulaYUNVbv4abqCKf+NjqbCzQO+kz3m3n
 aPIQr4N4FXsSCWlzIqN3qj38vqLErWrHSZrJ6GVbuf4Oca00eXIKUephTRTX/xA9OlG9
 4gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=2SwX3hUzWovagIgXNOcUYZeZcVjENtYaAi9CW1/+M/4=;
 b=xfEKSjgHQoWdbKx6phjpCnTsaDpQ3k9o25gGVZqpZSS5I11AGlx+E2JNGQhBfU/AY6
 qcQyDQdiX6aryI/ZWJmGBEhcvGL7qqfWoPJOi8M8Mx/NHUZzdxjznqp/t+3Xc9efstC4
 nbWurfn6zcnEao59doJoMgZOKXCMA/geJXxXp324qEhWdxs454XkmfeSwDJ6ONyOzq1t
 U7PDe7As4YyBqSShJlPJoxyiF8bNaMRGz1k5/5PcPj7Mm7wA4iumAw/j6bgVVvpKiS2+
 oYcjUpf1M+Gn06fYwkPH5gqXKszLVm2jajMUl6JxE8bJ2J4KPRBObrBxEwfF+wes5Sgs
 aVJQ==
X-Gm-Message-State: ACgBeo1c6wUUuyMRGBfRGti0DUtZNdFImlNAjT91p5yvZichjg+rx4Hn
 8JJTNzn1bWWh62dxFkyyBooUxA==
X-Received: by 2002:a5d:6d04:0:b0:21f:877:e2ef with SMTP id
 e4-20020a5d6d04000000b0021f0877e2efmr4062500wrq.131.1660906855887; 
 Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Sort KVM reads of AArch32 ID registers into
 encoding order
Date: Fri, 19 Aug 2022 12:00:48 +0100
Message-Id: <20220819110052.2942289-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96wRv4kQZPZX

The code that reads the AArch32 ID registers from KVM in
kvm_arm_get_host_cpu_features() does so almost but not quite in
encoding order.  Move the read of ID_PFR2 down so it's really in
encoding order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9b9dd46d782..84c4c85f405 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -608,8 +608,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 1, 0));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
-                              ARM64_SYS_REG(3, 0, 0, 3, 4));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
@@ -643,6 +641,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 1));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 4));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.25.1

