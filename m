Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp646765ejn;
        Thu, 20 Oct 2022 15:44:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6A/hmAqzDtzVYqPCl/0Cpbdb3/NjFVtymJH0PkcfySGZHEuLIHebY4UZwN//aqLDemLalw
X-Received: by 2002:a05:6214:1c85:b0:4af:7393:3d91 with SMTP id ib5-20020a0562141c8500b004af73933d91mr13884638qvb.74.1666305849571;
        Thu, 20 Oct 2022 15:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305849; cv=none;
        d=google.com; s=arc-20160816;
        b=lJ1viTAhKpDZzEcrXbm3hwwK7KAkrR3jmBdKWxOsJm0SFAbLEI2/+v/PVQqFT1n88G
         A9vqubjg/5vxDqafmc+8sOQKgbyWjOT839g1ybFEYEte72pPH3uZOnqszSuFdPlyJHEJ
         QjHVzxuNuAPcPw/wtzk12Kk9NGwo4DUM6f1qCA8BA4NXBfc62tizep+4W2v4/7T0toap
         NgU5X9/KCv6rnAUwhGofJRFncpy86tC6r+AHXYCfbGrTI24seD53Mpi6F3MejhGXv4gE
         S62gAEPGiNgA60GO6tEMTzjcnclCKCXBOoCEDGEhlOcqAiyY7olZpD1e9gFpM8v/CJWn
         Knmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
        b=RsY9u95TZbGkhZaekPasKWgBBuDpT7fVeh7TFrDE2Kjc+/v0IgJu3MiH7F8DgSce2v
         EMGNNnqrIbmbyjsSVGphfofKo49VI9TbWeCeWNutqM9Evmsi9thdS8cwG5ZsoBfCGhW9
         l666PyZh73+z9A4HAXQyVvx4GKdMak38e6T+uPh9ULE9cu9CZDuBVbkfHm8zEISJtY4B
         u0rh3LVtOQLv/Ce+9RvQL6wrHPrxq6HZCzQCbZLQ1VADjh942wl1Z+HkMWCph7BvkkWc
         udtR7lK++T2VSUeWZUIbC4o+Kt5FvENHqjbnWjytYCXjSvxXuTDrzslODyI9XWkoyFuL
         gElg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lmicci69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a0562140c8c00b004b3cb5d9147si11197307qvr.94.2022.10.20.15.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lmicci69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleGm-0007PI-W2
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:44:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9i-0006b4-RL
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9X-0006J4-Mu
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9V-0000zg-DK
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id d10so862648pfh.6
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=Lmicci696IKMBvZgx93J+hVCqmL79oGx8gUoSuqD9GiOmb+XlY/b6MirgLdk079ec4
 o7M11FedTnKDIOCeDn35vIOa0aiuNYPsEgPUbK3gGwVKSRrzPb0ldgp3KkdEiV17r/HQ
 6ILqAIkWG4+vVZpxhgkLQkWy08oL06ANSCOhtywO77zy0+ZnBocAJb0U07KFhtJVlWMv
 wKqEKG4frpSubqcToPDzmNQeyCS24bS67u0qXOT6qgAb+iCzcjEVzgpF/pgu5OjtF/kL
 oyMMfoy3VXnDugcqxYfvL0jReopF5ltOaq0Hz5Dp8ep5WAzM/5AqGDNJ9xnrTo2osf1r
 y4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=32qzaoxRFElJRHLRvkO8mOIDiY1Ombq2ZtG20QzcVjPR2RKiAMKkuAV1/Yx+5lPaFG
 GHZJQdz9EBVRb7Opi42FEgx5bSilA76gVkH0kFhyKUiv8rMrO0qTsbQaBp5XaW6eY2xh
 tgmKQ3KCYcGt+tJ9TlCPm47mvJlczQbO7YPYcY/fwhfNkoS/b5IDg8efNvu4O4tDNxI3
 t8TXNicjNKyoEg/LCaGi5t7SgeWhqfayNPN2DVXnEUy+YTaIrkf/Rn1xSQPcfrjz/MlR
 QulL4eNiQ3I5nNSyDv4AsIOdyBKVutOAOCs3BkOjyYZoXCE1MzitA0JLij6WrQSu4IJE
 gLhg==
X-Gm-Message-State: ACrzQf253Ug3O2hi1nLRcaE9jm0Fi/HQoodhg+SS1LhGEI5rEp1+CxLp
 7vxlSb7rigKNLKy9TTgWVayOkA==
X-Received: by 2002:a62:144b:0:b0:562:38de:9a0e with SMTP id
 72-20020a62144b000000b0056238de9a0emr16192773pfu.78.1666305395559; 
 Thu, 20 Oct 2022 15:36:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/14] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Fri, 21 Oct 2022 08:35:37 +1000
Message-Id: <20221020223548.2310496-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Za7dhy4+ehy4

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c..0eeb4abe53 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1

