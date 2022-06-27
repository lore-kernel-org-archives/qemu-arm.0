Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2475606lft;
        Mon, 27 Jun 2022 08:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vgfF0aVXABzfq86U4NNc20ZGgzdchyNsmcQtmrsy669yzjIvWXC5FBWMmfEVRRYhXJRjQF
X-Received: by 2002:a05:6214:20a1:b0:46e:53de:4fa0 with SMTP id 1-20020a05621420a100b0046e53de4fa0mr112157qvd.76.1656344898988;
        Mon, 27 Jun 2022 08:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656344898; cv=none;
        d=google.com; s=arc-20160816;
        b=hLj8L3SZ0cDzsY4in6hsFMGXdF+7Lyn0x9lUKqJVFTNxjt9heBJ5U/hfWi05Rez1V8
         beHFpBSl4kYEnK0v/xRpJtXhiQ1MTQ8rESDLusTGHB6zg5yM9ZkonGaiNQsWHgt6w7tY
         iokkLBDU1zCxyM9MZY+cQ01EzV3FJy6LZub2NrENfuKvjJFQtmsgSdVytulZeHQGbRAO
         9SdEOJMzcx0gh0dbdEKxVroqQJu2MEQ26oyJ7WxqWC2iNIZQSZ2lTzwW+lLhXjvATS0b
         HYuvN+59JH9SA7U9MzoLjXFeq9KjYTu0ltFBZI1J9NK0kqq3LPljpx0MvCV43yus9Sav
         DOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZLvNBZesMKm1d1lMIiQZJv24d4CCjd7V6YQR7jsGm3o=;
        b=Gkd2/DZPF4zWEoEjqmuT89bSjVjP/9GQj+nREMouS71BrWEU2aO5biv1Zwhow6P2qr
         LTYwv/7DGZ0ufnuRaeSB6/t+ZWfnwcGd2kIN3c+l49FT4Q1eku4oXQHZBJ3sawH/z9E6
         YCn918VSOssWWYJI70T0qhhURE0sCBiXaKeno68AsIpLfJ5U0k+plvzUEFdRknTaQvfO
         aPQqu2VQou5fLqsY5P9jTmt45jwUwDWJWhvNgW2GEjRxCLQIJZBC0MzvrKXnEKT2DMXl
         vp2OeOYnvDO2vN/b5cCERgSc1FREJc8p1Cg7gpudfv6c6hGyxt2SL0uOLSP6U9ot+JXq
         qMjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=mXXJdWzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a056214194600b0047078edea9esi6168611qvk.561.2022.06.27.08.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=mXXJdWzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5qyI-0001Sz-EX
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxn-0001RQ-Mj; Mon, 27 Jun 2022 11:47:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56387)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxk-0005eX-W8; Mon, 27 Jun 2022 11:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344865; x=1687880865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLvNBZesMKm1d1lMIiQZJv24d4CCjd7V6YQR7jsGm3o=;
 b=mXXJdWzWysKkQaMWPNtB3dJwWNl7dSEuqk4VPl623QBiLTkjGcGrg4dW
 OiZwRTUNHqybRkMlnpvNr2SrhpJYyL1m0XQjslRzbKkLIhHsP1LDijcd7
 H/dOT9tKdkw/ccgTSsOe9zgf1IaW+0BgTQ57yzmdmvzA0I8TtcT6vMcL1 s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 08:47:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:38 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:36 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/7] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
Date: Mon, 27 Jun 2022 08:46:59 -0700
Message-ID: <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGnosH3rSsXy

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Current implementation of the pmbus core driver treats the read request
for page 255 as invalid request and sets the invalid command bit (bit 7)
in the STATUS_CML register. As per the PMBus specification it is a valid
request.

Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE,
on the page 58:
  "Setting the PAGE to FFh means that all subsequent comands are to be
   applied to all outputs.

   Some commands, such as READ_TEMPERATURE, may use a common sensor but
   be available on all pages of a device. Such implementations are the
   decision of each device manufacturer or are specified in a PMBus
   Application Profile. Consult the manufacturer's documents or the
   Application Profile Specification as needed."

For e.g.,
The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf

Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
Changes in v2:
* Fixed comment for a case of PB_ALL_PAGES. (Titus)
* Removed an error log printing when it handles PB_ALL_PAGES. (Jae)

 hw/i2c/pmbus_device.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a15e..749a33af827b 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -284,14 +284,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     /*
      * Reading from all pages will return the value from page 0,
-     * this is unspecified behaviour in general.
+     * means that all subsequent commands are to be applied to all output.
      */
     if (pmdev->page == PB_ALL_PAGES) {
         index = 0;
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: tried to read from all pages\n",
-                      __func__);
-        pmbus_cml_error(pmdev);
     } else if (pmdev->page > pmdev->num_pages - 1) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: page %d is out of range\n",
-- 
2.25.1

