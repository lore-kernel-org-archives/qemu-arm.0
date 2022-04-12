Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2013729lfq;
        Mon, 11 Apr 2022 17:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9TrVPn3ELGCHtHGmrGo591PPsxCGSNRLS/RQdLpNNxUHBS2FxYF6+OxureQ8f2hRRcewJ
X-Received: by 2002:a0d:f487:0:b0:2eb:54f5:3abf with SMTP id d129-20020a0df487000000b002eb54f53abfmr28914557ywf.141.1649724971807;
        Mon, 11 Apr 2022 17:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724971; cv=none;
        d=google.com; s=arc-20160816;
        b=0IueNaHZVPO8hZNyJUpuV+++fgsg77ROTUOewOymRkas0hi1h/yoZVNo/YZ1qgMHff
         JlpCf0r0F7Hv9MCOOATk9O0QSZu25DAPzn0FWUJGoFttnjFpH4alk067BP7hK8Z1Hvk/
         liekK9eQDebg9URIDXfiLnOWeS7aN36gOpM3rTo3pnOPYLYsSJLzc7bAOGOe0SiMoedH
         mjgoT78+xKCBH1DuC/M6Va4+oWd8uOdtlLnzTGEtY3k/20/rZjfY6331rpLbdQZnEr5O
         YSete2j+xAb76b8JbD426R+ZqdYTAUEsF+TzqMKo7vzWv1QG8QPMoVBTahg+xz5y7hAh
         Tjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YGfVz/mtd/7TyEjQ5MUVLAJWvuqAaTmixj5X4q+cSZw=;
        b=rgQpMoN0/m+rdIrLPb6HBxQHdJyAf3Ijq944pD/IVHOH3MttR4zDpTa1HQeIDR5u8/
         /wk7xoFBTBwg/sBA+vXmvnsgcNsl99s3aIgHgw5EqQfssH9fzBecZmb3kV0UbXkOdEys
         Yk9VTJSsinVjD6MeKNKPvJwgehb+yOqT6mrmpGuA9YApJoYnzQNuOmj9fwHBC1KvZZDP
         7LUZjIosDGV+QkyBMWcMZlTE+xXKev/jEurYkEbSva+wbftzj5oEyP5AlEObyuROCQdD
         gtVLzPATCqEvVlXITH8oWE9VLkobdlQ8/gyOrBWui56nhw13eF1obgrGbr3G7XGUGe2w
         pacA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cncMBZNv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 138-20020a250b90000000b00633dfba30fesi5122588ybl.521.2022.04.11.17.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cncMBZNv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4pH-0002Lc-6v
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Th-0001xl-F2
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Te-0001tG-Hx
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id 2so16791761pjw.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGfVz/mtd/7TyEjQ5MUVLAJWvuqAaTmixj5X4q+cSZw=;
 b=cncMBZNvZgstyTU2HLsZBc55Pi7sFE9kREpXjCAjwmgPKdcduh+OUtsGgL1N5dC/YB
 eI6H0vP0MYabYeuUVYffDJTPg83sn3KwRpIq3Y0MSD+DOURG0YSRMgwtzBway9tv0J/y
 Dv7w0xyhNExiAd3uI1a5JxqEgrFc5J5kXDIhRmjX3QtFtEZYepNNmRGuJ3BniBmw3dEp
 pDO+9iglHhG5meyv9caEivIpz1kTfVZL6wEnchkYEVHdV/A8ByagzUgtdbO5C7yP59d3
 SUM16FALn6/rB1Vxyt3TmDiqv9neefw/zFXBQ6A7rj3ZockbwF2HyGJ90wymkxBfsB5n
 VfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGfVz/mtd/7TyEjQ5MUVLAJWvuqAaTmixj5X4q+cSZw=;
 b=nRLiseUmmghZfATyBX+hTiO4AaZdQ0VSwH1ZJe35aPKBkrnaPZ5//G2mM6jnvE3XUs
 9HaIKeLB0xfJgRsaz/8AmjB4eJVuMwgsMGteNZuus/o/v0V10itHFGvwildwDvQelAQ/
 i5AwVp8cxYkErRCorGQvRpUSXMw2Q18xC88aFJq2GihiAxk7zz5y/rSjOorqK+x2hqYM
 5SHqc0iOLwntmDoOrXQItqC6uRpwrxhs7SurBCPeG8q1mM0xHY3+jksNe2/SONhfa7K8
 GkbVGVxDFrMyo1fCLUd5HQS1YpRcjMa1gsObUXoOoylDbK9JSp9xcL1xmnPyHoMXDS5Z
 +kDw==
X-Gm-Message-State: AOAM532pFA0yxNit0sfccJdYDYea+r3imvNYBk27CmjfwC7Kf44cz0rG
 qsBscoedKNBb2+WCtnmxn37rfTXY4aoqdw==
X-Received: by 2002:a17:902:c94c:b0:154:45c6:fbea with SMTP id
 i12-20020a170902c94c00b0015445c6fbeamr35243771pla.117.1649723625210; 
 Mon, 11 Apr 2022 17:33:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] target/arm: Update ISAR fields for ARMv8.8
Date: Mon, 11 Apr 2022 17:33:21 -0700
Message-Id: <20220412003326.588530-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5uvwVIM3tqa

Update isar fields per ARM DDI0487 H.a.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add ID_AA64DFR0.HPMN0
---
 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7ca2463e17..6793336b5e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1940,6 +1940,7 @@ FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
 FIELD(ID_MMFR5, ETS, 0, 4)
+FIELD(ID_MMFR5, NTLBPA, 4, 4)
 
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
@@ -1992,6 +1993,16 @@ FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
 FIELD(ID_AA64ISAR1, BF16, 44, 4)
 FIELD(ID_AA64ISAR1, DGH, 48, 4)
 FIELD(ID_AA64ISAR1, I8MM, 52, 4)
+FIELD(ID_AA64ISAR1, XS, 56, 4)
+FIELD(ID_AA64ISAR1, LS64, 60, 4)
+
+FIELD(ID_AA64ISAR2, WFXT, 0, 4)
+FIELD(ID_AA64ISAR2, RPRES, 4, 4)
+FIELD(ID_AA64ISAR2, GPA3, 8, 4)
+FIELD(ID_AA64ISAR2, APA3, 12, 4)
+FIELD(ID_AA64ISAR2, MOPS, 16, 4)
+FIELD(ID_AA64ISAR2, BC, 20, 4)
+FIELD(ID_AA64ISAR2, PAC_FRAC, 24, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -2014,6 +2025,10 @@ FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
+FIELD(ID_AA64PFR1, SME, 24, 4)
+FIELD(ID_AA64PFR1, RNDR_TRAP, 28, 4)
+FIELD(ID_AA64PFR1, CSV2_FRAC, 32, 4)
+FIELD(ID_AA64PFR1, NMI, 36, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -2040,6 +2055,11 @@ FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
 FIELD(ID_AA64MMFR1, TWED, 32, 4)
 FIELD(ID_AA64MMFR1, ETS, 36, 4)
+FIELD(ID_AA64MMFR1, HCX, 40, 4)
+FIELD(ID_AA64MMFR1, AFP, 44, 4)
+FIELD(ID_AA64MMFR1, NTLBPA, 48, 4)
+FIELD(ID_AA64MMFR1, TIDCP1, 52, 4)
+FIELD(ID_AA64MMFR1, CMOW, 56, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -2066,7 +2086,10 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, TRACEBUFFER, 44, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
+FIELD(ID_AA64DFR0, BRBE, 52, 4)
+FIELD(ID_AA64DFR0, HPMN0, 60, 4)
 
 FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
 FIELD(ID_AA64ZFR0, AES, 4, 4)
@@ -2088,6 +2111,7 @@ FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
 FIELD(ID_DFR1, MTPMU, 0, 4)
+FIELD(ID_DFR1, HPMN0, 4, 4)
 
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
-- 
2.25.1

