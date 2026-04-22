Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136A4F9B607
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:15:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUYj-0007Lj-98; Wed, 22 Apr 2026 06:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXo-0006rL-2X
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXl-0000kl-ML
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso59155575e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852652; x=1777457452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMEvstJVHgigEudV5H559dC48ky9GaKFB5z4g04o+Y4=;
 b=zBRN0HwIMfZvK4E4ntbSwXzh/HotpGxRNaVBt06q3W1rgYS3hLYgkJJT0Jbd7jPukT
 Rr7jNQV7Snfp+gdlp0YKr9zQqFE0AJFctF5bhNYNNUSXPVP8eRmItmAM6lv56MJ3pwpn
 v5xkbuwiHYxeeGfPS1Q/KUtRvusdB6XXtf8EkgKNWUa1RJ6cQiytC/+DuqckzgPjC/+J
 3H/KEDrv4vnZU/HD8v8bQhCjuJzIfKYgEAYn4kTyln2NJ3F3RhhEFO4A6uO8xTEuKNEC
 8wltYPrFLaOrrRtSP74GyeqElGNEJZ9pe5pAakRY4XP/N2suIJBKRylWJ9c/wRl6Qyl+
 +Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852652; x=1777457452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OMEvstJVHgigEudV5H559dC48ky9GaKFB5z4g04o+Y4=;
 b=Dp+itBC1jx1IFWg3GHFgQnEvlWxun4kWMh9n+W91DPSensirUmUa2oOWzAyh0YuLKc
 bnMhac1MndEGklLPFz5Wo65i+c7Hl08tYj9iflGf5GGl/6fo+RJDImkSZUeD7SqYUEsP
 dcTQpi2SZ0DCfFNKA6XvOeuCtUbqDFfPLnBvQx149Nc7sYVcsHzOSgYCDHiEXFcRNqO1
 fTOFeZEtBrrVxrt23QdZ4W9p3TMv2sjjglyoQ3w4R5VdTDPskwUf1R5CBG2i6XC0NBtI
 NJM8Pbt2Ti5YUOjlQF1q2pP2J6og4NcwpzsG4vJ/N7K8jg5ASGLvgdXF/fK98E8cKjkE
 YNKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+G9CYIApyFhicQqbwhlkc4js2P9I7yd/YkSWM9b+Uoac2j8q7zLHtpvDRVWVEzJIVRroHAFzpNNQ==@nongnu.org
X-Gm-Message-State: AOJu0YxtnF1V5CofasueRd7A6CxXyhMtpCMFlEtX4RrqELjeyL7eOyge
 IQUbyeETQXPVCw9uUPDyz2XuXUGzlwZn7+UPXj4j7xDnzRgMc0mTjeRbGwYue2znM4c=
X-Gm-Gg: AeBDiev+GEysvTAZePNBGKxQs6oW/M5icEfNj/uvFVQ5cfucGLsoFl0ZG5Y7buxUReW
 hoMZ9aIvjxfERwR44FjRsDzweobFNFSvEn9Q1Ti6FbJ7zMFFex2ltb06Be9EX/WiILiRfzcKPGi
 KgqmBntgPSBK1ynM+cZxyKN/NscuXWNTHYZEFWOaeDvpehnhDqoAuUNrrGzVlfRqCJ7ncbTucTa
 qDEgQIk7qlPda4aboNuUt9qRCT462WsJ4BsbGyGiRf2ps0aYDr9Cs/SQumZ0qgWwk6JJgHLyzuy
 g5GJNOEM2RGjH0xZMS1vxkucWpey5qrYt1jbmJ5UoagZxIeZHCeGMhWIPmpXMdzHA5xEUg7G/yh
 3fK30P1Sxr9H8le4PFkeU1mqeIgYQdtcoSY3/daeqUZBg6aiNLIFSfFBBzR+XYTMP/pSEMCNShH
 F8Y4vIjXpIwDKfFXApoZr6XOoTpP0OM9u05AzXLOeFnT/G
X-Received: by 2002:a05:600c:c106:b0:489:1ba8:5be9 with SMTP id
 5b1f17b1804b1-4891ba85d07mr128773375e9.29.1776852652050; 
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb77b001sm203412585e9.3.2026.04.22.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2899B60ED5;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/31] target/arm: migrate Granule Protection traps to
 registerfields
Date: Wed, 22 Apr 2026 11:10:20 +0100
Message-ID: <20260422101043.1234229-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 6fcf0ac7572..bc65106c61a 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -462,12 +462,36 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
     return res;
 }
 
+/*
+ * ISS encoding for a Granule Protection Check exception
+ *
+ * These are only reported to EL3
+ */
+FIELD(GPC_ISS, xFSC, 0, 6)
+FIELD(GPC_ISS, WnR, 6, 1) /* Write not Read */
+FIELD(GPC_ISS, S1PTW, 7, 1)
+FIELD(GPC_ISS, CM, 8, 1)
+FIELD(GPC_ISS, VNCR, 13, 1)
+FIELD(GPC_ISS, GPCSC, 14, 6)
+FIELD(GPC_ISS, InD, 20, 1) /* Instruction not Data access */
+FIELD(GPC_ISS, S2PTW, 21, 1)
+
 static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc, int vncr,
                                int cm, int s1ptw, int wnr, int fsc)
 {
-    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
-        | (ind << 20) | (gpcsc << 14) | (vncr << 13) | (cm << 8)
-        | (s1ptw << 7) | (wnr << 6) | fsc;
+    uint32_t res = syn_set_ec(0, EC_GPC);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, GPC_ISS, S2PTW, s2ptw);
+    res = FIELD_DP32(res, GPC_ISS, InD, ind);
+    res = FIELD_DP32(res, GPC_ISS, GPCSC, gpcsc);
+    res = FIELD_DP32(res, GPC_ISS, VNCR, vncr);
+    res = FIELD_DP32(res, GPC_ISS, CM, cm);
+    res = FIELD_DP32(res, GPC_ISS, S1PTW, s1ptw);
+    res = FIELD_DP32(res, GPC_ISS, WnR, wnr);
+    res = FIELD_DP32(res, GPC_ISS, xFSC, fsc);
+
+    return res;
 }
 
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
-- 
2.47.3


