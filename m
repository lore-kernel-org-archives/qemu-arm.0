Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp484191lfj;
        Thu, 12 May 2022 08:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8M1AnPndiOoBdoO0llyIUDzyBP2UUcg2Id5OXlDJIvpFT1LVihBWR7SnWFRS0BdjMa0L/
X-Received: by 2002:ad4:5c85:0:b0:45d:514b:86bd with SMTP id o5-20020ad45c85000000b0045d514b86bdmr157912qvh.99.1652368549151;
        Thu, 12 May 2022 08:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652368549; cv=none;
        d=google.com; s=arc-20160816;
        b=dz4pYjmB8W0C5ZbIPqyiIfiJNtGTBDWuIWvQQPTJSpOz3V3mMv76rgAT/U7lAIMuFD
         CcN8N3HEBegEwAiLuCi61pO6YpdeLjg5F4/HTF5dXsSiFr8wz8IIOQgELIj5htE7VudV
         eMT2/knD8V1338aewB8NiVi6duotvU0uwTFxaPd5Zr5Kix0O9eX4FWuCSDLxzVOKR12+
         KYj9QMDI5l9zlq4uu1jRRXyKNySgY5mrA0MRLELjR/0GDoZpcvf64BrOT1k4ZjBaI1JO
         9wXRnJcay8cBjWec54EviRBdjAaGCMyR/h0noJOGtYmPucuwXrDlpIgsBYcOBn+/LxZk
         hLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jO5+b2JhjvqPhcf+OmcGXbwSQuZxOSdmxxpR3rXGCoc=;
        b=eTnJB7gFLrXaEJhSgLfDdN3ncanm9m72R9GGbMy3pJhhRu711n9bTURCv92xAzhUIt
         2b5qwCyUzQ+x2bHFYYoNVDck7m7bapL4ty2xsN3Md3wEPiPPGW5v3hM8nhVzKBtrVxSc
         ylCliowWN0FNuPqJLPqY5X+gsoHD59zGxlnp9mROMTK/3cGVV1X/j4LzuNdt3TXIit1T
         3EyPYiiikUYJAlxSq79FR0bdSfYFQjHj0qIEVS8oNywM3jrnWLpzoW8j3ifgBIp7Nqj/
         MSfYnlnKu7eqsNRDKJwRamIQ/KuDPzPHyYVHlbeu8XTl+jtgconloNrbG+nHNSz72FFx
         bXvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YbT/71kU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05620a0d4b00b0069fadfafb77si2954607qkl.192.2022.05.12.08.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 08:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YbT/71kU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npAXc-00035q-LI
	for alex.bennee@linaro.org; Thu, 12 May 2022 11:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032t-4H
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWs-0000B4-3Z
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id i5so7676700wrc.13
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jO5+b2JhjvqPhcf+OmcGXbwSQuZxOSdmxxpR3rXGCoc=;
 b=YbT/71kUR7LJzoa0chD4nHh1u+sUOaIKv0xF2ddz3mgvSvHw1f2g9wFubtkvy0bAqF
 3GjpX0rLdf4EVvhRF7JvNiWeRnmlEQwcSdlpvUegSn63EMun3YxHjzveJYHQUwX2YhRJ
 37ywqQyB3T1e5ZgjCf0l/U/HBVXxzKF1TXZ63KYSMibsFwP0y3bsxVsv4nfN8+gYZ2h8
 2WXhroAmRDtUGwXN1GuNueHd4QBmE3LUgssJxzFEMyDsFVToXqhGqXCpWAWbzzTrEQ+X
 Xx0K8feVYTNzZXuVBPGUxWG0NSjgDvutODTmlLwiv8TZLFSns6HisotbZ7+x0+HHL2YH
 6UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jO5+b2JhjvqPhcf+OmcGXbwSQuZxOSdmxxpR3rXGCoc=;
 b=gs+bszg519oyFB0Eplt0BAvl2VF7yRy0/efe/jBnp1J0oVKnf51+OqKGhH3oiL6O+N
 Wg+VSgU1pzSdMQ4bPsUy+0JMhBFpvrD7ZmhJPw6dP3htxRBkLCr93m3V0ESdG4SABekc
 huhBDO/waPDFQncN72ZVZkJpzqgnytmfWqGTdoDV0Wg19B/boDRqptQxzu0wPyVyxIxM
 Kk8mf8nTUsxjcO5Mu7dPetatjmCSe3ksT8HGPWxoRCLjRx3IkzyqzkaktLHB1KodPbY5
 5bGg6gbi6zDwdyMC/KoCf0eUwBKCmUtYkqb6rMFCoV07Pq9HiQIncBvaft6wS89uNR8d
 FIEA==
X-Gm-Message-State: AOAM532fPE94zS36Z74X+piGpHVhrCgRhEcAG5L1FoGXi9+FUf7CanBB
 dPjpT/mMftEolFVGfcdCrFyXxRlV0bPSLg==
X-Received: by 2002:adf:f38a:0:b0:20a:bc71:fe3f with SMTP id
 m10-20020adff38a000000b0020abc71fe3fmr126283wro.47.1652368500880; 
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/6] hw/intc/arm_gicv3: report correct PRIbits field in
 ICV_CTLR_EL1
Date: Thu, 12 May 2022 16:14:53 +0100
Message-Id: <20220512151457.3899052-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PndRQAcXxVba

As noted in the comment, the PRIbits field in ICV_CTLR_EL1 is
supposed to match the ICH_VTR_EL2 PRIbits setting; that is, it is the
virtual priority bit setting, not the physical priority bit setting.
(For QEMU currently we always implement 8 bits of physical priority,
so the PRIbits field was previously 7, since it is defined to be
"priority bits - 1".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506162129.2896966-2-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index df2f8583564..ebf269b73a4 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -657,7 +657,7 @@ static uint64_t icv_ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * should match the ones reported in ich_vtr_read().
      */
     value = ICC_CTLR_EL1_A3V | (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->vpribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
 
     if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VEOIM) {
         value |= ICC_CTLR_EL1_EOIMODE;
-- 
2.25.1

