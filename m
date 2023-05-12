Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842238ejq;
        Fri, 12 May 2023 07:42:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KWB+hmhoXmj27rbPzdPduTb/6WXtOeWT5CDJFOVNiQebbglqWf+ST1Kgm+Mb007ELT6dg
X-Received: by 2002:a05:6214:20ac:b0:621:26de:2c9d with SMTP id 12-20020a05621420ac00b0062126de2c9dmr24510251qvd.50.1683902550805;
        Fri, 12 May 2023 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902550; cv=none;
        d=google.com; s=arc-20160816;
        b=JtswE0Q1nWNBkjsZDo2V72g06CMJ0G97ZM0PJbbezkuhLraA9B2sJS/DRg59HkPj33
         g+BdkZWG/QDFw7yDFk9T2+MJA0ndvyk3RDFLUE023d40ctUC+y0K9cuFRzjYOkhlOn/+
         qgDYjeytLT4gRwHytY6KYbu7g0OfzbVsWGNps0o2Gd8jCcTAU5dE7RkEbusKFavWVWin
         DtiAk4Fp4JhTKlUyJVJMbqZ6iwMSyk0t2ONbwqrW5P1EMlbF25i8TBBuXg3oDC4jYgmY
         Y1UK04Tj4QRnGhjesrujp7HoWKMZJGXz2tg6H5hSX2y5k7E5kjbXMzz4BTrKIv9yRCTl
         pBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yE0yzHpn5HGcapGUBNgyOVRbnrVrPALQXSeI3NGRfYY=;
        b=D/uCDer0GNdlLU9Dp/29fGryYaqTaQQEb/Yi7GXQihjfAySdbckB1Dl/6UXvs1qXNm
         9txofmywxIgehr6IY0ii6l2iW4KMZQz3c6xT8J0TFXuRwjDCVls62NZ9meATEpMbfv80
         wDeojV42Gl1zifmynUJnbIMxV6VQmUQLIGXjdQrWYM4QGbVFJ1at7rTZgzK6FY/VysIr
         e+4rX6RKHh54ya/KeVfLmgL9QGeOuD/lNKiEh4xyNnNkx4YnE9+WZ4vNP+iYj3NCGp2+
         pANT2jE5bWeDjXexJg0jDkqIl6kzxMmS8SjAVVAW696o0701/pN1vB2FC2IZukf93dhI
         lfGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQjj7qB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd17-20020a056214401100b0061b673ca906si5714049qvb.66.2023.05.12.07.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQjj7qB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxd-00077q-0W; Fri, 12 May 2023 10:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxb-00076k-Ck
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0004jj-0h
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso31834865e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yE0yzHpn5HGcapGUBNgyOVRbnrVrPALQXSeI3NGRfYY=;
 b=oQjj7qB42CPYtTl76vhjZFi/EX9EAeVNb6zOSysosMns+hVeTIFqt9FICZsed15em4
 VfLsML4g0iWJQj+CbfrK6lzg5tWus1lW95e1fAEbKhq0TxoXozPPfqC19i6UM0ie4GFB
 U82tZnRsbNqd5SOMTN2Kf0Uzk9c6AiTVyg2f0yBJEx+aGEqwvqCQp1PRR0YJYkMO2Ouo
 YsIgsPbqnZ9/6y/YGOoglfzqgz/EXo5/lbVGOElGdRC42Oo6SkYiqK+GzRz6o0aFt/Cm
 zWOnwdEOhV40qWfQ771xUhTmx/EYJAJKLll4z9JFcOsV6jD4NtRB6IxeCaobfWkkUuUx
 vksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902474; x=1686494474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yE0yzHpn5HGcapGUBNgyOVRbnrVrPALQXSeI3NGRfYY=;
 b=hJFHzvYzTORwdQRTc32hGtYHw0PIf3vcd2/fL0dnhbifHXHednc1qVyyIzgqFgz0F9
 5l60oqZMnM/62uSpCb7utmrR9SswqOa/JozvklGa90TvzaJtMPd7nq8VDsMqHld+uwM6
 mhYxfIFwkn2lYED8zFK3glgy7YXQLaXcMCbVAkKfeF+KPbv/APzrw6cPUBufCJjhFOEz
 Us9G9beuTInpbBU2zDiDBfH4zmRilbrJuE2ib7ZZ0ULMNwnzA681bVlHSu1RQTubGtUH
 rJjUkve6OLn+EJoJ5GJ1yOj/9piZAQKJwTA+8dGzj4ApDg0x4T9aAhEzQG1ojFXTl4T7
 O1QQ==
X-Gm-Message-State: AC+VfDxYNBXFu2IDSKG01b+M26WuKnrMzi9QHVUEUSTsQwDb4L6JMM36
 +x8yBd63Aikz5Qi3EvDVhmEn2yUhlrNGTVW1WzM=
X-Received: by 2002:a7b:cd09:0:b0:3f1:80a7:bfb2 with SMTP id
 f9-20020a7bcd09000000b003f180a7bfb2mr17292469wmj.32.1683902474500; 
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 13/20] target/arm: Convert unconditional branch immediate to
 decodetree
Date: Fri, 12 May 2023 15:40:59 +0100
Message-Id: <20230512144106.3608981-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: vaScVIwCMond

Convert the unconditional branch immediate insns B and BL to
decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  9 +++++++++
 target/arm/tcg/translate-a64.c | 31 +++++++++++--------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index eb5d4cb0d57..d54c6522028 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -21,6 +21,7 @@
 
 &ri              rd imm
 &rri_sf          rd rn imm sf
+&i               imm
 
 
 ### Data Processing - Immediate
@@ -106,3 +107,11 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
 
 EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_64
 EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32
+
+# Branches
+
+%imm26   0:s26 !function=times_4
+@branch         . ..... .......................... &i imm=%imm26
+
+B               0 00101 .......................... @branch
+BL              1 00101 .......................... @branch
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4319559057f..fe6b4a68288 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1319,24 +1319,19 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  * match up with those in the manual.
  */
 
-/* Unconditional branch (immediate)
- *   31  30       26 25                                  0
- * +----+-----------+-------------------------------------+
- * | op | 0 0 1 0 1 |                 imm26               |
- * +----+-----------+-------------------------------------+
- */
-static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
+static bool trans_B(DisasContext *s, arg_i *a)
 {
-    int64_t diff = sextract32(insn, 0, 26) * 4;
-
-    if (insn & (1U << 31)) {
-        /* BL Branch with link */
-        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
-    }
-
-    /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, diff);
+    gen_goto_tb(s, 0, a->imm);
+    return true;
+}
+
+static bool trans_BL(DisasContext *s, arg_i *a)
+{
+    gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
+    reset_btype(s);
+    gen_goto_tb(s, 0, a->imm);
+    return true;
 }
 
 /* Compare and branch (immediate)
@@ -2413,10 +2408,6 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 7)) {
-    case 0x0a: case 0x0b:
-    case 0x4a: case 0x4b: /* Unconditional branch (immediate) */
-        disas_uncond_b_imm(s, insn);
-        break;
     case 0x1a: case 0x5a: /* Compare & branch (immediate) */
         disas_comp_b_imm(s, insn);
         break;
-- 
2.34.1

