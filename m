Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9054224wrx;
        Fri, 8 Mar 2019 18:32:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqHkUJzbNSpzstrLYzOPBAZMjoMlvzZH1Sn0zSHZregIoVN9VNxZgCp4dHkVDf6blwN/8d
X-Received: by 2002:a25:c886:: with SMTP id y128mr18937235ybf.250.1552098767450;
        Fri, 08 Mar 2019 18:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552098767; cv=none;
        d=google.com; s=arc-20160816;
        b=tItWcrtMrh7ew/vokWlOhnp6DJNCAuRjwMFPFU0DZuc9NVocpCq8sK8h0OG+MW7Zpw
         YyJ8+2awtwOk9vOOUSHUCyWIVD8+ksw95mwN/VmbAaThp5QLu8Ga7W7LokpS524ZX66v
         g27n2+bcVrdHwPgVzggWW+oI5XJLZBx608Fm1n5fEEki9E2iLDsX+tvxzDJyIBNCszMP
         G0XOuLClEh2MUakfvS+wXDbcbQ8/XDcBQEmG1e3EFX1Z3+JqN3LNkO9UOAQ7jiRD9Tks
         st7Xl/MKHeE3u4kEjggf7eKU8GiJhVk6SaLczCUcP+U09IPW62Np64l2GO77woL5CeAd
         4cNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=27tkCqf0VBYLr1e6toNxj18c4xjyX1bET2v7rj4wm+c=;
        b=lx1RPud7uyj3spvMwa00LShEqa1sNCc91sNLHmRQMtYiJ6sIQHFRe/srtRcSMsGCxe
         VLxpnUadrVev3xTlkrsI8Z86y98yvTW4jfOxEI7VeJzo7VTz3hzjE98ujTn5U6c58B27
         vs3orrs+0JqX4dF2ifSUKYtY3w3uTgC4O2qPebeCW47wKvHFg61plopdpCljxJWR4B0z
         yJtZBzJuPRDwyT0cn38kGhWt/u7C+AOFwJXnDCj4HY+aWe+onxXi1/FrN+Amsvl+XeTP
         5EqhBNvmULRGlOKvvwgWrleevkUxUoR2AdTRneSqnvE5HzTRkXKBTQvd4K/CbUMSjDuR
         OO0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si5468633ybk.389.2019.03.08.18.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 18:32:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Rn4-0000sK-Rr
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 21:32:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rmh-0000it-95
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rmg-0004yW-D6
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2190 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h2Rmg-0004wA-1f; Fri, 08 Mar 2019 21:32:22 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 2729DDAB198F1EED95D2;
	Sat,  9 Mar 2019 10:32:19 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.408.0; Sat, 9 Mar 2019 10:32:08 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Sat, 9 Mar 2019 10:30:48 +0800
Message-ID: <1552098649-28341-2-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 1/2] hw/arm/acpi: simplify AML bit and/or
 statement
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RdpihPLhl2f0

The last argument of AML bit and/or statement is the target variable,
so we don't need to use a NULL target and then an additional store
operation; using just aml_and() or aml_or() statement is enough.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e48..cebec4c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -265,17 +265,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
-                                aml_name("CTRL")));
+    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
+                              aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
-                                 aml_name("CDW1")));
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
+                              aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
-                                 aml_name("CDW1")));
+    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
+                              aml_name("CDW1")));
     aml_append(ifctx, ifctx1);
 
     aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
@@ -283,8 +283,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(method, ifctx);
 
     elsectx = aml_else();
-    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
-                                  aml_name("CDW1")));
+    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
+                               aml_name("CDW1")));
     aml_append(elsectx, aml_return(aml_arg(3)));
     aml_append(method, elsectx);
     aml_append(dev, method);
-- 
1.8.3.1

