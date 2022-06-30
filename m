Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp35572lft;
        Wed, 29 Jun 2022 21:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPchOFOqh2Khe2DfsXN1mY3yKU8nGGBYKgLTvxF150a/4RLD556tSGICqi6H+SLURDlrQM
X-Received: by 2002:a05:6214:1c8c:b0:46e:15b2:3f35 with SMTP id ib12-20020a0562141c8c00b0046e15b23f35mr11236507qvb.76.1656565141949;
        Wed, 29 Jun 2022 21:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656565141; cv=none;
        d=google.com; s=arc-20160816;
        b=OwmoNM3MhaXrvFbQQIu5TGnMPQ9ys6yD0I/r5zik5JN/q+YZwezEkcMp8S4EEsVjV5
         uugqslazWO/zA30DoGNOawfL/PMkwqOf65c2p191j9HS3OBNCvn0PPviuHnSmfBt8LeC
         xIXCY9Qlzj1Tq9AmolDB9mrRM0oBNiKKMLGp/aHcKhKTF3cd7lT2hlKZk0Jdl7mgRTa6
         RA3Uybrke02sylUZ6tSfvyacKexLF3qrtSwu4KAPGLtkskfiP37EUfrHGe/Naaw7SHzP
         tRdQD8AWKZLLTe90H/BVTj9JXj5fTLEjoiqJhVKw8jjXrHxcEKVjW3ZR+SPq6ckRUPQV
         IutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=sEvjyt0EBlESwbx6CJZ+DDaJi5U0I5O9A/TDMndZAPg=;
        b=0ip25p2yWnXWpO7ogj0lQ6LH4UPKgBbUhDwJ8QxsnKobZsldn4NgkbMURCVlhmY218
         StvgPulUFYUQn2dn6TD9Bft9fEIsdSU3RCjcOe5dJKwOjMN/UkGzoMdCp85bnFqLx6Kl
         FEMEhNuJKdkKzkJPaa+io4ERbbEhmJc638HneiyTa/Q2XYkTzBOoyS6+6QUOHKu9cTW2
         4e6+WB5eevcrIs0uNg0pXtx7KAIOKAu5Kw4LAo1l/g0XKiiyg1U+1n2MCo2FDrOa3bX9
         qr2/ugmBZBYXC2Bq3DLCOHiZwgk8bfEATEchn+O8FCTAmB+5G7fm4EBzBfA6B3nzJruy
         MEsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=taQqsiIv;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=XsVcxrfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15-20020ac8598f000000b00316cc5b2e9fsi10763794qte.8.2022.06.29.21.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 21:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=taQqsiIv;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=XsVcxrfX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6mGb-0006y6-E2
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9x-0003EH-E0; Thu, 30 Jun 2022 00:52:09 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:45451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9s-00071g-Nq; Thu, 30 Jun 2022 00:52:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5CDFC2B058D5;
 Thu, 30 Jun 2022 00:52:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 00:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564721; x=1656568321; bh=sE
 vjyt0EBlESwbx6CJZ+DDaJi5U0I5O9A/TDMndZAPg=; b=taQqsiIvFovBsz0f7d
 1IAEERviwjt2FThnOSOGXI3cTJe4c4NU7Kh2VF5HidJz2g69O/6FByVmABDKelZo
 5gkKnhhjOjgG3JFtXTP6NLad41/5Q3KB8Azdn3H1dKzq+0Sz2mH5g9tGyERQ4lLt
 4U8oGbc0kTNz7ZGJwHDd2hkixAEGvwrEAMD6DWsNdoqg0xfgk6wEKD/mab6BlVZ6
 NI/UzSYA4tNnyyCLV4sph6fckWeAfykokQEhDr8MmwecYTyj87QCw0tf6LB5DbMy
 MUqBKsHhlO5xJ5noQBEFh44WgCXlZ0Q/TyV0g3uOvALuk2UEwh1IzpT8kFSnMo1h
 IebQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564721; x=1656568321; bh=sEv
 jyt0EBlESwbx6CJZ+DDaJi5U0I5O9A/TDMndZAPg=; b=XsVcxrfXrZfGfFjC2Yd
 o+wmsMIVVo/qo0xUn0+TTy0gIsEf8qaTf4iDFnGeC36jVPaDiVw0ZWNMQ8zwspDB
 9VrzilbxsXOLsgCLNCH+v/dcwBTE3fiitLK3wqx5LvwzaFkf/b5SvkianG06Hy2D
 scBFjeJNypwO3/Ml7xpvBKPbkx7GaxiBxOhEVfKPPsSB391dhBYmGjQFTUxW7nlo
 SDvUE64qt8WDPxro6vL3b1SBXmgp05yOVl+tmUcKtTfiFZwaru330dgXitl/y+ta
 63kXsfyLNjkWt7J28M5JgFJCfcP0lItcqgdtpnbij6snAACs9aB62GzVtcTFIBXt
 hGw==
X-ME-Sender: <xms:8Su9YoC16T3oBIja2JQQCcHwPVlFp9Jqo2z9B07LcTC9r3TRI2TzUQ>
 <xme:8Su9Yqhjie8taqNSDNZNt0kC5WgJyzyS44BTI0zLtK41cmXfSDaHRwDCrDN8tGwuF
 9hwNXWbv1uFnMEMG9c>
X-ME-Received: <xmr:8Su9Yrm2SPPFzlWOJGWyT2QJuBcXFDKAaiqPgRXZQpBk_7NviI9w7UsWefxlyUXRBZXMjiWMMpzvqAHkLQC7Mtoc6ajiXWYJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:8Su9Yuxujw9PWtYGyyqKO5Qj36IcEcubIarTQZKWDquKPlAavB-M9A>
 <xmx:8Su9YtQGjqN989LxNJeypDHCaEiVlBNJfaaiYodRUTQ-wTiKGQZptA>
 <xmx:8Su9Ypb88eHe_ui-OmQOUMNYTmdxsn0fL4AURPuKGh2iyrxo6ESc8w>
 <xmx:8Su9YoG_ZrpN-0zcHSwzvfBUz4PI01yOmo2CqKu-hY9p6so0XOUODIzNOCY>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:01 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 08/14] hw/i2c/pmbus: Add idle state to return 0xff's
Date: Wed, 29 Jun 2022 21:51:27 -0700
Message-Id: <20220630045133.32251-9-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hLj9SCamdNPj

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
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

