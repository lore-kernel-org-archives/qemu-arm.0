Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp363951lfu;
        Tue, 26 Apr 2022 09:43:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3IVoS4U1OPk0x5EtTEKyb6LblaMEXfgUBI6+WzqsnWZgPhVIrx2pJVelosohncedIvMq3
X-Received: by 2002:a05:6902:20e:b0:627:f1cb:a9ee with SMTP id j14-20020a056902020e00b00627f1cba9eemr21077993ybs.129.1650991427328;
        Tue, 26 Apr 2022 09:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991427; cv=none;
        d=google.com; s=arc-20160816;
        b=AZqwrJtquZ3hy4b0NebXHHLwb483PNcOwmYiXD/0wYwqCsPWlLLPgGlstuCyEJrNvL
         z7dnApDK6dbQ5vDMQC9EUmVdF7svDKxJ/5R2WUaT9UcYAmonIXK81Q2owVrK84Oq3R1m
         ouJTO3AuathmQ3zezwnv1B8neHR4/Ex7mD4d1IsPUqxgQrypruhtSY67yGKaB4isOVBI
         nEPIg00iSqSUeIqXVw3GYLDqySLX0ZxTew4eHA9eec4xYr3xSbK7/DJuNGv0OKqf0LyN
         pApKy8uMxoG5usTH0Ecu+U+80RXdoxnqUy1iroaTOwnYXt03IhSwzq8GrTJd98ynVUnS
         rIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K818fpSFBQPvs73U35nRltr2XwiPqKbJCOKKmgfZ5DY=;
        b=XvQeJ+PtC69Jege8x2yJnkJPkI9MjBfDNm6Tw0uDlH3fj8tkJ7Co3qJMSj/DLzzdLB
         mtp6n1R6DFfsHUKaRQQ4a1iJnL0UdTEFVxd7XZap7723BKhxGTTseLeDhZlqDmIdJcXa
         L8rkA6Pmg/o8ZFTjcqF1n5zxSaGzMr8sOIOu33vMoOLxz7KWgU0bvjq8EIGpLDEuT4ut
         XsFhQpIgq231YgtvMaDu5KN1GnK/j9Bg38LEp57tCWWZ+UBV5/jbCcFu18kePPiCNCGV
         bkC0adQTVDBQuuLHMs/or7kTD81+0M3ajHdl+5EDIqe4+LPFvo4hEGmIQspsluGtuWLn
         0+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeVBaYdk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e194-20020a25e7cb000000b0064574660501si12994928ybh.113.2022.04.26.09.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeVBaYdk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOHy-0004Ta-MA
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035Z-6w
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-0003tJ-VX
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id p6so3566705pjm.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K818fpSFBQPvs73U35nRltr2XwiPqKbJCOKKmgfZ5DY=;
 b=zeVBaYdkqmSHyTZWafckHgewzYs4dW1cO5DUluw40Zsfzlv9UXeAJqbMgu/yA6jVhl
 QCY7TFi5lqL/akSgXQA+DiDxqbbzeWvjd0iyYznFVMm6GDX1JboJpyTV0v4fZ1O/tAm5
 1vKZ911B1Zohfgh8psjBNYAFn973P76U0jwYecXAUIH6MsRoBGWAkAOs4yU1ZirzDsTT
 S0CnTgGCwjobpwVZ/d0HbMmAoLZemTAh5RTkTX27ySkSUOJjzhK1HoE1Gte16eDseWNN
 c3cHIkzoB8AfXji/lQTahJeEzStLO0WTrFiZn/+xORy4EvZxFvp9JGdWvUujYHOzz0bM
 FevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K818fpSFBQPvs73U35nRltr2XwiPqKbJCOKKmgfZ5DY=;
 b=O8UK7m4D7SRGtwInc6ykcKsX+uRb+s2t4cRvsBuB5fWtTA12wP5IQyKwE5BoA7h3sF
 VFn12x2OMxdxuLHBU4f1Gqp0s9f2i0f61Kvk2ZOpzOJfH4oRVb0DHvwJ+EtnI0n5OZJT
 5gbWt294y37xHi4zr1TlY5CfsDzzFZ+kV+95Jf+fWkoPgrwbEn9ScHx7hhW+ickzQFbS
 1LN8yntKJMwNM+Xxnu2ezVFLBGXk7qCPUTgdWU6naiZT5xJPpYWFsvQs2db6VAjdS4He
 o3Igphbi/T0MfQ2zGzUPN2kRlpoZrqTfO39/qC3LIYcVGT2JsKx43sIz7cvNYlFqcnM5
 AFtA==
X-Gm-Message-State: AOAM531hHBaCTJ3nEA3E3cYt6EZ8sQZp+ZR/1wSK9KJxU5ZVPPY8AXuB
 +W/vgeyIzvl1jaGna8u/Zw6vxA==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id
 bi4-20020a170902bf0400b00149c5a55323mr24490763plb.97.1650990670038; 
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/47] target/arm: Use tcg_constant for gen_srs
Date: Tue, 26 Apr 2022 09:30:23 -0700
Message-Id: <20220426163043.100432-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LU+vNU8CIV7s

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e4f3db26f6..8476f259fc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5137,12 +5137,10 @@ static void gen_srs(DisasContext *s,
     }
 
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_get_r13_banked(addr, cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
         offset = -4;
@@ -5185,9 +5183,7 @@ static void gen_srs(DisasContext *s,
             abort();
         }
         tcg_gen_addi_i32(addr, addr, offset);
-        tmp = tcg_const_i32(mode);
-        gen_helper_set_r13_banked(cpu_env, tmp, addr);
-        tcg_temp_free_i32(tmp);
+        gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
     }
     tcg_temp_free_i32(addr);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
-- 
2.34.1

