Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1483795ejb;
        Mon, 7 Aug 2023 07:15:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiONa5a26eBE6Lw2nT1mOd2aa9FP98Vx6cLOW3YWyBwL7ZGgaii7J0yc7o6stIbdYmfURP
X-Received: by 2002:a05:620a:1345:b0:76c:8b47:f394 with SMTP id c5-20020a05620a134500b0076c8b47f394mr9660133qkl.2.1691417756290;
        Mon, 07 Aug 2023 07:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417756; cv=none;
        d=google.com; s=arc-20160816;
        b=itj7ANhpekG7StrRcYOECApxBEiyaoS2p7CBFr58knwsLnlmGMNFTgA6oEPuiE66uy
         gRGgyOb9imjyeCZXLGcxjPkgd0H9vNeaHAKiiDemDzgrIjIE+PwkSNNR32kGCVFp0ypL
         3RThurHiCnP16HPALvcz6LH5gg1HBjTO+vQTIEV+4mAN7Loz4dFfX78bWOEPObPmjOj3
         z+PLLP3B+YdQtH5TVS/wzzSPJkwUB14ZLfSMakpo1N7PTKavyyBDvo3pTuBD+5kVZ5Ov
         WksIL0GbN3r4BMioQ04qtMxU3Y8CIgHHW6O0UL5TVdC1CG/lYhfzN3CEUDMdezd7BrjQ
         klUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mTF0rpR5T9/+RGJwHtQl5zTiqKLJXEt3Fbl4hFG5dDw=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=MKfWX/BSa0TWQR3ZHEtj691dfh9ufq5vaJPuxOx3ejyXY3RHjLi3MB9UR4P0EhYOyk
         jEE0N1Zf4tVdCG81V39VI4TTB/py3jL2DnqwliU/M2K1R1rGOCkWnqeDOV8htSTkg2qG
         E+W/9GxQjdNhte3gAEq3Aci03iFDkYUA0MWhgrIRAF/4xvL2dfI9c5TGRKjisHCn+mL8
         HqjNBRWw0w5ioMxgfZmrbxIgfl5j00zjUAtGixLHS0IcxiFBbTMsVH/vzkwYpk1tbDgp
         8vSosg5zJSWCxi7M2K82kNlh0a97P1gwFxPUVioHVYNN98p2ltGv8fn1U0iEz6kNPvcO
         4+5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kmnnw5f6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sm2-20020a05620a944200b0076cce073411si4700054qkn.649.2023.08.07.07.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kmnnw5f6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT118-0000At-Hm; Mon, 07 Aug 2023 10:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10z-00007X-T8
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10x-0005RT-6g
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so16818155e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417717; x=1692022517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mTF0rpR5T9/+RGJwHtQl5zTiqKLJXEt3Fbl4hFG5dDw=;
 b=Kmnnw5f6J1PD5PC8Gkwbux13uGZIYn7v57Sy74U+sqM17YqR+Hs6bjf1diPoqv5QaR
 HZpN08etf2GPFvfCgJ1banmEscT/8QPya9FCSUee4xlt3GNdXtjP6VU6zRzabRDWTWUL
 rm8wa/JTA8IWd+IYBSQQE9yURgXWzQfJn/0X7t5D0lu7fBr0kDO9EAT04spiaAAOcxJb
 NQKPy/CdXZfGmVZtwB3sxe7EvI6FQAUUVGkxOMGEFy58Sv0rK1xgV4qJdHkFWLaXDFKZ
 PFABke3Yne31pkA8RSM9TVvvAjn0OGJShU2OFDC72AQ1+Dd2CZ820GHofWD5JsS3b3qk
 ONWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417717; x=1692022517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mTF0rpR5T9/+RGJwHtQl5zTiqKLJXEt3Fbl4hFG5dDw=;
 b=aS0oTqsPx0RZQDtKLnyl/tp12E5nQDzfHUYyzM4lgJFzZhCO8heeYuvPGtQrwWKs1d
 tc/ZUq8CyouODJT/jTdoa6/4ofdoW6kQTxHJ/m++cqALgfJMoqPLEtM12wKnJcNguWxr
 oYVUTmeJxByY4BWEOyagT+L8HXFw9fG+th10BZvaOTN3GBE8Z9nu0QluoAldNw9hFTow
 IQR+27RLNwrToz20mnKnrJHqRbnogkBJhAl2IvttWPT7T69RZnUFLOuoVNT7hKz2rhJN
 kXpZxWhu7gA6TK6FUr65vDEzOm4usKtt/esi9b9ZFHxXrBFJSXmfAFkJlVllcvfXH/X+
 TglQ==
X-Gm-Message-State: AOJu0YzsbMUd1qbX/7+fp7TLDHu/LhWXl1AeK8Ry3bIK6tXzj20dUsdW
 DXzO8vJgGPyq2pnoGqefrtxAr7q+YoqAld9lmpo=
X-Received: by 2002:a05:600c:1d05:b0:3fb:e1d0:6417 with SMTP id
 l5-20020a05600c1d0500b003fbe1d06417mr5437826wms.19.1691417717623; 
 Mon, 07 Aug 2023 07:15:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] target/arm/ptw: Don't report GPC faults on stage 1
 ptw as stage2 faults
Date: Mon,  7 Aug 2023 15:15:01 +0100
Message-Id: <20230807141514.19075-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eZmEplQqWKL1

In S1_ptw_translate() we set up the ARMMMUFaultInfo if the attempt to
translate the page descriptor address into a physical address fails.
This used to only be possible if we are doing a stage 2 ptw for that
descriptor address, and so the code always sets fi->stage2 and
fi->s1ptw to true.  However, with FEAT_RME it is also possible for
the lookup of the page descriptor address to fail because of a
Granule Protection Check fault.  These should not be reported as
stage 2, otherwise arm_deliver_fault() will incorrectly set
HPFAR_EL2.  Similarly the s1ptw bit should only be set for stage 2
faults on stage 1 translation table walks, i.e.  not for GPC faults.

Add a comment to the the other place where we might detect a
stage2-fault-on-stage-1-ptw, in arm_casq_ptw(), noting why we know in
that case that it must really be a stage 2 fault and not a GPC fault.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bafeb876ad7..eb57ebd897b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -600,8 +600,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_GPCFOnWalk;
     }
     fi->s2addr = addr;
-    fi->stage2 = true;
-    fi->s1ptw = true;
+    fi->stage2 = regime_is_stage2(s2_mmu_idx);
+    fi->s1ptw = fi->stage2;
     fi->s1ns = !is_secure;
     return false;
 }
@@ -719,6 +719,12 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
         env->tlb_fi = NULL;
 
         if (unlikely(flags & TLB_INVALID_MASK)) {
+            /*
+             * We know this must be a stage 2 fault because the granule
+             * protection table does not separately track read and write
+             * permission, so all GPC faults are caught in S1_ptw_translate():
+             * we only get here for "readable but not writeable".
+             */
             assert(fi->type != ARMFault_None);
             fi->s2addr = ptw->out_virt;
             fi->stage2 = true;
-- 
2.34.1

