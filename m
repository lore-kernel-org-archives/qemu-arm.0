Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2173242ejy;
        Mon, 3 Jul 2023 03:11:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7++60sdTniUhcJrsnOfF6cu77lW/dGqLRtb/A6/7LT9hlybbHAQoZrS/Uamej8CzwL8/6R
X-Received: by 2002:a05:620a:47b2:b0:765:a58f:d07a with SMTP id dt50-20020a05620a47b200b00765a58fd07amr10692177qkb.5.1688379106107;
        Mon, 03 Jul 2023 03:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379106; cv=none;
        d=google.com; s=arc-20160816;
        b=uNKyWNMCxQLyZL7A+b0dE6y6wcsjqteDp24UshCwuR9v6/ElQn/eghz0hOdDsUYvHd
         JYKpsjPKcbo3xpPha02kiGXokFR1y2S+ZCTbKvgj2mpRrbS+i0RsPpEI5i46TaThMYgM
         IuQm2h6vWeLTuK3R/fJSKau/aBTbtVgXDu4QaToh+yMqonxQ7LED4SjLv5SxWn93uglO
         Qhiko0ULv5HBtknHt6aoofGSJB2tnJs6slWx3lBtGY8PahxMM7orti1X00qMObYzKeKi
         YRk7BkhueHBSz/kP7KUOctFCefP0Ga2vN7Mou6nrcZ2t+JOtFsMQB+0Kzbdbi387XJE+
         qgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
        fh=FQ25ncR7cw8LBZuZOY4ruJQD9HNaX6V/r26L+0BlwKY=;
        b=Fu5RCuCqj2ivHDihCOXxUzhkfBfoYhrgOnnHR+i227moWD2P1EE3p8kcfA1uolMFIY
         /cH4i0XR5+FAzAlUsI18cIVvQDHe1Jx8hAHPlp30ezpCfSXF7R4NUbKJJYQFUNs70Twy
         Md1olN1aXyqtNVxvqflwAMxed2zoP6TMfebWjnFEbmMiiSEMJDAbjwnXs78FoCdBpRD3
         GEOD7DHjxYsdYnQD+uhNW5sfkKpPex6sZP54emdOgGlNHs06uEUbnZcDUSd47P5DjO1b
         WJyZGIHTO81txMDDPzg0RKXGE6MePndc5Ul7cUEnPP+KAcUe4o64yN5WcfxZ8O1zzOb4
         UthQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mZ/IrUE6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qy3-20020a05620a8bc300b007608295a685si8489447qkn.689.2023.07.03.03.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mZ/IrUE6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRb-000317-L1; Mon, 03 Jul 2023 06:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRP-0002np-E3
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRG-0005rh-Ac
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d20548adso4721947f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378742; x=1690970742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
 b=mZ/IrUE6/4Sgc7ls67lO5hlJNFTZGJQuyK7rU1pjq5w4o6lmCQ3ZvRKgdkDTa3x8E2
 zm6IPnPCy7j0qoUidc0jppHp2jbFqqLg53fbc6cCyForMLD1L5PIDqSHUtlwvrvd8YTH
 p3CF1k2n7cAA51rQMEZS69yxqQIUSq0ck8zNOypaImnrozJ1CDylJ+XOhlWh9LLtgrdX
 NlVvFiRn/U0GzTKneyOGbBnNw4jzr63IrACpyibMdhdCmpwb/NXdKHtGeHBg1KuRQ4D2
 KwpXe65bd3x8PL9XHQ+A1Yyi3ioI6cruO19juWirqoUisX9Ub4ADWUWzNIulDxCQFS2O
 T8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378742; x=1690970742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
 b=jpKcJm07ZkjnQn2cdTqekN4H/llrBJmMvdXBjravONxTvRb4joztuaQRBn/0GEc/qT
 IZWK3wpf7PPeXFV51pSdErIFJo9jJA/rmhlRb02p06RE0LvpF5QlNtZGqCrSnjbdn+2S
 x+yWAHzM6msJAKLsi69xPMTaidZ/m+HRQh3bpl1Mo4GXL+vTa1tcrxpeUslEMyIcjTAC
 MCgESghHA/mMTBZ0LC5fzuhNyJ0WFRpUEs9kJVkSW2p8OnBntLUDo3Qnx1yURJPQArjk
 b2jViBI3rqeQMtTfGimO7HFrgStgOYLfN7VuOByLOzhKJuQqxApfYlc6pIXZCj3RFV84
 WuPA==
X-Gm-Message-State: ABy/qLZZ8jKETTwgNjolus1RyTQ7blP6RhNHYpaDngGSdKBiKaVbSTaY
 lonLM0WguaZQlxvXzPeDn4ySOw==
X-Received: by 2002:adf:f14a:0:b0:314:96f:bb81 with SMTP id
 y10-20020adff14a000000b00314096fbb81mr7292123wro.22.1688378742155; 
 Mon, 03 Jul 2023 03:05:42 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 18/37] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Mon,  3 Jul 2023 12:05:01 +0200
Message-Id: <20230703100520.68224-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: CbU0axUI8lwg

This implements the VNCIPHER instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1e477924b7..834da80fe3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2947,22 +2947,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

