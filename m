Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCFFCD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIch-0002Zu-04; Sat, 16 May 2026 13:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcf-0002X4-I9
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIce-000874-16
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso3620665e9.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951778; x=1779556578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8t1iShycKMOk9DKixWKJ+LNY4Nu+iOM690vC3QqkeQY=;
 b=GN2L/S6OrSa7FNC7lxdCY5px1DtIer9IZ1WhgA+RNUuE9frk71NU6cym/BkFEcv9oi
 dxRBWM3sSlygk4GUc1MS7uZ1paIEAtFp1NhEUFi5jcZk0F6+w9MEbOKdSV0plulwDR19
 uhY7CWmuyr3LBc711Ir7N6eBYggywXtGgJAn6Seh2pDvP6J1fC0b8uJxSDm12PlSqcGJ
 3lyILqOtJfQohkmt3ZQGb2xnQrnlxGbzUckH8nveIo3KiEVLaO9zEwRLxTpYhUYcN2Bz
 hSg0HF1BZw1RJ1GfDDUjgSNFc9xR1LzhGd8LvsTdViUoiTv6WXO6aVkJ+B/yznJ/36iA
 /kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951778; x=1779556578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8t1iShycKMOk9DKixWKJ+LNY4Nu+iOM690vC3QqkeQY=;
 b=FHlrgMpZAHenubd5DbfaIDkyeiBCyDXWNRStj27/c2hKY4VIwwW0tNGJpcCRldfEum
 aTewAbAki2R1R6gg3cFkTzwnUsVwsrgHL3ceQVdcB+SgWp2OZhi68gT7nB9c4yATzRCk
 w0nKJHovEBM4Ixt1Ka1RmARSAWfE8XFrsANQqLdJ0hJLwpv510Lq+8hB3tuHIz2enK6g
 EbQp6n1VmLvHc72WHLpKhHeUvwFDWzu5ZyJZPZSGHhekIllrI6htDI52/mwh4tp667Lk
 a2K0QQtrzftZdp41K/nX344MIeIe0WrtMPj293kJEEWjsZT2FswiZX+brAbJERxo87HN
 ha0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HPndcbhr+BMhRZdtbqDOs5jlUwcHdqkCHzjjoku8ZhAmo1vUSlSFxealsmkojYX1OYgsic6gWsA==@nongnu.org
X-Gm-Message-State: AOJu0Ywi4yIUBbNSNkrEav0Cug7lTgCMZ3n3t/txNFa0IOyDzIIN/M7H
 KlzG0/vSFNzB9g4Z2isaFuVUTCZOHuIr34Ovwp3oEuNzi8sqET59VkRKm5CNDSIfcog=
X-Gm-Gg: Acq92OEhvC8MGIY/VcmIb83dvW970cR6aQBdCAkHQerDJ4i/Ev7u/kXJvsCA4HyqL8k
 GYENLB9bVS4eqv+Kp5z+1dovxyuiVfkz5T3ch4/Rnceu7/J3kYFY4I0/qpWHYoR/y3Mwk2AqOEY
 /ugXXHm90HQHAilkSPyByLhBJsUkQEm/CgPbp9668ryhisIAkkvuQxJBd2Ysz2W6BS1DW7G3rBj
 70kC/UlC7pDjpyiHSNJN3AAkisXwWjehuZo1hFKobjJ5ZxoPXWRfvtNEEMoLHX9Xe2ujgoqnCdm
 mtLFKzP+ms9WFvwNngn5KGFPOUmccnTo7xl6oPY+cF7Vt3xUbiMvevv7DwYaQ1otPkGYa4cEqoD
 7yGw1n68P2SuAytuEN0IB4KFc9+WUldJpBRwXMLFaF+TkTKexYoG33UPKlONh23d+F9iA7UbD6F
 mGMF4Zr8qKVOiTilUhkygkvooQwz1aNXTPSfyvyh9rrNXX+HZt8BhXaXgTEG5Lyy6B7cZxjwopH
 UHckjFaKNQ=
X-Received: by 2002:a05:600c:4fc9:b0:485:3abe:ab86 with SMTP id
 5b1f17b1804b1-48fe60e3b17mr111829615e9.4.1778951778367; 
 Sat, 16 May 2026 10:16:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8344asm230344605e9.1.2026.05.16.10.16.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 07/21] hw/arm/meson: Remove now unused arm_ss[] source set
Date: Sat, 16 May 2026 19:15:09 +0200
Message-ID: <20260516171524.19184-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 7c3d66f4378..88e7ad1a3ed 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,4 +1,3 @@
-arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
@@ -108,5 +107,4 @@ arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(files('boot.c'))
 
-hw_arch += {'arm': arm_ss}
 hw_common_arch += {'arm': arm_common_ss}
-- 
2.53.0


