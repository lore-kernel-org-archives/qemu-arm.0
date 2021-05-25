Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4052651lfm;
        Mon, 24 May 2021 19:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAkKyxe81k3p6EDdOSR7IJok/DGo8KDB0vajQWz5dCVVxQQ4Q4WwiAJy2ggZSy94TegOAt
X-Received: by 2002:ab0:6818:: with SMTP id z24mr24725479uar.11.1621908573052;
        Mon, 24 May 2021 19:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908573; cv=none;
        d=google.com; s=arc-20160816;
        b=HZ9icSHCo01Zflo2/2pIleBqI/Iqgg8Syy0AVA3iYb4ZEhWUcyGP2lkNimxoe51qy0
         prJN4y+OO/IfsCUdyXW3CMZ4g/7DIo/XdnzQlwuwyLQZ9hpOVsdk0+7cXaFINkZUKy30
         GJgxTumOtzAg+xBNDxCgwBXht28TANxxzdkpWHalPxGl0fzgX7e4N702sqyQIOcwoNhb
         5ruiwuKv/BRQviPMJ47qqce19cYAcHEqrQ061VjWrtg1Xo29yyhdzvbzw+PkEliE0V0B
         +m9l6FPgprbmuHNZZjftk7riKmTYJROwYXkVuq/ZOcfrzXmu1SC7Skx/oiuujCYt6Rmm
         arvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MRl4v4OmAU1TJRXrTZ44ui9rB0aroiaTDZFn8mfRvy0=;
        b=fDryRvaYdIDThQLEwOZb6jaGtYQ93Ef/ODhZC6y4QTyh7nvEDPPufD2OpTjbzzisUu
         8FIEq8c4MNkbxKO+m4eXMBkY1yGqZTMOPI7NL+0DHnkfcbnMmSTlFKkJEoLo/qC6gJok
         rogsAccjeOEUQ080kYuUZc+g+rK5hwzjjT3jLfo4geGxJ0uTN0+zk81AScPlYhys0VJ5
         WuqWnqlx6MelY3n9ukTrvlrMrX5jGeFgCAAgHqIgOEKkgTcBzXSMk/1KaJnhTbMdkiWa
         eJorygz+VlYACncjz5uPk/YiHWVP8bVsVqphAbTAqN7dJTRMLJOS/E6/jWez6MNSzJGQ
         raSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a2VwodcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si3501817vso.144.2021.05.24.19.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a2VwodcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMVg-0008Jn-DT
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb8-0006KX-6N
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:06 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLax-0005sn-Lb
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:05 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f22so20472528pgb.9
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRl4v4OmAU1TJRXrTZ44ui9rB0aroiaTDZFn8mfRvy0=;
 b=a2VwodcBkHIglPE/87e3TmUOggKbbbcuVGbyP9Lc1Jpxry2YbJB1napeJugQx1R8q8
 9s2xmzuESPoeXoDhCnhZEg3SztWBNZGpg5gtvy0jmTtKZtxZfiDchG5mIUnC+BoQZQBX
 8t8gJTJ7M/xR1l8MkFgy52WmVwS0swCBskrhbZPOLFHPOF0T4v4+VYgU/6GyhHVbtxQB
 MvVEvJMuTIUTTIpY53YwA9QfFeGpYmtkktoLhBMM+MJ4fgI5S6wNGUBK0qoTptdcI8Rv
 +pq3CqES3CYl6yGBhG7HSEHu5JqtocgYrHquQKehj9h3R6TFwKCUZb89uy7GbJmTY+Pc
 ZFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRl4v4OmAU1TJRXrTZ44ui9rB0aroiaTDZFn8mfRvy0=;
 b=tglbts+KJtKsh25KI8xchPZeNPJrVNsIqS6PUERsqpkHm5/+quzBC1ttP+7J3PSz79
 /YHWbtOKlifScFsk6GDVXcPBv8JWkJUBd4/NftRfFXDw9P53SWyMSdXjqICK5JI8PfuW
 Nhao7HZ64Yu7kU14mZQtBi1zn9QoD1lAwBEGkMxSRm3jRDfbrvOBLMXO06xgvm1jm/CV
 Dz+iTb6yVbHi9vxcl4Mrkujdy1FKjag/V1343OYiXZTJFlNX25k7dBVkjaO37TgRaOJC
 +r01HM7ZrrUWQluJUtYr3a7j+yYKb9JkN2Yuh4Y403/WdSFLjFVEN3nh4+4Fy6jBKg4P
 zhkA==
X-Gm-Message-State: AOAM532KOaWhlGHnNpdSD/TaOnp9oTg1aj0YJTp6S4GOyyokGd0nPVFC
 oz/TIrzuyS5UivlHOb1CiVaPFH5AoYW1lw==
X-Received: by 2002:a63:fc20:: with SMTP id j32mr16427172pgi.8.1621905052502; 
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 85/92] target/arm: Remove unused fpst from VDOT_scalar
Date: Mon, 24 May 2021 18:03:51 -0700
Message-Id: <20210525010358.152808-86-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDWtpD/OIT/H

Cut and paste error from another pattern.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 1a8fc7fb39..14a9d0d4d3 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -325,7 +325,6 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 {
     gen_helper_gvec_4 *fn_gvec;
     int opr_sz;
-    TCGv_ptr fpst;
 
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
@@ -347,13 +346,11 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
 
     fn_gvec = a->u ? gen_helper_gvec_udot_idx_b : gen_helper_gvec_sdot_idx_b;
     opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(FPST_STD);
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
                        vfp_reg_offset(1, a->rm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.25.1

