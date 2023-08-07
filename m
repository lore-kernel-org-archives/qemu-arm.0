Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484525ejb;
        Mon, 7 Aug 2023 07:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb/vQiaNd/REIbGWYebVpZ7YJdHQsh84i7cJKPE0quknaotWkt0JFX69A0e8ai07R5cIpx
X-Received: by 2002:a05:620a:1314:b0:76c:d9e9:541 with SMTP id o20-20020a05620a131400b0076cd9e90541mr7657482qkj.78.1691417816140;
        Mon, 07 Aug 2023 07:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417816; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ8mka67uHsht7uNOv3CPymaGPS6+kmPYLce1UaT1GLCJiX2eedz20qlYphq8nVM7o
         5OFx7uc9oIG5E7gaEzd4dakOmfufb8yuqHh+3hzS0idwLAOgr/z5JVIj9pLWw8cZzkYE
         Cwy78k9De2oL7bNwQAYVc3NIdjRDCs9x8C9us6buLB8oFdUEhukvHGSfvO8IFoEilDI8
         Wcb7+zQyR7whAkS/wHX0PkzzQXEFDvMgs5e39wOtyF7yK56fpWz6U+08lgL1iK+SqLP8
         xZoCCa91W8258mi7qrB4RFK6jz87vGaoJeIRuq+HL74CiOza0VUz0a27nvOyXvLBqyjD
         7sMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lEu4y95quZyOnfSNj/UQtZgzoOcsDey9aZLknEbvT3o=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=MJo1L+jGBNvaiLZph5Zc2tAenzHpSnuLiZDezhveK02accvbcrsjjP3CDmtVVQudqe
         D6uI/8glNIs//+w4drQMb7nJRvb/e1dTSkM87jYaJBHUeQDdGGN2glQ8V7qWGgqZQ0zL
         +hee704AmjAchJBSGaoZcpkGWLiSlELvBBcuboba1u13AGuYbt8cgJtQFW8tgifZGAup
         7QzzILmwHonipqqofgEfSkjGUzKhKPqLc9Oot/R5dKmT6rTgriFl9FkX5iPfZPtjzfeQ
         jUiLgvQBv/opb6A6uuimDfDdD8gDYiQqvhcEkzQyNRYQPbOdl6lN/zSDF4938cRdA/8T
         +bTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zyd9Hod5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a024700b0076cc5efe8d8si4871602qkn.737.2023.08.07.07.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zyd9Hod5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT11p-0000hp-EI; Mon, 07 Aug 2023 10:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-00008l-OH
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10x-0005Ro-NU
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb727cso27448485e9.0
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417718; x=1692022518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lEu4y95quZyOnfSNj/UQtZgzoOcsDey9aZLknEbvT3o=;
 b=zyd9Hod5fYJ8oZzm3df5Jw3vw9gzN/MCBrJeyt8C/LlpxrF1YiEg2kaTt9mVAjCHgI
 AofhnuY6joPeOA6JwHH2p395l3UYXuThvvkK2B3IOEmnG6ERPOdvEe+AtcQHP8787GdE
 adxMn3YSh9F6WAhPIB+GucGijLCwkYOaCUHhHQru2XSM6Mh9AIhGKpPGqANylM6i7g8R
 a3rTUVeN465xivsPKCI2BAISt/fHB53encUvqv5ePX+nLZHq3xV7v6r1cg3WTXNxPdD9
 l+nTuq3QijFdOoKuvvIKnaElfRn0FjQ79wdJxhoZs9O2m1qD7ahvl0ED63K9SD9bgom0
 2Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417718; x=1692022518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEu4y95quZyOnfSNj/UQtZgzoOcsDey9aZLknEbvT3o=;
 b=O6LxeLHPpKFcIDttMEqYM+rFbP14t7hCY87LbCTeyQUez23F9hCmJErzRRQbNwqKH5
 JxlLDpXrBRC8i8/+H+W7fKmfvwwoH3/rJ8Ey99d9nH8r/uxg93Sc57SrzXxaHc+kHWCC
 IEiarWvW8/mBZeFnS4u8QSPkJIlzMWD6dm1Gp5TnXGS2RUr6F5kxUqstvxt2MyA0aPkK
 D3vfq4Iq2IYRg6ehL21C+kHgD22Raoh2FOcPkfymSRofRbxKp+F+tdZ6AxJZgOZxarrG
 kMjsCwEd+IBAx0U6DOW65v/lhDy3B5agF9N8cnEOiLgQcaIlR12ngenvmzqbeOiaFyCf
 /neQ==
X-Gm-Message-State: AOJu0YzrnXSmzVBIztBRLans8HNYwxXzQWiJbW/eqcAin5JESIHxoGqu
 ChV/15g0sz2qCMroHwbXPgWQUevOqppNNn1UFEE=
X-Received: by 2002:a05:600c:2213:b0:3fe:2b76:3d7 with SMTP id
 z19-20020a05600c221300b003fe2b7603d7mr7638091wml.10.1691417718272; 
 Mon, 07 Aug 2023 07:15:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] target/arm/ptw: Set s1ns bit in fault info more
 consistently
Date: Mon,  7 Aug 2023 15:15:02 +0100
Message-Id: <20230807141514.19075-4-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gc29e9mktAaK

The s1ns bit in ARMMMUFaultInfo is documented as "true if
we faulted on a non-secure IPA while in secure state". Both the
places which look at this bit only do so after having confirmed
that this is a stage 2 fault and we're dealing with Secure EL2,
which leaves the ptw.c code free to set the bit to any random
value in the other cases.

Instead of taking advantage of that freedom, consistently
make the bit be set to false for the "not a stage 2 fault
for Secure EL2" cases. This removes some cases where we
were using an 'is_secure' boolean and leaving the reader
guessing about whether that was the right thing for Realm
and Root cases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eb57ebd897b..67078ae3509 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -514,6 +514,17 @@ static ARMSecuritySpace S2_security_space(ARMSecuritySpace s1_space,
     }
 }
 
+static bool fault_s1ns(ARMSecuritySpace space, ARMMMUIdx s2_mmu_idx)
+{
+    /*
+     * For stage 2 faults in Secure EL22, S1NS indicates
+     * whether the faulting IPA is in the Secure or NonSecure
+     * IPA space. For all other kinds of fault, it is false.
+     */
+    return space == ARMSS_Secure && regime_is_stage2(s2_mmu_idx)
+        && s2_mmu_idx == ARMMMUIdx_Stage2_S;
+}
+
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
@@ -586,7 +597,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !is_secure;
+            fi->s1ns = fault_s1ns(ptw->in_space, s2_mmu_idx);
             return false;
         }
     }
@@ -602,7 +613,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
     fi->s2addr = addr;
     fi->stage2 = regime_is_stage2(s2_mmu_idx);
     fi->s1ptw = fi->stage2;
-    fi->s1ns = !is_secure;
+    fi->s1ns = fault_s1ns(ptw->in_space, s2_mmu_idx);
     return false;
 }
 
@@ -729,7 +740,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
             fi->s2addr = ptw->out_virt;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !ptw->in_secure;
+            fi->s1ns = fault_s1ns(ptw->in_space, ptw->in_ptw_idx);
             return 0;
         }
 
@@ -2030,7 +2041,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
     fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
-    fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
+    fi->s1ns = fault_s1ns(ptw->in_space, mmu_idx);
     return true;
 }
 
-- 
2.34.1

