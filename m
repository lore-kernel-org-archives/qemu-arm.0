Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44056CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:23:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jL0-0006Uq-Ob; Fri, 03 Oct 2025 13:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIn-0002va-US
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGs-0006LJ-FW
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:41 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3304a57d842so2239769a91.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511316; x=1760116116; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6099xIso0OFn4ttKkB5bkTTJ8lJK+Y0KaGWfua0ZG/Y=;
 b=yM+d17XAQxEdKAHk4aETETD2afLQtejDD6oX+mrEkO0Pkuke2q8H8ltA6A7wHhsZtp
 Jbc/kEB5Wk6TL0smCw53UkNaTjhxL4zGr2XTHHmfyXLHZapgfw63Q1AnNwMWzxbvsLcA
 UR/QKGpkDTgvIbtQXo0GZfgVk8fxhKMM56247Xdtv5KI/2mBoWowMA+Bv72PlRe6MJM0
 5yvmnapuFzFfgsaWNMj4BryFRguIQs7sbHT7+sXR6my0rpyMS7zF4mTcc5B+HgzjvNpE
 zjC0Y0lUTUELv00nT5ZRoxhDiON+aYg0irhkofQNt60Ytycdbi7i4uuJWl7Lv6UDwPip
 XqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511316; x=1760116116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6099xIso0OFn4ttKkB5bkTTJ8lJK+Y0KaGWfua0ZG/Y=;
 b=bj3EN4y3VAC97rKWq4KsAGgpuZ+Dp+7FLZAjTRk4lu3d3kvoH1+gJtkLIg/xC35XPo
 WVFUsfiTleWn6ICFEo2dCVu20DqtxFc/XeO49IUAkRqaqjWUpP9CxwiocSM9g/5uaMCf
 dUfrYLsQA3aoHU3zXD5jqJ6SEefS0zoOsfxiKelHMcrEdYXvv2E/fC90Sm0ldKSfWRbf
 oGJXxtiA2/B2pp5NC4KsgnOt/UKsGYqbygM2NWAEIEz2t6aiTihzxh0rVlgWKJYBLQkZ
 teaqfqTXfOcysEbc+khI5lW209oLBYhNDgALjPohUFqzQGMWJ0D0PBsIeQW1QfhJdhdC
 gHQg==
X-Gm-Message-State: AOJu0Yzx7XhZdZF4LIFSK0MmN4t5uABnd7lVw2f+zidVYg6DnLWDyuJg
 r8m32b566lDSXRiLPl2M0BjLuIKnEM3zXWgNeUoz8OfFgc6qYcS1/bnrvnlWcW7WcIg=
X-Gm-Gg: ASbGncsSBAnX02TMDpG3d/TvDQF2+UimOpE8pz6pebVsyzBEQJ1yrdVjNxS98aMoAU7
 CSGslkxOGtmbuMMG1HRDlDO+EJvgxoppjsYsfalmlc+OYmCoCVca3MiCSXjCwQOzUMJw0JshXS2
 RYt5pSfUNHfjIlQcaX/nXK6gKJgpzAn5anSe+xuT48Dy2dN0FeSuCCfzM1gXGjb+3uXiubW71qx
 zwnuFN2EnKtiPHkzNDHfjaWydPZJ+tuIh+/G1Yr0GAUTpuoPKtEtFOt9gR0iXm4Bwf1CafEMcxm
 LXARrXKXqKoE3GEFb9TohmtkkKE/4FDi+y4ybknk3pMiorHCKjdchuPQscgFktttcQoCvx5emia
 q6xpCJmtvK9zDyRByhL4qQWDnm9hR8GeXLzTHOWMwGmdd951EJekbgUCP
X-Google-Smtp-Source: AGHT+IGvV+/YWrcJOpkQF9gN2Klx+XnZynb+vF4fIa238yIbgG37PSESG3TYD9gXiIYywqtYwYB/VQ==
X-Received: by 2002:a17:903:1c9:b0:274:5030:2906 with SMTP id
 d9443c01a7336-28e9a6570fbmr46122925ad.46.1759511315672; 
 Fri, 03 Oct 2025 10:08:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 39/73] target/arm: Use arm_hcr_el2_nvx_eff in access_nv1
Date: Fri,  3 Oct 2025 10:07:26 -0700
Message-ID: <20251003170800.997167-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4d66143f46..b84cd3fbbd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3427,7 +3427,7 @@ static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1 | HCR_NV2);
+        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
 
         if (hcr_nv == (HCR_NV | HCR_NV1)) {
             return CP_ACCESS_TRAP_EL2;
-- 
2.43.0


