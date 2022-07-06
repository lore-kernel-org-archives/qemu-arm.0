Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4542345lft;
        Wed, 6 Jul 2022 01:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vSq+d6ryx7fA9vTgogHdXhyGYWHUbk9oknUXAmT5+8iz0rLsQDEck3NHojKpT84LSqIROt
X-Received: by 2002:a05:6214:19cb:b0:470:8fae:eb90 with SMTP id j11-20020a05621419cb00b004708faeeb90mr34424769qvc.92.1657096833096;
        Wed, 06 Jul 2022 01:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657096833; cv=none;
        d=google.com; s=arc-20160816;
        b=gqQpFa2LmEWPbeaIqgWak9GW+E4KzOzIWiUMd9V+dDXB7goYIZgQZ8yNvg61VmA8pd
         gmEHz03NhNvPSAcYLmNSHHTtgjHBdGJZmMFWBa8sMaL4PZs/4aPJZzf7KcTM875ZzNeG
         7lCWxyB4RYfl5ZIRh4WMtYOY5vUX1hm8SQxIa2m/IBe1mZxjnA9mfkoJBaJmSw9SzSL3
         qm94FUHgyiMe3cZa8jFImYHu2Trv48nPGPLdZA65Kbs/cu5NpqPzgbOKEgzVnUPFMwxB
         WdGAYd+3ArSFhmM2865n5oyIBwR+aBOJjjoPF2L1oJo0S1yDofgks+o7+nlE5K/5uunI
         exug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
        b=igWWCXqsp4Od2auZ0CI3Xn/QXgh1bxBxUEPzs0Pe+26po9wTriv2084n2IEDGh6zSM
         QwbHzGSKrA6/p4D31AapJDUEa/cGZx8qtcdulDj2+x1JoMCOxaRTKWVO4GiVpySTVNhJ
         2NFk/z4uiQL8NQfyPWfAsBJzx112RC/bIuMMMK7RqY6M8OEql4//+/9JFq4H2/5KzC/u
         xALGs5OfO84Pm7bglM4WwugTjJ1kgocymap3Spn7Pnpa8k3XdM07n19+5zvMuwxhh8dj
         58AQdjBdRS2OQ70LoiVyaze9q3SMpLp8HlpZSBmRlP1PNIusTYiT0i1mokW6W/RB9b7b
         d32w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHXmjjrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05622a15d300b0031bf56452basi15686680qty.412.2022.07.06.01.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHXmjjrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90aG-0000ME-J7
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kx-0005qS-Q0
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ku-0000MR-FX
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso7526360pjh.1
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=jHXmjjrAnDXE13PnVBQ4Ifm1qsZZM0yNxU+6tt2spDd2XIJE3Cq3W8LZtNyL4iPcSh
 mA7zq03/uNLU3lQDz8IdmwPmcu89Rvp5gYI+hxOo9yYDBI1arLtbrZMnUuI02xsF1TQa
 XOHnbBrcFW4yFlZ4Fps4BJxk8mdnkGwXW6Djjo6aPvpXOQyX0RPfcqyyMLudXHY9DING
 E7QZxCaA48e0OPJRlqKJWvj3v1FDFpJNzI5mpakrYOigiW4/ldzSZ/FK9W2Sewn3atGN
 YKj9oz9Atqtj7I7sUL/tFwg3yq3QACbjC4ABPMrltJ1F6ajWQU0mPuafTEd7jmFwg6M6
 El3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=cssrDldvY2k3bvj1w1KxCf5pHjePRfx6y91O2S1eCRZe3FvOK3qriK2zJBsMlFjXm9
 Qc005bZTwml8JUjOi7pR6QrZuXYo6BRLXOMXRRykB6Nf874kJew2JgLu7eGV/Gq3hV9w
 GxQqMhVY1rhjgR0PicMe/Oq1szkzrv5hlYf075Y45OxX4iZtZDyc7IKnjOW9yxIWLIvo
 8cNecMRrJutgEABalMvO0dIlmySwGrbQKAgrTWukGLusYhT1dAyjOeNSGajxCJlmDXGD
 G7e+ptv/BWnPs8jIieaaLzSOIRiNs9Ti8/TBVTwM1aHTR+LG42We7BvbXBfHmdlCEF18
 11gQ==
X-Gm-Message-State: AJIora/jfpAACX2rKQ0iViPc4okExCEwmB+yvBa68TeX6caDcerjggTx
 YlV0oLYGECqk0VxjDRyCD0EEsw==
X-Received: by 2002:a17:90b:3b85:b0:1ec:d979:ca42 with SMTP id
 pc5-20020a17090b3b8500b001ecd979ca42mr48372072pjb.209.1657095879693; 
 Wed, 06 Jul 2022 01:24:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
Date: Wed,  6 Jul 2022 13:53:35 +0530
Message-Id: <20220706082411.1664825-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MpIuEggkbk43

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index b5eaa2d0fa..3260ea2d64 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5aad53923..9bbf44f008 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7302,12 +7302,12 @@ TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
 TRANS_FEAT(FMLSLB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, false)
 TRANS_FEAT(FMLSLT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, true)
 
-TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_smmla_b, a, 0)
-TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_usmmla_b, a, 0)
-TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_ummla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_ummla_b, a, 0)
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-- 
2.34.1

