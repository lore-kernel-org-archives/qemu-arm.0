Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706890ejb;
        Mon, 20 Feb 2023 15:27:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8gLJwrlBY0AFYTwHZnK8JKFrhwiUaCpmzMlhkwUsbfi8mgbUMNl0T3qIjL+CEkudTC0M6V
X-Received: by 2002:ac8:5fd3:0:b0:3b8:49a9:48c0 with SMTP id k19-20020ac85fd3000000b003b849a948c0mr18187085qta.13.1676935671104;
        Mon, 20 Feb 2023 15:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935671; cv=none;
        d=google.com; s=arc-20160816;
        b=dalM5o3/K036SQS2J0i+qdZhUgF9ihaIldJ8Ps+6Y+eYVe7x0m3r83sartv5LqwGWL
         lBdFYX6v0uUXHj7a3r/ryDgDpB5gkIL0qNXupzw2iTvr1y0URyo9zPtavRzhcOGcpiVr
         nhHu1eKYKcy4neFwJL4AxRKEolZjq6mNL+RgGuDTGBN1hwnydvCPoQCILNY5ms/XjUYG
         X51oeQ0t4p7TwwI+oW79QJYWD4hbdnLD5p0AfbasVZ9It7x2trb146yN59/+I2rXvDrc
         yWrEPYkPQiTJ2Dp3prEyK8Wij4l/1QSO9sW/5zPlRw5DpojAH2G9rCX5aEG5Kc1LWMd+
         enIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hZ5RT1U0BG9RauOmNkX+PjAfe5FY1kHSfa1bLxVuTYM=;
        b=IMz1eXhvwH4haX+W7MpusdT9M85Ve9edzoVrTqXPwTGzUKJ/SRukc5CIZPEsV9csdy
         phb0syNWoMjx4JXX4xCeR51G9usfLIhUWpVwFS/vtxLiBz4JKyClqst0e3l4rf1vfl3K
         wlIhiSCe/zn4ejeSeUk/7+S+AV3w7bUJdpRQkXOTKkoGo7sVmRlslcO1z8J7PGUBMgbf
         CLuU/l6HEP4TexAw7KSdFTui7D6hQAV8D7HfICYMDqOvBTT5cdvOEwhvUzVdURKGmkPA
         +mKac2rYzuT3AifV6WcTGNLlBt1zlFpyJ8beKnDtdJXGWUqdApohD5DdN/eaM3Zv7VrQ
         Xfxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2OkhAs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a13ce00b003bb98c51689si10551416qtk.436.2023.02.20.15.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2OkhAs2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYP-0003jL-IT; Mon, 20 Feb 2023 18:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYN-0003fw-Bk
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYL-0000In-ER
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id u10so2808577pjc.5
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZ5RT1U0BG9RauOmNkX+PjAfe5FY1kHSfa1bLxVuTYM=;
 b=E2OkhAs2HCKxNlV+9SVLVsK/KuBKP8cJAZXpzrPE21cl4xOpbpBS7Mg5sfPF1fVoBQ
 VWlNC5Gz0VEte2zKHbBJF2kyDiimS5TDzla/7U+Ra963vRvZ9KmIKZ45GBflYf7dQoxC
 tQu6PIxDFq4AveWjokaxrneVHwcmTZdCRCO+Yr8Spj/opVkxrsNgGijsOUL5/Tfd5nZw
 M84mtPP+cLM2nRxKKPd5+KXmpNqPx0EKV43p5/em1uJehucCzU8wdavXA35jrKKEo5Fx
 +TgvfPIJRan0+s5jzXAg4S6EsKf3G6WnlTSPZRzticvtBXko9XtvJCtdQxkDqPRt0Xt5
 Fyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZ5RT1U0BG9RauOmNkX+PjAfe5FY1kHSfa1bLxVuTYM=;
 b=njMKY3yloKY+Q/gwfHVJzSXXaK3Fw+84QJHKIjDMZJjNmv4Fxf0hiSoLlDykXqv9kB
 8/Q3QQ4wA/i4rsTP/cjcMZldqxAE9ozybjvKGDHTbiolqzsWsm6InObFbbnSJz34zdHv
 FTv9I+EBCGfuyjmzfeD8rsiC3K0WTsLZRimyh/Qy+qYvO2trl3/HkHC5/5ICOg8sUxzN
 Og9y/SqRrI07Gv+0N0TQxcK4k4/o5aVF/pKhTda0qzpE8yLG1VbVNZBYsXGtN0d9G0CV
 5z4SpA+XVOM+j2vdk93JrL20//nNLagfGhG4Miip0K+1bYd0Fjpgf2EQg0BxwhJ84r/S
 TOTA==
X-Gm-Message-State: AO0yUKWc5NH439LQCErFtMc8F59XNL98J9NUKHg1BlLZg4AZOpe5apu8
 PypllMU8X+Mp+fWGcBJ9xJU8lYpjCYaSFJ2jyX4=
X-Received: by 2002:a17:903:2291:b0:19b:33c0:4092 with SMTP id
 b17-20020a170903229100b0019b33c04092mr3327416plh.24.1676935595910; 
 Mon, 20 Feb 2023 15:26:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/21] target/arm: Update SCR and HCR for RME
Date: Mon, 20 Feb 2023 13:26:08 -1000
Message-Id: <20230220232626.429947-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kwENDUS4Bop5

Define the missing SCR and HCR bits, allow SCR_NSE and {SCR,HCR}_GPF
to be set, and invalidate TLBs when NSE changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  5 +++--
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f000cc54..486baf3924 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1650,7 +1650,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TERR      (1ULL << 36)
 #define HCR_TEA       (1ULL << 37)
 #define HCR_MIOCNCE   (1ULL << 38)
-/* RES0 bit 39 */
+#define HCR_TME       (1ULL << 39)
 #define HCR_APK       (1ULL << 40)
 #define HCR_API       (1ULL << 41)
 #define HCR_NV        (1ULL << 42)
@@ -1659,7 +1659,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_NV2       (1ULL << 45)
 #define HCR_FWB       (1ULL << 46)
 #define HCR_FIEN      (1ULL << 47)
-/* RES0 bit 48 */
+#define HCR_GPF       (1ULL << 48)
 #define HCR_TID4      (1ULL << 49)
 #define HCR_TICAB     (1ULL << 50)
 #define HCR_AMVOFFEN  (1ULL << 51)
@@ -1724,6 +1724,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_NSE               (1ULL << 62)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..42d94e0904 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1875,6 +1875,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_fgt, cpu)) {
             valid_mask |= SCR_FGTEN;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= SCR_NSE | SCR_GPF;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -1904,10 +1907,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     env->cp15.scr_el3 = value;
 
     /*
-     * If SCR_EL3.NS changes, i.e. arm_is_secure_below_el3, then
+     * If SCR_EL3.{NS,NSE} changes, i.e. change of security state,
      * we must invalidate all TLBs below EL3.
      */
-    if (changed & SCR_NS) {
+    if (changed & (SCR_NS | SCR_NSE)) {
         tlb_flush_by_mmuidx(env_cpu(env), (ARMMMUIdxBit_E10_0 |
                                            ARMMMUIdxBit_E20_0 |
                                            ARMMMUIdxBit_E10_1 |
@@ -5655,6 +5658,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_fwb, cpu)) {
             valid_mask |= HCR_FWB;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= HCR_GPF;
+        }
     }
 
     if (cpu_isar_feature(any_evt, cpu)) {
-- 
2.34.1

