Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1991196ejb;
        Wed, 21 Feb 2024 07:31:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1u1Jpf9iR4DLvZCDnsm7HTpIuWZE4mHPXrCdTxGfCj+Irzi/ZKUjFCGn+2abtuwwIf6qwjZ/mpu4OLoTOryy6WjC73Vy3
X-Google-Smtp-Source: AGHT+IFKp5m5K/WzJpv+LwIkqs10y/uvBR/VRCAWF/u/EwUznEYm6tkkN+gcSBtQ9xYnxBNtXgtV
X-Received: by 2002:ac8:6ec6:0:b0:42d:d010:edb7 with SMTP id f6-20020ac86ec6000000b0042dd010edb7mr16798939qtv.28.1708529478215;
        Wed, 21 Feb 2024 07:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529478; cv=none;
        d=google.com; s=arc-20160816;
        b=iaw+aKiRmBVY/qiacGEyFsFtQSPIMn/bJyS7LhguvhrRyk4hqe4ugH/xda0ECfMFH/
         0rW+MX75pGxyg8zYDu/ArZEXgqPBRtZj83yOfJacJa9DwJI2Zbp+eKBbxE13Wn7YKyAR
         rMrzw2VodEyLv/QgxHXh2TR0euEs7EER9M84WpeIyVHvfv7ScvUi0CWPkG5/7ovr/54p
         AJqXLOkXuC7Ljgfq1wjD5vLs7JpQNiBw5XaOnRg4BRCYgd9I0q9jV59ue5siPqWyKSOC
         UyFzveC1gcT3K86Nrb6WnFB7MakixqypHTQO6mTQzqMPFsS03LUGkEKaGS//a9lQWhP+
         IYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l4RJ7wxbTVXJwbEP0PNxd3GceM9wcaK8PacZBwzPKZE=;
        fh=+pN+adOfj/Uj5T0Q5e2iLNDTjc6H0b5DJs2vk+l2vdY=;
        b=lPMi3DTePO5WCipJGbrsTfNyFRY+mT400CwrWoEp/Zw45oYD7VQl7O3NToSd+gtwLu
         XownLFIircgdk+0ka/RD6/kD5NOEKMrmsC4qNYwa6zYbOvZxVx3K5rF8NB7LeH6fTj3d
         ++utedAQSUcCN0ydMmKV4a+S+SzO3gMlQLCMGS5WvNuAfWBy4fJm2MgiqRdol53lfwa1
         q/OHUpGusLStV0okkC5ox82TpQ09FJD2/cKKatwrnRDv5PNFAqR5w31vTppGN1paWMHe
         yy7QR8kIeWaWIwi4qEueC2OybrH+A2qR5zIy3cWBuMOG0VJxTxSAs7zCAH0t1YBGjEEX
         C2NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="YgxNC/bg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb26-20020a05622a1b1a00b0042dc8b61500si12020735qtb.349.2024.02.21.07.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="YgxNC/bg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoUV-00033N-5g; Wed, 21 Feb 2024 10:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoNJ-0001hh-IJ; Wed, 21 Feb 2024 10:19:09 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcivJ-0003QN-TL; Wed, 21 Feb 2024 04:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507794; x=1740043794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XiQ/HbQz6vM8OKlU2Z+p1K0FZs1RQXcxipd8cRAsJiw=;
 b=YgxNC/bgqCBX4oZ+cT9jTFz4dtVtp0/vhqsmqBMDLna/qQCpA8VcEG2k
 yJI3zigGXtNB2uonQaPfuXjKbCrQZ3YrzzpwDulrO95PIzbOSZscTNXAa
 YY59/Vt1PFbZmanJNfvp4iFnRwDQQaJhQLN3QMVidbMxRuYYK7cEtsnVP
 8G3SLydXKvd2zsXE4pZE/8V7hZ0DUNXu7OlRI9DTQOyZfyWDKcIX53lkP
 yuSlBZygFlX2L/8psI15KZeNH8w/EM8q4sjRPweo8fcChwStBzbx9KzG2
 s3I4ngXb7hzyHTnreNTaKAP90ssahIe0DSViz4oqdZhD7La/ORrVu4/rF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2795451"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2795451"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9720034"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 01:29:48 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 2/6] hw/display/macfb: Fix missing ERRP_GUARD() in
 macfb_nubus_realize()
Date: Wed, 21 Feb 2024 17:43:13 +0800
Message-Id: <20240221094317.994454-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.198.163.15;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6y51QimZM0P1

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, dereferencing @errp requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
* - It must not be dereferenced, because it may be null.
* - It should not be passed to error_prepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.
*
* Using it when it's not needed is safe, but please avoid cluttering
* the source with useless code.

Currently, since macfb_nubus_realize() - as a DeviceClass.realize()
method - doesn't get the NULL errp parameter, it doesn't trigger the
dereference issue.

To follow the requirement of errp, add missing ERRP_GUARD() in
macfb_nubus_realize().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
 hw/display/macfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 418e99c8e18e..1ace341a0ff4 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -714,6 +714,7 @@ static void macfb_nubus_set_irq(void *opaque, int n, int level)
 
 static void macfb_nubus_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     NubusDevice *nd = NUBUS_DEVICE(dev);
     MacfbNubusState *s = NUBUS_MACFB(dev);
     MacfbNubusDeviceClass *ndc = NUBUS_MACFB_GET_CLASS(dev);
-- 
2.34.1

