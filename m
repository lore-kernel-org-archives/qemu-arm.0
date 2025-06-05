Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp141005njc;
        Thu, 5 Jun 2025 03:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgGB/HCcfUpLpb4ARNuGE+l4Xi0xuRoZfGigJL+i2+tQF48rfAs4qiDRSRNOsmOVWBC7yt4GW9BYtpiw==@linaro.org
X-Google-Smtp-Source: AGHT+IGDwSoFz+GEO9K35bJx6iOXIp+JkL1/GoclGBGSd7hEpAx6PAEPo6uZkWlLySOi5fXpWGS9
X-Received: by 2002:a05:620a:2724:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d2199a6d70mr899667985a.29.1749119300496;
        Thu, 05 Jun 2025 03:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749119300; cv=none;
        d=google.com; s=arc-20240605;
        b=M+zQ9CKlYq5ntrfjRnJpj2EGHlU0kv4JNC7QxdzTl8xdURJLh8d4ButVFPVkoO4nuQ
         l/jHJibDNbC029H3pIsU2OTnJXdrOUrgaHOkfeQeoQKjtZieymMrMLt/zqKFg583Zt6v
         9KDq49R9TVEt7al+twPXy4SD2doJiJKqLHuGqXktRp98Vvb8vDz3yEo0XlkQfgTErBXi
         x78/6oxK75bX3dh7bcBP5ZHpKP3k9GUT6W3BOCWZgfw7Mxcz1AgOx8+ohPg0jcVsJdG4
         bAwaHk/tqebDPu3aiXMNjwshUQGlBxw8MGsIoN+a+ypB3vfXtTdHy/OO8osycAOt7SR2
         S95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZfJxbdduxQdGwhLHpnHdVLqaRYOLMlkE/M1F7Y6IfO8=;
        fh=MioZsWtN3QkKZrxfgm4O7JlhTkq896zsTDkBuQtF/04=;
        b=k2u7HJTieheAVzKDJ1QJD/ocLSXcTfh081n3t/y+KDgkKLgGwHtlhiHVOTxbQxSUKR
         soVzk928jKxT0u7+jLvrBMvEKx+SYF2I+wI6yTH8wTAGDRAwFs/TF+mHlgcMFAob2fD2
         0ycr9OpqI7QtSYd5YHLOxS5X2U1RRIoH7L3UJXSiQvm3ZnVGbIkdhLNO/aE8WvJmRfta
         AGtEkMwRDBb0d/7kG5APM9ByCzUyVQEqZBNwSyzp8etIK5e2vxWzXDbowQf18GPAp2X6
         E8ajo7YlqYSr04W6uje5zBZnNZ8AqaOnJZLmKe8mJvlZp88Uq8zULi5bHZ6ZdjvD2XnY
         Ud4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CkqQBFD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a3076e2si1690564985a.585.2025.06.05.03.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 03:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=CkqQBFD9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN7os-0001fw-IS; Thu, 05 Jun 2025 06:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uN7oW-0001d6-Q5; Thu, 05 Jun 2025 06:27:15 -0400
Received: from mgamail.intel.com ([192.198.163.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uN7oT-00053b-18; Thu, 05 Jun 2025 06:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749119229; x=1780655229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2RgcNAyh8Op42/U8+549t8dUWlkwCOU4kvS+cCnxN4=;
 b=CkqQBFD9za19PgTbLRwvvhgofVkpLSo3/hUK9yq6gfItL4z3IT0bYYos
 foFkD8uQ6wsPEab2GuvgMZUcCt/NWKT9NnrroijhSqsoW8uAqObEl+MyL
 aMYuBnTOPn1bnWTEvfKSQxiWg6U6DVBQd4nBax3eGLsiAWSvCxfMNhMpo
 1uRchmUtLhta3DJEKLiQoekslTWLzb9HwNdny2hzvZO5W7Jp1Q3OMCWtz
 JPS+lxFU+U9KYE9+ATgoxKgPiLMVDQY+VwDAFbzzEBM+NVvqBTHlc6USE
 Xg0vt57ouS/CYWvhjT2p/2evvgXxZkxnAuM0bNmYPHDe0Y9b7yl//EkQg A==;
X-CSE-ConnectionGUID: dVCHt0yJTTu+96wTwuUORQ==
X-CSE-MsgGUID: 8W9Zt1/mT7mzv93CoxjNkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51325319"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="51325319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:27:07 -0700
X-CSE-ConnectionGUID: opKeQOCYSiuKI8tnfqbg4Q==
X-CSE-MsgGUID: 5WniYFFbQIKhRFw/j9kFXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145808659"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:27:03 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: chao.p.peng@intel.com, david@redhat.com,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v3 3/5] hw/gpio/aspeed: Fix definition of AspeedGPIOClass
Date: Thu,  5 Jun 2025 18:23:09 +0800
Message-Id: <20250605102311.148171-4-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605102311.148171-1-zhenzhong.duan@intel.com>
References: <20250605102311.148171-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.198.163.14;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QMVLUctqvlUo

AspeedGPIOClass's parent is SysBusDeviceClass rather than SysBusDevice.

Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
Closes: https://lists.gnu.org/archive/html/qemu-devel/2025-06/msg00586.html
Suggested-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 include/hw/gpio/aspeed_gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index e1e6c54333..e6b2fe71b5 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -70,7 +70,7 @@ typedef struct AspeedGPIOReg {
 } AspeedGPIOReg;
 
 struct AspeedGPIOClass {
-    SysBusDevice parent_obj;
+    SysBusDeviceClass parent_class;
     const GPIOSetProperties *props;
     uint32_t nr_gpio_pins;
     uint32_t nr_gpio_sets;
-- 
2.34.1

