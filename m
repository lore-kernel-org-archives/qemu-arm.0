Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07082F55452
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 03:47:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv5s0-0006WW-7o; Tue, 24 Feb 2026 22:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5rx-0006Vm-LT
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:47:26 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5rw-0007kN-2G
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:47:25 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so59545425e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771991242; x=1772596042; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vJq942fD/Df/iDSp0RynXY9ETFe2sy1oPhW/bPRR88I=;
 b=Sgcc1SfWAOKANBHhvu9gWjBtyScTMqPZkXtxJcpyhJfUTyD3/VltWZXb4+ED4SX52L
 2DkudMW5zxLxs2f+q2EEd8/5j1psOYkZNMxCew28SpnQ4V+v+XowpK4gFFviI9U9i4g/
 mgqu9ry0EnQm3szDJnL2OWtNeXneVocGBDCmHAE3XrHI//fKVdm594t1UBv237hDExtL
 LPimTQdMTpBDWYqPwquFK4N4BGjOFO4aUiJDHcKLULwfQ4FAV4HmSrrwjmdsPytyO1oe
 +hQpLLLOZCAt6UFcaw/WpjA6Li9DpIkVbdqYvI4w9xaY93CW09Kdj2StXt8i3nRbW2en
 xUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771991242; x=1772596042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJq942fD/Df/iDSp0RynXY9ETFe2sy1oPhW/bPRR88I=;
 b=s9Hz5pSAY9Ge+X7roHGffF7bacYmXkt6P+vtqpw+ILNhsGQCB0Jdp/qFZTMmubTc8H
 0qxv1L5D1HBQFz/A2ev6D3XpU9n2OyvNMX9xQBcPKK7t8IZDT3exi036UIm6d5uu3DKp
 0t3VvCNi3LfXor5RWv2EoonEGE/EPFIPyGQlPaqdLLgw8zR3Fd8ZJajiqQ1opa72OC7z
 LF7aPgE6HrPdGrPEcJ8oHrmhfnkishlAjii09kcMrjsh1eztW9n1CKNTomNQJ9OKFFij
 8Khkjz+4wLuADsP2LCCTbmxMmYp6Y9xadxvqpryzZRsfLXPQnmT/acJzs+MyTxqEjcYr
 PwYw==
X-Gm-Message-State: AOJu0YwWGk0XVTGm/lGg8pNQuGnIfso2oFriaQFxdwX2tWJXdJq3iC1B
 czEB5Maym2jwhKg/IjvaR8vBQt6FeGH0vT2Hyy0pbudYBQKQP3I5OvvpbC19t3+bNQE=
X-Gm-Gg: ATEYQzzoMqrm/waK7wOZQCJ4ru+dG8in50nLWgUPORvpJdaS+pTY7xT67QP5cIM1wv6
 HWyMYSEcaGyqyJ9ABLxnE0cXQxkcm4a51GQ5e8OMq0kc5XC9XkTwm0gGggLiTgiH4EGd5eCNBRX
 zLWFDzq+qFK6Q4bl4901Hiox4Nkt0JntpYJWRL5RFBnMcEv86jTCttUldP9IqPZYR48pzK4nHcZ
 oNoClL3h3gWG7IEvdjQI3n8zlim+PxyhTSnMXd30hs9KHVFw8AKrMq2YJiF8Es3mwZk7462Q9cI
 t8cVvzVua3a3ESQPVbNSp6pleu5Otm0UPmlHvU0gjyuJ0VTtYsRPlJg7AImLAq/tVUcgWeeU2Yd
 7m24fRHMtBkvGYWKswQ/XQqi+2Z2ny2qL486vhk79dh3lbJHinWpAAG+pKgQp7Bdl46CWT/gh/E
 +JaB5CevuhMG0Tg1RzPCZon4ALRXfqE5YiuBTfqBQUKGHhrQ7NBMZLTJeorPoZqIbErf0gXO4Y
X-Received: by 2002:a05:600c:821b:b0:483:71f7:2794 with SMTP id
 5b1f17b1804b1-483a95c9e73mr259568975e9.15.1771991242277; 
 Tue, 24 Feb 2026 19:47:22 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd72bd66sm37582405e9.11.2026.02.24.19.47.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 19:47:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/misc/allwinner-cpucfg: Remove use of ARM_CPU() cast macro
Date: Wed, 25 Feb 2026 04:47:20 +0100
Message-ID: <20260225034720.41495-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

allwinner_cpucfg_cpu_reset() doesn't access ARM CPU internal
fields: no need to cast, pass a generic CPU pointer along.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/allwinner-cpucfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/allwinner-cpucfg.c b/hw/misc/allwinner-cpucfg.c
index 3a1526bda0d..f8dbfdd120c 100644
--- a/hw/misc/allwinner-cpucfg.c
+++ b/hw/misc/allwinner-cpucfg.c
@@ -84,7 +84,7 @@ static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_id)
 
     trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
 
-    ARMCPU *target_cpu = ARM_CPU(arm_get_cpu_by_id(cpu_id));
+    CPUState *target_cpu = arm_get_cpu_by_id(cpu_id);
     if (!target_cpu) {
         /*
          * Called with a bogus value for cpu_id. Guest error will
@@ -92,7 +92,7 @@ static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_id)
          */
         return;
     }
-    bool target_aa64 = arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64);
+    bool target_aa64 = arm_feature(cpu_env(target_cpu), ARM_FEATURE_AARCH64);
 
     ret = arm_set_cpu_on(cpu_id, s->entry_addr, 0,
                          CPU_EXCEPTION_LEVEL_ON_RESET, target_aa64);
-- 
2.52.0


