Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp691131ejx;
        Tue, 22 Aug 2023 05:42:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN0J6/TMvUvpZYHBbo3V4odOsTtS3aPFWv4xZuJK5aMS1aHosk6L6WIsaHj5Mn/4QxPH6L
X-Received: by 2002:a05:6214:4017:b0:649:384f:edc with SMTP id kd23-20020a056214401700b00649384f0edcmr9395607qvb.2.1692708130541;
        Tue, 22 Aug 2023 05:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708130; cv=none;
        d=google.com; s=arc-20160816;
        b=T2cO7w4rwOLaqzdLtTffyWuDcMWZLLYdPhPBiKk+3226TaV1ud1jOifzma6hjw9Bf6
         kBXkMspPgChAmcTxK96jOjZ91I/ppd8GsJRdQCya50B+bVe9zxNH0E1lOLDIuSbPbk7j
         pMc9fYnw86+++ccUqzw+9oifLN4usF7IrxivJBGooQR3C+L8vRMMWZxpeIMeQF24hdZq
         WqrfUgxer1TVnNlBxCdDEEc96gCI8v5derkBygT4nsvlvcujVEuDW/Kkj3OgP9oXOcZM
         CXjtgLC43gTbFdx9u+qRJqgHsRfwJx+sfuLpVBRBxEZvhSWedvJGG7eaYDKgQ5Lae5jG
         tpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xMymSiH1goSxgVN9+Y6AclUCQc+KR5ymy+nGsoSz5Is=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=0HMYwA67sJb5xZMWcXN1kQGIMIqzwgPFMryuTXLSDyDQOF/RZ76X4T2YgbaIsxGkM0
         ueTWLheVxoXSc0OvhdR6vI2J2njCXddfCJIGOPn1q+Z19IPDFgMap1XkronPfhpeHkdp
         Dk7o6kIz5605sw6Ov3UcivvtOriuUmqttkPU9nq5iitb+Sro2I7ACeF3ReeNdYfhWv+S
         c5JS/7sZauLq6rh2kt7TGcrhpGOuQ+rZzE0t7mPGqGzeA8OJIufKcG8Jfm4pyk2Dyzk4
         9RBBjqx36br88SAiW+2QQF0gc0/RYV/GLZ8GmlGRTBUoZ/XLHSdzO/c6xN0UhQ8q3Jvg
         36xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQGYxXdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a0cf154000000b0063ce72949bfsi1190112qvl.336.2023.08.22.05.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQGYxXdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQhc-0006b3-DI; Tue, 22 Aug 2023 08:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQhS-0006Uw-BO
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQhO-0005j6-6i
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-317f1c480eeso4007204f8f.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708088; x=1693312888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMymSiH1goSxgVN9+Y6AclUCQc+KR5ymy+nGsoSz5Is=;
 b=KQGYxXdM1kqQuEKU+AccY9G/3yCzuNZWnVjm7dnZokH6MYYqG6PYW9fNF9pZt6X+c2
 ZoyM4ccApJ+QnM+dKgL9vemOsLjwhfsMfj/642ApTN5fyaROVCpxWh3EslC5wOvAZSxj
 nLXTFy7bFW4rGgJatmUwBpkW9MQvQhHEa5SYP8QCN6e/Oo+r02ivLGkSKlLY3juH69B1
 mTw8PJ66Gs5bkilPhO8nkVvQNUOvxJLuf9YfxyGkVq8ycwrOPVKtHHrvIYZtm88ELVdR
 5//v+CxEZkFSVuutsbBQoDtvUob8J/9hL/9YpQiAH0PMuy5UhXcRZC48pr6pNzzTbOsI
 KD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708088; x=1693312888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMymSiH1goSxgVN9+Y6AclUCQc+KR5ymy+nGsoSz5Is=;
 b=Lr5V8TcaU/5TpzGfkyoPUEQjngCtxsacWFxWyIqT/Lq5/ZQkHZ7vPSHRK/N68pPsDL
 z4KsUPD5rFkbGZEP6QXpzt/xRsmEBlnY02c9igXA6LbM6uIzmfkFkm9UvuJvOehXwIaz
 0bSj8T6sAZpz0tAlPZ8ZUuqLAsP7p+ZLiIQZIAn+aNVWn/Ivvn375EiWy7ibfuwJDSBl
 lMndHM+00qxYAAAkXMCL93J+Aigu6V2l3ymWHE52Vm+uD6Ybq4egDU+lYthMFo/rmIVW
 hk+a6kPd54Ey+B9KS65yVJxYNJ6QsMa7FMZyBKRH6lP+VkS1g8X4/J4aXzS+9O0IhE9/
 qgzg==
X-Gm-Message-State: AOJu0YxDwd3fuzEOAulFSwFgJgEcn0MEFIP31pBzTetA2WgFiwvvDt7O
 pjVaLI314HhJ98gxC6G5vZKDvg==
X-Received: by 2002:a5d:4691:0:b0:319:8bb3:ab8a with SMTP id
 u17-20020a5d4691000000b003198bb3ab8amr6663897wrq.52.1692708088283; 
 Tue, 22 Aug 2023 05:41:28 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003fee777fd84sm10913972wmg.41.2023.08.22.05.41.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:41:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH 05/12] tcg/tcg-op: Factor tcg_gen_hrev64_i64() out
Date: Tue, 22 Aug 2023 14:40:35 +0200
Message-ID: <20230822124042.54739-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: /oLemNw6g3lD

Similarly to tcg_gen_hrev32_i32() for 32-bit values,
extract tcg_gen_hrev64_i64() for 64-bit ones.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/tcg-ops.rst      |  4 +++-
 include/tcg/tcg-op-common.h |  1 +
 tcg/tcg-op.c                | 29 +++++++++++++++++++++++------
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 17965faa03..e8a2f8aacc 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -492,7 +492,9 @@ Misc
 
    * - hrev32_i32 *t0*, *t1*
 
-     - | Byteswap each halfword within a 32-bit value.
+       hrev64_i64 *t0*, *t1*
+
+     - | Byteswap each halfword within a 32/64-bit value.
 
    * - hswap_i32/i64 *t0*, *t1*
 
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index bb515dfd51..a9184caf9d 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -562,6 +562,7 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
 void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_wswap_i64(TCGv_i64 ret, TCGv_i64 arg);
+void tcg_gen_hrev64_i64(TCGv_i64 ret, TCGv_i64 arg);
 void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index b1b5d9b45b..310acce410 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1876,12 +1876,7 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
         TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
                                         /* arg = abcdefgh */
-        tcg_gen_movi_i64(t2, 0x00ff00ff00ff00ffull);
-        tcg_gen_shri_i64(t0, arg, 8);   /*  t0 = .abcdefg */
-        tcg_gen_and_i64(t1, arg, t2);   /*  t1 = .b.d.f.h */
-        tcg_gen_and_i64(t0, t0, t2);    /*  t0 = .a.c.e.g */
-        tcg_gen_shli_i64(t1, t1, 8);    /*  t1 = b.d.f.h. */
-        tcg_gen_or_i64(ret, t0, t1);    /* ret = badcfehg */
+        tcg_gen_hrev64_i64(ret, arg);   /* ret = badcfehg */
 
         tcg_gen_movi_i64(t2, 0x0000ffff0000ffffull);
         tcg_gen_shri_i64(t0, ret, 16);  /*  t0 = ..badcfe */
@@ -1936,6 +1931,28 @@ void tcg_gen_wswap_i64(TCGv_i64 ret, TCGv_i64 arg)
     tcg_gen_rotli_i64(ret, arg, 32);
 }
 
+/*
+ * hrev64_i64: Byteswap each halfwords within a 64-bit value.
+ *
+ * Byte pattern:  hrev64_i64(abcdefgh) -> badcfehg
+ */
+void tcg_gen_hrev64_i64(TCGv_i64 ret, TCGv_i64 arg)
+{
+    TCGv_i64 mask = tcg_constant_i64(0x00ff00ff00ff00ffull);
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+
+                                        /* arg = abcdefgh */
+    tcg_gen_shri_i64(t1, arg, 8);       /*  t1 = .abcdefg */
+    tcg_gen_and_i64(t2, t1, mask);      /*  t2 = .a.c.e.g */
+    tcg_gen_and_i64(t1, arg, mask);     /*  t1 = .b.d.f.h */
+    tcg_gen_shli_i64(t1, t1, 8);        /*  t1 = b.d.f.h. */
+    tcg_gen_or_i64(ret, t1, t2);        /* ret = badcfehg */
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+}
+
 void tcg_gen_not_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
     if (TCG_TARGET_REG_BITS == 32) {
-- 
2.41.0

