Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2480049lft;
        Mon, 27 Jun 2022 08:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vC+Qq6pC5F7mBDTzmhT6lKPZB/IETZ938RGL5v+jkTQ1g2/0vFT6VJpYn8fS6fNF3X147y
X-Received: by 2002:a05:622a:1802:b0:317:b96b:68ba with SMTP id t2-20020a05622a180200b00317b96b68bamr9644654qtc.110.1656345354941;
        Mon, 27 Jun 2022 08:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656345354; cv=none;
        d=google.com; s=arc-20160816;
        b=KMlOL5UTBdHlHMaMJRqRApZuLpKJCqI9prYKyZd7WslCFNWLTqDrroo7i/wmgBTIa+
         zYTMY00N4IUSXAwhdiYeL3IDn8CnLx8h+vS1ntnK8oR7o5bA7VcISEZf/rIspaw7xcJA
         A9WfgXXzgp3cJSmpfxw35re4tYc9mfxbTgG1qwHL0kqi7sfssEy4Wcu3bbaSNq44NHQd
         EMcG60dRZlBo7agxenuY3feTz2lJDZHgbhphgTVadSuSJKIkKRqCnKn5q/SUquTbHa+e
         R65JISmYzdpRMDyHJ4CwC+JUsiEnNkUbceKbcHQohcbiYBa0vcVf/KhehuR0QCddUkuY
         NM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vBgQt0zz/0b55IfTM8Iv8peB3xv6k7qk91htfd6lJQM=;
        b=lNuibp7sStVfuZ6LddRijsFA55OdUfblZQ0GYzwWQV5Uj+9xlOtRNJa0EpKqO+i6ey
         ZN4jrE8zM5gkYCCVFCz9dmQq4v0xyRaz5t6GvuEEXmw79AsVP753+xyjvsLBOUZY/YBr
         7MLoUYfBd8Dc/eZAIUoBJDQHRmQ+QFVbSqwb/n6BhcPt0aEsgvV8dU1sZgGVxoXfRtWX
         +g558iBfMA4bCFvNdcwabH7IQnnmydybDQHwUSqEb+ePcJY13phCe44Hq5B1tiEdKKti
         FhKvMzSib+jOkXgGrrBvch1qXt/EyonVK5/2Rn4fxM5s1sfzHjMDqJ/Fo1li0//yqIil
         j2Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=VNJDldcV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020a0562141cc400b00462374301d2si6427858qvd.329.2022.06.27.08.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=VNJDldcV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5r5e-0007AA-Eb
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxu-0001UA-6B; Mon, 27 Jun 2022 11:47:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56387)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxr-0005eX-No; Mon, 27 Jun 2022 11:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344871; x=1687880871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vBgQt0zz/0b55IfTM8Iv8peB3xv6k7qk91htfd6lJQM=;
 b=VNJDldcVdBUscxhD3cFMAxho2qYlc3KboKqEE1Qb5zlL/6Z66E1nBOqv
 nznGyy043GeYY3RXv85/ZBORJ/V30qHAa5t0qpCkZhODoqNt82dTzp49c
 Zhx1r4qsTEOSV8ANlSrPv8I1yW9CBG/f/h4/EMgs7nr6af5V2/yAfhxhc M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 08:47:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:34 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:33 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/7] Add Qualcomm BMC machines
Date: Mon, 27 Jun 2022 08:46:56 -0700
Message-ID: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
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
X-TUID: C8vFFJq/xlUW

Hello,

I'm sending a series to add Qualcomm BMC machines that are equipped with
Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
emulation. Please help to review.

Thanks,

Jae

Changes in v2:
* Fixed a typo in QCOM DC-SCM V1 HW strap value comment. (Rebecca)
* Removed a useless change which is reverted by the next patch. (Joel)
* Changed machine name to 'qcom-firework-bmc'. (Cedric)
* Dropped FRU eeprom initialization part. (Patrick)
* Fixed comment for a case of PB_ALL_PAGES. (Titus)
* Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
* Fixed a typo in copyright in max31785.c. (Rebecca)
* Fixed indentation issues in max31785.c. (Titus)
* Fixed license identifier style and refined indentation of defines. (Jae)
* Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
* Moved machine updating part from the previous patch. (Cedric)
* Refined code to avoid retouching by the next patch. (Joel)

Graeme Gregory (1):
  hw/arm/aspeed: add Qualcomm Firework BMC machine

Jae Hyun Yoo (2):
  hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
  hw/arm/aspeed: firework: add I2C MUXes for VR channels

Maheswara Kurapati (4):
  hw/i2c: pmbus: Page #255 is valid page for read requests.
  hw/sensor: add Maxim MAX31785 device
  hw/arm/aspeed: Add MAX31785 Fan controllers
  hw/arm/aspeed: firework: Add Thermal Diodes

 hw/arm/Kconfig        |   2 +
 hw/arm/aspeed.c       |  95 ++++++-
 hw/i2c/pmbus_device.c |   6 +-
 hw/sensor/Kconfig     |   4 +
 hw/sensor/max31785.c  | 573 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 6 files changed, 674 insertions(+), 7 deletions(-)
 create mode 100644 hw/sensor/max31785.c

-- 
2.25.1

