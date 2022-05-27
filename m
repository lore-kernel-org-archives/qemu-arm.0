Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1251719lfh;
        Fri, 27 May 2022 12:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysq7ayU0bMXZRl+kCQpcGJgDjGDgnsQuzrABJnXZ/fM9hDLb7c24Yi09cxzd9iJgXfmvBD
X-Received: by 2002:a05:622a:3cb:b0:2f9:121e:6cd5 with SMTP id k11-20020a05622a03cb00b002f9121e6cd5mr32504633qtx.277.1653681058478;
        Fri, 27 May 2022 12:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681058; cv=none;
        d=google.com; s=arc-20160816;
        b=zu2p991UO9G0gyp+7cT9Av6/1RY9iYST8Y4Dx8neALgFA0CQXccF8xwt4lxHHdGeyu
         QExnsQxDB/Xl2SOwpWfRmm8F4oPkAOHBSpbiM/wIZPYghg7OWRW9GIJohhVnMEptq6w3
         XfhDBmzS5i6DF6gxXzjIJ878Rk2ROfjujNYoLUAgEyhC5freQTyOREvQG1xDqZ14lsQK
         /HEvvDv0H5Tgk3rOpNPEghfkngH+bHuJezFvD+EuvnNsW6/VIUqgkz9Pf9/3FXsSUG/h
         xnTu2x6Hm6qnalViL7wH2avCehTYN/8Axf4X/d0Zyols9Fem6ggQSIaYjjFFWKpxE9vc
         jUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JvrU4z0qiF+X3gMipUoQGDdO+V7kYOeb33r3CyRr2Uk=;
        b=BpmjF+sjSf8Ei7SRSiVUf5pksrwkD7RD4D3w48KmHE6LaAuZD0euVgeL+bRYgDCIFV
         iyL37ElaWkoBsMSX3yZxIl2U1Q2J0ssp0ree0VrRziBbXRlFgLT5A5PbNnSY7nnOaKUU
         xT5VtSmuk/SpnujM3p7JJlMj80ew2mEX+FzIflRiU1acWSNjBcQkP9yI6DQf8UBR2gBa
         IOcxvo7rSITzJOtXFvxWULMj39qU4h5tYNDXnL1C+MqRiTj7w0XrjoSIV2HW+fi4uW3K
         eTAXsJtEgEniI8bjTvrS+a66CyKK83x0FSGTVJbbcl/XYE8oV25UVPEpx4V1CJ4svxVZ
         vDPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U06EBk92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a37c209000000b0067e4be2382bsi3085902qkm.112.2022.05.27.12.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U06EBk92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufz7-00026U-V4
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecW-0003wF-88
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:32 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Tx-Pu
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y189so4966196pfy.10
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvrU4z0qiF+X3gMipUoQGDdO+V7kYOeb33r3CyRr2Uk=;
 b=U06EBk92PJev2AFR1CF5TXFCk9MJPvEzEslmtZ+BcKs8G9JM0HOoDSzlRvuHFfHlcb
 /HAe6HLbgZClkMzkMN1pFz9UhHTdawnAuro23Oo70oOfPEtVE81rIm2c3djJZE/o9Z3f
 2zjLI83NiH1Kd6Xzhl0egQ4yUQD57yFVYExYp0fP147Cnjv6cMHLNJZ0IK8ZTQ92yEj+
 pKNsP4R8rcl1GCrM+953wx6hb0uDW+ATiUxVVsK03rwza7sc2mSAL7jeTATMe8jOKvgM
 rV6/koeRiC1SaTx71MVPtT8Yc1cBSDqw+52TY1ofW6bCQ8oa4U9ISiCK3hjqcxbTq5Zd
 uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvrU4z0qiF+X3gMipUoQGDdO+V7kYOeb33r3CyRr2Uk=;
 b=m1rt3MrwkOYFFqGLLQddYF4FQDbk8I8PqC7y3rkAWPYdZn7PbxJhQ813ER29aFFx8J
 DBR2CojUVfrbFji6TSb/e4ctBEA8gNEprL2Irv9BGCWsbOzjDrEI1T6qS7GIecWtZ00C
 vrd4WpKjIbUjeTEQVOduCUtGQU8F+hrYLt5eP7pSRIEiOyMOZ4RYKN0iKTGf51JeFiJU
 Z2vDpNQoo+sLRDzTcMTq4n8OQRMiPiHtEpnVQBP6czd2Cem8fPiHIBUUttn192qUCIXS
 p+DjSYV1QyNyzBbm69hEPlmFFRfuUqS4Udiis4sr1gfS7AjN5QkgRDpIdY87Z+0aFYTj
 3Zag==
X-Gm-Message-State: AOAM530+wMkAKgqwRbhABYxLmKivhSP6TpCQpgFwQ8EehrzFjL7bPSjE
 +OxCFUbPb6v+rC5HNWkfaMzpibTcdxUKVw==
X-Received: by 2002:a63:ea4b:0:b0:3db:5325:d55a with SMTP id
 l11-20020a63ea4b000000b003db5325d55amr38284598pgk.588.1653675792798; 
 Fri, 27 May 2022 11:23:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 070/114] target/arm: Use TRANS_FEAT for MUL_zzi
Date: Fri, 27 May 2022 11:18:23 -0700
Message-Id: <20220527181907.189259-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWkGtCk+o9O/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d44b24e988..c0781ecf60 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3315,15 +3315,7 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
     return true;
 }
 
-static bool trans_MUL_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_muli(a->esz, vec_full_reg_offset(s, a->rd),
-                          vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
-    }
-    return true;
-}
+TRANS_FEAT(MUL_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_muli, a)
 
 static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
 {
-- 
2.34.1

