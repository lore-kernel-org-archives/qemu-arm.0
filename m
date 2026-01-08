Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD95D1D460
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6I-0007Ws-Uv; Thu, 08 Jan 2026 09:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5y-000748-Gp
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5v-0000j9-9u
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so30608095e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882873; x=1768487673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKZCBRJMVl+HwSw4Or6YDzCMoqNlO7kCpo//7lZNDA8=;
 b=vIwPeR9vXxRhLNZAEx3MKTV7cY0OXWL5g++S+pgSo0h8xQ8Z6hUeba6bKqqmCIfQSe
 YXP8qqbOwtZ7W3XSN93rBwHXr/Hr10Rrms8x18wosGPk9EWjDqoooYjUwrUoUYpw6F52
 ZpoPp93RjJrguxryhLc6VkjBEzaAOMOqil/N1Ug4vLKbUi11Ljx5kNDXPFcfK5rKZMMb
 St+D0p+UBD0WjE9nzFyve51Z70bD29oo3cqPBE9XKrABxBK30aFvejha8vNRaXvgXwIu
 KS/VNR7GsjPweuZkzLpzfshJSdFxsBJxg8IBfzCTED7IbhUSlDQe3SuYyNFgtMSG7cDb
 McJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882873; x=1768487673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MKZCBRJMVl+HwSw4Or6YDzCMoqNlO7kCpo//7lZNDA8=;
 b=rTIWkarwMVmhveO1VgZXHyQ4xKHvwheUtKb0HaA8jqYrWwO5Akfv7sULB+39oBD/Nh
 w2zXQCEploqUE6LA0zMkXStJe7JxjZfAm4Q2nuWeAqhTQGK28UxwVmaE2Uhnz580f68b
 j7Bujgf3GEOdN6QiGSd5UpdNbNt+cokEy41tOzbFzmcbtgAmSTaDQclsZ+V3ht4zCEkF
 JauEe3z/WogjGJTvnMAP3VpwPEEwEFGqNcAoCKhpKsJXEVLV4j3d3iY8CX7t5lcKVB9Y
 7DZsNFW1gv2vagjJ1qSQgMo/CDORm0zknTt2TeqZyNVkLifuxrWRcgaC8KuSqR2xOVoB
 xqgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrfWhJZVOlxbrTyTSbW1Hyb2j5Wpckj4Htukq9phyoVcb2hopIt5fpRrm3j94Hc6xCfKqoaAFEmw==@nongnu.org
X-Gm-Message-State: AOJu0Yy/D/EWNKPIedcT3MX1Z8TfAUY3Z/ojT+zf93n+Di8ooiIjWvqb
 v+jtAeDH7QIzGI9yDniKHICeCvVvnmpVyab0l7evl9GnYAqP5DLMR/ixC4IGLQCiIZE=
X-Gm-Gg: AY/fxX6h9FehTvFGW2LuIv4hUCWbn3G3sTEH6w5XpvAMOpgGEEiKhhKMXRM7z+NcYy1
 cA0fL4j5FH/LrWgv+znvjJBXKLbIuhhDgoItbn9HXrIC4tWgtpRKB9DeN6J/ihp8AHMm1WwsNRR
 JGHgNhhRE0h1wMcgtPTj5ijdak8TJr5xVTawgB5grZqmosAPSYVImmuq+XF2PDHvTIvtER4k2gg
 1MiDJMjPcO8qRlofNk/+zZM+s0hdeeicXygIQy8Jy0MWzhmRarbPjSmLO2Y33uYcENBkZfx+tzv
 iaGxL5Dt98soVw4G68UBmsW4a8W/RSEvBeKdQcofqm7TWXvsn1laVbYVc3LglzE8gxukN3q5X6t
 mwVm1O67ZFO8cshLgDbAgPD51yXoOAsxrf+K4Z2Sig9VIS+t7GGg/p8yYv7VVuIour90zOJ1hgh
 fV8ToUJb59RWM=
X-Google-Smtp-Source: AGHT+IEMotvXhQTv160rwPcsVO9t+3//HM2qgzgfG8RwcgsbLPqB+CzG8MnZZAgqmXNlPB4P9Rb3IQ==
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id
 5b1f17b1804b1-47d84b1faffmr81020035e9.9.1767882873126; 
 Thu, 08 Jan 2026 06:34:33 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f69dsm158067355e9.1.2026.01.08.06.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D1BFC5FADA;
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
Subject: [RFC PATCH 11/12] target/arm: remove extraneous cpu_reset from
 realizefn
Date: Thu,  8 Jan 2026 14:34:22 +0000
Message-ID: <20260108143423.1378674-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

We already have do_cpu_reset called when the system is reset so there
is no need to do it here.

By removing this we now only do (smp*2)-1 calls to cpu_reset. Once per
core as part of qemu_system_reset and then once per secondary core as
PSCI calls are made to reset them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index caf7980b1fc..015131aea08 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2208,7 +2208,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     acc->parent_realize(dev, errp);
 }
-- 
2.47.3


