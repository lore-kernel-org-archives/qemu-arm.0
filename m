Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103878ejb;
        Thu, 8 Jun 2023 19:26:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7K3MpU/5yFYXJkq6/4utBUNhm4hCFTJJCFHYztWwC3c4LVKnoauCMu0hK5JR4z6G+2PvW1
X-Received: by 2002:ad4:5d68:0:b0:625:aa48:fb71 with SMTP id fn8-20020ad45d68000000b00625aa48fb71mr314136qvb.59.1686277593528;
        Thu, 08 Jun 2023 19:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277593; cv=none;
        d=google.com; s=arc-20160816;
        b=dsGAgWunif++wBl66R4e32Ko93Rudil9TIiMymSQbZlcgygFNS7KctZ9CxgRubwdjb
         zu7DULM9O0P5A1G1NGl77eSg7/y6uUnRbCkh42MDR9HF4VWnGAjmiQ/EIrXyFFYhSYCI
         1fBYOsX4Ck3o/JtIzI0kGHxYJVzMAHAM6ydRQYluNzHT3SieKzWxtep0m39aFLtX8RbF
         DS+OuXRHO2y1onkrK7+xV7CHho+VFlg71pNUfkj9dXMYu3n5q2Pt3zSoFhYwyfRn6+Pe
         9D17uwVY1WdGKX5N7EXOoKpw+Yy6E55EzcLtrEFBKFjP/moBn7VmValNWNGshkDBErGO
         1BSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
        b=aT1XrXAbHh0eUU/qqvbhnhcGbQ4/GTy+htGv+s5PwkvqPmxuEGk1WbFtn9J5jtjlnq
         UfExV/3KOxCfcls3bnqwvkOxNbM9S1X5VZjJdgMt6/SmE8lZB8ZbezIEY5QC+TLIQjwK
         fD6CzaXvAKiMQVlyrvEPVq+cRtti416jzzU3MEApCvXqIem/cK94YwZk+V9z4DE1e60t
         ZRUej87CXbuwUxqytXNPAqlH+psiZ+Qi1px0duaYlnX8MCO/OOkw5QhI2qyxRRpuhNUX
         HpHbu84eAx32aR9q56oc4O/xFRHZQykAovVBNc4V3QmbwtyBLZz+IBvWr1z1uksgGL9/
         Lj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvuSVdUs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020a05622a028400b003e0a1b7503bsi1543089qtw.368.2023.06.08.19.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvuSVdUs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7Rp2-0004OW-L7; Thu, 08 Jun 2023 22:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnv-0002sf-8y
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnZ-0005gX-3P
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:42 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-65055aa4ed7so1049794b3a.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=PvuSVdUsFfVgUkl74+RoDIvV8K+LDpzvs4YM1zaTYLNZ5B7I6oMGsgUxJHN1OKimbv
 Nu2wohnKhG51RoYO7q/g5zqwqIHATnG/RSjbD5+LZsmQlxrbFuh5VMZoGmURo8WyyRV5
 E693Cj3Auj/dmPjwdWJPFxAloxXHRGKKG9mLRTltvTv/a9WFhnQLy5zTwCTjDlwbK/aZ
 dielY5p8Oi+YA9kQi1gir/E3ssJ4iaQowgtGmvaBfKlrSbcGMu1zOKtNKjeMNdQ3KVwq
 AUjBUZqDuHlhAbJlsQdUVKSflIq/xt7rHHUjh/rcdUwqCIbtGGul9KwUSW7aKGvSCxCs
 rITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=MC7EGdmZDc7GVQwh32HI2kF9fs8V8jAGgXjMSrU/xTlRMfvk4TPf0v8pG7oX+W2tWc
 tbwZpfLpMKKcPIuH+FcUu39wPuNtPVFFaHmiLgCPLX5L0UewwOXIfowelzuGZImkushf
 P480CnMhSJlDo7QVKRtqkAyLLGSLqv2KgRMxwQ2bPMsMXx2U6uI3MVAKPyvS13ltmiyG
 mAva+zUcIrViI81oqKYhrP0KFqz7J12Ka8Cw68IbCtxl9oaVD9KgfLtEG0wMEBXBJHnj
 KOX/W4qu1ErZ9Tb/OPIKZcNycp56NQKyB6nWxz0hGWzB1xi9fkN01+YAw/IKvb5C+dys
 lu3g==
X-Gm-Message-State: AC+VfDyYOeOG2oPsMAARBobdXwtWibwMdWUPdg5OL9BTIBzz5YaO5m7L
 kuRZCPNhnbYL0vg9HehSKQBNVO3DPHeuRSBGn5E=
X-Received: by 2002:a05:6a00:228e:b0:64d:41d5:d160 with SMTP id
 f14-20020a056a00228e00b0064d41d5d160mr3122pfe.20.1686277459775; 
 Thu, 08 Jun 2023 19:24:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 18/38] target/arm: Use aesenc_MC
Date: Thu,  8 Jun 2023 19:23:41 -0700
Message-Id: <20230609022401.684157-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yMLS5iyKDDVg

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d2cb74e7fc..1952aaac58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -124,7 +124,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

