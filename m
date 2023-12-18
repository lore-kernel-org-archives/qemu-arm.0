Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724874eji;
        Mon, 18 Dec 2023 03:38:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESd9sSv+l55BsDaYoCY/XzMUbpmWw9CkubMhd7oa5Eyan0GyahWW4j8A1Bw8ryD5fB53tC
X-Received: by 2002:ad4:5cab:0:b0:67f:135b:57e8 with SMTP id q11-20020ad45cab000000b0067f135b57e8mr8301232qvh.16.1702899527953;
        Mon, 18 Dec 2023 03:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899527; cv=none;
        d=google.com; s=arc-20160816;
        b=iVsHXzoGiEsoMdhY18U2zJLJDX+k+lOr+qWu7tzMMnuaXp4DygGOzgzvvPk6U4GSwC
         KdgUCkoIjUTdUc2uHmlwEdxub/bK9OFtjSsFlTH/GLXLIYqLa3OE/BbMvvOQbshGEP+Q
         UppQmJmuH8bvWnzjiKIbUkFk6eiIGV2K/++8488xWhbvD+CEnhz7qYnTBtAGkhh3Duo1
         ol9cTkbHe5ItDIj8eFP3jvZ+NRnWgaxxtg1kqaRWY3ASNpjO5boT+gHs+0isIHpUqHp5
         ZMwxiYy0PJjqCAmkPz1YwfHGkgEGAJRAhfB5pRz7qu/7NOMZLkgrzj4gT2yE6lRqNYf7
         Rj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FKQWnVGTfCUqUnya6YglJqR9o+KGIz1GEUxpR9ir3P8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=mrxzm6K3PX9NXQxNulSkIZa3654owDJ3+WtwoaJEgqP/KoYRCKFIR6VXc4f4I6uq8X
         xJ/lMIbbTiMrGTlDycB6mImPkQaWrMVkbFG/o5v+5tFCC9MI3yQm+DFuVnVziLQGE0Z/
         S3wfLVAOSo9dkICRhBk91agqnmJfoUEpHDqjODYNz2/rv2fEyj9l1bgMOCh5USn+A8H+
         B1Hn6Gyte31RoK3xJoS2yzYCOLUAU/ISByeCWvZ6mDK1jSQn2uO/FJXs4g6BB0F82iH1
         qx+jlFnh773Rf71BJH3Lr76ZoTzeRNXAZp7cYsgBfqLaYNGzRMS+BQ8J8EvvsXx2enc9
         IcrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yAa54sD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020a0cf588000000b0067f28152b99si5342641qvm.302.2023.12.18.03.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yAa54sD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsE-0006xO-FE; Mon, 18 Dec 2023 06:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsC-0006sq-LK
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:24 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs5-0003LG-GP
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:24 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso33998711fa.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899196; x=1703503996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FKQWnVGTfCUqUnya6YglJqR9o+KGIz1GEUxpR9ir3P8=;
 b=yAa54sD4mV/esqaB0EVo0XkRsHlH7MKK+GIquhlyRJoXN0ZEfVZnL+0p8OSahbrk4W
 euhpalCPIP1cHte6k0G6g+UwDg6IUYLL8C1/bR8WWYQRwYJ1ZoOFkepGKlBlIluGcOtF
 YMBLly98VV5veupRtbuYcqZYxmXfF4Jp8wHQOXSOwO2tqUyQelNWyiakaZxsWNuzXV/5
 7y7o3iEjGTKylsXwOfLl1d9uokwoVJgYslVAhIeHbDPIvh+MHnIgo9QW/NV61pzSyjyy
 CG4cM2n1V7AFYnPuuOLh4zeV0frVd4ayI+yI4fQ2Epvsr4kr2yG/mBWpDTHUDkVbGMmO
 649A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899196; x=1703503996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKQWnVGTfCUqUnya6YglJqR9o+KGIz1GEUxpR9ir3P8=;
 b=CkMQC2EATxIj+pTSemma3X4c3t2jzV0qLhMMqcLWKmS2VCEzuVHSX/9IDprUbQ8iFb
 pnJ4Iy7uBIuy5mDBZ4UPs3WGqLZgux4nH08xFOlaIYBhAfXVURYqBNME994mqT+rzIEN
 c4PC/lUSf2kpGJqKVcVOHr7zCNNYMIQTCiBcdcbHgN1i7BEWE6Ma8kH0sKyFX26qITVr
 ayLyD58Sa/hw/Di3tiKSFziPBKIOMne5IiP2MtEMY74Fxb+GL68uSdMoA5teKlLc5Jb+
 52nUZb0u1FConACVxjsiVdKazWg+bIWwTbUVEiEYx39LeX8rw7w6LJ/4SU8bV8ZPPthr
 pCbA==
X-Gm-Message-State: AOJu0YwQDK7MsNRNr8wUP8ZiFQ4PmGU8EWdLroxE9mx7obJv38AF4jhS
 Peo5Qin1bESbZFrKvy1+hZlh54VhC/C6oFcHzKY=
X-Received: by 2002:a05:6512:2210:b0:50b:f1b2:3881 with SMTP id
 h16-20020a056512221000b0050bf1b23881mr9102789lfu.8.1702899195822; 
 Mon, 18 Dec 2023 03:33:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/35] target/arm: Treat LDTR* and STTR* as LDR/STR when NV,
 NV1 is 1, 1
Date: Mon, 18 Dec 2023 11:32:49 +0000
Message-Id: <20231218113305.2511480-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: OlmGrreg0/HF

FEAT_NV requires (per I_JKLJK) that when HCR_EL2.{NV,NV1} is {1,1} the
unprivileged-access instructions LDTR, STTR etc behave as normal
loads and stores. Implement the check that handles this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/hflags.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index f33c0a12741..8f254bf9ccb 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -261,8 +261,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         switch (mmu_idx) {
         case ARMMMUIdx_E10_1:
         case ARMMMUIdx_E10_1_PAN:
-            /* TODO: ARMv8.3-NV */
-            DP_TBFLAG_A64(flags, UNPRIV, 1);
+            /* FEAT_NV: NV,NV1 == 1,1 means we don't do UNPRIV accesses */
+            if ((hcr & (HCR_NV | HCR_NV1)) != (HCR_NV | HCR_NV1)) {
+                DP_TBFLAG_A64(flags, UNPRIV, 1);
+            }
             break;
         case ARMMMUIdx_E20_2:
         case ARMMMUIdx_E20_2_PAN:
-- 
2.34.1

