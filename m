Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp90043lfc;
        Thu, 21 Oct 2021 02:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGo4E7L+A1+CYds1V2ew2BcovJCui1D+yJNSCwnIBeQocvitxCzRZQtS8tgOzy/TjnpS9X
X-Received: by 2002:a05:6102:3711:: with SMTP id s17mr4292421vst.60.1634807016700;
        Thu, 21 Oct 2021 02:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634807016; cv=none;
        d=google.com; s=arc-20160816;
        b=NkNb0ES86H3k3SYT0xMsONA+OXMmq8WilniCrG3IthHLX0LyKFfuCbFgez99zP6jMa
         juJT+KXbD4kamxeYEG8+CFO5IBcckH2d1FK1zvYTDryAOQR51rWzAsQFb0MbiaW5iTf4
         pV/628lPivfiKFGj1IHty4nHgX6ZS7HsW4wr5pu7263fm+BhXvKdVQEPe93wxfhUlm43
         V4fRNFOJC9b5rsLqi4JLbGOSG4Q06NgPsS9r0BOXSBCNfqIFxPURBsQkaYeGOM2xRV1z
         J3OaXSALLoATA6y3GhbrRQ1P3eBWE+OpkmWnPqvhZ1DdP/rwMPwlLzIzklf4y98M4eom
         2/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=A78rqAmL4vROopRQqqY/d/L/E6qU9a0792ddVb1RaYY=;
        b=fgfhz0c1yfXpW77zYcFKTWjhO9tPIvKRNx/D0CZ3+f1IaHQwd9MPnzil/BfDY4g8cP
         xii4P+pp97mqqWVqdPXvk2eMvwdZqOTmGy0aTLv5DspDkRgZrhsj/w7BDqFMNHZkGamr
         idWUtqzmVSPrQHYheCs421vTiSFGyVepmsAn4r8ieG9XfRNnHKuPnUT+d9xRXai33AFF
         4gQjmjbvjf6FAzU5rB+cnHSHDZmcmgtZtmi8zBlM7acdDxtqCXQnUFBel3n8WvYCCB/9
         Jlr00ofRhkIjbYgxgm5emT4cC9fxN77FKZuQfh0SAQ8nKJCl0W8eYiocvi4x2+ibymR0
         GGYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eabzNeeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si4593578vsl.432.2021.10.21.02.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 02:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eabzNeeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdTz6-0007Dd-11
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 05:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy8-0007Cy-J1
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy6-0005yz-2z
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806952;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A78rqAmL4vROopRQqqY/d/L/E6qU9a0792ddVb1RaYY=;
 b=eabzNeeZFSJaGB6jGYpQFpSgVWmhjB6WKq+3sAD95WuGkHVBUgrKQYai9EiKgs+AKt2e3X
 1aJcsQ/ZZAT8W32qyVJEnBi8ePUbKdm1Yy/wjh35rc+URmZpsiAcMXYJubHx1CuPr6Ct0Q
 bOATe7MvgGusltAsFXL2z1fZnDSUau8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-JVwVYisqMhCnMkgSfW8Qtg-1; Thu, 21 Oct 2021 05:02:31 -0400
X-MC-Unique: JVwVYisqMhCnMkgSfW8Qtg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so11113157wrc.9
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 02:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=A78rqAmL4vROopRQqqY/d/L/E6qU9a0792ddVb1RaYY=;
 b=WdRXl8drwwbao9xVqrCCwujpChFLixbe8vh6tImIoml2hEOJW0SwUWwDfZm6Zhd7rm
 pB7SIWDDWoBiAu+jh80euNtwx1YmoXcf7ZvyIHVfmeVMrMcW/2GT9SEkd8KtGso8QV1z
 flaWxMK/z387mL6i6HgW2j+SaZ3gAF8FhBJJLVuthhvLiIX+/zw85TiH4f7qM7ELPDT6
 Kmz9uPN9G4+yj2JJGMtPXmyezcZt5O2tP9uii5QtlWdhb5Guh6BSnNHH9B7jmZSfuzu1
 nj86c8mH/mzbdTDk1f3BSWe6+8B+XRcrW767mex38N2hwtrj5oQSAC+9Q2spQX+zKLWJ
 ShOA==
X-Gm-Message-State: AOAM530F9zG8FiJN1vQ19GQGeWRbW5QS1Q9DTtG+JHR4ndy/ouhsRvuq
 TqUM/NiKLbvoueYB8KgVXYRuOmHWHVdW0zhaQaIO9GZ2mo/mCwaM6BooIMO03g2u43/2vl2WQMO
 CVmb7l7iBreRTRdRcrdah1n3nkpZEi/3pxTT2y1pIAOyh5rnWV4fjCFnGTlHOs/YGepE=
X-Received: by 2002:a05:6000:1362:: with SMTP id
 q2mr5748521wrz.44.1634806950141; 
 Thu, 21 Oct 2021 02:02:30 -0700 (PDT)
X-Received: by 2002:a05:6000:1362:: with SMTP id
 q2mr5748473wrz.44.1634806949805; 
 Thu, 21 Oct 2021 02:02:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q141sm757480wme.8.2021.10.21.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:29 -0700 (PDT)
Subject: Re: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-11-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <c7dda57e-b154-1b69-1480-c89b4ba0db2e@redhat.com>
Date: Thu, 21 Oct 2021 11:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-11-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +geO7EG+rXXL

Hi Jean,

On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..599b155201 100644
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
Just a reminder that we still have a dependency on the
default_bus_bypass_iommu fix here. Otherwise those tests will fail. So
the fix needs to be upstreamed along with that series.

Eric
> +                  "-device virtio-iommu-pci "
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
> +                  "-device virtio-iommu-pci", &data);
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

