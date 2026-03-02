Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31DEB363C
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBM3-0000HQ-Bu; Mon, 02 Mar 2026 17:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM2-0000HH-5V
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM0-00016H-JD
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so3620800f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488982; x=1773093782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/HU6l5SGmiuo2Bv+aUhF8Src+lTw7G1vc2sv+D9xvQ=;
 b=HJrIf2ApKyPPgC8MhzG42DzRBUpWVwiu0gr0ZcPT+6hjK6d9z/jG0q+ml2mTQMnZ4f
 Zz1sHIQPYXGpfZpFlvBVvZGWA3xknNQby9812jp1OXqIWkmhhYVI5tHDMmRmmOqFwipz
 O1FlCD5J5pPUB9e65fsZevwpDQrUA/0+EMlFq68uggVhNIgW9KSWveZpdHAO6aGaBH92
 GQrfu/b6wFUZpnALLDtipcyM7UP2iqplWqMiF6KoG5gZ1XuIfc+vYV8H7QmznldJx2qa
 36nmzKaKOR2hMQ6RiDX1hxLrKHhIb6tSedtoosuygOfMiDQgEajwmmgDnCXkdKMnb+Wt
 NaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488982; x=1773093782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/HU6l5SGmiuo2Bv+aUhF8Src+lTw7G1vc2sv+D9xvQ=;
 b=jU1T6651BzmGFbBwrCP7tTQkqMPPmt1Hrf9iYEwNqZa+7P7xpya2+wxKR8EMrx45tO
 SZwYtwljBNyGrJ40GgMZUR+8fT00Ye+A0uiYzqoCH5Llw3SIpYugqS1qWhkBsLhc1fax
 BYNbE/02yVnGoU2obSoyPObUPUsd1+hDL5JqrgBD5V0FjWh36tQLtGhLrORp6WdRCmyY
 QWbRDDSxvAuyWPaCtVDroikmnBpoq2fzLa9n3G5NhDVOwHet1fvO+mYWYeLoKkEWS44H
 MjQ3v80cnuNuF6WAz9Mv4dCGoG1e9HrXqZcLlasR4uBBxFbBpMCgH9fzv+viHmraoYMY
 EvLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIH1tSeqVdmooCLZbCg9t2+4MCBKpmGhRZdJ0ipLx1CmP9Hcvfb+tb9HFyh5Yd1cZg7EHX9piFJA==@nongnu.org
X-Gm-Message-State: AOJu0YwqycbNDgZr0YBpZ85+Yw+2gD8N5SfZ9eWAc44Bt+5DbJhD7QgZ
 vlSxZ7JRZBD42vO0BuKSMWzjWlHVkBtoWO4IldZkucqtW8MyObG8fO0B
X-Gm-Gg: ATEYQzxXeh7jp0VXkShWqwDC98OrzkShCDDYbStpRZmY23QdX8ABH2o57GAflNct/8n
 qNPatMmP46Os+l1wsaGDWNb6G7iBkAwcCNu2Sz4V494Ts6FruIX7uLu2D5bRWJ/4oQxXUGUCMVR
 b/USdbqq8PBWHWr6B1WsotLo/OgJhwWeIaPMSHq4Q8iDnE2axWDh+OcsHB2OvA9XF3JKXJ69+v4
 t6R8rm6O//EGHn5OTbT+4AdBp1qcy8tiPXszKjm0ElfYeI9PKDVNiU8pTPi4yDF/lEH0BPJzncn
 GHpZ+t6dId5uH5qtitaSSqYyENC6/ZaREwdGWX8P/w7Al2jLqzGIItX3mTcX5nPEIdOegrgcf8V
 Uho7UKzP5sSr4ZiToN+9bAWiY65EDkI5op252yIphUPJg6LDR5z9HabB4AUKr2n+1yAicRw7HGM
 n2I5IAQUf2rcYghsAY0wBwCUt6Z3SJcCixpMZDrWushbQd+uqa+l+7SK3HnLKkflzsg86TdoNFQ
 H+ddIOnqEL7qN4BSA6H3OFfvTVyfLB1FsKfVosr8XCmRBU=
X-Received: by 2002:a05:6000:2388:b0:437:7168:af37 with SMTP id
 ffacd0b85a97d-4399de2c3eamr23296765f8f.42.1772488982180; 
 Mon, 02 Mar 2026 14:03:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:01 -0800 (PST)
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
Subject: [PATCH 00/12] TYPE_SERIAL cleanup
Date: Mon,  2 Mar 2026 23:02:42 +0100
Message-ID: <20260302220254.1166849-1-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
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

This series consists of cosmetic changes around TYPE_SERIAL. The biggest change
is having it derive from TYPE_SYS_BUS_DEVICE which 1) eliminates usage of
qemu_{un,}register_reset() and 2) stops all its users from accessing private
data. The latter allows TYPE_SERIAL to be ported to Rust in the (near) future.

Testing done:
* Make check
* Boot mpc8544ds machine
* Boot q35 machine with Arch Linux and interact with it on the serial console

Bernhard Beschow (12):
  hw/arm/Kconfig: Fix serial selection for NPCM8XX
  hw/char/serial: Remove explicit cast from void pointer
  hw/char/serial: Prefer fifo8 methods over open-coding
  hw/char/serial: Reuse fifo8_num_used()
  hw/char/serial: Remove unhelpful comment
  hw/char/serial: Add constants for Line Control Register
  hw/char/serial: Remove redundant reset
  hw/char/serial: Avoid implicit conversion when tracing
  util/fifo8: Make all read-only methods const-correct
  hw/arm/aspeed_ast27x0-{ssp,tsp}: Do not access SerialMM internals
    directly
  hw/char: Have SerialState inherit from SysBusDevice
  hw/char/serial: Plug into reset framework

 include/hw/char/serial.h    |  4 +--
 include/qemu/fifo8.h        | 10 +++---
 hw/arm/aspeed_ast27x0-ssp.c |  7 +++--
 hw/arm/aspeed_ast27x0-tsp.c |  7 +++--
 hw/char/diva-gsp.c          | 22 ++++++-------
 hw/char/serial-isa.c        | 19 +++++++-----
 hw/char/serial-mm.c         | 10 +++---
 hw/char/serial-pci-multi.c  | 22 ++++++-------
 hw/char/serial-pci.c        | 13 ++++----
 hw/char/serial.c            | 61 +++++++++++++++++++------------------
 util/fifo8.c                | 10 +++---
 hw/arm/Kconfig              |  2 +-
 hw/char/trace-events        |  4 +--
 13 files changed, 100 insertions(+), 91 deletions(-)

-- 
2.53.0


