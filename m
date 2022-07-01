Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp787159lft;
        Thu, 30 Jun 2022 17:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEUyhoO5r8MNDSs5RsW0P+QpLMNNJKVEvCE7UhvYITstctP1pgyhnoUp6X23PjO0wlxR59
X-Received: by 2002:a25:d612:0:b0:669:b4e1:30ba with SMTP id n18-20020a25d612000000b00669b4e130bamr12372732ybg.266.1656634576007;
        Thu, 30 Jun 2022 17:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656634576; cv=none;
        d=google.com; s=arc-20160816;
        b=GXgTD+ZJALZq9iDVeAMcK5ktuThC19/YcEacycMBJOrTD2nS1yO8ZQJdukqzKzbR9t
         /zj3kVmQ77HZV/R9VgcPYDVqR+qg6RyWOvCRxvIh7at5vciIHrFGelWSwlFNbNuZZj7h
         BjP+eZLpkm2OSuCZhAe6dFez40VO1cw67q4OY01ZqEQSdC2LWp6N6zaKmgziTzlbqplW
         oOxRyzmJ2/f8v5ejyHMSUWND7wvvZbc4bXRCcg4P7pdnJyZdQ81mNwiY6zHYzBQRq2yJ
         654tXqhqlhWXbCfM+h46VWsTz85XQDAAIeVO479hVGZIuAMwvDAzzgl4uCBuoCYLRVUY
         LXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=WgRF832mxtsO2HIGsQBlm7tzmiB8PvIafaBhDX2DjLM=;
        b=0N/WxUWeBurF6a9chyTsrGDzRdS4OfogFuVi6JAb6xbIIOYDrPOMT/1dOlxhai36XT
         5u1QhkD9uTvRYlrxJZBtYAUTvPLnVrTg9RCDfk929ZdGmZ6bof3A0z1kkuhYVEsa2DcW
         c0gfUP1ygMKx34OatauvTmvJeuLLmgcN8oDqZM/foT4IWvtjRIHWRGlilrXBP/5dmOv7
         sFpd6jlXPIdNNx1/bfjuCkyO750vzfKOc2EVSN5iSBtl18roZFth1s55JHW1kHSme5IO
         XIFsfpBjFkdHGNhAXJ7/MwDC9dEqNarbCy9GbTKzoZKtv3fohvyLU6MAymschDLEI+2p
         KhgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=Qv1GuCwG;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=ETvkZblP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b189-20020a2534c6000000b0066d4b9c8b8bsi10466177yba.581.2022.06.30.17.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 17:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=Qv1GuCwG;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=ETvkZblP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o74KV-0003oK-EM
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 20:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74Ba-0006f6-2d; Thu, 30 Jun 2022 20:07:02 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:57119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74BA-0001Jl-ST; Thu, 30 Jun 2022 20:06:48 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 674362B05A01;
 Thu, 30 Jun 2022 20:06:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 20:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656633991; x=1656637591; bh=Wg
 RF832mxtsO2HIGsQBlm7tzmiB8PvIafaBhDX2DjLM=; b=Qv1GuCwGKDHxzaSo4c
 fKfVMb7uWeT08jfCjEgGTfr4ouH3DaFbkFUIjsUKFgqVEbXbYv8rqxy01vet5rQU
 2fzzhjLDybc58PxZzEoXbPOD1aynmUgbl6sscwRS8SMOw1ci64Nj43j++c/Aguy1
 2H2HFYbCtKlJXzlRo3tdWw7VM/DFpj+D9eOk0vHHSnOJ1zMRGJwQ8EhTBD4ysUYq
 fyGxS61Iet7pWzy8w0hR58lRJw5h6IDN3Z/BfG+m0Ed3FiyEVN5ebvGjXoqPo6rp
 39iqW13OuAhlwUV+GvynmqQyGsAlB01ABO10MUr4cy8jYXDGX601+V3NmJbYmGxC
 HNmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656633991; x=1656637591; bh=WgR
 F832mxtsO2HIGsQBlm7tzmiB8PvIafaBhDX2DjLM=; b=ETvkZblP6wzgWnTKVB2
 E51x5jEhGg1liuQJaTWEWnZYufHQzgHoznWRiGxLx3koOvnElwQoSxyxy4AlzLH8
 682e6t3Nrgr6ipbYQTdDaz9U6r5NSxVgTjhvKCTksKHM4VKuiudz+0ediD5DNwV0
 BBtN0PrOejq9anst5Aozag3qUH8w1lm9gvPGk3CFKdPrENZtai75/djeORtpT+4f
 /iBeptdrZIpiQXY9h9flw0UsYELSRQMMHGfXv2l7nYYxwm+eeibXnvOOuVC5gQJn
 ihyROVMJOh45VLroGeKd4cZ9sFy6nyyB6kYnYneSKNNZQtPYiFzi9wUzaXX/U7bB
 XQg==
X-ME-Sender: <xms:hzq-Yue-K9QINNyjXdtjidJQVJ0AHA8cdHCWc_7N7hAj6a2b46Dzow>
 <xme:hzq-YoPuDTtRIiYjnQmWpLWdpZ1EkbmaALwIpY9xsaLsZcWyfRSDEZympcCN99QNv
 OPkbSMES126b68P_-I>
X-ME-Received: <xmr:hzq-YviXXBuH8defOUyVCOMArkRagaCTAWdDXZZjLgZgQ6rTAsXZRyhJlz2aOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:hzq-Yr_weERrfPo1eNSlZCrdcFvRaMZNMP1C3RiuyfVR689tr5ja3Q>
 <xmx:hzq-YqvfIZ4QlwxOiF1ufOb2zUtrfoKPexynEWOBXzXfJBC3wKRnjg>
 <xmx:hzq-YiF66r9r6D2uxJBMQdshCt5RjcVLci1UzpJHGYwgkgx99C3x7g>
 <xmx:hzq-Yj4Xy7FBzKh_0GO852_U3MkqlDQtaH4jSxrqbakeUbKAradzowm30wg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:06:31 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, clg@kaod.org, titusr@google.com, qemu-arm@nongnu.org
Subject: [PATCH 1/3] hw/i2c/pmbus: Add idle state to return 0xff's
Date: Thu, 30 Jun 2022 17:06:24 -0700
Message-Id: <20220701000626.77395-2-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701000626.77395-1-me@pjd.dev>
References: <20220701000626.77395-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=me@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: AfaB0BWvC9Vm

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 9 +++++++++
 include/hw/i2c/pmbus_device.h | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a1..f89fea65f3 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -261,6 +261,11 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+void pmbus_idle(PMBusDevice *pmdev)
+{
+    pmdev->code = PMBUS_IDLE_STATE;
+}
+
 /* assert the status_cml error upon receipt of malformed command */
 static void pmbus_cml_error(PMBusDevice *pmdev)
 {
@@ -984,6 +989,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_IDLE_STATE:
+        pmbus_send8(pmdev, PMBUS_ERR_BYTE);
+        break;
+
     case PMBUS_CLEAR_FAULTS:              /* Send Byte */
     case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
     case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 0f4d6b3fad..93f5d57c9d 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -155,6 +155,7 @@ enum pmbus_registers {
     PMBUS_MFR_MAX_TEMP_1            = 0xC0, /* R/W word */
     PMBUS_MFR_MAX_TEMP_2            = 0xC1, /* R/W word */
     PMBUS_MFR_MAX_TEMP_3            = 0xC2, /* R/W word */
+    PMBUS_IDLE_STATE                = 0xFF,
 };
 
 /* STATUS_WORD */
@@ -527,6 +528,12 @@ int pmbus_page_config(PMBusDevice *pmdev, uint8_t page_index, uint64_t flags);
  */
 void pmbus_check_limits(PMBusDevice *pmdev);
 
+/**
+ * Enter an idle state where only the PMBUS_ERR_BYTE will be returned
+ * indefinitely until a new command is issued.
+ */
+void pmbus_idle(PMBusDevice *pmdev);
+
 extern const VMStateDescription vmstate_pmbus_device;
 
 #define VMSTATE_PMBUS_DEVICE(_field, _state) {                       \
-- 
2.37.0

