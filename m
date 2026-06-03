Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B66CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcHy-0006Zy-Iv; Tue, 02 Jun 2026 23:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHv-0006Wn-VT
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:03 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHt-0003ZZ-QX
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-36b9b15af73so5634036a91.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457340; x=1781062140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfTQIO3Td5ZnJtjFXmscxPDzamgvs+aWLTRE3ZdC8D8=;
 b=KOHXU8EXWvAODbPmDi4fBWyf+2eyOLmQVp8+JwmffPyyOjxnxnBuLMAbWXHjrMVTsu
 13Zy85KHrvxaW3227MMsPHQgs58vjYE0kJOtIW7yrd+SloJatZ5rWY1mnSvR34umyKgQ
 uuVj1VyHud/H6Pzo0vDPL5KgdWFrWuKrETuXrE/hFTIVtJ+G6zKCutatBcrNe2k5VXtb
 walykXcKc+hP+c9cpOcClqjHOuq/z2suBYpnWBSH1HFVk+lCiI+Q31p2PVTvUoFuOw7o
 OmOnAn+CjKHQ7ptEgOyCVZBeUdIP16auWdCYJJ/BrXswAPIC5IcJUwQl9QXD1cz6TqlP
 f6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457340; x=1781062140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dfTQIO3Td5ZnJtjFXmscxPDzamgvs+aWLTRE3ZdC8D8=;
 b=A1dKDP1zjIJPqaWddi6Wk8RhXuDlubMHTdRyQtrr9uVhV8jP/ovygdZeqv+IiJGfrp
 IG2NBak5HER35pdMcAfcPqxHjLOhKxx2QgTz5awQxxT3cvYU+IeIMdScBt0wrviggk+9
 jqJxfm5+frjeii2h7rIjTKSt1vtqbC849pMhc09RXFc3yumhaSjcgAN5cKY6P7fIcGkT
 kvK/EbJ//tT+3sY0eOe1azAjfylWaA3/AzqugQ10LodOlH+UN/iVlzar8+2OO3nlZI99
 qj+eDK6wfb9Askm+O4I4aEO7Hjtd81HjGtiDYVTkdcqr+xacAhGCDuH/6i+ZsQMpFjuA
 069Q==
X-Gm-Message-State: AOJu0YxbAcP7accSsuBpqjwiKd7apGP+FkO1gtqauSGPWPTulorQIJEp
 Q0/eXbImFdmF94fj0VmhNs+enhyvfDRbFso9GZgbiRjife1pvLdp0t4TBbFOdw5YtcE=
X-Gm-Gg: Acq92OHhFpo86IaOl0cWNNR7C3M8+No2h8M3YRFp6LWm2rtO2W3rushA30Lqcf4+e5D
 4l4Z4O9JImxsm7oAvDvxbavoirKdn+l/XYNx9kOPcheOlZNpml8pt8Zz0+LrDIHtM2oArlOYWxT
 1o6KAHnVH7iKXRzq40cr+lAYi7sWQRVLDP/E8+pduI4iJCobvW9jf4ooB4O8Zv96x2h/aa8XUT9
 WLv3Us/EJdM+bxwjAHSPqA7T+fnVQApnmFCTbymx6Hciee1FfabXpC+f61LeDSTYXFKGeaWCLH3
 2ZWeqUZFyNe0rdlPlUw9B9pnYEwCB/tw6k8+QHLc1OKQP8AEPYAJu8QS2zWlzYpmY1Ad0tVy5FM
 4LdnxjbLy3M0yNJH8jkV3vbwHjbX7TpgwHPu48ri4f8Ue6BLexhlrJce0Prsf5TlfZwh0pm+iXH
 KSlhMw5xY4toI7p9u0KuS5rDPKNfO/AuRtDydYc2U=
X-Received: by 2002:a05:6a21:685:b0:3a2:f402:50fb with SMTP id
 adf61e73a8af0-3b49790c257mr1772805637.34.1780457340303; 
 Tue, 02 Jun 2026 20:29:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:28:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 05/45] target/arm: Introduce arm_init_fp_status
Date: Tue,  2 Jun 2026 20:28:14 -0700
Message-ID: <20260603032855.106930-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


