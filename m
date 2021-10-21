Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp92721lfc;
        Thu, 21 Oct 2021 02:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBfA1iB9BNB1Ze8vnw84doesAvFlpUIbUiFmvX5tJWrK78I7eH/YGxXW2So+SPh+CqQtm4
X-Received: by 2002:a05:6808:2086:: with SMTP id s6mr3419588oiw.1.1634807216097;
        Thu, 21 Oct 2021 02:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634807216; cv=none;
        d=google.com; s=arc-20160816;
        b=xgw+po4vCSaBXSPK/hYp8Eyzy79aQVJgFXj13QQ4lszMjtDz5NrDcFNsCIaey0xiGK
         4dTC5quCQPZ/pGRoybVRS5b3BTjGw3rdXzsUeV+lSOydpbUCI7oXwihpKgQOdSv0WDz+
         1IX50Mein8lC6kFS4ARvjDIxPYGIRMdsK63TG/huz4TT384+/sa6zVUS5uLDJt6/BbUj
         DCphysCavejP4H/kvcaixLFlhnmwL2TB11wMcbCKAi/d8MC2/3BNEmrJe5r4sLNIXm1h
         V6o7FnR60svp2g8yWYqc2tVap9Pci0NFI/6tgo4bHRhx9h3Kq8FkRILslwgq+p0UxGLe
         adGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pToZEKYHQv0R2b96Jhl+ZhRHrN2ZTOz6jeiK5EhfBNg=;
        b=iLzQy3HWlYgbts58EknS9s7tUqBUFR9zwRGUf7PiIahjjGWMFaClwRqWGr4ylTEP0l
         VBd0jlftqnNguE6RbXtKzsiPimoTZ+AIRkUjnF1czE1hjSWWYAKUwh6f5AKQv6QAYSUO
         sm58mCpWFzhi6ztJ7FT0NxU7tb+7YViBTOpLEam2mXmvBCXHVgr4vmeDDoRys3g64jeU
         YTDRwEVCg0fIJW/VWXAQPXupZUiEl9/kl7+sfVvVmDxft2/XxAS/J/R/wyCAlLdpqEHP
         R7Sp28hxz3a/kUQgo+K83YMG9iKAgeaZuOzlhb7gtzYPZoTwnr1coqCc4dQ90rwphlnT
         LsJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTh3knNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si5916935oti.203.2021.10.21.02.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 02:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTh3knNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdU2J-0003Nc-Am
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 05:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyF-0007FU-CX
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy9-000636-Nu
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pToZEKYHQv0R2b96Jhl+ZhRHrN2ZTOz6jeiK5EhfBNg=;
 b=CTh3knNnL230BruIUvQ+17FAmkf2fTbdxvR6cS0u6kOBpwRSQd4F6Ne4G+iG+fkAzdV9ef
 efQSqyz4y3mEyyOFUN2q41kRjCP9KHZIIuMisIj22ot9BTnI+hdcCB+fNewJv+1509AJUR
 d8+lTwYj7gsz/TJH2Rt2py5UmPMJRQA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-lgxLVYELOSuE5I_rT0ox5A-1; Thu, 21 Oct 2021 05:02:36 -0400
X-MC-Unique: lgxLVYELOSuE5I_rT0ox5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so11082653wrv.19
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 02:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pToZEKYHQv0R2b96Jhl+ZhRHrN2ZTOz6jeiK5EhfBNg=;
 b=YgR+nbF+BN3mt02JFx9optPxw8JKDPVzqn5/TcS4YP+KWIe+Uhf9MCzw7RkZby+WAN
 fDwb4ke77XsekfWQuYB+2NZfQtF+w+bikYx+6LB7iE0pCi8Wtm40lPQvud/1AmKu24ws
 wJdETLpgLbv4M+KXh53Ak+M4EwGm/cD7IXXqaIbT9spSM9l2QeX3t6FaewqqP6lD4i1O
 2uBs6BHCdGl3PQWB3HSi0PSfAIRWrXGMjpC9eFVNW0x9C1qkBXvkHCbS57A9hB7enXzh
 QuTaB4uzPRMQA9FVjgKAwhgDifZHhhl7kONK1KFyRc1S3FaIKgoPJX0nfxE6lj2A0CxI
 vjEw==
X-Gm-Message-State: AOAM532gvnhWNepVutRyxyYdQqYKLPiOr15+23caC9PGcgOIC0qP8FlJ
 fB2bNSNPo7NvLzYO+9U+IZxgaq1iNeSFSOigAXXQ3+zhnCnn7CbRpvTnrMCA0D2qmlOTCgD9ok3
 WuCzUdNTZTCCv0MdVehsuwuBGyhh4TID3AOT1qwX4N0tu3j8HjKpe64QsvETzsvYUeBI=
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr785664wml.139.1634806953377; 
 Thu, 21 Oct 2021 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr785619wml.139.1634806953027; 
 Thu, 21 Oct 2021 02:02:33 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r17sm4845478wmq.47.2021.10.21.02.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:32 -0700 (PDT)
Subject: Re: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-11-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e56ce904-0767-1551-22b3-08a644e5caac@redhat.com>
Date: Thu, 21 Oct 2021 11:02:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-11-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-TUID: 15ls3zIxuS9p

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

small conflict to be resolved since
 220ffd949b ("tests: bios-tables-test: use qtest_has_accel() API to
register TCG only tests")

Eric
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

