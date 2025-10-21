Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9EFCCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJby-0002bA-CT; Tue, 21 Oct 2025 17:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJbw-0002a6-GW
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:09:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJbu-0003YR-7Z
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:09:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-471131d6121so47085985e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080977; x=1761685777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMuddOKDPVxf+VaI6mjyNul03DXjnU7YZmJIUNGSfXo=;
 b=zKuujR2xFnbCwMh9tJsW0QRHT6AZ2qly8j/lmlqmP5hQNPg2ii5+MbiJkrz6w0SqY/
 A8AmffGjI57xX+ZZijddZKZ+VNfwtomg0oNEJ4/QnVpYaSCel7pgNNZti0dIh398R0Ho
 u/dCkqwceM/GC/XnSs923i/mJ3ZU+AkSytIbLNxzH7ccry2n/+APjGsqEKFcu46U/VlG
 eJx5r8QIyzaDclsLgfp1H1Rah0afS02T/2GUC1yHgJLr0YO3JQJz2dkg25eOtX4rTR2z
 2d0uGglVC9GUiKca1Qr/ZYv14d84AMyzRk/Dc3gyV2kKEJ3ws3I8ZTlDKUm4sDq/VZsQ
 DFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080977; x=1761685777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMuddOKDPVxf+VaI6mjyNul03DXjnU7YZmJIUNGSfXo=;
 b=aMhm8fjm2o2iFVFr53RfLhPHFIhFPlmWs361FEx1wnalj/22m2ksZop04rM5QQGj7z
 PeasUEdnGaD20xtpjxJeVjo2RT/q250Bq9jzTPfZci729dTwBn2WCUA6ak21gwn7K/wU
 kq2YIwhzMzPud+5iavVzZ2tBDg1KO1cOCNZJ8AaVYKfwMj85Z8VAAALR73tu8n2USsOp
 5EaT80C+IweJOMnEcLiuH6BIv1ly3HwAU18yfVbYdQGJVUOPbQjz+rvmRT2LPwuylryW
 JxrCcZqHaeecBs/HbjmmBO3eP4y3RroGEUF7gDJt7O9wwXv0pzpKBMTUSrsqvMr4lXep
 kOOg==
X-Gm-Message-State: AOJu0YyummNPniPlbBP8mr7hdOEDY7xs7DAH7kuan++R+81moTlp5UNL
 cxIZcn2ujU6Wqcgbxq2Fr9M2jme1m+Uee6LKIug35w0sHp+EYze6UoqR2C0uT0v/TXA=
X-Gm-Gg: ASbGncvRJI7Y7Is+sej2iyDnd2iKZJ8r+yFKfJzINyU1Oj76AismCeEBPvlUandfjmK
 cPMYwPbvbUk3z7zuYBw6Uk81NzX93Fb9ST31U/Y1Rgb4hO41IIU3ty2HJiHjv3zr6QrHjzm0VXj
 y4ueW/yug3e3I+qMaNAw2K1xfBYhFSSx2T3eDsc2vEy34oG9NN5uUptb/dOlLYJ5Yu4UAIiN4HX
 oaDML6LNnyE5wi3m63ptVD1TItMqxO/4UGLevPlNUuUjd0BvrVTrIxo7qLwHUuvAh/PYNsWVGdb
 LD3WnhIjk6+WSX3SLLTv2UVXduHBYZ2yPbuyy0scor+YXDeLjUrbm/A6fArZ5BBc76DMlGOgVAn
 wEa1FAwflicV+DSkTOIFd69If0BBKoe69UW0Df55VLFTeP3lLWWth4j+YpRB1MqnnrZi8sx4qw7
 OIvyeVna9TaSPAnEnmxXBsWl/TeR4eDwmTD6LFnK1LyE4bzzKnBlhXcZHwJqMn
X-Google-Smtp-Source: AGHT+IF3TVP6Zsj6tly1fMq3qe+EuRCKyf5MkBa6Mwu9qTMQR+FiigrK+RoCyVb4WMQNJwOnw7Tg5A==
X-Received: by 2002:a05:600c:3512:b0:471:12c2:201f with SMTP id
 5b1f17b1804b1-471179134f0mr156183915e9.32.1761080976699; 
 Tue, 21 Oct 2025 14:09:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0ec2sm21795748f8f.3.2025.10.21.14.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:09:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 18/19] hw/arm/virt: Build only once
Date: Tue, 21 Oct 2025 23:09:34 +0200
Message-ID: <20251021210934.60483-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Previous commits removed the TARGET_AARCH64 uses in virt.c,
we can now move it to arm_common_ss[] and build it once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


