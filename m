Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1084146wrp;
        Wed, 25 Sep 2019 10:36:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznOq3BxJdiUnhU+CWizKuBaK+A10Q8yR/SzMCJhytTk/Hpgse+5Ex3n2KqxIHkTQ0aXaM6
X-Received: by 2002:ac8:2bca:: with SMTP id n10mr519666qtn.242.1569433016641;
        Wed, 25 Sep 2019 10:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569433016; cv=none;
        d=google.com; s=arc-20160816;
        b=R5ezViKEe+/+aKOmiA0+4hSuxTtk9+kb/2BlLgQE2tb6RVPJP65WESKTsHdJtwTim6
         aPdd6GFMc9KB+E3dcwh8OS5g4jhAA1b6N4dBLv7+qs5jfgZl9upwl01eIq7e6VsyBlXq
         dXl2vU4Ph3GVmPrJVg1C7Udl9xY7VV7a2fJdkp2OzvRHLLo40GL0beDqXEtuawfETECq
         HwNsxURzo71/wCTRKPVz8MWNB8JwlF6FQs04/CMD7jOkKWrFFp6Xsj9fAO1NgPIoK7E5
         ST4fLQM7X9BuRRkFCKs7vlJ30/evBxPWpPgyFfvvuvI0WgABo7Dxj/5yaarIhQgy9y5J
         cNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=6sWW6DCm8SbQZHrzXZZPLKfqwTHCJ4oFYLy2F7Mfy9M=;
        b=E8iiEU9e/4UkybMu21djC0keeGcg7EVc8CyJ8MylKeb5qR9HNnQfdf3ipxeRqdO+b6
         seR/zqb8Fq5Z6iY8fOZeg7AHXEApECy2x37mqd6UXwJ0SlnlnmqAvI+uHtRzjtQrZNHS
         XNx6+xcylC5z+jXZsaYECPwL1b2XblWNZmg4RhB3k0qeF9U4S3QTrkU/M8vSAiY5iNie
         NEGWjbXI7qxNDCUEhjwLTj9769HIvhjMC1i6+A8w4j4NdXM+wJN2dwSsP4Ii8H9ivNww
         iTMKqosKIIeK+WV+eZ7BWVcFyX8cXxeV2eHH+E932iUkVmBt8JzNgeRKfAKy+ByFZP/a
         pumA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p184si4579776qkd.119.2019.09.25.10.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 10:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDBDj-0006yV-W8
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 13:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iDBDZ-0006ve-UI
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 13:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iDBDY-0007kD-8q
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 13:36:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iDBDY-0007jY-18; Wed, 25 Sep 2019 13:36:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AEBC518C8937;
 Wed, 25 Sep 2019 17:36:42 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C5E71001B07;
 Wed, 25 Sep 2019 17:36:31 +0000 (UTC)
Date: Wed, 25 Sep 2019 19:36:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-for-4.2 v11 11/11] tests: Add bios tests to arm/virt
Message-ID: <20190925193628.2267cfb5@Igors-MacBook-Pro>
In-Reply-To: <20190925112521-mutt-send-email-mst@kernel.org>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190918130633.4872-12-shameerali.kolothum.thodi@huawei.com>
 <20190925112521-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 25 Sep 2019 17:36:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 qemu-devel@nongnu.org, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 linuxarm@huawei.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 xuwei5@hisilicon.com, eric.auger@redhat.com, sebastien.boeuf@intel.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: elgyX1iQxZCL

On Wed, 25 Sep 2019 11:26:04 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Sep 18, 2019 at 02:06:33PM +0100, Shameer Kolothum wrote:
> > This adds numamem and memhp tests for arm/virt platform.
> > 
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v10-->v11
> > 
> > Added Igor's R-by.
> > 
> > In order to avoid "make check" failure, the files listed in patch #10
> > has to be added to tests/data/acpi/virt folder before this patch.
> 
> So you can just add empty stubs.

Wouldn't IASL choke on such files?

> 
> > ---
> >  tests/bios-tables-test.c | 49 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> > index 9b3d8b0d1b..6d9e2e41b0 100644
> > --- a/tests/bios-tables-test.c
> > +++ b/tests/bios-tables-test.c
> > @@ -870,6 +870,53 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
> >      test_acpi_tcg_dimm_pxm(MACHINE_PC);
> >  }
> >  
> > +static void test_acpi_virt_tcg_memhp(void)
> > +{
> > +    test_data data = {
> > +        .machine = "virt",
> > +        .accel = "tcg",
> > +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> > +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> > +        .ram_start = 0x40000000ULL,
> > +        .scan_len = 256ULL * 1024 * 1024,
> > +    };
> > +
> > +    data.variant = ".memhp";
> > +    test_acpi_one(" -cpu cortex-a57"
> > +                  " -m 256M,slots=3,maxmem=1G"
> > +                  " -object memory-backend-ram,id=ram0,size=128M"
> > +                  " -object memory-backend-ram,id=ram1,size=128M"
> > +                  " -numa node,memdev=ram0 -numa node,memdev=ram1"
> > +                  " -numa dist,src=0,dst=1,val=21",
> > +                  &data);
> > +
> > +    free_test_data(&data);
> > +
> > +}
> > +
> > +static void test_acpi_virt_tcg_numamem(void)
> > +{
> > +    test_data data = {
> > +        .machine = "virt",
> > +        .accel = "tcg",
> > +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> > +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> > +        .ram_start = 0x40000000ULL,
> > +        .scan_len = 128ULL * 1024 * 1024,
> > +    };
> > +
> > +    data.variant = ".numamem";
> > +    test_acpi_one(" -cpu cortex-a57"
> > +                  " -object memory-backend-ram,id=ram0,size=128M"
> > +                  " -numa node,memdev=ram0",
> > +                  &data);
> > +
> > +    free_test_data(&data);
> > +
> > +}
> > +
> >  static void test_acpi_virt_tcg(void)
> >  {
> >      test_data data = {
> > @@ -916,6 +963,8 @@ int main(int argc, char *argv[])
> >          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> >      } else if (strcmp(arch, "aarch64") == 0) {
> >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> > +        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > +        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> >      }
> >      ret = g_test_run();
> >      boot_sector_cleanup(disk);
> > -- 
> > 2.17.1
> > 
> 

