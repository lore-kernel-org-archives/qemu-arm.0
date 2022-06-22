Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2312498lft;
        Wed, 22 Jun 2022 10:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPyM8BcMRt8A0aFcTy7tKSeuk4Mo4SQNJAHOJ3QDBvI+1m1RfpVQCznPPtx0eFUkH/iuVL
X-Received: by 2002:a05:620a:4509:b0:6a7:5fe:b32 with SMTP id t9-20020a05620a450900b006a705fe0b32mr3200135qkp.51.1655919464110;
        Wed, 22 Jun 2022 10:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919464; cv=none;
        d=google.com; s=arc-20160816;
        b=sFLraBMUO5w1DostNeM9oLuG0y9N6g6efERgFuFC5yizw6sC60hPPeD8+Wnh1OM71P
         Ayb5PT/1zwTmShVwINGdMTphxPWYIDf7/zLapmzkxdGOVmXxVeAl1UwWZaq0d4HLiPzX
         T9esI7MYbW63bpm/dVzK7KuQp6noiHCjj9WJL19+s/uUADLpYf4bT6v7EtoxYyIqUTaB
         CDn1VvVOj6Ho2j9sNaLbFs0vtYcns4m98Q41tPh1Hy9Ud6XawBt/pUw28flMVYK0AgSc
         3gcCQL7OWj95EcQwfebPgxPcMrY16GUmgo7n08pw1Xauyun54K+7numv1duQ+bOaZUfL
         30Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=szw4cM/+cU6rPhFJf5hXE+JaP03ARSDWwC2EY4QIYP0=;
        b=vOjgUQcFLk5dR8darCrFx5UWi/J1bXdcdLfH2a0Uodo+tqO77V3KrYM1vrngwupFzX
         34mJedjr2z+ErzhaxWQugUgsTAs069dhsTyUppxIULWR2QUem8EU2zpbguEYRhTHlb5n
         ybqZOZj8JYTbZUFwsM43lBDvG1sVM3e/poK24h746GOfmQMH7otv+dN27c57E3W4pGPB
         PBuWNseimMRbMpK26R6y717zdas1MQVg0nb3aV0gHhDIpPspQN2p2nTwTwJ0BgecuFuS
         UYhBja5fwMp6AsPJtB2W4FRvgcXQQHoFF9MKuzveZfboQCIaP9X1Y/FM4FMX6V5/TRKc
         t8zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=b2Z7GvAA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl5-20020a056214518500b0045a7a161743si12384472qvb.572.2022.06.22.10.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=b2Z7GvAA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44IR-0001vY-JB
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gm-0007mX-1d; Wed, 22 Jun 2022 13:36:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Gk-0001hO-C5; Wed, 22 Jun 2022 13:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655919358; x=1687455358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szw4cM/+cU6rPhFJf5hXE+JaP03ARSDWwC2EY4QIYP0=;
 b=b2Z7GvAAz1fRbL54OPG+SbQp0p+VOPL2YGMW2R3dm5UCiYRUSzT3awnB
 12uK3ezLQ0B/Sh0kKOCZ5FROVSdh2+ML7cFf8aLMXdk5OwJuDv4VjZqV0
 kAuzoAysv0tbYx/1ZOMXX9miCM3/7CsKNyfnHDylN+TsPQj1W82fGq7ny Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 10:29:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:19 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:18 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH 0/9] Add Qualcomm BMC machines
Date: Wed, 22 Jun 2022 10:28:21 -0700
Message-ID: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UKnlP1gzv3C+

Hello,

I'm sending a series to add Qualcomm BMC machines that are equipped with
Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
emulation. Please help to review.

Thanks,

Jae

Graeme Gregory (2):
  hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
  hw/arm/aspeed: add Qualcomm Firework machine and FRU device

Jae Hyun Yoo (3):
  hw/arm/aspeed: add support for the Qualcomm EVB proto board
  hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
  hw/arm/aspeed: firework: add I2C MUXes for VR channels

Maheswara Kurapati (4):
  hw/i2c: pmbus: Page #255 is valid page for read requests.
  hw/sensor: add Maxim MAX31785 device
  hw/arm/aspeed: firework: Add MAX31785 Fan controllers
  hw/arm/aspeed: firework: Add Thermal Diodes

 hw/arm/Kconfig        |   1 +
 hw/arm/aspeed.c       | 158 +++++++++++-
 hw/i2c/pmbus_device.c |   1 -
 hw/sensor/Kconfig     |   4 +
 hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 6 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 hw/sensor/max31785.c

-- 
2.25.1

