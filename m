Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79920F513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGsq-00010M-9b; Thu, 05 Mar 2026 17:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsm-0000z9-03
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsj-0002CH-Et
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4837907f535so77742105e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748559; x=1773353359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QqAbdk4Pe2MQVed+WtrEw6pFfWk8J389+1HbvVagQKg=;
 b=k6X2UDfG9nE/p6wAylwyXj+x7UKnyJVJHn/Agcg9ZhSUjGsGo0Ogy/YcN6Pdw1QTzj
 BwyHcryRrRQKcDO8ATz2IlZGY5ezb3QBmfK55cCypCnjXsfbZblqoew/MMeWKQAuCj75
 dyCZV+FHlq6qCoLKkLxKc0xt4wNk4ba0dcD0dIWGInAnCDTddBP4kmoiuhH0FCkjMEiZ
 kr3bJJgzCC8cK/Y4a6V59DyegF4xOwbf9X06UL2WMYSo+GCRgXk4ozid28rodvnK7QUQ
 gtBwVwi3fkkYFA/sWR21BQs/hG8Nds4unaRCqUnDa1wpXSbYTsgLbbH4IAMczcrqR1l/
 KPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748559; x=1773353359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqAbdk4Pe2MQVed+WtrEw6pFfWk8J389+1HbvVagQKg=;
 b=ieTpw3pUzxrRrWMsD2eUiE3WdDo/nRTo7MGXt2DtLXqeBkmI1oW/tlaekBWPfPDTvm
 xLO5oCrOMummG4DJtXkyQQeUH+Xl5Icu/9aFrSQbHug26+wstiGLu2WF7h+unEhQ9cur
 678MDt6KCqHR4sHYP0LGCVzH0x+16n34ET6TACrqaRj8LZqGgbRPUOPthjhjyD6atgJa
 7SwS2ww+kcSwxDkUTXsqs2ht+fQgz7yutMurw69H4ERzDBGJDXSfq/yzRg36dhp/lC9c
 wBD6u7iosbyOvAUMhagI+np4YaSBVr+p4/2UALYACVucbfFjRvweW1ozE+qUCQWJ2TyC
 U+rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeFvRxhypBoKeYIWiWQiiK+vFpsQzI4qUQFVG4MPXCPsZ1fUdiuZOiLDpCDi2LODaLHq32Vq8b1w==@nongnu.org
X-Gm-Message-State: AOJu0YyTRi2rMpjQI9mLD5XN56bu8Qb3U5nQgv5MHfljpKu+2dyrVEZM
 LfivIY3k03t+bIzakdnBtJp0e6t1oUD31H2hPJaqfw3D0n5T+CL047FM
X-Gm-Gg: ATEYQzzKrdmbAQxrXX+zZm+newLgQBruBbOmvC6JvAFlVjAg+iwKE2aedlqb8boFKbH
 ZsuOUBvn9tHALQ3tVWxnEROY4Cw7zbgcFaE8nnmK55iPWIopiUWLajK6KYAdJwijCopKcovSwc6
 AnE10VGuXX50fVc0Y/6Z5YAwzj1SaskxiDGvPZRMAXxDGWGt7iq+OLgmVakGzLEMQaDcWlJ4QUI
 Nk0shz7d4qwdqdF+1im6Uwz363hRgb/+p7Wi5O61H+c+B1zuJ//l6ASkMOyGJZwLY8hVRT9MIJ0
 qE1Yq9J6QTBvqoXF7wMJ7Ctq7erWSzHA1TaSkCqVCWJl8yJvOZfRPg+/899Ayb2mp4HnZppcVxR
 yBrTVRJya3DMBa51+KnqdEBx0NP7TRGY/OQs7HliTVeEpSt70SdtRMaFiYuUm5WhBKtogB8Bz7A
 9Hn6UlWnmslqVfTKba85/SRpuRUZge8vgqYLiG8BDvWs49hjkqeyrlLFQE4geX4G3nDTuGtmwQh
 lyn65HRuGc3uIVficKOrlw2mtFPS7HZ7fwkjQymioQ5F1U=
X-Received: by 2002:a05:600c:1c18:b0:480:69ae:f0e9 with SMTP id
 5b1f17b1804b1-48519871aa4mr147654815e9.16.1772748559328; 
 Thu, 05 Mar 2026 14:09:19 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 00/14] TYPE_SERIAL cleanup
Date: Thu,  5 Mar 2026 23:08:57 +0100
Message-ID: <20260305220911.131508-1-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32d.google.com
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

v3:
* Pick up further R-b tags. Thanks!
* Add patch "hw/char/{diva-gsp,serial-pci-multi}: Fix deinitialization order"
  (Peter)
* Justify switching to serial_io_ops in certain cases in TYPE_SERIAL_MM (Peter)

v2:
* Pick up R-b tags. Thanks!
* Ad patch to free consumers of TYPE_SERIAL from setting up MemoryRegionOps;
  configure via properties instead which should resolve odd code (Peter)
* Improve wording in one commit message (Peter)
* Sort patches by moving char/serial last
-> Keep "Avoid implicit conversion when tracing" untouched for now. Can be
  omitted if deemed inappropriate.

Testing done:
* Boot mpc8544ds machine with Linux and interact with it on the serial console
* Boot q35 machine with Arch Linux and interact with it on the serial console
* Make check
* Make check-functional with all architectures enabled:
    Summary of Failures:

    238/313 func-thorough+func-aarch64-thorough+thorough - qemu:func-aarch64-tcg_plugins          ERROR             0.72s   exit status 1
    309/313 func-thorough+func-x86_64-thorough+thorough - qemu:func-x86_64-vhost_user_bridge      TIMEOUT          90.01s   killed by signal 15 SIGTERM
    311/313 func-thorough+func-x86_64-thorough+thorough - qemu:func-x86_64-rebuild_vmfd           ERROR            33.64s   exit status 1

    Ok:                257
    Fail:              2
    Skipped:           53
    Timeout:           1

Bernhard Beschow (14):
  hw/arm/Kconfig: Fix serial selection for NPCM8XX
  hw/char/{diva-gsp,serial-pci-multi}: Fix deinitialization order
  hw/arm/aspeed_ast27x0-{ssp, tsp}: Do not access SerialMM internals
    directly
  util/fifo8: Make all read-only methods const-correct
  hw/char/serial: Remove explicit cast from void pointer
  hw/char/serial: Prefer fifo8 methods over open-coding
  hw/char/serial: Reuse fifo8_num_used()
  hw/char/serial: Remove unhelpful comment
  hw/char/serial: Add constants for Line Control Register
  hw/char/serial: Remove redundant reset
  hw/char/serial: Avoid implicit conversion when tracing
  hw/char/serial: Keep MemoryRegionOps private
  hw/char/serial: Inherit from SysBusDevice
  hw/char/serial: Plug into reset framework

 include/hw/char/serial-mm.h |   3 -
 include/hw/char/serial.h    |   8 ++-
 include/qemu/fifo8.h        |  10 +--
 hw/arm/aspeed_ast27x0-ssp.c |   7 +-
 hw/arm/aspeed_ast27x0-tsp.c |   7 +-
 hw/char/diva-gsp.c          |  23 +++---
 hw/char/serial-isa.c        |  17 +++--
 hw/char/serial-mm.c         |  59 ++--------------
 hw/char/serial-pci-multi.c  |  23 +++---
 hw/char/serial-pci.c        |  11 ++-
 hw/char/serial.c            | 137 +++++++++++++++++++++++++-----------
 util/fifo8.c                |  10 +--
 hw/arm/Kconfig              |   2 +-
 hw/char/trace-events        |   4 +-
 14 files changed, 157 insertions(+), 164 deletions(-)

-- 
2.53.0


