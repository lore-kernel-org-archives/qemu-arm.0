Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EE1CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 12:37:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDMTw-0005kz-45; Mon, 27 Oct 2025 08:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMTr-0005jo-5z
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMTm-0006Mw-QX
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3108670f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761568655; x=1762173455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GoeOKyftJ5MLGQxZGLLBGt1lpVhTU2P8wL0zlmwVEXI=;
 b=X2l/OGQJdJIXtzzwx3tyu5WVWYaVhiF00Nrj1P/MZAwCjCbF6yHzUWR7sdPG048g7O
 fodL3L4Lp0MT885CUCQIg9OYn0OdzVQh9q7bsg/b4MRQPoLarLZwfFwmd0FR7FOrXla4
 KAINNnMDomJ7PMKy/FfOIgeMu9Yz85y8yqXwgehPvv2/kfvJMngBVtFiYK2/UPNCccyo
 EtmIUP2q9DPZQEUTGJpitelJzZs1EI/ltCu3H9GHYnarG1XT9gWDRBXSPug/XVpJM7um
 Q+IqfpYI+Xr1bSprhzu3HS6hivjGFirJXG3nxnGp/2U/JbKUZvATsk3VqwZruxNSWXcL
 bYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568655; x=1762173455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GoeOKyftJ5MLGQxZGLLBGt1lpVhTU2P8wL0zlmwVEXI=;
 b=ZGg5HVQYjvtH5IDZa0M47jPRHPCygzeYTh9dQWmby9rqO3Z/cg1KPN+euE7siOjKaD
 nXRlpPmyvhfyEWQTdCpeobL0Xbxt7vPiW3rS5PWsORayOv9D38a6zw5Pfufjuii5ijrp
 tmmmJ3Zu6ZWU01Pr8vvpFIFQo6Eub1IIzm6PAAaiDoofN9LcLZexydsIvtgn/M8eRpYt
 GZCtw8DMfGjLfzZaZvXzeLRAcMhIeOA0VrccoRqt/4u92yevMsAinoFvsf4mDozu6VJX
 3fPs1RMdvlE4brrzWB5QPlxG0hSyewXAebFzsZ/ep43ehOkWjO4ev57LO3nrS2yH3HyW
 T2tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYaw6DjeWZn7Don4HJc3A8kYtqmyhTrqLs6mnSCaiDP5Qbu7IFUpUBeoICb3rbi8nitizve1MDZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAdVcBKqHgJhQ8/mthDanPqZfHWyoeP9D7+QtjCHCEwoRe4+O+
 83yW8leoGLQiRtxDho9219LFAC6tT1U3VaTJSL5k4ahU0k7LWNOOgL37UHx10CgBFlA=
X-Gm-Gg: ASbGncuXBmakLHiklBnh1VwNdiy7gJkEiHpgIudV7bxBmaufs23exz0heBoA9MIjfU8
 xxqCxW/cz/QqTw+HaKFpg1dkMKzal5iti4W5rMaeTvXAglr/xPVb/rkcicbCkRDCjUuJqA1KYqC
 pAPoNtQrzsshzcpv8lz+zmPWNju9wuY9XQHOt0ljGghXRIgXfzWM8DYInnx5d9p5mGwVFFdt2E9
 uGQ6nKQZ/xeZxtAxw7wKX3q7QbtXXSnB+q7QKTRCVmlyKT+5zesXuAkoIyHF0GGT3dw7b+GZKLK
 Zj9mYBjXqbC0XtweTjLIhqLbo3WeRu6K2O2eHrwc2MOBPRwArdfxJowG6NN5x3sj+pEBvGhCpDd
 k9xseYky/d/ppXop/uag+v4pwU5vUt4ZxVHsJKheMEhN5vpbjubXFud8nM+o8Wq34YWUe3v5b/H
 H/zHFyPzdKJ5QS6gDTbHG3YDX/jckDSDYfrPaLmKk7WuxpFmYOCQ==
X-Google-Smtp-Source: AGHT+IEPzrIF85HI9BKZoZtnDex6BR5cCOZk8RX2NkrGGjPjR54GiLIVjSu74xAOEiV5Phys85ewCw==
X-Received: by 2002:a05:6000:186a:b0:3ec:db13:89e with SMTP id
 ffacd0b85a97d-42704d1441cmr23640393f8f.7.1761568654607; 
 Mon, 27 Oct 2025 05:37:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7ce1sm13908142f8f.0.2025.10.27.05.37.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 05:37:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Peter Xu <peterx@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 4/6] hw/pci-host/aspeed: Log unassigned MMIO accesses with
 unassigned_mem_ops
Date: Mon, 27 Oct 2025 13:36:41 +0100
Message-ID: <20251027123644.63487-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027123644.63487-1-philmd@linaro.org>
References: <20251027123644.63487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Replace unassigned_io_ops -> unassigned_mem_ops to log
accesses as MMIO ones.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/aspeed_pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/aspeed_pcie.c b/hw/pci-host/aspeed_pcie.c
index 2499d3fe680..0b32f217e91 100644
--- a/hw/pci-host/aspeed_pcie.c
+++ b/hw/pci-host/aspeed_pcie.c
@@ -197,7 +197,7 @@ static void aspeed_pcie_rc_realize(DeviceState *dev, Error **errp)
     memory_region_init(&rc->io, OBJECT(rc), "io", 0x10000);
 
     mmio_window_name = g_strdup_printf("pcie.%d.mmio_window", cfg->id);
-    memory_region_init_io(&rc->mmio_window, OBJECT(rc), &unassigned_io_ops,
+    memory_region_init_io(&rc->mmio_window, OBJECT(rc), &unassigned_mem_ops,
                           OBJECT(rc), mmio_window_name, UINT64_MAX);
     ioport_window_name = g_strdup_printf("pcie.%d.ioport_window", cfg->id);
     memory_region_init_io(&rc->io_window, OBJECT(rc), &unassigned_io_ops,
-- 
2.51.0


