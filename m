Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2081464lff;
        Mon, 14 Jun 2021 08:37:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvzhTUTnbTkCZCU84LDOfcIYx9fsC54o6cmPvs7C+Vth13pO1tUdtYsru/ED4rvIIJi2jq
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr34047633wml.7.1623685078998;
        Mon, 14 Jun 2021 08:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623685078; cv=none;
        d=google.com; s=arc-20160816;
        b=NZ2L0zsaaS8Yu3fE/vUVx3H7/g5nm1AJEaWKX9yIOius1C5r6kvxxggdrXz2CH4oTx
         ePfqFMI5qT9BWazuxu6hbu1PbQlCXb0T+Dhf8XihK/5f4SsJs9qq6W11p5SzeZFVJ1Z9
         eztqQyz71gBfENlWtzmZ4ECxozOGppayh7immc1n+Nxlv3rbYmqTVF2NDFJIBtj4/u8o
         qy/7+M0jhIm70F1+KPF5ooINBpkeNW00bUCuv1I2sXaBgaz8JKzbX2UN2YtOfry2R4Cs
         D52Nd5sw8/xxFyQzSl+FYTF35+3Uz4yfJ6mbiL4eTYYLgt29T85q5JM4njc3AXWz3pLz
         D9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pXKLq4IWzwB8a7exI0ATcfyE6c6aurU8O7ne8/U7pVo=;
        b=aG55GaFgMnQZpYXvjzZjwqd9evER+YbW9UDX6+F6dUY4Te80V3vMcGgSGCWX4WIsND
         FDvLvcsgIP/lG3YirlHiVOPIj4KXETFExiVJvx8ONW0++OZ5hHlzJs1NxF7vukxHhbcf
         vduW58yZDASRKzZles1+pJ6ymyHR3mKftX/z9wPkmz1BuyDMuX4nGe1/mKkvp31Aq18C
         blt/ecoG2Ud2a5c58CySmDL8wIq8QNI4iNifwd/xw9BytB6w6UwH52YPKu85gCQ8yW17
         IENusMcdOcbVj8rN289Wucx6R+rdysoWPixKhHaIlvreFMMkXOqmMzah8Y2UbCKxp3ou
         MdSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFY8sRLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si24674254wmj.65.2021.06.14.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFY8sRLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsof0-0007Ld-4W
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoF3-0002RL-1J
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000aq-IE
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:11:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i94so14912275wri.4
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXKLq4IWzwB8a7exI0ATcfyE6c6aurU8O7ne8/U7pVo=;
 b=tFY8sRLPMA0HwatcQld48nOjyiEQnyf96BaCkC+5WD3mK93rGnjue6TG12iWRMuwc0
 /Y5vzta2PoFn4OR5obp8jhamV2CE/zgQhLtWSr2PA5E3GuR1rNR98/TnuNozvXKl3Zdx
 oJ1nYgWbdph3bBYxogoTecx84LrLB3C3gwgWN9LyW+qq8x02ea2vpAdADZHiTbgakAIH
 YXSJ609VnWVcN0xsfIAxM2Rc/bD3PaFRd4rq4KXs31fgP0rt2FHX4NCpVOvab3SCBCPL
 RhFEOLRy4F4dd7/fc3RKFgdqwdX9cPcNmrwTQKdknPfNXlsADMmRXgncAcVUZ316D7uP
 EqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXKLq4IWzwB8a7exI0ATcfyE6c6aurU8O7ne8/U7pVo=;
 b=a4d6eis87lwre186ZgPwiYioSf/0aJxsh+/jP6yXaZ7+gzwEkF/BTdy9SbmfIslT+s
 +e8xwXuz7NjsxOjgGnSL5n8zWILQf0ZaJ9Yg4VkROdVZ0hOwAEM0KNWqyGwTzxrVsxMd
 qmM4NT5j1umSnZjM8IDdBGAAnTwL7xuaFg1yIIs8Pke6xcVpULEOaRBr0r/9OaetPoRe
 9xJeDvUBC6rcsUC08dGMJfGJOdMpJG59j9iu+6hu0gbeINHBhUbJvzJzGuWy1Ujb8n6B
 FpV+pEdJwxo8dnrmeRTvtN8N/tjh/vUJKCaqTmW3ZU2M2xwUx7bH9rwAqvYrPr7IaHGl
 qOMA==
X-Gm-Message-State: AOAM531QS0fBAz/HCqssXtumTj1DOXYlRcLJlX1/XwPWV+OVJ6t94D3/
 pP3lRAYs2cDSr/R4ICsDfISoPjxzja4b/g==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19310748wrt.418.1623683449285; 
 Mon, 14 Jun 2021 08:10:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 48/57] target/arm: Implmement MVE VRSHL
Date: Mon, 14 Jun 2021 16:09:58 +0100
Message-Id: <20210614151007.4545-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j//Jilqfe6ro

Implement the MVE VRSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 56b3e8591ad..b7e2243a19a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ebf156b46b5..c30fb2c1536 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
 
+VRSHL_S          111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+VRSHL_U          111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index be5a1168c6b..7f0eb207155 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -538,9 +538,13 @@ DO_2OP_U(vhsubu, do_vhsub_u)
 
 #define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
 #define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+#define DO_VRSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
+#define DO_VRSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, true, NULL)
 
 DO_2OP_S(vshls, DO_VSHLS)
 DO_2OP_U(vshlu, DO_VSHLU)
+DO_2OP_S(vrshls, DO_VRSHLS)
+DO_2OP_U(vrshlu, DO_VRSHLU)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a0340c5e993..f6ed15b4aca 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VSHL_S, vshls)
 DO_2OP(VSHL_U, vshlu)
+DO_2OP(VRSHL_S, vrshls)
+DO_2OP(VRSHL_U, vrshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1

