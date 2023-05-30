Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2391462ejb;
        Tue, 30 May 2023 12:16:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XMLq9/iTn7+ygpNqZNAOzrEEqQ4j0pwUkEMB52vllWAZjW4gNcQUj+KKLOXFUaIbgNymE
X-Received: by 2002:a37:389:0:b0:75b:23a0:d9c4 with SMTP id 131-20020a370389000000b0075b23a0d9c4mr2987435qkd.26.1685474217510;
        Tue, 30 May 2023 12:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474217; cv=none;
        d=google.com; s=arc-20160816;
        b=kGA2224vcT9qGlrZKcNr2uPlcD+rejTe5sp9TrPKgeP3zcCay2eOKJiYVziPI8sqyn
         GfSVSWTm0jEs8yCf9Gxy/eFythDW7amuEXCEXnIlBS0TIEYVW28NDWLlNsxPe7EyZRlO
         oTDSq6QH6qNZ2CkcRgaX213OggLjvEvmN4MoiRnrfNqqiFTcmqHc7dmwUbM2o6ljfAys
         HRT6lv0oGGHWqmR+2hvvfUXAgKOf+o3dlHXYed9cjsh69FlPObmYfvqlPcmxte1PYuqk
         ijxIcnLTGHTa4mJi0aJc+/x6QEmSoTcDA1zoNbQV52CBvRW848egqL8lmC4t7ierXl/8
         DNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9dWxpkriL89hdVCzkPxCT8S4I2dcQ51ihNaTFHcE9jo=;
        b=DfGyIElTPBM99whgBANbXpjSlJW3vELQSkSroQdKkT02MygjETvQvbDCMxNxDGdP8I
         xSAavM5UXUBioftjeh9FSzxfEYZkPMWSqp4OC92U2Gx+Nt6zwJDog9HrLqD2SpFRNAE5
         r7/ecgEzZrZAHz0oK8ERtcE0pHhDO9eFqU4SaLVOXugFoYfTCBYJwg4I/ZaV0jo7etkH
         EFQBNsbyOe5WwXfDq2jJzHD7QsKArjeGHoaBhpUQztN0zFpXlXhWIO6gJjJYu7oRp7mQ
         9/iMaSum101HQNrNobtl1AyaPnDHqv2c0lHt0QRO+DEiFKNSEsJMGSNOp1tdp5EkHL96
         JzdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sDcRGaj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a37e30d000000b0075cc6319b7asi5588459qki.447.2023.05.30.12.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sDcRGaj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44oF-0007IW-Uk; Tue, 30 May 2023 15:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o9-00078k-5d
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:15:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o4-0004hM-Oo
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:15:00 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-256712d65ceso1825564a91.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474096; x=1688066096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dWxpkriL89hdVCzkPxCT8S4I2dcQ51ihNaTFHcE9jo=;
 b=sDcRGaj/6M7xFwRlS2r9a9WUSpMqse5F4KGwfJqi/AN/R+PS/rckiyo+h85RpOP4Fu
 a+zGbgSDeCmjpGOTB0w0tTuFlQ7sw8JqaquD5QBFdKGaacEpyqlJXZws3fW6AUcgbq/n
 vqRhcnaCfQgTanqinRw6ek8C/BseCrz+GcJMiJGpjZVbs4FTctU3HVGW0jcejX4Hv5/U
 pvPDwyEQK9+wCswTPOoPOkh4DCSgrRrgpIfSWSZu8oIucdm65PZ/PsmlHaayWHWgnpR6
 2PiRmqvBIAz52vS2WyeERPwqUvOSEdvf9GSnRZ+OTmtA3pVeQp2RwdgoxX21wk3U6qgM
 pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474096; x=1688066096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dWxpkriL89hdVCzkPxCT8S4I2dcQ51ihNaTFHcE9jo=;
 b=RKLFNDKoeGKRFKjuipyGj63IvSLJDjK3lxqll3zFX+qauDnOVhxVBh1ATrVI+/M7MB
 9GDVT7wNrEwqBwFOlkRUYHHxp6agOgBm4ADPwRwpH7mt7yNXCsA6ZLRic6ow020zUF8o
 alvv6YPotczm0IwwcNi7oembL1XJWd7yg+7m1ZMh8Y+RicwnzGccSp5U1KpWyhE8aNzR
 DJyyor1Ij5qyKJrVaSCrncJKY3lpkVIIPn6O3sJYBQche6Qh/SSwCYUvbG8KCHgSVyLU
 Tom0QyRTwwgIcKXsMBegSBVb1UyBmst3DtKub6JVMKh6YJ6D6sMQt5Hiqn/2gESKpF7i
 NRvw==
X-Gm-Message-State: AC+VfDymoezyOMuCmAKOjH42JQIBVQ2ptjViYJfYlH7PIcVuiWvZjEnN
 WVP8YH8b26tamONGBRs3cJiDow==
X-Received: by 2002:a17:90a:540b:b0:255:d1b1:a8f3 with SMTP id
 z11-20020a17090a540b00b00255d1b1a8f3mr3558347pjh.26.1685474096043; 
 Tue, 30 May 2023 12:14:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/20] target/arm: Enable FEAT_LSE2 for -cpu max
Date: Tue, 30 May 2023 12:14:38 -0700
Message-Id: <20230530191438.411344-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q1IOoRLCEhF6

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 7338987875..ecbbd63adf 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -50,6 +50,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 886674a443..2976f94ae4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -644,6 +644,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1

