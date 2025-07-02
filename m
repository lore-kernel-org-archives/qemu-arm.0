Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3793579dye;
        Wed, 2 Jul 2025 06:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKAHJgOks0/fxc8IOeNe5tprzlVplEJDaFr8NlHduJe8ndekOc+QQ/yN716txpZLoSYrtKUcdpcNJwMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFMBU63u0rIRHqhqgrt5F2ll1oLH36LRRTH9ecTiVAY5z+u/hv6yOEGPVHqrGy9/W4WU06i
X-Received: by 2002:a2e:b046:0:b0:32b:8e4a:5717 with SMTP id 38308e7fff4ca-32e0006ab3dmr9838771fa.25.1751461344505;
        Wed, 02 Jul 2025 06:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461344; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3qMI06vJMQt5b7spS2qKj9qTUzwIPaePXVW1DLCRmQlcutRUH6XgOZ9stXUigS3ZM
         eyA2umetfKTaa2oZeGWkm7r/ov7YP6O2WLHfTTqW6y9Uf60CuBVrnCPPReO1fcE85LJC
         7AqIedgLzvmluayTYyKsGB/FPp1rpCiBE/DNnd7ab8lrgV5utJvyZdEcQoE4mFv82jCW
         5ddsWRa5UcpYON5RnfpPshs+0rLfae4mo8jI0JmVbFG5V5NJ12QHUJIS2RqXKWnLXEnK
         /VXuASw2FJz/cgxaKal2cXHpMJ2oqa0nTXWc21/fL/+tYibDbC5kfII2/7AFbtozkTiU
         Mn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4U0q/GIZDIM1qKxpzjtQMthSMqQD0Hh4uuMO2n3mIoY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=VUh1TSUVzchcHVYl6M25TN+qB24aBAvXORjagctIFqhPpdYMbWqns2jYKAYx6/fKwq
         gJyD+aieZ2gc4GZ41lds7XS2cvgJFOZc5ySbgHS52ARWoEyvpoeXLV2F2IJDIjqv9Rp7
         7EKZNeUVEJl3G7cRHECgAxaPHWWrQvtOG7wascPClfltK0opzK8iMuER68fDGVYGxDPy
         lwnVC1yVpUFNTGVcPU8axLiB1e3559CnnVy3SLVsCkH3ET2thPir2VXXotmmC1kj5imh
         NHRuGT6NW5RIZ70nZKptsaPDbDA5Ts1JixpdIRxaWS8UNl9Fc2HPYWciDzAgjjCmh5gp
         gJyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9zsSJ1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-32cdac75c71si42614681fa.502.2025.07.02.06.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9zsSJ1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwfq-0007e3-JU; Wed, 02 Jul 2025 08:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfk-0007YJ-NB
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:45 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfV-0000x6-2B
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:44 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2ef891cd058so3414468fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459664; x=1752064464; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4U0q/GIZDIM1qKxpzjtQMthSMqQD0Hh4uuMO2n3mIoY=;
 b=r9zsSJ1YhuIFVe0BeebACNg2jJT55JkVFKFcYh1flTU/vjZ5wZK5IK6GtTdHw+s2je
 W259k3IiU+hu3FofFu71OVT1ZzByi9w1Apipx9Y1VCRkBpmWZz0bWiI5NcIvpHDprbSY
 1lH8+10HijNEhU7tpp4+3YJqljrPuvk3Z17rU2lWyXYoNzShVheeWjCEz7SILwJi6wH3
 xE57h2hBM0zM3Br2klMMSze8aFMKTpaFEuXiXfIDpGwoJfVzFNjaYiDfUJ3Cv8rB5BR+
 iOWIH9gLyYwncx3IGd5TJ/x1clPIrw2+x1lVGLOPjXXNI+bO51Vg4oVX4NZyITia/XtS
 iW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459664; x=1752064464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4U0q/GIZDIM1qKxpzjtQMthSMqQD0Hh4uuMO2n3mIoY=;
 b=APZ79glXzJLKq/PlLTtRCuCdqpc1asj+55Mh3zITryGS1k41Yo2PIY37n8W0LzhMy7
 FCoqCH3dHACLz4ebtCBreEROgFFugvTVcVAJiXUQIsjvHOdI2AhVslSCCNRSrRxwD7iv
 VnpEQbfMt3gsmcA+bC10SoDeGNge5WQGhO650iDufUnxhudugXox4+TX1Die5RlzpuI2
 XlybPheyMm/Ch2peahrGBrJUNmaUPZvzlrwjUebGRW12Y2ney0NmN7JaXYv3Y/JdJyVP
 4RzEhgGJNICKPAdfIZDjr5HopaJ8vq4AnmO5XC0xlOoHyvxuUWx1R57jSWn82DrLjrHN
 b2iA==
X-Gm-Message-State: AOJu0YyayhozrlgcCbpdKcvcdZvgpD7SvYNEGJgH9GuNjE2bL2nBniFV
 Cp+p4Wj2llnw5vl7COzSbqZbIz3M8SJhYStFOOlOCU34dMZQmeXa2u8/gJy2gC56og8=
X-Gm-Gg: ASbGncsFCaNkaLw1cYyAINb427CnsDQvGOsG8RExdhZin2ANSA4F/lHhjQdgsuRhPAy
 o/Z1DRYR5unnjWJZ5vF9RudWKIkZKThW1wA+YqRckm3HUQWA9Yv1wK3R5t8j6N9K+LYkNLBni7l
 i10rbK2GQDJRASllhFdyAc8zR/7j/X7UYy3jycV4AZEpwb3Y8tOeOR7Gy2LGesWtR06M7zpOtgY
 1rEHMFPiDERxRhNA7QW7zNNzxNWyXkZCIWUwcXu8/8sckIvbBrWY+EZjOnibrteRwoLouMgSmIs
 MVoF+xbEaOSjnP2LP21mPdFQ+Pxpdty2WV7SX+5akEe5+CPSJpW1jy1413YVWF33LhhOqQ==
X-Received: by 2002:a05:6870:9e9b:b0:2d5:2955:aa58 with SMTP id
 586e51a60fabf-2f588624709mr1919076fac.0.1751459663909; 
 Wed, 02 Jul 2025 05:34:23 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 09/97] target/arm: Implement SME2 LDR/STR ZT0
Date: Wed,  2 Jul 2025 06:32:42 -0600
Message-ID: <20250702123410.761208-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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
X-TUID: LnXB4zHIbeEL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 13 +++++++++++++
 target/arm/tcg/sme.decode      |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 1dbd0199af..9f25273992 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -292,6 +292,19 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
 TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
 
+static bool do_ldst_zt0(DisasContext *s, arg_ldstzt0 *a, GenLdStR *fn)
+{
+    if (sme2_zt0_enabled_check(s)) {
+        fn(s, tcg_env, offsetof(CPUARMState, za_state.zt0),
+           sizeof_field(CPUARMState, za_state.zt0), a->rn, 0,
+           s->align_mem ? MO_ALIGN_16 : MO_UNALN);
+    }
+    return true;
+}
+
+TRANS_FEAT(LDR_zt0, aa64_sme2, do_ldst_zt0, a, gen_sve_ldr)
+TRANS_FEAT(STR_zt0, aa64_sme2, do_ldst_zt0, a, gen_sve_str)
+
 static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
                     gen_helper_gvec_4 *fn)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index dd1f983941..cef49c3b29 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -55,6 +55,12 @@ LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
 LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
 STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
 
+&ldstzt0        rn
+@ldstzt0        ....... ... . ...... .. ... rn:5  .....         &ldstzt0
+
+LDR_zt0         1110000 100 0 111111 00 000 ..... 00000         @ldstzt0
+STR_zt0         1110000 100 1 111111 00 000 ..... 00000         @ldstzt0
+
 ### SME Add Vector to Array
 
 &adda           zad zn pm pn
-- 
2.43.0

