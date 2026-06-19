Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1475ECD98F6
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYum-0003uA-JE; Fri, 19 Jun 2026 09:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuk-0003tE-Pz
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuj-0003Os-0o
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso1129302f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874339; x=1782479139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T72NDyunHLyFV4aqpIGKGdQkRXR7DefmzidasatP8oI=;
 b=OIj/gFV0DQ0uLt6GIviLedpL/NoyNRyGiT3RDihj2mQDqvcCTBoxdbastAQPk49f2h
 SEbRgWKyUThkV4pG1XIx4EyF30WiW4+mR8WaKV/SRkjWWyDqjWbpC175HFrv6XWd5UbM
 fd0oddnmWiY/K5Aib1C6prW0jIFhJuRN7MEApkryzBGQENcT6+mV4wuDdyMvJ83qAeSF
 lPXMC5dLHqTLveuLgxcWE17H0lLfcPjVsn//BVULPczeoruwpP0NQSjLz57OYL9nWSDU
 sEmEJOphcKTqfBQ2bnWNBsflEPUfXccJvV/y7LC4/Kayn8vevC+7u2alq+LcSWgDQ3iC
 BGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874339; x=1782479139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T72NDyunHLyFV4aqpIGKGdQkRXR7DefmzidasatP8oI=;
 b=RRCqdqVlwocFph/l6uGKBcTwcbw8jB2wohHQZ2n18qEsc+pLFmtEEOw38JTz60FAVg
 QicONe6RK/r2BsfMvHrgF8AzXGm2AWvruhQmkH67Wr0hVv4QxQYO6RRtSuk7PiGbYhq3
 Qi4E/hYo8bmoJfSLRCssTbwlQcErVlD4MZs3O9dJrdC5kvR1qOqQQ1vE8RpoVahBwUTU
 I6JaU8141nIZT1vvLlI4ZtjsnMhtgPbYI3sO5YF5hcER2MHgfg48F9WfNa+pu0jc+6eg
 8qet2g3btiHR6Iq7EdZ0pfJ1klvdSzT3tX0/DkUPYfvHXjATd3zXiKxfeo1OIy95rcJg
 nXMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hm25API8D5q4u47JIZZjmagXn0iBwzRaLFFjblXOFRIz/hkfgpQI6zo2P/AK37V8mnbaZ2LfTRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxixArWtfhgem7nmZclZ9VHuE6a+SSW3ks3lQ/U9csNG3ahh4Yb
 SuNGKx7ZInTeTOWRSoqrbFpV35ZLRD0//xEEb/mdz3XwO5vTaZ/XmeLhqb0dHFlnqh8=
X-Gm-Gg: AfdE7ck5duBYgYPSov/LDX3fAuc5EtufEj/qHi+GwqiSiMkBzXgF4HjzMpSWsZd+DqF
 f7H9LVtPRZyOqxWTyRq0FvvWXXxmLZMAB6qEPC1L+z+8ZwcKJPzmkrYmL3U4P7JD3Qausu6N0PM
 x6+EP0ZAdQugmQYchOIeKmK8x881Nl6we5KT5WxqmwfGVcVD8lPyTrElH2k/Z5oeC1J/nhJLhnm
 9001+PCimd1KPs2E2X1aZfnGnii+VD+O19GFglFqNCDsBMz/n4bHejI1qXBT2QK64skEGOXfZBO
 /XyRr7im5Ao+RB2D1nt7ZYpWiCTthnZ9r0rAsNr0v2cEdacJhEk/wiudge/QNvz1rWF34PMfWIM
 JvOqjVipR4aptR9LgTdGuFmfBQqOSDedZi1JwRl84NRtuPSUY0vUiFx7Mv4RI6GXbrteh9estKD
 4IgAJi0dQ6MKrH
X-Received: by 2002:a5d:5d87:0:b0:45e:f381:cd85 with SMTP id
 ffacd0b85a97d-4656f4704b5mr3865725f8f.20.1781874338894; 
 Fri, 19 Jun 2026 06:05:38 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46508a04b55sm8170000f8f.5.2026.06.19.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5C3E15F814;
 Fri, 19 Jun 2026 14:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-stable@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v8 1/7] hw/arm: use cortex-a9 mpcore base for CBAR on npcm7xx
 machines
Date: Fri, 19 Jun 2026 14:05:30 +0100
Message-ID: <20260619130537.820184-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619130537.820184-1-alex.bennee@linaro.org>
References: <20260619130537.820184-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

CBAR is an IMPDEF register and according to the A9 TRM [1]:

  In Cortex-A9 MPCore implementations, the base address is reset to
  PERIPHBASE[31:13] so that software can determine the location of the
  private memory region [2].

If it doesn't we will confuse the Linux kernel as it probes the system
SCU registers [3] and erroneously assumes the system is a buggy Aegis SOC
and nerf the emission of SEV instructions, deadlocking any WFE's in
the kernel (or QEMU smpboot code).

[1] https://developer.arm.com/documentation/ddi0388/i/system-control/register-descriptions/configuration-base-address-register
[2] https://developer.arm.com/documentation/ddi0407/g/Introduction/Private-Memory-Region
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/head.S?h=v7.1#n550

Fixes: 2d8f048c25ab ("hw/arm: Add NPCM730 and NPCM750 SoC models")
Cc: qemu-stable@nongnu.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

---
v2
  - rewrote commit message for clarity, added links
  - used arnd's arndb.de address
---
 hw/arm/npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c2bbcd89dbc..c27f149c04a 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -492,7 +492,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < nc->num_cpus; i++) {
         object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
-                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
+                                NPCM7XX_CPUP_BA, &error_abort);
         object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
                                  &error_abort);
 
-- 
2.47.3


