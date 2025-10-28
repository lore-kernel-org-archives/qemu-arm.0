Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6758DCCF9EA
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:06:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDehT-00089W-6F; Tue, 28 Oct 2025 04:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDehM-0007yq-3J
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:04:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDehJ-0000v4-5b
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:04:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so13202345e9.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638690; x=1762243490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=CVl0e+pTF5yKF4TGl+V9VaqqCKNEbJbVZFw9skdSMMJ8fgcRkhbFmgKDsFxkWplSmv
 IUtcN9UJae5zBg62hxrRpkWUYCk2ADvY9qhYRHjvhOBzOi3m9XX3mHvf49DJ2rcB57R+
 4ykP2D42ko73FKCL7OGa1fN1ltmhecPdgYzkHfaPQJddk1Ebc+9+AAvR7MUKAoPrxfDn
 QgEmSwJ94QHGUi5VpcAkz9Nc/QpMguT/LJVOG+tE0ZSoAGLyocWDw725XwIIOCXMHt6b
 5GFWNqZiWHS9Xi4sv27IVT0vuINxDXgznlyfo4olG7XgH5OL1+jrkH5S0wkHLPiayfX6
 M5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638690; x=1762243490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=KVA7b/Fopei4HXhHF1h2tg8Mi0VJzorlc4uE0NSJuieDZwB1kiUX+FpILVQHIGm+NK
 8RougDS4moPF94d7M4bob/pERjecZTkPpg1hChcZlesAq6FUhhxT3X8Kx2aupOIq+Js6
 ki01E1dtroDz5DF8POP+mYwJW9Oayjaff8TRfPTSHgcCviZJaj2ysx/b16cQHF/Wl0qE
 n59YdoRSUTcjsfo2XvKvDkFge1wF3FZyScIcb3JNc17LGSNgWv2vbPe4/emCXugRr0K8
 j3etrYyRatPoh2KV14DqDVEBFSN/pAQf4NuNY//Gc22Bmfmo41q2B2xRe5Vo5eddoYYE
 H9TQ==
X-Gm-Message-State: AOJu0YzUF2P3kChz3aLqBZkBtCrHA7LqonFT2ftkGJ3gSyeK7vFpdQRO
 aIozF+Npn91zaLIv+XXw66esUzk5lAqb9OP2HPaWt2eFewL8/yUc/8lSMaA1lf3EX0k=
X-Gm-Gg: ASbGncsLYRuLfnGgszwyRfTh0mkcGl/j85rzcES0CxnyxsO5zIY1B1JzRx4HJ0UfgvA
 6m8WO407vnFFr+Wy7f2VslV5YXt6NHQUGkb/M/lTSB5f8mrCIL0rEzbZatCTDB/5BPZDlHwLDkT
 SRrJ9HtojBYIEB6MBxKwZqGYvbYxQyoVNV5BQ+LGZaqx9yCElQGRbK84g39kdtYNVJvw3AUGqE8
 GuRhbE66yUNVS844UG8lngc01nOyQ5NWetFZHeZg9yiTg88xUg24BUgGlbVu5bi/VbxpSnieAtd
 x8HNX93HLlIZwpqhLO0ZVe9tC3hTvFwBkDe4EL3TnzVFTiJ0ysXEgBpCVV6VLIEp6Du5XmrIyyc
 TMCpe1mz4yL0blOe4uRzznqIoll5GfJilRRlsL/dRiQkRZhgrIxARIJV3a9ib+QiY37olt5Jaj2
 HstFdoSGX+a52XBa7QVgt6nNUEosLCv1Q9Pyzei0xAdFmnqcEKgaTVuTc=
X-Google-Smtp-Source: AGHT+IG3QDDR+Lrr+fbcwn1dwgH4NdC7JNF+0fC97Yvd0G9hDjhSV8LBvqRvsw+uaEZQ1JTHvTioDA==
X-Received: by 2002:a05:600c:3548:b0:46e:37af:f90e with SMTP id
 5b1f17b1804b1-47717df644fmr21641325e9.6.1761638689834; 
 Tue, 28 Oct 2025 01:04:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db80fsm18400849f8f.31.2025.10.28.01.04.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:04:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 5/7] hw/acpi/cxl: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 09:02:55 +0100
Message-ID: <20251028080258.23309-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 75d5b30bb8b..77c99dfb184 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -104,7 +104,7 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
 {
     PXBDev *pxb = PXB_DEV(cxl);
     SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl_host_bridge);
-    struct MemoryRegion *mr = sbd->mmio[0].memory;
+    MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
 
     /* Type */
     build_append_int_noprefix(table_data, 0, 1);
-- 
2.51.0


