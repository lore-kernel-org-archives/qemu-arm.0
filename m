Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3438258njb;
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZrTJfb+K0lo/w9szHp6OLjZ1Fco2ylpudcJgq3Y9dvh/OdBlYTyAPHIrXhbL1/IHx5vSEutykFEVxdA==@linaro.org
X-Google-Smtp-Source: AGHT+IFSi7C0ogk6BFPqx4mNAveQ8pN+uF4EJq0GkoI2Pr/h8LYWKx6xu6RMEtVB/UDf7L2uo0yt
X-Received: by 2002:a05:622a:51:b0:466:9f89:3d72 with SMTP id d75a77b69052e-46734f7049dmr306230261cf.36.1733847572533;
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847572; cv=none;
        d=google.com; s=arc-20240605;
        b=gJSNdy/F//yTxnXNYT+EVA0UiF01laxEROJ9r4lagRXCq9yWYBldHOvKTRtD00AyuT
         lEA3TJqHG7tKY6aJTyFYV3UeAUrEGvdzfMZQPTpE2jdVq9u+87GXARCuDjioIq9N1XuL
         Q7ZVW49KqiiCHravbuJeCoxUUiPpb7UPSl/dXAgBRVq7zxx3BU5w+FiI4/MZWfUkAHjG
         FJo4hE9SZ4x8nxg3mZ8aN8Yy/mcTAu1gtE4DPUrts2w6cXeOV3irEfGasiFjbP9YtjPq
         DqiTv/4azIR6wQMWLhcd2JskUSmuTzxzH1LupzlFBS4l8/aO/0DDk2IxtYjiQPaU1X3D
         frLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s63N5H1NJdR8gVUhJ6lBSzQfPRwDYdjmVxlruA0DAg4=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=F9GaKhDgx3bIZoc6ehOwtPDQGbbgk5k7iHHo9hno79/197O2iCowG7rySmitimu0j5
         v14+1ArbxmqaXTARnKqiKe1Z4tNkBb/9uF6JlIQSM5cQOvuIhuwprHasAGMJaMf07QM5
         do0FYgr6Ux5pWc0bz7Dr6MYnWVFKiNqLeuNmDNKEVN9ERqBRMSrSCG/3UpNj+ROt3U4s
         qo9ahoAt+Gv0R24Y4tT/bogOl/Rcw1qvrZ6dZwFRaCQ0mFyzMFqgFTiqgXmDxZpKzpc6
         zYeErc3lEKxOzezTgo89Lap/6zS8ouK8WFUmzynu29yjK6LmhVxZ5xKnN6ssYV30FhrY
         +l2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ox+l6cQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467849a5768si8490871cf.162.2024.12.10.08.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:19:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ox+l6cQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2vw-0002QL-S5; Tue, 10 Dec 2024 11:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vv-0002Pv-Ti
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:59 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vt-0006HB-CO
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:59 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53f757134cdso3191583e87.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847475; x=1734452275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s63N5H1NJdR8gVUhJ6lBSzQfPRwDYdjmVxlruA0DAg4=;
 b=Ox+l6cQQYRcdlnVW4dTu3jv3OdfLjyWTDXRVEankWwhxnO89hnmcxySDkakYFlr7qA
 TGNF+d5x0OASGOBRnArPuOnXSOFHeWghYJJZ1jGqSmPx1wiKJrxlii7fsxfNG4xyz2oG
 17IVJTZ/xcRRLdDUs/mVB5Bv7izEYTtPRjbmHXHZlsnSSIDiGgBbqlL12KTGoXKoCFVu
 M/2I61mnC33pIGebPhNeblah1EyBF15JwLmgvHTh9Hmr/ry/9OK97MQ8pqXMp33SVD2S
 3v1kO/PFtNQcptGhqT46cuVuILHgXD38teQgKCriXdzYTpC73W1iYVqv09UeZC5V/ohT
 TLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847475; x=1734452275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s63N5H1NJdR8gVUhJ6lBSzQfPRwDYdjmVxlruA0DAg4=;
 b=rHmUwS4dBVnGmGWhAO/t4u7SdoCAfNACnQxhqaDhHGMXR9VTLd315We2shgUY/yRUS
 e/tVVMy9ZIwhkLk7p25fQKGm982P9BzStiyqrgNqVGsZsdynOIeu4LP34mMlycTx0pGV
 cZXCgUoqNyc3nRm9DoOw9CbsUffvOcbkqz2DwqojsLRdx38XnWFMnzrVvw5INnNf4n6+
 Wg/kt5Fszn9jOjRg+hjKfJD7sYo0AVcmHEdGouKca3eJnIdlH6eTIAtZIieNLnVhHKgY
 GSbI0cxdJvG8RmzFKa5XAtiI68SlrZd4HjF6sDxwVoQxgHevyfsbVSRY9Iaksmg4y6Jr
 Mb0A==
X-Gm-Message-State: AOJu0Yz9hhqRGYF89r8cUC8YhIBB+Pd7HZ589w+Q8By20wrHmsBk/ll3
 Ddx/lAX34px+ewpr05unLyPK7jvNRqziQ6/23R9kzksRZvonAbZzejx23572sAA=
X-Gm-Gg: ASbGncsMwo8OufBWSuD3tZS2ZVexeZXrUjQJUciBz3VXg3MzyDOcQ8Vvj9W79r5xEli
 a2Ru/4E8LMqnfLvWEisMFN0FJCz3co7PlvfFELQvRJFuywPgQh+sW9lIXwVEhq2og2eyoc4Uw8U
 PUaMibT5botbYhhfkECc3KXS4AV3+p4+5M0Rblyu1gSBjzAhmt9zPt++TqEBUXTttTOGY2rQB9f
 JZuW4imWig+CtNsnZidfEFZ0Xxh3lkUq93cPLbFWS/3Ijv7WQ6RM745eng=
X-Received: by 2002:a05:6512:3e19:b0:53e:3a53:f884 with SMTP id
 2adb3069b0e04-53e3a53f931mr5111988e87.35.1733847474913; 
 Tue, 10 Dec 2024 08:17:54 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:17:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/69] target/arm: Convert LSLV, LSRV, ASRV,
 RORV to decodetree
Date: Tue, 10 Dec 2024 10:16:27 -0600
Message-ID: <20241210161733.1830573-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: mLRTURYNPZrR

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 46 ++++++++++++++++------------------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9f687ba840..8b7ca2c68a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7575,6 +7575,23 @@ static void shift_reg_imm(TCGv_i64 dst, TCGv_i64 src, int sf,
     }
 }
 
+static bool do_shift_reg(DisasContext *s, arg_rrr_sf *a,
+                         enum a64_shift_type shift_type)
+{
+    TCGv_i64 tcg_shift = tcg_temp_new_i64();
+    TCGv_i64 tcg_rd = cpu_reg(s, a->rd);
+    TCGv_i64 tcg_rn = read_cpu_reg(s, a->rn, a->sf);
+
+    tcg_gen_andi_i64(tcg_shift, cpu_reg(s, a->rm), a->sf ? 63 : 31);
+    shift_reg(tcg_rd, tcg_rn, a->sf, shift_type, tcg_shift);
+    return true;
+}
+
+TRANS(LSLV, do_shift_reg, a, A64_SHIFT_TYPE_LSL)
+TRANS(LSRV, do_shift_reg, a, A64_SHIFT_TYPE_LSR)
+TRANS(ASRV, do_shift_reg, a, A64_SHIFT_TYPE_ASR)
+TRANS(RORV, do_shift_reg, a, A64_SHIFT_TYPE_ROR)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8456,19 +8473,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 }
 
 
-/* LSLV, LSRV, ASRV, RORV */
-static void handle_shift_reg(DisasContext *s,
-                             enum a64_shift_type shift_type, unsigned int sf,
-                             unsigned int rm, unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_shift = tcg_temp_new_i64();
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-    tcg_gen_andi_i64(tcg_shift, cpu_reg(s, rm), sf ? 63 : 31);
-    shift_reg(tcg_rd, tcg_rn, sf, shift_type, tcg_shift);
-}
-
 /* CRC32[BHWX], CRC32C[BHWX] */
 static void handle_crc32(DisasContext *s,
                          unsigned int sf, unsigned int sz, bool crc32c,
@@ -8579,18 +8583,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
             tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
         }
         break;
-    case 8: /* LSLV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
-        break;
-    case 9: /* LSRV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_LSR, sf, rm, rn, rd);
-        break;
-    case 10: /* ASRV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_ASR, sf, rm, rn, rd);
-        break;
-    case 11: /* RORV */
-        handle_shift_reg(s, A64_SHIFT_TYPE_ROR, sf, rm, rn, rd);
-        break;
     case 12: /* PACGA */
         if (sf == 0 || !dc_isar_feature(aa64_pauth, s)) {
             goto do_unallocated;
@@ -8616,6 +8608,10 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     do_unallocated:
     case 2: /* UDIV */
     case 3: /* SDIV */
+    case 8: /* LSLV */
+    case 9: /* LSRV */
+    case 10: /* ASRV */
+    case 11: /* RORV */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index c218f6afbc..3db55b78a6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -658,6 +658,10 @@ CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
 UDIV            . 00 11010110 ..... 00001 0 ..... ..... @rrr_sf
 SDIV            . 00 11010110 ..... 00001 1 ..... ..... @rrr_sf
+LSLV            . 00 11010110 ..... 00100 0 ..... ..... @rrr_sf
+LSRV            . 00 11010110 ..... 00100 1 ..... ..... @rrr_sf
+ASRV            . 00 11010110 ..... 00101 0 ..... ..... @rrr_sf
+RORV            . 00 11010110 ..... 00101 1 ..... ..... @rrr_sf
 
 # Data Processing (1-source)
 # Logical (shifted reg)
-- 
2.43.0

