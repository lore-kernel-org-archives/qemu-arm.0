Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10119535lff;
        Fri, 17 Jan 2020 09:53:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxcTW43MZWFVS2MA7aeAD7TokoXcXY67LaT3UcilWCo9Oz1Kb8CsveFq2ikCCxfWJSIy52s
X-Received: by 2002:a05:6214:bc5:: with SMTP id ff5mr8832408qvb.31.1579283593606;
        Fri, 17 Jan 2020 09:53:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579283593; cv=none;
        d=google.com; s=arc-20160816;
        b=qx3Ye4smaO3kJEPiBzDGHGNf4SibkEoV0QIq8sgoJD6HV2rSEfEOxvcHl/S5j3LVhf
         8qoYhp71j4aW026CYgHRavjtpZLYiy8skPnd79TizAVdJQhSWeHStE0pwivaPr7BEeF5
         e5/qCvlXZcQNLt0WgCXrbgdmSz3zB7Ekuvh/thUUY1zFHoM4VKNpifvdoHQfCSMuNp7n
         w7VelCaPgu8+tnsCBpOsMApRYbqusNBNmoPGgBztI0XCaMli6hoZFSgovh1LrUEvgC3q
         lXYaH7RGOAlUuP8JBfsnvjWAwFaJwcdTHdj6dD3fcmbodm/VPRHsiZMpJdNtBF7OR4Gg
         0m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=rfZK6f0P/M2o7DyT+klLSfhB7SJ2LY0hMYqYaCeerqg=;
        b=KoG2U2wxvNwYloGf4rdK81lP9KXqKQ1EOE9Gi7nwqXczLZUq5UrGa7nn9iOMXcx21w
         A/l0c3MaOhJBgMV9kH44LQR3CuQjbIPcKB3hZVslac+tjiKB9aMUhzgHg7r64lYmBKnq
         14I34Kvz4WmOnnTKHDbc/daKv9zaasQDn3yHd5uLGAYWEGMMXKtu6oFb1L/LWXXFSJEH
         HOWqjhXvvv0H5AyFNcibv7epefklOyXorkwkGrmG6npwVJazQzHKSVyhpzKYuQvKgtIk
         5ZJy/dPyoTW/y7NRXyYXth4cAc4bW/26s2V61I9s/ZiDhAYfbBcuqHV6RaXcy9FQpwlW
         ju+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si15670429qkm.233.2020.01.17.09.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:53:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isVo0-0001N8-Qa
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViG-0002YH-Aw
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:47:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViE-0007uk-Vp
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:47:16 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2742 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isViE-0007sI-LM; Fri, 17 Jan 2020 12:47:14 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D8FA28F48DA91834DA0B;
 Sat, 18 Jan 2020 01:47:11 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 18 Jan 2020 01:47:00 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
Date: Fri, 17 Jan 2020 17:45:22 +0000
Message-ID: <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LA/18hZR4pgL

Since we now have both pc-dimm and nvdimm support, update
test_acpi_virt_tcg_memhp() to include those.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/data/acpi/virt/NFIT.memhp | 0
 tests/data/acpi/virt/SSDT.memhp | 0
 tests/qtest/bios-tables-test.c  | 9 +++++++--
 3 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 tests/data/acpi/virt/NFIT.memhp
 create mode 100644 tests/data/acpi/virt/SSDT.memhp

diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/virt/NFIT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f1ac2d7e96..695d2e7fac 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -913,12 +913,17 @@ static void test_acpi_virt_tcg_memhp(void)
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


