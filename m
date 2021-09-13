Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3512751lfb;
        Mon, 13 Sep 2021 02:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyKAsoRuGiG3OEcThsm2P8RP3w0vpgpw4g1qxYng9GDLzjHXnAv0DUaBvFX2Yc7BnsvHxQ
X-Received: by 2002:a25:2c10:: with SMTP id s16mr14143922ybs.428.1631527048879;
        Mon, 13 Sep 2021 02:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527048; cv=none;
        d=google.com; s=arc-20160816;
        b=i8Vd1f/kSMsPxyA0EdAWgwprVX1EMmEMkcIivGRRIr0fxwFacth1VTuosJyrno0wmn
         g0GSp0+yLQssZNXgz+UYq59wUnoYs8rpCJGMGv7jvme9yruUHWR7ebMdRMZueZ0sRjN9
         JgCswUXWx73MeyKshn3hcqtNp8rdNVP8+owTbwahHxGbAbY8Jkw8hgZk6DThMGQMvYdi
         GvkE7Qw1OtBJnbbAtW+5H0VMUBwGOUk2TMWTql2VuZcheEYoly5mT/lEjytY3IiK49de
         MtllI+qy6PjfOO6SgtceTyD276VJ/wP+qEVJ+WK/TwyZooADx8JbLb0hQdPW2VxrOP+7
         IF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yVP8w884M7PsuH2MFKMpdcPSHj37im3UZvS2k+7d9X0=;
        b=YtML3ha+Dn8OhqclMwTLAiYze1etlfcbXzZL9bSoiV+WeSJP89F1B8tgRG3YNj5Txy
         egDUJCNnmgOIQp118UQmUilOWMwsEaSJGkTqq687swBHAD0cJj8G9GHH2/Om/IcRECnm
         m2EYqSUik6dk9qWiA4lGUvTtURah7+GZqJfcLoPmUPvmjhislkjW+rPnBKemmUWGPKxc
         tiPU0DM1ukxt4xk0q8T/lzmu3nkJSBom3ap5CuJvNrxrVAmZyljz1GgxCuseS2GPG/MH
         qN7wstN1LlAL0N6seAk4oSl9aRC/Y9ck0GcGAkfbl+qr9oqhikIV5Cfq4vdDzl1iuZAC
         cJCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQZplLa2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si7076429ybk.186.2021.09.13.02.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 02:57:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQZplLa2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPiiO-00021a-73
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 05:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifu-0007OZ-FI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-0001ua-KO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so3629758wmd.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVP8w884M7PsuH2MFKMpdcPSHj37im3UZvS2k+7d9X0=;
 b=zQZplLa2SUhwBPaKoUqDdKUDr51+HQ394FcWsUkX18x0wlqAhb3i2BNRnrgeguyDpz
 u95nGqtzcF2zLcc+7Mi3/4R0fHPtzx02llrASivRkSLpZVF8sXH4j7bghPBq2YOiGWWF
 X65dzKu4noU+IxAgsElc/vIzlBoHOFx0OfiKIJ6Pp/6lHuigXFvaZ4DiA3SUZ2Z2wogO
 SjPpyf4k4VgrpDZvj29JtUL0F1Mrq8o6dqZC77Oeys4wkZgjnfArA9hJS7MUUDT6S14A
 OLngv91iRPeRrNUmF9Y5L9VDHvPQjsiWsrrZhAhDXu8gDExUEGKOD3qtetb1NZO44mZZ
 lKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVP8w884M7PsuH2MFKMpdcPSHj37im3UZvS2k+7d9X0=;
 b=eDtVBa1+9qatTek5sm53k/d7GcGifKnhrfYjO1MY38PIwHZ6rLN3wjlozN/p1rgzyA
 SyC2+E6jWDkbaAtSqoaWGxAS2GkiOgdfDKNGxV+Sc/fc/2bNxfDitQ5UZhdFJkw72wjY
 DbfOWfdPkt4hLmUy8fZAa+g03KQbG7MxU818wtzc0ag5ryfD4+lkjRSRlIriNX2EAN0L
 rEOLBW/xjpnP1P5pCoH8bBF4xAPAHvlMqNcsfif+6q70HYJS6i/M9fqvBfpsmH5VRAtI
 2CMdZsSsjmLtqYy88J7VRxeVrkm532kJtr5iP0rWwIJcuEbpeOxx4yQ2+sEU9srwSeHv
 4bSQ==
X-Gm-Message-State: AOAM530vUazCLlJdKQZ67kU4vLPOhZkYjYXrWgNA8ntcg27r7OatrUgR
 ScvFRxfpgdN/45Tuwgg+6WvQPYBJ7e7sHw==
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr1230272wms.106.1631526888081; 
 Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] target/arm: Optimize MVE VMVN
Date: Mon, 13 Sep 2021 10:54:36 +0100
Message-Id: <20210913095440.13462-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+gn9kS8Zuva

Optimize the MVE VMVN insn by using TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 13de55242e2..4583e22f21c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -769,7 +769,7 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
 
 static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
-    return do_1op(s, a, gen_helper_mve_vmvn);
+    return do_1op_vec(s, a, gen_helper_mve_vmvn, tcg_gen_gvec_not);
 }
 
 static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
-- 
2.20.1

