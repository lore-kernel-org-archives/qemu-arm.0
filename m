Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp209948ejm;
        Fri, 14 Apr 2023 09:04:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350YV9yN5qlxkQ2zIdMFp0BtdujPJQ7dPik0CTTOBdEZTeGIGR5rJkIw+SX2dF8/AgWC/XZ4w
X-Received: by 2002:a05:622a:1705:b0:3b9:e0b2:9a49 with SMTP id h5-20020a05622a170500b003b9e0b29a49mr9570497qtk.60.1681488296782;
        Fri, 14 Apr 2023 09:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681488296; cv=none;
        d=google.com; s=arc-20160816;
        b=oXNyuDy1ZU2lA+tQIC45bbqYtHvvOOp2Uyt24sQeRXCT/LB4JEisSPb3bDcuycG4DW
         UCWIEl2BYH7bmApXpXZ/llp80Ibp41RHYcTYFcSnCy6w+/IYyKhFZWj2dxCt0kfIu11V
         H1wVWB2qIxghfCvWWDswuaxpx6neqWB/zmBTm8lN9mVwj9XVpUlCFV2nNbCMYwEriykZ
         7r6neYMplBpOEHxmVQqJkJac81HvZSdPm35k64L9d1nxPoDD5GtO6/nhQuRn2VGqYyOF
         ftBhYjjxTyNWq6X1new37+SW+BQUPQYQM+/LbwvONWCuj5oA0Jubus2CSjfD2LFUa44B
         g+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JuAuDSPuE/JnH8NiYlJET7XN0aNFOky+lUCpFOTs4Zw=;
        b=mfMY9/8dPdIqI62ijDDT4WScctvHVJVrdzHuER4hqhcZZOSW+Gk18yyq73+i1jHM71
         inqA8ml1kLK/uLDZuxI3ljJcFiCkPjZPZudYQiYmj6qyezozr8ngACsbNPhgosJ7C7rt
         io+n63VyqjfBzJxi5anFeAChcnO2naPtrRYhqfpURmQcfsfi7yzPE2k1F7r+6PiyRWju
         cOxHq6oHtwUxxj2lXZQQ/lKziDYyWbNVg/abF7Y4S6//YGbGSunZrMVrAOMqwhn6AcFY
         dBRIkBPdaNYH+1/2ilHeE75+EI+OMYD9w6EG07ZsT8k+nlurpJhRO92iCRgLoNYL6G6D
         IhzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLOeWaX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac85c06000000b003b852fc2c43si2787446qti.434.2023.04.14.09.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 09:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kLOeWaX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnLub-0006Lo-Ql; Fri, 14 Apr 2023 12:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuV-0006Gx-1s
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 12:04:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuN-0007uK-GT
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 12:04:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id j15so4297568wrb.11
 for <qemu-arm@nongnu.org>; Fri, 14 Apr 2023 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488256; x=1684080256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuAuDSPuE/JnH8NiYlJET7XN0aNFOky+lUCpFOTs4Zw=;
 b=kLOeWaX547vj2pq9D70zKNPaDV2RtAzetYWxUr128oko7f8OrZUSj9uAqtoiaAWBVU
 cHfQRrK7bV3ZVJZdEpxlpu7QspX39juGTt7RLh2SyLNAqa+c694OuaatZAMD6hjt5tSY
 pQZahx95+Uf//b2mZ3ibI/6BIgIS6z0f7Yt0H/SrrSam19xTEMRKmivV7Qhx5t10/BBI
 00AvFpo2IcjAQ3UUhrRmvo43KEav6MaWX+T3mXDQckHy9OXIqg4hpNuBWh/7RI5IBknv
 BElLWPMhfn5zfootKIq6Yz9hQhyQKJQx81jlu0+Q2iD652GdrwWAJaJhtxgO0xTQna1M
 8FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488256; x=1684080256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuAuDSPuE/JnH8NiYlJET7XN0aNFOky+lUCpFOTs4Zw=;
 b=TlFXkdB8lCQM5gNmnhN1PduHizit5VpCa47ZLMfa4rpHGG+hhCvDp0z+1x9CDsPFG/
 N0/izD/8FmOrWxAY1KUtuau9COM4RLlKfM4MHGnQAIVi3es+EpBB4dw1r+udfULqWh9b
 XUiEa+x7Bke+J2q7RuFsOgFsCBMqcRym4sWpqECgtpc2H6VQrKjM7wNnT+d04UHaOyKn
 lka7BZ/1dRDCYlmqbFBmZ5sxvuHIT3/y3ay/dq4X598FzBbbwa0/gdbbk7++S3QDjmuM
 v1vHi+zi1NrFRblrBaq1lX8Atgk0WU1Tor9hQxNKa0K1pP/c1RkRfi44ojrUyv5muR6f
 3V6A==
X-Gm-Message-State: AAQBX9e4L6iD2Vzi/BcdWg1gV3Er1a28oBfIZoJ7VmQW9+TBdp9bxoPw
 gNd6a1/J2p4clvVwmPK+P7iCsVnAUZvt7TgzJSY=
X-Received: by 2002:a5d:4fc1:0:b0:2f5:9b1f:da81 with SMTP id
 h1-20020a5d4fc1000000b002f59b1fda81mr4293233wrw.54.1681488256115; 
 Fri, 14 Apr 2023 09:04:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b003ef71d541cbsm4673752wmg.1.2023.04.14.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
Date: Fri, 14 Apr 2023 17:04:12 +0100
Message-Id: <20230414160413.549801-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160413.549801-1-peter.maydell@linaro.org>
References: <20230414160413.549801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kRwe6QqMBelT

In S1_ptw_translate(), we are in one of two situations:
 (1) translating an S1 page table walk through S2
 (2) translating an S2 page table walk through a physical regime

In case (1), ptw->in_secure indicates whether S1 is a Secure or
NonSecure translation regime.  In case (2), ptw->in_secure indicates
whether this stage 2 translation is for a Secure IPA or a NonSecure
IPA.  In particular, because of the VTCR_EL2.NSW and VSTCR_EL2.SW
bits, we can be doing a translation of a NonSecure IPA where the page
tables are in the Secure space.

Correct the setting of the ptw->out_secure value for the
regime-is-physical case:
 * it depends on whether s2_mmu_idx is Phys_S or Phys, not
   on the value of is_secure
 * we don't need to look at the VTCR_EL2.NSW and VSTCR.SW bits
   again here, as we already did that in get_phys_addr_twostage()
   to set the correct in_ptw_idx

This error doesn't currently cause a problem in itself because
we are incorrectly setting ptw->in_secure to s2walk_secure in
get_phys_addr_twostage(), but we need to fix this before we can
correct that problem.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 06865227642..c1e124df495 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -249,7 +249,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             /* Regime is physical. */
             ptw->out_phys = addr;
             pte_attrs = 0;
-            pte_secure = is_secure;
+            pte_secure = s2_mmu_idx == ARMMMUIdx_Phys_S;
         }
         ptw->out_host = NULL;
         ptw->out_rw = false;
@@ -291,13 +291,15 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             fi->s1ns = !is_secure;
             return false;
         }
+        /* Check if page table walk is to secure or non-secure PA space. */
+        ptw->out_secure = (is_secure
+                           && !(pte_secure
+                                ? env->cp15.vstcr_el2 & VSTCR_SW
+                                : env->cp15.vtcr_el2 & VTCR_NSW));
+    } else {
+        /* Regime is physical */
+        ptw->out_secure = pte_secure;
     }
-
-    /* Check if page table walk is to secure or non-secure PA space. */
-    ptw->out_secure = (is_secure
-                       && !(pte_secure
-                            ? env->cp15.vstcr_el2 & VSTCR_SW
-                            : env->cp15.vtcr_el2 & VTCR_NSW));
     ptw->out_be = regime_translation_big_endian(env, mmu_idx);
     return true;
 
-- 
2.34.1

