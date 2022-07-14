Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp658496lfp;
        Thu, 14 Jul 2022 06:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4b+jR39dLTkwp2IBZU/pY5X7lNlDV77fGyJSD9hZvP8nC5W1PXz6OjlXCa9ZmQeiYU7QQ
X-Received: by 2002:a05:6214:246a:b0:473:7eaf:280b with SMTP id im10-20020a056214246a00b004737eaf280bmr7516683qvb.17.1657803885583;
        Thu, 14 Jul 2022 06:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657803885; cv=none;
        d=google.com; s=arc-20160816;
        b=YwfWtNqrFrYY81xQfAmxq6CTqAd+kzCw2HI5cEfQro3DpehrF4Jz8/E288iJ2Kll3p
         ba+oFcDI9hW6X88oZWFCpE5jxfWyI7RrPHbqmJiqALHrswR2w7+2o4h2+xJNqyeFXs2G
         Esj6HZv4f4n6q5/Q7r3sh2cOkumFnFc+m3jDdg/2DtxoNoy79m8IgHdQpADka0vZUVuQ
         62U/7dktLeEdCJoXam4e1mlexTzr7jGSHTlHoeFLRAY9ZwB9f+lA+jzayDM3QHAFZDTO
         o3q8C0HjjwdYoDviLIL0MtuZxNh78VFg5NLKOD/QEEpr5i7IBohM90MDqnuMamCG8Jev
         em0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WbsjQdZ2otUVc1H26DxFtcZfbTmhK1f0jxj3SMYfM5U=;
        b=QTqQTjqeV6Bf3phlUwXSGLg42Q0CfMjr5YG3ivBQHaOtGodT5ugtQKalUtFxQucpur
         zakEX7Ek+ZnyKOb1U81bS3OUtBrDV510PSiNjRAJfF3mFjaH0mQoboma8hBtQX1pzqGm
         PebDs0gefH/yb7wrNsaPQLieXqHkZcLztTQzWmFJSwtlwQgD8I3SNGy7i6wA0lCo2fUr
         JB2wmnC5ALlSsItEWmugwe9h8TEl1+Ux5Pov8dqxF76JnxNqj36XDzshIuUAkyPIj9PA
         er4pS+5FKS5Yd5ot/1WZEvA8G4Ied+Yk2KWjoCMr+B4ckezLqtRWDjoJnFIL//50p715
         GIBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=TNGViMXR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m84-20020a1f3f57000000b0036c0a007ae0si263512vka.218.2022.07.14.06.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=TNGViMXR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oByWL-0002yH-1B
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo6B-0003Vv-42; Wed, 13 Jul 2022 21:57:03 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:17042)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo69-0000VC-1O; Wed, 13 Jul 2022 21:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657763821; x=1689299821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WbsjQdZ2otUVc1H26DxFtcZfbTmhK1f0jxj3SMYfM5U=;
 b=TNGViMXRcI0pwajLHoiLowW9i3x6WTYoXIBCYiRXFKg2OFHI34wJozdl
 mTc2tSYW26Gv0qLAAd6A+SgUSpIwcOcMw2Yse4RPvtf65iLICxZQh0uYf
 +ngvGxmxFd7t/Yqzm4vWQDyVSPrEJIbxwQ0SwcMBrai3ddgaGRPYo70NP g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2022 18:56:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:56:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:56:56 -0700
Received: from perseverance.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:56:55 -0700
From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Graeme Gregory
 <quic_ggregory@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>
Subject: [PATCH 0/3] Object properties for MAX31785 status, target, and input.
Date: Wed, 13 Jul 2022 20:56:34 -0500
Message-ID: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_mkurapat@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 09:02:07 -0400
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
X-TUID: i1dveGk+LkRg

Hello,

I'm sending a series to add Object properties for MAX31785 device. These properties are for the fan status, tach target, tach input, and tach margin (+ve or -ve) percent.  To support the signed tach margin input, added infrastructure routines for 8 bit signed integer.

Please review.

Thanks,

Mahesh

Maheswara Kurapati (3):
  qom/object : add object_property_add_int8_ptr() property for 8 bit
    signed integers.
  hw/sensor: max31785 : add fan status, tach target, and tach input
    object properties
  hw/sensor: max31785 : update the tach input based on the tach margin
    percentage

 hw/sensor/max31785.c | 46 ++++++++++++++++++++++++++++++---
 include/qom/object.h | 21 ++++++++++++++++
 qom/object.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 4 deletions(-)

-- 
2.25.1

