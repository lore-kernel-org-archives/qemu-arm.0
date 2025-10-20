Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF4CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:21:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyEz-0004vZ-F2; Mon, 20 Oct 2025 18:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEy-0004uV-69
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEw-0007UG-B9
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so45886525e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998829; x=1761603629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsIzqC21swzey0dvr5OhOwwY9jaXKLDHI4qDTK4V2Dk=;
 b=Vawg/Q4opZTH8NfjxdlWslzVpNQFow0YrPBwPyjnJknihdwVYgvExyKXEAx7zfJdrO
 JGmkOen4KApdXPv9zIDdvgmY+OCEMex6hNeYOCsKFRbzbD/dMFSsDtbinPg1LM+4/e3x
 KbxlADrV4qN3fw0UsfRy41ihSZmCT3QyI20e+l/4U8PxEgTBznLR/thT0CP7IUvQRkdB
 sE13tBRs0XIzjwIzFpQ78lgOPlx5+HBG2hm9IEl2TPwtrmZ6HJsimyf0ZJcX+hm6g08X
 9oFE31Qd7fV8CKK0EwZtQf4To1/rQ+77s1FlsImONvfqRTYGwPxkTDBUHWqw8cDTY5BN
 BpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998829; x=1761603629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsIzqC21swzey0dvr5OhOwwY9jaXKLDHI4qDTK4V2Dk=;
 b=LyNo1glu8Ng70hSMmbHxUSyZlBY+dVdz7HICtNyARJyxkeB/s0zZ6LEuT9UXTg/Xje
 tafhyKB7Ut77hcpmoiXPM/Tg311SErtMfb3SyAcIXD4lOFaPGh2Rka9xlGQqGPIsRIWY
 GF3MI/wyzRxEBZY4ek+VybVwGl/YYlQPX2iUyPm6NWSiUUBuoFlPKP5oZbUVJTnxOHt1
 l2LY86QmGXU9OEFa36N4aKcgz8h7ue/ritovgZBCdXQHpC8nM3AS6L8sEETY56387jfc
 RQTbyYxnt/RvpwSXp5MTkb9sqGhyPPpUlZzVT5gys4C4o04dzPezzJTAM53+tzp5sl6x
 OyJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbhOljrpwxloeFrR4R5aP5tkpA3hfLpSjWFE9nO78LaAmuKvkB9+00VYQBTeKj3zOz+xrkUnuqpw==@nongnu.org
X-Gm-Message-State: AOJu0Yzb4kDXkgaMWtTn2QogrXx6bpix2BDcO5S14QT63TPKJpbX7wML
 OOTPnc9KLn3DVEKsr44laRAjMNwehrVvJbBDR8mv265oJ9/VwVCAe7ayKEJWjjau6F4=
X-Gm-Gg: ASbGnctLB9+gwVegwPwVXnF/Xzj+aud30B56x6DQY4vQLDjlHCcRjJlaDyAEfcQhoxK
 23utfJAgv4WD1WdNorFdFdtPrXLGjQQW+i/nJQosGvQlHt+YkZrbbNxE40+LfT83UQ1eCEuFMR5
 iqIf/d4fOASTZo9rh8gPR4RMOJd2ScRMH78EYCfuXarcKDprXJQUxbJiEH6dawKiurItoo9bRv+
 4QbwhLpvAi50/tI6AAR2k8djQ5k74PxWgwWRSHleIWIs4iNzctU2t7CnQQzOV7eMZY+1sRy3aOn
 qtpOqWaWWhQmNbPAyYLbz2kdCOed/mhgh96MpOsPQeURJCa12yiFKppGBWKA9BhECIytAGkg2VA
 tSIgByxNd93KSssoaM/Oj5VdbMAeIJ7OpomI2B56z8/ChxxCRxNJdcguvnkW2bsAbMoKHMxeqXO
 8dvSpn1IeujaSZJEacmvuWng/KGvcF86eJYKlP0uoKQYdtp4+nqg==
X-Google-Smtp-Source: AGHT+IHvp6d/pCqH2l1QXX+wLlTpbM/T3p/Adqx9xag8fn/3lI5Idl/j2sL31vh0ju5y4Ftk5E8gSQ==
X-Received: by 2002:a05:6000:609:b0:3e7:45c7:828e with SMTP id
 ffacd0b85a97d-42704da9dc5mr10761195f8f.33.1760998828747; 
 Mon, 20 Oct 2025 15:20:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a1056sm17168844f8f.2.2025.10.20.15.20.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:20:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 28/30] hw/arm/virt: Build only once
Date: Tue, 21 Oct 2025 00:20:08 +0200
Message-ID: <20251020222010.68708-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
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
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 4dfc7813191..f9d615e360b 100644
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


