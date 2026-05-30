Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAADCD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:13:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrB-0008Sm-4x; Sat, 30 May 2026 19:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr5-0008Pi-SN
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr3-0007Mc-65
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-36d8b644473so263574a91.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182752; x=1780787552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfTQIO3Td5ZnJtjFXmscxPDzamgvs+aWLTRE3ZdC8D8=;
 b=bc6pqyPdhwix//MalUMbWfv9uSuxUubjkURyV2DSU1Sn3f7zlJO4wFrEuXIvXMquab
 AzNY3nABKOV7FMb4mn0U3uldzFSiE4pbYExYhamQ4dySf2EthwkZp8pTfl1CrTFAPjC+
 9mNomZex7S9S6HCGwAA3hDjUh2dbXg/jaXlx61xPlcVlLEmnSJwoDxnEn9aqm4gx7z38
 qQpHFa8OoVIHX+W/hC9UWTTmmtWXRVgxz3F8nsz2k6jPexTWnHcri18WrfD0t9VYTLki
 jjGtgXwB3/7oVhtDfUifCWho68oSnm+QdYeyc7P3ggTfGRannBo6dvjc0Rx88VKohkhz
 HIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182752; x=1780787552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dfTQIO3Td5ZnJtjFXmscxPDzamgvs+aWLTRE3ZdC8D8=;
 b=IpPoK+1FLUWRfkcOtkhLL/aKV5IwyWEQf8DiuvBEG2iQdOGuw7Y1qXwe3AhuMC/EC4
 n4oagwU9Yg2w+mJcXkHEF+jH/UZC7+MzIwpNsu+0Q+GLrasVzteCJ0p4JklW4x17FStC
 dB4BPEpKwVksYGNSTWi40A3Px7XhPxaJgR2a3l8VOAp8L36h75Kvhc1leH8QWUKByG+S
 dRczGiNEk1lXBzFNw3KDv+1CCwtTRLJ68GXuYUX0gWv2dsNX0T+AhX1Yj6DDh6/Q5fR8
 FmMxdOtI7XlE0AaicwwBd2D4ErF1CCHXRkQSgQTZ2TSYanA/11U/F+2AwvFKIUPDzNHl
 sv/A==
X-Gm-Message-State: AOJu0YwkawwUIpXyyBayBGl4SGJU5uQ7HxFhJAcwL9n/xWhgyrMzNzRs
 SyZCH0YscH6CzSZFc6zQOHR27rr7kd4skxr68W8uzlObiF5zn9itVeU7TSnpN7xOTwus/5u7O81
 96673DLA=
X-Gm-Gg: Acq92OE8EEiPUsMwRV6t3OyDzx4U2Se2nxnc8lBPo9373Ym0eBjpwGWQacUt1aXq/Yp
 7PNwzQ1C0BwCBSF3UaTM2wXEL6Gr0PyB8VXJP8aYzV+4l218tjuIEusk6Nj3tmlSBOjG8UJLP6o
 ffv54uC5HpwEwaLClfmEAjdDvY2lCa3oDSz3oeKyZxFlIk+5BRI/zCENp4sLlEAx9UL3FJoqzzM
 FCnJgebO01dkMBrvAjdYAtvudUnAcvluWS5fr0CE+tab6178fw1ZLKNHKjPZh7WWo93PADMTwFz
 dxt2HeCa8XAtut4xJlXmi02/me3ORzZni2U6vdc7cMKd3xIeg4m/5Horcq12R9V8QiqQHLP2KGK
 q5RvnjE8/uym+AACoEmPFyupYSJeDu68hA0FCTorRglawapCqqMyKlslorTfNeGPo+U1iEReNMJ
 tJ3CGMjBr2TJW+2FihvGvTsC2mLcKF0e6kcktILb4=
X-Received: by 2002:a17:90b:2f46:b0:368:a297:bd38 with SMTP id
 98e67ed59e1d1-36c4ff3a634mr4539942a91.7.1780182751649; 
 Sat, 30 May 2026 16:12:31 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 01/41] target/arm: Introduce arm_init_fp_status
Date: Sat, 30 May 2026 16:11:49 -0700
Message-ID: <20260530231229.400441-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Create a function to set all default controls for a float_status.
Other settings for specific FPST will be set afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a13e6dae2a..b75c6a6622 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -304,6 +304,13 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
+static void arm_init_fp_status(float_status *s)
+{
+    memset(s, 0, sizeof(*s));
+    arm_set_default_fp_behaviours(s);
+    /* We want 0 for all other settings. */
+}
+
 static void arm_cpu_reset_hold(Object *obj, ResetType type)
 {
     CPUState *cs = CPU(obj);
@@ -626,20 +633,16 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->sau.ctrl = 0;
     }
 
+    for (int i = 0; i < FPST_COUNT; i++) {
+        arm_init_fp_status(&env->vfp.fp_status[i]);
+    }
+
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_STD]);
     set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
     set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_AH]);
-- 
2.43.0


