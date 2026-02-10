Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF053EB2712
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:17:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9e-00009W-P2; Tue, 10 Feb 2026 15:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9L-0007tF-8h
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:55 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9J-0008BW-Nx
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:54 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-81f4f4d4822so614676b3a.3
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754552; x=1771359352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GM4hRM+kWCtJL3aHlm91z/yjeKpryvOkWyfDNo2+duQ=;
 b=HakcmQXdYbtLpZRtMCzf2RAMp9pb0pCTjwewLOJte8xyZz3Wmoo5fWqkTeagtTX5FY
 2eKTp4apf9Tb9JP1LG7ShK8qOpbqRI021gqSSNcsoNCaev2mmMhCEZrH/eTx1hZXU1yM
 vOeyW9eOaxJFhbOmHPcu1PFII29Hzkoc0zb8b6k/faux7gnsHPcT3iDEUpcvqgtewzrI
 ezLFmH7p4ktCmPjCB5jY3sOsYpH1crieCXF5hEZU8Z7SHqv2GM4edcmXAvrZiuQAkw3T
 diF89RAj7ZGZ+X3aRboyFSe3BsYaAXoDmE6kMiSJaIERumSovn3fg/9PCaQME06UrEyY
 AgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754552; x=1771359352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GM4hRM+kWCtJL3aHlm91z/yjeKpryvOkWyfDNo2+duQ=;
 b=ZTH3WxD2c8T9VKUWw5JzxJQrOewh7kXoIP7s5aXAqTRDg1ASUiB0ReOScU/pkkP0Tg
 KV/t8tVmGk+CSAA9rJdxqlhZ2ju4+7pK9R9b7Xt//yzKQZD3zQjsh4LkZl+eqJ68K5c4
 x6eNxRrpVbaNNhBWE8I0Z7FEOpFA3GMtoLg6DAe2FGZOkMRf8tz5yU9U7dVNquZDZm1y
 9cWRMwcw6roOFJEMM17g2T2alxjYzEG4Crca5NI+uLvcN13w+wJayLUdK8cdA8oOmzuE
 TmuI7rW35R/KIu4WjQMuWje59c5l8yQmK6Z/T3PtIdvUuemX6H6D8aEnr6WDO6Ll2Vpy
 Fpuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUoq6a9T55FI3kgR2HVmnPVqiucqw2RtHESqNTsr05TBRdcJ9mKnzz/MQQZYmy0qoM7FmLqaazGA==@nongnu.org
X-Gm-Message-State: AOJu0Yx/MbhnrXvRLpheLtdnBEcN2AHzPREw4xhHlMbkkAgbH/fklUIF
 FIX9Y5wtBCgqFAWV/vH4mOFA+is5/5h++mdPCERYoQ286WSrih78dQGShHK+EI+l3pI=
X-Gm-Gg: AZuq6aLpY7zfAUpCLQHZJeOyTT/S2qKKHzoRBo7cpE6Sr2XgIKItt5QEISh3io864mn
 5d+6QIO1PWI7ZAdY6x00L+jhOsZNLipYKi7lPDGWYsFrQn8Fg/jtm8YGA8E2Npr/EifjoGA01EI
 xSoSGj25fQKjwIstOyeUqJEFlmuyjrAp7jifO6PdLq/1Uwg93FAjZMMv3PCLT7Ds0Fgx0qY2TGG
 m0A3csM6fGSj2HquuJdbeX+xBnR+ksaJwr1UIgD5TFi4eicd67Xed/05EJRsEFBbA+UBzwmHlgO
 758W+nopu+xuujCyNpHBZlXZ3SRxxuD5PGBJgFcppUi9pGaq9L5FqztP8K/fzGsga2e3LnC4+GY
 Q4sYylcI+SkOiVHuJRAiCyq9jL9RJLAi+xRSWnAdEyfuJQAQgtgWR4BULzG4MjcQ7SQAxrZxjoP
 4fwtkkxDwPMBFoDI7IaNo3sv7t4SbnBw7Kxjhb10TR59SIkGfVxBtDDt8M65XhZEMBqqLuVa8fx
 YFz
X-Received: by 2002:a05:6a21:6e4b:b0:38d:f8e6:fc62 with SMTP id
 adf61e73a8af0-393ad374010mr15253847637.61.1770754552010; 
 Tue, 10 Feb 2026 12:15:52 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:51 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/12] target/arm/tcg/cpu-v7m.c: make compilation unit
 common
Date: Tue, 10 Feb 2026 12:15:36 -0800
Message-ID: <20260210201540.1405424-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 144a8cd9474..08ac5ec9906 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -49,7 +49,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
+arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
-- 
2.47.3


