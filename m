Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3697212lfb;
        Mon, 9 Nov 2020 06:53:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm2e55Yx9d2eSHjfvcImSuWCwXKhLNmTBWTAolTzA0XwGIFx+tBTujCN5LEsUH4uCdbS8Q
X-Received: by 2002:a25:320a:: with SMTP id y10mr7460280yby.482.1604933624136;
        Mon, 09 Nov 2020 06:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604933624; cv=none;
        d=google.com; s=arc-20160816;
        b=nDCKjGll0B11lIGHDwbksS0lPiDxRLR09LtFhGhNKqxcl4dmaAfe17BZ3WuSapxPoX
         56oArDxFZlAEQYjTNdfFwCSqhGWyj0SpTJMTS26FqOmVLZZupvNuitydewB+uuBh77RI
         IjiH93I2FPfAQOyuutJog8Ti+7y3ZuD/YI5Itdp6BP9oWh2k/JLn35cNDMXgX8f6cl2r
         cJw2lCGvpq5XSXFOabuhwApMRnpUVzrnL5VyXYU3IQVoYtOP1GW4QZ/eHeIeAh6xovUj
         O14hotUT1Rt5rmwSevTQq6oVKc4ufH1v5XWs0Yw2oLHNizY6RwDCRen711iCIDiMSAg3
         IUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NJhGAXP2h9Fo3Qoy3VCI1hDmptB3uQvjfcrEm2GQu4o=;
        b=T5TCgiL+iIaw3jUvb+ke+5DeMbkSX4Wq9J11609uJtXR2M9onaik76ULYwiNDkZH6g
         bcC2g/woyE8XxBCRyBas+tVEzPgkqGT0J/jFJvfs1dnadVlvExHVTqZmBbETT6PayST1
         E/3neY0lAOKjSkrH1L/F4f+R5NGP+uyzw5TKTzwdVcch2zWAHbnwbZaKYOh7wp6J3Orx
         7O9S8RQ/efVXjnVB29YPPq5/5C0jksTxcYkIqFFzuzC0aik+rsNJBNuU39EflD3j2S7C
         hjnWCn3BFCBZHiXfgVDJUXlpzmJBgFAQ64HnpUj507FTyi4gr6canto4iprQ5CCZ+Vwy
         F0EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XDlih/Yv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127si10764970yba.167.2020.11.09.06.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XDlih/Yv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc8YB-0005KN-Hd
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc8Y2-0005I6-3D
 for qemu-arm@nongnu.org; Mon, 09 Nov 2020 09:53:34 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc8Y0-0000Pu-2c
 for qemu-arm@nongnu.org; Mon, 09 Nov 2020 09:53:33 -0500
Received: by mail-wm1-x343.google.com with SMTP id h2so8239131wmm.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2020 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJhGAXP2h9Fo3Qoy3VCI1hDmptB3uQvjfcrEm2GQu4o=;
 b=XDlih/YvQ9EueJITn32CczHFH4OAP45WdvFAB4JnWAjPpMnt8gRhRPwuSIIxmqE8Nw
 R8yktxVg8dRs7Vc12DtWr9kIJjmRM6esQzlqzlPxw/S2v64QgVkk7UEF4hDmXRWqbkaf
 LQj4PAt/EHpu92SzoPYO60TR1h2ZI0n90Np8sU/BfSadCq0ucGcxqNXb8hfNYo4tvUNU
 Azp4heglPGJy1wBKfrruUAIqUzFec5DYdMF4nK/BokvvTZQ5nZPuDZISWdi5CFaJO22H
 GzvyWaw6dCY/v6BeVhHpiK+TpkJmxB6witCRTjyS/QbChsdPH9Gy+W/4sTE0gxTMoNUm
 dRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJhGAXP2h9Fo3Qoy3VCI1hDmptB3uQvjfcrEm2GQu4o=;
 b=XXvsb1r4eUoMcI3NnT5GBe1aWWDfwtvsl342+TUb9XL9js5qYmpBWNWY3vhZDD7GCC
 BC/kcBmqe79Rdfr4BmLcaXG4fuGEGW3qCd1xhj3abRID9xUls32ojIilY34Qyycj2dBR
 E6Do+jUHPK2PQKI5AZbnrLS2LL8NdnuETrk8prCePTvDqeEO+NjkSD6M+brLaXthu+HB
 Oyrbeu5v8tseWDcHnm2OWLcob4KXQ/TprFUIDngEbPMI4ANL5jpqVG8Tg/ptmsRMSNx2
 Dq5+CGtG+a85VSOmk4ACXUOcIRjGlCxESWAPXvNEWXD41Ggo5n5RUQIhzSxaug0cl9nG
 myXQ==
X-Gm-Message-State: AOAM5315jIOn0yhbaC6wOTl3HfTTTC6LmQ6xMVUr+Ff+sksjAk3psVMd
 11k+rVVxwCwfs4v2Sdc3So9JRun2kw3m8Q==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr14501218wmc.24.1604933606840; 
 Mon, 09 Nov 2020 06:53:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm6827444wrw.45.2020.11.09.06.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 06:53:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/translate-neon.c: Handle VTBL UNDEF case before
 VFP access check
Date: Mon,  9 Nov 2020 14:53:24 +0000
Message-Id: <20201109145324.2859-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: 0daRBAoetany

Checks for UNDEF cases should go before the "is VFP enabled?" access
check, except in special cases. Move a stray UNDEF check in the VTBL
trans function up above the access check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20201105171126.88014-1-richard.henderson@linaro.org
("target/arm: Fix neon VTBL/VTBX for len > 1")
---
 target/arm/translate-neon.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 0ae95cb8df8..2403825d15f 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -2874,10 +2874,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return false;
     }
 
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
     if ((a->vn + a->len + 1) > 32) {
         /*
          * This is UNPREDICTABLE; we choose to UNDEF to avoid the
@@ -2886,6 +2882,10 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return false;
     }
 
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
     desc = tcg_const_i32((a->vn << 2) | a->len);
     def = tcg_temp_new_i64();
     if (a->op) {
-- 
2.20.1

