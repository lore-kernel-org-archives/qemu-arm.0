Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2898447lft;
        Mon, 27 Jun 2022 22:01:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDfmB/E5TkPOXvF0upa6qaYH5Pzo/zou+j4T6K1uCiAI8dL06tF/jlWHVIIZk09uqoDx/X
X-Received: by 2002:a05:620a:4405:b0:6af:22aa:3039 with SMTP id v5-20020a05620a440500b006af22aa3039mr5936523qkp.574.1656392466831;
        Mon, 27 Jun 2022 22:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392466; cv=none;
        d=google.com; s=arc-20160816;
        b=wbSnv56HSl3sPUXBy5bOikS47JEwV7Aiotwqb+AA+FqyMv6wW+usaiVqNI8TkMtbMf
         kikcL0isPkntbmUiQMs96gVG9Abe2ekgGosJxpb7INI6xPyemr/V640eKFALasUb0QBA
         xQNGKHDvUEX9lehxr5FYnSGLt8uNfXMialK49od1C38+DmYrxgY3CWg+VKKr3yyymKxR
         co0eahOBa8cDmX5vIeDtUj7ghAAMaTzvKfa/w/A+pIzaL2f4+vgguo3ggHx/vSFpmlHc
         zw6M51XuuqNdb75JKoxFR+ek1iZMqJhIXAECWOZ7PKdWvbnZcsuWdwkm2ACXwWzbmyXl
         M65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SXozRQJRDsddSiDU4WvdirQqE4A6/ObOnm30QCWvExc=;
        b=o5Ah7VtXKLECyWFgBk3ZMp3hR5Ztbtn6yktWMFmdC8mjQu0noiPqQ2stsmJ1/k/rrS
         yZJTtcL40SNQfnw4xvJX3NrMTwPqTlSOuFKX1+Kkcq1RRKCmD0RZPrcc5fmVjl52Haec
         8Ixpw0Uh8oAITA0HkkZToVBIIl1k9f6oPbyt5prZzuoIKUiUn7iVoM81IOE9118zqs/J
         OjBMilk0MfM+UvR4Q3XAi92Z5kCczmeD1FwhkOXM+0CHd6l5eYS104b6nvKKcSPt4lKW
         9kUD2a52zz4taIhBAVVhd0S6es5GjMyG+6ejGxMNcwXWuCc3cwF8gtzP+X6lJNBlPS0Z
         agqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lw3ZBC5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw6-20020a056214238600b0047051ff8adesi5719812qvb.536.2022.06.27.22.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 22:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lw3ZBC5I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63LW-0003M5-9x
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 01:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nl-0000R7-Sh
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nk-0004Nu-CV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jh14so9999970plb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXozRQJRDsddSiDU4WvdirQqE4A6/ObOnm30QCWvExc=;
 b=lw3ZBC5IAkdqx1p1s2KVFqXCc6vW6k1VFV64JFiVW4zFkG5KdVnVQK1JGC8aSYfHXx
 3woHK+egJwJ2qOXjvFDPXy3InKWNCqPiMA1v3P1YjJucKsBEgFwOaaaiVhREgD+jZh+P
 OKlzLPpHI2sCukSVETWVXw3ATh0uKiOgYEHCZ4UEqwqGm5sJbGW275g0ZHs83SWTRT8H
 /XrkD5ghWLO6LK+9HYhR/lQF8x+2T2H6R8ufQNMS3E/o75Rd/tEf4MUiDneQzJ1kxJ9D
 3EINihabLq0WW4sesm1jjhANIOJaeoAaOKTl/KuM8B7NbSON+Rzn/QVya+bmGfd7Gdx8
 mQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXozRQJRDsddSiDU4WvdirQqE4A6/ObOnm30QCWvExc=;
 b=JSy6/FfXZNDs9suRAqggqBfURyq6ngfRya1zJZcJXPoKtlLDH62a5bPLkNjYFFnFez
 vZlxUTYf7wbl9CGuY2/cBUBk6dg7JFpwcYA4l0+YWojwIe/0VefDKFun2veuUvpM09vN
 ZutJXi+YYJCcE0H1ulUMLAToUrEH2A20OG4/PHqcIq0At3rh7kdv3x3d/WbITStfI1Sm
 4C1/W2si26uNYUjVS2GCz7t1XuLoAF1IULUiG0VoIAtEaWV1qLivRVigf2c6e+o+m17T
 NAuDSn6brRXGtvKR3uMb7Q5EfwEJHQcgFUzSaV+Kbatzq2Cs8z9kDnTU5gTSgA7c2pXw
 Gplg==
X-Gm-Message-State: AJIora/8BSLX41tH9TI3jVj/+IEMpXluN1LCjjf7+MGjSi5iWefFMd3H
 h/eX+nrP29NiocNZr+PcJPS5TJpz66kSDA==
X-Received: by 2002:a17:90a:a40b:b0:1ec:a22d:5c3 with SMTP id
 y11-20020a17090aa40b00b001eca22d05c3mr25318448pjp.118.1656390371598; 
 Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 44/45] target/arm: Enable SME for user-only
Date: Tue, 28 Jun 2022 09:51:16 +0530
Message-Id: <20220628042117.368549-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1kuKE9/eF+y

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 20cb622083..87d836fb2f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -210,6 +210,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1

