Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251154dyc;
        Fri, 4 Jul 2025 07:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKRtejSv09hESErVhBjB0SGdHLML2ucHe+uFrLOv0SNLdaLXkKV+vBgGSXEDaDvDDnWAwavrp23HdrKg==@linaro.org
X-Google-Smtp-Source: AGHT+IH5QCWSIfngZk27flpfhCBnhI3bwg2ahaAxe8Z1n5Gvvz9fDjcPnBlyAkTPD381nWYR2on4
X-Received: by 2002:a05:6214:4e17:b0:6fa:edb8:b343 with SMTP id 6a1803df08f44-702c4e0ba28mr44222246d6.2.1751639085500;
        Fri, 04 Jul 2025 07:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639085; cv=none;
        d=google.com; s=arc-20240605;
        b=SPgpfS6E+u3g9J8PmFB73c7dBVraoialh0rlc2LxpTi2YBN09H1Gww4X+cMP9IHecc
         Y0cSXNLCmd9TpBjcxayd398zzRetJM60J3VJpMhMzjbCK+21NRbVW0/HnuZtjbW5Oo1t
         fnxPZd5gWMv+ferdkwI1atItWJ7Fs0Def1iR2eVz9C7XZPLv1jtxvBuBuBzr3niRkAUm
         0OD/Ys2bkdROB86Jak9BHSrKacw9nb2iKWrNLjOyJbxTsR4vmXC33O0ZT4LeXNk5iAhA
         EwWVeIjRqJ/LwQYJ4fV2exTzqmsvpF/WaEVWkjaE7u4W2+rYvYuf+GjmE/PSt8ACXj1R
         q5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xhDz0SUl+MnN71lAnlARYts8N3jBwawNRBYzEstPr2g=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=ROKFQBsNv+ey3ezapwGywu2DSobw+pVgdAunlRF9+nErmkDTOuUQag9dCKMBn17uZo
         Jf0KoZ4XR3akLdp8jaiRBApYm6C+tPC3pV2yt1vXT3lk7/mnlhYMKJ4wjVKnqNqyNp3N
         xwRe9s12lL9lCni49ntCaOO93qfrOa2ZQLk4Qi1fJiZ9fTNISgRRC7vY8AxpEJrmiZhk
         +QT6EEgeY/eh7MG3OkVuuLBgyAfKrTZdP1rEibsDhb/SSpL6XuCsDvLHA1n2j73zcg0u
         2c9umy811PCAedkBEDPAlDJiPoCLRHL8zOrteXQdRN/4eeTJ9vFBcPpjFR2nLueLKjff
         DlXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPKconh6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4ccc62esi20573426d6.18.2025.07.04.07.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPKconh6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhId-000677-Bq; Fri, 04 Jul 2025 10:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI2-0004nC-2H
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:24 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI0-0005Gu-7B
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:21 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-60d666804ebso1198841eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638878; x=1752243678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhDz0SUl+MnN71lAnlARYts8N3jBwawNRBYzEstPr2g=;
 b=DPKconh6sNJ85xBvt0PpJ9d4SVgKtAtT8WLR28+5O3SBx5V/xYTbU9+u4Bzr3v5kXB
 Liu5EIZrbfvTDFnEO2bpQZgtoKgN5wnhtvieY3SxfEWQ1+KeQQDCLDCc/0237ZeuzrXE
 yv262H0mwe8KpDH0XNc3CXYinKK5KpXO4fpqUwX4zvHWPr4/4QR6T6fym5YMvl3yB/Wl
 FDjrenK4AoE7ReeuHNwFlmlEyqtdcziFTEFbF1+PL9MWE1+VI/U6L2p+9OdbIXGC38N/
 w5pw7Nm24EmItykaPu46hmRfJAx15EstDgcUFrseCm8cbp7SM16mlPLMYH6GGt6aUtbx
 IDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638878; x=1752243678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhDz0SUl+MnN71lAnlARYts8N3jBwawNRBYzEstPr2g=;
 b=aH0MVODdlMXE6XKhFJKLdu6Gd6qbMhNTndZTqAwggLoBF5XkfR89+3j55adewFuVdr
 GSxWyNX+7MI0ergSDzcZ3YGfenwZspHoGaVWVA4XPU+G5BbEFAOAP7qM4IUdFoP+srGu
 Zt3XBzzf3tIh5sfSGxK258GleJfOJ5dOzYSnxs1fD2ve1hK5M0GYjcpLRtSZtm26EpL4
 kS0TPMeo7dwcyWXN9vJW9okL62hx4U7kg449RFO3bdRDFgDyz+UiRA95xcKe5xD26agP
 +Qrl/x2+k7/VTG1kXQjgfpQehrBovXiwAF6mIjKCzX4AlDfxXHPPp6Y9+5guzFOoKTfu
 wVCw==
X-Gm-Message-State: AOJu0YwcPlv+WDw4jX3JWoj2usNINtlh/m97WS+UKN0ZK+w5zV3GDvcp
 8DVHYW4+axOFXfmreHyxswLSqE6SgBurd9Ske/GYxp37aZSRYZGRPBX+qHs0pq2hvf0=
X-Gm-Gg: ASbGncucigMbqCkmHOl3RPxwvkBMNmuN9sLcg2E/P38/Of5cv/DvBO4XhW3gB7ooSAu
 sIj5V5y1RRzIuH4596cY4pf1udRQ3D2G3mpSdMADmN2n5LETGDIplHB5JEut+GXGt9Xq2mTFdB3
 hNUTFNoq1fAt+iQLCurYWusysJqUJVUtNJZ6GMRBMarig+WxayL/07cadwQROCZDQfsrqheaGXX
 92xp40sPzisZ6MUoYC1qoAfSWPANdwFZimKomnre8aokH2ZvLVTrsQS2keIBMvNh/HuLMw8Rfsn
 CifGIOp4b2RiKT0Y2ATi4ocxQsEt8n5+OC8U7nZBQA37GgEpTt0jvIll1Cs4cE3mJ7A9NG7T7gM
 t0j5huyhGHZAFBZybItargPXO2166gNDaAu/mit9dX8cWRqXT
X-Received: by 2002:a05:6871:798a:b0:2ea:1e58:7a69 with SMTP id
 586e51a60fabf-2f792038bcfmr2441413fac.15.1751638878466; 
 Fri, 04 Jul 2025 07:21:18 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 004/108] target/arm: Replace @rda_rn_rm_e0 in sve.decode
Date: Fri,  4 Jul 2025 08:19:27 -0600
Message-ID: <20250704142112.1018902-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oGMqao3cJubU

Replace @rda_rn_rm_e0 with @rda_rn_rm_ex, and require
users to supply an explicit esz.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve.decode | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 04b6fcc0cf..3a99eb7299 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -131,11 +131,11 @@
 @rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
                 &rrrr_esz ra=%reg_movprfx
 
-# Four operand with unused vector element size
-@rda_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5 \
-                &rrrr_esz esz=0 ra=%reg_movprfx
-@rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
-                &rrrr_esz esz=0 rn=%reg_movprfx
+# Four operand with explicit vector element size
+@rda_rn_rm_ex   ........ ... rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz ra=%reg_movprfx
+@rdn_ra_rm_ex   ........ ... rm:5 ... ... ra:5 rd:5 \
+                &rrrr_esz rn=%reg_movprfx
 
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
@@ -428,12 +428,12 @@ XAR             00000100 .. 1 ..... 001 101 rm:5  rd:5   &rrri_esz \
                 rn=%reg_movprfx esz=%tszimm16_esz imm=%tszimm16_shr
 
 # SVE2 bitwise ternary operations
-EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
-BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
-BCAX            00000100 01 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
-BSL1N           00000100 01 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
-BSL2N           00000100 10 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
-NBSL            00000100 11 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+EOR3            00000100 00 1 ..... 001 110 ..... .....     @rdn_ra_rm_ex esz=0
+BSL             00000100 00 1 ..... 001 111 ..... .....     @rdn_ra_rm_ex esz=0
+BCAX            00000100 01 1 ..... 001 110 ..... .....     @rdn_ra_rm_ex esz=0
+BSL1N           00000100 01 1 ..... 001 111 ..... .....     @rdn_ra_rm_ex esz=0
+BSL2N           00000100 10 1 ..... 001 111 ..... .....     @rdn_ra_rm_ex esz=0
+NBSL            00000100 11 1 ..... 001 111 ..... .....     @rdn_ra_rm_ex esz=0
 
 ### SVE Index Generation Group
 
@@ -1450,9 +1450,9 @@ EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 
 ## SVE integer matrix multiply accumulate
 
-SMMLA           01000101 00 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
-USMMLA          01000101 10 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
-UMMLA           01000101 11 0 ..... 10011 0 ..... .....  @rda_rn_rm_e0
+SMMLA           01000101 00 0 ..... 10011 0 ..... .....  @rda_rn_rm_ex esz=2
+USMMLA          01000101 10 0 ..... 10011 0 ..... .....  @rda_rn_rm_ex esz=2
+UMMLA           01000101 11 0 ..... 10011 0 ..... .....  @rda_rn_rm_ex esz=2
 
 ## SVE2 bitwise permute
 
@@ -1602,9 +1602,9 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 ### SVE2 floating point matrix multiply accumulate
-BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
-FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
-FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_e0
+BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=1
+FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
+FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
 ### SVE2 Memory Gather Load Group
 
@@ -1654,16 +1654,16 @@ FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
 FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
 
 ### SVE2 floating-point multiply-add long (vectors)
-FMLALB_zzzw     01100100 10 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
-FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
-FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
-FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
+FMLALB_zzzw     01100100 10 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
+FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_ex esz=2
+FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
-BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
-BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+BFMLALB_zzzw    01100100 11 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
+BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating-point bfloat16 dot-product
-BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating-point multiply-add long (indexed)
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
-- 
2.43.0

