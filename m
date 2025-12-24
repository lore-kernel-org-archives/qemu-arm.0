Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B36E75453
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 13:47:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPD8-0006Jy-Da; Wed, 24 Dec 2025 08:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPD3-0006Go-M2
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPD1-0003i0-Ey
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so3048393f8f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584041; x=1767188841; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYWAkKrgLGKLEJzBNF2mvdemi8iXnGeEWzBQwxd6OM4=;
 b=qe4MMcACgyp19BAGesYEO1eojGdxgZqAA283DX/gzrLy95CU/DyisRd60j7HIIhAUh
 vfbcqhm9uTNlcPSWkMfW9mce7z1wM05fr8T7NGmmtfuJokVXx2LK/dsSBxe2RZ0KWb3v
 tbv0h9PsRNw0Msop40aSzTQbQ0Bv5qblM2nfLPiyXd68OUyq0gKey1ELEVIvXDeJIyhM
 8e5+OLdrRpgTZ8Ngt/Wb7mfRRIGfN3PXYTxDoKrCxqOr6LpXchSLa5nxb55LSqedeCTa
 cN7XYMcWjDvV05pv9IvtdvY6eUQlQE48bil3Ku30jb6NOl8qszu6pGP3AQARybZlXFVN
 w3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584041; x=1767188841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wYWAkKrgLGKLEJzBNF2mvdemi8iXnGeEWzBQwxd6OM4=;
 b=mtoh64zNysArcu0OzdOc/7HT99o8rctCalDRwNjHNFLjZYr5OqSUjx6gR5rELNw+vF
 TprO0OaDjHyeJA/E+hofmQLkjOa1bgfpdjZFHqALSlynIL69SIJCUP50i45F33y/Cdgy
 beS+PIKfCZdjZAgVhjy8H3larh/YXYzVPyzUPtP+tFLhz8j4rByvrG3lnbUzUtUDtSAb
 Utx1ukicVg0xL2ovA9rrl1EaA5IBFV7bw1aj+M3hFfQ1MsRObM6x7XiQ/L5gTsb9HpDi
 aRu+UW8eZOYnwDp5VtKtUKsi8NNi3/UZftU4jlbXeRDXDNpKv8IAzJK1U2nRRA7bVTq+
 3S7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt9NZnxQ1k3iUEmd1tdJdnWlctBz/o/iIsXoeTXct3nUIBWpZbPsRrIUWZe4ZbSayL8GFfUINteQ==@nongnu.org
X-Gm-Message-State: AOJu0YzKuxvqtAB+nA+COn4giOk5N+fw4LFCmsYhCZg/ZbjU+GOlAsqt
 898PYqxgwh6Los4KbjUvFe8fyRCZbmdrn3vi4t2bjbCvnaReN8knwPhZqed0CVnJyY4=
X-Gm-Gg: AY/fxX7ILT3f3k8lFxPItTgQgDjvLp3gQ43MTjwhTSS9zDTfKwAeVvl6uZUChqiK3wT
 SWOaYFWfq+sADCsVhJ7FMgpnUjP3Dajx0y/GiONwAhV/kATEBqzkIVWlybP9L0rpQeBkALJGm5s
 f+C+pHBtj8qqK1O8ADQD2GxR+orny7BhLNTviwlt6HLZuHOcdtGVLh/0q3jaThxM2LF1MxRGubT
 tg57HnTtpt+jp2c5VKuoRC4VvQaRF3tHjYwS6wemGMxMimzuaOw5XAVFjZHSXcNeo65kQI1hyN2
 svoxxtqaGR1P6D6x+Grmg3KiZCRVzqborscSmUZcCF0R2aDgRDw/dRc7hJBRAqCPdwV78siBVko
 Jdmhr+OgNvqYzcj5e5BT7mF1iJhAjrLp+J1VDsWcs6AVbZMhTGWh61voxE5V4G1cADfGgZt85yF
 U0zn7BbKEv7Z/c7n0o7lCoZhj7yZl2V6QhCCg8wc6otlV7zL6iZXEaeb1LTRAe
X-Google-Smtp-Source: AGHT+IGpRKcg+SvCUKQRGP5OhocSibsnsK6aqxmEiszVTN8Sq1AhPQpiR+QXZPhejGYSZFJevKjHgg==
X-Received: by 2002:a05:6000:2305:b0:431:316:920a with SMTP id
 ffacd0b85a97d-4324e4c1519mr17318370f8f.8.1766584041532; 
 Wed, 24 Dec 2025 05:47:21 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm33933748f8f.40.2025.12.24.05.47.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/8] hw/misc/pvpanic: Expose MMIO interface as little-endian
Date: Wed, 24 Dec 2025 14:46:40 +0100
Message-ID: <20251224134644.85582-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Make the PVPanic MMIO interface behave like the ISA and PCI
variants: access it using little endianness.

Fixes: a89607c4d0e ("hw/misc/pvpanic: Add MMIO interface")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/pvpanic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index c83247c4087..3e60b226e18 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -62,6 +62,7 @@ static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
 }
 
 static const MemoryRegionOps pvpanic_ops = {
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .read = pvpanic_read,
     .write = pvpanic_write,
     .impl = {
-- 
2.52.0


