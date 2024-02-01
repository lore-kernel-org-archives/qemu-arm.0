Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp81734ejb;
        Thu, 1 Feb 2024 00:28:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwC6OwsLtd6NGhYW2FZeKCEQTy3Nie68b3bR+ygqeNcqY8Q98jEPqyf6ke3qXQg5qoBjvr
X-Received: by 2002:ac8:5848:0:b0:42b:e844:bac7 with SMTP id h8-20020ac85848000000b0042be844bac7mr4658900qth.38.1706776137914;
        Thu, 01 Feb 2024 00:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776137; cv=none;
        d=google.com; s=arc-20160816;
        b=ypZiNkSz6k7BsIwuI8EtfcUd3meAepG41HKGXdr4mqGOi006BBqcg8ku+uKat4PJTL
         wT7QoFxlzSgc5bCTELFK/VQMEZumGPi9RZSWjjAZdLeSf8sEn9MXaA2zIpHvX4FfWpTY
         KqBzhR7uRYA2J8jb7NZZP9hVygk+H56rDu1XJSq/0IZGilc14D5Mo2SDHUWJQkpA+1/l
         zLIIWSn2nvrw0Oi7x5rPMI+hNyM88ePo+HcktWtduLumWr1nLiQy6IU/4GZa75yKX8ah
         BiivhNvpEsROxQKfobNU7I31NZzurk6yRKa5cRZeJcjc09KD2Bueo+17b1ntu9IaLTyJ
         ZduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q6vMwmmJfFaShAPp3RCj5vei1n1om+RSiiIB78mLPFE=;
        fh=kKUiDtao+xWP4sKcPlqdQ8apQyzQJlMa3iqjTQQqMwo=;
        b=Ug2X+SrOqVEHgAq44M3tqd2imCTwfLtvpgfrIHXduPzrdX6lI67bLOkisBaU4yp0ff
         GSLP/15++ZJkVkfjnD0Zt/fB3bYnbxmXMlFosm04YgxtQpXkwojo8qYa0LNRgw1puUxh
         +VvWLRgmPLkwMirdKDaiR8B9TdK92PGILzu9ssBgxeVo1rK7a3d6bZ58C/yTtI5YgAiH
         A+Fmbx96Onaupqm0+BpOTBcWmaAxP4gVnz12HFsGTFxAs8XuzAJ7kUx6ZDZeeFqTb0LL
         Ereuh/jdVJZjNrHQm31S0N7Q18yxpIl8GfWemhb8i41XzUQHta6xzRbnNZGEj5QrkXB8
         AxfA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nyYEBvgR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
X-Forwarded-Encrypted: i=0; AJvYcCXwPiN2Yrk9zF2U3w+zN9KteAAV4r7co88neqWnlAEQnJCUhAzdQjlsga60dp2Xnx5z/iHBBp4HzJTrINoiE4IaBb3Y/RNO
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22-20020ac85816000000b0042a9def3b7fsi9140775qtg.162.2024.02.01.00.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:28:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nyYEBvgR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSQ6-0005Nb-NV; Thu, 01 Feb 2024 03:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPq-0005GV-AQ; Thu, 01 Feb 2024 03:27:22 -0500
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPo-0005Ds-Cb; Thu, 01 Feb 2024 03:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706776040; x=1738312040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3taYolv4+Y3PUEeNEfgnrG/dw1ve6fm/GDhYPCuP8Q=;
 b=nyYEBvgRpAFKKMq+TQPUK3zh+hzse6XfhskPSka8T6O1+IXNo2W7pGPZ
 0fJbAFs95+9G0vw8wqru1F/p4nLxxMXnUNHUHy2ueUhKo0XFANmhiCXAa
 pgmFw+0x4BaKtmmtnOHlCRQSmbcpg6S6nrz23pcqOOsfbfpS5XmTXjQxJ
 1TKMnkbSGij67TxKcvZJ9sy/KQ9/xQlyzArOqFUAC7lRhztBatrN1tLjk
 CrTvXYZlL62xezEP+TV9p3bTEG46feWD30n2nYK5IVU6Id+PM/Zty49cQ
 TUWWEs7QLQr6MjaI99o59PeOYDGTCW6CZXm1Ku3tbFvRMsT2n+7Tmt0nC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468077704"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468077704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 00:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4348411"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 00:27:08 -0800
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
Subject: [PATCH 1/4] hw/isa/vt82c686: Consolidate the use of
 device_class_set_parent_realize()
Date: Thu,  1 Feb 2024 16:40:24 +0800
Message-Id: <20240201084027.345459-2-zhao1.liu@linux.intel.com>
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
X-TUID: GmWam7xYCqMy

From: Zhao Liu <zhao1.liu@intel.com>

Use device_class_set_parent_realize() to set parent realize() directly.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/isa/vt82c686.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d3e0f6d01fb6..a99eae4f6333 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -328,8 +328,8 @@ static void via_superio_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
 
-    sc->parent_realize = dc->realize;
-    dc->realize = via_superio_realize;
+    device_class_set_parent_realize(dc, via_superio_realize,
+                                    &sc->parent_realize);
 }
 
 static const TypeInfo via_superio_info = {
-- 
2.34.1

