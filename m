Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp443269dyc;
        Thu, 3 Jul 2025 03:43:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzVzDdncRn2Wc1LJ2fPUB//3fVMdeqXXXZIMprLBuS7dAkG8T6+HucugX2t3liqHfZlHFqxfSwVUxpjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJun70JnMF3pM1OF7h4aIXSm5xBNQEStHFQJ/vztVVRndg6n13YnHZijaJC4n2w87a9SIk
X-Received: by 2002:a05:600c:3b07:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-454a3704fd2mr60741275e9.19.1751539398807;
        Thu, 03 Jul 2025 03:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751539398; cv=none;
        d=google.com; s=arc-20240605;
        b=BILHU2vCdOnDX40pVpnjkgf8rqQtCmwY2cEaAHc+cYy3+X45ORwRCCNlR9JPHiWULi
         ZYJ6sdn6Ef7AHWvb8VXLAb9ft/hnIKiPjBVWcux8FC6oB6iBkS0VqXhqSOFVHIAAI/sb
         gMG0N5M9K3hVm4Ix/nRt8+QGYSh82rjz0RQoSGE/CR2YhfQ9K1DSjV7NbrgW65DPY1Xf
         PIWbZR956cvscGhegGroD8+5cJqbccn7Z5rgRSBUlf6LVpYUecKSEyUmmJnOkhUZOQEi
         s+zmQwY1s8j+ngWznaujXUM5ot6hRMplmKPcB4cuNTC5KhNrB1mXSDJbQmmvtedjBtAO
         Vicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SKyi422gzyoyfqtz5pueDHHdsOm73GvInI8j3nzEzhY=;
        fh=2OWm8s7qWlCZ9oKfEpMPigkCh0wt4LR/kIjLb0p9Pkg=;
        b=aB8AGzYrJ9rxw7NhPXX3n/LeuNwTSPVw7pxz8G3kGcBVXAYjEl2s9kuxcMPs4DcXny
         ONaEv7TU1wUSkmkI9eZUtaABDI0099FdbFyBVZybpWW7TKpReojtkugSu5wBr6ARkDp2
         MIqiIKnXaDZAuefrqEU+uCY41X9ZjEtHYZiZ5VMVU2Cs9FCGP6X4JO9Uim9Le15wlozm
         YB3OcoGm+liI64UBz5sxcu8XE4uZLS+iEK9NZFaJ6lvm+g8NmD+b70pHMJj77QoVf31V
         JJiUfKqEQgF8O54hVRI7zhL21pZYQrWIpEren+vOksFdUVX7mhvmij1muPIaSrnFJfzs
         /P4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-454ae54d2a4si5872065e9.77.2025.07.03.03.43.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXtcq2rM9z6M4hb;
	Thu,  3 Jul 2025 18:42:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FDDC1402EE;
	Thu,  3 Jul 2025 18:43:16 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 12:43:15 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>,
	<mst@redhat.com>, Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v17 4/5] docs/cxl: Add an arm/virt example.
Date: Thu, 3 Jul 2025 11:41:09 +0100
Message-ID: <20250703104110.992379-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
References: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: DIQLzrl35P54

Only add one very simple example as all the i386/pc examples will work
for arm/virt with a change to appropriate executable and appropriate
standard launch line for arm/virt. Note that max cpu is used to
ensure we have plenty of physical address space.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v17: Tag from Eric plus expanded on the intro text for the arm example.
---
 docs/system/devices/cxl.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index e307caf3f8..ca15a0da1c 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -384,6 +384,17 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
   -device cxl-type3,bus=swport3,persistent-memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,sn=0x4 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
 
+A simple arm/virt example featuring a single direct connected CXL Type 3
+Volatile Memory device::
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
