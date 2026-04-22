Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E51F9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:18:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUef-00076G-5l; Wed, 22 Apr 2026 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeL-0006ye-VX
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUeD-0002Mz-Kv
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:17:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so69780885e9.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776853048; x=1777457848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHt/fkh4CQTgDK0U2IQzNp32v6ZUUxM/zBvWXPy5kqQ=;
 b=rMkYgyCVxR0x/IGkZoHlqbDBuMiCo41H5fBGAj7wNhFryHQNV+J+Mhdwb654IDqYjX
 5RiKIg/trrCSAnqxp62aAe5LcSZPCLBL6nbfYdnOX4Wz09cIDXzzECO/2xt8PTquUmbv
 fAzyMfZ53jhrmSesK7S4x89cFUbaqpNKOJuCEldlIQINtsi419E3GxqYz52b0uXvHh/6
 Cj2bBctBXdIdnCSs4U+4fLS2blJEGMq7CvvFdhue+AHdDtRIMICJIdrSUPubVofn5mNk
 rZ3Y3y1l6UMoQuXGVJzNCdcPMrGBCRVKCt6wNzZUecw2aJImU1QbMsw3tZCDhiVTRkkk
 hZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776853048; x=1777457848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHt/fkh4CQTgDK0U2IQzNp32v6ZUUxM/zBvWXPy5kqQ=;
 b=CmKvQgrs68wTJ33ppTxOydsgFCUjo1y10mkbgi6frdpYj0q/mgI+IbijOKPVY/JYvm
 U9+IdOHhcs0Qmb+MGO/5Pt4NffgoI3F0pPEa+7W5MWr6DQ2KzsFdnDzlkEVSPFaZxWC2
 KYh2dR1ij1+eVKjt5JBp2iEhdSBXLxuNiiorpF6OCh7oGGBHemxyd8WthhsAvXjggbay
 Kddm0Zv6fz2EvSTaQOO5zHAY0ttX2KaIP+a/pfymfS/2HupKBEdBvoZxwKJ2PfaoCOnr
 eMKgZO9wgZmWsHhnCfJRyQFhp0TgGvTn8gRnZmHCjyOp7sHVgkcB5QjlV+WxvnRft/5q
 mmqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9aKYlJDQ4+qpU5lisAPJR5mvCcaquWrh08qjF8pjP4MfCX8ECaIDqvK4E1yIpk1IAIoMn19JL05Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw26cLIXRepNrZXmpKXjWh6v2ncxnKSxy1mFUNzkinglyqX3EuJ
 7Mbq3FXSo6KDNJRXgMu1YbQWlbaGHm9wg4NsaEFnMD/kj7fXef4aACeJAgB8hfwbqFTeXaLhAPz
 6WV4eTSw=
X-Gm-Gg: AeBDietQ8kq8c7R2eph98rMkfmbNFQUgkLl4RbgakOCrfziqqsogeBjLm6oHWXEStqb
 n3LuN26rmgI6PJimH1sLfoWWXhApAqsNGkjH2+IGWWtSehwm1gY+I6o6Etp2nStn0iDI52/HFg+
 xy/au1OEhUmc/OxWZYYO64Sb3e2404mbGL2VAjkMxba2jNJuHCF6yU4gytQy/1Eqa12XQUPU89p
 Rxna0Uqa9DY/Kok64M7RuuNS84wRwhgtmzZxLY/8KXB6t3o1ANcjmeGiwwSUmioVzERD/bLk5lc
 5HgnC+oJY0ASoi36eHz3pb7bkNsPDmXT0Mj8gnIeltYGjFA8F9MM/C6WvwBJ8YUIZOk2sNBZRMC
 FoeecFWBg3KcUvYHUmVxZwk57IlBkuxXUs+R/yP+G50r+IfKZ5g0B3VJmjwUC/IP6rnG1EBjYl6
 7kTWXZ1gtzxnZ+8x7LSl+ePFgO3Na/xUzUPA==
X-Received: by 2002:a05:600c:3216:b0:489:1ff1:74d3 with SMTP id
 5b1f17b1804b1-4891ff17521mr88617735e9.20.1776853047996; 
 Wed, 22 Apr 2026 03:17:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cdfcd50sm84551615e9.9.2026.04.22.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:17:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 863CD61667;
 Wed, 22 Apr 2026 11:10:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 26/31] target/arm: ensure aarch64 DISAS_WFE will exit
Date: Wed, 22 Apr 2026 11:10:37 +0100
Message-ID: <20260422101043.1234229-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

This mirrors the logic for DISAS_WFE in 32 bit world.

Fixes: 252ec405768 (target-arm: implement WFE/YIELD as a yield for AArch64)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 073454b9195..d79c8ab431b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10917,6 +10917,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
             gen_helper_wfe(tcg_env);
+            tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_YIELD:
             gen_a64_update_pc(dc, 4);
-- 
2.47.3


