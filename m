Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B873CCF9EB
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoGQ-0001AM-Uz; Tue, 28 Oct 2025 14:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoG5-0000S9-T1
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:17:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoFv-000280-HA
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:17:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so4175485f8f.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675431; x=1762280231; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogjIj2x0b+Ph1mDq8xs+aaEQIpc9IB/77pPj2JRToEQ=;
 b=snw85uAJ0YE12Hnho7O/S5L0PLEcMKwytIZn5Mv7H5AgMkUQ8A8zl9lMIovgIq20Td
 WPFLZHcNzvvlrumhXQJ/epBOW1Zl2p/QNONH7/ZQLw+j3SwUx5ty9/QDOrKnSRBiO6DW
 c1jFwx1YD3msirEoP/93Hb8kw0Wn6jXSDQQYNkHydwolFfjRluQl4eJUbWSzsgdai7qS
 Z/QyNlJguFbnZTCMSz2S5TNxIMU/rNtOR4PwoiaA5RKtMnXI5B8iwb+ritDjkcFasAb3
 XbdoyB4+A0MiKjpOIOfbSgQ5b12PPZYWW5nl7oaX8b3aniTGujmFb4jRhd8YT8uxRwb6
 ooWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675431; x=1762280231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogjIj2x0b+Ph1mDq8xs+aaEQIpc9IB/77pPj2JRToEQ=;
 b=CjxSLwqWyhNxXQYKpoywRQhk2DYp2uIaGcqD4k9C4iwys1w5JvNwU70QyBgmRM5In7
 vYDfRnW5LLsLTqc+CME354qts3wOQ1PFttjh8oVUxusmqFlt7uI2g8wYso/Z9TnVpz8k
 8fHg8ILegiCLRbrIxsgracogqRYimrijaI+aVgLFmvFbow+v+3yP3s5qpHINn2iNQ1Pu
 fHPSew6oCIrIixiR7V+VRlNgvLdH5xm1JDF/ulIGQZkFm10FiCkWeXIZTjMylGqOnsZv
 fxR3wNPn4GXcsBtZULwITu7weuVcE43VkXd6EIJClmw2ZcBwRhbiR+ZK+h6PC1pKDXbj
 A9sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Z9alep3jSsnzjN9xL7FZy8f/6T8+EPGzmjPOvwL6oh+LeKYeu+xFoL3r/FFonmLIYElY7hH+Ww==@nongnu.org
X-Gm-Message-State: AOJu0YypJeYHcfS8QnC0OL6kucDnk0D1mTyTFVTp2inXARxh/3vSEbxm
 8yYzIcE/4QEBWAJjksRDMnqG9Z9zVAnvh3RAji/DVQlr/y9rzt1O+8ldBlJm8i4uPkc=
X-Gm-Gg: ASbGncvCOoDboTwZ+9H+pDsetc+8rv6+x5KyXTO7eYG3Dx2UTUrz0Kmj1WHOB+bOPeA
 fauxGn0sjhHITUB73U5WbAhte4a0QzUqTttCvKuD91SbSK8nIKlIKxsXREEvZ0H5sIcstSQBMAk
 B0m+cQgx3oTKqoICh3Xmv7zGV7ixwdqqqwBO3YLcxO0xZOLrKfdq47sLiEqNmb3lFDhQiZArZcc
 8pX33mpUDJ3Wp2v7IdG6HT39hZsw6PWO2jVPvWEd9JJRODCBPzhYXM9ecFTZ3yxNKP350pi/BGP
 neaSbg9WdwZWzcSt6oTHG0FpM9kK8fjHyg0/UED3PMLZ6rRqKqcjMjUeDZd9lrii6vx1cNMt3s3
 bc6e+Vd3jespopi+pDCnDSnP0BZ0h7JWDzN03TxIRieraYQJEOesMI8F2eRpYWGxV0WxgMumJGo
 3K9vi3f94177+jdqkC9YcOgcJXdouqwjYlxD7Z8asLX+A03wr4vw==
X-Google-Smtp-Source: AGHT+IGZXkSBvcMPXbgnK+FlW/f44gMl6lxA9bRKWCpTYzA77U/IZTSLqjuTQCa2An7uq/TgPnrKyw==
X-Received: by 2002:a5d:5f84:0:b0:428:5674:7a13 with SMTP id
 ffacd0b85a97d-429aefbbd87mr4104f8f.36.1761675431530; 
 Tue, 28 Oct 2025 11:17:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm22503931f8f.44.2025.10.28.11.17.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:17:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v3 04/25] hw/acpi/cxl: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:38 +0100
Message-ID: <20251028181300.41475-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

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


