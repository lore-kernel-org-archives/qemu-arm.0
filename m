Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F4EF585D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU3-0001HO-Cc; Mon, 02 Mar 2026 04:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU1-0001Fz-O0
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:33 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU0-0007fk-4N
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so34038415e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443351; x=1773048151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrSDkpRuA4wc4OTpcBM2xlfnE+hqoQxnobPtJeyezk4=;
 b=kBojzAfv68NBqTaHsmVq607+IaF90hj+cRZ9P5clKDbC7Nr9qyIGDUp8zQLygXrqLr
 LpSCzt36gBo6+tPCwfrYNrk1bMfyp7S1ciJzvJq2YwdP948HkQ52MlxiNi5Dviv+r1pA
 MGpM9ntclLrkJu+VD2QmuszdQlEXBZAhfLg4xO6R3JkW7fG8U3KA22m6gIcygvkCd22b
 EJES07VDDF88sAyOtJLrV2dL1fPvrwSPUim0ugLpmPNIaPBK+I+W0lTzFCx8qXlD+XU9
 RnhLdzIfyf+MWvfXX9OluJTthkQfho7kKeGcLPuh7C6UhNi3m8rp7HCLxoirZ6P0ZeD1
 mQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443351; x=1773048151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JrSDkpRuA4wc4OTpcBM2xlfnE+hqoQxnobPtJeyezk4=;
 b=CSJd3WoxQFio1OWwJbtdznF7kiyvQRjZvB7AW+rk266TGo9m8MJgxlYtyw240LhT90
 7eff5bBTZMeyk77ZHouTk8Qkn/90hwVN8GjvKQ+folAHXBBx3EmJ9wlCa2Kh2v+06+81
 Ux7sjOwPYxPk8H8szG2tE36x+liEEzQr5pKDFYHSB6x3Y10J6IRi/lriceoolaTZ6BMk
 DVqvCe0zx1P+vcFC+FnAS4Dcll5Y2Zd4z5d1ekNn8zixeO0V+XS7wFyl6CeJZg3IazGp
 iWEFeXRUsh1t2qK51yP/wjTunynt1pNccKq5M6uv0pAQ2y2Ex5ZJ8stmRrU/EZY1qBFX
 CBZQ==
X-Gm-Message-State: AOJu0YyDt3QJR/Y8vM3xmN9fM8D9bOeYvpjdpr+jB2YHFg56Fp75ouRy
 HOcEOr0/mu5+V9mxoF9nl7xQmvsQQ9HEWFV7O2Krg2m1nkNExN8C20ic4JaEW7Y4F7iNzWGZU+P
 9N46y
X-Gm-Gg: ATEYQzxqHacFv8S3EKbPdHVaWZqZ5D92niDE3N1+vT+T8bCMYoU6DHrtZguybhYiMqk
 OJ7EXzui1dVrJ8RBGK3udjJJQiENbTuMPSoYVObyIRT/bzWfG2EE1npGfbDDoaS6zNcfZdgAvAO
 pti6WfVkrs5ayumEatY4w/hijRTMhpZWiWEJugAJTfQ646hOXbt0XBsZFiRQiagdhzn2pCfswCS
 UcUI+kzjDRiGRWUvthkKIL48qEGOXFVfMJ1fO1ecvfahsMqf3DvHXuJqiTPIR23FyYoxDX6ZnKC
 TlPP52FkGrHArqe95NqmP3cGMm6Chko6vC+OeJKPCG+kRKkDHe17V7DxZtyK1YOBwDQPX24frxy
 4G3twpWHnIkmYyhc9NOixtSHby08OMhtvKeePGWZwIM3pGLMEvb1MoHnjVLsXd3BIzXr1lE7sDY
 fYZvcrCagP9GJdA0nXAvcpCCUVWX+RExdUCw5aMeU4avw5ejoZ9h1BHLJjhj8ALBCcxMdhhfKmd
 Ki2Gr9fOG0XDE+zgADDV7qLALtfoDkSf9oKXeenCQ==
X-Received: by 2002:a05:600c:c174:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-483c9c0bcdamr202694715e9.35.1772443350535; 
 Mon, 02 Mar 2026 01:22:30 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 3/9] hw/arm/aspeed_gpio: Don't leak string in
 aspeed_gpio_init()
Date: Mon,  2 Mar 2026 09:22:19 +0000
Message-ID: <20260302092225.4088227-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

We allocate the string for the GPIO property name, but never free it.
Use g_autofree to avoid this.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index d9237d4360..7d0f87e90c 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1488,7 +1488,7 @@ static void aspeed_gpio_init(Object *obj)
     }
 
     for (int i = 0; i < agc->nr_gpio_sets; i++) {
-        char *name = g_strdup_printf("gpio-set[%d]", i);
+        g_autofree char *name = g_strdup_printf("gpio-set[%d]", i);
         object_property_add(obj, name, "uint32", aspeed_gpio_get_set,
         aspeed_gpio_set_set, NULL, NULL);
     }
-- 
2.43.0


