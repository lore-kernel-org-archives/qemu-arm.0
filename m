Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2599203ejm;
        Sun, 23 Apr 2023 22:50:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCms17vCdJW3w0Yak0MhoiYZvg7mJKt27GJuImYr/5yuA9LLoFXp/d6+X7h1N3FHFTWPZm
X-Received: by 2002:a05:6214:4108:b0:5e9:8487:3978 with SMTP id kc8-20020a056214410800b005e984873978mr19664461qvb.41.1682315434934;
        Sun, 23 Apr 2023 22:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315434; cv=none;
        d=google.com; s=arc-20160816;
        b=eD6WogBRSgON5A+W2B9j9En+7k7L1LQGET9hi+6NZOyFiYrFZhYIKTaF/SMABhZE7/
         6z9slGGvB1evNxLF4nsXUGFnO/7AXJRc8qb8RDqYgiRibRtAUCfG0uu8svbftQjJ+zw6
         3c6Li6uvZhl3FGl9HkirQ60/6UB/v7vsIJnZuFlKq6XVuizCHfJHYz8gYfDqwoZ2lXSW
         6RBNj54KqaltLd8vWdx4sRqA+W1MbWtd4X5V4tE2qKuD7kP8CJ0gSpdYwH9QnLXffYZe
         PL5XurPvxul85nTIi6LiC0OCVPu5FWDnmsNiu4bMIziQa7J/eTVe3bhZKgHggAAuzhf8
         OAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
        b=lzLEnG4AhcshqmQzRyT1iuZdTqeMs/uLupiwozVo21mXH38vJ7Zq7KnT5+vFBsMLUd
         GdB9m/yDqt6Dnn5pIjk+LDEmQ/rRnpNh3Xeq68ZGYd/c4Ipo1tw48XEh+B4z/CWeigk2
         VTtYRZp+l8dEcPCTO+9MnCMnYs78VJOXTFUqvAHtgmwhKMN0ScPOOLTvDphOf5tm77TR
         hpld0zNbkAIWeWfdrZzlu9ageLQnjTfUdR15GAlDGv0r5/9cQjH/1dgIgOdL7aIhy2us
         hz6spEmYYGEhNGgKqfXD90cpyGtid2TRRhQ5GPTaRkLN6NeYE4E/bs51SHxZ6t0dP8et
         912A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OAj6GX7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140cc200b005f0f0c359c9si7227746qvx.11.2023.04.23.22.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OAj6GX7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqozw-0005NV-Rz; Mon, 24 Apr 2023 01:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxt-00061J-Hr
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox4-0004SH-P0
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso30735805e9.0
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=OAj6GX7mCKtoLQ7ZQ2n69KRgT1R41mubfR5kqKBABUgRb0dxXq1O5JhtuvvHx57jl1
 /cPuK6vu8xoWCSU73Z9YqkYXufaDnMRTjkEK52zbfe0uUmZueMLMWgL0yJf8zuhiR1Cv
 ojdNEQXGq1grXC7mQYPdCryrJzUGZFP6aG7O9R7PhYDCtfYPspGYbmnXgWzENnYaN8yg
 o/hAaTKa+jRu74ubghrNbxOo/s19PXul8F6zGftuW9wVgjcgEMfPWwCVVHoxYyWDJCH+
 DW4R0edTNzqH9ezfxGvVScSzdTTPmyQM7kA7AAQs6jQ6rVrNzx0prI0naX9RWLHXi9cZ
 ycMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=PzajcBlXHgmSTJxE499kAfSGULAMTy34uIVsM/QVIlGsGbYt2KsAmK+kG0uRf04xsR
 4v2JcEgiMR6ssAo1H3vPUD+na4KxoIvY49E+khyDMr5bb8w9FE3HUsH1Mogd6bR95C6j
 gfNNFH/8+7Sh0iaXH8mYACt0taF6hqsbIQTgp1mNlETbTcPKJ39JPEjKyn7riwxulWtz
 zZnztDY8idcvE65hpXOhyIJ4Fh/syYHkErv9Bef9TQcA9k03YQ3xOSY7HWRBWElfwtum
 SVFezsANPTOGhsKY5fs53bX+/Ql2qIQFFqivnU1l9DafBYW3/hgDVAkOp/qvNq5dVt+8
 PzxQ==
X-Gm-Message-State: AAQBX9eioHvqba/VwfYsvzuhBYnroYrl0med5CRfNRHIFa9GlKl6djou
 BNltFuJMpy/Tnr6/iNWoz2odzg==
X-Received: by 2002:adf:f70b:0:b0:2f9:eeab:4eb0 with SMTP id
 r11-20020adff70b000000b002f9eeab4eb0mr7857678wrp.34.1682314884919; 
 Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 32/57] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld
 data return
Date: Mon, 24 Apr 2023 06:40:40 +0100
Message-Id: <20230424054105.1579315-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: /Zg2/UmDNfU/

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4f477d539c..dbe4bf96b9 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1

