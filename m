Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1443519ejb;
        Mon, 4 Sep 2023 09:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3cO8IFP538YNJ5i1AqMtBKJPWiPcK4LabkeGtC0zsuL1VjrPUTY6vpOkbIW3MNwrp9oI+
X-Received: by 2002:a0c:f311:0:b0:642:66bf:902c with SMTP id j17-20020a0cf311000000b0064266bf902cmr8921924qvl.32.1693844002607;
        Mon, 04 Sep 2023 09:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844002; cv=none;
        d=google.com; s=arc-20160816;
        b=IZb0LQp06WbiVd4GX8kMYGM+K8RLhb5n/D75V4TZ5uiC+hkIIYMI0sufAhuR8Q0as8
         rPVdjDz0cG2jQjgeHuvqNrH6XmOnSNv0N9IbCigdLgP3+hFqZZY+uO0xqSDxJQ9s7ork
         gptR86zHeZTX0NykNfVwVFr9jJNlgglIFFklkiAWPtU64bPVBqPD/H3ol9PMbQ3dUO1N
         kKTirQvEU9tAVUbt11xKxW5lP6xCF4q9sx46obORv1H/Dc2DfS0IyU7F9Dp3om3T2lrm
         lfb75+xCMkeyN1zfLHhk3G6C7F5byURVHW+Us/AIgWmQAvYBn6Mwoxf6wsChecaGXDNQ
         1XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x4jIrB8buoZ4kzwhFvV0xhUjYKmY274vhbfo/mB1lCg=;
        fh=9aWhNTzWuGnoulTjdeFX0+0UCLzagAXfy6/A1sUjfOQ=;
        b=It+86/fwFNJjgOiONa/2p7JrOSNmak4RHcOTVxt+Dc2p7rKZx+q1Vbheex+LsOQHlL
         IrqB2aPw3+Q3jXXM/clb1CiUtV4ndoJBJojlO8heLlB3sIopTW3/acb8zDDGdbnBrNhs
         JyXUs5aXTW8SpsUy9Icb3G8vhaiWFItspnR3HgGHymt0dDev8SVFUSKgGoSixwUx7DSU
         LDKhQfyyMeyBf0qFulmPvVxqXvkflZWiX6VQxS+wZATLfuHrf2/wMzh+2oqSOPrI4FaW
         1dECk9JozugtLaT2BFL8BSE3kpCcw4R6D1QgN3JKFTkz91QJa4VXqWo+pfm0B6kUaSuM
         eLaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js5lkQL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a0cca91000000b0063f726c14f4si6399718qvk.223.2023.09.04.09.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=js5lkQL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCCT-0002X1-OR; Mon, 04 Sep 2023 12:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCS-0002V0-Rd
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:16 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCQ-0007Vk-GN
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:16 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so233464566b.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693843992; x=1694448792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4jIrB8buoZ4kzwhFvV0xhUjYKmY274vhbfo/mB1lCg=;
 b=js5lkQL3cJNKZ3IsTjZb7hnuCT/Ea2PDHh7Gv3IevnDVVPJ3+IsbsceqGbagQgQK4g
 iNrUoZk+ulEP3GDeyTECKFG2Ka7M50tLBPWuJDWMG4KcdAdAa/tscs4ZIJtS7+HjGeFU
 w5u1V3ev984RlxkI7hkt30xIeI3yaIaC/xQpAx1+LX+sWPPy4BaWZdGQlao55Mu/Vk8f
 TyDCv7JsmoqaI0pjDmqGFhb22M3KqXlR3/uluzaPDuwakjXSKiqBB1c4rPWXgJT9Pr6e
 004BHCYVvoa+GK/j92UnBtgOiUr+J0e+TH+jOWHa30BL3j/i578Hs6J9XliGt7xikn3n
 ANew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693843992; x=1694448792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4jIrB8buoZ4kzwhFvV0xhUjYKmY274vhbfo/mB1lCg=;
 b=FAPTP+QYLM1AFtnxYwJMEMTaIOJ5WdaSMIwpotfXZTpPHetEkP7Wmfwap5+2HkJ1kZ
 pzTiU0LC9CraiYklCEzRMRl6fWy62sLyDn5gU3BdDWRi8G5EVln6JVuyWF2jMNQu8U9/
 62v4PPCJ7fbFtcF6xb71Z5nHmjb1vMJK38OnicCh+WiqAt6g353VsViGertMdh6r2QI8
 9eLUa6Vlde312RoQEheOlh3/i/7hcCmkd1Lmxlegd9HE7LPYJpls4aUW7CDqAHKgeNfe
 M/AfSPojmKNLwbgnY5uJEue3aLGmSr5memtjf7bzcFFFB5Qfn6uoPN6BIUtJfpMdCx9H
 KfRg==
X-Gm-Message-State: AOJu0Yw7sjSnZULqMm4joebNolhcegZAgTlTVS0MXznXAkrHzFJoKe+w
 vGAtvdJ/QJjiOsg/eMReLT30lQ==
X-Received: by 2002:a17:906:cc0f:b0:99e:f3b:2f78 with SMTP id
 ml15-20020a170906cc0f00b0099e0f3b2f78mr6530005ejb.67.1693843992290; 
 Mon, 04 Sep 2023 09:13:12 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a1709067e1300b009a198078c53sm6305559ejr.214.2023.09.04.09.13.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v2 06/22] target/tricore: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:18 +0200
Message-ID: <20230904161235.84651-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VnNsni1jfP4n

Fix:

  target/tricore/translate.c:5016:18: warning: declaration of ‘temp’ shadows a previous local [-Wshadow=compatible-local]
   5016 |             TCGv temp = tcg_constant_i32(const9);
        |                  ^~~~
  target/tricore/translate.c:4958:10: note: shadowed declaration is here
   4958 |     TCGv temp;
        |          ^~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 6ae5ccbf72..9ca211b2a8 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -4962,8 +4962,6 @@ static void decode_rc_logical_shift(DisasContext *ctx)
     const9 = MASK_OP_RC_CONST9(ctx->opcode);
     op2 = MASK_OP_RC_OP2(ctx->opcode);
 
-    temp = tcg_temp_new();
-
     switch (op2) {
     case OPC2_32_RC_AND:
         tcg_gen_andi_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], const9);
@@ -4972,10 +4970,12 @@ static void decode_rc_logical_shift(DisasContext *ctx)
         tcg_gen_andi_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], ~const9);
         break;
     case OPC2_32_RC_NAND:
+        temp = tcg_temp_new();
         tcg_gen_movi_tl(temp, const9);
         tcg_gen_nand_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], temp);
         break;
     case OPC2_32_RC_NOR:
+        temp = tcg_temp_new();
         tcg_gen_movi_tl(temp, const9);
         tcg_gen_nor_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], temp);
         break;
@@ -5013,7 +5013,7 @@ static void decode_rc_logical_shift(DisasContext *ctx)
         break;
     case OPC2_32_RC_SHUFFLE:
         if (has_feature(ctx, TRICORE_FEATURE_162)) {
-            TCGv temp = tcg_constant_i32(const9);
+            temp = tcg_constant_i32(const9);
             gen_helper_shuffle(cpu_gpr_d[r2], cpu_gpr_d[r1], temp);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
-- 
2.41.0

