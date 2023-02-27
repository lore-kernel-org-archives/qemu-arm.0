Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4303373ejc;
        Sun, 26 Feb 2023 21:54:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8BXs9GdVXNqp26IkinG+eavRVPMOtOc37PHrDSDcmPDWcu0TDG7Dp3zcXYQoUuufy7Wnnd
X-Received: by 2002:a05:622a:54f:b0:3bf:c407:10ca with SMTP id m15-20020a05622a054f00b003bfc40710camr13077871qtx.10.1677477289409;
        Sun, 26 Feb 2023 21:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477289; cv=none;
        d=google.com; s=arc-20160816;
        b=VpKCX1iAw/C4dXItLzuR8FFCGzwWxoyKhTgoOctJDgsjlyeCw30TuBM+ASBLXgwZmh
         n1PjVgb8Quk2kyw4cF8z4Mmy/nOCq/gAKZm5SRdcIBcI1YpB5TcwTEF+i2fk0dZEK0e+
         XkrIxKh77fCiRpJqEDQlfOBCLX9LLuo9AU0IA5vI0okzvSZXs/0KiH5TPR4qB0GxkDd3
         OURzE9WuSL/BjU16P6ygdIccACM84grJb8HL7SpEdE/T5j+SQVih8UsYrfbTxI6vwNsq
         4kwcjtoOoOwipstBZ3RbRDj8X1l+iTRz3W3x98ENFnRJ8QpuVyjhi59JR749fMuixwVw
         +wHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
        b=NNR9IKNHH3qU9EVTwtK7A/vxLEfL/FdhaqPrclYDRFoNzQpYEW4dfKF6cw4fyoUdyF
         Phxfik/YLIelK6UxGgptj5I3XieY0PxmSjyzsI7ayEWgjCqsvAu7UWNbCL7NxgUsoODe
         UOs0Kf2+gF09SoDewVoz3KbjltRw/b7DipZ+RqGlVr2QdLJcCho2EXS3rfTnGTVGap1z
         W96e4Lab8DZUWEK+2HCCDTTLTNzFug+dUdkCdPreggzQqhh28VtqwVA5MW9jH38QomA8
         RfqHfZxdvBvB8m2BqQrxl7IfGiZKpJvs6Zz0ICdbYRzXfrRrCxM2M5hIAZL2WBmMPBBt
         nf2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcnU6I+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020ac85f13000000b003bd0a5ef178si5914167qta.339.2023.02.26.21.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcnU6I+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWNb-0005Pj-Sc; Mon, 27 Feb 2023 00:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMo-0001kt-Ec
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:06 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMm-00073M-1y
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:05 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so4724386plf.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=YcnU6I+ImOLwQgIL1fAnp7CH3borVZyEibXRpPED2mkEVR5rk3vJUKFHywXb9QKey0
 QIjnlo+7n+hTsDYr54exaQ7NRpSBRL2yri/rUgYtiFxllJEaAP8hsUVuM/hdA8oGWnJq
 unTe3sm+sxEG82Qi/O9a6EnyucrvfwojVOPxVH+JsEjBqXk732rbXXrAYGR0zVz7qkCA
 k/TA0235LZbYRHpeqcjnkrp6EeWEle5v8NywVdKZx62s8tM4dRZbcHM7Oa7doWhVb8w1
 E3v6v9FDU5DNagEkQGMI4cOZMhVs5ZzGqNa9kc2IG06ztJ1VqdJkozdSVAyPhA+hQAwU
 5h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=QHKXvyLRMPObY7128C8IfRsxMMrWyE1vV+ZxE6ilbNbdOzPOEPdK294Ot/30HnB0lj
 s8sx+NCD/E5PH6kIQLOYslQ9RzhyFesK2UsWDhai71ktIx6tEi/4BxmNFNkXIiosk0oL
 tKhbgtm3h3PSeLSYV9XwQli0qLIcA2p0HGybz4fyLoxfehN+aJumdpNfvGu36AHrkSxB
 SyTZ6UIlWwAkL+e7XvsIgorMVmAMXPUAujro7iPFoOdUdt66DoypxhCk2+BB4GlETl8n
 F8glPogbpV202Ur/Hf02RCcguwMxEuB+KnINVAugi6+jUhijHufhwf2ejMa29omOM0lD
 6WQQ==
X-Gm-Message-State: AO0yUKV9ggMtMPBAh4Ey/+qkQkeacLaHEw5AXa168IH4eEo7kii2l2oa
 VfFg8XALj/ZXUXzlNjEwN+3NNQ==
X-Received: by 2002:a17:902:7687:b0:19c:f005:92d0 with SMTP id
 m7-20020a170902768700b0019cf00592d0mr5724458pll.25.1677476882335; 
 Sun, 26 Feb 2023 21:48:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 52/70] target/sh4: Avoid tcg_const_i32 for TAS.B
Date: Sun, 26 Feb 2023 19:42:15 -1000
Message-Id: <20230227054233.390271-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: B/KrDTG4hpYR

Since we're assigning to cpu_sr_t in the end,
use that as the intermediate temp as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ad6de41712..70a45c26e8 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1610,12 +1610,9 @@ static void _decode_opc(DisasContext * ctx)
 	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
 	return;
     case 0x401b:		/* tas.b @Rn */
-        {
-            TCGv val = tcg_const_i32(0x80);
-            tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
-                                        ctx->memidx, MO_UB);
-            tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-        }
+        tcg_gen_atomic_fetch_or_i32(cpu_sr_t, REG(B11_8),
+                                    tcg_constant_i32(0x80), ctx->memidx, MO_UB);
+        tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, cpu_sr_t, 0);
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
-- 
2.34.1

