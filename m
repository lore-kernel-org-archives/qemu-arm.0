Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1208495lfp;
        Mon, 18 Jul 2022 03:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7zHgAhSbxakthWyltWzbCO0ciF/NYRV1baMoCj3uhOlkmiC0SnR3FrrtVw8e3Eh+epfgR
X-Received: by 2002:a05:6214:76d:b0:473:2a39:45fb with SMTP id f13-20020a056214076d00b004732a3945fbmr20594659qvz.129.1658138520070;
        Mon, 18 Jul 2022 03:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658138520; cv=none;
        d=google.com; s=arc-20160816;
        b=uQsqiOa86l5VZ/W6IkmgBhYlRvmFDXDTCyhpCPnC1/VXBmUoiBo4Q0Cx0NKvew6aLB
         cP9Fkr5ESCO7FFgekrTAbWt2FKcBOlIkMgU8t+0mC8ckS4+WME9xgejdgx/uz9d9+FeN
         Wq1+7z9lUKLCelXPR/TllG5dzCaz62g4OlmP2hCwmf73nzAJHxARInxtJhiHg3asowgn
         KOF3+69G5JK/CDHeG37xKy5/fnvbpMdlIw4O55WueBniD1j8cS355Rbek1X8XAZddyop
         cnOmggkGrHhgMfWy/BTHQfVfUJ0ujZ0S4EadrhTi8kcqIgEhJMAiyY6zdaPJ5gLrJUjZ
         y5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LADKvz6NGwtTpJM5NpBVGy0mPvkc4sq8YRH/zAnJtNo=;
        b=z1Dg8HkE7am+y32l5yRjqFykw0je3TWV3LXVIXVDORQ7T8EyN+5fJYrKAwDbMsCZv7
         6GdO7Jq6rXYfLwL8FLa9hG8LjVqqWWtAd7FeO1MuSnQm0IsWUPBLKBlLBordpvnF64Mt
         ccfCbPNGvCr5bVBS/WZl6UoN1nmMbCa4tc7f0P9ryaYNitgjqswZmexdTIPammMQaZAu
         ZIHzmYhoKfphPBwpp1becDH8p3paKJin0+1yWd8YXvYhrXRgog/Pmm7oOefB7X+z68hM
         VDV2MQcwJPhyGyKHbbhy+m9wxY/L88PPpSlpjErHngGiSpbrcZmWYKlFablkU1IjKVSU
         nQaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sD30wY8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm17-20020a05620a199100b006b5851ab15bsi5859969qkb.486.2022.07.18.03.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sD30wY8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNZf-0001ZH-JN
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNZV-0001Z2-Mh
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:01:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDNZT-00054i-VQ
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:01:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso7007805wms.2
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LADKvz6NGwtTpJM5NpBVGy0mPvkc4sq8YRH/zAnJtNo=;
 b=sD30wY8bZN83brGu8oFmRrq+oAKISV2fydR2wdGzyxa1cxOXfvchvA4ZPYnelyjDjm
 GdWhwfQ9aeZHeJN6LMp63KwczQ+VM/3CtTq250ctTlXdyG8QAWK0utmVtPa1kapOseTP
 A29QeF7s7XGsMciBHaD2hd4f+dOANOOOzjvcpj12OfH2pZ4bZT8+ErDnpbV+bk7WQcYQ
 Sb06qv5DZNO+v7A/Ouzf57q5kXMBYI8UlYicPgcgaN10stMyBEr1bnhWmquz5ugVVTIH
 PfqDN8E8getvQjhS42kRszl+HTqf3gL4p5y1jtiP4FDWl6kcvKXCvpTYNj0eNH91Xqky
 tKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LADKvz6NGwtTpJM5NpBVGy0mPvkc4sq8YRH/zAnJtNo=;
 b=3vW6gOt9acWvNFaBxlWAKRSQf3CloZl38SY4cFtibTJPHHLtzE+VSGnqAVsFL+qJrN
 Ik4DtMs6RQcT8YI9oL+JywXBQdI6UGCv5QDsus6oRC/UP5w4UdkFbq5YShdckf8n6tba
 8RSEBwfWvlxr3z+6iF6o6wd/sTcWU/p3g5J04fqdsVe0MQWajxrFTqcdzF4HhPk9YkA5
 1QUtA0PZ8rqh3Voi5tsaTfTAyyAnkDs9/os2teG9NhspPWpAW9c6OXeeZGnP0BMZ8WBX
 MCL7ZxkI5v0XKWt+Aa1OjxGEIEdna8ff72OQHgXQmIunQms6uVCH3inT3krJSlWqzfD/
 d0pg==
X-Gm-Message-State: AJIora8LvDXTlToBSprm7W+NvCb4Jk/aaKFdeRDrlHj/XFJ83EpAH1KM
 rqLeM5AfGG5lsbKMpWslgVzeRTFDlY9MMA==
X-Received: by 2002:a05:600c:3b07:b0:3a3:1433:10b5 with SMTP id
 m7-20020a05600c3b0700b003a3143310b5mr8683144wms.129.1658138506135; 
 Mon, 18 Jul 2022 03:01:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b0021d6f03b524sm10251990wrp.48.2022.07.18.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 03:01:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Add MO_128 entry to pred_esz_masks[]
Date: Mon, 18 Jul 2022 11:01:44 +0100
Message-Id: <20220718100144.3248052-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZzvE4a3xiCoO

In commit 7390e0e9ab8475, we added support for SME loads and stores.
Unlike SVE loads and stores, these include handling of 128-bit
elements.  The SME load/store functions call down into the existing
sve_cont_ldst_elements() function, which uses the element size MO_*
value as an index into the pred_esz_masks[] array.  Because this code
path now has to handle MO_128, we need to add an extra element to the
array.

This bug was spotted by Coverity because it meant we were reading off
the end of the array.

Resolves: Coverity CID 1490539, 1490541, 1490543, 1490544, 1490545,
 1490546, 1490548, 1490549, 1490550, 1490551, 1490555, 1490557,
 1490558, 1490560, 1490561, 1490563
Fixes: 7390e0e9ab8475 ("target/arm: Implement SME LD1, ST1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 2 +-
 target/arm/translate-sve.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e36a839ee4..3123488014d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3374,7 +3374,7 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 }
 
 /* Shared between translate-sve.c and sve_helper.c.  */
-extern const uint64_t pred_esz_masks[4];
+extern const uint64_t pred_esz_masks[5];
 
 /* Helper for the macros below, validating the argument type. */
 static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 41f8b12259e..621a2abb22f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -529,9 +529,10 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 }
 
 /* For each element size, the bits within a predicate word that are active.  */
-const uint64_t pred_esz_masks[4] = {
+const uint64_t pred_esz_masks[5] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
-    0x1111111111111111ull, 0x0101010101010101ull
+    0x1111111111111111ull, 0x0101010101010101ull,
+    0x0001000100010001ull,
 };
 
 static bool trans_INVALID(DisasContext *s, arg_INVALID *a)
-- 
2.25.1

