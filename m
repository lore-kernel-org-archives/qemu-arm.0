Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp967317dyb;
        Wed, 25 Jun 2025 09:21:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdGE7p4lSo0kxS76usW0GVVD7plVwnRbjOr/H5w39DgkmkryEBZ2d4apzejfMOE9d0TE9XB+sszJPaZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5xWnA/zh6mPe1Q1D1tGN9xcIqJdI2NbRhXmxizkNvKwVYcxSkjPD5cHvH8ThtAsnhCU2n
X-Received: by 2002:a5d:5f02:0:b0:3a6:d2ae:82a with SMTP id ffacd0b85a97d-3a6ed66a4aamr2430061f8f.34.1750868493360;
        Wed, 25 Jun 2025 09:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750868493; cv=none;
        d=google.com; s=arc-20240605;
        b=LLHeu1Nmw2R8WgbEA5+dctf77zTJJMPu7FtaEv9qjXBHFUK33PkoqlGQX8pyZdNHq0
         0FpOmqhU8sEJVyO1RguXA9/hUnHi2as6xTw9zeGfSj+ajd9amux9OrLw9dIFlwMWJRP3
         uKb2D4V7Xom4x9qjh2YBwVIMlTDzxe2F09vCrCDnWrHG02VaKbPRyb+i6av6d88ubDgM
         GMiAeHvMMP3dbv3Syg49QxFzAZ6FZPtYShkle/+pFPWHnb+ohr2zh+DvCQrwVz3CKSG7
         KuQmkr3edR6/FQRlxbWxj4zq/p/ANNg1HU34dyxPk6flGdzbfkbNoc7vngGNRD/lbaHO
         Unwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=G3Y8Bn/tQrtq/YzcLoS42Rbi/Eq1K8RY/KrySEOWaME=;
        fh=XUvLIQQ+XauERGTJwKbaGPxk6m9WHQ9TdRLiHbw47Bs=;
        b=U1XBp8VrmfFoK1JSZ91OdWyV4Z79etUVm7qMaaQ1wZBp/6hsjILw8+DVAHyj1ylROY
         WG8iGRSsshK60vkL5vKtFODCa0SAn9zOua9fMpQBbhCj8OokuZjEfoMhW7qomv9YcxRh
         sAOS2Xp0QKJGOMFem/1Oi3fzwGpVszlV0yCJBF4bDjYEotdvHrzbiz9I+04uD5PeqWHQ
         meFUvTvMyboIApwZmDVQLG2gJFQF11N5cW5tL7ewy4Wfpdr/+03TqslO4bovhUPp72mP
         fuD0a0fmmPOql0OQTqXoE06cfOjsWS0SzUMXoYg3Sd3lcVb0WlxdLanNiYHZ5j7S0U5d
         XYiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80f293fsi3297247f8f.467.2025.06.25.09.21.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jun 2025 09:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS6W260p6z6M4YS;
	Thu, 26 Jun 2025 00:20:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B564314044F;
	Thu, 26 Jun 2025 00:21:32 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Jun 2025 18:21:32 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v16 4/5] docs/cxl: Add an arm/virt example.
Date: Wed, 25 Jun 2025 17:19:25 +0100
Message-ID: <20250625161926.549812-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: yU0JAO1R5YVQ

Only add one very simple example as all the i386/pc examples will work
for arm/virt with a change to appropriate executable and appropriate
standard launch line for arm/virt. Note that max cpu is used to
ensure we have plenty of physical address space.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 docs/system/devices/cxl.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index e307caf3f8..73e80e672f 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -384,6 +384,16 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
   -device cxl-type3,bus=swport3,persistent-memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,sn=0x4 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
 
+A simple arm/virt example::
+
+  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8g,slots=4 -cpu max -smp 4 \
+  ...
+  -object memory-backend-ram,id=vmem0,share=on,size=256M \
+  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
+  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
+  -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0 \
+  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
+
 Deprecations
 ------------
 
-- 
2.48.1
