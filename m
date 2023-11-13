Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1595790ejc;
        Mon, 13 Nov 2023 12:15:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmU6xabUtd0tG3QXZMzyogkPlw61pHnY1FNyirWhxudSvkmJwTTGP79oFWGBI0EPvDi9d6
X-Received: by 2002:a05:600c:4706:b0:405:4a78:a892 with SMTP id v6-20020a05600c470600b004054a78a892mr5624941wmo.9.1699906524082;
        Mon, 13 Nov 2023 12:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699906524; cv=none;
        d=google.com; s=arc-20160816;
        b=CcSVbZaMTbFnMn6Pr7veSJ67gmFKFWaubqMc2NMxMbxWyzqN7jyC9EXs8sx2910ylR
         8Xp2UZb3SpYHDY89hsbGoRIfn6uxwNDAPUqfsL6k9qcJZdkP8DgNRsBVPtgpv+HzsUBf
         7f17Hr30ji36WvFpMRWmjmIsGAj2cmV84E+QVB4mXkza11S0Q3RgZmAY+bH6AJ9Q4AO1
         EkuVcxF2LE+sPUdQ+iWpHlW84P5K8gJS+u5Wle3bCX8LIbcI2pjTebESEjogZ+W5NOp2
         Uo/eag6TyPznL6E848dlzEmalCeNe4BwK+X8ZDOfbstCLm8FGNmp42ro9byCqYN4kDP+
         Ec6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ryxfQMdy3fjz64Dvp8mG6lXS7u4zzCgxWbvC1apt6+E=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=TfXIto2GgqXGQYARJXhDsWxnvBEjVFuZHGPEfXHzGHGUnF331nGkuC95o5UItXhUq0
         kqK8lP9kcy0H520ZJmiOSnfeZwFNALvaS6LhYFzJ3alKy/0bNg+OnuKTO10sOYHn0ETP
         Kh7Jnhmkd1zqTPt3tnYxX4OzXeShanKE872SjId5tQ+vGF8cktU05GIFDMYirIj50PHo
         eovVYgOuD/2cFop5wq5ov7qVieKUiUTTT98KfS93T1seZNF79HQOcFxwT2zo0feljuyj
         kvgUJnjcT3vq8/pMJSq05M8HWaSnLED/ucNSJWHOXTRCGu35tnc9kEWXxznL3VRBCj3e
         CScw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 17-20020a05600c22d100b00404783410f1si7012054wmg.170.2023.11.13.12.15.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STgYj0ggkz6K6BH;
	Tue, 14 Nov 2023 04:11:37 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.147.128) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 20:15:06 +0000
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: [PATCH V7 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Mon, 13 Nov 2023 20:12:36 +0000
Message-ID: <20231113201236.30668-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.147.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 7WDmedPS7ZxJ

GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
and non-hotplug events like system power down event. Each of these can be
selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
the CPU hotplug event.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
index 0bd3f9399f..3acd6fcd8b 100644
--- a/docs/specs/acpi_hw_reduced_hotplug.rst
+++ b/docs/specs/acpi_hw_reduced_hotplug.rst
@@ -64,7 +64,8 @@ GED IO interface (4 byte access)
        0: Memory hotplug event
        1: System power down event
        2: NVDIMM hotplug event
-    3-31: Reserved
+       3: CPU hotplug event
+    4-31: Reserved
 
 **write_access:**
 
-- 
2.34.1
