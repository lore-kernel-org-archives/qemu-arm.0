Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1086413ejc;
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8yTMf5/lXyPdZYOnAO1eRKMvfiO0bnMQnxwyOc59iRuWu377A6FfPbq1MHzKO9fwcfu/7f
X-Received: by 2002:ad4:5f48:0:b0:56b:fe7d:4a5e with SMTP id p8-20020ad45f48000000b0056bfe7d4a5emr22731405qvg.44.1677185099725;
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185099; cv=none;
        d=google.com; s=arc-20160816;
        b=tOg2EIJnx5Nv3xGPdaLSyPSFZa+ZNbKrI7o/mXmPNYkzqHoyiIjPzxrcDOTttTT41O
         mwuhT4poC4ND914ouIicFDPe1KBlsFMg0uZ6U1B8to6JSmWJPZNwrIXB5QqOkgZ0lwec
         +LwZIR/0Fkyu2H3kSiDQ+oIBKlqKeXVi7tOJmn2GtPGDDCyJFRs3G9swTAGfrOWt2jrB
         Ce5/cKYssi9e3imR/Zer2h4mWq5GEhi3HcrvBgEUhgXrAWC6I5/+Hi3xVDoqrC+AVlGo
         1UPLQ58vWrzY4bGrds2R+txA6/6kVX1o0AZCwgGxBU8Ft6YWQ24KUiaHS2J+OhyrhBbg
         2XTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3vtvNlB4KTNEcDi5rbGBEAocvCMMZzxXPOlMmxtkjOc=;
        b=yl2g2wgGIXpv5W0js753ahIZjOOiTORO59yLs/sXqI7xxNCqJFvdKAU3g/0cgUpV5/
         1pDZ1T1hGfQH1AtZd4C8/LmnGAXEiG9+ynPbXosKYbdPE7tzLYtXuggPPLhnZ3F9E8C8
         EzMITFdm0v6ov6cR64eUGRO/PthqUy6DwaWMgPHi7DDn5UG5+j2WnUWuZoREhU9c1e+Q
         MRDlPqZNBviEVw7oynF+KIuB0iX8telvwXutezCC4QuzwlItO6gTdqDOC28Bt80a6poo
         baQDmhxDwyOyuUMnb81YHazEhI+b9w+Eaid7kXcl0vi2spWZPNTtfsbAm53FWNpQHH/z
         zptg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSQT5Mrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a0cf20d000000b0056eb364bd43si1106250qvk.429.2023.02.23.12.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSQT5Mrp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRg-0002s4-U4; Thu, 23 Feb 2023 15:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRf-0002qi-9K
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:03 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRd-0007SU-LU
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:44:03 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso5015346pjv.0
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vtvNlB4KTNEcDi5rbGBEAocvCMMZzxXPOlMmxtkjOc=;
 b=NSQT5MrpMsF68BQuPoeYqbBBT7RfjJU9ERQAbllouaUrLKqG9rAzQ7BhXeqRebuK+L
 bYxWxzbHD5gOaHTE1TgnKzrTPbyM+k7N7UXxPutqodE6Jza+wSMnJVRkDQVP2DV9xnZq
 66cjzOuYrAl/Yxa0W6/ikb9O3wQna9KwblBZr4Jv2CZlkLm4VsY6tMk9lVJLufGDuZk5
 hstV8G7GnKkK1Jm/WQI+RokDUqDiHGyudnwSG2o11pbuMxpnKyj8DD8BSDK6Q1r21azX
 rf0hDW4BAsbdsgVHULfjcR1GzKn68H2ANdqdsJRVBhZeIcxGRX++8W4/cdy8MdeBNGRT
 1DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vtvNlB4KTNEcDi5rbGBEAocvCMMZzxXPOlMmxtkjOc=;
 b=A/zxwr8+Nwi9c3DmlyRVeRmsFCIiCi5QvYMoEdrbCXum+4JNWE1XKMqyIUazUCTKxk
 pCmjHroRv+EXx8mU3HqGuzznsPwXRAJInOii1UZruAbVYGctIsNAaQPG7pvN334EczC+
 pWZR0KzEnWJHDGqSn+9DxhjE2Ypvvl33I3D7MRZd39QhwdLrUIfXjonfmMWPc0ZtoZhf
 UlTp5kWvudmqPPDdCWUJu+a5cPjEGWCncaYBUPvt5hQdkKXTH/kqc21XQI4vKKEfOO2B
 Ot4FIBRxLfbJAf7KT+PwAQKbhrTrRpL7ZjwYkA+4GSbl0ObPBa3Gdk97RMylTz/X5+LX
 UMgA==
X-Gm-Message-State: AO0yUKXSQ7XgHhEiLhhGdqL46jJGwaD8BQwrQ6ETFeb04cm1T8PWXZ4Y
 uR4RrF+45c7BrRvWfeSZQm0Cvkfxe0n6ub7uOjM=
X-Received: by 2002:a05:6a20:8f05:b0:cb:8d74:1114 with SMTP id
 b5-20020a056a208f0500b000cb8d741114mr11744034pzk.44.1677185040354; 
 Thu, 23 Feb 2023 12:44:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/13] target/arm: Support 32-byte alignment in pow2_align
Date: Thu, 23 Feb 2023 10:43:37 -1000
Message-Id: <20230223204342.1093632-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: 6UHjMfhxMU9q

Now that we have removed TARGET_PAGE_BITS_MIN-6 from
TLB_FLAGS_MASK, we can test for 32-byte alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23a3462bf..412fc4aca8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -940,13 +940,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 MemOp pow2_align(unsigned i)
 {
     static const MemOp mop_align[] = {
-        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
-        /*
-         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
-         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
-         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
-         */
-        MO_ALIGN_16
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
     };
     g_assert(i < ARRAY_SIZE(mop_align));
     return mop_align[i];
-- 
2.34.1

