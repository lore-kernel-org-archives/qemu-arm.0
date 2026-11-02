Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07621606A326
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PoGWlV+t
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNp2o-0000Eu-Sr; Mon, 02 Nov 2026 05:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNp2d-0000Cp-FB
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:13:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNp2Z-0005Sp-U6
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:13:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so2636625f8f.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793614401; x=1794219201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aWwCyBtB9uV+fA+YGZ54qKoI3L3xW4hyyTN2yprS9nA=;
 b=PoGWlV+t3hVkJS1U5+x3zIeqWoo9JqnGAn0zrudqRl/m+W1VfGPAEJeTUPwLrIa3FN
 cKEDXawZx6PqPLvrG9x5n/ZJ7diScHDOfUeYnGdp3foS/NdfMCQZ3vdRt5BpBi0tJAkK
 wyojDmnnlJgVZFymUVmfKIFWF2n67H0s2/bIFxKJFV3Eh5IW9O4bNs8n3B91JasXJy/3
 W8vLPfz6R9YQ1MHiYS2lspI4oORLXLIwD81kEbBmRF7md5E+4w8Ipsve5lwBeMQDwqNB
 szTU1gMeBa2QmtNpvuwiREE7eIcfGedThJ5L5ttudjwUtLPIf3b2ekj3GtRFyGJJHtn+
 jbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793614401; x=1794219201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aWwCyBtB9uV+fA+YGZ54qKoI3L3xW4hyyTN2yprS9nA=;
 b=qj6iGQQdH5eGGGgn9D12279o7v6Mj3knxVDE35gx1zay+K6B1Gzec11cXBdYMvk1B3
 kSDbEC8wKbkwtD7jIxMC0380Fsa6YrlxuoNBWX2wsUQutHw2Upv9c44jVb+bj20nBzj4
 r6xY2up3Io1evzj5exUvj7Lw9ngKbcdlwnY382H9GKZoWuXMp1kf3iGOpN6K0j6jyvYh
 idiqY8vEwRXzdjBXsuOpSTnbacoNZ/h98v7MWd0C1Jn8eX7Ezyi8L1psjTziP4Lx8w42
 fN/yz9SvimAVqG8EVUuRPZ/UkUbALXhrveX5Huhl1rmk/kQkv/Wgg2yJVLUFpRNOyzA+
 dNjw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxp4QjD3nyQLE7kReUb80Stkll4gxmGdVIj35iqjG9/qiljK7kdBwnPGhlgCBbtX+wIfEbEY4rJJw==@nongnu.org
X-Gm-Message-State: APuU4Z8dt21lp1Arouf2YVVcMqqWMqNNY6Be+HpislgPYebSWsLXznwW
 5ZIxkfld83nbyWzzB+GhgOQJwNcHtqqpKO6KyqNPyyCkxjOUw5E6LPcJ
X-Gm-Gg: AYBFou33J+tmQxtZhC5tTfcvRK08pEqHqbH+WnEwZZ+J5mNLYg9dbwfASxevWbpt5HF
 CofIrmuhzsoMV9KGVuFoq0RSdIynHE/ifUR3P7vNIQPUhPpKNfKJp2COEYqCO0lk5EZaYEYna3D
 zhlYrT3kYc4ESACQXHhU2pdXEPDfd1GtknTXUm1lWvYqj18kbdHtL0xVJN3l9Iw3rgj+zzqKRU8
 mW1sVB/ZYEnzKxyLiaAVogYbX3aZGPP76I83mclR1oVOorcLSrJT3YWFgb51E7x2srR+UUMNs9v
 MwiJ0RL0WVJvA/EBWsb3AmlIt+h77n1OAXkJFvWNlOGkBqGcnDmPmJjPptuHHkSXf0iWvNft2Rp
 CRWUqpB+42ErnyZTiYj1NJLN9dRIHs/uZO+Z5/TJOWw31Z8yQ9lchs03/ZrvdY91o4k0OdDfX3u
 pi1f5MIj396HmlwfZ+pICdKhPJGkVLNJTICvrl1DOFdrrj4thnKzjiVJdi2ehdU//c6NVVu3+IX
 FC2KdR211QZ62joNJIuW7FEPupXPg/RkZzfAnAz7gjZ3oZ4jmMatj7a/qU/mEQKHagQcGv5BAIi
 gQcPdgfAD3XPVPDFaAGZ4ZMiQWZY7/dak/aXH6zuVyUxR9q8FsejqbP1nNsfIeR7523QspT4A2N
 FXA==
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id
 ffacd0b85a97d-48e6e3042d5mr21486005f8f.45.1793614401266; 
 Mon, 02 Nov 2026 02:13:21 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba53d7sm24478519f8f.53.2026.11.02.02.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:13:20 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me
Subject: [PATCH 1/5] MAINTAINERS: list the BCM283x qtests under Raspberry Pi
Date: Mon,  2 Nov 2026 11:13:19 +0100
Message-ID: <0deb097d24128afea6839a2d6e222c2cf33de45d.1793613972.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wr1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tests/qtest/bcm2835-dma-test.c, bcm2835-i2c-test.c and bcm2835-ic-test.c
test Raspberry Pi devices, but no MAINTAINERS section lists them, so
get_maintainer.pl names no one for a change to them. Add them, and the
BCM283x qtests that follow, to the Raspberry Pi section.

Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b12ba90f2..fd08d80aba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1046,6 +1046,7 @@ F: include/hw/*/bcm283*
 F: docs/system/arm/raspi.rst
 F: tests/functional/arm/test_raspi2.py
 F: tests/functional/aarch64/test_raspi*.py
+F: tests/qtest/bcm283*-test.c
 
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.56.0


