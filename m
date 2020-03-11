Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1030467lfc;
        Wed, 11 Mar 2020 10:28:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvS2WNoYKGWLNYOsBJZMxIDb8FeMwWgS4W8AH/+PnWa5SPgE4tTtS3FNQQkHZ+Hhj7hIyGE
X-Received: by 2002:ae9:e8c6:: with SMTP id a189mr3751319qkg.361.1583947724995;
        Wed, 11 Mar 2020 10:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947724; cv=none;
        d=google.com; s=arc-20160816;
        b=SbbgxFn/cAIuB5DukPSuPVgmIta+dDofZYQ06u01B+7uCJnFwsBhuOdkp0ClBP5n8M
         AJbKT+RwizT6dOmHq5SQ2i2xEfoQp9SqUq0yajojgpEjw9lkM+uG0M8ycR3Q3loxwfJO
         nvuMPeoqThpmwoqZgE1wwDib2O2lFH4Ja+lT2Sb+2opmfw5Xuy/vmgJdSe8oKAhXInPm
         F28qmQu/ebTAjVI4OsDFIUmlLw20Mrmv50w1NzIBANI2jqX0WJVI8A571SJlB3ZQtI6h
         W/ebupS5y8M1YreGNDXaPFo+o2l/AaReZuAp9WwZgInyUI4vJVH//Fazsrf0nyKELn/I
         7hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=KmhgtwNZmdIpd6XQMRSn3EI4DR5SZ1IokNMKuW9YChw=;
        b=vZGBfO92AsSN4JvV8VH2MP+3XR2GYq4QKJNXLs0qQj2Bw3fy2+7coCp/EDIhULzR6m
         nZqTTIrcZtK8z7lp2beT6qKnVi2Uu58idDZ0KSX9lb2bvjlVQ9xjIjIIpnL07pdmJTMg
         JHojEsGi0me1+QkFBfuBki2xUKvGe/8C2R69jCYNp8jCBr5FgPwQXk5b5IrXgfbVw9aH
         u7j8HrT3AH50ZWbGeeaVybbgtVdkXm7f4r/DL4YrDuVXOs+T3U7o+kOzttZU+w1pMk9P
         moW5zt6pkt45B50AnRpSpp6a/8GuX7GO2Be7gqbpY1HYgnpcgxxHOsY+CGXGt3IetEZ5
         UwDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dj13si100005qvb.188.2020.03.11.10.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC59w-0003RL-Dj
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55P-0002mj-MB
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55N-0004UO-Lf
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 13:24:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:52090 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC55K-0004D2-5b; Wed, 11 Mar 2020 13:23:59 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E06B64BAE0408E864822;
 Thu, 12 Mar 2020 01:23:54 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:45 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 09/10] tests/bios-tables-test: Update arm/virt memhp test
Date: Wed, 11 Mar 2020 17:20:13 +0000
Message-ID: <20200311172014.33052-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m63tRx4QUvqn

Since we now have both pc-dimm and nvdimm support, update
test_acpi_virt_tcg_memhp() to include those.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v2 -> v3
 -Moved addition of empty table files to the previous patch
---
 tests/qtest/bios-tables-test.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a597bbacf..c9843829b3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -927,12 +927,17 @@ static void test_acpi_virt_tcg_memhp(void)
     };
 
     data.variant = ".memhp";
-    test_acpi_one(" -cpu cortex-a57"
+    test_acpi_one(" -machine nvdimm=on"
+                  " -cpu cortex-a57"
                   " -m 256M,slots=3,maxmem=1G"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -object memory-backend-ram,id=ram1,size=128M"
                   " -numa node,memdev=ram0 -numa node,memdev=ram1"
-                  " -numa dist,src=0,dst=1,val=21",
+                  " -numa dist,src=0,dst=1,val=21"
+                  " -object memory-backend-ram,id=ram2,size=128M"
+                  " -object memory-backend-ram,id=nvm0,size=128M"
+                  " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
+                  " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
                   &data);
 
     free_test_data(&data);
-- 
2.17.1


