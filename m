Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp433978ejf;
        Fri, 23 Feb 2024 00:44:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV38uAoIacbSEtMpp7E/+TrmrrcfU8wEwNydXeACgmap/iaJsOIfpoJxeLKafOAq+lfmgVz0iYNim0AF/s6AoRCowaaB60F
X-Google-Smtp-Source: AGHT+IG6XLXxpAse9qbad4hXRe+RC48RF0Fnv9i6UZUrLShc0TBAyUfspAng+FHxtfriaucXmK/k
X-Received: by 2002:ac8:5e52:0:b0:42d:ad3f:6c3f with SMTP id i18-20020ac85e52000000b0042dad3f6c3fmr1846671qtx.49.1708677867835;
        Fri, 23 Feb 2024 00:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677867; cv=none;
        d=google.com; s=arc-20160816;
        b=KxhuGs0IUFtvFs7F6VF0/Y1IzjZ+tpTMRQl6JMXwhepd+VZdxg6tQuryTwB66R0nZR
         Nb6AbbNDoL8awy1IU5MYUFFZu77y5UuUQFl/O2EWZcK1n1aIWQ9mPmTyGdlY6Wd92Hmo
         RF0O2ITSMsjDRCXrJqybJkfV30nTv3CoRiw+Pa190ioZU27nJxeir4pIeEQvPHHTnZ12
         rQUizRoxhscNV4ZihxvI4lQp9vlhoCJMeWAzzTltGgDTBDaiREb4gTQXDAadzaFxT+Lj
         ti0a8KBamXlRlrbwpwsGRnR+sOS3xa3V5iiQa0QreqQbi0BlkJmyT9zCj7c/E8pmF5/o
         CVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O3eMcOY5hSz/Ip/PhGBn4sRZOEG9NbboarseVlbK3Vw=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=O1MZmty0TLM1Ey2EYtL3T/x14kyrx7M0J0ZZJ9pebqAjNYye4psfNvNS7fe551EiWf
         zjkAQIbUD2MA0gemuV8jg7h0wShI0OJJrFh7ImRN1r8/yLtRGo2VbizPfCK6YLG97DzN
         wSEGKFxA1YJfVuv//UGmGPNptP+YI4Exts7Cciasw9EueUso3s5kYsqWpvk7asCnwMoe
         uwzGywAX2r9WRA6hKUy7iidBIenMTtM9a0A8m7/cG8lqKArkaMlQaUH8lOgUQ/7JIQS8
         +53Nru0y+AVu9CUWlBly/EjBjXNsxgguUgtjZgsZ2PUmedcMaVXMLlyzgTQDeJxCBoyS
         bu3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LYrd125r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21-20020ac85395000000b0042c6f5c5470si14521036qtp.248.2024.02.23.00.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LYrd125r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdRA4-0003n8-G0; Fri, 23 Feb 2024 03:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdRA0-0003la-KT; Fri, 23 Feb 2024 03:44:02 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9x-0000Bk-Of; Fri, 23 Feb 2024 03:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677838; x=1740213838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6V97dsmp4JAIBUgFfbzez7o/O5Yd5Mg3yF5DrdVp9Q8=;
 b=LYrd125rsjKyo0dRsUoemLhJvyaK3IWVEPDBc2rHoGT41XIGRwguXNGk
 Taw62Er00YbS6vD9IjBJkScFRxptQS2lyZPjq0V8mVEi9gX9fRsT9Kn/J
 O2XVmx4CaULHmjncOxu2g8MlFDP1leLcloei0xe5PNpf0ZCKzCVjJha6I
 +3puC3k2ls1oRCMqBgqaRn9150dAh2BfgXwP9WlAi3sv85WkMS4pV6//8
 fLtQEYkyyZya/yPSWrrI6JAUJ8a0SMnmpHuJr4N918ysvwqmWeNQRrwQy
 CFht5ncR+2bQNw1n65xlJjhCxt05gcbeNeeq2MASiG68HWcnEYNfzNabn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413893"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731867"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:44 -0800
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
Subject: [PATCH v2 6/7] hw/vfio/iommufd: Fix missing ERRP_GUARD() in
 iommufd_cdev_getfd()
Date: Fri, 23 Feb 2024 16:56:52 +0800
Message-Id: <20240223085653.1255438-7-zhao1.liu@linux.intel.com>
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
X-TUID: hYa9M1HSazVx

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

But in iommufd_cdev_getfd(), @errp is dereferenced without ERRP_GUARD():

if (*errp) {
    error_prepend(errp, VFIO_MSG_PREFIX, path);
}

Currently, since vfio_attach_device() - the caller of
iommufd_cdev_getfd() - is always called in DeviceClass.realize() context
and doesn't get the NULL @errp parameter, iommufd_cdev_getfd()
hasn't triggered the bug that dereferencing the NULL @errp.

To follow the requirement of @errp, add missing ERRP_GUARD() in
iommufd_cdev_getfd().

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
 hw/vfio/iommufd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 9bfddc136089..7baf49e6ee9e 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -116,6 +116,7 @@ static void iommufd_cdev_unbind_and_disconnect(VFIODevice *vbasedev)
 
 static int iommufd_cdev_getfd(const char *sysfs_path, Error **errp)
 {
+    ERRP_GUARD();
     long int ret = -ENOTTY;
     char *path, *vfio_dev_path = NULL, *vfio_path = NULL;
     DIR *dir = NULL;
-- 
2.34.1

