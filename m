Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2779380lfm;
        Fri, 3 Jul 2020 13:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WCCpvqYzKi0hsL4Ty4DEIRO8YR34+DTKNLb3vLQde+9JsyoMWX5i0RbMkVv68FOXytHk
X-Received: by 2002:a25:760c:: with SMTP id r12mr61712255ybc.90.1593807615877;
        Fri, 03 Jul 2020 13:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807615; cv=none;
        d=google.com; s=arc-20160816;
        b=ZA+QGHRWdLXJLp0Z86YUxi0BeL8pTG1Aon/9LPR7wV9SVJaaNExF9wjW/H7utjYUQv
         Yk/l4WDlkGup5GZXSqNWWySzhyFkMLb/SVmBHKe0HIIfJXVZwQvRXwy18y6MPe1mDFF4
         SEztZN0J2SFiteRgM0ZPq+YImWuIZY7Vz7Xy2RoxuUfB15P/w2xUQgcLY+qXtX+Vm9Ww
         6OdGRb4yVYUbwcdOEm0n2OfXiZ8N5wnNHGmLpTXUc0qighUnK0mrWpjrQZ2ts8KLYvZf
         /DIJBy/Fpkp5BYq1KCTcYllhxDldGTvvZ49wdOEdCM2sVmjpfGuTeFpk2mzeHeid7UGU
         EPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8+gjIh3aqsjiQ5qFFxXfcFeIU3jnTNHGJqIGbb9HtPY=;
        b=Vzze21Jfvou/XrUnDSPf0y/lH9BAF2YNsL2TiCzX2+GnL3nKBGCA/AuYPd2AJNmqkn
         Dxb1sozQ25AMxr5kSrMFpJO515VN0bilVGU/a3OCO/PKyzDnE08B0ELk823fRGQDL3mp
         Sj1Faf8TzubJ2NXbTwUUttSzv+4Bfw6hhOcijQkRD1Na73qX/sMo2rcMPUqP8fzqD0tu
         upsG+fup5isQ1UZPbwGhHt7AYxYMDSpaA4FQE9groElbk7ttTPo0KYv0TGHzrB9VJc/0
         fD9PzTCrCuIcGDui9S0X1FGYocJ43/HrZEVAeO1TiZb+6+dlI4IdDTkGkGMZQOhRi4rb
         wfsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uVPt0TTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si12307773ybh.69.2020.07.03.13.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uVPt0TTD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSAR-0001Ml-8E
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9V-0007md-Kb; Fri, 03 Jul 2020 16:19:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9U-0001U2-4j; Fri, 03 Jul 2020 16:19:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id z15so22662477wrl.8;
 Fri, 03 Jul 2020 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8+gjIh3aqsjiQ5qFFxXfcFeIU3jnTNHGJqIGbb9HtPY=;
 b=uVPt0TTDuGVy1oaT9fhJMnoi4pjX82ByvA9qh1YFlu/FtrluFKwQtFWtfB0Em8JYzw
 VSUsP/GZ7XfNtEwt+ODdVghpYzKjmhM+KDP7/JYEf8aQgfKmCQFU2+8VrnO6xvlm0n3F
 g/kdaj72nZd5a9DnG/b0yQpwOCcb9IUpZucTxEk0wquBZIb2tNp6XdC2nX3xR8JgDk8G
 uu0c1+0pC1quISQye6M1i/PLCi9/1Mvm0cuGKE5xcgOv+39AuLdGQriVgIpTVL3Fd/s0
 LQUVdRZxVazdm6i6NXpUXHRI0i6ehHK19yznAuCcKak76DX/xHRc3vqkgfr6a1F7pF+1
 cozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8+gjIh3aqsjiQ5qFFxXfcFeIU3jnTNHGJqIGbb9HtPY=;
 b=Kmp6ip2oY5WTs33nn2f/m0x5TjobsRHnQw2bjeJ9xPkPKycwF+3LmHJMClRgSzy9ut
 vN9G/zTfZD8LRsvDfyCA61LQsU9qCLKZCciLPoc7yGJrVzt4cK2WzqJQsj47XN5eVw5j
 +0k/xBKm2W17BYiszV6rD2kcq30SRLm7qK0pPWJ07ayyhu2WOo9YyHEArfLUQiHihY3Q
 4yXmvfDQfL6M1a7iw4/e14GJsAWiqwfG7R8d/sRdLqR/UI73gldr7qtS9ZAgI7UUSRRj
 ABP5SexQXcI2fMBkf65E4B3yl3mEd+CHh60rXAYBxf+227L10a1/+o1qCNkxmYNcm/0a
 +tpg==
X-Gm-Message-State: AOAM533Bz5lvtnXPmX2Em2OGkn6gF4Bg2QvASXZHW9V1CI9r+LKZujl1
 K/f4ArbiMsrmY8+HBriregMOFdnBabo=
X-Received: by 2002:adf:eecf:: with SMTP id a15mr38485813wrp.83.1593807553269; 
 Fri, 03 Jul 2020 13:19:13 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/18] hw: Mark the device with no migratable fields
Date: Fri,  3 Jul 2020 22:18:53 +0200
Message-Id: <20200703201911.26573-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MNzlfmpmJsIp

This is a proof-of-concept after chatting with Peter Maydell
on IRC earlier.

Introduce the vmstate_no_state_to_migrate structure, and
a reference to it: vmstate_qdev_no_state_to_migrate.
Use this reference in devices with no fields to migrate.

This is useful to catch devices missing vmstate, such:
- ads7846
- mcf-uart
- mcf-fec
- versatile_i2c
- ...

I am not sure about:
- gpex-pcihost

Philippe Mathieu-Daudé (18):
  migration/vmstate: Document vmstate_dummy
  migration/vmstate: Introduce vmstate_no_state_to_migrate
  hw/core/qdev: Add vmstate_qdev_no_state_to_migrate
  hw/arm/armv7m: Mark the device with no migratable fields
  hw/arm/aspeed_soc: Mark the device with no migratable fields
  hw/arm/bcm283x: Mark devices with no migratable fields
  hw/arm/msf2-soc: Mark the device with no migratable fields
  hw/core/split-irq: Mark the device with no migratable fields
  hw/cpu/a9mpcore: Mark the device with no migratable fields
  hw/cpu/cluster: Mark the device with no migratable fields
  hw/usb/hcd-ohci: Mark the device with no migratable fields
  hw/intc/arm_gicv2m: Mark the device with no migratable fields
  hw/misc/armsse-cpuid: Mark the device with no migratable fields
  hw/misc/iotkit-sysinfo: Mark the device with no migratable fields
  hw/misc/unimp: Mark the device with no migratable fields
  hw/nubus/mac-nubus-bridge: Mark the device with no migratable fields
  hw/sparc64/sun4u: Mark devices with no migratable fields
  hw/core/qdev: Display warning for devices missing migration state

 configure                    |  9 +++++++++
 hw/usb/hcd-ohci.h            |  2 ++
 include/hw/arm/bcm2836.h     |  7 ++++---
 include/hw/arm/msf2-soc.h    | 11 ++++++-----
 include/hw/cpu/a9mpcore.h    |  3 ++-
 include/hw/qdev-core.h       |  2 ++
 include/migration/vmstate.h  |  3 ++-
 hw/arm/armv7m.c              |  1 +
 hw/arm/aspeed_soc.c          |  1 +
 hw/arm/bcm2835_peripherals.c |  1 +
 hw/arm/bcm2836.c             |  1 +
 hw/arm/msf2-soc.c            |  1 +
 hw/core/qdev.c               |  8 ++++++++
 hw/core/split-irq.c          |  1 +
 hw/cpu/a9mpcore.c            |  1 +
 hw/cpu/cluster.c             |  1 +
 hw/intc/arm_gicv2m.c         |  2 ++
 hw/misc/armsse-cpuid.c       |  1 +
 hw/misc/iotkit-sysinfo.c     |  1 +
 hw/misc/unimp.c              |  1 +
 hw/nubus/mac-nubus-bridge.c  |  1 +
 hw/sparc64/sun4u.c           |  7 ++++++-
 hw/usb/hcd-ohci.c            |  1 +
 migration/vmstate.c          |  7 +++++++
 24 files changed, 63 insertions(+), 11 deletions(-)

-- 
2.21.3

