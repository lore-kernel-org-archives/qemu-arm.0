Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B013CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:54:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGD-0004qz-Q5; Wed, 24 Jun 2026 21:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZGA-0004oJ-Se
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG8-0008RR-Jm
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c6c57c5bcfso13694655ad.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352323; x=1782957123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVfewT5oqxl5XRbR+Ge9bAyfffuwHEAqWZcBLF/U4Yk=;
 b=h+tIPGhlmsrPPK9rz8nkTFDbBc+CIK38aB6vdexyu0rl4ruGCUnKyNajJDtJ1upOtC
 QRk+/unURlXPqGRONf8BvyXghtV8A6E78JrnR8C1wJDU9p6SdV04M7bDI+JglqYWgKvh
 KKhX2W3Fdp9s5LR6Uqe2KqXLFueQjUe/gp5YKp2egro7V0KZ7TCjVWBxONgc6fqZraAQ
 tuKYmxpgQO8zt4h2qQREtUh9khLhk+vzap+qDEMNuJPC2lP/GTe/6L0HnKj45Wi7ZyAq
 sOYN8Mc0JzHUGwN5ByoQsOni6cny5eka0NB6Xz7tHIlK75JdzmhRKnNIQuV1oK6MzWHJ
 Io1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352323; x=1782957123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVfewT5oqxl5XRbR+Ge9bAyfffuwHEAqWZcBLF/U4Yk=;
 b=XYQljX+ZhwBxjNHezIJWdf1MxYYsEF9tB9aiHprBKXaI9tXa+x4tpg94A+HqCfvVL9
 IDjBK76ihMO5YhhTT8ie+e4SzNPsfYD7OeZ/AbSpi9Pj8Zrv8w/w6hpxgEd8NQhS91g4
 v93znAoStDUPC/96smN77v8N6+1nXU/VCpcwKQthHtQmUCg9AsdABdejrchyDm+Koc+z
 46B/LBIh+lmdaC975RHSpoFot/MT8KQ9HiOw7L59Lxi5aZnPWSvvLQabWdtGSuwrjMBv
 lhC7iFt0lFbcBjNFfpcFGf8bfNi/n7ZhmShW/Sx5ieTBq0uu53sh7w2MZljxXbr+2SIU
 y+Mw==
X-Gm-Message-State: AOJu0YwiKiG3sWYerPJJem9Hp0F/WckaZpLZEz6Rcl0xTVADFEx+hpsP
 ETHftOnksewzoYfcEIkmBW2LGWSvwJKshH9beXKfN2pz2DZfnVb+4Q2Zg9l1Jge5ylhWN2otvK9
 OV1L/
X-Gm-Gg: AfdE7cmCxyMFoU6SGU2cIFEwUtq/1XnmP96WuKdXPsvaQU3gZjRAbcrNP1ut0ej7gKP
 VO7Py9jrlJxeuTDBVh/CXMMCr6Ttk0UJ0RCpFPY1CTmMGkQzJg9yItqyxTYpEiQXHax3d93ezpq
 VdRCWTIIpgVY5y+GFMN4VCoOYm80PAduOp16tSObdzgWogajFi1GpJBlDC7b+B2t1oOZtDZoECt
 F6XA5TPfK7HquMiLMG88oSvr5WbNRCvJECNMD2bph1AttGNtw+2OaZOtAxhQSoBsr6nkPabl/rU
 l0PKxPzA10fa9jbDPC2h03WOlgQA+hVg2TpPctQ51wKhjhaYyeFoiSflsYNRIE9SsTU1smVTpfU
 eqz9IrFLMbBUT3cs4RaogWah8SE8vs1bQsptP6HSo7CfPYXcO/nnbtP3o69sCqNS32XeyjxAPsk
 M4b2hl3o6Hhohtk+LNWXVstGy5ONW0y1Nc2sRlnFAW6rKbgnJwSg==
X-Received: by 2002:a17:902:e890:b0:2c6:e1f7:b4d5 with SMTP id
 d9443c01a7336-2c7fc9d6f45mr7337775ad.27.1782352322887; 
 Wed, 24 Jun 2026 18:52:02 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/10] target/arm: Implement FMLAL (multiple,
 multiple and single, FP8 to FP16)
Date: Wed, 24 Jun 2026 18:51:51 -0700
Message-ID: <20260625015159.719300-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 9 +++++++++
 target/arm/tcg/sme.decode      | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7aa270d3ec..7cb7b71e74 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1121,6 +1121,15 @@ static bool do_fmlall_fp8(DisasContext *s, arg_azz_n *a, bool multi)
 TRANS_FEAT(FMLALL_n1_b, aa64_sme_f8f32, do_fmlall_fp8, a, false)
 TRANS_FEAT(FMLALL_nn_b, aa64_sme_f8f32, do_fmlall_fp8, a, true)
 
+static bool do_fmlal_fp8(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp8(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                          0, 0, multi, gen_helper_gvec_fmla_hb);
+}
+
+TRANS_FEAT(FMLAL_n1_hb, aa64_sme_f8f16, do_fmlal_fp8, a, false)
+TRANS_FEAT(FMLAL_nn_hb, aa64_sme_f8f16, do_fmlal_fp8, a, true)
+
 static bool do_fmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
 {
     return do_azz_acc_fp(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 90ee161461..b735f3de82 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -452,6 +452,10 @@ FMLALL_n1_b     11000001 001 1 .... 0 .. 000 ..... 0001 .   @azz_nx1_o1x4 n=4
 FDOT_n1_sb      11000001 001 0 .... 0 .. 100 ..... 11 ...   @azz_nx1_o3 n=2
 FDOT_n1_sb      11000001 001 1 .... 0 .. 100 ..... 11 ...   @azz_nx1_o3 n=4
 
+FMLAL_n1_hb     11000001 001 1 .... 0 .. 011 ..... 00 ...   @azz_nx1_o3x2 n=1
+FMLAL_n1_hb     11000001 001 0 .... 0 .. 010 ..... 001 ..   @azz_nx1_o2x2 n=2
+FMLAL_n1_hb     11000001 001 1 .... 0 .. 010 ..... 001 ..   @azz_nx1_o2x2 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -578,6 +582,9 @@ FMLALL_nn_b     11000001 101 ...01 0 .. 000 ...01 0000 .    @azz_4x4_o1x4
 FDOT_nn_sb      11000001 101 ....0 0 .. 100 ....1 10 ...    @azz_2x2_o3
 FDOT_nn_sb      11000001 101 ...01 0 .. 100 ...01 10 ...    @azz_4x4_o3
 
+FMLAL_nn_hb     11000001 101 ....0 0 .. 010 ....1 000 ..    @azz_2x2_o2x2
+FMLAL_nn_hb     11000001 101 ...01 0 .. 010 ...01 000 ..    @azz_4x4_o2x2
+
 &az_n           n off rv zm
 @az_2x2_o3      ........ ... ..... . .. ... ..... .. off:3  \
                 &az_n n=2 rv=%mova_rv zm=%zn_ax2
-- 
2.43.0


