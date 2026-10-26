Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE607606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=anrl/Nx9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLSkV-0008UM-2j; Mon, 26 Oct 2026 18:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSG2-0001MI-Ra
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:30 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSG1-00078X-DI
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:30 -0400
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-917aca1aee5so36413986d6.2
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793050168; x=1793654968; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QTJmCEs75hsCC/xgwh0xtvT/f1HQog75na/9v6m220g=;
 b=anrl/Nx9sWvEzE9CwwWs+Nq5g2Y8EsHFxwZbIpmkMWWIvue+PjQyPlefBdYsQWIcS3
 wNKjtX1Z24Fw5aOLxawmpq3/vv6meyV2Gfeg5K6tbVu5VtQVwk4hazXzbqh1CaNDcpE3
 oDgBey/RKauCLPq/qa73hJWwXmi/qCkAqA/mucgKlwsGJ8GBxXa+1REbBhE5Q7rQ2rW+
 Xa4+BJz5UWLBxRe3CvmJJ/zTDaTc3cRVAQRIw3Xb+xi0tUdTRXXnZV4DA1G377iXMnB1
 SqMOwbq1jLqCcx00aOJifP7Q+Jfqn7YwgVAdZpw1leNAV97GUrH8GLho8reVguMzm7tK
 wmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793050168; x=1793654968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QTJmCEs75hsCC/xgwh0xtvT/f1HQog75na/9v6m220g=;
 b=oISNR17tLR+FSY8zCA0StTy1dlYip4F02GTJGd2oeX5/G83dSOnDKcsi16x8zhurHV
 CVTqEQh2FNMHGmTwzyr4EWiRrCelu7nVJxJUOJtW9/2ekevSq1mDQci5ugufhDGyNVMp
 l9MYCk14Tr1tHTd3ZLz+V1mY/H1uk39NQHhmsRxI0e5sAWo2izMulpaI5ZFUKHBq6KE3
 1sMkQrQggwJl1rf2/W2R2w+4Eua252xCulCtRqeVzDWl5O48VTLL9gavb7yxNG754geu
 Ne0IPDU/1bjGNSbSd4izaRKO7HgDMjpttjLk6DHZXKTEwovK9Zj3tB9HTTNZvAUz+fbl
 NLyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5ZQYJ+sF0zt16WNdo8q/m9Df6lVEOkw35KNEgIJ6V0Nt1xt0y8uhBzub9riGy/QJzYfxMr6PsjQ==@nongnu.org
X-Gm-Message-State: AFq9FYLWytmkBtZ0C+YP87YVNIUtGJlPdPmx0MbYuBa6DE4bWKn7+lCx
 Jidtm/AMefZuGCOX5MHd5gu/IEXu8N/6kOiqlsHPXBtBmuIkTcL+fFmJntUlYRHRebg=
X-Gm-Gg: AYBFou1IiNy+YKS6o0sI72yYr7YOx53HExYX8q6N2tEOSPxvJ/UcTtWE5Dgv67xY/WQ
 MMYEVXKAM+GU/svZUevzzaCJ1xnQoXzqT6bqU78ROVC03jIe+k2JlgM52RQJztjW6EwNo4XDRUM
 dH3/eS1LkVcAlpV/hYjGdhVIMVGOkVPnoCHbYKoohfkEoQw1j1qkvnZL7W/OtOaDrQOgUWXF6lI
 wG7QYxVc3tIP8NAY5Kq/flE8VLO2x4tpgEAFei/UY5GszwKwhoRZi1hnrjiG7Yjta4wI+NhEPH+
 pdDFi3jt70TNh6cDpDmOsCGgWN1Z6zj6q971jnup5T90HCOMF8stMInTyExRoRQLSRV8H2oGZt3
 16MANuCMmPjRsp/MIsHMhkl1GjY7YuXsrrRU4qZDU2HWs603Vyia8yhg8dlVW9VARa5X4AcL11f
 C5x6vvemgoet/a/9C3xvIMRaSpuoOOr2+pH6aCYPWU9l+tWNqt6Gv7NTnq08H1AiwQoIml8/X/b
 nBU92dmPZeAypGqV7v4KPVqvg9aMSPvNkTjxxKPoZDJ9dlcgnd+2De6SnNdZFs+mMtd+x5R5mxc
 B9CxHUp5FRwCWF1+T9gp6D3dAdVzoZKsJ4OS
X-Received: by 2002:a05:620a:199b:b0:93e:c12c:4412 with SMTP id
 af79cd13be357-940ef9bc1aemr1237547785a.78.1793050168460; 
 Mon, 26 Oct 2026 14:29:28 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm85206376d6.29.2026.10.26.14.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:29:28 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Date: Tue, 27 Oct 2026 00:28:41 +0300
Subject: [PATCH 5/6] hw/i2c/aspeed: fix BUSY status reading in new register
 mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v1-5-076cdde514f8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793050151; l=1149;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=c+ZSrMl1JVe0+8iZU9hqDsp3KdFpWAzY5ODu1DolutA=;
 b=j90AzPPVc3Fanj3i/DR/3MLIpEENwb7+N8b5V9o8mXji037/sw8mgZ899fRtrWGZUYSy1Is6Z
 V89ZyiYcaoVCuopHfx+JQlH95RKn4ptMYpFDHWIDAaK1vbaZKvZ25tg
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=gessingate@gmail.com; helo=mail-qv1-xf33.google.com
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

The BUSY status is moved to I2CC_MS_TXRX_BYTE_BUF register instead of I2CM_CMD in new register mode.

Signed-off-by: Timur Maksimov gessingate@gmail.com
---
 hw/i2c/aspeed_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 376e113e58..a2b4c8b576 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -147,7 +147,7 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CC_POOL_CTRL:
     case A_I2CM_INTR_CTRL:
     case A_I2CM_INTR_STS:
-    case A_I2CC_MS_TXRX_BYTE_BUF:
+    case A_I2CM_CMD:
     case A_I2CM_DMA_LEN:
     case A_I2CM_DMA_TX_ADDR:
     case A_I2CM_DMA_RX_ADDR:
@@ -167,7 +167,7 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CC_DMA_ADDR:
         value = extract64(bus->dma_dram_offset, 0, 32);
         break;
-    case A_I2CM_CMD:
+    case A_I2CC_MS_TXRX_BYTE_BUF:
         value = bus->regs[offset / sizeof(*bus->regs)];
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;

-- 
2.53.0


