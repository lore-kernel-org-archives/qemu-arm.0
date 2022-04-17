Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1265709lfk;
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKQj1O6Hx5H0vjfbC6wFxaHIQkb9/oiKDHBMvCRlaGwGqCO4YUo48jEpcpd+gd1nVKDjnX
X-Received: by 2002:a05:620a:b91:b0:69e:6f07:e248 with SMTP id k17-20020a05620a0b9100b0069e6f07e248mr4174845qkh.405.1650217593412;
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650217593; cv=none;
        d=google.com; s=arc-20160816;
        b=z1ffbY/cU626++MR5yTsR2fNHPmGLMINZLykymRZx77pBn72uHrYy5Zl400gBchmHO
         DufXfqH3KTvTPHqRvIm4eN2Y3J+6/41MvEpi7l0HTuU//HDsEWQos8y0F9gooiF712ta
         ngpwEweM8QT9HwvxZKMF81mNWEm/D8pOVahbtAyrvkk0xpM2fQiAqB5SW3JMXXHYbEk/
         hlpy910Kkj+Jrf/ha9IhOte2CAAL19wC0FKAy0l1nivs5aRv/Iu0fcIM6AQRruVXOeTR
         E7blwiZnqKCkQsAEl7uh+OtnjfLfER0J/ZVhnSU8rmSUoETc1Mkubc54075U3cFs68k2
         W6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vxLFgR2+O/yEO8CWTOhGko5rMSYgERGzbB2hOUZT2qw=;
        b=Eyd9dVJ3jCKvoKG4zaNPZARq/wNOrzkkTUVqVUAMkEid/29mFuD4JvxPPWR2Cw5Shi
         +UVbOtfVg+jZEhzec9mpgUqatWMD8hJVVa3HIKjShSseqXcq+YecLt+Hjvxw4jCv3nfc
         FZ9yOgIBfS1Z1ya4tq5kN3mH1aprX89S+8HJ1o1mTWw/Sd6ClcNzKvNUd6Tt1UJnbUyr
         y3N//+a5OSP4PgI6/jLFP9JnvOctaMDBwELy5M4NkQVgf9ZbQZYQJtReH7Wm+Q7OIiCa
         /SbPfG8qqMaKEZLSYlaTVIMAM6ZC6lvhejoOikjLuk8z1ejGFNsip9kjtOjbth1rZl3F
         BfTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DI2wNBxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac85716000000b002f1e37ee305si2364025qtw.396.2022.04.17.10.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DI2wNBxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng8ym-0001p3-TC
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wu-0000eQ-75
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8ws-0003Fk-MI
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id be5so10713379plb.13
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vxLFgR2+O/yEO8CWTOhGko5rMSYgERGzbB2hOUZT2qw=;
 b=DI2wNBxyNTHyxEmGRPu3vdwxS/laH9SsS+E2H6qdbjNXas4N9p99jvRv0GaJaJMqCJ
 8n9osSuqzQnMuH91TtrbZq2/+hLJlBmd4ipexGdLwxPbLBIBnNBdiauOefPJcMMIAvYO
 0u7+JqGV1Mm982Pmkw7gwVSXHMH1/DqKX953whZfxpSgwKUxSWlsWpMkjEDn7RdlqYaZ
 FBtarDC8e0BMwHf9v6vl4u56sZlHMfWszW1wFhAToFYV+GaEkIyrAEZKLOJJaRKjZ/ZP
 kK4MekSXaa1PNUtNp6wDSWdiGubCJ04KU4Chqe0OgbVO6/NZupWo4Ixzl6FIAbQKtuE7
 P+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vxLFgR2+O/yEO8CWTOhGko5rMSYgERGzbB2hOUZT2qw=;
 b=lRh6oPasVOqKClgXUBPRAsulzLk8sy8UI8wav3hhTS9TVHzWybKsbbDp6K3XaB/YUB
 oDCK63+2EWNTiLnhIXy1Ce6uwRw09eWfkOSJ2m1ifMdE9PFfer1ABlfmQ76nanurmKwz
 6AE+oneuHBiHN/SLJcH81FZslLWanMJiUKyRBUHQtrzIBS/P9tBMRfWtE3iMzPdMq6y4
 6e4jBfe8RGHTiSr8/71o5cMbk37rjSLgCvxl/4jYg4TALRmgtUn+GhYpy7HPtNh46WTt
 6Y1xaUgcQCuvo7CjJ5NUGKIYEe9MWRfwfjwD/3T9guk9helJKzzcx/ssVt9uESFF2X1v
 JEcg==
X-Gm-Message-State: AOAM533sJ4NpPsBWGg/XHccUvJN0nK+/GyO23pWfdPvzfZ4+dR8fjwWC
 UtLP5pCd+s9+gtjhFCH+cEa/5A==
X-Received: by 2002:a17:90b:1a81:b0:1d2:63f5:e24e with SMTP id
 ng1-20020a17090b1a8100b001d263f5e24emr7088951pjb.124.1650217473013; 
 Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/60] target/arm: Update SCTLR bits to ARMv9.2
Date: Sun, 17 Apr 2022 10:43:30 -0700
Message-Id: <20220417174426.711829-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6qD0YQ1NFCg

Update SCTLR_ELx fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f843c62c83..9ae9c935a2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1232,6 +1232,20 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_ATA0    (1ULL << 42) /* v8.5-MemTag */
 #define SCTLR_ATA     (1ULL << 43) /* v8.5-MemTag */
 #define SCTLR_DSSBS_64 (1ULL << 44) /* v8.5, AArch64 only */
+#define SCTLR_TWEDEn  (1ULL << 45)  /* FEAT_TWED */
+#define SCTLR_TWEDEL  MAKE_64_MASK(46, 4)  /* FEAT_TWED */
+#define SCTLR_TMT0    (1ULL << 50) /* FEAT_TME */
+#define SCTLR_TMT     (1ULL << 51) /* FEAT_TME */
+#define SCTLR_TME0    (1ULL << 52) /* FEAT_TME */
+#define SCTLR_TME     (1ULL << 53) /* FEAT_TME */
+#define SCTLR_EnASR   (1ULL << 54) /* FEAT_LS64_V */
+#define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
+#define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
+#define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
+#define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
+#define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
+#define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
 #define CPTR_TCPAC    (1U << 31)
 #define CPTR_TTA      (1U << 20)
-- 
2.25.1

