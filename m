Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp621481njk;
        Tue, 16 Jul 2024 23:30:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXst8Wpu763/mfDeqwUoJpcUmWP28fM4Uq+ezCO34P67nzimGklyrlDit8xXFDO5cyI3I/zm9ZQrh+E/CrOXbLHEnzKS2d
X-Google-Smtp-Source: AGHT+IFB7ZIT7GW4D3RSsLO7HD/8+QdP6js6oOVq+U7RmJRVaObQuRKcOUrUGtJlAKvLURKYzbU6
X-Received: by 2002:a05:622a:1193:b0:444:a34d:900b with SMTP id d75a77b69052e-44f86172bc2mr9922081cf.1.1721197849012;
        Tue, 16 Jul 2024 23:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721197849; cv=none;
        d=google.com; s=arc-20160816;
        b=A/XyWl/FyfN2LAbn1WDxWmOR36GjzJ/mFgcvgId7zVqxIKt/zADGxqTq1MgAU55NmU
         PvLwSREhoZrx3mq3WHKkL4xgzr3CgS6BJiqkO6C7OCWh4lGiZTQb3o/SoxMnmvU/MUao
         SF8EJTGlL8ymcnVf8M2pbjbCtMEVsDpagvRElXSk7OX7T6WQRM6FMMt+Br4/Zyse4qXu
         XvqleVXAl88bfHbGN61ITV/tENLqkmzzNCpPLLz6hVKQGen5HfqOgaiHpcjyRffj5sLw
         HGmNrG+aeUBT3koiGY1uJO51isIR4U4PfxSf5bcyTD//QqqXmNKTjnlAMvCAvo3KfKli
         cgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XCrYT2DWLbPKiuwikeICvix1QZ+k8mWPg9CvAuJyt64=;
        fh=0pYxd3iFRyo2OUA9a/JXFokuM4B7EZ6uGRPudQcN7MU=;
        b=qAgFbPtchgK2GEDhYogMRCGeCSOKw9pz1+XEJvYnbcsGf0mp1O/ed7zWTFTvpuRzTb
         b4aBRI6Zq5tvBCtlsE2tAmTeRuBIZHIPta+HE9cNGGuYMNgVO5Dbl7ADUGmP7AU/XW2b
         uHWpnJFUHEtguXKgDkf/dSn18dh2wnNENnLVtva3yTKWA2LbKRY86TdqEZGEVxsLjfKE
         nBXIRjwRVkBdt7Q5l5xcaX1KWO8nb4GIKcndrNM11Rc83QMjO46CaQm6h02vEZTwxTfz
         H5wMUjfRPAsixLQcKPjdkQBMbLcnflfPd/w+tVshYjU5MeGFT20OG/99SIjv4f3jiOgp
         4mfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R3j27hyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b78010csi94392621cf.34.2024.07.16.23.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R3j27hyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTyBY-00057R-Hc; Wed, 17 Jul 2024 02:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBX-00050v-02
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBU-0002vW-OH
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721197838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XCrYT2DWLbPKiuwikeICvix1QZ+k8mWPg9CvAuJyt64=;
 b=R3j27hySNOPY5JIIaIl9q/56wrJ1NyX4QBxE8fFfLqeXiqbj8p15LtnuhzNfZQ/4jzMaV5
 CYP3CsYzWTXMT8uB/L29PAFpD8g45fK8T5a04waSvmvddLe405bsGhMP8yS38excq8QHUK
 jTgMll+Brgz1LPG0EAogGT6ahIIMSOg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-NUZvyxuMOoCCm3YIu0LoQw-1; Wed,
 17 Jul 2024 02:30:35 -0400
X-MC-Unique: NUZvyxuMOoCCm3YIu0LoQw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A6CBA19560AD; Wed, 17 Jul 2024 06:30:30 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8014F1955F68; Wed, 17 Jul 2024 06:30:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 0/8] aspeed: Add boot from eMMC support (AST2600)
Date: Wed, 17 Jul 2024 08:30:14 +0200
Message-ID: <20240717063022.549849-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ++HXvi7ut5U7

Hello,

This series enables boot from eMMC on the rainier-bmc machine, which
is the default behavior and also on the AST2600 EVB using a machine
option to change the default.

First 6 patches adjust the machine setup and HW strapping to boot from
eMMC, the last 2 are for the AST2600 EVB and are optional.

Thanks,

C.

Changes since v1:

 - Rebased on upstream, now that the eMMC device model is available
 - Rephrased commit logs
 - Fixed SCU prefix of bit definitions
 - Tuned 'boot-config' and 'boot-partition-size' eMMC properties

Cédric Le Goater (8):
  aspeed: Change type of eMMC device
  aspeed: Load eMMC first boot area as a boot rom
  aspeed/scu: Add boot-from-eMMC HW strapping bit for AST2600 SoC
  aspeed: Introduce a AspeedSoCClass 'boot_from_emmc' handler
  aspeed: Tune eMMC device properties to reflect HW strapping
  aspeed: Add boot-from-eMMC HW strapping bit to rainier-bmc machine
  aspeed: Introduce a 'hw_strap1' machine attribute
  aspeed: Introduce a 'boot-emmc' machine option

 docs/system/arm/aspeed.rst   |  2 ++
 include/hw/arm/aspeed_soc.h  |  1 +
 include/hw/misc/aspeed_scu.h |  4 +++
 hw/arm/aspeed.c              | 62 +++++++++++++++++++++++++++++++-----
 hw/arm/aspeed_ast2600.c      |  8 +++++
 hw/arm/aspeed_soc_common.c   |  7 ++++
 6 files changed, 76 insertions(+), 8 deletions(-)

-- 
2.45.2

