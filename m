Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2001799njc;
        Mon, 4 Nov 2024 02:15:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2IOIw1qefDobY5Uj5NJbOO/Dl4HvAZWbQb7vyVY5pFAiQil/T3pSvm/UlhkxRElJlYusjXc/piOjDBg==@linaro.org
X-Google-Smtp-Source: AGHT+IFj839VIrwyi1ObkFxf2oUqUsyoQuBGb6TGRY8gmrIkIbzHktQQoTyvFE/yygpuCLEVYGY5
X-Received: by 2002:ac8:5d01:0:b0:460:97ec:3978 with SMTP id d75a77b69052e-462b86514fcmr137895811cf.5.1730715342256;
        Mon, 04 Nov 2024 02:15:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715342; cv=none;
        d=google.com; s=arc-20240605;
        b=gRsT/KiNgiCggJ9BrAHmSMDKNOF5EPAiQBLKpst1jet+AXwyEErAOjpdNn6Guc/3C8
         jzzaBgU907Qqa9M7w3G8x+JoIPQgpRMC3yKThzc8nIayh/NO1FUjruaqGB9O+3rnNiXB
         b5ED4n9/dPU0adnS3AyCEKtC9fwEEN4+icIAL70Mr27Bh8AZRDHJ+joQMr9W+qLw2g7y
         07Fhy7xIPBQM8iIjGdPOnx/RfEA6SmktKY0pwCinsTnDeVqa1lTGE0+czHiJLp10LzUt
         +y5o5U6fQwqugOl4JH06EjM3uGdq1chVeFr2WIFgyRU6NbfI58SgFYe2REpAiBK3Jr7Z
         46Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=C98Aoh57Ke8BBUi2KG1jgCHvhbodcB+FV9OOM1H0SoU=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=EUfkJi3vFtL0QBMEenMJ+ZGpNJh9D2nrN0pZvoxNGTwMaVeYXQRErHwcqk6yeT8HnI
         S0quBo3N85zTFVy5foj45Mm4MEzkvIMtIJTl7zvWskSFSKJ2HMjP9azP/xXTatEYLkzL
         +2ODclcU31zepyq6urX59e/bi0/0hOtR8jLNxlsz0WL+9KbHaXVvK14OsJbd+xwUqkas
         Nmkxs3AMye3OtjZ10qgsDHd7eBujJb/wy5vIDox1VUfB80+WaIiHM0voUcVv5g6b8iOE
         56TBkbesFtc1/7/6DC8KbG5fSfCNQOEquOKKbA+9fhrtLaJ8u9WuBi0DC2RYuQYz71NO
         MQ8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiUBPciU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad19e857si99457791cf.309.2024.11.04.02.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:15:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiUBPciU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7u7B-0000gl-Iu; Mon, 04 Nov 2024 05:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u77-0000g8-SS
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u75-0006Vf-Ui
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C98Aoh57Ke8BBUi2KG1jgCHvhbodcB+FV9OOM1H0SoU=;
 b=QiUBPciULvrNnypqFcFVfDhsvXjiKKKBwgpISUxlb6NUGOxGVdOt7vI1RtxElpdjSjPZBA
 zuCeZT3FbPVv6pk+o5mPmef+PSKZBNY0iNS9w2syodKHENA8LL0WzzmBwbWsRrj9HVc5L3
 seuOUMj9PZVXMTZrNUXjQgzqGIDKv9Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-9tJrE9DwPxyCG0QntK9b1w-1; Mon,
 04 Nov 2024 05:15:06 -0500
X-MC-Unique: 9tJrE9DwPxyCG0QntK9b1w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D3DF91944CEE; Mon,  4 Nov 2024 10:15:05 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 73DE91956052; Mon,  4 Nov 2024 10:15:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/10] aspeed queue
Date: Mon,  4 Nov 2024 11:14:51 +0100
Message-ID: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yVpfgFs09yqg

The following changes since commit 92ec7805190313c9e628f8fc4eb4f932c15247bd:

  Merge tag 'pull-riscv-to-apply-20241031-1' of https://github.com/alistair23/qemu into staging (2024-10-31 16:34:25 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20241104

for you to fetch changes up to 8df5fd815e841bf33fb51e1e6e5be9c31d529b94:

  aspeed: Don't set always boot properties of the emmc device (2024-11-04 10:12:02 +0100)

----------------------------------------------------------------
aspeed queue:

* Fixed eMMC size calculation
* Fixed IRQ definitions on AST2700
* Added RTC support to AST2700
* Fixed timer IRQ status on AST2600
* Improved SDHCI model with new registers
* Added -nodefaults support to AST1030
* Provided a way to use an eMMC device without boot partitions

----------------------------------------------------------------
Cédric Le Goater (1):
      aspeed: Don't set always boot properties of the emmc device

Jamin Lin (5):
      aspeed/soc: Support RTC for AST2700
      hw/timer/aspeed: Fix coding style
      hw/timer/aspeed: Fix interrupt status does not be cleared for AST2600
      hw/sd/aspeed_sdhci: Introduce Capabilities Register 2 for SD slot 0 and 1
      aspeed: Support create flash devices via command line for AST1030

Jan Luebbe (1):
      hw/sd/sdcard: Fix calculation of size when using eMMC boot partitions

Patrick Leis (1):
      hw/arm: enable at24c with aspeed

Peter Maydell (2):
      hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
      hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ calculation

 hw/arm/aspeed.c         | 38 +++++++++++++++++++++++++-------------
 hw/arm/aspeed_ast27x0.c | 33 ++++++++++++++++++++++-----------
 hw/sd/aspeed_sdhci.c    | 40 +++++++++++++++++++++++++++++-----------
 hw/sd/sd.c              |  4 +++-
 hw/timer/aspeed_timer.c | 15 +++++++++------
 hw/arm/Kconfig          |  1 +
 6 files changed, 89 insertions(+), 42 deletions(-)

