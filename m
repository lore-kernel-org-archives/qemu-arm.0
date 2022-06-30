Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp261487lft;
        Thu, 30 Jun 2022 04:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUzOiwQfTZ2YB6yZzR25qHz6bfHUfsfJHETYqeYELnodpQFFBoGLp0AWeaRmz4IYgWPq+B
X-Received: by 2002:ac8:5808:0:b0:31b:ef47:38b3 with SMTP id g8-20020ac85808000000b0031bef4738b3mr6787435qtg.510.1656589092546;
        Thu, 30 Jun 2022 04:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656589092; cv=none;
        d=google.com; s=arc-20160816;
        b=jC6a8FnJNOfBjKV45p6TOlaTYR+EQM3J3hXRTBge9LLoMdCRunHzKSUAy9GRStjV+C
         uh5vmN1JJkEP0zj+nXKC2ShaXCpG4XBRMPOj8Z6Ecq1tfZkJP0bGAbq+WSN7jcLvdW1b
         Yh7JoUAXdPoo3Q0Qh2OUxYeaUt4ZInP4LoF8QWWMKc0gQJBuSCAtIQts+6pjkbF8bC8f
         TfqPzfMZuoz3xqyBQXO7Hfbz+DF55WG0gIPAmihwxZYjRGVJmQDdYVXPn63IyZsZ9yCb
         QmxH0r2+NMAUjeH9yR/U+CWWcfPuZ9csKK0995MUySvvz/5RkkuCqkauGJm8zcHIhqvW
         cs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0qgjKyg4UK3nvuNddYz1FaM6R7JuEdjn0y7qkLZHvuY=;
        b=gOZI003eGdoqN5Z3kP6tCNSbUQdN479qDeLkTLnGHXjlAgL0qPBmfojpz/SsEC0p3+
         IwObYqSXYnHfaLy5+dTz0akJdZotCcHU3CE4LyqPfl7HPKsVSC7O8Wl854A2U1MVYlwZ
         +n/8EH6JJRLDe5TMkzCdcDVjxN/tfkYyZwW020aYFHAV7m2obdber29nPrqY1SbdwljP
         zitQE/GWWBm3BVNSan8Fdmw7Js3r791eQ/7l53pfztRnvz06GMYH0nNUTQfvXSIBU3Lf
         GnpF/YlFehTFtNY+gEN3szidL6lMcE9jNldzQLeWCgHDKKm0jjqz6YynwM+ELVYV9/27
         /4uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18-20020a05620a415200b006af18a4d33fsi9386494qko.14.2022.06.30.04.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sUu-0002wm-1n
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sID-0008UL-OK; Thu, 30 Jun 2022 07:25:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI7-00024n-Nv; Thu, 30 Jun 2022 07:25:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbG4m2bz4xXD;
 Thu, 30 Jun 2022 21:24:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbD0FM9z4xD5;
 Thu, 30 Jun 2022 21:24:55 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/27] hw/i2c: pmbus: Page #255 is valid page for read requests.
Date: Thu, 30 Jun 2022 13:23:59 +0200
Message-Id: <20220630112411.1474431-16-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: dNFBfQFcC6hR

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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
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
2.35.3

