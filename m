Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3293818ejc;
        Mon, 23 Jan 2023 16:01:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgYSYkoMCaJpFZmBVTrzPB1cxPatX+J1/c2z7w3GbXw/xKvXhxX4VOLnkyVVLjhgGSWRKr
X-Received: by 2002:a05:690c:dca:b0:4fa:3b3:109d with SMTP id db10-20020a05690c0dca00b004fa03b3109dmr15859192ywb.15.1674518466710;
        Mon, 23 Jan 2023 16:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518466; cv=none;
        d=google.com; s=arc-20160816;
        b=iVISg+hql+kVG+uElxjnPlpF/GjjSTRqPU8hdV3EuZ7o4hxhnjUc9VM+JGNxzRHFeo
         hPPwveVSv3nJhOCtZNF6OO/qJPGefQCMPKfUrxRplEIsTSrJjcLD8hukHZ0knkvtqRj5
         sNwmjoFqtJcY5TMZhF1q2BNZpXlEqyyex3ydwhNqXlyzAMAnr3xHCM5nLfm9i2H8X1i2
         G2Ry4CHVTThAsKpwzvQ1wMMJNHGOQyLYADBa7IYzKc8PWjopZ3cjIfcOnz7895KjILxt
         0rgECQPjbutqbG9buVdQ/f0JiJSLkOz6dOTPXhAqkugOil5cKOXoke0KN1lBtP6ZNC55
         TQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4KPCpSfOS3MJgxEieajg71yzTiyoHQkyPgf80iICoXk=;
        b=PPjA6r4KBChHTunwm//iepfkBZtPsVIu9wVSxyO3mESBy6D7OXc+uO7P5FMfrfWoZ0
         z0HYA5cFE6F4bkKhquuDJKfKIrG4DEm7+Y8vk3Y2MURj6IDnUQxJ1RFB4PxnuBT6p9fX
         g0kUK+pG9BBr4+NXIY5dLOTFqmCJR6p/rGo/nVq7Mxznap+60E+ZKRTVC3kuz0+eHP96
         jxIx22lHLhhaZiqWpqpjdSjTENX/DZR/NibBFPX4Vf46271WKZamXqbcdw8mxnBGtoY5
         14PNC3qocxdN8x+7npI4sXJjaccYvNvhq45WHo0XY/4VpPwEGyGyzSNI4cuU20ZLGR+a
         +N4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQ15xiPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t185-20020a372dc2000000b007069ffd02acsi421769qkh.760.2023.01.23.16.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQ15xiPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kH-0008Gr-Vr; Mon, 23 Jan 2023 19:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kE-00088V-Ny
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:00:58 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kB-0001rD-FI
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:00:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id q9so10246212pgq.5
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KPCpSfOS3MJgxEieajg71yzTiyoHQkyPgf80iICoXk=;
 b=PQ15xiPemBcAFX7MBj1LRvs+4eHEz4bC9dqtgCa4H9FMD8CNyZff0+jn7G3RYoYrNS
 GJUTsrjedkyyygRoGSb4TudSqaYOPM2uH879/W2VYmINlMBwELjsEvYg4KyfLAjEQ2YN
 H4QjLlmxrAzlxZzEvdckLVZ0lsy5hwLvmNEuEWs2HnzbsUcOPKFgokT6qLF4tez+327n
 x8OxOXKFitlDGmJVI2hSHAziupH+6JF/PQywPDw0zZTxkhQ0/IrAOT3E2FfeS+95B62R
 0rCoKdb6dy0ggHCcwLmU3SxHntV2pfFPLPXoeInNRXj+I6LCSi9kM/dO7E1TZiV+29oV
 e5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KPCpSfOS3MJgxEieajg71yzTiyoHQkyPgf80iICoXk=;
 b=kgw02kmLgZ1f4Be3uCOgdkGJlD4pdsOm3O7+f0jUT0hKdPxcxIiXALSMPxrclEtkmi
 5/ETNniKFKxaH7VtD62Ac+TNSxjLjirTYU+LUJ8UFuSd3Wts4Sk5mLH9oiZaADTSgxxS
 sgtNEbU3b/Iwrv1YU9VipicIJQIyi8uu3g8FjKxSj2ObGkP/+0Iz0YTpzad6Bvv0plpD
 EVXGd3xHoBl4hTSmPbnOcZtQKR+CdYKJOK1C3MtgR3l0GGIkOub5PPegn7fQsXvVh7Py
 fdG8IgjYBRJHQMNBH6yN2ko8SFmsyCRgs6ejm0ub74EWPor5nuRCH/qq5SWK1cPW9YCa
 DE+A==
X-Gm-Message-State: AFqh2kpEGdfpHlQjVQ0N+VukRTiTjSl0/3zZZINir9re1PMWk7ZVjyd5
 JOU10sxOv6j5esJjrZzefaItBw==
X-Received: by 2002:a05:6a00:430a:b0:574:35fd:379e with SMTP id
 cb10-20020a056a00430a00b0057435fd379emr25538922pfb.2.1674518453705; 
 Mon, 23 Jan 2023 16:00:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 04/22] target/arm: Update SCR and HCR for RME
Date: Mon, 23 Jan 2023 14:00:09 -1000
Message-Id: <20230124000027.3565716-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: JA+pAFTra2hD

Define the missing SCR and HCR bits, allow SCR_NSE and {SCR,HCR}_GPF
to be set, and invalidate TLBs when NSE changes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  5 +++--
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 81d5a51b62..9d1a6b346d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1638,7 +1638,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_TERR      (1ULL << 36)
 #define HCR_TEA       (1ULL << 37)
 #define HCR_MIOCNCE   (1ULL << 38)
-/* RES0 bit 39 */
+#define HCR_TME       (1ULL << 39)
 #define HCR_APK       (1ULL << 40)
 #define HCR_API       (1ULL << 41)
 #define HCR_NV        (1ULL << 42)
@@ -1647,7 +1647,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_NV2       (1ULL << 45)
 #define HCR_FWB       (1ULL << 46)
 #define HCR_FIEN      (1ULL << 47)
-/* RES0 bit 48 */
+#define HCR_GPF       (1ULL << 48)
 #define HCR_TID4      (1ULL << 49)
 #define HCR_TICAB     (1ULL << 50)
 #define HCR_AMVOFFEN  (1ULL << 51)
@@ -1712,6 +1712,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_NSE               (1ULL << 62)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf1..293f8eda8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1869,6 +1869,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_hcx, cpu)) {
             valid_mask |= SCR_HXEN;
         }
+        if (cpu_isar_feature(aa64_rme, cpu)) {
+            valid_mask |= SCR_NSE | SCR_GPF;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -1898,10 +1901,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -5578,6 +5581,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
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

