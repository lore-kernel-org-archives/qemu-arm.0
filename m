Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2308125lft;
        Wed, 22 Jun 2022 10:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzspK2CBvEnk4S0lAFVOl7pIIXtmOb0D9Yybbia7Xjx93r6MUiGa57ywEY7S0tC+nA2udQ
X-Received: by 2002:a05:620a:4016:b0:6a6:bef5:7b3f with SMTP id h22-20020a05620a401600b006a6bef57b3fmr3305410qko.608.1655919181305;
        Wed, 22 Jun 2022 10:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919181; cv=none;
        d=google.com; s=arc-20160816;
        b=CAVMY4xXxepJ20OuUkjV0fBXMZdbB7XSPdvTm1NjCHamii/G6w1mvJwHCqDH8T/+wS
         hpmSdO39o4r2uradbhX1n+XyYa/reO84Q6+kp/I7Eoq0wGGWRs6rsIW3Cfd+LNj1deEQ
         FtTImmxO9y8mwDMX3uEoRRlv2y6sC7q+myeAgqwWKZtYK1+FS/Ff7d0DbsyLsan2smwG
         6J2cNlsGlLpxVsCqJ44FR+CjMBLEChapolD6xCy/znsH/v2SKKkAyqpot1egL8+tYGGh
         4GldT1Ah6XQVsNvRrMG0FKrAczGYkOYaYKMXPug/MOIjsHpQ5gmxoKXG6HiOVz+bksac
         IbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Kfo21d2V2hZ6VkabDF3oziwAl/QVbs4icI4O1SqVqSU=;
        b=rMfIgGVmTe2r3A44kI/lQZ/oKDR63okN7WFOUZJE5X7Kd0DvVENe4fC10NBXBA+OUl
         qMv4TkwVKVpb3LzfLyF/1Spl8cGaANsyoSmRABw7Jg44CX8RNXxd75npyYbwHVFJLXlU
         MSbLh9B6P3hJrEOgIsmrQsUkxK3bJcPugJZnmsru5qG9ofpVN9bO5oq6Gmo0rLSaKiYe
         nKURBPAdrGu7aCNW2fAX6FW0/2IMCrh4qQwzVMLCttdPf0WWTwQzHwe3O/1NRfCcbbPh
         N2LAZmVIrvrp+gaKDkSXv2a4ZLKEaI+gOLlhlB5eiNugXOJYpuC4uDqu9op/slTcdhkX
         iO0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=nrsosTVT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020a05620a401500b006aed56fc14dsi3150019qko.339.2022.06.22.10.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=nrsosTVT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44Ds-0001sE-Ny
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Ae-0007KP-AB; Wed, 22 Jun 2022 13:29:40 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52156)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44AU-0000aZ-JK; Wed, 22 Jun 2022 13:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918970; x=1687454970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kfo21d2V2hZ6VkabDF3oziwAl/QVbs4icI4O1SqVqSU=;
 b=nrsosTVTjLnCNWl+57VKnr3odLRJGxX2IU7W/LTZTo3ou2TKlp9DoC/m
 LPXeOwSC/XGdiJD6UD5aRX7ZppV+zARKgul02aoJXZTyDELU8tMiKWrIe
 ER04Gl+0AtoD8tpEvGdMaqyCeDfIa+Gty7OqanAwjErfaH3lSQrGW4Krp g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 10:29:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:23 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:22 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 5/9] hw/i2c: pmbus: Page #255 is valid page for read requests.
Date: Wed, 22 Jun 2022 10:28:26 -0700
Message-ID: <20220622172830.101210-6-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
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
X-TUID: vEsVcA2IbsK4

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Current implementation of the pmbus core driver treats the read request
for page 255 as invalid request and sets the invalid command bit (bit 7) in the
STATUS_CML register. As per the PMBus specification it is a valid request.

Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE, on the page 58:
"Setting the PAGE to FFh means that all subsequent comands are to be applied to
 all outputs.

 Some commands, such as READ_TEMPERATURE, may use a common sensor but be
 available on all pages of a device.  Such implementations are the decision of
 each device manufacturer or are specified in a PMBus Application Profile. Consult
 the manufacturer's socuments or the Applicatin Profile Specification as needed."

For e.g.,
The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf

Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/i2c/pmbus_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a15e..7db3343a83b6 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -291,7 +291,6 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: tried to read from all pages\n",
                       __func__);
-        pmbus_cml_error(pmdev);
     } else if (pmdev->page > pmdev->num_pages - 1) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: page %d is out of range\n",
-- 
2.25.1

