Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3698248qtb;
        Wed, 2 Jul 2025 05:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhiS6F6ubHw94EsgDd+cQL6ueAg40wiFZPleKWzBTcPad3WY5sE/K/HvXuP3tS9WOyCs3r7lBm+4La2w==@linaro.org
X-Google-Smtp-Source: AGHT+IGiTbkLXmXWYIFVeT76kSQAzV3olw+10msiHCnAdqgmMRWLpDdmj4v4E292fBewZqvg+4BD
X-Received: by 2002:a05:620a:8010:b0:7d4:53d9:4139 with SMTP id af79cd13be357-7d5c4626147mr348428585a.0.1751459076778;
        Wed, 02 Jul 2025 05:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459076; cv=none;
        d=google.com; s=arc-20240605;
        b=gpGvIQh2GVbUpbmnkDtUGYwlVKOJ2doyII5AItIrEvhQSuwVXEiOQd+z5uWtWGXuXZ
         FYDJmIJ8qahZqFkplQDRVZl51Jih29MMq/F2700gA7q9h6TGLp5c06WC3YcMLwHqjRmi
         yCvlxZ9x1eKJ/CBibOrGFyu2DQMjZurz+ft4JqWoOrtNPtJP+6Nnei1nkWocYFg2CeWk
         1KHSfe9DxXwQKpvmlN9gqxpKaGulNKvPuk3XVu7084W12aOdbBzJKcR9otZ6Wm4HDmfr
         vkOksYh21JsffLvkEHsQnyMGVMTcyoVebOW/FlPh0HHvEDo9VZQOJPOZWx3ISYKTVwAG
         ODgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G0lOyAHGfdwVrVagI3IBAJ8avsxWv+VgaY92gqB8lM0=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=EZtsdXd6VNk8b85D1F4yXlOWZIMwD5jlj7IAs6CxBiJLDsQve7AmNbRg9/dEfySpEv
         aW9JwB1rPjcP1vM+YdRcqqueThNkVQpf6E561h+Mv5s3SdA3HpXWPesmz9HfAT6ZDq+2
         rd99KnrU5650GvMQdsXapO2Ng4clPQ/z4Q2uG7VHrC8OSV/JQ0yt/RQRuuoIh8m0X7Tb
         /7wOYKgeSscvpudARxoZfnndimzp4vqGli5/4QqdGeBsFFisJBQN7oMAi5v/TK3alm34
         KNbqwrCKOkS8vcySq99dv9ZyoKS4qXTBaS2krufvys9RxksM9qMi3XIQ/xiP72K/b8J3
         UOQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G3goi1vc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44bf89247si984007185a.511.2025.07.02.05.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G3goi1vc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwUN-00053z-Vg; Wed, 02 Jul 2025 08:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwU2-0004vt-Uw
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:39 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwTo-0007D7-Ko
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:37 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2ef8df09ce9so2150607fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751458941; x=1752063741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0lOyAHGfdwVrVagI3IBAJ8avsxWv+VgaY92gqB8lM0=;
 b=G3goi1vcMmuBgTjiSnPcfp0cKCxPosUutjboZYSMJI7U84zOgE5sc1LYh/lIFDzOPg
 vDZDP7sEd34KrLG33ZwHCa+zDkFktRwBlhJVeXjvsNO3XlEIEYllznbb4t2xfsDhzehw
 tQGumBxoebADGhKS4D7u3l6gniW3UeXg8PT3Ga97QNOgLjGDsoGeff3E+pgUb8JVkDVD
 GFtzp/kb2dVAsEfQRgTV9BqHRrc0IGSSrF8hYV7vb9qyTQU+JdhedTeTaXB6qFzHuyzT
 jvQSvkIsKp7gGNKGtXf1/tECU1wYOtReBeqi/jIGjDDH5/uNthsGjMYRBpZgLORw4reJ
 0p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751458941; x=1752063741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0lOyAHGfdwVrVagI3IBAJ8avsxWv+VgaY92gqB8lM0=;
 b=C5zJDFg0UXwrnvo/QRHptPjSSmywVghzG3cI6J4v3Q3ja4lUHeBM5k10ZN4ZySJAiB
 2NuPwxaNIN1Kbr23KxBYR8fLYcD+Y0QYf/MmiZTPfZYJrEk2RKGhlBr/cJcP0Db/bXcv
 Ae5S2LcvxQwq3DlkPwqAkmp6VPUJK+PIzufmNPPPvV+W5nQCeWhpCTliEIZcDSX7Wi02
 Z/XlmyoTr9CLj5e+ZAzhHXRHzD3siBL2Nkdb7eEGeYZSw784A0TCVwOymNFntfeN0ZSv
 9ErHzgm+TB2emTNx+nJKJ40QiCh4yawN0YcLtFpHK7I4Wq07UQGiFIS1P0T7pkE4TRXV
 MEEg==
X-Gm-Message-State: AOJu0Ywc7z9KsqZ1tbNd+qRQxZUxPqqBSMSoY7vUW/0fete9y98Urg1J
 0fzRJh8BMrZabeaj0bbVx7Z59KARhDl+CeQkdTMI53K6CEElm49HFS7a260UcQzGnM1vkCs8axL
 7g6IHMk0=
X-Gm-Gg: ASbGncsINzaSB9ez0OpiC1fFG9e81lC5u1dYgeD1rWpSJdpAhjtaH6rihpv0gGHQWuL
 SfXn3WY1oQb89ygJkfMiAbswmk1JasY/3TegJJL9YF3QMNimEPG/IL/NPpvF9jxjdZHa58bZELg
 IbcewVHP+sg8pvohzcFhPPQUDRwKehJibuC58rObQL5dLa2J/s1Tcz5wMMgPdNExDun/zQ0bGGE
 BM33XgtVH2Gg2KeSP8kXg1Hbeww+WMiz4f8CUtlElWYisC3j6KCRmfXj0i06amh74bP3eXcg+1v
 fjcXBkz60TGtS/JBEjLKiNp+oKOFiqUJbvGh6mgNHZIyuXkK1WCQjkl41Tc7R6zjj8H6xQ==
X-Received: by 2002:a05:6870:6f12:b0:2e9:fd62:9061 with SMTP id
 586e51a60fabf-2f5a8c83c06mr2028914fac.32.1751458940998; 
 Wed, 02 Jul 2025 05:22:20 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1bd3sm3785013fac.28.2025.07.02.05.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:22:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 04/10] target/arm: Replace @rda_rn_rm_e0 in sve.decode
Date: Wed,  2 Jul 2025 06:22:07 -0600
Message-ID: <20250702122213.758588-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702122213.758588-1-richard.henderson@linaro.org>
References: <20250702122213.758588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
X-TUID: NFf/l334BheW

Replace @rda_rn_rm_e0 with @rda_rn_rm_ex, and require
users to supply an explicit esz.

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

