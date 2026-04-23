Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3E1FDEE2C
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:04:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxSF-0000al-25; Thu, 23 Apr 2026 13:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSD-0000XK-D9
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxS8-0004zJ-79
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ba840146so62683645e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963776; x=1777568576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USo4XixZxh0ONX4Sus0DTLLTZbV9KZKneQvSNxBeWnY=;
 b=Ou7s5s8yBXWd1vrhgtL9pM37yH05xXni+KZnLWVdyJgtLwlihtGGWEBUsuZZBtZQVa
 v2I0BLocrGIeRGM9PzA0ok1+mjaYpaFv2JqOZiHFLfHQf71tMylYAIUgg2CRlJZCyCuK
 aJuesUBLRVqK7tDdvF98ogh+n/tR+ZakpSQrqvsdgIjH5Yg5CrHWA6aILuW4HF44gSgy
 jLMz3jA25Okoa9YOq74TJf7pOKscJgwfjNR9NnDf7FTUBcPqxhOVJg7lYMpJqApGtAOa
 0iJtLRvnuIwE4+GK4+FaOnp69iKpom4sbxsFvNGJYU+7XotohFPw/Np5+mMKM7foocEO
 wGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963776; x=1777568576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=USo4XixZxh0ONX4Sus0DTLLTZbV9KZKneQvSNxBeWnY=;
 b=Hca+XnbVo2PrOO6D5ike88tsVoztHECf4kykhwcNc/qeGSeEcrzuSw1IMitslpzdQf
 BW2EjoRD9aLkupRGIwvcxNW2uqU9KGNUGgpM3c3pOHx9rzYilpguhYBDCBOSpgnQVhXW
 Se6iKa6c8cPGbWJzypSXdr8r27/rxzDgEXfG1FfOZv7yRSRAI1bvl1ZLw3Q6IApljQdW
 b03gqo8BVvDdjxsNxCkdB4hzbWJFzusy3bg5u8t4bzD3AAiZCZZO/eN9F5kZQ7EQiqsh
 HDlcBYyjNDXXCjHMOXBDCJkUNlI5kJCZhyhW0wZhsbzTwYFvJjE8buOXhE89H5WVnMR3
 ljjA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8T/BAqxi/tq9bx3F/68sP8gqygqwQkH6GMU8esejcogAkK45qnHdIIsnoG0PUK+TnGUVftgn6Gvw==@nongnu.org
X-Gm-Message-State: AOJu0YzbRg2AMfhMq4gjEqY5b/kM9T5ZBRx8wc7wEGuyaEjM1IKeNgzI
 h8rIsR0Usz7Y9J2KBouuRPYngqDzW0AM7uajgd3a/tiy9OQVIOEBcn6bw8kOElfpIY8=
X-Gm-Gg: AeBDietm5r7/O5/zjsYHRV0AouPYbRaSeHJZMSimtJmQMDgElKrpDcueLkq8tzh7dk0
 QCICCgWBfP0VXj6u7CvOD86u7CFjRV0mZhXsfRC2FaWwWnAKGsCm28gWasKyhN48l6c8zzTDAHU
 nVgsMQhkIzroO2WIGKiSbyv8l2G24l6pSKfjUkmNRFx7eFv2uHdjOQBhkOAO5RuicL7CA327iHv
 +vYGJkgPa3WU/PS0oT+Kk6l/sWgikrlRtDUBNkjO2pCqCpNgUkYwBkp3WeVfSyHt4ofJAJyl5Pc
 z0XGL0VqrJom73dtc0YRfeqP1sAvHkCXC2iBHFG1CUJ8hx+APmYQM/b1/JVarpG1jyq+1H8ns7I
 FgaCzW+Ld725kP97Ptifx79m2T34D4wL2K4+rxj8+NmB50rqHx6xhk7LJr3CVnQ8NArf2tN19v6
 vNUjGYBoM0sUEUihlmbzOEYk+xUx8hOIBtpqAw5JigEuKCgHNKcxDG0SIooUtcXP/7CDgloPdOP
 cxFxuhaLOQ=
X-Received: by 2002:a05:600c:890b:b0:488:a977:8d6 with SMTP id
 5b1f17b1804b1-488fb775a35mr296097165e9.19.1776963775607; 
 Thu, 23 Apr 2026 10:02:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891c08faffsm580562955e9.1.2026.04.23.10.02.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:02:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/16] hw/arm/virt: Do not select Kconfig symbol PCI_EXPRESS
Date: Thu, 23 Apr 2026 19:02:15 +0200
Message-ID: <20260423170229.64655-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

The PCIe bus is not provided by the Virt machine but by
its GPEX host bridge (selected via PCI_EXPRESS_GENERIC_BRIDGE).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4e50fb1111f..41d5e968c86 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -15,7 +15,6 @@ config ARM_VIRT
     select GPIO_KEY
     select DEVICE_TREE
     select FW_CFG_DMA
-    select PCI_EXPRESS
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
     select PL011 # UART
-- 
2.53.0


