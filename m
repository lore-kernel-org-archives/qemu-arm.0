Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC66CCF9EA
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:05:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDeh8-0007RC-CX; Tue, 28 Oct 2025 04:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeh6-0007Ns-9p
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:04:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDegx-0000tW-1K
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:04:40 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710022571cso58331105e9.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638668; x=1762243468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khQ4f+JLpb7fh8Bk0A11QSSL3qpoF8Qk2ODQYUaP4ck=;
 b=zkuuk7rZoAjECDh55GKh+1gdt5keehE1DPz4jNyoDUSwW3Bc/k6gkvz26qonP5J53c
 Fhpkv6BdO+nPao7rRphEtnpHXf8gxxkLCq5vXkzp2kZyq7M7s3DCaW0/QA4aqEZ2yYqi
 ksIecl4wwqymzOd+kRpeLpMFYb3fkTCUHQHHzmVkHYYr2J1e7Q72dr0jEDJOaL9+TQZw
 NHRW2CC+yPGrxhpfT9L/ENB6iMVGn2a34AMnHC4bg246zTptAlTEWgkyLkjm8N4b8g3J
 7yPxA/O5U3Qq/lF6QN0W8wslrAXfRvugNbb688AfG+ps8FNA6OWhA9MhG5bps7xPIuyk
 Gi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638668; x=1762243468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khQ4f+JLpb7fh8Bk0A11QSSL3qpoF8Qk2ODQYUaP4ck=;
 b=vpCCH7FwBO30ALY8ADfHN19vfD7JqHvadBOgwwktLFiAB2A0wITKfVbXD/IFZBC0vK
 9Pp9ZtB3kUrl6m7Ts3XH0eMBJhbYAfcHZSHz7zDbYjWyQKDDWZiSQFJYyNqmIJ6JueUi
 vUwUuudXZa62whJ17Ghok8bx8DjRkTxLbxzr7l9S1Ld4GiCzzeJBRms3MSlLCTUZLl87
 SGr2ELOFTh3X4ZxzENoc0P+7Ilg+8o9JnL+JYseNG1U2sJRaKkKNCGTKlGkmxOMVSGy9
 v2oTFS23iGFRPNIH6+DeEaQ3DokGu54FIiTQmA7bjtxPxOULZ0JwJsNy+El7uL3a54Px
 8qHw==
X-Gm-Message-State: AOJu0Yz67cIwDmu9cv//eJcAMFWd5XYqnzNhWEECZmlxbL1GCn3f0yBD
 sNFGWmkoiPXucB5sA5khnv5kxqrHKSsibSgh6GzHXvyXyIBvxhDNlqDugGZ3yv21+dM=
X-Gm-Gg: ASbGncuY7mz9MDbNY8QB/QxBDHkf2nD/hqqrCBH0x73U9MBZ24czGv1rLt/XPEWHIad
 XSZeO9pz6akS4q+iJD5/8CtvMFPO0Vds/dcLI/5tmXze/OYV9k2+6rv2Fyw/ygdVI0acrtBv82C
 MGMZ6JKwcZbFswGaMBc/YC35uEsRQIGJKHskjEoIXFz3AJS11C/QD59IhSjQvB3vwWPFLZX/cDw
 lSFV3+8KwdhqYESpmNZw0G8XSS+MsHULv6ulb9ruo9ZOkgLcZH7tYjyZfzcJei2BGqqoq2cdjzv
 0GlgVj+MoZhVsTnDABFKDPqMp1nSGDsEMPTOeCFe0qqxgImWIEmUSglJzWTuoGq3J8o0wua0wvL
 3FpU9GmG0KLDpxVck+O8M4ANeO2Ur9DHqPiwYEkqy3CsPxVgl8W4jFWOUior3O0v8mjvUNBN2dk
 bjcxIV/23leD6Z9cdD11+xsM9M9OjcSJm6NCWUz1Zc9k58J9wh7LBBEhc=
X-Google-Smtp-Source: AGHT+IH1wWc1POY3IlDrRidKTdwgtpTWr8O8xuTBDKg1cdXSQD1kcxB/k214JvO/0FfhxYoR6eTTJQ==
X-Received: by 2002:a05:600c:6303:b0:477:fad:acd9 with SMTP id
 5b1f17b1804b1-47717e40960mr25113255e9.34.1761638667885; 
 Tue, 28 Oct 2025 01:04:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4cc596sm184858365e9.15.2025.10.28.01.04.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:04:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/7] hw/timer/hpet: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 09:02:54 +0100
Message-ID: <20251028080258.23309-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..4ed79d72620 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -655,6 +655,7 @@ static void hpet_reset(DeviceState *d)
 {
     HPETState *s = HPET(d);
     SysBusDevice *sbd = SYS_BUS_DEVICE(d);
+    MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
     int i;
 
     for (i = 0; i < s->num_timers; i++) {
@@ -677,7 +678,7 @@ static void hpet_reset(DeviceState *d)
     s->hpet_offset = 0ULL;
     s->config = 0ULL;
     hpet_fw_cfg.hpet[s->hpet_id].event_timer_block_id = (uint32_t)s->capability;
-    hpet_fw_cfg.hpet[s->hpet_id].address = sbd->mmio[0].addr;
+    hpet_fw_cfg.hpet[s->hpet_id].address = mr->addr;
 
     /* to document that the RTC lowers its output on reset as well */
     s->rtc_irq_level = 0;
-- 
2.51.0


