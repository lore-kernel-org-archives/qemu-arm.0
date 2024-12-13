Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp524336njb;
        Fri, 13 Dec 2024 07:25:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHTZIjjoUvhaGVeKd5Rka5okZYI8VVFmSFtwYKEr4xKCPL5CYOJrSxW9BvpoCk2l0vm3CKaIulkWgzxg==@linaro.org
X-Google-Smtp-Source: AGHT+IEscGscOHkMwQCLWImFCCVCpSuuhKAKP/vPS0U9EQWU90LbzHprU6sZGrwNuiUkHlSptdP/
X-Received: by 2002:a05:620a:4414:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7b6fbecc63emr459958385a.2.1734103550210;
        Fri, 13 Dec 2024 07:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103550; cv=none;
        d=google.com; s=arc-20240605;
        b=FT3Rf23YbNiupv9f/y03DMI7OuEhNnV7EyVgNjTRaPIjJD2BaP1m3UcyDD+G3/B1OI
         c2YWmNh5UlsC9/kO8IyBUB6lywIdb0C4pb5WYDvknwA0hKiKtaJWEnz0fN/lbWcVCbJ/
         SB6H8uHQ4nTvnyDAxKDJ0i2hyJcDUvT6+AxpLAo3wrVOeZrxt0aE6l18DOtGuOtk0ii1
         w9JfPuFkQaNfLuOL+IPUtcqlXoVC08eEItllqWX1+8zYk9Yryk9oYB2WYG6kEcV7n7om
         3OWdOtb2XeUy6TsWwb1BgPlgbEOGw7obh5QDtB+TjGV6WDpgK7roGxDyBioLfe34lga4
         lw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
        fh=+VjnrGvjeQQD7yexb7VCprNpWRZMsTpIL8oodPazyOY=;
        b=AqntTM9MOJTRlXNGayPILoG7dA9Tu/NBKpDQ7ZPkrakqVZYixaLiE8ckHCnjDI+/Ds
         G1my31A8Af69PXPzZw9DuniWtipF5qoYxquewwZbVkii/HQ0yn3+zBrEw49+X/wgb5PS
         2yftfQG1EeTOAK00I9KNlygmWQxo6fH8HdGg/CSseZuaua5mUs20sMcydnDRqAxeUvrB
         hFDsWNhbCzdWRF4dplGBBM7yC7rdNAfUiRCW+iMlZA/Qp96tWguTo5QqJ8yIgMKbjphu
         TfdtuPWBHavjn1LKaB8lhN12etAmn1w2WwvysSh1ZbvF4DAuO/9t/GlK5PEHeK5jRVFc
         9obw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zDDozi3U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6de7806desi1049159885a.86.2024.12.13.07.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zDDozi3U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tM7Sd-00065N-Qm; Fri, 13 Dec 2024 10:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S9-0004qt-Dd
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 10:19:41 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rs-0005Mr-9I
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 10:19:40 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so366351166b.0
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2024 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103163; x=1734707963;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=zDDozi3URzuy3BD/2wxsvWSTPemoukV14WC6mIB2bNeg7qgi0vvK48LE3DqTGwBJuj
 bBayp1K3urSPCRjc2HEa/5WqUgMGVjNrAzHTMyDJgNj58wFPXB/mCfUZ6rI15H1igYuq
 zJVoIGn0ooons/yl4bc11XcV9DIMH6E04CyvQ0PJP381cO2aFDy7Nh4xH1x5zbMIXOhE
 IhGQX1gpdg2hm+tBAHTmipa6+oAk1xvW6piggwMMocPshkQyBqMqkrWLsYB/Ia2OyG6S
 9P0YN8O4ccvd5ms76zDuCiA0/xkPGzqU/npxx/tXr4Gq4qyV4xM0PH/jBXl4zjE5ZKUI
 E1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103163; x=1734707963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=buyCc4t3xqs3ieSNCLbiqiwz6a7QbcP0e8DkbJxV415LrWvplQwl3ShCINwj235GpA
 MKVuimkdDw5XTm+iEbiOKBLgZJvMpGTyFumXugYNZDBlHJ7GyqTH/gX9AiXeurzmnmPz
 1Bo/3uaplutxt7PVaV2Q1fWcssOWSGmBq2eQOOa/fdCVtuOYaNDlCCMEBE2+AUd78cPV
 pdJGE00jjR+3XIUoL6XucRtwDzzmBnC+3TVBe+87fWhwQz1rkIBGMCvzox4lZFti12dh
 1gNcts5DvZX/ZvUf1Z1qbv+k+HX7Y/XU9QBqQYF+WbOOWFU2VANYD8ew5khzkm0YB3g4
 CFxw==
X-Gm-Message-State: AOJu0Yz+5/WRU3QNFbbpvsrtfdAn6ofl9X33uh43FLmFiT+S6gmsFPHB
 jHlmvTku47oH2Tr+dlzR0Zhk2Ttt0CTcvSje9m8xZqVJB9y/R9aGOl+u/0lyM0L7WFApNsTJRKV
 dRg==
X-Gm-Gg: ASbGnctISovv/qRs1b0ulqKCVsKHnLo8/i4pARQGQLyH7UmBIQqTG1DcQHn1L+e4mVh
 sqDvP7TJz89/GBoOV7OAPs3rm24apl8sJTVU5px1OTl8VFy2500NaZqt3bLDMtb4H4Fg6G4kH92
 cjCgoUWabV5cwdy/Zfjby0WleTt1R6nnKBZ437KoBsf84Z2oktc8HH5Ru/2dRCiD4BarBiSLM0x
 jUxuVTK/W7z/DmV8yXb4zj0jLAWBBnfqu75D95aOso5gdxbf0J0vFCFH9wPu7HL+TAp5L8YagCT
 7Aku9BlbH8wT/Krxtjwc0qCxoSuURSPW
X-Received: by 2002:a17:907:7ba2:b0:aa6:8275:223c with SMTP id
 a640c23a62f3a-aab77e7b67amr342828166b.44.1734103162677; 
 Fri, 13 Dec 2024 07:19:22 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:22 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v14 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Fri, 13 Dec 2024 16:18:14 +0100
Message-Id: <20241213151821.65748-25-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::633;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PS4htbvGZvxf

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ca7ea92774a..d75e504dcda 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.5 (Apple Git-154)

