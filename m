Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp476163lfu;
        Sat, 30 Apr 2022 23:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE/IvAzmUacytQmn7azLnQoiRYKmRPeuYODvy1k2Mbc5BMkpohPFXJ4gQbSeibcnX89Iv/
X-Received: by 2002:a37:9144:0:b0:69f:789b:7581 with SMTP id t65-20020a379144000000b0069f789b7581mr4858625qkd.773.1651386329419;
        Sat, 30 Apr 2022 23:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651386329; cv=none;
        d=google.com; s=arc-20160816;
        b=cMH0JC9bzBkpLh+Pq6NaIGvIF2DlMmxt7r9nFY0O2OT6JTnrVDP4PKENMMkB1J0RJT
         q5pQTKuwgDFWlojrru9eBx9u0Y3I2SCodosI/BibImUEKKK7npwVVgjUbYi6TW6uSZ0u
         16U1goHKfu4uIm+fR+f/Bd9orEDstB7DF0i69Frg8Rd+KzI8Pp5AkumqhVMIapABLa+I
         8lKtULLKQT2Q3Hwlr6RtPUutSZTmJUDVRJHjovEsJDpq3b5tI4c6v23Qtm/80WmJ7aWH
         ufSSQrZE02VlGQuP/2QRyvqKcJ02wxZ0TZwqogQAckUEhpxQblXiCmI5HorGT0KnqE+x
         u8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LoFkNZI0EPN3UHmsZdxsDTn+j+LzMoee7yMTRcYWMTM=;
        b=O9ZcncIyXBVxLrSnDu5WmzOVUzXftbhxO30bQ8+SCU9Px214MMOxPj8n3LFYE4+NeI
         8lQ867sjpMPkKqAbKauR2seD4+IAFxF+jSFQ9qypPJ+xmJc1dLN4L0nW8hHEMiN0AAFk
         9U6DGYkNLS8e3hVAIfr4l/1Y71Ox/J+I9GoLnCuzxtD/51KKViGdoxCL60e8XSiEs1SN
         aTnYSB0DwFvSTEmVEdSzZxr7RFo93Q2leLEKFmEq+sAYtCq6EHDk8knNHy1CxB0SSs1b
         MAKnGsaOP92LkNZZzVFA3PdvZUzkCh7HzhooRTbQyC8Ibl+/rjdVOefSQe6SzalWAGBk
         SquQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JXF4y4NS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85ac9000000b002f3a0c08689si1068428qtd.541.2022.04.30.23.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JXF4y4NS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl31M-0006UH-Tq
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U5-00071r-RL
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U1-0001NH-Br
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id c11so32439plg.13
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LoFkNZI0EPN3UHmsZdxsDTn+j+LzMoee7yMTRcYWMTM=;
 b=JXF4y4NSINpr1sepl2M9ZPwPVaPLbNDyacnsWZjWlkmmQCNQ7tbyG+bt7JRrN15THj
 XrnWCkHFE0HQsfnFYLw0XjcRXw1r343JZSabBam98PuNCfWtnRxuumyCVZbDdLK3e2t3
 NDTvafGLPBGwjwAG0t3p+BZJEbKZj5SeXq5/VJ3AODGyQKgV09Xl5EECQdh2f3sse2Hx
 ROKUfBh7KUHr67e3gPdiixfCCH09MYuTnhfk9a+2pZvI1OPMEB+p/rjrxpXQpDN1KsR+
 luBDUXh+xuCo7OKNj0356y9sIzC4ansxOVvPXwbiWZKJCj6hvMCoph0+qZ2w4wDrtAVt
 +Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LoFkNZI0EPN3UHmsZdxsDTn+j+LzMoee7yMTRcYWMTM=;
 b=ft+SYnHJ6N7arxLDHKe9cddySbpEsJ3Ug9vPozt7fx6XPNL7S1ZBwUDQqINb8Y75Fj
 Hv6K2UqEtwZCkEItm1uI0+gaQoeQpK92By3fsDl47jYeavwjz4H2frpeo3O61rdDWH5Q
 sY2g5LN5L22zaLTrotEyuqN4yYlNRExE1xbej9pnyDnHMU2G0sjoH1Ti32TC68y/ReIJ
 RbUflXDdWb++cTEMJxdbq1dZrzxbTBnWuwcxv7bMSu7qb0G1lKr15UWPAZj1nFEdJUef
 7NyvRdvOxYGhiS6ELdd5bZ7FGl4zCKWE6QYnVP9Q4wrt+Kc7G4pVBkDgIGS1BkZjLFg3
 DVaw==
X-Gm-Message-State: AOAM531EtvI8sgBvX13P4UwQkuAkg8IUtfbSngW1BEtnFb+34+oMkJZd
 ixtUjOwEjk4TK1D8XmKKsuzSZd8p5DH8fQ==
X-Received: by 2002:a17:90b:688:b0:1d9:9ddd:1f71 with SMTP id
 m8-20020a17090b068800b001d99ddd1f71mr11918311pjz.207.1651384259960; 
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/45] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Sat, 30 Apr 2022 22:50:13 -0700
Message-Id: <20220501055028.646596-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f91rqvGjAvz+

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu.c              | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c3bd0676a8..965f35d8c9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BTI (Branch Target Identification)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
+- FEAT_Debugv8p2 (Debug changes for v8.2)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b509bbd2a..97b6f9f68c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1804,6 +1804,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5fce40a6bc..202fd5c46e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -799,6 +799,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bc8f9d0edf..b6fc3752f2 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -76,6 +76,8 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.34.1

