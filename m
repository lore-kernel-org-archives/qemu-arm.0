Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2204589ejb;
        Tue, 24 Oct 2023 10:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfMvNf9NiZePaQwRshDVtN7/dOPHy3aLUaIYl1/IplAAqh+fwj8U/gkl59nAIn4DqnkYXq
X-Received: by 2002:a05:620a:8786:b0:76f:f0b:a1b8 with SMTP id py6-20020a05620a878600b0076f0f0ba1b8mr11062582qkn.25.1698168300752;
        Tue, 24 Oct 2023 10:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698168300; cv=none;
        d=google.com; s=arc-20160816;
        b=lVVXcN99P6SPLSR9p7R7WLCQDTTSPx7Rp+5fAa3HckpKT7I3ykdGQ3jc/eKZKGTNVw
         Dp3sR7mRnAbQ5Arjy4pUU4J94eBjkbR3m0ZOdsoBlfTlN5Z57dQMWsjQs+yQmhkx9+Vq
         f8fuy6GlfeJ1Q+cV85Ijw7P1a69XFFrTqD9xoLU91NIRIAVav8jVLETS3vCWexZxmODq
         CguxljctPMYj0T1eThzTxJ7EyAm1xUlaNMVEWxkxMvLRU/EGjeBxhgUUfAmjJLqQJhes
         vq4a+3XkZiTKHF8VsGxZA4TWimwGVA6dIQtRsoOf+2BI2qevX3gIt+lWDts7RWykuYa4
         xCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=whe7VhM1QRrMglSRu5qWCi/P7ekDVJP9PS80iqT8NDE=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=ENOOJS44mVkM0LazSbs70wXmE9hCWpzAmaNPIao12tvTLoc+jqwkTq79eHyEmEcwdR
         lLgo4vsqDNeQNvJy8DGRsH0cRtpdNBb2n1XCIpE95+Ibs3WXb0QTr6OjM/r8/RGXSly7
         FUii2Mjpm+3bZLdUu3aHHm+zvrWtcy2T5tODoVMVlGBqzs85NalIAsFdgMV9pEHq4y8L
         7Nazzfm+PJHGWxo9SBQmiwPiDZU+d+HyyfU0/HoPvPhRV0oDRvmO6OH3y6Lpn780wDcK
         V7iqFhMpFUq3+8aOf0adgxhbUl9xDeOxGIQSlZcuS/0TApdVhr0p/DSO/WVAHHCigkSP
         GnjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0AWU7Lx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21-20020a05620a211500b0077437859066si6892476qkl.7.2023.10.24.10.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 10:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0AWU7Lx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvL96-0001Uz-Qt; Tue, 24 Oct 2023 13:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvL91-0001Kd-KR
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 13:24:46 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvL8z-0000qp-Vy
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 13:24:43 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so72015631fa.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698168279; x=1698773079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=whe7VhM1QRrMglSRu5qWCi/P7ekDVJP9PS80iqT8NDE=;
 b=b0AWU7Lx+v1uKY2jJZfnEibzv3pFNvWCeAE2zb6tv5j/aUUhF6H9owLzTMKFpnfX5X
 maoZKqxG4Rjd9AHNI88n1Wq1jLk6FmsSQjHIFBcDBoQa0guDbIWWx7gx1V0QIGpB9G3V
 rGpu2pbCqE7UyjEJqdwEyMSa5y3dfmLUijAIvoPvcX3R9Y0Rrbv4SVmMbjaDPKOeyGth
 C/66xitKeZWLpfkvyJ5Jm2KcXU0DKJxiYtG551rdMgc1szNk6g9VoCg7tpZezcWQ/ymD
 ZROgLOmAuiuph3UgygkdMCconTNXTSdt0t104JH4gaXV3up3qQoWYrQBuQRtVQcjJvtK
 QvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698168279; x=1698773079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whe7VhM1QRrMglSRu5qWCi/P7ekDVJP9PS80iqT8NDE=;
 b=G5MH7NONDzEHA4EXHvrd/NOYuyG/7GIL8QMZy9yKkhT58C6f69yuJ448bpM24dKocF
 bOAbYaIUDMn2YMzstKhY7IC6WbL1/xydb17+0N0mqJolTQN8ZauRTufDLjydfR6AGQtp
 N5rAYVjevJhJyGEz4JSMEklTIVX8IHBuasFo4KOhWC0FQVH02wNJJunZBzTyEeIGr9mQ
 aZaY1Vwg2eg8XbUG3dk15qXbhdvrPMJHdF+a+oL8nrP+s3KrGrMpjJpjnVWo2U7nqWMC
 yGuG5gqBI/E0bHK6pTi2ZbVj4IQKVYqnxDFrlELOwlL+Hx9aFR+4uyNgX0n4KJy07x8x
 eV0w==
X-Gm-Message-State: AOJu0YxFXZzSVcAbB6Zwzo+0SWrZngfbFpwTbLx8JMxi9b9GCdaPbNOs
 VL3i5aNzSkOAvNF7q4BtUfySO8lQPLBUtsOBlQc=
X-Received: by 2002:a05:651c:447:b0:2c5:18a9:620b with SMTP id
 g7-20020a05651c044700b002c518a9620bmr9223152ljg.23.1698168279521; 
 Tue, 24 Oct 2023 10:24:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003fbe4cecc3bsm17371755wmo.16.2023.10.24.10.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 10:24:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix syndrome for FGT traps on ERET
Date: Tue, 24 Oct 2023 18:24:38 +0100
Message-Id: <20231024172438.2990945-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5hXuNbAcpfoD

In commit 442c9d682c94fc2 when we converted the ERET, ERETAA, ERETAB
instructions to decodetree, the conversion accidentally lost the
correct setting of the syndrome register when taking a trap because
of the FEAT_FGT HFGITR_EL1.ERET bit.  Instead of reporting a correct
full syndrome value with the EC and IL bits, we only reported the low
two bits of the syndrome, because the call to syn_erettrap() got
dropped.

Fix the syndrome values for these traps by reinstating the
syn_erettrap() calls.

Fixes: 442c9d682c94fc2 ("target/arm: Convert ERET, ERETAA, ERETAB to decodetree")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted by code inspection when I was looking at putting in
the ERET trap for FEAT_NV...
---
 target/arm/tcg/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ad78b8b1202..41484d8ae54 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1606,7 +1606,7 @@ static bool trans_ERET(DisasContext *s, arg_ERET *a)
         return false;
     }
     if (s->fgt_eret) {
-        gen_exception_insn_el(s, 0, EXCP_UDEF, 0, 2);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn_erettrap(0), 2);
         return true;
     }
     dst = tcg_temp_new_i64();
@@ -1633,7 +1633,7 @@ static bool trans_ERETA(DisasContext *s, arg_reta *a)
     }
     /* The FGT trap takes precedence over an auth trap. */
     if (s->fgt_eret) {
-        gen_exception_insn_el(s, 0, EXCP_UDEF, a->m ? 3 : 2, 2);
+        gen_exception_insn_el(s, 0, EXCP_UDEF, syn_erettrap(a->m ? 3 : 2), 2);
         return true;
     }
     dst = tcg_temp_new_i64();
-- 
2.34.1

