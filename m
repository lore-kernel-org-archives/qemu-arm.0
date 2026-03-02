Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C0BEB363C
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:03:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBMD-0000P7-1X; Mon, 02 Mar 2026 17:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMB-0000Nm-37
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM9-00018o-FW
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b5d78592so1421805f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488992; x=1773093792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONRooDxE+SOFwVUb1D4HBBaOVoswy7bX7wry9VAuImw=;
 b=dWTL6MSgzB94pgB6s1IrxdjIh3jPjmkvjsKS3dOoI0xG2RSn6tDMD1gVWNlVwxNDiq
 mMrb5m+bKJ2BYOgnEbRVmcyEnWpmT9a9rplB2Q/+528zcSC2npOjbKO9Ch7u0L69+DxH
 2ksUVSgJqZyyjD5uqPrpZxwA6VxwxV67gN2aqz+Kki0i9+X8Udh7i12Ho4clFIj0Y4xM
 ibIhXkXf1EBoOgu7rHQRcqRvqCU7TVaDjkMIFB7McwX1Kut/5HSIZOc2eXDnlcP2j843
 m13Kbs8ou7TGpc7QBsDuXC8KuqPZGZRPp3O9lIA21oVipMals+BwC6WCQP0yOpdtAGUQ
 B6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488992; x=1773093792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ONRooDxE+SOFwVUb1D4HBBaOVoswy7bX7wry9VAuImw=;
 b=dhZ5TCWkFS5CzUtaBnr6jyvhe1Lxy6dED/0uQ4S/Usynf3TlBt6M9vLhRhB1nDlyFX
 oRi2Nij6iLd8AnzORSqBl3WrXbWcLrXuM1TRBADHvg5+cwM4800bmGa6iAZs0u6RdlML
 5OM84xoXMVoaLjkePK2GiWQUuQI3SSiogJC2aqa9gC5Yom1PYQgSA6uHmx0RKPxMAH7c
 HbNXZYigSwUHPO2FODt/dbhHDiVx8LlILsk04Y0I12P1eZiVswiH7Mug+ks6Zo4ynMcr
 jmlr7fKC4pmfVcvFrPOjrtJo8XeBHHwxpLC0XBcTuILcgfEuCC8uzllhnx5nnlhYRVfa
 s6bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+orb/Yz0yhatNgxgM9alkt80h2WU9K3NaxFugC68Z8q/XnnAfGUT2qMvqaVbU+7/gSlF25jsVkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzxq7Rfzd8FjCaAbUm+0w4P/BRcUpkuv03XE+9AxXIJN5SeJAGu
 yKuH9wYYvWPRqD1IjFrEZVmiWxOoqQTgHQtvvAcOlgrLmfcwkYWAhnTs
X-Gm-Gg: ATEYQzwGINHQLOI16r10gxkkOlCwYu+1in3mOgKDllTGZNq7h6Gzpw6y451lCOrXePm
 EDxmLdfWE9wmAr+8lt5NWLYKgbna2O/Ehl2dPSzWrXMDPcXC3fd2HlvVo2PPfgzl1j6CqRCQN12
 +T2M/Epvq7UzXDwBSlFHvKFkwHQllbJ0wfqfShcrjfTokDI95HxsRpaL5uTeU4JW/vEBjaNbj/d
 lGj6Cfdopo0GrsL8vgtB0gQS9KreR9oHHLQcnrSAjLkCfYSvwauiYngYIXeJ5XbMRFd9nqNV3Dr
 5S68fUwrPJ1uMBX3lwywvp0d2dydiv0O+n3eoDpVVnZgQLmZbpMBrdFGeWtuPWhLRG92cfRVaa3
 uwwQzM9ullDaCYcBmeGY89P/Y9e7DDDMmaemF5EpOOpLyLJ8bRnGxNmLmMp3KRjd0nECec4S51e
 YT3t5xi9aOP+eNnyVmIetkSveffaePMNGPJI/y/NYvgOnu8DIdzIj79AWLrNfS9OQxs3W+QVDbF
 JPO1z7VIe68peXIAY/YkBI8uAjV8Rmcuu/J2JvhW+pxNvc=
X-Received: by 2002:a5d:5d0d:0:b0:437:771b:26b with SMTP id
 ffacd0b85a97d-4399ddfc43cmr25415996f8f.26.1772488991958; 
 Mon, 02 Mar 2026 14:03:11 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/12] hw/char/serial: Remove redundant reset
Date: Mon,  2 Mar 2026 23:02:49 +0100
Message-ID: <20260302220254.1166849-8-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There is no need to invoke the reset method in realize since the reset
framework will do so anyway before the machine starts.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/serial.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 485b98f03f..0f3469a1e8 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -934,7 +934,6 @@ static void serial_realize(DeviceState *dev, Error **errp)
                              serial_event, serial_be_change, s, NULL, true);
     fifo8_create(&s->recv_fifo, UART_FIFO_LENGTH);
     fifo8_create(&s->xmit_fifo, UART_FIFO_LENGTH);
-    serial_reset(s);
 }
 
 static void serial_unrealize(DeviceState *dev)
-- 
2.53.0


