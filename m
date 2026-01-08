Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DCFD1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6I-0007WY-Lf; Thu, 08 Jan 2026 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5v-000723-Gu
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5t-0000hV-K2
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477632d9326so20225205e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882869; x=1768487669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIBuc/mkbQabpqpdJIoXotFl/D1JCK+3Ji0AYvgjRGo=;
 b=Mvgk8KdGPFG2vEZplzM93eB8mSJ5r5lLNyOtjFOo0fqeh2wGivhAouwdR4OAIc8Ndj
 DiL0Th7ATGemy+cNTpAAorERphYH4t93UmzpSQyF7a96rXnbZYAZLJohNs1sRNjY10eW
 iLbpJRHm15THx76dYpmWOV5O6P+6lPfPpvRnjfoV/M0UTyQw9PpiD7XDb6AiY9HF/bjs
 h8AzmTgvDFjkTUvxCSuhNyVfFPihSmTqkTgZQyHogLTNXdQOrmDxrHVox4nfKECNZxu/
 50Y41+6lvTaGymoGyhuMTdMarsq8jKaWfvGsUFGP9o8kAOou4xFeg8QHsM1UWsF/elwa
 Ukmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882869; x=1768487669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jIBuc/mkbQabpqpdJIoXotFl/D1JCK+3Ji0AYvgjRGo=;
 b=PRTGyAnyXySL6XJJbeD1fGz3Yys9wZf+xPA7KLkrAyIJx36XQC1N4hgSMzMf7tMNZY
 6jXM/ZCajyp8n0P3BJGXx/ePGEv+XhcRlT7ew2z9yoeGMnuryR9bhxgT1Vt0eMkM88Ua
 BohIrx9q7Cx7n/sQ0EA8K1yy3HFrwopTMLo2DhoZbbV9fQeQuXA4gcfoaY7TARsj3mf/
 xbICilAUDpFdz84KBiLstaWPnDBPKDwVKcBissXjlyQ3Twj3qREd91Q6Ua5p4Ft0ofp+
 BXG00+x1N2PXSazVam2JZhcAjot9e4db5DbGaYvQovgFAiZDMDgnqSGeYdIeK6VEfU8b
 he6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrvFoFLT/zyxOtGvsa4jt8DbZyWM2ik+NFQaVUPnImT23APUbH7pnvmKnZmlZj0D60660gnsEKQg==@nongnu.org
X-Gm-Message-State: AOJu0YwylyNmEh7mJm/mb+g8O2OvwJ/WJYF5cUYoN22uHV9GLS0ARGcI
 JHJouRYW5vIGSOhiXgI8ZH+ivM7vuK6FXiRzLgsWdTpwuOSX1+qJlIuAle9EQiFd/+Y=
X-Gm-Gg: AY/fxX63a68qndYHQJf0LrwUDaWrrJh5zD6mQqf32azlnlBuJOEyhR6JGh+TlsMjGsG
 m8uaXOMmr8ZqmZ3e+k7vfhEr3wQ4L/5NH45iAu0i1ueGiNk88kel+q8GtQbfJz1CfTYa8rdqbOo
 vTu+NI7fd96jKsIB/aQUHkoNYbv3iurBLoFcUODESxdFkXPz90TGa73uCOL/LpISQXau3kfYH+i
 wxtAKALcb5+vWTrCWDDekr4Qr73qwNYH/hfd9XG78uKkQWEb0aIb6F6bnx/FZ3Lfl1OuHa/wkN/
 q3sGBREMzGDnVrR7IG3TVpInxdXbaTB1NC8q35iIYD6VBddkRB4K6LffTMMQwuqJgr+XUImLAuY
 yOgI8ATWorXg+vnZULqivku8w5MkgmuSh8MkC7z9dKFK2Hpf85UTNjevgD7pnuhKgru1/r62euE
 67PuetVn1jd+w=
X-Google-Smtp-Source: AGHT+IEYWVBCrSY/JFej/cH3QHt7HU4nTfQ1442Rqd9guEJxuXvZ3FOOtY3PLbbYmA2SO9ig+kmt0Q==
X-Received: by 2002:a05:600c:444f:b0:477:df3:1453 with SMTP id
 5b1f17b1804b1-47d8a177307mr34722715e9.28.1767882869557; 
 Thu, 08 Jan 2026 06:34:29 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f686sm155235405e9.3.2026.01.08.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A84B85FA2E;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 09/12] hw/mips: drop cpu_reset in mips_cpu_realizefn
Date: Thu,  8 Jan 2026 14:34:20 +0000
Message-ID: <20260108143423.1378674-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We will always do a cpu_reset during mips_cpu_reset_hold().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/mips/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f74a9d5f615..e61497c0f6b 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -485,7 +485,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     fpu_init(env, env->cpu_model);
     mvp_init(env);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
-- 
2.47.3


