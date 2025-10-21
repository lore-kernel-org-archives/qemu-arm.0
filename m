Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F31CCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 20:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJQu-0000Mg-U3; Tue, 21 Oct 2025 16:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJQr-0000HO-JT
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJQp-0002KS-6h
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso5893763f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080289; x=1761685089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sl5D2OBPAk30ix5XFbA96G64ecqbTuVPaB9Fe4lYaE=;
 b=XNVb3k9MBJThoZ44+XQjrO+b6QKnaFu5xafRltySz0G64Z9YG4sIdvyhFoYVg1xtZt
 NFmD9tCd28Vcw9pb5f2G+TJP5C9mpBDfmCzKDafvlcBYVVi8pJbR2MmW8tXZsb1ks9cR
 BH99lh4ZCgxL3yl6DQHg3xNRTTsvAfYiI63frvgAyRq5PCyclQRtusvRJ4p5rNKb6YKR
 EEKt5Ay1qoCRTUsmfngGuarhy+5ZDct/O7/HcZahM1NlZymXTBua+r/IFzrQNa0n8gr6
 nsjsX/rqwsuk07RNN+OsAZIf+SlcVQV971w08c0v8R1s57HVkDswZg18+kMqfBs4q1rC
 WpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080289; x=1761685089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sl5D2OBPAk30ix5XFbA96G64ecqbTuVPaB9Fe4lYaE=;
 b=Cfu9xY4iBI+LL8NS6az2ZxyF7qNsB/f3mUdmEsSZrWScp+OGa1VbX8tmomSo4bIVrX
 aelU2vgvkxiVf5cS7nWNphyj0Zq1NB8KdasxARTIDrNW2jBElJhTaO6ODlilUQyRjFvb
 a1pkZz+koltmHiUAT4GHCNK3wZsL/X/TWBtZ/Sl+wrmQPZhOmll2Wo+taWffAUt/kHOU
 f/gMHKtYrtKe9fC0M7XQVsa4td5dV8+8Q29BiX4PCmcDwRnYkSuAeKB25H5wZh5nuZJK
 KYSGqGnQVNzPFF+DwJy/cWeJOFBBcbXHmWsa2bdYYz/xP+FZkRdDMV8ZfR0h9YFjt6Iw
 vHbA==
X-Gm-Message-State: AOJu0Ywdtg0ZuM+qkBjZ3TlQTBykiFixN8hYswbNQ/eVYS8bYQSEcXQu
 VsnTZrdpOz2KQU+n+JEosww6ApzB/IvJFgEtDAtWhbMuCq+TNR14iqY+scRnUIgMQmy0rMovzvq
 +jrA1uf8=
X-Gm-Gg: ASbGncsDGlME3kvAoGdO1B/ZfruVK+3Mzg+S0ELDRpWsl5V/yj/1ikvH9Ioq1P7LKtb
 GKnhY33J83Hx8Th7DURL/ph7Deg9/BPkQHrB5dy5bip0FNLNv5FhV26noBthv/lPKU3A22XTvUS
 G0r6cQg8D0FRGr3o5ZEshEZZPDo+4BGGabsUAhvs9VGWfvf8EAri0oF4kejiY5bFNRe+UVvjXH0
 fbZiEAtr1ZGF3BuJXbV2GMs14OqSX+Pxb5LbHJBVd/bM34k547V/uDgu0refnNvV1rfm97NmoXR
 oun5UdHoOHVSWhCSCBigR7X6DZ16ilMzyHvsi4UTaFP7Le32Tww5gfFwnJ6dnuQfPmdNU8lA6s+
 AEC6ngROcNp7Tg3ZZ4/HAysZxM1qwIII7WEGNBQkEiCdPoT934cppH2WysJ84FGO9j6gVudhuR7
 fsEj/YTk+UnOJDqgH0pNVq0C597cwaKVJVV3NBGLi2uclA0qPkjUUHNE3MznOB
X-Google-Smtp-Source: AGHT+IEcYx2NWo7ZVGfQ4bQn+5YRxVCrdpGy3IdED3MhyOFuAHW7g1LXvX5oHMpDysX6MzPHpf7wkg==
X-Received: by 2002:a05:6000:1a8e:b0:427:60d:c505 with SMTP id
 ffacd0b85a97d-427060dc6eamr11476513f8f.15.1761080289506; 
 Tue, 21 Oct 2025 13:58:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9853sm21746997f8f.33.2025.10.21.13.58.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 13:58:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 02/19] hw/core: Allow ARM/Aarch64 binaries to use the
 'none' machine
Date: Tue, 21 Oct 2025 22:57:23 +0200
Message-ID: <20251021205741.57109-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

When we'll start to use target_machine_typename() to filter
machines for the ARM/Aarch64 binaries, the 'none' machine
would be filtered. Register the proper interfaces to keep
it available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/null-machine.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index a6e477a2d88..67b769bd3e0 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -16,6 +16,7 @@
 #include "hw/boards.h"
 #include "system/address-spaces.h"
 #include "hw/core/cpu.h"
+#include "hw/arm/machines-qom.h"
 
 static void machine_none_init(MachineState *mch)
 {
@@ -55,4 +56,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+DEFINE_MACHINE_WITH_INTERFACES("none", machine_none_machine_init,
+                               { TYPE_TARGET_AARCH64_MACHINE },
+                               { TYPE_TARGET_ARM_MACHINE },
+                               { })
-- 
2.51.0


