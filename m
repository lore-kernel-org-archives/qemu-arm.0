Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F43E9A053
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7fY-0005TS-IE; Thu, 19 Feb 2026 12:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fQ-0005Me-AI
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:20 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fO-0000R4-Av
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:19 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8842e5a2a1so166336966b.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521497; x=1772126297; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3rDXWxTc8F8CeotEYArZQgzd6idckf+iX82oWokDYc=;
 b=Fq78MWP7URx3I24UvNwCju1I+GME4or7+mfquZKfxoTHytjiImdDZELS4ncEftjO+O
 +Ui9uMD0oeinPhZ6g8JHk0rl9orI3SsUeHEUAZvM/wmFiGnafbHHmiESyuQBqG1RnzkM
 GOU4XJwX7DATwKj2nwzL6D9wUFMneoSfXbA1ceZuIF66EMNydnBhoZg3D02ceXuMftXy
 irSmZs3Otmw9AS3OP7w4T9vy4zvf9b4bPOvXeO1K03aPI25XjKH2uH9T/CiXB33Nh2GU
 lSrLB4TQxIcODV5D7MSbfSsdU1s6wpP3gbFu8ORfc/qAnWDV9IBqCj2PqHmVuoJ4npHR
 9j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521497; x=1772126297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+3rDXWxTc8F8CeotEYArZQgzd6idckf+iX82oWokDYc=;
 b=SuNKilB3S7DR5cc8HLM0fZS3EuiFRG4hc51WlblJ7Ui3N4vD2Gib401i34adpCJprv
 UmUf0KevndROaWpIKLza7nR106xa/nwDOPHaFgQzjA5g/TBqILIbjESZIG5viUHmRYaj
 qsfqaAXs8y7Dr1NCMqkiom/mJlaJLgiIhSycbUdbEPFdDB7zXC59hn8yrx8K5jRrjP/1
 hzCXk+bWr8BDcm+ch9wZ/dL+XIGU2dFVJP0XYazCyF+RnQAmHuwVa5vaqyFQWOUYNwpE
 px7CtIIJ58TeEokncP/Hz/GmaV4UvEqSPlYSMevh8Q6CVeEpVl6suoHTA4T7Q5xumYPM
 7zsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGdlgBN2A+to3j1QF2ziZSafuEG6ZKoDBmGKrHKETi9qRhSgU9u5P/YRMJE4zopLlWohY1SxEYiw==@nongnu.org
X-Gm-Message-State: AOJu0YxwUSQz9f4KRJFrNNjIGyx/xZ8wwAYBrJixFiFWUj1n91xj8pQY
 R/FNcx/oe7uB7RSwjW3Cprcd64EJekDjueREwFXFcDNgRBG0xgQHXneYzR/nHDtonpo=
X-Gm-Gg: AZuq6aL5xneEGmcReCaQwCba06/PK2kFNy5PYtvVLMk9IcCn3xDD0fZu7BQD8w8MABa
 6XE3+O8Vg0nAeM/i5Jvz7IoxM49Y0KCtS1WHZTS55tmzm+/hNHRPOrKJbSuEgnoUyfEYueCviY+
 ELqoQHvbs40HJSkyx47CRpjRMpqd+V2sTHB6lVyrapZpnvpoOZu7v6s1FpIkbtUZqllQ8gbNOCu
 avFJTJLF3YClyOW9ITFxyLdZOcBNCt9b9HmZQla6PLWTenGfomZ+SXP5881srzpFEV03a+uGS1I
 EQedB2GA4xEwb0DdxXd9RpPcGbCGAwI+dSjTtjt/PtJk9CVGkYAoDv6ol2BBD4mQk+Bcs/IhA9I
 L47OPgtDBBqNtub7wS/TcW8y4gi4NCeendx0oGgLcca5JWqm2KzLMght0Stcey/JgxkNk/3TNgy
 TS4uCTd9ePZ0rIAbU+l6pRH5g=
X-Received: by 2002:a17:906:d54a:b0:b8f:1c:e815 with SMTP id
 a640c23a62f3a-b8fb44fd4b4mr1289377666b.48.1771521496614; 
 Thu, 19 Feb 2026 09:18:16 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7665563sm589027366b.47.2026.02.19.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:18:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3E8835F8D0;
 Thu, 19 Feb 2026 17:18:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v2 08/14] hw/mips: drop cpu_reset in mips_cpu_realizefn
Date: Thu, 19 Feb 2026 17:18:04 +0000
Message-ID: <20260219171810.602667-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219171810.602667-1-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

Message-ID: <20260108143423.1378674-10-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/mips/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e424d115018..f20613f1223 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -488,7 +488,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     fpu_init(env, env->cpu_model);
     mvp_init(env);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
-- 
2.47.3


