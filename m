Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5CCCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:17:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kCT-0002yc-FC; Fri, 17 Oct 2025 09:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCR-0002yM-Bp
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kCJ-0004Sj-Ur
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47112a73785so14281965e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706517; x=1761311317; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhXctmaGs+38JQZVNJ1bF9+hCN6zeVUF0eyaD2DT6Kg=;
 b=m/R5WCCZg35uuneXBkLqCcgfPYl9/Cf4NPuN+UcbAQ0Me2EvozbdahbDl8e1Zb7cj9
 u6g6FNy1D24RpvSlzyK4EKrPRF5j2yvNGwMulsWVKKM2INeLq4nVnro6WeClRC88BjNo
 zOoX2ZB4NOhf76G8TL55PF7LTEcx826kAcKduXqeSGgqUNsChfvXwOQq8Lnt5lxN7zqy
 MAzeUKjBIRfOyWYpgf1pFGvkZbdNTdwSaatJJbRR3xcBb4/B+U5t1QU5UMtPa5Fo73o/
 dgnhh+Tah6uduid35XFrcEpY8lpktNLtluqVBARPZ7wbieLC9yyjObItOyGuFqiJBrk5
 x/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706517; x=1761311317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhXctmaGs+38JQZVNJ1bF9+hCN6zeVUF0eyaD2DT6Kg=;
 b=UUTmOBIlAy9K3ohH9pNCG897Gu4VlYhIZKF/L/9sGaTJ2twCZQuZjTuo6pk5a0JRbW
 gz4v7jJxKKD3nzNnWiyi4MJ/9GnWu0U5uAdPSzfPqU1BzaAFUi2jq9w2u1T/Lse/iWCQ
 sGUKMIbPOU04OYzL/frfSy4hQOW33S9VnSrQY3YI4UDIXcO4rme+yg5sCfhL7QMcHTQ9
 su+MBqQLacFIh+gH6aLxqu7PGJk6YJJlCafSWF7jKCfAq4Rxu+KgyBuFQcqsjzfTiXLF
 q8K16VI5qPhdRFuT+fFh9/unW4SF/tD8sjY9yBIfqCMZKt/u0looXNAWP35F4cPboWr7
 qidw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsIqHqR6+/+2KAE3WXgo0MvBf8mYr0bFx+LfanG5ElqHJlOrQOL+0HlURFrV5I2qyii6usqupKhQ==@nongnu.org
X-Gm-Message-State: AOJu0YyvP7mmZq4yGKU6qk2in4hrR1ysAiBm+eomFIJ53igKGxmqbsV+
 pwYy+4tPvdLGi4u8rKUse/cFIXqaNLsdRe++WYieoIUiaCLvXjmiaZMrO34a52HS0Qg=
X-Gm-Gg: ASbGncsDyJJR67ByZDgTsReUkozg7vkKrKVvNvLzfdIwhqOSB8epOWhtXAeL+bArekQ
 Ibe1DBDalFluuVdJ6SF1t6pDXeLQLT0l9dLUhDuZ0U9rBGtQWUMAYQnGcUCz8X9NI7UABS8TZg4
 eRRO36POeAGsas/j2C+EScLtc3TLPHA+nPKjBaXu5sfHLdEi0vASjsxtUL2KX3ZDbkPRByqx1QW
 p13BcMjV6Mk0kMExAD0k6eVp6mFzlTXdZJ506ulK3lDYzscv+l1Jj4YS1Q2PxF51qASmJW5ET8I
 c4O5zP8EW/fXN68W6/FMV2emM/GcJR+s9tmtK5Y6Ul/ML9iXjG3JjhM8inc7+grtanGMXMFQ3oO
 o6fbfrYRXC93tiaOHQT9XLgKYDP1yW9iVuOX0tYxQKg7SmQjf90ic9os7UgNKySMxZK+zxtghe1
 Y/VgYXeGZSuHHUJqoXHJPcEC6G5+TMpCO4/RLTkrzyOgzUZPRmIQ==
X-Google-Smtp-Source: AGHT+IHsblTCumh4P7FmMV8QNd1lu68PonExBLhrVlKC9QVmX+cxaYLypo++cRWGc0LosTGIkwsfDQ==
X-Received: by 2002:a05:600c:548c:b0:471:16e6:8e60 with SMTP id
 5b1f17b1804b1-471177c0948mr28800355e9.0.1760706517286; 
 Fri, 17 Oct 2025 06:08:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444e3fesm83931785e9.15.2025.10.17.06.08.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:08:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/20] hw/arm/virt: Remove deprecated virt-4.2 machine
Date: Fri, 17 Oct 2025 15:08:02 +0200
Message-ID: <20251017130821.58388-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2eda2d43974..b781a218019 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3690,13 +3690,3 @@ static void virt_machine_5_0_options(MachineClass *mc)
     mc->auto_enable_numa_with_memdev = false;
 }
 DEFINE_VIRT_MACHINE(5, 0)
-
-static void virt_machine_4_2_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_5_0_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
-    vmc->kvm_no_adjvtime = true;
-}
-DEFINE_VIRT_MACHINE(4, 2)
-- 
2.51.0


