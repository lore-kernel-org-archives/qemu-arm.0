Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5231580lfp;
        Tue, 5 Oct 2021 12:41:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC3OlAV5P3ODoUqRgA3F1uXdwMdplD7TxFe43KCb455f0mHx5gvpsWbuocwCAFiVz0POM+
X-Received: by 2002:a37:b7c6:: with SMTP id h189mr2955358qkf.377.1633462904349;
        Tue, 05 Oct 2021 12:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633462904; cv=none;
        d=google.com; s=arc-20160816;
        b=YDwwbdwdH8E/RGGDoRCPBwdNP9vgweD0sD0SUPwFvoUahPc0myOeN+WfYeMFMe38nB
         JLZu3rIVMWKMFnRn5srAvrjTpSJEYkdrJPg021+fHf4ODw1NHfs7HC1VR/UaGVds0IXo
         tguwTb/t3VRrlr0cMHjIlzGA0t8OSpBxf6GklYswUnSVDecAJ3yV64Wrt/GhfRsW/Ct0
         eRa5/HSqv8OVpjCCLgqvDrV8Z3bB9v8uyn1KA1I9Jxqe2QXBOoXzr3EMv18Ds4+C38Jh
         f2c20Rr79Y5ccrFpElPelWDjqp2Y/lokByeDpIn5gfQryKOi53DbMlfQDI6W/W2R3W9W
         24Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RMbV8nhPdJh+Tj+5bauxglLgvBkliNLvzzUT5d7cjbE=;
        b=Qlpn7C6yvY6IPNfW2GPROQ46Uv6hb6DK6Uz93E/zSh+edsqlH/FbfOhRvvCYpHVjkU
         VTvPYfWyXLIRM9yjgop8R/ys5vvJ2ozMweG/dNDhPPkagJ0V2KbGKSehh4LOrfUJf6WO
         IRzF1Jatoq+YVpt+qU082hDfA4ynEHCZYS/VmIqG+lp0yh8KGDkPUXQgBdYUtjastp1T
         oMmueTEIepji8cb+ieYuOen5WZ3hUN0gc7fSRPVzZT3EdVPT4p59G98r3Y+3LQ23mrvx
         pk64L7qRctofmt4SkcOtxlWfofWexev8TeYrOgpmD/8E2mrXZwFHqMfHFh2D8l5JhkmK
         BvzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ehCuIp9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si2611814qtx.227.2021.10.05.12.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 12:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ehCuIp9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXqJq-0003VO-PS
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 15:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqJF-0003QH-K5
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 15:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXqJB-0002Aq-GW
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 15:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633462860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMbV8nhPdJh+Tj+5bauxglLgvBkliNLvzzUT5d7cjbE=;
 b=ehCuIp9m9aURETa1ZCWGIufsKSuV5OkOdZbYdcmdiD1NzXscwzd9KusOXixCG2PKXCzVyH
 uqrZumli1+1xVvvbRO5AK84/wOGc15NT8YzjB3sf6HCsTxhKAwEJLN3dZ/FnmylewhjRtV
 Is3/Wt3fi70Ify7y8C/x17EeyozybYA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ELkNWVY8PbiBJqt3nlO6pA-1; Tue, 05 Oct 2021 15:40:57 -0400
X-MC-Unique: ELkNWVY8PbiBJqt3nlO6pA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso154663wrr.15
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 12:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=RMbV8nhPdJh+Tj+5bauxglLgvBkliNLvzzUT5d7cjbE=;
 b=6b7DvCUumuEW1zOr0uQ3p5ISnyhBES0zni2w77sGaQ3BPJfiFQD3xKk1B0dFETVT8d
 qfHSNgF03jX2BTvcw6tFYuV822sErGxfmAoNWq8rkKw0vzdtj1WV8bl7bXsg9uxodPSg
 7nlqLLAMSu9ESGiEuwHq1KPa0zPRNgmOci9sUouh0YXmgnouhKo3l6FGhJaT9uJQDN2t
 lhM6N17+ZxGv/OGrWA4F+9n7BbZRd3Wckkc01lEeknndnpKMs80XdCJoXqtCKjtTvSgO
 v/sh5hcAMVHH3NT5yJBGPdraNB9OH5jds6SvLOJrBHYk/hEWJj3XeDP3Cc7p+ys3mwUR
 McDA==
X-Gm-Message-State: AOAM530P+ATlZOyCR9t8s7G2XalA88MamUhq37kjCxaqjTPBoNgkTlmx
 fUWqX1LYjrHFDVilbQU5TVv2OKMlgmKswa3v3freECqfH4M7M1TT1kNhen8PcD35bM2Dr7Jv415
 G10/Kxz2DrUs0UGtmGPtP9Ad3nLEj/AQODebu9Li6yIA3/IiS4e/Ji++7AkZAEdeWUgs=
X-Received: by 2002:a1c:a558:: with SMTP id o85mr5457257wme.110.1633462855932; 
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
X-Received: by 2002:a1c:a558:: with SMTP id o85mr5457227wme.110.1633462855729; 
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m21sm3144587wmq.37.2021.10.05.12.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:40:55 -0700 (PDT)
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4350da17-9675-2cde-c571-6b5952b75f31@redhat.com>
Date: Tue, 5 Oct 2021 21:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /235r8Zr5X38



On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
may be better to use virtio-iommu-pci?
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
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric

