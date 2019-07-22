Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6987493wrv;
        Mon, 22 Jul 2019 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkFzNmqoOKFZa6eW9RjG8vEoPFmc0pYiduQOAHfPImQMJH2o46dpyehmWF0vg1+h0VXXEC
X-Received: by 2002:a17:906:4e8f:: with SMTP id v15mr52655811eju.47.1563807137256;
        Mon, 22 Jul 2019 07:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563807137; cv=none;
        d=google.com; s=arc-20160816;
        b=CQJFGnH/A8wF8msWh7RBUr0AyDUWj3qX/lh2KRGoK5+hlKdPEt1vGEKcJDjh9A4rr8
         UzHfyct1g7cA9XVVOcYtlP7INQaXv4nofu8aBrx3nVl96rxLJz0DfuhL6dr6ipQNGKWQ
         zma+PgRFj8V8T5DSNjl8ZyaB14eYmPEF81r7yCt0/uTglX/p228fMeWrGKoWYGG8n6zk
         E2uG7UOqglPkKBEeCt2QWLkTCcY9XeR5E2ESQklLuR5TQIUkIdKGhnABmg5cfFLIm/0E
         gLdwbmJsV5yP3WpxTFB0GIxjlllzZbhaTiuNQ1g9Nmn13TsK3EH4O5xNwLOv+WHC+IEL
         2pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=pis7jt8YtbIVE5LeqD7EbjdYNTXodoOwg6RfiRRvQTU=;
        b=iMvvunCwi5p9ySpZV7rXD7zg66JvZdUaVz0cmdCvYLzDWEBNkYvA5r/ZZDXf1czygq
         mjDojxHvvjCMFa41rWzfNzDjRlMqosPdSa75QHvpsUiG68bqUEE169T/dL82/DKmKg0C
         GenrP0/7MlcJhzCx2DirrKfgE8CFfMDIYdw0yd/nqRfeyTx/q9VTudS3lz+z/3HaAtii
         +w5/hCxSHI8wC0ALXdRy3Zo/XRNAOd9WEcUVvNDm0ytPKeSLEMR1rHiHyPaEQyeI+Fxp
         lcyhF1Ds4XrRtNVPF7w094TAo8hLg/lJfalHJ4oRuNxsEuCCztS6sLM++DvfpWc0Cf7T
         akTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si4122713eju.317.2019.07.22.07.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 07:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpZfk-0006Gh-3j
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 10:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZff-0006GZ-CV
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 10:52:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZfd-0006Y4-Ux
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 10:52:11 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45427 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hpZfd-0006Wh-MT; Mon, 22 Jul 2019 10:52:09 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id A9DC7F5A38973C54E288;
 Mon, 22 Jul 2019 15:52:06 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.132]) by
 lhreml704-cah.china.huawei.com ([10.201.108.45]) with mapi id 14.03.0415.000; 
 Mon, 22 Jul 2019 15:51:59 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH-for-4.2 v7 10/10] tests: Update DSDT ACPI
 table for arm/virt board with PCDIMM related changes
Thread-Index: AQHVPWqzRM4xLYQgEESkRt3zEbbqr6bWtTVQ
Date: Mon, 22 Jul 2019 14:51:59 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F310B0C@lhreml524-mbs.china.huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-11-shameerali.kolothum.thodi@huawei.com>
 <20190718151315.2c1d3aff@redhat.com>
In-Reply-To: <20190718151315.2c1d3aff@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v7 10/10] tests: Update
 DSDT ACPI table for arm/virt board with PCDIMM related changes
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6i9X176x7xA5

Hi Igor,

> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> u.org] On Behalf Of Igor Mammedov
> Sent: 18 July 2019 14:13
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> shannon.zhaosl@gmail.com; ard.biesheuvel@linaro.org;
> qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: Re: [Qemu-devel] [PATCH-for-4.2 v7 10/10] tests: Update DSDT ACP=
I
> table for arm/virt board with PCDIMM related changes
>=20
> On Tue, 16 Jul 2019 16:38:16 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > PCDIMM hotplug addition updated the DSDT. Update the reference table.
>=20
> it's not correct process. series should be merged through Michael's pci b=
ranch
> and see
> commit ab50f22309a17c772c51931940596e707c200739 (mst/pci)
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Tue May 21 17:38:47 2019 -0400
>=20
>     bios-tables-test: add diff allowed list
>=20
> how to request table update.

Ok. Just to confirm, this means I can probably add the below diff to patch =
#6 and
remove this patch(10/10) from the series.=20

diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test=
-allowed-diff.h
index dfb8523c8b..7b4adbc822 100644
--- a/tests/bios-tables-test-allowed-diff.h
+++ b/tests/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT",

>=20
> Another thing:
> bios-tables-test has test_acpi_tcg_dimm_pxm() test case,
> pls make use of it to test arm/virt variant

I had a go with this, but has found an issue with this.

This is what I added in order to run the dimm_pxm test.

- - 8- -

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index a356ac3489..79af4f4874 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -871,6 +871,36 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
=20
+static void test_acpi_virt_tcg_dimm_pxm(void)
+{
+    test_data data =3D {
+        .machine =3D "virt",
+        .accel =3D "tcg",
+        .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
+        .cd =3D "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.=
qcow2",
+        .ram_start =3D 0x40000000ULL,
+        .scan_len =3D 128ULL * 1024 * 1024,
+    };
+
+    data.variant =3D ".dimmpxm";
+    test_acpi_one(" -cpu cortex-a57"
+                  " -smp 4"
+                  " -m 512M,slots=3D3,maxmem=3D2G"
+                  " -object memory-backend-ram,id=3Dram0,size=3D128M"
+                  " -object memory-backend-ram,id=3Dram1,size=3D128M"
+                  " -object memory-backend-ram,id=3Dram2,size=3D128M"
+                  " -object memory-backend-ram,id=3Dram3,size=3D128M"
+                  " -numa node,memdev=3Dram0,nodeid=3D0"
+                  " -numa node,memdev=3Dram1,nodeid=3D1"
+                  " -numa node,memdev=3Dram2,nodeid=3D2"
+                  " -numa node,memdev=3Dram3,nodeid=3D3"
+                  " -object memory-backend-ram,id=3Dram4,size=3D1G"
+                  " -device pc-dimm,id=3Ddimm0,memdev=3Dram4,node=3D0",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data =3D {
@@ -917,6 +947,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
     } else if (strcmp(arch, "aarch64") =3D=3D 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+        qtest_add_func("acpi/virt/dimmpxm", test_acpi_virt_tcg_dimm_pxm);
     }
     ret =3D g_test_run();
     boot_sector_cleanup(disk);

- - 8- -

Then used the script to generate the acpi tables and "make check" runs fine=
.

But when I changed the memory configuration to,

test_acpi_one(" -cpu cortex-a57"
            " -smp 4"
            " -m 256M,slots=3D3,maxmem=3D2G"
            " -object memory-backend-ram,id=3Dram0,size=3D64M"
            " -object memory-backend-ram,id=3Dram1,size=3D64M"
            " -object memory-backend-ram,id=3Dram2,size=3D64M"
            " -object memory-backend-ram,id=3Dram3,size=3D64M"
            " -numa node,memdev=3Dram0,nodeid=3D0"
            " -numa node,memdev=3Dram1,nodeid=3D1"
            " -numa node,memdev=3Dram2,nodeid=3D2"
            " -numa node,memdev=3Dram3,nodeid=3D3"
            " -object memory-backend-ram,id=3Dram4,size=3D1G"
            " -device pc-dimm,id=3Ddimm0,memdev=3Dram4,node=3D0",
            &data);

"make check" gets stuck at,

  CC      tests/bios-tables-test.o
  LINK    tests/bios-tables-test
  TEST    check-qtest-aarch64: tests/numa-test
  TEST    check-qtest-aarch64: tests/boot-serial-test
  TEST    check-qtest-aarch64: tests/migration-test
  TEST    check-qtest-aarch64: tests/bios-tables-test -->stuck here.

But if I use the same memory configuration and run the qemu guest independe=
ntly
it boots fine.

./qemu-system-aarch64 -machine virt,accel=3Dtcg \
-cpu cortex-a57 \
-nographic -smp 4 \
-bios QEMU_EFI_Release.fd \
-kernel Image_5.2rc2 \
-drive if=3Dnone,file=3Dubuntu-est-5.0,id=3Dfs \
-device virtio-blk-device,drive=3Dfs \
-m 256M,slots=3D3,maxmem=3D2G \
-object memory-backend-ram,id=3Dram0,size=3D64M \
-object memory-backend-ram,id=3Dram1,size=3D64M \
-object memory-backend-ram,id=3Dram2,size=3D64M \
-object memory-backend-ram,id=3Dram3,size=3D64M \
-numa node,memdev=3Dram0,nodeid=3D0 \
-numa node,memdev=3Dram1,nodeid=3D1 \
-numa node,memdev=3Dram2,nodeid=3D2 \
-numa node,memdev=3Dram3,nodeid=3D3 \
-object memory-backend-ram,id=3Dram4,size=3D1G \
-device pc-dimm,id=3Ddimm1,memdev=3Dram4,node=3D0 \
-append "console=3DttyAMA0 root=3D/dev/vda rw acpi=3Dforce"
=20
root@ubuntu:~# numactl -H
available: 4 nodes (0-3)
node 0 cpus: 0
node 0 size: 1067 MB
node 0 free: 1015 MB
node 1 cpus: 1
node 1 size: 44 MB
node 1 free: 5 MB
node 2 cpus: 2
node 2 size: 63 MB
node 2 free: 24 MB
node 3 cpus: 3
node 3 size: 63 MB
node 3 free: 31 MB
node distances:
node   0   1   2   3=20
  0:  10  20  20  20=20
  1:  20  10  20  20=20
  2:  20  20  10  20=20
  3:  20  20  20  10=20
root@ubuntu:~#

I am not sure why "make check" hangs with 64M size!.=20
Please take a look and let me know if I missed anything obvious here.

Thanks,
Shameer
