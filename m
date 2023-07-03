Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172960ejy;
        Mon, 3 Jul 2023 03:11:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zapo7rP09fkuqA+Gj1etrke7wjsiRw7hDm5SRsLSZptxf2pvil3+QamMX5AzHcFlvEUf5
X-Received: by 2002:a05:620a:29d5:b0:75b:23a0:d9e1 with SMTP id s21-20020a05620a29d500b0075b23a0d9e1mr14055797qkp.55.1688379067015;
        Mon, 03 Jul 2023 03:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379067; cv=none;
        d=google.com; s=arc-20160816;
        b=DdixepEZHGJDWb6AJSvaicmI28E6ELbvxLnesGEMiDjI9mqPCueqvs8WT63YXGqgQs
         +hOCpDlLgJqU+dJxpUu0WwtMXlmtp+zbwmfGBJ1bzzJAtSWwgTsEKKVJeITWGOjZeuZ4
         doNbL1UbKEDEVoShiR8cooWUb2X1AGSmBjOZasc7dT56SQ+NZ5l/kw5OxelBd+4GgesE
         BAy0irSDmcybOm2VjYfJaAqBmhB+SO2IjJsfA8DtmRlTY3lnyuNIr2vc9GJT05aa+Fg6
         dkRiicb6mBk8xzS0wVGtyNdUY0UH4rhyLiADXM/vMfJGI5Wkflq6BxW/nZe/6gub1K1I
         NDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=B754KMnBn48L2iW3s26vJH+E8K9PcihdlzXUy0Z/rpcabaC8Lfe0AVIozh+5PdIHQx
         mO3q0lienlLHTwEYT87l6xdcRXRTgHzFTT2zcSrT5KCrVAnq+fBr1b3ywvW86FjXap8l
         743KLwLn791cYuxmtQXqgLvXR8jrbi6MWjjgyTbNdzQs5SUlOxdxa3d+G+UkXzqEocMM
         WWW9yCE6uEllMrJA0+IDuhJlmh4kwye5J5WUaqJ9m/BI/hh84X26mzqOVvr83tCLf8+F
         KMv5Tt3u7CZvsX+FgtizDWrPodfCPqg/bgmmhUBuLzqid2/X8QErKa2bpJlC0eTI4t/+
         K1FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhHpdifn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05620a121300b0076562644339si3837788qkj.334.2023.07.03.03.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhHpdifn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRi-0003AC-KE; Mon, 03 Jul 2023 06:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRb-00031m-V6
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRK-0005v6-H7
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so3122789f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378749; x=1690970749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
 b=EhHpdifngm5xRIl5rDfI4Fa8GsjtJ9BDXqwUtHz1uaNJbqAM1GPTChzTyjWSVKpoAy
 xx6vCx6/8M3I+EmUCqhDJmH1wci0Np90jVjpzociSeoX8bmeE1kGu6VuSfBeV7EETC6E
 V6j7wv5lhTSaBsoCk9GG7KZf5UDUSq/8XO93hg99lYDtm/56xURudUdwa7BiRT1yBrvT
 2qNFZg7CkMQY908PBwn8B2DnYRFHAvoOcgtU0d6gVngf6AId3Hhpz73HSuSH8R4Y2vLP
 MlL4jPc1zFVbqTXd6Dx3U4Nm9fjP85yaTBLmzTGwFkkQY87cn8qLJHVds4K9i68l5pDL
 rPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378749; x=1690970749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjZWs2Y+Z9mHPnjXNP6VJFYBwuCl2SNNXRyLlkiAXFM=;
 b=JXHLZQJqmBMRF3Iyndgf6WJCHVfNzEmbgrkee8uNAaeMGe4q7I3iqfb11h+DuiEEd3
 bapDmI0TB+ny5fhLETPkh8+KCG8dA9mRwbkYIBwyBfaa4piYk+pNDvzh5Dekuw8JYvii
 GfmfHOslWhYyAo0v4lchbZEXlxQIp3N4akn194T9a0kh53pW1I38oUJ65eT1CVeVWUVc
 NTroyXsDnS5su5SsIT9D9KcofLzuy63+pU+9P8Pv1SBUp7B/zIaAHxED07oo19C4lT8x
 URIWy/LgA0wWJb54IL6C1vdqfvL16usDOKsRIOGk/T+jW6xw9WBA3U4StrmEXXkNdQiY
 XI8w==
X-Gm-Message-State: ABy/qLbcyxFKTPyZKrOo19MhCmiZmRTTYCbACpxTZMWUmx0rSCyg6Ouo
 30G1mZjws3JKRvnGPvWx2JksHQ==
X-Received: by 2002:a5d:6190:0:b0:314:c2a:31c5 with SMTP id
 j16-20020a5d6190000000b003140c2a31c5mr9265936wru.19.1688378748960; 
 Mon, 03 Jul 2023 03:05:48 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 25/37] target/arm: Use aesenc_SB_SR_AK
Date: Mon,  3 Jul 2023 12:05:08 +0200
Message-Id: <20230703100520.68224-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: qFZ08nn5VlFG

This implements the AESE instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 75882d9ea3..00f3b21507 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
@@ -45,6 +46,8 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
+static const AESState aes_zero = { };
+
 static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
                            const uint8_t *sbox, const uint8_t *shift)
 {
@@ -70,7 +73,26 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_sbox, AES_shifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /*
+         * Our uint64_t are in the wrong order for big-endian.
+         * The Arm AddRoundKey comes first, while the API AddRoundKey
+         * comes last: perform the xor here, and provide zero to API.
+         */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesenc_SB_SR_AK(ad, &t, &aes_zero, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

