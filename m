Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp490358njb;
        Wed, 4 Dec 2024 12:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvzVUkJwOyMy6VRmo/XxNcFFNwLTi3A5EJVmOfNpq6/L0zE1pcNgP66C85vdb2VBwVmPNyN5PHEZghtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHNYdaD9GmVaBlylff0H2/3SgXIsTRBf3CtUH0E/767G8fVbEmXhszJr6cxJI9RLGbSyTy/
X-Received: by 2002:ac8:5d47:0:b0:463:64b2:2e0c with SMTP id d75a77b69052e-4670c740922mr104111891cf.42.1733344189739;
        Wed, 04 Dec 2024 12:29:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344189; cv=none;
        d=google.com; s=arc-20240605;
        b=O7HYB0RUoS+7FFHNWFqagM1X2R01FJplrUwMDtMqJhIMAUtf24lt4JS8aonSoobun9
         OhvbCDZFqZ4ucqlIvC4a9Sg3ByjqD3eayi6cv/YzgnNyeSzz3ZxTLujf3DbALQKpzn/T
         Ym1sDL1QrWxyWR/ca3Zawr9GOPr0J4HZXQZ+hEdF8Y2AgBbL7YiYQ16LcCBdFJFlq/gm
         iNFKCWBGgZyat+3ljNab3gnMkf095kDScm7knIguOtQZ5n7kGXWNgvnDutZB9trBhCal
         eNe6DuOdTyeN+2oNWxJdTh1B13PpG32mQjMX+Jv8tg2/vR7yFbJ3dhLXKxr9aAuXd/xf
         I8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GX0z7ED1fpqqEX0e3FNGIrRnTBaZqIcam5D8KFO/APw=;
        fh=qDJXWSdbw6dylr1P8FNE+bZuQL+JRV7XKwV3H3f0I8k=;
        b=klnzP9NlKuI2r0Il/GvBesjvZFatHuhUJCKX/962nga/L3u5ROOsbkdvpjwjxVCds3
         bd9OjHkD+5f0XV/ePA33pj9s90Rri50itPmOFZ2Z4YTqxvCq5Mb91Q2rgOIlpTUUGsgW
         vZMT67PxvKgSCHo1EFzx+BCNz+LJtJ3YdS/CrZF8+rIJGmVGzJ8pgFNAduPJJRDKUlMB
         OVOyge8g/zdsZRTK+GZTPLLg2V9du/vNvZlNxwOk/gVkWpEtdmmVEQz7YzsLWvZzLpKX
         hgIY4GByxnzU7P0VoVdRYjJY+aZ5yU49KQuK3G6zr3u7puqtIxOJya7RGHayUxO3lNq0
         XLIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRTYqHQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849d7e44si1811617585a.509.2024.12.04.12.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:29:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRTYqHQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvyu-0002ey-NM; Wed, 04 Dec 2024 15:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyq-0002SK-Ja
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyn-0002bW-JU
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a83c6b01so1480865e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344089; x=1733948889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GX0z7ED1fpqqEX0e3FNGIrRnTBaZqIcam5D8KFO/APw=;
 b=TRTYqHQEIK04Y6ULZP4l0E5gbUgQjjF3PfhBSTltnjGYwpC/JHV4jAcApQSmXyCJCA
 W2zIRLb4VCipt856iw/ACgg71gUSPRwWnHC1+Tx4zFDQduIl98eO4zTbUOeazaEXemCW
 4GSC/z5Sb46hTUkXyFbux52R0A9C4G8gk3Us45PaI4kpvQGIw8QJ1aK0m2PL9AYBj1pL
 J4MnDOsCtfS+GEk+m9/D0yx8wMazQlltqJfRMXxiFxFKKczrhCbvqAUu+XsLsTrHVWRL
 V6J4tFj9LWGNYLslLXxIvGiyHk9cJDPzKJ/kQgCnJh0EJhP/Tfgn4X97F0/fpA1eGWi7
 SEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344089; x=1733948889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GX0z7ED1fpqqEX0e3FNGIrRnTBaZqIcam5D8KFO/APw=;
 b=IFxQ0rzmv96ZFxGgfK6cMoX7khIZ4IIV3DprtqhhM4BhQMfeJ+DBTh+pMh5EQu/e6X
 IKbOWO9C5Exb0Fa9LvHR8NoXtAr1r+I/eJmChQFHV6fiAlRkrW35FBRb5O8vYMUMRW/P
 2nyxIAtwDKJFv73lBz9IbC7cWkKb54YLPudo58bOVvLOLQPgA16F2qmi+UlWCQ/bwG9d
 sJuhNHBy3DZA7iRLk/ocUEqq+sz5RO2gT0kXj0MrVBvrmK8CdTps4ERAQKwo8iEOr3A4
 XPnkULVIFpZ+hbm/xbunIfkYYNxeyLuBCgAj0ONE1fTFpVdSJtF3Kga0VCunKd+cdDjO
 dT3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGEa9Zb+1J/w37N8QI9hh3wJvFBcUoom+9lVo8DpHum/LcgXzEMA0c8gKhzLgneQREl+Fgm9chcA==@nongnu.org
X-Gm-Message-State: AOJu0Yyk9ScX4E3nWnMhP5IJo/lQJld7n9PfpNHlEGAfNx18qTbX07Nm
 YfUiBWIpxtdhKD5mdKpx36SRqR5VAkMdYpKZMGQq+ZYrbHj2ivk+Nq/jc3an4AE=
X-Gm-Gg: ASbGncu4UioztOKC/EpViln9h4RyeM+8+Wj7OGD0tTS7C0+g1tcr4ecnYhY182HLga2
 zH+0VvlnXjj28w4eu1tBF/F+uzHZQWDattZ1AdVx5LWZZaZ4h5Yeldvtv+VKseg0xmVrrCA8iiP
 AtdMWLnROI++jsdCe/dtVIJx9JOizyqrkEz3VFAsfaxkiLwg8I2kJ7CLMam5fOY7Le5G8bueXP2
 qQWokusR+98b3dQhkWXKFkkB90/uRFZu8N/ZOo2zzSh/7opNKt3Kce0VOaKSIygsLPUYaKLlE7n
 BdoT7SwO7iEv8ipqF9LchjI0
X-Received: by 2002:a05:600c:19d1:b0:434:a4a9:5d54 with SMTP id
 5b1f17b1804b1-434d09bf794mr77784015e9.10.1733344089220; 
 Wed, 04 Dec 2024 12:28:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0cfdsm36598115e9.33.2024.12.04.12.28.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:28:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/20] hw/core/cpu: Expose cpu_datapath_is_big_endian() method
Date: Wed,  4 Dec 2024 21:25:58 +0100
Message-ID: <20241204202602.58083-17-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BTTdppDp/9Kn

All target implement their CPUClass::datapath_is_big_endian()
helper, we can expose the generic cpu_datapath_is_big_endian()
method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 8 ++++++++
 hw/core/cpu-common.c  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 91c6581f814..5c75fe3a842 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -611,6 +611,14 @@ extern __thread CPUState *current_cpu;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * cpu_datapath_is_big_endian:
+ * @cpu: The CPU whose state is to be inspected.
+ *
+ * Returns: %true if the CPU access data in big endian order, %false otherwise.
+ */
+bool cpu_datapath_is_big_endian(CPUState *cpu);
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 09c79035949..92c0c4c6125 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,6 +66,13 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
+bool cpu_datapath_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->datapath_is_big_endian(cpu);
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.45.2

