Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1256947njl;
        Mon, 16 Sep 2024 11:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQwuPh0K4zTUMWr1ea4B3LtqG4OSaTyzsZjvqrj/s/0GiVINdk48uO29NPSNryawLaD1df2APIRPAEcA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2tAxWehme6c8cQhq6n/8mS9EV1rRzzoyDbIjIgHkLxazOwnZH0WLbe6Z+FRCD0z5hD4oQ
X-Received: by 2002:a05:6358:6f9e:b0:1b8:33ef:cc6c with SMTP id e5c5f4694b2df-1bc39494494mr253147355d.8.1726513117399;
        Mon, 16 Sep 2024 11:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726513117; cv=none;
        d=google.com; s=arc-20240605;
        b=hOe/yYukFlUlOrp+T0yD4RGaNsL6t9NUXYQvRwcJD7ZgrZx4jA8/flH97Ah43r0QgI
         pgkHlkoxQtZ4rnJosgzURHlkaKdv+IjFxHnC3r5MQA4+TFrYMfblaeV3Ab4LyK3M5kmF
         QBz2MDtkSUiw2JIptDdDpgw1m+TMZeBhoEvkB3/9wk59JRuS1puWVrVSUtblJ75AW+fT
         +a8G9OtrfjM8DWjk670LlV3Cs/6NLdhOrmQYt15O8WW6WPcaHm9Re0aDjJHMS9SOZ+S9
         3zjTrxyOD9hjPk0RhKutBARtmV7iX47P7VcuKX6WHFSSohTgwpAkvPdocQK2Rxth2iVa
         QCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=N4K9Wri0rzchmU7yo6AqPz0gjjjjIAovhc5h93vv4/A=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=gos523aOKb8r6VD5PjOOnqIiZ418zY8gxd9HxJkP4HmpW/BHb36krysGhQxedAZ9QD
         4c5CJ5KrhevIq0olh8t4DRBGq3GiwnzoYexoS0SPuLzTAU5bvi2PjRWZdNE8H4Dk9hSi
         cLOCVrf7WalxkzQk+q/4vs24g3XaUnwl0uJ92/WsC4AommOu+HHipKOw8Gil7JIfcJHk
         zXalwIyqX2U6JoOv2SmBAXkWHCD2zdBhTMROR0+2H1w5x12TNrFIhwAHWf+sVxoMnbmU
         e19bngGRyidFAz20mvBB/zRl5yxN5wnkRSeftQ5l6a6uEJRVhQ7/XVIVkf7jvyXy9Tbv
         8ENA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PVFCYoY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-459aac6e15bsi62643551cf.94.2024.09.16.11.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 11:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PVFCYoY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqGva-0007z9-Jq; Mon, 16 Sep 2024 14:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGvZ-0007t4-I0
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGvW-0003IV-LN
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726513101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N4K9Wri0rzchmU7yo6AqPz0gjjjjIAovhc5h93vv4/A=;
 b=PVFCYoY0nr17dBQaTBqNb/1teGkadWQCrbbbxYAtqXi+O5wPVL4TgFgZGwkPX9fiM3I4fn
 ocoR9hCuOn4EC1HfkivcEwPBaLbp0rX8gFmH0UAamG4lzLQqLM1bBoZOVU+3BO10l0hyQT
 3qP1oHLI/AikPDpAUiiTnpXTA52xQHg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-9xNPPWtbPgWdKLkwdGqP3Q-1; Mon,
 16 Sep 2024 14:57:13 -0400
X-MC-Unique: 9xNPPWtbPgWdKLkwdGqP3Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D795D1955DC4; Mon, 16 Sep 2024 18:57:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.44])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0DA1619560AA; Mon, 16 Sep 2024 18:57:10 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/12] aspeed queue
Date: Mon, 16 Sep 2024 20:56:56 +0200
Message-ID: <20240916185708.574546-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: k/vhnM3q2rs9

The following changes since commit ea9cdbcf3a0b8d5497cddf87990f1b39d8f3bb0a:

  Merge tag 'hw-misc-20240913' of https://github.com/philmd/qemu into staging (2024-09-15 18:27:40 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240916

for you to fetch changes up to a93bb519e683fd8f8d7945e5517fd5ad74cc41c0:

  machine_aspeed.py: Update to test I2C for AST2700 (2024-09-16 17:44:08 +0200)

----------------------------------------------------------------
aspeed queue:

* I2C support for AST2700
* Coverity fixes

----------------------------------------------------------------
Jamin Lin (11):
      hw/i2c/aspeed: Support discontinuous register memory region of I2C bus
      hw/i2c/aspeed: Introduce a new bus pool buffer attribute in AspeedI2Cbus
      hw/i2c/aspeed: Support discontinuous poll buffer memory region of I2C bus
      hw/i2c/aspeed: Introduce a new dma_dram_offset attribute in AspeedI2Cbus
      hw/i2c/aspeed: Add AST2700 support
      hw/i2c/aspeed: Add support for Tx/Rx buffer 64 bit addresses
      hw/i2c/aspeed: Add support for 64 bit addresses
      aspeed/soc: Introduce a new API to get the device irq
      aspeed/soc: Support I2C for AST2700
      aspeed: Add tmp105 in i2c bus 0 for AST2700
      machine_aspeed.py: Update to test I2C for AST2700

Peter Maydell (1):
      hw/gpio/aspeed_gpio: Avoid shift into sign bit

 include/hw/i2c/aspeed_i2c.h     |  28 ++--
 hw/arm/aspeed.c                 |  10 ++
 hw/arm/aspeed_ast27x0.c         |  45 ++++++
 hw/gpio/aspeed_gpio.c           |   2 +-
 hw/i2c/aspeed_i2c.c             | 310 +++++++++++++++++++++++++++++++++++-----
 tests/avocado/machine_aspeed.py |  16 +++
 6 files changed, 363 insertions(+), 48 deletions(-)

