Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3802456dye;
        Wed, 2 Jul 2025 06:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkNkP0h68NPE19J5xu7Z6dh1huvDn4SVgOacN42KhazYXn9IMDFccCd1Cb95VTZeky1pey0x6AxEcsEA==@linaro.org
X-Google-Smtp-Source: AGHT+IGyjYZQPdBskMnacHXW5ui2olcMRjnWslYY/Wp/wrc8kczQRc1fZIjTGEjJzCXnSlF7+4G8
X-Received: by 2002:a05:600c:1e87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-454a36e7c78mr30987945e9.12.1751461984749;
        Wed, 02 Jul 2025 06:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461984; cv=none;
        d=google.com; s=arc-20240605;
        b=VXh2bU2TIhVrVsjtoapAhfG+v3o3SAp/1QEU4WDeaoKiJd/x3fIz3A4vUMfv2iIO+x
         0XvUB4QyDNjhVrANxC0b9f/3nt1ms8zUqV7S2ep/K00I6+wbSdUmBSXdpKlq+g0CkcCr
         AIHxfXcXW/6UmXtrttw9f1HSi4S+CCZ6mjAUIS9V7LNBbuAyWqaPseWd8ROmgYUaSjoB
         EdinfkG50ZfnU9CVM6TcJkdzRk3fShKDMEpdsUp9XWoN3TlBCAY7QpMrZdMR18UAymY4
         l/JpZXR+tkRM1fwAFxnS2IE2IDRZ+VGF+fxUkwOL97TizjwyPhq5CdaXZYJmpr53KnUY
         2Pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4yBWAZDHQwxGTcAUdxImRflpZACtfYkwPssm35P4I7c=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Ri513o+rJvZSzHZ4a8mZ2sRXZTuDUlfPOX4OGXdes8+fsBl7M2ePZ34nE7gH31sfCN
         eU9yQlT7D0x3E8tAO9WkBEP/A2gTQlcegPWojm6L52mS/ixpjmVMwoux6sh+T3+VLVE7
         WdRrzO5EHmLhM8X1t7AyKzELae2ALJ6npUmb4G3TB9/YhkDY8p7Mb2VzY0wAWtOIIfiw
         l3cVxY2HRxQwyXXm6IUKPmzLLkGtH/cyyZ0KS/DNmf6Q2iE+i0gNJOGxmzeqIdRB1Lus
         zwtYj8PrG+B4U19VcGKcebdJy0hL2YrWYg5HfZZD1lYb1Ih0lHSkw2wSpgEYZrGvF9Rw
         XAnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQi+xS80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a892e4193dsi9371067f8f.26.2025.07.02.06.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQi+xS80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwnh-0001KL-Bp; Wed, 02 Jul 2025 08:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjX-0004MZ-HS
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:45 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjQ-00029K-3g
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:38 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-60be827f2b7so4268395eaf.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459909; x=1752064709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yBWAZDHQwxGTcAUdxImRflpZACtfYkwPssm35P4I7c=;
 b=fQi+xS80lpUCd9GGSlt73aySMlPqP/tEWnD27ROAd2Uw9X46mmDzj9oGgVL3Urpxwo
 tOzY8R1eSJWvR+1Q0T+i2E4vwMopF0YnbHCOkbT8YDOA05jXiWUWz2FakmaO9cIY5Jpr
 z6209fbcB+y/v3ABBWQ291bEtUqOFza+BjGIwDaEJI0XmzseUCb3ogm+/qj2VcHduJBB
 ABDq5nX/D6Zv5625nCLXhvuv+3ILvtyOMtuLnandPPXSD665+2LepXxDTUWwazeHa9Dl
 BiUHd/hJMB9NM5A/QHkPfxA3TSuZqDzzNkE3tsOVxKY/FdgnwFbzmvCSNM4UDggs4mJV
 6fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459909; x=1752064709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yBWAZDHQwxGTcAUdxImRflpZACtfYkwPssm35P4I7c=;
 b=uW7Ku6ob6eQmwFl585JkQ3CUYoYB6nyvxTINPyJVNbjXCia0VsDtWgQtEBNLJbbWOy
 /+9dJLAi2mQAKIRDNh6nonYIIhUSE5V5NSXVvg+rwaMzgC1EgVDMDFoK8Kl2CFDX+Gt/
 x9e5Sv8UFazF4D0De9InDZ4TKXU9Qzv65eS+h/bVj4tsPFtsYhFQxjHT8HZ+8hS8IgbP
 7vehxYcbGWyLpRASNk+fv3iy9VKeEHR1cG+c/vlY/g5P+wbsfKlEN6PAEie2GwwpYRiM
 Gdx77XBNRVMaRstZOCCNlz+ejcIYuZKipByV8IyV/WmOjWwincHrI7rYfs3OZgWHwpYQ
 SdKw==
X-Gm-Message-State: AOJu0YySdo3fjuyyPdxx41ydw5ogmwNhjgwiY0zxU70IuhgJgVnAluvx
 wFWNj+NdsKgHSmb1LiZC1NVDI/1eyvAfJhtDJutKImZ8HuzfNKLljLX5o+losWO8SoY=
X-Gm-Gg: ASbGncsAxHIsuGCUcSOaCkoZycyima02Lcw6f2JB6ZY6nx7xCLiaH8uXYbY0+vQNBwL
 YbBcHxDX433U+YdTSlZxrE60R8pnW3XoVTbeWSDU0Vyv4u0yvFMpjGY/zI+zzuiD7eQilnOO/zQ
 wU9iSsynZn+BifaytWAfkxxDzhIQl7MhcESkCeELwBdUGT9Sr6oQd1A0oLbzEPqRnnM8V9BDYWu
 xMbuoBiedHtbreCAVJTnhP7n6pHLEf7pKirwVq2Gd0tPtV0haq7L42FQzuL+OXOsmmdisSd6sVq
 C1tOFpu8tjNCnhtrUlYhEariy/FnQ2mFw9B/nxRJNPBD2XAv3F8+MasaCnVTVtZn+22rNQ==
X-Received: by 2002:a05:6870:4595:b0:2ea:83c5:1e27 with SMTP id
 586e51a60fabf-2f664819f2amr1931400fac.12.1751459908349; 
 Wed, 02 Jul 2025 05:38:28 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 59/97] target/arm: Implement SME2p1 Multiple Zero
Date: Wed,  2 Jul 2025 06:33:32 -0600
Message-ID: <20250702123410.761208-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
X-TUID: iAX0e3JRukOy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 20 ++++++++++++++++++++
 target/arm/tcg/sme.decode      | 23 +++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 99e4056316..b6316ac716 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -173,6 +173,26 @@ static bool trans_ZERO_zt0(DisasContext *s, arg_ZERO_zt0 *a)
     return true;
 }
 
+static bool trans_ZERO_za(DisasContext *s, arg_ZERO_za *a)
+{
+    if (!dc_isar_feature(aa64_sme2p1, s)) {
+        return false;
+    }
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / a->ngrp;
+        TCGv_ptr t_za = get_zarray(s, a->rv, a->off, a->ngrp, a->nvec);
+
+        for (int r = 0; r < a->ngrp; ++r) {
+            for (int i = 0; i < a->nvec; ++i) {
+                int o_za = (r * vstride + i) * sizeof(ARMVectorReg);
+                tcg_gen_gvec_dup_imm_var(MO_64, t_za, o_za, svl, svl, 0);
+            }
+        }
+    }
+    return true;
+}
+
 static bool do_mova_tile(DisasContext *s, arg_mova_p *a, bool to_vec)
 {
     static gen_helper_gvec_4 * const h_fns[5] = {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 47adcb5a15..c4b85a36d0 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -877,3 +877,26 @@ UCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 1    \
                 &zzz_en zd=%zd_ax2 n=2
 UCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 1    \
                 &zzz_en zd=%zd_ax4 n=4
+
+### SME Multiple Zero
+
+&zero_za        rv off ngrp nvec
+
+ZERO_za         11000000 000011 000 .. 0000000000 off:3 \
+                &zero_za ngrp=2 nvec=1 rv=%mova_rv
+ZERO_za         11000000 000011 100 .. 0000000000 off:3 \
+                &zero_za ngrp=4 nvec=1 rv=%mova_rv
+
+ZERO_za         11000000 000011 001 .. 0000000000 ...   \
+                &zero_za ngrp=1 nvec=2 rv=%mova_rv off=%off3_x2
+ZERO_za         11000000 000011 010 .. 0000000000 0..   \
+                &zero_za ngrp=2 nvec=2 rv=%mova_rv off=%off2_x2
+ZERO_za         11000000 000011 011 .. 0000000000 0..   \
+                &zero_za ngrp=4 nvec=2 rv=%mova_rv off=%off2_x2
+
+ZERO_za         11000000 000011 101 .. 0000000000 0..   \
+                &zero_za ngrp=1 nvec=4 rv=%mova_rv off=%off2_x4
+ZERO_za         11000000 000011 110 .. 0000000000 00.   \
+                &zero_za ngrp=2 nvec=4 rv=%mova_rv off=%off1_x4
+ZERO_za         11000000 000011 111 .. 0000000000 00.   \
+                &zero_za ngrp=4 nvec=4 rv=%mova_rv off=%off1_x4
-- 
2.43.0

