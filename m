Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp485182lfj;
        Thu, 12 May 2022 08:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoPn2hoKWXbekl1YztO90QJ7b9/Ye6bD+Immx40YFz57A759qqpTzIGc8cdQRRp9H6GoMv
X-Received: by 2002:a05:6214:224f:b0:43f:d536:d014 with SMTP id c15-20020a056214224f00b0043fd536d014mr229131qvc.50.1652368634648;
        Thu, 12 May 2022 08:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652368634; cv=none;
        d=google.com; s=arc-20160816;
        b=fA9wf+pnhyB3ES1yH4kcuKezScVGry8RbZJJ5G1bempTLzEIy8j2av6lfOsvYy0+sA
         GAwDgOS5biB+huw8X+JaCPRNhLazv0dYKYIaSD/NVHPXp9UohrP+phmNa4x4oc5qJMct
         gSA8cFSlSNLLphw2QlXfDn0dutSFzvu/hEL/EGY6H9p67yVGk5UPcTe+I791MvBelEpN
         WfhcEOo6o4pRfzyrSI2/uFD7i5gLcT5uEup/m4otGKAiyWc7/rgEkp2yxZXKT/TZ9wjf
         ZHkH7F4l4C7Rh1VYRRsdk5VKCHGMAg8/Dvt5iW7nvwKox4OG1H8bsBYKIvglWIuT7Chv
         5QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xFazlkHMmhQpRiaZlAgor2aleWAxzk2mzxtr5ZyM5M0=;
        b=e2nswcqrcHIcZbPnfNLvmdJ6jwhXIXJb+Gt8QoHsrvv1USJ3Bcka1inhJWJ64PZV2e
         kOnTUFWgw2ra3I5IPmC0pg0cedPui2AIKkkSMOWsY64GuHJI3YgWNK7IJek5Z3rcPmAq
         3AmPl6nEQu/IcrBRtomsSstCR+rG0x2x6equ8k4rz/V1EmsKQ1mcppBXqrhEPrU1x5/5
         Q70Nf/6nAwr7XvYgRnSShCiosFo30w9zhSnuOSdG7QhMtac4js1xtZJmBSPbR5SdYEP7
         ADiQxemVNPYv/H7Zdjb07P17roQR5X/O9sbb8N5iak6N1QmhcVRqJEeEbb1PGwxm7R/8
         NHtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ggoec+30;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85703000000b002f3db0c7529si3401647qtw.313.2022.05.12.08.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 08:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ggoec+30;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npAZ0-0005ca-5E
	for alex.bennee@linaro.org; Thu, 12 May 2022 11:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032w-Mw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWt-0000Cn-4E
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id f2so698562wrc.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFazlkHMmhQpRiaZlAgor2aleWAxzk2mzxtr5ZyM5M0=;
 b=Ggoec+30JRP6CU9tkY5yT3493FYw37Z7c5pLDCRIPElqYCeN/jcA0VHEPDc/8rm8GK
 Me511zSVA95XQ7C5stNbqZ8NRWVSfiA8OTHV88YFxvBwGW5JGUnEwjIsJRsWu2FkuXK/
 pDM/6FvfIAVnWzs7aXdQRuwqeSL6aaSn8ubJ8LRC41FDSh03KjzBJL5gcz/YQpPEAoTb
 BWlb2OIhnCc2b6s9s/UMmal8EkYraDvE4a+31H+WeZsFVW4bWAkWMhHkGXu8hEu6fF+R
 EOj6XP+YT9w/W+tZlC/9WNvzzZZymdaB8ezyQ9n2CGKB3r/QHmPfR6EXC3swEY0mMGfo
 25bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFazlkHMmhQpRiaZlAgor2aleWAxzk2mzxtr5ZyM5M0=;
 b=Z4doQVPnhpTAItGzwiluG10Ois3kycw3mODqPUn4LvQ8Zq9li/Y1/7WVu81Y8HIGnK
 bfbOdeEZw5IlhPHxRgcydvFiBijAp6emK+nupcK7c7MYJUG/4ZGmrKZ98Ozcz5QODKOU
 FxY8YOWt9wf9Lez6zSfsElvm2JNseLN1EXTD+fo9CBe2HAQg9Lbld1BFYWKxXu1NsOK/
 jrubDxA7iyLqzmgE74UOU/a8RzfsVMN8A1DP/ls3lChN0vjy865Rm4+qKGnvafVbxNvS
 YZsqT7fcxAAwtnWhQzZq0MY2Ti34QKuvmefR4v1m49DPCcvJYgvX5i6nVOcGy90z8trl
 fNjw==
X-Gm-Message-State: AOAM532Z4CALqgIvuJbDCZVUOpZG51Q7jThRE96rLeINWMD/XgTneG+6
 KmLnLltp7TwEtorxKmfK6+6NIA==
X-Received: by 2002:a5d:6183:0:b0:20a:db51:f21a with SMTP id
 j3-20020a5d6183000000b0020adb51f21amr126211wru.127.1652368501738; 
 Thu, 12 May 2022 08:15:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/6] hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR
 constant
Date: Thu, 12 May 2022 16:14:54 +0100
Message-Id: <20220512151457.3899052-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UCB5+XSHcrO9

The GIC_MIN_BPR constant defines the minimum BPR value that the TCG
emulated GICv3 supports.  We're currently using this also as the
value we reset the KVM GICv3 ICC_BPR registers to, but this is only
right by accident.

We want to make the emulated GICv3 use a configurable number of
priority bits, which means that GIC_MIN_BPR will no longer be a
constant.  Replace the uses in the KVM reset code with literal 0,
plus a constant explaining why this is reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-3-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_kvm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 2922c516e56..3ca643ecba4 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -673,9 +673,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     s = c->gic;
 
     c->icc_pmr_el1 = 0;
-    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+    /*
+     * Architecturally the reset value of the ICC_BPR registers
+     * is UNKNOWN. We set them all to 0 here; when the kernel
+     * uses these values to program the ICH_VMCR_EL2 fields that
+     * determine the guest-visible ICC_BPR register values, the
+     * hardware's "writing a value less than the minimum sets
+     * the field to the minimum value" behaviour will result in
+     * them effectively resetting to the correct minimum value
+     * for the host GIC.
+     */
+    c->icc_bpr[GICV3_G0] = 0;
+    c->icc_bpr[GICV3_G1] = 0;
+    c->icc_bpr[GICV3_G1NS] = 0;
 
     c->icc_sre_el1 = 0x7;
     memset(c->icc_apr, 0, sizeof(c->icc_apr));
-- 
2.25.1

