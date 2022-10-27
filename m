Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp414561ejn;
        Thu, 27 Oct 2022 07:03:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CtI+KkZu5fZVXfAjLBL3RHjJjgHdr6nrwTvAoMOnWZlNFb7LpC9JUstTKyd+UwempcMRN
X-Received: by 2002:a37:9785:0:b0:6cf:55d:e554 with SMTP id z127-20020a379785000000b006cf055de554mr34820988qkd.459.1666879433784;
        Thu, 27 Oct 2022 07:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666879433; cv=none;
        d=google.com; s=arc-20160816;
        b=RF70SPwPsjKcQCZZYGs8M42jXiaXR/wxTvg1DQDwLCas9ShmtA+qNYtGGqBAzQrsTn
         cJVuG7WcionSn/TNFA6Y7rPge9LR3Wxy0DxYWJOPPolNEDGr/pYc6m58xg5qqtEglfxJ
         oc2W4/SilwdionNEUwvycKTUal4g8Lzk8COE4qM5JnZZwXPwBnW5VVbmpfJRX4xGpniE
         aLZccazlJkM0WzyeRkdRcpp8ffXqxTOf2LT4KcgyQwW4SYFo3qfCd1cW7yuLSAzahYl4
         weh5DwVotR8YyP6S3040NX7wT54fNeD0CpLLtJJOrgtJ/8gvI6yuKfvhJ5SHupaPd49N
         KFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sxsG7XqK7FJahGsD3iXOduO+aSm9dtXBlxQk+S7kf6c=;
        b=FcADUEZyicWRcUh5TTBON4/Tp/PydS9O0hdJdwE0WK8ii4J4SLFsKMwrbjWHvzhpKU
         TXMdUwhkEtOUpVeLLCIpUsTf3cc5ZC0fLQGMD1c1by34ri06gAm0IxTK9q5JJ6d+DlP0
         DokQTd7n/vnFNV6XMo8SQuxur2DGw8ya84b0sIk2ohlrvwTaQ8zL9p9xIhBHB+1AYFhm
         a5OrxhOaejEwMj2/6F5a3gliKtrAfyC2xlLLlWmSvTm0OcE+5xXtANp39WwKzGrGMe3s
         Iik2RTzAMjitc24ta+J2qHR7e1O2yiZcwfRqDbLEHP7zkG7MFUlRPSSazpctvVgmlnuK
         0Jfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EoWnqlcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a05620a056f00b006ed2a651f0esi878760qkp.154.2022.10.27.07.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 07:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EoWnqlcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oo3Sa-00079K-WB; Thu, 27 Oct 2022 10:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SZ-0006xl-5x
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 10:02:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SX-0004yR-AH
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 10:02:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k8so2362444wrh.1
 for <qemu-arm@nongnu.org>; Thu, 27 Oct 2022 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxsG7XqK7FJahGsD3iXOduO+aSm9dtXBlxQk+S7kf6c=;
 b=EoWnqlcGZ1p78F9o1k8id8l/ID8lh4gkC1Zdd+IdaHlBt1BerGUgU9++BcfBBiemuC
 7RtxZ7omJWdvs9LSSyIHeuPOQpc/H8hmKueGFr6+fn9MYvyrAZ/+kI2xpmxsv29sXQpy
 4Xpfk6PsWTEzdEDppG3RUKyuZc9rPEQDufk7aPUWBmcsZkd/haJts4Q6VS5vZPj3YfIK
 nNDEPz5FjUFnmVamBHC5jGMxjTOoiquXxeBlBw07uKSPbxLTvtLGlJNhGARB7dJeDtiR
 krTtNXNl3Mqs56BWs/zw9a4W+fuCROV/L+4dw9X9D/r9NkLMhvkEDmJbS5Vh7qBZQzAs
 SBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxsG7XqK7FJahGsD3iXOduO+aSm9dtXBlxQk+S7kf6c=;
 b=pFlt0+y2RVciEAKYFC5Ptzti8wYxb4X5Z+A3nhb7yXNU3c/oSFzfWFZiDrDMIV4rW3
 abd3RSLJ2OwbwgvNROOdzmql106HHKCNZ1kD14XLUqo07s5G5gsnfmagK/XlZ0JBAPFk
 xqfonOl0qdAKQZ6x2fTUU0Syx5HcLrFkqHZ8k3R6gV48RDY9XtNdaq9wC1ZodyrI6Gup
 RokKCrG6+Hp0PnlaTpF/0srxIeGeuxYi8dCbxwf7QvNu9QPTRsqf87nBd3AOvHf2BAO3
 x4Cv+YQo4CR+Q2Bkp/VR6U+JwnmqfagPQ/xylRUUeKL0y0P3az41RZB7nCJsCCmW/a33
 MQFw==
X-Gm-Message-State: ACrzQf3MzfAMmQz6/eGw2N00Nmem9L+rR3fCDYad2dujkoMEity8DhRY
 vQSHk0pawQQnBqJX6L/QUfpkji9mzoEhUw==
X-Received: by 2002:adf:e195:0:b0:22f:6117:a932 with SMTP id
 az21-20020adfe195000000b0022f6117a932mr32671859wrb.572.1666879332039; 
 Thu, 27 Oct 2022 07:02:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm1301236wrb.37.2022.10.27.07.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:02:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH 1/2] hw/arm/boot: Set SME and SVE EL3 vector lengths when
 booting kernel
Date: Thu, 27 Oct 2022 15:02:06 +0100
Message-Id: <20221027140207.413084-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027140207.413084-1-peter.maydell@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pIToTghzMVgH

When we direct boot a kernel on a CPU which emulates EL3, we need
to set up the EL3 system registers as the Linux kernel documentation
specifies:
 https://www.kernel.org/doc/Documentation/arm64/booting.rst

For SVE and SME this includes:
    - ZCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel is executed on.
    - SMCR_EL3.LEN must be initialised to the same value for all CPUs the
      kernel will execute on.

Although we are technically compliant with this, the "same value" we
currently use by default is the reset value of 0.  This will end up
forcing the guest kernel's SVE and SME vector length to be only the
smallest supported length.

Initialize the vector length fields to their maximum possible value,
which is 0xf. If the implementation doesn't actually support that
vector length then the effective vector length will be constrained
down to the maximum supported value at point of use.

This allows the guest to use all the vector lengths the emulated CPU
supports (by programming the _EL2 and _EL1 versions of these
registers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b0b92af1889..0e4d1e5a816 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -762,10 +762,12 @@ static void do_cpu_reset(void *opaque)
                     }
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
+                        env->vfp.zcr_el[3] = 0xf;
                     }
                     if (cpu_isar_feature(aa64_sme, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
                         env->cp15.scr_el3 |= SCR_ENTP2;
+                        env->vfp.smcr_el[3] = 0xf;
                     }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
-- 
2.25.1

