Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1933CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 22:07:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEJf-0008GF-Ov; Wed, 29 Oct 2025 18:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEJc-0008F9-Sw
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:06:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEJV-00010H-TO
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:06:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso212387f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775591; x=1762380391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veqF+B9YD9xJXRSdAxin3zDSMOZgaGpl8wg92/hv1GE=;
 b=lv41CniIY5WaGFrj6wwrnlIUKqJvHRLPc6gWfom/Xz4YsnI81S988uaSU7VHhRef2z
 FLdKFqUpxPUINjtp4BQadwxuYYVrdZ1yR6au7p3jQdZENbDulQPtEhVMyi00KAkThnMZ
 lpmW4pkdPbKuiN+0QeU2a2m/twvL3OMFv+D8r1y/AYMqI+e1YEcUYCke0UZIC9gq+Scx
 hWVNgiNIL4wAj+yqsynIHgV8x9aUaLmI7KJ71kqCaCI+0bqR7bW+x6ldDHf+//uXC39T
 Sir1Zu83q+fPeizVi1ciH0FPlZR6Lw714xYC4OBXoOIdvQtHmMjy2P9M+xogPIi+MMlu
 JvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775591; x=1762380391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veqF+B9YD9xJXRSdAxin3zDSMOZgaGpl8wg92/hv1GE=;
 b=Viw/o7E+iWRvykoMl2d5pZsEPcT0+kzUOMUQvKN+CNabGbkjiJfl/JCie0NgGc9h/t
 yZC1l6bBKA3FR6EATdlwqfMLQVPTgvWAf9Txv8G//Or7u98fGCUv1IxPPVvvvC88L+pB
 e8Cjm7yICKoWD7l45y6xFLHhDEtSOvjcj9exorF77wdnmYz1ekPyn3PwSj3RTrUWIW+a
 CUsJB5Y/TzerYUEVSAMgfMiwWcVHwuO+t5fM3PidbsrCoWK7XpvBI0LjyJssq89c1Mw8
 eVQedwt/CXtLo7kYwY6B/QGsRI8WeI5XwW4daVNhkCFZ1MEwxOmk7gZBm2cGvFEtdjaA
 SQKQ==
X-Gm-Message-State: AOJu0YzMOuqguiuqwqsqPGk00MtHE8k1z7wW6KR4KTN08ijAOJVGiBhh
 55TWM1qALlcGnHf2Q0UfzUB6kJHXgKeE6BXKN7V2tj7AnHAUr+nSe/v4In6uyaIsfw9LtBApFWd
 046To4vw=
X-Gm-Gg: ASbGncvV+1lNa1ZVK2Og0BqtWzuQcWiMI6vo/TubzP55xC3q3jUp6DZDz4Arx0mRv56
 dXdzy3mRdi+96YQbcc/pHhNUN/70NQvawyjr9OG96YzJXclL9FAXGQeZsYf/bCDHhqZKKY1+fEg
 6dDZgLjvHUB2SjD6xi8w9h+A/QylRWdBazukE2qZUqavXSwV3HEjU2ZMJ5SC6Huy86jDfE3mqXH
 jROAGx1MVm4vnTXqq2oW/pnUjApX5WX3q9FKwXMG23MJOKLiZtUpp/Zcggu5XZU0C3S4kJv9mhv
 p3S2x0CDYL/BKlQgFpnZuVnN1h6QhKacMPnZlOPaafHg3WjO0psdagKiBywbjZYb2zcTLib7JUJ
 iaIGHA7n2G0CFIm8bbprx/ebHhZYACfT4nnmPr3RzQb7EKiYung/cEEk50cly5Da96qzpDNaKvg
 Ii7uAfwJAUxfGvP9Yt6T1Y2INGGg1mgspUgBAo5iME41ST8EzpGw==
X-Google-Smtp-Source: AGHT+IEbKRW6Xhx6tz3v9V2jt9OndZxxOflhU3MXiHFeVDPJ7uhr8kvz/sZkbLcmAJ2UTLN6uW3IIw==
X-Received: by 2002:a05:6000:2506:b0:427:55e:9aa2 with SMTP id
 ffacd0b85a97d-429aef78924mr2786336f8f.9.1761775591538; 
 Wed, 29 Oct 2025 15:06:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de5f9sm28468361f8f.38.2025.10.29.15.06.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 15:06:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 22/23] hw/xen: Build only once
Date: Wed, 29 Oct 2025 22:39:59 +0100
Message-ID: <20251029214001.99824-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Now than hw/xen/ files don't use any target-specific code,
we can build all file units once, removing the need for the
xen_specific_ss[] source set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Message-Id: <20251022140114.72372-4-philmd@linaro.org>
---
 hw/xen/meson.build | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index a1850e76988..dcd2b7e1df3 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -7,21 +7,16 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen_pvdev.c',
 ))
 
-system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
-  'xen-operations.c',
-),
-if_false: files(
-  'xen_stubs.c',
-))
-
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
-  'xen-mapcache.c',
+xen_common_ss = ss.source_set()
+xen_common_ss.add(files(
   'xen-hvm-common.c',
+  'xen-mapcache.c',
+  'xen-operations.c',
   'xen-pvh-common.c',
 ))
+
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  xen_common_ss.add(files(
     'xen-host-pci-device.c',
     'xen_pt.c',
     'xen_pt_config_init.c',
@@ -30,7 +25,8 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  xen_common_ss.add(files('xen_pt_stub.c'))
 endif
 
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+system_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_common_ss)
+system_ss.add(when: ['CONFIG_XEN', xen], if_false: files('xen_stubs.c'))
-- 
2.51.0


