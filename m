Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp42813wrg;
        Thu, 13 Jun 2019 11:06:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyywws2nJIkhtChRVtJmBvpvhmn6Z7UajceW4aF7GKz7pFofZ70B646svSyekDG7tg8lvi5
X-Received: by 2002:ac8:5297:: with SMTP id s23mr39442840qtn.230.1560449160713;
        Thu, 13 Jun 2019 11:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449160; cv=none;
        d=google.com; s=arc-20160816;
        b=jtMH0YVxF7xAH0XrKQahZh0oTPPtZabYxb+caBKv7bL3kLtuASVahxgsHA9QwCG8wd
         CrMGrpJVYZdh/W3XtjmPMlKG6pMqiN1x3y1qe8rkTgkgJmkdrkODlqjVpK0WEY8K2vaJ
         rQ4+qr4ZUGEXDECcSdv1FaPl2+MQeZx2qzOIa+7/oIgwkafU2lxNfSiCj63ooFndReGn
         BrrruJWATCkBrWDukjOcgnKT18jdRH/bYZfP0ro/FDhGYShElVI+L+wT2Oh8MWpfSw7V
         SKtvmoBSN5ChISYVbQ3zy64IdDYL+JTvIwBamWf/gzREsTSSVlcJCr4PN26ZhdcjzZGD
         LSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XS2MzO+cZz80eCqH3YLxLgykyR6csa7kzG0bgwV0MQs=;
        b=ulQlDTBz0cJhYlTVdi3FbzSX0Mf10vUP8nPArb8GZLivhhpVlb3E1S/tstMvs5RZC1
         Wy91XB4T4DLtu/a3s6YlF9HWPEUxjiYtKNZo4/t2DxrALGidCHziBj5yd2TRcs5VtJUp
         SG4R7Q4MVVImIGeUlq7VrlhT+A8ZSzM31KmJL/jeHgLywwGL3+s65qwASiRqrcGl/3zW
         W2kcxQxDU/9y1qe1fn2PlazabrfrizbMUJ0feLubP/W2myI1xovMs4YGhPVM8LKl8GNU
         +qLhXJTpAwH6UZUFFcBTJCXmt5RP/GAJi2CHlfE5NFd5JsRsfHBnl/BiqVcHMhMeQd6T
         ccmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDC2C3uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si212240qvh.82.2019.06.13.11.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jDC2C3uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbU6q-0003im-6B
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53829)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlK-00049Y-EE
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlG-0003On-LR
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36793)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlG-0002pU-6l
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:38 -0400
Received: by mail-wm1-x342.google.com with SMTP id u8so10829266wmm.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XS2MzO+cZz80eCqH3YLxLgykyR6csa7kzG0bgwV0MQs=;
 b=jDC2C3ucnpWxPg+WaSc54V269pFuNFIb5O964icnyjuTfv99fMovYHHGeOhZBOS83m
 XzJlsSCudwGb9zoTssiR6OCjK/ncKGIlw85odhbwrhbY549dsASdGmcv0uMu/FAuvdNu
 t6bgHxzUgjaZIXdIvdSSTUHuduxnV7K2q6h8Jc2H+hIJSeTGTZ9/DGPGJ98RM87ZaVhm
 drjymb3HhWo3As6kq7Lz+zNLT35gYLASdWUoK6RsoPKhyaOcZ3d3p7l/Dx3b89Nk0iMv
 eLg3Q8GbOI2AHbYW4Zt71LbLUMwFxZRReSoMBURpmwzuXVffxUhAg/MUwaajb5lyWppY
 Y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XS2MzO+cZz80eCqH3YLxLgykyR6csa7kzG0bgwV0MQs=;
 b=DRqTHAZbC6wcgmJE30dxX5ZxkpHBhtObThNQkzTkEnuvBgjQ6+0IVhd1pe9q/UoUgI
 9cIstCex506M9DgtXSzMAnkjEe/hohchBP/W3guHJV/JYL4JkDGlDTc+HoWoq9aIXbg9
 e4W+iOB0XNJo/s6rGo9s/888hMpXslC27/55p7Ti7WpQL7w55PeBKjPQIwX+DRS8zrNe
 QnUylhEciKh+XBPWgQSzPQb7rY5XpQXzEgsKK7MqXhwEzODsI8zP2uk47qDll4Hz/c1/
 JSY8sxzBbLI4psdCfO3rzkfuZojPbkyip+YiY1Bvaz2xZiIv7YHPzkiRAaYwB+wNlpPw
 EVew==
X-Gm-Message-State: APjAAAVYNMkmiNbnrjSV0MyQQ+OjtwrRKrPFS5xxX1FOuJyMYZ/YLKbW
 5lwFimpnO3GuI9EzKjHLQOLJKOX3CNKYfg==
X-Received: by 2002:a1c:9a05:: with SMTP id c5mr4245105wme.36.1560443970002;
 Thu, 13 Jun 2019 09:39:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:15 +0100
Message-Id: <20190613163917.28589-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 10/12] target/arm: stop using deprecated
 functions in NEON_2RM_VCVT_F16_F32
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
X-TUID: EX8CudgqZTfs

Remove some old constructs from NEON_2RM_VCVT_F16_F32 code:
 * don't use cpu_F0s
 * don't use tcg_gen_ld_f32

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d8b46130d42..2ba620ac1e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1542,7 +1542,6 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
     return ret;
 }
 
-#define tcg_gen_ld_f32 tcg_gen_ld_i32
 #define tcg_gen_st_f32 tcg_gen_st_i32
 
 #define ARM_CP_RW_BIT   (1 << 20)
@@ -6425,25 +6424,23 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         q || (rm & 1)) {
                         return 1;
                     }
-                    tmp = tcg_temp_new_i32();
-                    tmp2 = tcg_temp_new_i32();
                     fpst = get_fpstatus_ptr(true);
                     ahp = get_ahp_flag();
-                    tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 0));
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s, fpst, ahp);
-                    tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 1));
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, cpu_F0s, fpst, ahp);
+                    tmp = neon_load_reg(rm, 0);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
+                    tmp2 = neon_load_reg(rm, 1);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, tmp2, fpst, ahp);
                     tcg_gen_shli_i32(tmp2, tmp2, 16);
                     tcg_gen_or_i32(tmp2, tmp2, tmp);
-                    tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 2));
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp, cpu_F0s, fpst, ahp);
-                    tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, 3));
+                    tcg_temp_free_i32(tmp);
+                    tmp = neon_load_reg(rm, 2);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp, tmp, fpst, ahp);
+                    tmp3 = neon_load_reg(rm, 3);
                     neon_store_reg(rd, 0, tmp2);
-                    tmp2 = tcg_temp_new_i32();
-                    gen_helper_vfp_fcvt_f32_to_f16(tmp2, cpu_F0s, fpst, ahp);
-                    tcg_gen_shli_i32(tmp2, tmp2, 16);
-                    tcg_gen_or_i32(tmp2, tmp2, tmp);
-                    neon_store_reg(rd, 1, tmp2);
+                    gen_helper_vfp_fcvt_f32_to_f16(tmp3, tmp3, fpst, ahp);
+                    tcg_gen_shli_i32(tmp3, tmp3, 16);
+                    tcg_gen_or_i32(tmp3, tmp3, tmp);
+                    neon_store_reg(rd, 1, tmp3);
                     tcg_temp_free_i32(tmp);
                     tcg_temp_free_i32(ahp);
                     tcg_temp_free_ptr(fpst);
-- 
2.20.1

