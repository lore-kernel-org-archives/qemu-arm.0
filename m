Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5074557lfm;
        Tue, 21 Apr 2020 06:09:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypK94q/zgfCyqyw5ikI2FMSBqhfv8R/nwIwRjKtmqEXxdBQ4pUCYWnO+IMu8av1VnfuY88iS
X-Received: by 2002:ac8:6ecd:: with SMTP id f13mr11905336qtv.114.1587474579256;
        Tue, 21 Apr 2020 06:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587474579; cv=none;
        d=google.com; s=arc-20160816;
        b=RSO3+C/UdlswRuQgHWoAKiM5V4kWtA5oiY6NkvWipRuO5C2ty9HtfJcNENHJEBJgfT
         wTLK8vRxyprMcavwZREtHUXjL0ecoLmbnb93e2Ac3LUpj9Ds6rkMkErnKlDMUptx7p3J
         ngcnvqLWpUfvhwJxcltgyJiu8y3q1eOuHHOEThRVs4CsiNcl5FcLvip01ebY3W02tq/r
         TpavQxUmgyCwv9rHVj2ESALAW97GgAxDXZob8JPQORlHP245oQ1yfSU6pKV2PkDkPDBa
         XsK851Z1jyUJmZlmi+sVRpJK8viBUMivfaz3LcU1g31l7xj2l/obqdjjJDjMsLsBj7sp
         bUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=64eVOvdowa4s41BFJxJSnN7CGkBFuv/ENiobqpdNKp8=;
        b=sZAB3ULjXx1GsqQVuZ18PLFXm3t0Hks1QurSve2Gw+hY8XWaVpRcZXFgHXwcUZFZFJ
         GWEO9VSMaOuZszHS1SQaMzLu6VY5rhAslfBrc1PcGfccpjcaK7DBwG2Ua2wey61AYx6Q
         UtPfLzmmA2jwaNqJWBvGu1ZNTvCtWnwxfh+aocsVb30OPylKpA5mZmDq9KFOpYKUwrq1
         0Stv67+tAES0vmzTRXixakE3RKu+jmOf7EfTapDeulQjkFsF/kkiwMSPWPhTGhkg35Oa
         w9bx4rFEtVC0QNhTB1yB7v54ISs0cRZ1Go6uWX1HCaMO8bPUqQccBfSpKvAEzyfa9wq9
         9LIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si1363986qvg.111.2020.04.21.06.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQseg-0002yM-My
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXo-0008G6-B6
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXn-0002aR-Lo
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3746 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXm-0002Ts-Vk; Tue, 21 Apr 2020 09:02:31 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6B51891478F0633F30F5;
 Tue, 21 Apr 2020 21:02:24 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.91.160) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 21:02:13 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v4 6/7] bios-tables-test: test pc-dimm and nvdimm coldplug for
 arm/virt
Date: Tue, 21 Apr 2020 13:59:33 +0100
Message-ID: <20200421125934.14952-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
References: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.91.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 09:02:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 45.249.212.191
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 prime.zeng@hisilicon.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pa05FM1Boxdt

Since we now have both pc-dimm and nvdimm support, update
test_acpi_virt_tcg_memhp() to include those.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
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


