Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp43794wrg;
        Thu, 13 Jun 2019 11:06:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBrYzS+Kj0t4zqeY2TpAe0ZLyjHEkAjeEWpwHxNc9zTeLRK2reouuO95ShA4o1Ce5f4C/W
X-Received: by 2002:a05:620a:1387:: with SMTP id k7mr17411804qki.129.1560449218359;
        Thu, 13 Jun 2019 11:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449218; cv=none;
        d=google.com; s=arc-20160816;
        b=hXovcwC80fYQr62ABmk1tiHd4GfEolLKxftzyobQjwS8R2hDJlLgMjHSvPBXyMkeLi
         M/S0Wn/s41cBvjwNeBfx89Oq+LrE5YvHK3M5gyfhJ5+l99rAw8p7TmtrsXBeql/HUSGQ
         H8yVLWj6fVe/3FQmze0jp3FSqmQlrPwZCpfO1+X9jTXa/jGpxQpOZ7zazyP1/NXKISjH
         3L6JGS4oYc1hgk4e5TFp2nbgDUbzL3Di5BPAG1FsVL/xH2/VW/xU0EcFHjzpLt6wNjNr
         TlJqXAsPLgpe3OqWa36J4dIUZvFXhzf3VqO1KFIDYBzcCqQ+mD9t3pq/t76utWHmX777
         EsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GypQohw7qsarAznVOv5kE9/Dbn/Co/pX/VNOWPFpp1I=;
        b=hY1IUZf8Q+tGSvZz74UXTCDnmCaWbtFcFb3eZ9NL3y8fHPLp2fQbMYrYc4Ch+RwHVV
         4wtCHxiNjgX5LxY2QCmFYC7kz0ayT8fm8hz7wJ6NYsJhmmyzlO0Gw62AW5cCO7iqEoYs
         SiJdUMzJuIyZ84w/r8sGGxasBbmf2uw3+sLiMBAUbAF2SNEoqh6d6IGr2zMPPxg2sklr
         A/0GxWDN6MppmBBEVodQrxFvcgK5Qcl2Vo6QTlQhe+6wSB22pIKyX/ara8JNuTkeGQID
         lp/dXFRvoHInRD3cDvVyzAoHdG3WHw/wCylN5wjJIE8F8Pd76HYBchj6MjFFzdIjvxvL
         oqsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sGwPa0qY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si182782qvi.133.2019.06.13.11.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sGwPa0qY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbU7l-0004LJ-UE
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlK-00049q-N5
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlG-0003N2-Bz
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0002ve-RS
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:38 -0400
Received: by mail-wm1-x342.google.com with SMTP id 207so3040808wma.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GypQohw7qsarAznVOv5kE9/Dbn/Co/pX/VNOWPFpp1I=;
 b=sGwPa0qYAx8A3PpngQfWVGz9mpF2j5DJeqqZlaQDceXHmUrCWs0Ze3fU1qmS9l4n7A
 kTFM/1NN6L0MtjIZxLFsRUYS1gb/TAOD2dsFDVvtxO2JGHGZiHgooKrpO7aYgq8migQG
 9lG45rv8vDoHxr0JukA5MD9vXd4VrEQ+uYbgNdbRpdIlpKGD/6Bey1hpkh6NQ/Sak+Vh
 UFawEztJLs1YtlAYeypyjcUTFqBCLkPPx4llNvaIxLPhXYpVhoYkFvta/BYbjTD8SxmG
 4+zGkIGtrOPnSDIT/J/P+JdRGQWi76EmOk8rzwf0IqUy8VFh2yY78zTV/4mgSLZtAkXA
 fZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GypQohw7qsarAznVOv5kE9/Dbn/Co/pX/VNOWPFpp1I=;
 b=pxsmFXAngVJC9nzZKTXi0trxDaNpKj1o4NWhYBIrzXZLaGAjVw5Ky+Z7rFkVgVs86+
 B8hjZr2MgYESAJphv+wSY9yjEbpQk7T4ez/I8hhJTJmVQ5p4x0RndQCwsV2QmM+BPMxT
 2BHpgVuXJvE4doyTEx9wSj+q7Bdc9FJHJg8sg0/fy5NSL00aVV4H9vP3MMnUpIDXSdS6
 EjOswE8v7bJCnaOBynx0OU8HT7ykyyhsGYzaEPq1DcsGWEhryY1nqn4PEKNMagXdI1hA
 ywPOUq0bd9BpSX7WmIrDJL75/goy9phmF2btKcBDMMFqeMnQ6IzS3A4WmB8mFCFZ9/vX
 WcLg==
X-Gm-Message-State: APjAAAV2VO0/YndDhSmufZinQ0JYg2Z/DeSBcB7kfFVZuLY1YQFzQYca
 b/ImZZmr/cxFJM0NISBeeWdQHwfkoE/eew==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr4127692wme.86.1560443971105; 
 Thu, 13 Jun 2019 09:39:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:16 +0100
Message-Id: <20190613163917.28589-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 11/12] target/arm: Stop using deprecated
 functions in NEON_2RM_VCVT_F32_F16
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
X-TUID: FtQTMRuWZW4f

Remove some old constructns from NEON_2RM_VCVT_F16_F32 code:
 * don't use CPU_F0s
 * don't use tcg_gen_st_f32

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2ba620ac1e1..8f124a953b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1542,8 +1542,6 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
     return ret;
 }
 
-#define tcg_gen_st_f32 tcg_gen_st_i32
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the VFP decoder */
@@ -6460,20 +6458,18 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     tmp = neon_load_reg(rm, 0);
                     tmp2 = neon_load_reg(rm, 1);
                     tcg_gen_ext16u_i32(tmp3, tmp);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 0));
-                    tcg_gen_shri_i32(tmp3, tmp, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 1));
-                    tcg_temp_free_i32(tmp);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+                    neon_store_reg(rd, 0, tmp3);
+                    tcg_gen_shri_i32(tmp, tmp, 16);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp, tmp, fpst, ahp);
+                    neon_store_reg(rd, 1, tmp);
+                    tmp3 = tcg_temp_new_i32();
                     tcg_gen_ext16u_i32(tmp3, tmp2);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 2));
-                    tcg_gen_shri_i32(tmp3, tmp2, 16);
-                    gen_helper_vfp_fcvt_f16_to_f32(cpu_F0s, tmp3, fpst, ahp);
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, 3));
-                    tcg_temp_free_i32(tmp2);
-                    tcg_temp_free_i32(tmp3);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp3, tmp3, fpst, ahp);
+                    neon_store_reg(rd, 2, tmp3);
+                    tcg_gen_shri_i32(tmp2, tmp2, 16);
+                    gen_helper_vfp_fcvt_f16_to_f32(tmp2, tmp2, fpst, ahp);
+                    neon_store_reg(rd, 3, tmp2);
                     tcg_temp_free_i32(ahp);
                     tcg_temp_free_ptr(fpst);
                     break;
-- 
2.20.1

