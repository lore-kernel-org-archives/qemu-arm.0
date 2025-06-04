Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4034910njh;
        Wed, 4 Jun 2025 04:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUwnpPTBqbLqmYuNhFoQE49CTmMHk1uBqOpVApl/kL5y4zTaY5qJNx+YcS/GwSWax9EItQ/Mb355+1Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IH1b2SSpisDknBxtPNqq2HBmE+XkSCUDVepky50q6qOdL5arbhdUoFgP3YHk2Ing1IqXck3
X-Received: by 2002:a05:622a:5a93:b0:4a4:2d6d:80a0 with SMTP id d75a77b69052e-4a59ae18427mr110426511cf.10.1749038337290;
        Wed, 04 Jun 2025 04:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749038337; cv=none;
        d=google.com; s=arc-20240605;
        b=kU3nN97N/DYwZmTx2yE4d4g5zg7P8J3ZG4KtDBDz2XzRMT5C5sKNKoQ2Bzchvacj8g
         gDiCeq6q9NEEAND3JNuCa4qatpG3LgWDQHqEt9Fewk6RfoW4f9bX8eFPsYpPc9Z3XUl1
         +oKYCSffBhafoe8yB3jrFKVOX7dXPdhpkSjvQ3bPjtpbRbNmKe+Vi1x6r+82Ej63eG9x
         yakpts6x8OutdyQCYtZaS8oFpKdNsfYOYKTEODHXg/H/mEgwrespMR/N10DV1zBmmBaz
         s2ePB2HaRROGySu9rNVTIj/0AHPoO/omLxE5dr7y4PkxuIs5hcJ01daodbK/uulsh5++
         59+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XNzJRorWiGwhPlzTHnODNzD2KpueHVGPXCDSVt1VsY0=;
        fh=n02WTADBUgImAGbr9pBdDpQy3cqJJIg+0ctmg4+ENqw=;
        b=dIpb58rB+VWXWpXpbaamxsYzAqlTdkSRyYL8OZvw9O4nGrXUZXopVax+oZsFmM0D0w
         dMtTEjRHB69B8iACt0XpNbn4fJlxx9GEB+sHP3ywO6EAhOMb04tTH8ThbDYyrrIb6atc
         aGX3EsXkDcVUAtCAI96z/sTnn/kcXl6BkMJGhqCY0yUoK7l210xDlh+RPrRkkJXq4ava
         eeWtW5geBp9peOCDEqItWpM9P43wJ8dCgcRbYNqR1fJ67ZrmEN/WSy3aUGkU9mFlm84D
         ru/839K31ipQRn8ouY4tOPO1w+l22IY9xcQY1u9efgEcVzR9cnVqmiayX+XJ6gzgtq0G
         XhnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="VCUMfYB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435a91c9esi148573531cf.599.2025.06.04.04.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 04:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="VCUMfYB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMmkr-0005D3-Lb; Wed, 04 Jun 2025 07:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uMmkq-0005Cl-N8; Wed, 04 Jun 2025 07:58:00 -0400
Received: from mgamail.intel.com ([198.175.65.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1uMmko-0000nv-Pp; Wed, 04 Jun 2025 07:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749038279; x=1780574279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjSCOf7F/bOSAtnrMFcFxs/bciMfBh4IH76ect/nfBs=;
 b=VCUMfYB/eZ35ySCWAXYCTqemqOhDZpDOyCRrcNYCCgMLH4WC067au2Ll
 Z+GdznJcVNTHV6aU+L20lEe6NXYyYInrEfUWpw13oqKDIKe55aqk4Zw5u
 B1NqIHD+mL/UyRX0otvd1H8jiSSOeS6ReznISiSNQ7zYfGhIdZdGif4nH
 F421UWWic2RDVkskbpgtm0g4Ji0Zr6Q6LbYwik+MRoZiAvpw85+hoD9rc
 o5vl9239vEORz9M7YPmTvkK/ZHiA0MIul8QwxiDTI6YN7yBQ9ihfhjDqA
 O56Us9V4/6/y1AfqwFCFpobKeHtW5AxpUbM7OguIGs8xsht/HnJTALQaP g==;
X-CSE-ConnectionGUID: iqWeSYXGQlCXBVIozUAjoA==
X-CSE-MsgGUID: Lhwj6X2mRu6+gTRbaZJSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54915371"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="54915371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:57:56 -0700
X-CSE-ConnectionGUID: jfduiF5jR6S5bzOkGEIZEQ==
X-CSE-MsgGUID: xIsgy2K3TUGO776OgypQ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150048307"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.127])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 04:57:53 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: chao.p.peng@intel.com, david@redhat.com,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2 3/5] hw/gpio/aspeed: Fix definition of AspeedGPIOClass
Date: Wed,  4 Jun 2025 19:53:58 +0800
Message-Id: <20250604115400.98905-4-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604115400.98905-1-zhenzhong.duan@intel.com>
References: <20250604115400.98905-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.175.65.14;
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
X-TUID: GkyU0Kt5FAiQ

AspeedGPIOClass's parent is SysBusDeviceClass rather than SysBusDevice.

Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
Suggested-by: David Hildenbrand <david@redhat.com>
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

