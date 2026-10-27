Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63499606A31D
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FWH61wlM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLnDt-0002q4-Au; Tue, 27 Oct 2026 15:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDk-0002nW-W5
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLnDj-0004qY-EE
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 15:52:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so88666f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793130750; x=1793735550; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=njtkyiWLQ6dppKJ3LzrTtB5KAmfwTkfleOI184DxmGE=;
 b=FWH61wlMvOQbN5KECt07Wtn6k6STGYJTNRcCew5YE58nTnKiv2G4eCf0DKf+dmlyrI
 KVAAryIjvAV7rLDUJyLvflAOp7Rav2B3hn93N6Ttvb3jyfh94eP1Br0Qi9o+4F9BL2Wq
 TTuqxnulVjaFcllfTA9abPhp/UEK+8nmBG7rlxzWlpxgwp2nb1mFs9pwihBgGEijlmIX
 4WFuYBbNuYy9dLC1UwakQT7E1W75qJ+iM0iIQopS1asI2Q56+uUGWT4GMkAEAGUvEv0/
 YyXorh+s28/Xhog74If74zZRPDQQY9VdkSneV5wxdGQ92Ycti9547HjabmnlcfwMUHTQ
 e8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130750; x=1793735550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=njtkyiWLQ6dppKJ3LzrTtB5KAmfwTkfleOI184DxmGE=;
 b=1ijKH6YzvoKxnqMr3EDdK8GKDPgGBdpZ8yFjS5qpazznZTqnkEKc4yi9N+qk3I/clf
 /hHC1Je9GJ6yewDSRbjD2zkU/gfAC9M2uEJwbDjd6FAo7fU7gSTUyt1xCC8wn6PeAm8Y
 Po7le9ga9cBlx6IaJz/20qoUfeGndnLHY38Qk+4wTTWM/6O8sIsR3ADhSOsUBJ9KH8sj
 lP+UQp1v+saFzrvxJ4W2c2V1MJA3Py53Vc7exKGxg+mktNPKItl6MZN85EGNV4mlQ8RZ
 EzcMATUpCKHPxXO5zls14FVLD+PNZ08JzR4LcYBpkSdYcWKIvJIcMazSQiVOXkO13Knj
 TweQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByTqCcNxUYwl45kk1iOV/l1U9uFc7iUmGnzFvu9DJzyy713nQiVf3LWGJ0mdqFFZX/D7TRgp6Xl1g==@nongnu.org
X-Gm-Message-State: AFq9FYJe3qxzWFk5XSRXn2rk8s7Z5rle3bGsOeLjrDXC7DPTUGAV68Ll
 6ItCaO+ZiQn8jjN/eUfrOOl2StM7ntmhuHuM6cemF0ODAnEzGIOjhRyH
X-Gm-Gg: AYBFou2ZRfDoYBvvJhCYsi3JAx6uk8v3lSPXRbBEcEIkfeHgBRkM19RQqe4+Q+aGWom
 M/3z/ZVoVC2iNjG3mfyRqh5B6d+guVnI8t99mU57J3Eu/p6gavp3DD2u76WFwNE+3yY2Nv/Tu6v
 v/QLHvXeeyZstXtldRuLMxf+/pSx/1CNJiTfYhngGb9cNSXB+QpI7LR5JZFQ2aDhTzhcEtwSIY9
 cCPGhZD1kZzA1RgS+eZymMW/5gNFey4+/tZvKn8xoj/kPOTVZPjCR0ruzhRIAEC/nTLJh5UpZgc
 OumTUMmMi4FJeFeA99YXUhu/b19gWTvoZdgIK9q+rMA/okpkV27OoGLHF575+oHWjLyaN4UlHG5
 j+eVWOv0YDiGMlJv3Xodwy2dxWXJgbCbNo3tds1EunO1twGTvB7et3116xWqZEjco8f5rnHY0it
 LhLJQ4k3BCQgCKwBa3xf0bXsC9XdHBRhiub7JNjjXdokc8lPuW6V9cG1tdMzX+RztX8xn625vfc
 iiJg5xMx2nT0ZVjOWYE9sMCgpxAThCjbo+2K+MJZkXMmtAvu5kRwg2JX7NekReRPQofPwXFUDeR
 yBRqCTJC62/3FAA=
X-Received: by 2002:a05:6000:2413:b0:488:79d6:a4a6 with SMTP id
 ffacd0b85a97d-48e5d454f11mr993127f8f.8.1793130749827; 
 Tue, 27 Oct 2026 12:52:29 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb846sm24746368f8f.25.2026.10.27.12.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 12:52:29 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 22:50:44 +0300
Subject: [PATCH v2 3/6] hw/i2c/aspeed: fix I2CD_CMD register reading
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v2-3-07deed1dff60@gmail.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
In-Reply-To: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793130744; l=823;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=2cPhJrLg6jplL8sLpXBRy0TPHFV2wsBvRhXZ26zaQCA=;
 b=D/AkWMO1+SFsZ9o5e9uhWSGHB6DoyznDMBVzYYfsjdStl19RJjoVvUY7ppB0Cpvh2YpkoljEq
 TtoL1uXwNgtB9u8xkcreivSUYau7kMH/qjcT2UGECjPcL0DmjI92XRH
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=gessingate@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The I2CD_CMD register now returns a valid value in old register mode.

Fixes: c2c5beec42bf ("hw/i2c/aspeed_i2c: Fix out-of-bounds read in I2C MMIO handlers")
Signed-off-by: Timur Maksimov <gessingate@gmail.com>
---
 hw/i2c/aspeed_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index fb6d19c37b..ff6ef6d23a 100644
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

-- 
2.53.0


