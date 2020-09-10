Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1514670lfq;
        Thu, 10 Sep 2020 10:39:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo4cFo9yDY2kDHIrXj+hLE8EpJ4a7Spa06r6W17X1C/Ap5CjZod9yYOaieLjBhZr7r/kb+
X-Received: by 2002:a05:6902:6cd:: with SMTP id m13mr14508350ybt.19.1599759576563;
        Thu, 10 Sep 2020 10:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599759576; cv=none;
        d=google.com; s=arc-20160816;
        b=Yiv/U3z3jIqTIHOxnMuPgOorlETnBPTY7u9V4BvUsIpYdftIrBi+hf04PzR1dYY3KX
         RC+PRjWKHTCC5RRKHW3r1F7dcKpkLI3YA+ZTtKIn7EB0l3a10foMlkuyEup3vvfeCLAF
         LQOrHJ8TFQNDcuVCQA2kxmUjp6fN9nTToWJaNe5XdaSyveB/fXGgHEJtmtM3gHHd8h5Q
         jiRSxp+SsGQMN7KkK2J5zKCg2blJ3Otyv07a1P/ygiPQq6nfMF64572mZuesMgc12lPX
         w8JwcUCjrGRE1SduVWiiw5C2ewFttFO7KjmZm5Q+dYMAiWHjOQit4Jl1tU5DUbpa4piE
         99TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QeNzMtOZTYV0IOHCApAJqADotFnerf/bH2WL1EVEpCU=;
        b=UNPrnlb1WTF130m3fk6Ra4OeJM6e5JeC5zgHCqELuo+Cb+VcpEz711MYkmVFlNILIo
         2mwwrblCaj8EDDGgyKoK+CNHCi9E6RSKOc01mxNMCq4D8gKGbYcxc1NuQrzfR9NNnUO8
         fPxO0owkMJBms32AReaoyv2bGghSwbY7TWdMnhRpQdupNvzsPGLcSJBXkYX1zpK//kqb
         2lHG7fcCWH/L8D8HeXulRBPb2d3fntEwLH3LgrQFkb1B5e5WjBS8sdb6Cv9yHlqO9gLC
         4DJ3cPkVOz8EmawyDwL57JBBYi//N3NokRtI1Eb9osVsaaCqe/xeUwLRpUm3vlbkAH52
         fFqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0qLfelh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si5571254ybk.180.2020.09.10.10.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0qLfelh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQXn-0004cR-Sm
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXO-0003xk-BO
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:10 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXL-0002o7-Fz
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id k15so7696114wrn.10
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QeNzMtOZTYV0IOHCApAJqADotFnerf/bH2WL1EVEpCU=;
 b=V0qLfelhP5Exlq4MjriXLd7sYqS2X3wd9wHutRBM9NAMnn12UFgREvmSOg6XH1E9xq
 bPLqclF3Ebaaht24FU6/8+gOHefrQ6H5Gi99nMe56O1L7htcY/9FPx9SDzyyXeomomao
 Yea4bzVTkwLa80apZ3benSWXVS8PbytQ5ERffXMGFaVjaTcj8rGqUFMs0J7D5QZ6J182
 DftvUocP2SYa6YXJXwan+XjTh6ZutF7cykObhgR+Z/KsjIDKQowSfGh9zNwX/tSnpcV6
 tAWzH0v17X70eRuzY4LigPNduLaPyki1WdK2fYRqnzXVht683q6NWt+zUdLxp5kdWWW2
 yGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QeNzMtOZTYV0IOHCApAJqADotFnerf/bH2WL1EVEpCU=;
 b=KgdQFMGpCs/neIToiRR005ZT0Q7VuBWqsCCvkWxK8JW0apPmUcHm8K2tWyXm87hcwy
 m5xJtLYoNB50hKJBuBRhq1itTbHHeutDpJIv5afFAiKpq9eNJlnac/1NxXSU1N6MFYko
 hWHWWI4J9aK12Ag2wvEFXj4eqNrBuchoACZ96URNB7NVxMRTMbaJub7JgI5FORMkhf8d
 H9d4Dm1xcQUFqbfSwekBX2vv5McJAnhI+bLB9ngrPyXSi06/br4W6DGi8s7Y3EtJiAVz
 5Ed8fiHe95N1rhKIZgaU27cfoM35WcFq4VncSIamrDA5hFpB9Ky68hvvFrwONMWxZ1aQ
 wx0Q==
X-Gm-Message-State: AOAM533ECFtj61ZAuRgmmYM9LpIbPKpNex1S0xWiw06Y1A8yep4fV6yJ
 +CWxistVvXpY5GCKIvtP66hIVCV2FA1C6LLY
X-Received: by 2002:adf:dd0b:: with SMTP id a11mr10016798wrm.422.1599759545755; 
 Thu, 10 Sep 2020 10:39:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q186sm4603128wma.45.2020.09.10.10.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:39:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm: Add ID register values for Cortex-M0
Date: Thu, 10 Sep 2020 18:38:54 +0100
Message-Id: <20200910173855.4068-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910173855.4068-1-peter.maydell@linaro.org>
References: <20200910173855.4068-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: i0gszsUzINA9

Give the Cortex-M0 ID register values corresponding to its
implemented behaviour.  These will not be guest-visible but will be
used to govern the behaviour of QEMU's emulation.  We use the same
values that the Cortex-M3 does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index a9b7cf52550..0013e25412f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -256,6 +256,30 @@ static void cortex_m0_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_M);
 
     cpu->midr = 0x410cc200;
+
+    /*
+     * These ID register values are not guest visible, because
+     * we do not implement the Main Extension. They must be set
+     * to values corresponding to the Cortex-M0's implemented
+     * features, because QEMU generally controls its emulation
+     * by looking at ID register fields. We use the same values as
+     * for the M3.
+     */
+    cpu->isar.id_pfr0 = 0x00000030;
+    cpu->isar.id_pfr1 = 0x00000200;
+    cpu->isar.id_dfr0 = 0x00100000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00000030;
+    cpu->isar.id_mmfr1 = 0x00000000;
+    cpu->isar.id_mmfr2 = 0x00000000;
+    cpu->isar.id_mmfr3 = 0x00000000;
+    cpu->isar.id_isar0 = 0x01141110;
+    cpu->isar.id_isar1 = 0x02111000;
+    cpu->isar.id_isar2 = 0x21112231;
+    cpu->isar.id_isar3 = 0x01111110;
+    cpu->isar.id_isar4 = 0x01310102;
+    cpu->isar.id_isar5 = 0x00000000;
+    cpu->isar.id_isar6 = 0x00000000;
 }
 
 static void cortex_m3_initfn(Object *obj)
-- 
2.20.1

