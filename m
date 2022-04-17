Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1285741lfk;
        Sun, 17 Apr 2022 11:49:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/jnitfv8eXp5dJZtgftPzt6zHR8jyPwN35lRi4UCkmSsNlCmkshdMsq6YUAPy53Be2aqP
X-Received: by 2002:ae9:e816:0:b0:69e:951b:8990 with SMTP id a22-20020ae9e816000000b0069e951b8990mr1488585qkg.560.1650221355851;
        Sun, 17 Apr 2022 11:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650221355; cv=none;
        d=google.com; s=arc-20160816;
        b=AwY2/21DngK6kTsgAV7Y74nnvbUiV/MRU9XHvUIpPs2mCJnlAWW3eL2xghON/Wf0o1
         ANmbOI1dvY7D2tC6/Awh6ZrkdhNx2oyuetHBKbiByapDf/JPB/MEzG9bLZDAzC1sUbaw
         WkpXG3ZNC/Wb9sqY92b5l23enHi2dz6GweTfshkNIZ5Jh8PpH8Wr49g1jqdjhTlTxo47
         aHB0TXheyPKFKpuhR+0nHe2SOQGoaztXesrnToyohun2BzujEzRAu7Vs7dTG9+vJF/YV
         H27Te9kzZb7/vLo0e1w9P8AJPAWf/eomQpnvN23p0AH+N8WOmvy2a6zmYTKQ6EfVc5xg
         /xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DoRumaxtRe3qsin4W3djn/6A+2lT9q58rZZ6KjoMUec=;
        b=1AsXAdTwxLqhSYYAWcPmBVnqiw+wkhfYGKQjDTMUdvqxWYFajg3J83OwRhaXfafZ98
         JsmyK2tHYVHPmQCn68T4c7aqXDGcuaJeU+ryOQe28ma3cMg+LUR90nNL9t3frRwa4i3o
         +wqK1mE2AiZBlb/ATPJXD7KHe1/IJgJBRuJxJboRFlwcH9Se3pFY2rSo70l4VPBBr6tG
         0MjGImDCMp9YFS7vf87IWdypXVYAWbDxfXDqiVUws4SPiTQQqgvc7qGXKRYAAvBJagf7
         wlwS/VCxaXmR2GDXMYSJs1wX/tDhYD2kvKNbVTgXUjw7TFrTtItEWjdSRzs5RVTAP7AY
         fjHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmlC4sOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a056214202f00b004460e90759csi2427420qvf.343.2022.04.17.11.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmlC4sOq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9xT-0001lp-Bc
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90V-0004iv-Tn
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90U-00045v-5c
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id s14so10741928plk.8
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoRumaxtRe3qsin4W3djn/6A+2lT9q58rZZ6KjoMUec=;
 b=jmlC4sOqvOtfOzkh6swWRWx8MeweAKGvhFO4hOjhRwDyYr4nlxBTYFGudoMQyO6zCQ
 GjRIxl5kH+SNWL4B2fPPgh0Z8JGwCL9PdjbFy5evEOL4ByzNH1Yx2T1DFdsJlqVwpKVR
 UfhcTMs1HZ6MWJ8jT0xNL5D8uKv+FK7f2VbZwUmVmrv4kmIa4/7kB3GwlVRFaGccgcQW
 4M4zU9xZwkS8yMB4sQ/QgAnhGSl6e7gqF+cnhj3Rbp2Wb3juuJJxtar1SkhBAEbkgdyM
 1M3azCIR4m0x8Uz3tDYyvoFRXWVBF/MXEZD53ljpPK9xahQNrHLsp/hT+W/LsRRnkj1O
 wlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoRumaxtRe3qsin4W3djn/6A+2lT9q58rZZ6KjoMUec=;
 b=OKqugLT83EITnZJJnrmf42vHzCe4rjWftsEy7ipZ0VqS4p078WTxqhZV6hSrmOgY/R
 DfbA4uZScwKp6fTiZ5h7W9d2z0ITid363uc1s9fcLEgBX/E1Hj7jD5upQ6NEpT9lK2yY
 JsqueN/OBn158GaXAirUfbi508j3nDnq32XlSinYr9uAgC8KW708dAx2uCx7yyZLB/xm
 eiIZua4MMOiD26RGx8aL+AZOBOV3OQhOca4E9ACdeoXe5iBi6znXruQm/zXR2qyyJMP+
 ViobLMOS6FVG02ZvHDdD25UnC0J77dQnARjVCVROOMKR3R+01Onlyj7A6cxDpcGT2++b
 p7dA==
X-Gm-Message-State: AOAM530Dw2EG+F6o8aF1UhrZzvxEP5AyCUMBFIbR729TSGOyTUBuFbVM
 krZm5nvvO2+1BZtURXB76Tj1LKpboN4qJg==
X-Received: by 2002:a17:90b:3806:b0:1d2:6e95:f5cc with SMTP id
 mq6-20020a17090b380600b001d26e95f5ccmr6507650pjb.23.1650217696971; 
 Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 54/60] target/arm: Enable FEAT_IESB for -cpu max
Date: Sun, 17 Apr 2022 10:44:20 -0700
Message-Id: <20220417174426.711829-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ztqS/ZVw5ynt

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 35b6f7d4de..ebd9e418cc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 72fe7885f0..03fbb34e4e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1

