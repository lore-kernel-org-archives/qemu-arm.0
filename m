Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722596eji;
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfjf2zUeXA3JqzmEXN9ND3S/VjEPvUBPEeOUizcEwcv/CGUFbcrQReLJF3bApFuiV7gea7
X-Received: by 2002:a05:6214:21a1:b0:67a:9b28:b4cc with SMTP id t1-20020a05621421a100b0067a9b28b4ccmr21857674qvc.31.1702899247043;
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899247; cv=none;
        d=google.com; s=arc-20160816;
        b=JBD2u943ii1qhWj9CWHVzcCkAwFHbRcxpjdY5MX3ZI+HiEnccuouFXhPw2GYBhZuMZ
         0DPMuwGf1ClsC8ejCXrkxtln8GdikIZ80PYegX8fq4Ge09o/W1cz8C6w8vloR81e3aVr
         O8/6UhH3BPN132rDHxMCGu78e3XtGkOgoAYRvDBiMCEaLhA24/zHkgOvv1LMf+HQ1iCE
         pAIcE/rp8ZKxo71QDyBfshsvoV6iqs2JHOSJAK7yvxffmt//0A64LDqmpxOPUiIXb9tc
         JZNVLFHQnV9b/AqWI+cw9dNXrMcnzIuCkO71nQyy7vW7XZ9Ss4f5cxlKNc1Zz2UbV+17
         lQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lyw7hmYvfBAXpzd5WD7qyMRqQcXNy82umQs3WP8yG8E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=IB+kUDqmfQn4K4Cyrv0GmgwS0HgKOZPf3eLsB/2LvCVtcbgHuszvF4cI7+Bfi0XIx/
         DFnhhvgxy2jsT9itnCJaisSbYN/WOJoa/4DotDjaufE42LXrxEYf3izzxSTPA2sENHkH
         GK/WhgEVft62157l9ubYXOrf17Cr0wGZy/OoQvWBSgj7mWsxsNJ5SSelTe7kQ4UTwB3h
         NhGrnbDTr5BdXfLnFiDUMeoUo8FBd6QsfLLq3uN/cXYkv1xwdGTzZzGly9E8jJuy8pVA
         HSUTSufxnotPT0dSYLtjBMFehiYq7EF0NEyMOiyUGrygQEtCR9BfKttrN0ROYcj8JWir
         jwvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp7W+1Ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a0cf14a000000b0067f2c592fffsi4788149qvl.307.2023.12.18.03.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp7W+1Ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBs0-0006WY-Pn; Mon, 18 Dec 2023 06:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBrz-0006Vz-Vx
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBrx-0003H7-L3
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so2674285f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899188; x=1703503988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lyw7hmYvfBAXpzd5WD7qyMRqQcXNy82umQs3WP8yG8E=;
 b=Qp7W+1Ix6hRVgAink4bdpuBVLo6iIuHxSVu0ab6AItvUAzlAO0aaPWy9Zp0PvD07zj
 SQgBtgE/72ww03OGu73qRi0j5//7mcgRL5nvPzdvKZ3ENHgPQQW3wm3JFrHaTMeN81i7
 8cgSS7/ir9Jln1AbDbaQjOBcVaTr7Ek/rTK4GOp9dfxKDLiTP+IGtA3vC+LYCtSkpP+x
 +8r56bnuYvnuMqyrnJTsuBYSTCe0vP2/S2I0gXVGSuMENZN66ibi9RcOwmQSM85SqbHf
 U0iHvCMYwG8x+sXCtDmbS00l3EaiJ/oOBYzSVCkB0WBz1J2ZL9HZPtrUg6AmS98h5zHT
 F2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899188; x=1703503988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyw7hmYvfBAXpzd5WD7qyMRqQcXNy82umQs3WP8yG8E=;
 b=b9rGqhC8awHQYA5uHaus0IKQdCqGRU4tWPM6JzeDGeK6VhUhlc0vAihMBxAyjI2R/1
 fjOXqzoC7kD6vjLKl7pNjE7x3zbpKnsh52aIS4L9YgcOWq6aBu7xnOKZxsAU71V/AfTi
 E8XSQvTUfDGqbQ1YFaJybZUPWX5u5hD7TFZBY4J8l2hlxNCs636Ot5CRTnd1ISZe4Oxk
 PMgIznXciU1kWeNL4PyY842aBi6eohPxUNQEH+KrKYGjRhT/8aR1i67j3+Wv3ew6WSO3
 dl8m13VLmmFtf18LAhMNi9sOty8jXWOXvqScjXOCQ3y+/lRSQjkeEQ31v6GlejHsQ+pA
 xODw==
X-Gm-Message-State: AOJu0Yxi0VW4MSkDes2rrXR8E3qnkERllV88Mu9tMI0hUPjxJq61DNLC
 7SksxzlRTUCS8sT80auKezdHqqbw1LOB13UFC7w=
X-Received: by 2002:a05:600c:1c93:b0:40b:5e59:e9f8 with SMTP id
 k19-20020a05600c1c9300b0040b5e59e9f8mr7900441wms.151.1702899187687; 
 Mon, 18 Dec 2023 03:33:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/35] target/arm: Set CTR_EL0.{IDC,DIC} for the 'max' CPU
Date: Mon, 18 Dec 2023 11:32:32 +0000
Message-Id: <20231218113305.2511480-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: +LN1SEXlRas6

The CTR_EL0 register has some bits which allow the implementation to
tell the guest that it does not need to do cache maintenance for
data-to-instruction coherence and instruction-to-data coherence.
QEMU doesn't emulate caches and so our cache maintenance insns are
all NOPs.

We already have some models of specific CPUs where we set these bits
(e.g.  the Neoverse V1), but the 'max' CPU still uses the settings it
inherits from Cortex-A57.  Set the bits for 'max' as well, so the
guest doesn't need to do unnecessary work.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is worthwhile anyway; it also works around what Marc Z
and I think is a KVM bug where booting the L2 guest hangs
if L0 thinks it needs to do cache maintenance ops, when
running all this under QEMU's FEAT_NV/FEAT_NV2 emulation.
---
 target/arm/tcg/cpu64.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fcda99e1583..40e7a45166f 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1105,6 +1105,16 @@ void aarch64_max_tcg_initfn(Object *obj)
     u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
     cpu->clidr = u;
 
+    /*
+     * Set CTR_EL0.DIC and IDC to tell the guest it doesnt' need to
+     * do any cache maintenance for data-to-instruction or
+     * instruction-to-guest coherence. (Our cache ops are nops.)
+     */
+    t = cpu->ctr;
+    t = FIELD_DP64(t, CTR_EL0, IDC, 1);
+    t = FIELD_DP64(t, CTR_EL0, DIC, 1);
+    cpu->ctr = t;
+
     t = cpu->isar.id_aa64isar0;
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
-- 
2.34.1

