Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654738ejm;
        Wed, 3 May 2023 00:13:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vbHBob3MVQZignIyjvu18FSZx4sCXS9Z6B2F8x9zS+igXfC6p5EBkmi1Bnep6ffZyRHJm
X-Received: by 2002:a05:622a:386:b0:3ef:6300:d6e6 with SMTP id j6-20020a05622a038600b003ef6300d6e6mr27554891qtx.58.1683098016944;
        Wed, 03 May 2023 00:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098016; cv=none;
        d=google.com; s=arc-20160816;
        b=0o6pQw/RvirleB5lzUFpdTtKxMRz87oZp3x84XSqRuUIGy7mfe/Bwt1Qm4m/Tzs5tO
         eAOkuK/RhTXkj7gqCAl59aaoWAFEOMe22q94w7BYS72WQxzJWXOBmepMRwWdOPERsoge
         F6KU4bZa1oFIRm5mtJQT9TX89KFeWXyhG7pVkcbtpR8jXL4o7wceXYPywS2rMLcU8Lka
         aLdTONKseZUNSGY312itoI8m8pb+pdOUGO4qF7JQFL3q6kAJZhoG99B2kPNz9zEVib0F
         SEalg3Jd/ZpDuyxwSE/OrBjyluo5jOpXxJMLFExicFwSb7RyBxkKcj7ym1Hl/yvYSToY
         ocPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u6ngJlz4BnT3IPA+iAnWpyxcqcDly3tsfFDXkJo5Tbg=;
        b=VKg8GJhk76dGMC9Vge/qdmFXFMxWLFG8L7Y8e/vKpO2RA1TavzutMvlBJeS2kFBL7x
         mbLw/wu+w3Q2bSX71mdfLoQqzrOq1sedUqf6rSyJ6wpf/EpGx35p8q24n2kvfKoIRpfJ
         v8I5MuBr8mgwPfbHfbtU4Uq1eibGBEMk5EInt4636zuYBfYBLg1sZoD9NdMOo79Z8zvR
         pEXDNZfmo+yjZqz8TynOnRaK4xMdulDXB+uSJlPeg5iER5lNbXErtX9NYMT34adC99Ko
         CU/hHn97sB9lFrBYW5VMnIdwAt7Ta+mS420yGUKPhRAZUibAuolD5ZITaxSEKkVBs8sE
         OtfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/GKTy3e";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a101400b003f12f804a1csi9145919qte.54.2023.05.03.00.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/GKTy3e";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6du-0004k4-No; Wed, 03 May 2023 03:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dR-0002vv-IZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00075J-6r
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so29024415e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6ngJlz4BnT3IPA+iAnWpyxcqcDly3tsfFDXkJo5Tbg=;
 b=H/GKTy3elP7oPl/zWmeAblrkKGUV8xQ80Gj1pICA4e/45V7tGUI+iFM300M2+v7Zjc
 1i6vpYhky+t9ojiXA8LBa/y5wes+PkYbZbwaTS3GZx8rEkKGAlVf9kh5uE1Wl9CQQxMs
 Zu+w7TqV4vfxlCCw2SBqavsiS3FGreKHt8PoShR1972U7y6oyI/kztRgNO5/Aen3IUbW
 7UipN31GaQxtuCERPsvEu26IlGO2H7/1G7cIKo2LSz/WTQ/HOx7i7QpvRu7+qcYTvDLM
 IWYD0WYWBj4uSVmP4LjdmDj6HRO12+o/7Q/HYqJeckpAJX/rucTKE1ZIaf8Jq3T3R2Qe
 o6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6ngJlz4BnT3IPA+iAnWpyxcqcDly3tsfFDXkJo5Tbg=;
 b=gHlziPZ4+0k3RtIPGZyYjTxN1d1LIkFpIoq0RfVQYF0cxSiex+MG2oiPpAU/IlJ/+N
 FWOrd28bymBQrSh3JQJ17+C9CvzAg1IzRhb20Ou0W//A9WzmpWwIadT3X+gygqITaHr6
 LCZDdNu5VNvQl3+NbFN3x1rWM8lWpOe7rX7wR5gRsLf7g8aQfrbZn25i8lwjhXUaaCFz
 Rwl+RahT6lKpgr7oKhHSeRt15pSsrThtp4qCWodr4ZzcaE6q3c059C8VUvr5NfyitcwD
 aOh8hOIdavKc1RhaXsWLJCq1gcyEZ7o5WRFCd4eXsizuKKCL0pmS3zChodqhsCe/THtF
 sctQ==
X-Gm-Message-State: AC+VfDzr53Q+kBYXxrZAGvDMllVV2Z5aTVQfCY+Q9Pn5wSmlfURPV460
 7Xvh5kbnLVRiN15XeruWITFUzSyh2PulSDE3wdrQTA==
X-Received: by 2002:a1c:7205:0:b0:3f1:6e88:5785 with SMTP id
 n5-20020a1c7205000000b003f16e885785mr14757198wmc.14.1683097834872; 
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:48 +0100
Message-Id: <20230503070656.1746170-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LCgb8LD2rVnM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 37870c89fc..4dd33c73e8 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1u << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1

