Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603034njc;
        Tue, 21 Jan 2025 23:10:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVnkMVvFQ0efhw2o3TOpETA0V+WCXrnOQkX1CVYUB2riA1RQv4otXpQtpRXuUYE9m9rUb7RtU84C7RRZA==@linaro.org
X-Google-Smtp-Source: AGHT+IHcnHZ+IpmSkWBI91rKRTKin1QwL4pY8QVF68EJ5qK1Av9XQPVEkW2/15TLPhfOl3lx+T2+
X-Received: by 2002:ad4:5c68:0:b0:6df:97ba:4f7a with SMTP id 6a1803df08f44-6e1b2229fb0mr326975956d6.33.1737529812592;
        Tue, 21 Jan 2025 23:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529812; cv=none;
        d=google.com; s=arc-20240605;
        b=jMHBJTAjHR3aGUOX3mcPBB/mA5LU1JfU3uB+e0a3m3RB1bPMX08tUEroUWPKpxOYW1
         zhFOuwa6OpeFvFqj9ZSAG5MXCIs9YyN8Q1FRAnxzASPA4mog1wDMDtY9A2WQ3wy+jr6/
         a1p+U8EOQCi9dUweNsv+GccqJLfx/j2PHJRRXYMwRFF5jgW6odQ1yon4FHE5sa1oLCkr
         N2HHZhxB7+PYgHDoyeov9bNwDN0z6QMGdxO6XVqh/qFRYxEYmfGCWeDQf0v3GZqrv+Sb
         BM4nuLHJcCDws4OH+McUI0D6+4w9iIRgxabkfbI9o60oMX1AZzGiEpHUoN3IU9DWopym
         SRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=a5zRK4w93ha2FoItkWXVYXXXZYKCxwCxJZ1l8gtg9Sk=;
        fh=CQ3JhhEpLx6WUtQxwLyuUdUASVLLkjylcjrkyER1RTM=;
        b=lfE70AlW1/SJeUkqhywCSvKvczGvUJDPQ4nNc+bsEPYd26P5UGomanRXKrqGxqiasM
         OUOQOhN2FiUw9+mexbstrRIeYPajXRucOuUMcEewijYY6dEVPyjy+DKIrugUtXo0gQD3
         EHDszFZs+LmJoq8tTRyTLJ9rztLHsj+fQEfzLT590Wao7HOvP00uoKVHwgTsPehSoACe
         dVjaWXRSb7GGGIheIGkBmdGD7SfdXLThKcrdPi3li+g0oJ4b/lOBLU/83lP8uU0uvvWF
         SfiDLhSNwIuh1uBTr5Fw16AwoEQnLq1UuRx56vJ9K2BeDh0HP4/YIEa/wbGlHejqjw5L
         /ApA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN4O93Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afbfacf5si141636096d6.88.2025.01.21.23.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dN4O93Gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUro-00053o-Ov; Wed, 22 Jan 2025 02:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUre-0004tf-VE
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrd-0008M9-9u
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a5zRK4w93ha2FoItkWXVYXXXZYKCxwCxJZ1l8gtg9Sk=;
 b=dN4O93GdQnv/ybfL5fV0bauQR6VNxO+Bscu1OknzjJdOn8ItuPWzGhSC55JWTipRd5/ZXa
 Cso+MX1u4ohjjShMTBnI6RRPjEZvKon/EfXfyCQAdYkjdMo2UFrrb48/8l3qK7E61eC6yB
 +ou6v8YPyAW9aqd3es9cmYBgqaQ7mDs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-QdS95OjrOSutfgnV-LUefg-1; Wed,
 22 Jan 2025 02:09:19 -0500
X-MC-Unique: QdS95OjrOSutfgnV-LUefg-1
X-Mimecast-MFC-AGG-ID: QdS95OjrOSutfgnV-LUefg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B03CB1956050; Wed, 22 Jan 2025 07:09:15 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7C3763003E7F; Wed, 22 Jan 2025 07:09:11 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 0/9] aspeed: pre-PR for QEMU 10.0 (RESEND)
Date: Wed, 22 Jan 2025 08:09:00 +0100
Message-ID: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 2JYTEn8qIA2V

Hello,

Here are the changes I plan to send as a PR for QEMU 10.0, this week
or the next. The last 3 patches still need a review. An Ack would be
appreciated.

Thanks,

C.

Cédric Le Goater (3):
  test/functional: Update the Aspeed aarch64 test
  test/functional: Update buildroot images to 2024.11
  aspeed: Create sd devices only when defaults are enabled

Jamin Lin (5):
  hw/sd/sdhci: Introduce a new Write Protected pin inverted property
  hw/arm/aspeed: Invert sdhci write protected pin for AST2600 EVB
  hw/timer/aspeed: Refactor Timer Callbacks for SoC-Specific
    Implementations
  hw/timer/aspeed: Add AST2700 Support
  aspeed/soc: Support Timer for AST2700

Kenneth Jia (1):
  hw/arm/aspeed: fix connect_serial_hds_to_uarts

 include/hw/arm/aspeed.h                     |   1 +
 include/hw/sd/sdhci.h                       |   5 +
 include/hw/timer/aspeed_timer.h             |   1 +
 hw/arm/aspeed.c                             |  15 +-
 hw/arm/aspeed_ast27x0.c                     |  17 ++
 hw/sd/sdhci.c                               |   6 +
 hw/timer/aspeed_timer.c                     | 263 ++++++++++++++++++--
 hw/timer/trace-events                       |   2 +-
 tests/functional/aspeed.py                  |   2 +-
 tests/functional/test_aarch64_aspeed.py     |   8 +-
 tests/functional/test_arm_aspeed_ast2500.py |   8 +-
 tests/functional/test_arm_aspeed_ast2600.py |   8 +-
 12 files changed, 303 insertions(+), 33 deletions(-)

-- 
2.48.1

