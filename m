Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp357287lfb;
        Thu, 2 Sep 2021 08:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoOTmlmWbMUvSos4YLHUE2ydmmvkWSACL4SlgEfa3n22Z1eyiVeawKUFq4+wMExivXS4QI
X-Received: by 2002:a17:906:520b:: with SMTP id g11mr4283769ejm.502.1630595386943;
        Thu, 02 Sep 2021 08:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630595386; cv=none;
        d=google.com; s=arc-20160816;
        b=p2iotEXhSUkZSxHDubOZKKT/oOwISHT4u7T5VMwBjVQkXx9m01ZvXdAs9t85gze+G0
         MfZ+yBYUtINbIFqJ9EuULWpHJDyln+iNXNrV1WHLNbpKhghMhcpzDpAOx9bIVV7ErP0n
         C2BKbExsQC1/xCYFiFdGVegGpwziVBJkSaHNZPYd2RpCTpw3rg4z1Vu+gK3zxAOPfmkD
         yuGXMlyBp4zUuuTKBhg9daeRLaia+k0cLPXJSfM+7QAmMxYkC68pxQTVzA4HO6HxEoSY
         9bwB1VJp/5KPJpfIQYAxcEYyCrEDs/WtlVuqbsJrPJHqquAlm6+LE2G7btQUXtgBw2Ot
         v84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zzmLZYqNkL0qfTbdS2xsSiJj4fXt0+iIGVR8nAz1VxA=;
        b=IDaONCd0cL1Jgat2PCQROuiOzyHLxxCRLkdrkmTMqGRy9svSv1Q6/Zy/kcZBY9susa
         QFneoeSVC3ly2WMb2NYWOff9F6ayV3F+aYwt2OpJc36plbXgkdRtGL1L0SlHOwUuQO4H
         ylwLeQNBAeOrjOPfDmfHgV4kEZOoawof32y//zk8cxAW/ozI4HV4+bDEK+HoScZHn/Kx
         nuIdmPzxB7aJogq6T84SsmrNbtNdbSgL1oAonvxMn2847hyvEuWXWSeR1YgPHUxU3Zr0
         HIvYYgaxWbSLynmNR8X9QtrtNvEp9sud6gbfTrK0G9pKrGQWBDmhxfdHRsTPxZWw3EK9
         lGiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXsDlD8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si2310804edt.397.2021.09.02.08.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXsDlD8u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoLa-0001Su-2R
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoLA-0000a5-83
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL6-0003QO-Pr
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q14so3477831wrp.3
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zzmLZYqNkL0qfTbdS2xsSiJj4fXt0+iIGVR8nAz1VxA=;
 b=OXsDlD8uEnyvc9weEuttBAmWjGT9tUr7KFFDKESQ8eEGUTNqKlhGaqAACkWg4Zgtx2
 x4kQ+TesPuE5rT/0vk/Khz+50Aatzk9Dhm8jqOOXmxICrFJIUDIjPR4K3PMhjWBKEJQi
 ivFppqa/vuDAI4JYzNaMErmaeSMfcUUpkK8Rl0G6cRhzAn/acTgEs8IRw/IqekP8wuXk
 fzJulKY11ekwuBUDoWG07/sv9HMuv46NmAUXF8d0NbsZZPjuYzHa39TSz3B2RADylB4z
 0E8F/s4QbzMwRvvf2gpWWmwKied9KekZQG+wS32/DJl3MA7r0K1VXvFrKEKAVB6opXZA
 jiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zzmLZYqNkL0qfTbdS2xsSiJj4fXt0+iIGVR8nAz1VxA=;
 b=XjSuq1wDF9ZShegNEUfl+4SBfiZM56c/oAn8/XA9A5n8p5VfQYe2uoSSUGjpEUQrkV
 k/a5ATVgy0ZDbq2qEUnC7XqlUYLDcO2BfHlj2A3Ohvz69i6Qw78+2eZMHXWzRil21Ynb
 lmnaXhfeM6QmTbN3rpHMAw27KO72BGm3d0hQtLkMYguKP7aDGtyQyrgivxyHJy9LSRvi
 V59pC+WTvLBXXXYcdAMKD1z+y61sa7Yv7eoPSB/yebe4VAjZGjRS0os5Di04Ii7Lbato
 Z76vtV/b9MDPVOENmWS4iW7IUsu4p2gP4rRaP7xbBHidbwp2eT4+5GSpQVv90qxH/7ac
 C2ZA==
X-Gm-Message-State: AOAM531/ARxve8l5SLLaaArNiLYoUuC+Pv+frdNPzjZ07EXxcnDWBGMt
 f0tGJJDWrjpPbrTFMoXkVOQzZzjp5QKvDw==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr4269020wre.39.1630595355226;
 Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Optimize MVE arithmetic ops
Date: Thu,  2 Sep 2021 16:09:09 +0100
Message-Id: <20210902150910.15748-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZcS7SaBAo9vw

Optimize MVE arithmetic ops when we have a TCG
vector operation we can use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 087d60f0d81..5bc5a3a2063 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -827,7 +827,7 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vpsel);
 }
 
-#define DO_2OP(INSN, FN) \
+#define DO_2OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
         static MVEGenTwoOpFn * const fns[] = {                  \
@@ -836,20 +836,22 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_2op(s, a, fns[a->size]);                      \
+        return do_2op_vec(s, a, fns[a->size], VECFN);           \
     }
 
-DO_2OP(VADD, vadd)
-DO_2OP(VSUB, vsub)
-DO_2OP(VMUL, vmul)
+#define DO_2OP(INSN, FN) DO_2OP_VEC(INSN, FN, NULL)
+
+DO_2OP_VEC(VADD, vadd, tcg_gen_gvec_add)
+DO_2OP_VEC(VSUB, vsub, tcg_gen_gvec_sub)
+DO_2OP_VEC(VMUL, vmul, tcg_gen_gvec_mul)
 DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
-DO_2OP(VMAX_S, vmaxs)
-DO_2OP(VMAX_U, vmaxu)
-DO_2OP(VMIN_S, vmins)
-DO_2OP(VMIN_U, vminu)
+DO_2OP_VEC(VMAX_S, vmaxs, tcg_gen_gvec_smax)
+DO_2OP_VEC(VMAX_U, vmaxu, tcg_gen_gvec_umax)
+DO_2OP_VEC(VMIN_S, vmins, tcg_gen_gvec_smin)
+DO_2OP_VEC(VMIN_U, vminu, tcg_gen_gvec_umin)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
 DO_2OP(VHADD_S, vhadds)
-- 
2.20.1

