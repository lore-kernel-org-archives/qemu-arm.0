Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB4AD1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6B-0007Ep-Lb; Thu, 08 Jan 2026 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5x-00072B-4f
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5t-0000iT-Qz
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so27976055e9.3
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882871; x=1768487671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNPkfTC8hSB2O54A92j5y8SEHslcucm7cyY4HjTcIuM=;
 b=T7AxQwtwC8nruwByO5sWdmGorgWfAgoaf+r+R6vQbZt/i14b2rgNYsuwCcJYCnWRT9
 HytQzCigVx3LXpCtQK/eY+2R222cu+WAAlJxlp3Fxdr4Rfl+77RbNyUeyIqzSz+6At2D
 +AMfhC3RtGB8Rexu+YMgBaPWLHI+7Hu4cUo7eLY3vNmGpXifDVPQjIS42LlrfL5hzxoT
 K0BOgyVyfPQnD5OMXA95+AqGnzC/3VQiCV5IeVzPEuYDS7SkEA+RQYlUci1STyuXYIDT
 1ZeQTWGVxEOf0iJ2m3o63oGXdh84+S4Dv2UPIP062YRmD0ZhZuWitXjPetTbqVihjpR8
 7t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882871; x=1768487671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NNPkfTC8hSB2O54A92j5y8SEHslcucm7cyY4HjTcIuM=;
 b=it2tp339p9IR+L1G0CqVI74vFi8ZrJU7GadqOrX46VU0vPL97Zt1NBoGo+9l3Anwl4
 GHL8sOs574pAN1w050bOgFTsaHEeNjdTSdQDk8s/h00SPzdlapVvHB3VmszJhwjMXkow
 XvRL77eW3buNeHjIn0z8s521dzIMCxkUXDwJToOZW0Uog4DlAL2/JlQBIc5/5YnM0Z4m
 TF6Pkrv7GJWpc73gC0eW5m8kLugL+icNUZQMHZtb6LXeyZhT42J9izcirbLiyFOodXNV
 381mvawUTFrk8SWmCFMgmnRAyTdd/Si7OpLSP0KlMNCegQaZhiM4ZrrxSr7Nj0alZ1g2
 YlEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5pULIyT0iRw55ZCmFUGXVz17GduRu9nCpvr+NaZq6uQAi/S+miaP5FuQMgLVa+dZhRDq2zhnXMw==@nongnu.org
X-Gm-Message-State: AOJu0Yw3dvSVcLpmGSNNLn0TAIyexc75eavAcIdk3qT7EZ2J4wkGlujF
 /AHa3wj/yEK4A4FATD2FJMv0sg10/qycEckmLHCIhJveeJRoNbE3fYZ+gdG5fExGBuE=
X-Gm-Gg: AY/fxX5Zo5AWti2rdBEufL7O1X1Fzqx8ZBfhbZDYLGmc/4dRnaZaUoe8o9gV+Y4JSC5
 7IiRO9MFSbMhrn6Sr/ziWbeVhyGRu6h2R363ArZeqb6+7QcMBqmlMKb9+LKo/XWDji7c1F42BOB
 FM4BmFuoqA0mjJIYXX70adpfWSjmMTWd4N3QwblUU3YvHpt9ZmYcvw3eaiNl3VVLWTx90I/JrL9
 qzMuEk5a5LMOp+LdFD5khKpYMB3eerkHBC4Z+dkA8Z94Bcx9qPK0wpYIiXRBPkHKSP3O18KOI7w
 dt8jYfCPElb3iDOM/3QcMEB0JlPpatSNUlSgys6IACGp8dHl8Gyh0ufUeJyn5Q1vKP+Au4W1tgx
 dn+tSgJ+iSDxGrwZR2OvEIES67I9l4Gj8tnOmGBITBF4ERKFBE/VQhVlC3/gjSgFgXaP5JR0tgr
 p3tgM4Ct4YL/HI2DCXTdIJyg==
X-Google-Smtp-Source: AGHT+IGCbmw18fNIwlDNBzWCAdNHDFbb56mz7vbgowQfcwqwBe7oDhevb+s+QGfjbElOCftQfjfsMA==
X-Received: by 2002:a05:600c:1385:b0:47a:94fc:d057 with SMTP id
 5b1f17b1804b1-47d84b0b0e7mr68176435e9.2.1767882871357; 
 Thu, 08 Jan 2026 06:34:31 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8715b5f7sm40785975e9.4.2026.01.08.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id ECC525F8D1;
 Thu, 08 Jan 2026 14:34:23 +0000 (GMT)
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
Subject: [RFC PATCH 01/12] target/sh4: drop cpu_reset from realizefn
Date: Thu,  8 Jan 2026 14:34:12 +0000
Message-ID: <20260108143423.1378674-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/sh4/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 21ccb86df48..1dd21ad9ed6 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -255,7 +255,6 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     scc->parent_realize(dev, errp);
-- 
2.47.3


