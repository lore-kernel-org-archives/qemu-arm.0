Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1553955ejc;
        Mon, 11 Mar 2024 19:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQsZsaDSUBusPXNKwVbtpyvmB1G5i+1CH4ft1F62QSYFtOnJvPJ6KcLM5xMb5Ad2h4H/RGu/r6UrU71IiE4SsVyLYclEGQ
X-Google-Smtp-Source: AGHT+IHGpZ8RJAaB5ubkEQidB/uQO+QFM4f0ZO5f18bdu4jxBiDSHznXz2ATOPAsPP2lFtvlp2qG
X-Received: by 2002:aca:2b19:0:b0:3c2:35e7:6856 with SMTP id i25-20020aca2b19000000b003c235e76856mr8300143oik.29.1710208990324;
        Mon, 11 Mar 2024 19:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208990; cv=none;
        d=google.com; s=arc-20160816;
        b=twvdISDfmKGTvtxgYTwnYyKixioGBrFqwFwNYs4U453Jx+HisX03lxV8Kp3A3hCCKD
         44FvTnsEYqJEiYAy6zMJVsGRhBZKkC1oU7+gHXep0hNLsXJtLb13hLTiFzCHF6/tJdhD
         neKd/KTGvvpy2Dr0NfIik13mD4JH0Yu3B2PvnkPiazmS6ai+qStQwQZu0tGTk428vfof
         ejDS5NkxE5NB/Z9n0mxETmXOiZt6YEO2v8hMaS7uZGL4ymb0ANgPJIQFr8t/5D5B21GD
         sQeGw6lU97SoFE+9bz1+mpbtmzRE6g20I1k8t0DjkihJMgWWKBJVhlQL2DU2EFx1l8qy
         kYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=uBUJDLrGpdWmnp4ClXutksJ3WX3nuq0vvvTIEOir7yo=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=OZohKjUsMH8J+hpCZG1Nh2coB2x63q563ylugJ9D3K2GsTGAHF/8hG0uKzOO210KvU
         /NufrqC4L04QoQcLTzseYaTmBCLKCrfI1XbD2Cj0c95U8KjSyEJL4TmYqbgnYu9sj/Va
         gnsN2/0GkCP8UfZ1V8HjRwWrSboAEEogdd6+4A7eluqBFlyFHvAvGCmi7Fm4sQxieC64
         p9NQR87uwmKDPkc1tYmPZBX9o3rvL0tIJbI7q+GMPV3rulho0048+25B7NHyQ0gfuQ5C
         TsAWEkmgEijn3jv6Re0c5Lb1ieYFQDm2PK7+Ewr5XFJGpFnuOO77CTRjqV1LNBhY/4xR
         ghyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id p31-20020a634f5f000000b005dc504e597csi5962435pgl.513.2024.03.11.19.03.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TtxkF3GnGz6K6Xb;
	Tue, 12 Mar 2024 10:03:01 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F4361400C9;
	Tue, 12 Mar 2024 10:03:06 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:02:49 +0000
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
Subject: [PATCH V8 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit
Date: Tue, 12 Mar 2024 02:00:00 +0000
Message-ID: <20240312020000.12992-9-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: WWhfEjWQyyim

GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
and non-hotplug events like system power down event. Each of these can be
selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
the CPU hotplug event.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
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
