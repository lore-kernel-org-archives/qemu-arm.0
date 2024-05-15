Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp708660ejl;
        Wed, 15 May 2024 07:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn8SXjnatUmzqJmjD/2V0HTbQuSL7J18ZKCKkfTvPJUlEvFlqn/Ifp1/JZCoyyz1WCaiFGDEmnMrdsPxZGimGT5v0ZfIXe
X-Google-Smtp-Source: AGHT+IGQC5IJH22V1qvKWN2sH0rnNMFobqVQVOQt07rUguNV9C4B2LqJT16k4MprWxrrItNyIecN
X-Received: by 2002:a05:6122:1807:b0:4d3:35ac:3553 with SMTP id 71dfb90a1353d-4df8833c036mr13519210e0c.10.1715785188758;
        Wed, 15 May 2024 07:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715785188; cv=none;
        d=google.com; s=arc-20160816;
        b=DX+IjDfKulTVYc/pCSypxmf+hp+yXsNSPSCaTfjJ6fbNeTgl2uASYD9quE8YCDnXDZ
         WwgFX52QLNnOALDL1f8dmErX9jaObboataj4exYwsasenae/9Zvga0aqXNyfAufarHB/
         04NuL3Kp1mV6ecaxgxNkwuyO/BhogUJ0Tn3no9mNgw+9UGSQz1yWSyv5di9IeGlw1fQu
         BLk852FQmKuFzKIxtIzych22vRlyrMvB+cbg0g0jzQqHr0Q1XL1SLPlRG1BKShCuPrA1
         n5Ztd9ClQ4TvlOF5aWA5anZjyTvku25BewrayXF6PDqtD6j28E4UVYdLaLP9IZ2X2OZ7
         QEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=CMe1BEebiWVTKhVfQDrxW+TQfj4IGskB0dY1dusfKHzvkHN7EomBwz6RnpXCLo3w7n
         6m9uDH//r9doZa5kZHuPBDbza7FFs1yUGgsU3J0TgMvxoFqYjQZwBdOPvxwkpRnsiPwv
         5DvDSUk12E3Ua45+GV0wKZ5qPWiL/US27Z87CKhMADMjKBXYLqaptaB7icllY5ZG42XU
         EaDdDLuoydF3Y29WynfMbCvgnU0if3Ul3Yu70zyAOXiK9mt99bguNtBkktgwuWRLZOAr
         7DDJ4om/a+o4ejmD8FcOtZ51U2BT6MJbppaYHh66252kvMj1rzLKY56yzcRnShSg+GJm
         W1ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C88AauUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2b5f31si143039616d6.393.2024.05.15.07.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C88AauUo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7G6B-0005FB-KF; Wed, 15 May 2024 10:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G67-0005EC-PN
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:17 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G5y-0007CN-7X
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:14 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e4b90b03a9so76763401fa.1
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715785144; x=1716389944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
 b=C88AauUoq881icwjVGnJPqx6yy6DSU+DCZ9Wu1wb+Y0VqDO1xIG3b2cKd1DmSMYsm+
 +apMamKY6yHdwHcjIHDQJXjwV2gthHbaH1ahoelnQqfBq3T0R8C/ExrK6JXQkkCkyLp8
 TEyDeKHmJHKADd4rp01OOVeSHBU8/tDwyPakTc6DyQYUQThCRqoAByLynRq93EKCZTdZ
 U4MvtiVaPFcuMy00UsXe2KNpwfHQrwgeTIYcZHXBphC8hZe6hGmkG10MBnyBuFV8L0v4
 XL4sf5V5ZGczNLhlXKt91WeeQrh40JWKw1FyUKQd00/vyTn8cwpH07CIxZutkJNbmDBd
 HA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785144; x=1716389944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkrM6eUfNQC4/ZxOfw3RoQ+l/U6+/yIajWSBPEUqefU=;
 b=eBoVVrceciSIEiAtKJLJHMrV9huLOGPb1o2L9m9aUcQXK6HjsnyeFHwY5XPmkvKJQb
 qwclEW38RubAzEC8E6HQ9uGbwXmpk5JkIOzMt0oNAMPmLZOrA/TFP7kmsu4crs+ko8Tm
 AXuoBG5UrcRNIUUOOMVmOSkwVusJODOWuxagVcNAriLzQYMq6Mz4jdSdivsC/gT1Qpw6
 OC4Y6C7F557DTSmN85GQhPcHPMeBgnbUmzzCQnRNyDfqfg6MpgafIF+VniJO94Ek4yZ6
 q2cMej1JDLcaNZsH8LW+iRR618KLsfOflSRWLAo+poMaDTy15hWtt1BANGadRFXwvTZe
 WBMw==
X-Gm-Message-State: AOJu0Yy1JARPKb47zenA5HAUUlV92RogsRj57bdxnxANWpavuvLs0sf7
 Auj01FZuirsIHd/ZRuZifjUDtZtd4mO9u9UnF/cmSsALFMl+i/kSCM6Izqruodk=
X-Received: by 2002:a2e:9601:0:b0:2df:a177:58e3 with SMTP id
 38308e7fff4ca-2e51fe52bbemr103753461fa.13.1715785144444; 
 Wed, 15 May 2024 07:59:04 -0700 (PDT)
Received: from stoup.. ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm272134645e9.34.2024.05.15.07.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:59:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/5] target/arm: Use TCG_COND_TSTNE in gen_cmtst_vec
Date: Wed, 15 May 2024 16:59:00 +0200
Message-Id: <20240515145900.252870-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515145900.252870-1-richard.henderson@linaro.org>
References: <20240515145900.252870-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: hEBmYThX7ZsE

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 1d6bc6021d..1895c3b19f 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -943,9 +943,7 @@ void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
 {
-    tcg_gen_and_vec(vece, d, a, b);
-    tcg_gen_dupi_vec(vece, a, 0);
-    tcg_gen_cmp_vec(TCG_COND_NE, vece, d, d, a);
+    tcg_gen_cmp_vec(TCG_COND_TSTNE, vece, d, a, b);
 }
 
 void gen_gvec_cmtst(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
-- 
2.34.1

