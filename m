Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8B1E776C0
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:14:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQZ4-000274-Sh; Wed, 24 Dec 2025 10:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQZ3-00026K-Ae
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:13 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQZ1-0002yn-Np
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:12 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7633027cb2so1098515066b.1
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589250; x=1767194050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQzy0dLdaSF6COAicvlR6PVbfYgMujeHrja50VAAj50=;
 b=E2S9SEcbko9BJUpsp/TgaPlG6jiKDpHND7Qh77WGbLTp3CyovdwK91AJ+Acx622J43
 3M8muqsSLUpNAO7d9N6aKaXoMXElYJKEDKCWzO3f0WZnXg9hLFw3kYRrXaVW/1Ql+BRJ
 8m0t71fCc8TNfW6U1ksDkv1iLNFSUgT0GOYvbeFjsN/1ScGkDqcfpBfq6K3MU9HfQiGS
 Y7/oWh9YV9ijt33x73qe2hNjMaaUo+/xl+nO9dQy3rdF227tQvfhz+GZjWGJ/yySNB18
 fOAAUAR8E28VBfabjF9IhB6VmlICQmH12muBTNhZOUtuUg8Y0iKlDdrKXLYy31aR2TaA
 kqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589250; x=1767194050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NQzy0dLdaSF6COAicvlR6PVbfYgMujeHrja50VAAj50=;
 b=Re8CfP5g2SviHxGjz3aTdHqODMsErFrJBHHioGuKx87GqMZGp0007aauDigeYTeLvn
 oCkjpqXHLPb2xyxNvpeQioBoUipzGhKmzGSC/u4Ut+x6LdkjkMrSsdOc7fKPzayV8HmI
 bE2J9m9Ed1uueiKWN3wbZfeGrwKeNAhdXIccPXrqLNmhHUIMyTeaod0avtuk3B7CtSuq
 h0kk8qWc6Pu+mbTe1huoSamOnYKFqXxp/oN4hubK+F7OmhqISThg9a2T6MOGZjkRwSoC
 2fWUJMiwTn+SugDNaM6c9go8YyTzXjtT6SbOvUb2P0IlcIOCgXqK7LJzWuVXNG9kOgfN
 2xQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrt2OsetH1PAr8wylc6bFmjMLmI3etKRnfeAJXT4WvCkqmnhe19qzUAOZ5NfCrIYX9L5DFo5cBGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxOcSdbHJqej6/IavIg2kicpqfUyPWdjM7qYaNo7ejy6vYE7Zy
 6db23/Xw1lABHzadNjKJW9JgINbHsjXGeF6e9a7XIesPxYPJBwzZQJeNjOV9x8+gmXc=
X-Gm-Gg: AY/fxX5l0Cbi+VQigqdQOPEHkGzempXbQXxTddllRplFQtwShhrmTwdY8DmmCZuaRjU
 N8NTgbVMgBOjK5W5EuLji+dT9leKchhwGkxDelXUZMAq3JZI7LthvDsIWsqtwrruswpF+qUwM7K
 qkl76e8rV016KjiX5oEO2R6tPn3Zf7iUyOLKLMxXo/+txa/ZNpQrGaWW1BCNGSkCevXqsWvlz59
 6ZM/WUXDMZG9y3xIH/WE+2khofL6Rd7+oXToNgBmogVbQ2frylJ8ID0zgVsv31JqvcHfys1R0pN
 Zv7xw1l7bywyFojSl77TYkkaZuHoFwEzu/3zjexrd3U9fRlJqAurz3Sc4FwjAVED/M/K1b3qYlO
 YFaydgTxo7+oqPxfNgexcbf61pGIDLZOiDeMlQdpunI5+xZjdT74H8LrFeemWpixLO0c57XwEWq
 YIA+SGxZSJnDXqOooNgR4JyDOFK0Qw7PHHSTN0MPgfOzRh1Yx6Cz2wkAI=
X-Google-Smtp-Source: AGHT+IG1MXjRhMLVLkvNGpMS1CpLHWaxCRCtClGiZg8AGngYKI/lUOhGKo86qATzFu0tPR4tqcpw1g==
X-Received: by 2002:a17:906:30c1:b0:b80:4101:c99 with SMTP id
 a640c23a62f3a-b8041010d71mr1260480566b.21.1766589249356; 
 Wed, 24 Dec 2025 07:14:09 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f09149sm1772261266b.47.2025.12.24.07.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:14:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@kernel.org>,
 qemu-riscv@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/9] target/i386: Remove x86_stl_phys_notdirty() leftover
Date: Wed, 24 Dec 2025 16:13:42 +0100
Message-ID: <20251224151351.86733-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224151351.86733-1-philmd@linaro.org>
References: <20251224151351.86733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Last use of x86_stl_phys_notdirty() was removed in commit 4a1e9d4d11c
("target/i386: Use atomic operations for pte updates"), let's remove.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.h    |  1 -
 target/i386/helper.c | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cee1f692a1c..4c0579a5678 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2623,7 +2623,6 @@ uint32_t x86_lduw_phys(CPUState *cs, hwaddr addr);
 uint32_t x86_ldl_phys(CPUState *cs, hwaddr addr);
 uint64_t x86_ldq_phys(CPUState *cs, hwaddr addr);
 void x86_stb_phys(CPUState *cs, hwaddr addr, uint8_t val);
-void x86_stl_phys_notdirty(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stw_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val);
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 72b2e195a31..d14f14e0d4d 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -690,16 +690,6 @@ void x86_stb_phys(CPUState *cs, hwaddr addr, uint8_t val)
     address_space_stb(as, addr, val, attrs, NULL);
 }
 
-void x86_stl_phys_notdirty(CPUState *cs, hwaddr addr, uint32_t val)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    MemTxAttrs attrs = cpu_get_mem_attrs(env);
-    AddressSpace *as = cpu_addressspace(cs, attrs);
-
-    address_space_stl_notdirty(as, addr, val, attrs, NULL);
-}
-
 void x86_stw_phys(CPUState *cs, hwaddr addr, uint32_t val)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.52.0


