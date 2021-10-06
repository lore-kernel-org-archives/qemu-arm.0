Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp58515lfp;
        Wed, 6 Oct 2021 01:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhiXPBx1TV70aItPuErxmUToU31ccmYtd0UJHIfIDTGXXVE+iUg9RAqrAungjN6PTBec/A
X-Received: by 2002:a5b:791:: with SMTP id b17mr29159925ybq.263.1633508165563;
        Wed, 06 Oct 2021 01:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633508165; cv=none;
        d=google.com; s=arc-20160816;
        b=FetCHlRZEdgighzJGqbWc+d9HOE7a06Jh21acV4vH6L9B9ffH12+T1zU9i8Ld+VaoO
         eQETarNfiQUEktyVwzHGHTpHM2L67UeDQnMybIMwIKh+GP8Lj0pVTL3cUy/vBdzwioXl
         EREZUvmTZKNulK+swoJIc6ZdIk6Ji9PYj8P40SAr9gRnN3wwHL/HNjiVoPTjQgGfVHh8
         nr/BtjTxf7MYSovS5AxIBqJ+8PYQEyMwWSk/nyt4dWAqA2D+3gk17DnOilUeHfUgIwAu
         i/rMorkIvtqcJx7DdUY3x9sviQEyVc06VHbhrXr7skq+Iy1ICe9gMOrys0TwG24EYRGH
         E09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=BvGgk6twj7rWkkyp7QC6vvWZWx3oesWLXmbukEbEECU=;
        b=PWYDoQueJoq5z07vtAqeAVqX1TMQW+6PTSxWODwY/X49YmgOHDuLQ735GNCxmrMzfC
         OsUjdqQ2LfR7a8MomdEtFZv/+GhH3fZYFaYEmOIV8oJOuY3zsO4u5fx4cVxrVeho8lh5
         sh5R6CWmAfCwBy7yxSsJTu5oDiKUHKryLEpTGwPtapXNod8UQ19sxDGlw3Gx7KbAYpQi
         5AySHa3ecRalsaVkB/p9uuZIXZYmep2wS7DzSd2RCyNQWC0B7ZxXypTT46kWgbt2Gvf8
         V6XhbmcaNIAd1SARBuNqYiOy81jCFn3p104DVlCx8Wcx+ajKzV3JVyuXU4gX6ZY6FUyV
         uCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EWxhPbkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g62si6179115ybi.473.2021.10.06.01.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 01:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EWxhPbkt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY25s-00013c-R4
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 04:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY24z-000123-77
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY24o-0000hf-3q
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633508097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvGgk6twj7rWkkyp7QC6vvWZWx3oesWLXmbukEbEECU=;
 b=EWxhPbktICpEvzgUX/XavnE3YqTauvAjWkKMe4biXvjVxJluSluceCd8YRL6q0sDvUyuwM
 zQQ1OzMFyFaKmip0MEJ71ES9URuqGryCvzlGYLFGhkLuDW1qRPjYp5vfguM9TWmuoWB9Sj
 OsgBzkcS6dqg2igF0LhoRHhU5gdkjs8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-BEFJ34t_PR-aEo1ORGZE9A-1; Wed, 06 Oct 2021 04:14:56 -0400
X-MC-Unique: BEFJ34t_PR-aEo1ORGZE9A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso1364730wrc.2
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 01:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvGgk6twj7rWkkyp7QC6vvWZWx3oesWLXmbukEbEECU=;
 b=zaHGSQBNCN08i/QzcchJGHr0pUomvrnCLcohT33F46BznGub6SNmBJuBAn4HBTIQot
 MHtjhHBV/tpyAcI4R5zeK+tPEneaWG4Aj0TvwVFiKGqtXxrs2iAjSoIX1xkXh70ulJkW
 Q8LmAUhmR7siISMHgmbuw6NZG3bZAbiOySAiOgbLgj2sXTlu7QSgA0xYCzXOVJlUqSeJ
 YjRi2eL7dAtpxgD0YgJhQjnkM6Z21ctHL9ggQpeFcoRc0LxPx4B+S3jGpKQhIVyAH4I0
 Es3WXdTy2LskLQTnM4rjw5b0ZliGh89L3y624wj4PZBf7h/oizccDbQMa8vjI9dZBgdg
 0RCw==
X-Gm-Message-State: AOAM531ngWNmglgENOoxZDQdWEuvGRgxxCBZnEIx/Wzj7nG6gs8gL+24
 RqXa8uYJ/f73ior2da1/ED9D5hnsmafSZ86rL/WW1PuAfOJQ9nCKgr/VV+5KbnbhroNyusGSWZR
 7zENIlAdDfdWL
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr8427391wmi.10.1633508095266; 
 Wed, 06 Oct 2021 01:14:55 -0700 (PDT)
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr8427368wmi.10.1633508095085; 
 Wed, 06 Oct 2021 01:14:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o15sm4294850wmc.21.2021.10.06.01.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:14:54 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:14:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
Message-ID: <20211006101453.62de5e54@redhat.com>
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xycdZeyVGHhS

On Fri,  1 Oct 2021 18:33:57 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..b6cb383bd9 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_viot(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".viot",
> +    };
> +
> +    /*
> +     * To keep things interesting, two buses bypass the IOMMU.
> +     * VIOT should only describes the other two buses.
> +     */
> +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> +                  "-device virtio-iommu "
> +                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
> +                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
> +                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_virt_viot(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-device virtio-iommu", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> @@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>          qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);

