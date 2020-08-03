Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5936939lfy;
        Mon, 3 Aug 2020 03:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYzDdZA4SUi0dmNbOtZbEHLDgtwwwn6aqZb3z2UpX4gE3OB8wuhOQYPEwvLETSCuoIzPRq
X-Received: by 2002:a25:824a:: with SMTP id d10mr25189520ybn.260.1596452234319;
        Mon, 03 Aug 2020 03:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596452234; cv=none;
        d=google.com; s=arc-20160816;
        b=jqOwewx3rgfszcbKkrLRH0w3fLjZwtWmAzHeu8i2dhPuC8343Gbfwl9FOIvywzSVcZ
         TreUnnzNDa5R4imNipZ75ejUwVtLklqu5IEcMWR1GpThZh9HhgX4lKGqd95/XZYemFYR
         9TsnO8+vHkn9Smz1pMtv5mK+WvACsQYGPQOv/On2F9+Pa3gg1RvQlJ5QBOxNVnzp5O1g
         QhYa7FA9A0hbXaLu2156PBAA8Vfok+Mdwn+KnErfbRK7MqTHyT87ZXZ27IqImmyYDbHO
         D0zVcvAj4P2BjTk1jHUlaxrbl20VSIo6z4rQPXgJNRQWig2DBbXJq6OrtT8cgW1zkHzQ
         Lh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FDLL9mpytzeUOW3SyMq5rHzKTExLRt72OxDLspn4Qd8=;
        b=s50okPDT14mNXK+hyNwgA+C1hX+Cj5bHdi51aa0EluScc33NPGrK7O3rKyQlukrUzk
         8lmF6kBSJWZvojsmwlZ6s2AQLnzdRUhi+XXIbXPJETmOaj/7FBnOPd+nDgTzqOJlr7oq
         7Jh0O3EjrpxAYREeQ6X9TWX1NYUi9aTuVdZNmTD0l2xqBaEAsXSN7u9OnOLrAo/CPkKJ
         kqoUHklNIOD2PxsUsW0tdUw0/0a3fhMpTrer5SmMv6LJYtdJrHmcftbIkDJ2Pd8qIQzv
         xRuoYzPTMjfgcalG8vvZ2ZS7oq9dWfEL/nJQij5AKndxktOHxTOJ+8M6/6Xr58OR6ICO
         zWNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vZO2opZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c141si2831941ybf.105.2020.08.03.03.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 03:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vZO2opZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2Y9Z-0002WE-F7
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 06:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9G-0002VO-Kt; Mon, 03 Aug 2020 06:56:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9F-00026h-3Q; Mon, 03 Aug 2020 06:56:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b6so33754109wrs.11;
 Mon, 03 Aug 2020 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDLL9mpytzeUOW3SyMq5rHzKTExLRt72OxDLspn4Qd8=;
 b=vZO2opZ7Ag/vrZ7xp4skvsoh/pvfOy1bkcQpcKdket15UCMLdvugufSiCvxGTvRPT0
 c8O7OmWfVMiT677KcnB0V/Hl2fc53AaR94/eFZu+fU5FT33WD+rNn6r4rxgM2tIMicOb
 xcZIcQZMUtkgXew80skuHV7l70Ot6mZnewoH30JirOftEQw1Gyr7CAfdA6SNYyVd4zIy
 rJ/EiLEWQsSmUP3iQd3+Wrx8ZQrupCWOox9W40j3SBNngmiTtUv/nXNSjAt3vNvVaedb
 IYM0IosYAZ7QZwNys8kuUnHLbKq39oBJGLLIrpF8T9JbYkHh+Fed8VLqLAJvqx7E8IUX
 TS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FDLL9mpytzeUOW3SyMq5rHzKTExLRt72OxDLspn4Qd8=;
 b=g7BNDQwt5w7cki/pnOvQHonf+ms1NW+EC95NwTIUlgrQ187V8wVabRa3dUjx2BjvEo
 PCC51D+cDN1Epng6VGiIqD9ne1Av/kzJlcqURocnTU4e/AT1vTF7Kgt+2B1peeTpVrWO
 f+64AgpF1+Od1p9eu7EqH0WtOmZbbEbab57nKifjYEcMffKwwQtt4TzlZQlTia4efhZh
 8y0y5Ue84jJ+y+KeR0o/Udt3aNmVjRkN6DLVddwTv9szgN7ldwo2t8pTop7iCfIm3fcf
 nFly70BI+co362j1cDIUy/romcuRJzuHIPv2czNvyH/Q1TMqUSYNvg+IfIjOZcjkDAw6
 oabw==
X-Gm-Message-State: AOAM5326zimwxI0hug38jmYKVpOk9Vs6wqG1peIa/k8dkYA4g+tUBe+f
 qmwqYvKdXKrUlna3p48UvjxM8jm/
X-Received: by 2002:adf:e845:: with SMTP id d5mr14786871wrn.228.1596452210093; 
 Mon, 03 Aug 2020 03:56:50 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm23103477wrw.93.2020.08.03.03.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:56:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1? 0/4] hw/arm/xilinx_zynq: Call qdev_connect_clock_in()
 before DeviceRealize
Date: Mon,  3 Aug 2020 12:56:43 +0200
Message-Id: <20200803105647.22223-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GqNOxyEX5L4O

This is not a critical issue, but still annoying if you use tracing.

Maybe it is worth fixing for forks that are based on release tags,
else consider it 5.2 material.

Anyway we can still discuss if qdev_connect_clock_in() is supposed to
be callable *after* DeviceRealize.

Philippe Mathieu-Daudé (4):
  hw/arm/xilinx_zynq: Uninline cadence_uart_create()
  hw/arm/xilinx_zynq: Call qdev_connect_clock_in() before DeviceRealize
  hw/qdev-clock: Uninline qdev_connect_clock_in()
  hw/qdev-clock: Avoid calling qdev_connect_clock_in after DeviceRealize

 include/hw/char/cadence_uart.h | 17 -----------------
 include/hw/qdev-clock.h        |  8 +++-----
 hw/arm/xilinx_zynq.c           | 24 +++++++++++++++++-------
 hw/core/qdev-clock.c           |  6 ++++++
 4 files changed, 26 insertions(+), 29 deletions(-)

-- 
2.21.3

