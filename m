Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp81360ejb;
        Thu, 1 Feb 2024 00:27:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFldfAtLWaO01dOhIYzNvlcCZ1D/Js/NpYYdXRiAFtZjYFdbm7O2IbF+mhLlm4nZ+9hr2w
X-Received: by 2002:a05:6214:b07:b0:68c:803d:7cb4 with SMTP id u7-20020a0562140b0700b0068c803d7cb4mr167588qvj.2.1706776076734;
        Thu, 01 Feb 2024 00:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776076; cv=none;
        d=google.com; s=arc-20160816;
        b=yCJ0wjm008DEJsW1Xc6IU+FAl80GcJdvpBNI5TEu00zsdn5a3eH/if7cHPZjxldCfQ
         ltPErJQTZ3+UP69LhIKe0zzUs/Tx3WPD76Ibcnrq21HTbJ4i8j9389ZxQYKAdc+sOu4n
         7JX8LovjRW1k95bW67NKB9OhmIfchHt2E/84JeINyeycWZYJs/TZVjH8WuDLpkHGH4dk
         2HIUsXPfgnK4zlyJCTTcBenmFINjRjzstDMqPSwV3sEjKzbx/mn3zKR5MdKeYOjV4+9F
         XES/G1t5vab04S/dvUiYinm/XuEdq2ZnTnvw9RkfcX2Ki7JQ5OsToiuDN5WUG8dgfoAZ
         HSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IVTe2wBYyHPizEWzQITvRGX68qTfLXu8NnSp4hgtCzQ=;
        fh=O5uvZuhqNBOGudHIfqIHMIcmnJ75kRDzFnQjF16zcRU=;
        b=T877gX5OvSR3QJ9yBu5b/6YSYd3YO01asOgiOEO7egJUnTAk05AojkyxlNZsNBPhuU
         8tg1TQw2KAQe+ty4USIOLCg/w4gla2EtLGyUmUO8ddt4nj/5qjWLHWs2m7sRYykGcE/Y
         8eNN5MMR+onDAfcd7au1QiRPu5LIZhVVa4lUz9Vd9D1vaem5TE6BUL6e2Lsc2MbzSaAG
         p+kQgogdbd4Op9OOdH32ytA4rFFkjx3Sjv8VcW79OP3vgkA/dPZKObAFM0TUUlgnrvBh
         xIKpqyh8DuGBvFT4uBStbItEVBdCTi9J8+bBaaC3Gbr7Db48TaGCHa+8VBkgM1xxBu3b
         u1bA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=K2Jknt6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
X-Forwarded-Encrypted: i=0; AJvYcCU64ExuDqxKqQv99nKf99MxPH5AoZFtl9tQ1YsG89cVWCiVeXYWlzCeD0tSC6qh0R2JBcy6YzeigIbFZGE1u7YwgKtNl5yd
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu12-20020a056214234c00b00681549d0d71si14233956qvb.87.2024.02.01.00.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=K2Jknt6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSQD-0005RZ-KB; Thu, 01 Feb 2024 03:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPr-0005Hc-35; Thu, 01 Feb 2024 03:27:26 -0500
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPp-0005Fp-8w; Thu, 01 Feb 2024 03:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706776041; x=1738312041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dfciqPxL/AH0dsGMoETl0DkYoZU6V2u2WYz2kQeiFVs=;
 b=K2Jknt6jZZYH6ClPSp8iMrJuzgFVoqNlGGXOnoPnvMdDP8g20NbWsdwZ
 m1ENpCY82XcKyrx9c4rxLHADhVkiDXNu1wkmF+Q5oILrllFnMObAUKISF
 mlY7lATiLVkPl1HUuTtdI9YyT6oH+ucNTjtuBL+E9wHRGnM+87L6zCbAh
 IcLO1+dqgwOEsP08uiwiYMRZYSqNJwlf2tuLZPhzP/mQUAyD3AYXzjc0f
 NbzPJFGjoW0YJh3UDQjV7jD5djENAVODfONbvU8Ly3N2hPVv5IXKmm6L8
 QwxWXe+u5795c/P5Ij8x0++NT3JGU76FXNVSyMYwUvjd8L8utoQv+logd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468077718"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468077718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 00:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4348442"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 00:27:13 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 2/4] hw/isa/pc87312: Consolidate the use of
 device_class_set_parent_realize()
Date: Thu,  1 Feb 2024 16:40:25 +0800
Message-Id: <20240201084027.345459-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
References: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 73EcAAQJZCBy

From: Zhao Liu <zhao1.liu@intel.com>

Use device_class_set_parent_realize() to set parent realize() directly.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/isa/pc87312.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index ee23f3e164df..64dd17b537f2 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -338,10 +338,10 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
-    sc->parent_realize = dc->realize;
-    dc->realize = pc87312_realize;
     dc->reset = pc87312_reset;
     dc->vmsd = &vmstate_pc87312;
+    device_class_set_parent_realize(dc, pc87312_realize,
+                                    &sc->parent_realize);
     device_class_set_props(dc, pc87312_properties);
 
     sc->parallel = (ISASuperIOFuncs){
-- 
2.34.1

