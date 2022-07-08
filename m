Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp333717lft;
        Fri, 8 Jul 2022 08:21:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tux1M9TqDd8I+uhpKt+xeX0DfMkWD1TbSBXhj16fAbm744HZbfD1xDFjWzh6LmRDQt8Biq
X-Received: by 2002:a05:622a:19a9:b0:31b:eb4e:5cd with SMTP id u41-20020a05622a19a900b0031beb4e05cdmr3468292qtc.467.1657293692952;
        Fri, 08 Jul 2022 08:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293692; cv=none;
        d=google.com; s=arc-20160816;
        b=wGpE7Udkmhxpgb2NYo2j6T8Io34yVKtUUpoROnG8pjJSf2znW4Ejirv2lYY4oCuRVb
         ZrZfKSgwYLzMz8TFX96O55ZVvDSIxUbzBXDoCN8F7g6u1ZsBZ42HKHaW5vJ6n7o4QOXd
         srDgoGu3AiCQ91lJahRMNKRh+hRAOb5hViokFQx/FbFYPkJPYBANLSz2Sr+4GPcDuQvG
         DJZGOa8Q+J7jLgSYAgZ/b78q+dwQctF/GG8tfXBO1zDaZrUXlebNoGgpwI4zLMDy0Xf/
         QpEVFFbgsx6fWll8T6dQwTt5u1SbaCR/L+n09uG7CFqDCyX37pxTMf/B7pCzSzDxabcl
         TGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
        b=md66UYw7GEGd3zN4WgLYahY+offen3hXpCs/fgRxi9+op0RjtKWgG0lxkYj5JO/JDA
         2BIZV71IFXn5AwOFaa12RZun2PIc6uQkNTwbpNIMmIC7bLs9gACwqS9yViQHlyWRDWYS
         6h0EtQ/OuwEDSSQfTAaFIo1nDgH6NisMZcmJwGqCz0PUEoghuCRw3xoZTaUWUmoG0hy3
         t++CcWHxK0EUYWbL0ZM+GqRdf7mLduiQ8pOg7+K6mR1ELmRMAz8kQG9/C8fDlKS0+yKN
         0RTGl9KVlqD7ho7/MTuyd9KbNzPPUT6NnHztHptfQxkYws07RqLw4YUiJgo+2qi+aaP1
         7SPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xs3H7pLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020a0562141d0700b00461d25cf032si5977714qvd.491.2022.07.08.08.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xs3H7pLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pnQ-0004Oa-FL
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piM-0002Iy-HB
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-00028w-GM
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so2218505pjl.5
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=Xs3H7pLUVLv3IoFcOon/LnA0jyYXOtIP3GG0z5bduOSK+/4xR6NraKw3xYUIV7FQJv
 4LiUjycXwmCFTnB1seIu8ult4nKMsQH7edhVNKeN50mCwDLJys4JFOraULBTvmLbgHuJ
 sAlsknEevjBqTLzX7/RG+2ijUsBes8oVWjtgPKiuExUylfqHlgDFH5EojSOgOBJoxRAj
 HAfgKRGtIIiGt3N9oxjkNOjhivcvd9+bUpNdg/0Xa0xgy+rYxDaYCjLVx8YBGrmkBZuv
 hc+oyz4jrrPKkRbINfy1UcDJaJNBS7KfV4tQh09YhHdxUVsfsMxoHPKGIslvCZRyIkJP
 r8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=kPegnBK7PRdgZV7wtBuYzANMEcGq/vR4nmRLGCMOXSAdhrMNYou2R2gcRJvbH5aeHl
 XW2D/FtD81GxvCvdEXZoPa+Nk8e6yzf+bcX9QTr5mokTgN3rA1+antjM3hxwJAzucjeG
 YATgeGejIv/6InLd71b3JT/I9IxCHqwEoefAa9dxtS13C6kC7UN1nL4P67CMDjrQ9WJq
 PQGol/t+N2HCDI0HiWuaaGXguDZkKW07sDQJ18qm0hCEl/0LSkX8+122LyI4u506G8++
 ywqrR+FVKch9JeSsElmyuujS1NHX7KsHklsQGM7QDtuKS/j9wCayEdpkwUwsY6xgyijI
 yQFQ==
X-Gm-Message-State: AJIora8AIJWVS/Ym40aLKvELVpU7NxbReuBL+oSjeTYfJJkagYl8Gwhv
 xCtTB/TtMCfI0sCD9WFzniyVKA==
X-Received: by 2002:a17:902:aa47:b0:16b:8e4c:93d2 with SMTP id
 c7-20020a170902aa4700b0016b8e4c93d2mr4211237plr.27.1657293373640; 
 Fri, 08 Jul 2022 08:16:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
Date: Fri,  8 Jul 2022 20:45:04 +0530
Message-Id: <20220708151540.18136-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: Rm0CYgOcNCP3

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

