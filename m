Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4787F513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:09:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGst-00011Z-9N; Thu, 05 Mar 2026 17:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsn-0000zR-UC
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsl-0002DU-Uk
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:25 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so1138075f8f.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748562; x=1773353362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VeLOTnhmpK3hGfuKtvu330mCQPPVQNuv7C0J7IEVho=;
 b=V0vBBOLbnAaqAJOWAPI9ZEddCBvzmWIVyN6qhvgVxZybqk0brWBKxVT7oEjgOEbmks
 TLwsIn+/xmGbsiriaszq2j2uhai6CzNEoSZCNnhyW+P4Fwj3fzKn+Rsddh86ZrsvVsbJ
 DJFE3fB54V6TEv4jLifFc9XEeHCkI2MpYwZ7v5plOVfxRW7e1vRcs587oszk1s+83ZSG
 DliGpzpv1y1vPCsvcAt5svm+ruyUAjJgBkhtw8+3vc8DlD8i6XBWV43MZDzK1Ti1gs0g
 IIqOEPYnXAjg3Yni8hoTKYAOuThCqvsG7ditdZPov0p5NGUNaPv8msVr7dBfBWomZlkJ
 La5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748562; x=1773353362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6VeLOTnhmpK3hGfuKtvu330mCQPPVQNuv7C0J7IEVho=;
 b=J6xeU6NV1rG6Yh/91+gSN4XSNodf91B3FKoq45Up92WhIT2OXNmSNqAayY+cA5b5l7
 +kTushe8OZl/PmaxqxBsWSV2OvYfjNWciEM4N6ynWuJNF67chGSkVaWVDQoFFPmUW4eH
 3ZJrL3qdJQmlcs+NX9O+urVi8sWqWLVpwrQUYDlU3LEKKBkCFug9o6E5PH4wIU/U0tdp
 YYqgnpX2uljtIMb6h7u1ne3PqAIl4aOo4iJhSHLyA1az4b6HqPocRSYHfCeLlyWMvZZr
 32ZYMBjRkaFmoQmtEgfkjaSmEAtQi8LiK73S9WKE0z//MbO6EnIC5Rby5i7z1i77HNh+
 eeTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZz8y+0ZXLpDLszWXgkRxXB8LDKET+4gA/vtGP3nJbfrrGhCYn3DkYoFYofT8kdM3jek8rrwz1Ww==@nongnu.org
X-Gm-Message-State: AOJu0YzrXtBgIhwsngjxAHJe0Qn8Js6T7ekvBYvKqvL2frl3qJDfgFkj
 r9zChy86RCAbbHrJN6Vhm04ccCqo8g2skxN3QtS3FAhnnTB+WRK2hi07
X-Gm-Gg: ATEYQzz6df0B8CQLOPihOdEhJkJp5dLzCc1mAqbaaxspUkjSXfhHYUY9CoQK40NE78b
 rDr/Jt0pXb8NJXjQlbqt8DLlHy1B9Ei0w5XcFODEM4IM/OonTzZ6UdzCMd7eaXeSWKACu+2dpWe
 FbcftOy/LSZgVuIvV79OHw8uaYhnbHaSoP1fhKUP3yKbxq0PIp5fTsW3ZmGAChWbFNG3QJvH6qW
 iW6k6x/nI9d4zXaMNDv9cqckA6gnKqUXweHJSAd8/X9oiCz+NXBVNitX7dgDzUwQHHkC5uLSbuY
 jyIKPhKwvYxUTlZ3HUtHU+DwobK5PntLiXSwVaZwSAVS/P+HV8L351pYgoVhxREG1Efxc8LwRzS
 uF36KYA3+7J3PwdGlGtE2dtvZzYHPmCz8zsJcGjf+prAejn/jG0pG2qkKKhGlNSgIx7drfObMJm
 fJjqudnbXbAs/LjLBaKPetDSA2QaKJKs0bBqLG1PSfYvPYklIYldem0awXqswas/zJyZHNP8NSt
 x1JKxka62sfb1u2a+T0KcgRaPMz7l+SNP13Z3FpArDtDx4=
X-Received: by 2002:a05:600c:4688:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-485198a3bc4mr116276825e9.34.1772748561651; 
 Thu, 05 Mar 2026 14:09:21 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 02/14] hw/char/{diva-gsp,
 serial-pci-multi}: Fix deinitialization order
Date: Thu,  5 Mar 2026 23:08:59 +0100
Message-ID: <20260305220911.131508-3-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The memory region is owned by the device being unrealized, so must be
removed from the mapping before unrealizing.

Fixes: d66bbea4e0d3 ("serial: add 2x + 4x pci variant")
Fixes: 274074708455 ("hw/char: Add emulation of Diva GSP PCI management boards")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/diva-gsp.c         | 2 +-
 hw/char/serial-pci-multi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/diva-gsp.c b/hw/char/diva-gsp.c
index 280d0413c6..f9aa6e326d 100644
--- a/hw/char/diva-gsp.c
+++ b/hw/char/diva-gsp.c
@@ -62,8 +62,8 @@ static void diva_pci_exit(PCIDevice *dev)
 
     for (i = 0; i < pci->ports; i++) {
         s = pci->state + i;
-        qdev_unrealize(DEVICE(s));
         memory_region_del_subregion(&pci->membar, &s->io);
+        qdev_unrealize(DEVICE(s));
         g_free(pci->name[i]);
     }
     qemu_free_irqs(pci->irqs, pci->ports);
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 17796b93dd..7782452018 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -56,8 +56,8 @@ static void multi_serial_pci_exit(PCIDevice *dev)
 
     for (i = 0; i < pci->ports; i++) {
         s = pci->state + i;
-        qdev_unrealize(DEVICE(s));
         memory_region_del_subregion(&pci->iobar, &s->io);
+        qdev_unrealize(DEVICE(s));
         g_free(pci->name[i]);
     }
 }
-- 
2.53.0


