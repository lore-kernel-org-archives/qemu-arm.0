Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A6CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:59:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEBz-0003Oa-N7; Wed, 29 Oct 2025 17:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEBx-0003Na-5O
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:58:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEBl-0008R1-A7
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:58:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so249102f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775117; x=1762379917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eEsVHqOoEuKegp85lNFkyrHkW4OqV5ZQ6TYlgOCxUk=;
 b=wk+7dI9AflIhul4ws4z+mQ/xvnsrzoiAvIaIPkCMaTjBL0K1pAv0Ryakxsd+wp2n20
 bycZjWRW6qK6Lt0bx01Mt3ljBcXYwbfC+w04n2LEawbPF9uqYfINRzohqVS/uxee/agx
 QsUXJAGgBwzfWrExmN6edDWpxgQiqqvGdRhYRtvC/hRWaDxqxEtV9WeQX/XC7bO6NYSb
 U7Zt4DUpJvtmYU3QY2l4wUmDz/b5C8WmH6xHD7vH0Y6Wtz8nUIX6Y+KV5bgLMphmPakQ
 yIVDrGQmOAbIXDs83kPvpCfcPuAr5SNJ6/TPnTm4CqRbZ7C5HdouZGd0+dIgweTSJVD+
 wjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775117; x=1762379917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eEsVHqOoEuKegp85lNFkyrHkW4OqV5ZQ6TYlgOCxUk=;
 b=fBCTrD9XrS3B2tzd/08OQ3tCYzxhgJM4V16fWVKMIEK+4LoeVmidi9zmLRJ4hskzQ4
 9Yzzmv8dpXX7qnjeqRHs1S2FwQyG9xb9rkS/OYW/6BK9D5Gv6z8oRKjd/xX+eTaMOnri
 pge8Gg/aflYEW6oF50iTNbq3EehujBBe9SGG3vg4d+BphY3fpy484+FsbvMvxC7Z6mRt
 XHowheDNzK1eAgEE+5E3mKJaAHe5EMQNlBf27uKST1aG1C+Vqlr4nSGWdlTYbJo/r8h3
 cHQHsegZyZirDIwEXNKnAJks9z/ktXfXLe5PTk4d5pb1ECDZB1+aM2I8c8lHleJeRS6n
 UbLw==
X-Gm-Message-State: AOJu0Yxs6sRbkABI5VFNIDBKwvrhzi8pARdxmElXTKINbqrmcz6LTT/t
 l2tuIg+KGNAXSBiI8wwLfRVisxB8ZRWzPMX2UxW+2l+YtgVW+cFrw6vq1h6VuZjPHNM=
X-Gm-Gg: ASbGncslic3bpFyT3ig62qHyrounBdoXjN6oelY6HKJoW5r1AA2GLNXJAPMS8F6LNPm
 B0wrn1+VEEZLD/Zifgwkj5/ZMtwKGbP7KN99soEF1fkYVcLG6dPZR9mNBXFXjCaHYoiqWxcWd1U
 kjQVEWyOLDDqw0+BckgYFpAQWp7EpC2O3KrUgcAd4P4BUT2zchvvqnntYca0G9OzzEXNwN81Bb6
 vFMasee+P8ntM+2i/qChft3b/nM76Onb8GG2lGUqh9O8mJLXbbEBmazs8BMCKGcSs9EiOgADN8y
 US049Aip0y67YW5HM5hrIKkObY1htBpSQzWg1gIpbKB242zV35zYwz6+FimbHp/AhS+5v9b2b6X
 /p5otNrkweq3ZgWNM+VCnSNfd/BaBk2pot/KhKVJiUm/aL1RpCSuUeUCNT0Yk689U0PRX7Uovan
 KQsXG+VEPAnPr8pqbJdjxE7pjKbE4sqBbRAOPesCYotEf8aT7NXQ==
X-Google-Smtp-Source: AGHT+IHvf5gvu7jx1uWaoX2MnBF4KCAmPXv641va880tko1rx7Oxwfevik5Rr3U1uF0aOyIOIF9BTg==
X-Received: by 2002:a05:6000:186d:b0:426:d57a:da9d with SMTP id
 ffacd0b85a97d-429aefda908mr3827502f8f.59.1761775117017; 
 Wed, 29 Oct 2025 14:58:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm28667863f8f.6.2025.10.29.14.58.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:58:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 18/23] hw/arm/virt: Build only once
Date: Wed, 29 Oct 2025 22:39:55 +0100
Message-ID: <20251029214001.99824-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Previous commits removed the TARGET_AARCH64 uses in virt.c,
we can now move it to arm_common_ss[] and build it once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210934.60483-1-philmd@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index df4c1be3b3b..9fbbbc9a6fe 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
-arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
-- 
2.51.0


