Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B1606A31B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NN1Re/nP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLSkS-0008U9-RT; Mon, 26 Oct 2026 18:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFu-0001KU-N1
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:25 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFt-00077E-9v
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:22 -0400
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-91b8b456dbeso40525906d6.2
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793050160; x=1793654960; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I1OobZ+xS7ALgcpE3A652Wgd0tsqJvBFRpt8TtqypKE=;
 b=NN1Re/nP7VQSlJ42fpR/w2xTl21ygX3DhVj2UdFR+kUfYGdCYEP3n1TlfkBfpBkbsV
 UvA3CjW6nNPvd8vZRpAMiyJEZo919rhjtNf857mSZWvWM/ZG+L0Srh0ML88IserdtCNg
 DWSolBxuLkJFx7f+vYjkYZMGeAw4ye5QMUO2VQ6ll702/WmR9gtoQjQ8Eq8jI4snusq3
 GYYSfCRWCo3hWc8+g/llUgzPzTplVBb9sRCDtViSAP+oy/JOOdMjWSzo5ls5wTaa4eLE
 k5mHDByZbGmKMawebaBhX81Hc36oRF/aM3KiZ+l8ihqyS7iONM1xyRNGYH7xM6c3YN0g
 Q7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793050160; x=1793654960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=I1OobZ+xS7ALgcpE3A652Wgd0tsqJvBFRpt8TtqypKE=;
 b=vgBRu3CR/2KX/gXO6n4KWyexxyWcvkiD9DiNj7P1rOMsFUZ92bMwhdRMgCErXuKjnp
 fOGkwmsQ8N5fZE24y7kHIroQjodDEwSDZG9x1R009iLT9cLZioBnWTk2cl8scje5wEt1
 kG50A7lHjG4B91v44nxCwQJHBa3dm74VXjqjhLc1zmeOteELvy509Zr2G+G2S/7RuCx5
 SGAsowLmorOxNlV3gH3zcnnJ7BTxKDv1c229edR27GVsjQ74eHBFFHrGPGBKJJXCpgvX
 2cCD8g7vu37mzTtTXTGPxwvX/Dgk2ohqaUR9l+l4Q9uislRDurd/AX7iJJKcXP4tRDic
 cV0A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzllpL72EUaWiDLh5X8gFy5lSxHjE3gzxSuKMlTE4aDOPrL1G/ux+mtbDNNhM9+Rk83+Xhnh7/+eQ==@nongnu.org
X-Gm-Message-State: AFq9FYKlR4ayYLZOrJE1Cx6jHOfqtNRlzZkwIkT7Nm1iwTTG3x3+tRzo
 EofQiyNaENY9OA+PfGYEkrkDScNSjNOqoTsmcB+71FVX/XT5zJiiDGL5oKi/f82cZyk=
X-Gm-Gg: AYBFou0QcKck0liD+EZ2bRArP295QBTQIWp1jbFOwkkq4gp5S/BT2Ui0HkOWGZF/zW+
 I4q4rY9rp+7Kd/eBXhvd53iuBhTFohax2d9nlilRMCV8tLltuCXRVOfsInDGlt7OkPaC0D9Tgpz
 g8OPYoTdw92SzoTi3n1h6HLSrMDm9KC5SvqU8tX9n+/inIZr5S5uLHZiu/Nol8TJ1vUn1bbggEF
 q6d0h69IlzvtzMnBK6uKAwnVMxL1kMuo3VbeBPE8FFItwEGh6G4tRtMCj3TXREOwqpjCgQFQrBO
 JwT65xS6eslT8Cgn07S6z0yK4C1V3zOz9gi0YiHg4TzP5P5p4+P6Pdru2YeJDiRR2hq2dqyTKM9
 8l5+TKkxbLl5MdFeWLVM2ipzwW7Xi4jQ3smlV1wq5K1WM7JtqC9z/9D3iB4v13jC1yX8URAT5Gi
 WpF92Hu7MqRJXETwO6mdew1cn16/t4wpDovKP4jEGz0Bq643eQ6QqoVK82ZbJqaPWhlPGMB+aui
 iTToeFe+yVRs3a7fs+KBUFa00k6D3jqpHDczFKarLORMBRmn/TotIjoOnL7yUCuQvu+xj4u0QzM
 KJ/seE/JRjJaGKU=
X-Received: by 2002:a05:6214:2627:b0:91b:5d3a:4fcc with SMTP id
 6a1803df08f44-91c48ee12f0mr141160706d6.57.1793050159914; 
 Mon, 26 Oct 2026 14:29:19 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm85206376d6.29.2026.10.26.14.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:29:19 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 00:28:38 +0300
Subject: [PATCH 2/6] hw/i2c/aspeed: fix CMD register reading
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v1-2-076cdde514f8@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>, 
 "Timur Maksimov gessingate"@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793050151; l=1201;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=YQ3mnGzbacwGUPWollDDyPAx9v91x21KBbyZP9a/PrU=;
 b=ygmd8aljktQA6aZj5PWMsAJpdGd4oDvrYLEt1YnxzAzabQHlbhCtimFJejKlNamdPocQUa+B+
 /3bLRYCTHS0CyONMlWLbo9nc27MuBHIRO3fENeYbq4yFhmgvEVAJD5k
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=gessingate@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Oct 2026 18:00:54 -0400
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

The I2CD_CMD and I2CM_CMD registers now return a valid value.

Fixes: c2c5beec42bf ("hw/i2c/aspeed_i2c: Fix out-of-bounds read in I2C MMIO handlers")

Signed-off-by: Timur Maksimov gessingate@gmail.com
---
 hw/i2c/aspeed_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 0bc4bb6fbe..136d4eb859 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -108,6 +108,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
         value = bus->regs[offset / sizeof(*bus->regs)];
         break;
     case A_I2CD_CMD:
+        value = bus->regs[offset / sizeof(*bus->regs)];
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
     case A_I2CD_DMA_ADDR:
@@ -167,6 +168,7 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
         value = extract64(bus->dma_dram_offset, 0, 32);
         break;
     case A_I2CM_CMD:
+        value = bus->regs[offset / sizeof(*bus->regs)];
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
     case A_I2CM_DMA_TX_ADDR_HI:

-- 
2.53.0


