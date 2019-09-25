Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp947148wrp;
        Wed, 25 Sep 2019 08:35:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzsU8DgW4ktuKBowYhM9jUGluu8ILOAMTJxSmBxUWwH9/iR4IHOdwMVlQKGnqnWzcboYyv
X-Received: by 2002:ac8:7298:: with SMTP id v24mr9291849qto.279.1569425709340;
        Wed, 25 Sep 2019 08:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569425709; cv=none;
        d=google.com; s=arc-20160816;
        b=JeqNtkJuTyBOZeh+fT1sPiHMYSSBRru8COI+Z4ebjGkOxqwlD3iw0WQpc27O6RVWRg
         soG2UWuNeAvfVsE62bdGpCXCUHuK48HJwTC9Nt7mOvD3rGqfr9tXdQQ3yFfhC567GrP8
         tG2WV7+9a9SfAgZCixm5gkEoNHrdYAc3HF3KDG5oH+Uo6/VOAx+MScjXMxDqsTbyteHo
         WjbmO+v0PGLjV32HV2R5cBs/GXnOmzC5THPljcb8bMcqjcrdtfEcSyWkv4x53V+Z4NNk
         ZEG1mXfk5sFJl1vwYwq6qUEpUaQnU8FqGN5Jx3TK2zADzzD9GeB9Yu0YCgKKRCUqn5Zc
         E8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=ecZ8T4qEmI30s+ItSsERtP/R1VJ5HoNF3kNQjMhzU40=;
        b=gSzeiu4372N+1n7xR8hqr5VJRFx1JyfeQR2kDJMSnKJWU+lXwDrl7otqmtzUlooqYp
         gMQIcXshhGLYbx6C9Jf/7OPXxWGz1uH1XJKycuyr383CzsRzqddMs3IoKRyvz5uWduaL
         RvwoNEFhKWnPCKiCUqcbeahjEN7X8CPKGv7VAH6Rq8Ju7x34GzwbX7XThOe+qava9avC
         Zw6cM8cY0b5CqQRRZI0eLP0Jf3eUjBANUxVuPbLQfG3QR4hxcLnqX1RHB2ck5YBdQcnY
         tuvGr28t3K8X0+iE6ABXVHcyKTSmlW8JBZ2xdazY6Q3jKYn6zQsze5olJN8d6YdbkVko
         tJRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c129si4409437qke.271.2019.09.25.08.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD9Js-0006tD-3X
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 11:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iD9BI-000810-Th
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iD9BG-00085D-U6
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:26:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iD9BG-00084Y-Ev
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:26:14 -0400
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0AAFD7FDF4
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 15:26:13 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id n135so6396639qke.23
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 08:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ecZ8T4qEmI30s+ItSsERtP/R1VJ5HoNF3kNQjMhzU40=;
 b=e+pvFVgWYk4SJja16h6lpOGvnXTQEUWmN62YEUoSnU5fCTcpKsdFetazGKdLb+Wqg9
 aT5HiDSudlnKlhNc/sNxf3EC4xNMRw5rwiMz728jB1+F2yz+AIKE+OsYNt8b+ipUOR9k
 ELbz0q8/Rs4b54eOFV2CQfUJgIasl7oXcIBfVmkGEz8YeRxe+zXeN7G2GLtnOuC9hHVL
 ePtYgw2Wjp9HGzTdhf8J6HttXpBLgRiEmUsEgTacUoWcBL7wO1pvPrkw/KrK9w7F7MqH
 ccaFVUklT7DHiFr+PuN5Jn8pZK77PCJsoxewes1kESDdIH/jSYRBta6Y8dlMup1zAJku
 xRgA==
X-Gm-Message-State: APjAAAWZ2GVbQfCS65xNtdfwXUHv0BiTklzivOOhF5Xfauhy0g/UEOqJ
 k9WjS2Jl1yBQIhbSWLz/d6WcmFOrw/td9pZRRnabXdCMPFapUrprp8PJOCnwWlpkZMV2Mfcrw2N
 dTdlFQEJWX5cg
X-Received: by 2002:a37:4d4a:: with SMTP id a71mr4268547qkb.327.1569425172327; 
 Wed, 25 Sep 2019 08:26:12 -0700 (PDT)
X-Received: by 2002:a37:4d4a:: with SMTP id a71mr4268511qkb.327.1569425172001; 
 Wed, 25 Sep 2019 08:26:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id e7sm3648758qtb.94.2019.09.25.08.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 08:26:10 -0700 (PDT)
Date: Wed, 25 Sep 2019 11:26:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH-for-4.2 v11 11/11] tests: Add bios tests to arm/virt
Message-ID: <20190925112521-mutt-send-email-mst@kernel.org>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190918130633.4872-12-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918130633.4872-12-shameerali.kolothum.thodi@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8816EM0AfWN3

On Wed, Sep 18, 2019 at 02:06:33PM +0100, Shameer Kolothum wrote:
> This adds numamem and memhp tests for arm/virt platform.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v10-->v11
> 
> Added Igor's R-by.
> 
> In order to avoid "make check" failure, the files listed in patch #10
> has to be added to tests/data/acpi/virt folder before this patch.

So you can just add empty stubs.

> ---
>  tests/bios-tables-test.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 9b3d8b0d1b..6d9e2e41b0 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -870,6 +870,53 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
>      test_acpi_tcg_dimm_pxm(MACHINE_PC);
>  }
>  
> +static void test_acpi_virt_tcg_memhp(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .accel = "tcg",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 256ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".memhp";
> +    test_acpi_one(" -cpu cortex-a57"
> +                  " -m 256M,slots=3,maxmem=1G"
> +                  " -object memory-backend-ram,id=ram0,size=128M"
> +                  " -object memory-backend-ram,id=ram1,size=128M"
> +                  " -numa node,memdev=ram0 -numa node,memdev=ram1"
> +                  " -numa dist,src=0,dst=1,val=21",
> +                  &data);
> +
> +    free_test_data(&data);
> +
> +}
> +
> +static void test_acpi_virt_tcg_numamem(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .accel = "tcg",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".numamem";
> +    test_acpi_one(" -cpu cortex-a57"
> +                  " -object memory-backend-ram,id=ram0,size=128M"
> +                  " -numa node,memdev=ram0",
> +                  &data);
> +
> +    free_test_data(&data);
> +
> +}
> +
>  static void test_acpi_virt_tcg(void)
>  {
>      test_data data = {
> @@ -916,6 +963,8 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> +        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);
> -- 
> 2.17.1
> 
