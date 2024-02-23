Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp434323ejf;
        Fri, 23 Feb 2024 00:45:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbbYKXAjgN7un2sIajlwP75maDaDRFgELUkmN4SnSL6fmNUdPSuESCKakAQiYqkl3xpi+g6/BaU/7ZpYdaMR7roS2jyAHE
X-Google-Smtp-Source: AGHT+IGhZevN5WR6vUzrAwl0tyCaUlgZf7t3dHoi/NQ5jsY7j4iNk2oFB2eyrZWV1NL27I1CWLFq
X-Received: by 2002:a05:620a:a56:b0:787:1c2f:b12e with SMTP id j22-20020a05620a0a5600b007871c2fb12emr1594132qka.50.1708677923930;
        Fri, 23 Feb 2024 00:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677923; cv=none;
        d=google.com; s=arc-20160816;
        b=ejxx4cz1jYmoUI1NNIsUrD29A5JQ7gw4CE3Foa/wnnK8bIrsmDTReMp8YUs9gY0z1Z
         yPpdpfHOTrsCNwvYKxo+C9iBdp54SOf0D2j0866OLeNnwAGof7CX5WzohEXXPSSHms1q
         kHzrsoreU0mESCYDW6AEiJJI6dzUlbn37g4cHqtONpnvx0fMWqsM8M93xtoiLNJdgrqu
         cvp/6B2yuRrZQ8SVX7zdurrbyHyh/987icZVGDBCVj1y3EZUpmmoOfdBG0rMLSluSWtS
         yvm4uK7K87EER/9wUWUGXgvIPUzUCWxwSLoCJfVijknoalKNqj1lS0uUoAuUxhXt3puU
         CQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZWhSB7+qPJu5+8w77LSVJQYIT5XGtz12hTByDsW6CpQ=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=FLE7FeDWRrsDTPUfwDZvLrLmqXDJMELSwjgy5sH969SXPPLLOG105yc4gV7mvNHuOf
         5QMP0BJYAN+p8495awt+4WUMkUmRvHLBFFHl7BDZEZ5y3iYouGJuAxT7yZBYtIgPwd1E
         2NyfOSYS5f/8d4LaJYHk5z8uQFKcAURGjT2oP9bY7nwnnLFGvhN3s12rASL32zuBsckx
         iHNO0Q6w7GUl2OBVxeffnKEbZB0+vhrgFJMSReQW5/zLHNz8f4+h12V5y7JkbuEpWsX9
         LTnNiMzljJ967vQycJNAfWz6M/NDNwG7zSkGoTdjHIa1E0Dnsih1DQydbILg2u/ssJKg
         ge+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Czhk255J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qj18-20020a05620a881200b0078791072564si4619954qkn.215.2024.02.23.00.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Czhk255J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdR9b-0003Hg-7r; Fri, 23 Feb 2024 03:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9a-0003HI-7q; Fri, 23 Feb 2024 03:43:34 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9Y-000050-KV; Fri, 23 Feb 2024 03:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677813; x=1740213813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vXMvs1cSNIKepRdMS6u3iCUNAtDkq5tZ/DJExY7Ps00=;
 b=Czhk255JDjFy1wi7jmydhAj6VVVVy/enBElULpp5ZPXlKuq5sdRBZXn1
 T8G5cQnHlqi3fLRiZcYOZTyvAU55QYzLEbNi1+F39uHEri7T3sVy742+m
 TBo3pyIyt81Q28hugmj0CS6bANpELJatdR8/53L5mMv7bBtuwQ7oPV4HR
 Mpuj1JrvbhE+NNkaJW4jZxlqJa8XBtbJO2ZSHYx+mfA59kZcnBnN5nBws
 5g+wllIk782XTU4/yaMgv35tn10ibS/HWkLx2M8P53cMOFeDKNtazxZKW
 2B/lao3yWgyGzzGfCYNJGkBze3haY1a68Co8d2Pzqg2y3f5a8aalOQRst A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413824"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731774"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:27 -0800
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
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 2/7] hw/display/macfb: Fix missing ERRP_GUARD() in
 macfb_nubus_realize()
Date: Fri, 23 Feb 2024 16:56:48 +0800
Message-Id: <20240223085653.1255438-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.198.163.7;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
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
X-TUID: 8nJHpStM1w1Y

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, dereferencing @errp requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
* - It must not be dereferenced, because it may be null.
...
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.
*
* Using it when it's not needed is safe, but please avoid cluttering
* the source with useless code.

But in macfb_nubus_realize(), @errp is dereferenced without
ERRP_GUARD():

ndc->parent_realize(dev, errp);
if (*errp) {
    return;
}

Here we check *errp, because the ndc->parent_realize(), as a
DeviceClass.realize() callback, returns void. And since
macfb_nubus_realize(), also as a DeviceClass.realize(), doesn't get the
NULL @errp parameter, it hasn't triggered the bug that dereferencing the
NULL @errp.

To follow the requirement of @errp, add missing ERRP_GUARD() in
macfb_nubus_realize().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
v2:
 * Add the @errp dereference code in commit message to make review
   easier. (Markus)
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

