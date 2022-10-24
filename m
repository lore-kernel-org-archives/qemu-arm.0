Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3069710ejn;
        Sun, 23 Oct 2022 23:22:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5o7qc8T7GdjpXeZL/INtEPJ3PQzqTThPWIBJRVPmkANXK8PHomiTcmV1wX+iByJtflr408
X-Received: by 2002:a05:620a:44c6:b0:6ee:7a7a:93d1 with SMTP id y6-20020a05620a44c600b006ee7a7a93d1mr21256472qkp.256.1666592521163;
        Sun, 23 Oct 2022 23:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666592521; cv=none;
        d=google.com; s=arc-20160816;
        b=06Awn2I9Su6YFw1P61P0+iDRG6VLv7u/9KBF0dd7V0u0TJAVksXURFeHTP8mesmLsc
         9Pet2GcvSwemarQpEXTPyKpi0iue9WGslGJCYt/3GGHMPgTmMAOQz1pRXSc877U5vL7r
         GTSrsaFNv1mlFtsJ8ymsNUtdqfIRzLNY2afa6GYfqCI4MN9O4cm8lTsE0EZzYJp7q6VE
         EotbvMSgriQ8H+XYHVd47Kcn2XIy7RMahnH4mbVrlUtU/QVIjOnZucZuzMOjLMcJjmv3
         Lvxg1HYjWuv0N4f6e2hNmpZ8ZlxrUdWWQ+IxsNX/1cwua8HMJDrtSS8wvMCszOrIYtEe
         laXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
        b=kVrCKPYSGJ0WJexvBLGQG+yQLskytgwN3QwxXgMNzGEepXpgSSCgnS54PW9dq+oZqz
         1MTZI9x9+i5JjoIvvrYsdxEFx93Gm6CspGfolatESXiQ+mUnGSwqk9HXvCpD9bKy8sh2
         FVYwKGl69oK5hmX5S+dw4GxbIjkrJr+yAfHWNcLL/HDBQSbgQJKE+NgFlo4cYPtSt4N3
         /UTnCurfB80NwusrAQvmXK7mWh+f7jvh+BuH0Vl+5wjusWTCU/yZc+ZJx2rGOqELvk5j
         5YlJIUsR1ESFLPo5qQ5n9GOSiGEOy4H2YMxWNSHkwToveJ2CP4Rc+u+sVfK1WYbNY4Qh
         PJrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2KHSzBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23-20020ae9ee17000000b006bc63907459si15782461qkg.441.2022.10.23.23.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 23:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2KHSzBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ompsh-0007E7-RR; Mon, 24 Oct 2022 01:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprj-0006ZL-Rb
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompri-0002Ks-3p
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:11 -0400
Received: by mail-pg1-x529.google.com with SMTP id 128so7841720pga.1
 for <qemu-arm@nongnu.org>; Sun, 23 Oct 2022 22:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=Z2KHSzBAkg2Xf11Snoc26pJ3BxAl+a9asBngWvnZ4nfKXr85BySTz7+awp+hZUV4H4
 Ps7VmOF0gzlKaovvEpxhxgpfiHnR+YebjygBpgaAvya8dtM+CGQXZV+gWqsVkzi/soem
 7jRYNyZaHPmXYOK+EN001GlKqwDcVzBGuEIgN4dNVbF3p7d1CZWkaz+gUHDdPQJCaugU
 3CL/dmQfwVxNAeWY4xQx0PVbWZ4ruZcQhoIHlRHkA1fcX2xBqxt9zhWpJIAJJ5kTIS/3
 R5adtZg0+UsshaABgNBMkqL0HZOvxjXuMJYTmk6Nx8hoR1sxYyhViGnkdHjN5z6mJ1Om
 I6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=CZBumNr32tt8R1OWstr6pERZOumBvuZ64SCKWpAefYfnIewRQDkFgLzeH0X3G/H8rC
 DO5jNdPxJ4/3q29GzP+JPE8Q/nEK0lRni4VrPeprf5T+sPQZrluExsGV0MmrNtYIqaMt
 3gP/izpaNz4FQwEqUPHpunkf2phkS6pxJ9dylHXctWno5CX0VM9K1ZW0ryr9jxJIhQ6C
 ND0/mNkUbfWffjoHM+8M3RQba2wyWLeyn8iwAN4dgeA9HsATJqzHqHjXVDDHSdEagfdb
 k99V5mJjhZ1rT56ZME2dUi+GnIRGDxI4EkKZ/9UErFiQ8CTQOZSMD8+Tyjj5wau+1aEx
 mQHg==
X-Gm-Message-State: ACrzQf3tDFXVXfSc9PPpDne3kK2E/oAOZMR4DTFQdnRlmTJZfVcDvWFO
 MhjQnyNUzKu2J71uvHjg6KdNBY42hAYLzX9Q
X-Received: by 2002:a63:b545:0:b0:43c:2ad9:b00 with SMTP id
 u5-20020a63b545000000b0043c2ad90b00mr26701098pgo.535.1666588748701; 
 Sun, 23 Oct 2022 22:19:08 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 04/14] target/arm: Extract HA and HD in aa64_va_parameters
Date: Mon, 24 Oct 2022 15:18:41 +1000
Message-Id: <20221024051851.3074715-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MA4kTifaET43

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b6889073d..16d7989604 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1046,6 +1046,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbfaabbc09..6c7a8beed6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10577,6 +10581,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1

