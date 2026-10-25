Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30595606A31A
	for <qemu-arm@archiver.kernel.org>; Sun, 25 Oct 2026 20:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elMfOAPN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xL58E-0006LK-1u; Sun, 25 Oct 2026 16:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyan2254650260@gmail.com>)
 id 1xL3sQ-0004Ix-Mg
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 15:27:30 -0400
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyan2254650260@gmail.com>)
 id 1xL3sP-0007jY-4J
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 15:27:30 -0400
Received: by mail-dy2-x09.google.com with SMTP id
 5a478bee46e88-35cd538de29so1212883eec.1
 for <qemu-arm@nongnu.org>; Sun, 25 Oct 2026 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792956444; x=1793561244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KT/JJa5MAiZkNf6G6aD8obgzl9KsBtCZdzZeWHx/DqY=;
 b=elMfOAPNhcQYuj1QBzCyRelfyRcT9G5WjU2d0Ia0koWF0S1n2o0VdSTlZpkPJYqLWI
 Pwm5gJvIlU+O1bOhuhEOhl1GttzWazHzWQocJYNGyfhHKe0VVe5WRHPpIN4YCD2xZIKv
 9ifcx4kPBRr8OPddDXGbJlwOxCsSgxjYtsZVdyoQ/GK4fnR0AaIAlqeHIIHdFwAfnSBc
 rFCnjMYsaGGCLZLRzQA4l/+2Bh3L2TQGI/BUsc+T8oaXo+5UDjudJguT7k5E9mwa4QDd
 +qhxvxROHS2V/BNxhLBj0jyauWZfXH9kWZHRZSCv5lRHplbC+jMd1/Y5isN6O+XJrTRg
 dvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792956444; x=1793561244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KT/JJa5MAiZkNf6G6aD8obgzl9KsBtCZdzZeWHx/DqY=;
 b=ie7iCoYOZQEL5k+o0r5K9mD701kgXhu1xw1G68ZMVZzAA1+TN5qTJAX+IIhigiL5qy
 +185UVboOeYNl+FJZn0rcG1ByjQ1Loh6k+b4YgvbSHdX4aDoOlPykNZdZVg9x+bxG3B6
 QISMGEwDUL/jAbvbNF8VmKP6tosyPjg26pGpImwnQMfM6Yh9uyUVnayZl8+YMpG4a3Ya
 dY+AfHfW4/5FXLqOw59GSTku84eR5pkI1x0SNrygOS5V3SzV4PCWHdXbIsTC3f5YO/dD
 TbDULeEmIY3ywtmyFM22gwPalOV0g2hsr/t/lnuN8sVhT1kUt4SMRpU29KE9szoE2vrR
 nUAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6Ko5L/Szxv33fugtWEZ3VqrU8g75qLZt86l6SM4zwIC7UJjj5AWaaxC0LnQhE5ffzz/L8ISxuWQ==@nongnu.org
X-Gm-Message-State: AFq9FYLpl3J8X4MTSRSBwESh7t9NlfQi7XxDPDnWmddoTRiWECkobpjk
 gTbnTCAp6PfQqKVXpve3W1q5w8COn7xdLMXKH6Oin3oFBWo5ZnamCVHj
X-Gm-Gg: AYBFou3WDssfvqzm1lsP22Nm0VWH9J9X+oUCuasceIYZm2auaMB/eTFWoTiN3kz8pMJ
 dcgyyE6CvRCcvthTt5MKlKWPxn3ueuQtQl8eouct8vWGtcW1jvINLcbXEbPmJZ6k2Yy9oFZK7nu
 iW47cYyZ3NgUqKXJS9q1PdMr9ZUM93JvHTguHAah/NQUg8AYMNoug7zpmqiwwzZel7JdsBUJ9fN
 2Pj00H3XpXB5EDuxYEOMnitAffcPETKYw4412iE+z8sJ+BffSz+6tbQJBOm5EI2yjQ7UAtwPwOK
 TX34xaF4xitHYhSHj/MlxRqgVh4883TXHCwtEWtj6we7R0YdBsA4EFJTL7KeQdBaGgf2Xv+jOXb
 Brn86Dcj4L7aZhwQeKjqQtKgeOzKKMkQRxNMbTGLiMOp0KhERvtO2eDPtuTp9d9DT8oG3e5s860
 cTdVjK68Nbl5KvhfpP8VvBgvNWNbOPEr7hSFs9tnoI3Zqd60048C+D0sIZxJrZfkiyt7bIuGAU7
 sB3GOGzRgvJTq4v1XnggZNVABN1q1GsGOAaz7d8tSUas/gSfOTWmk56w31Jw7ZoG76SYoix1VmI
X-Received: by 2002:a05:7301:4303:b0:368:2548:c08d with SMTP id
 5a478bee46e88-369e863bdd5mr7618377eec.25.1792956444023; 
 Sun, 25 Oct 2026 12:27:24 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([152.175.65.31])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8daa3a8sm23226027eec.16.2026.10.25.12.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 12:27:23 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 0/3] hw/gpio: Add Xilinx AXI GPIO device and
 petalogix_s3adsp1800 integration
Date: Mon, 26 Oct 2026 03:27:13 +0800
Message-ID: <20261025192716.239589-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::9;
 envelope-from=cyan2254650260@gmail.com; helo=mail-dy2-x09.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Oct 2026 16:47:52 -0400
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds an emulation model for the Xilinx AXI GPIO IP
core (PG144), connects it to the petalogix-s3adsp1800 MicroBlaze board,
and adds a QTest test suite.

Summary of changes:
- Patch 1: Implement Xilinx AXI GPIO IP core (PG144) supporting dual channels,
  configurable data width (1 to 32 bits), per-channel 3-state direction
  control, global interrupt enable, and per-channel interrupt generation on
  input transitions.
- Patch 2: Connect the xlnx-axi-gpio device to the petalogix-s3adsp1800 board,
  replacing the previous unimplemented stub at 0x81400000 and wiring IRQ 2
  to the Xilinx interrupt controller.
- Patch 3: Add QTest test suite covering reset state, input/output propagation,
  direction mask filtering, edge-triggered interrupt generation and
  clearing, unmapped register boundary reads, mixed I/O multiplexing,
  channel 1 & 2 physical output isolation, reset, and QOM object
  introspection via QMP.

All patches pass scripts/checkpatch.pl with 0 errors and 0 warnings,
build cleanly, and pass the full test suite.

Pufan Jin (3):
  hw/gpio: Add Xilinx AXI GPIO device
  hw/microblaze/petalogix_s3adsp1800: Connect xlnx-axi-gpio
  tests/qtest: Add Xilinx AXI GPIO test

 MAINTAINERS                              |   3 +
 hw/gpio/Kconfig                          |   3 +
 hw/gpio/meson.build                      |   1 +
 hw/gpio/trace-events                     |   7 +
 hw/gpio/xlnx-axi-gpio.c                  | 282 +++++++++++++++++
 hw/microblaze/Kconfig                    |   1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c |   8 +-
 include/hw/gpio/xlnx-axi-gpio.h          |  59 ++++
 tests/qtest/meson.build                  |   3 +-
 tests/qtest/xlnx-axi-gpio-test.c         | 372 +++++++++++++++++++++++
 10 files changed, 737 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/xlnx-axi-gpio.c
 create mode 100644 include/hw/gpio/xlnx-axi-gpio.h
 create mode 100644 tests/qtest/xlnx-axi-gpio-test.c

-- 
2.56.0


