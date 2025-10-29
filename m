Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A0CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:58:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEBB-0002qG-Lw; Wed, 29 Oct 2025 17:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEB3-0002ip-5Y
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:57:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEAs-0008La-KR
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:57:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso314828f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775055; x=1762379855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/Qn0QwFRC01wWBNNPvlK2cZsOIvY8UHWwsuTo+FxbI=;
 b=ghGmu9lEqAPF6nxRSvCZR04c3eeVvajHQxCbvVHF+gChrsk0qeYN5znBfKGZWdPaRM
 YJn78h5/LFROj/U6/hju9gseQ5C0UtTkyqCc9W4PVh0CS6dxM1IJmjlNBuSVLz2cqJdj
 IZxVOD00Xy7A/ECwpIKeCy6JvKorZ3QDSsNaRBXJZKLTJq2Cg2k1BnjiRuL69XcM2+HW
 C6Xaeb/kkQjZK4Je5kgQY969PaslcQHbNpi2eyzLKxzrAGLWNVsT5JgCOXUxRXG0I674
 Adea80uvmaNSQNFx6ZCiigNz4egGJ4nWYzB9cbePi05temAVHwMtJNrCzeqda/7khxCa
 pLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775055; x=1762379855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/Qn0QwFRC01wWBNNPvlK2cZsOIvY8UHWwsuTo+FxbI=;
 b=Fn22XDmCg+IX1/EPYoyUfcbm3uWZY2eOceEhHyV3rw07nIasaBVe9slZW8jroepiAA
 2NzPwuNGMPGdD57EUUZ6tlSDoLYnw8erOldicCtCR6wn0n0rGIqU9mYioJVwD0cnY3Wf
 YsIO95x5H3faiWmHoKyU7H4eGT1RlAsDgY6YuZzaGLRMYz2ZVrjyktPIdoJ5nuFc5M1h
 t10DaN+IuUbp6GGfTzuqGE4sJeLrxkqHo33+s/tpK4MCeu5qJDU13HN9y4hnQt5IR4vq
 S5vtmvbNQMSCU2fIpMMqgf69KPB+s82jDZO659yzWsEAuFLYb5zs2bTQjkqh74n7J72e
 avvw==
X-Gm-Message-State: AOJu0YzT2Vbz4FqPVmiPluI8jor86u1FXU9gZGF8QZmLCkZ2ddYdesk5
 hJAKmD/ailqPsWxrLm8JurpVaD+t5e8uG8LjklTuKkueqSI8vDGpmwijdLmOYnYsoUEa5IhNRHu
 07M6W5rc=
X-Gm-Gg: ASbGncun6Br/x6xxi7FkUnXDXY+lD9YNHlVzs0L9dkVZrhaCXd2rVij1cl15nN48Vz4
 53EyPK6OwGSnIBunwWMBTAlv3Dc+fx3q8f9/btbvxvd1sW1nm45ORn+3lo7fJBFj4qPAMPWtLlK
 1OD2mNzoDSJHrFc2vkvj3Ydg87GAkOjda+H1YX0EnPfkBJRa7aZ1tfKXJp4K/ol5JZFsYK2KhOV
 ns96NR/A34mP1AIqnNUKJPaE0wopnL1b0wJfLpKXtlcIjcQ/wSpnCZOHUjEaO1CxpbmNWewoG98
 +gOauQ7cI8ZQglrUD5ViwOKX+aGRnZDEID+31migiKGUBc6+OQ8pa+pZxpRZwvOPeStiT7PDr+q
 okRTf4Aq+lGI8gnCZRc6pLiqIu9UbByNFpqIPf5GAD+hjytE7sA7ZXlaCZMrpp+HVi2vVuJlvHy
 PY9qx5Mai8A1ra5Tyvh20yD2UC2pR5LdXCg7r/H+IhhiVLXoiioA==
X-Google-Smtp-Source: AGHT+IHCgvhyjgB2qm2tEQcTA8zbTlJRdmVI+7s2FTKNJ9yE47qiCM1rLswz/RaAdrl+3Cl/FF1cDw==
X-Received: by 2002:a05:6000:402b:b0:429:9272:c1ae with SMTP id
 ffacd0b85a97d-429b4c9afaemr810549f8f.30.1761775055469; 
 Wed, 29 Oct 2025 14:57:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d3532sm29188554f8f.20.2025.10.29.14.57.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:57:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 17/23] hw/arm/virt-acpi-build: Build only once
Date: Wed, 29 Oct 2025 22:39:54 +0100
Message-ID: <20251029214001.99824-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Previous commits removed the target-specificities,
we can now move virt-acpi-build.c to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-9-philmd@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 531a635936a..df4c1be3b3b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,7 +1,7 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
-arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
-- 
2.51.0


