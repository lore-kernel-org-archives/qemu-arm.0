Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3261814njd;
        Tue, 1 Apr 2025 23:42:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYWw41ls/oBR0OC+m3emm+dMbNv6nJ3ZhH1y2XFYDT/imEnHpEQdqRcSReilgLr5kqGrUy3okpCu6Q1w==@linaro.org
X-Google-Smtp-Source: AGHT+IHBI9yLXe9zA96JbpiNlVqFXj1kawHLb9quFUvm02rjRV8EesATaxjwEutb09fQR/NuBsau
X-Received: by 2002:ac8:5712:0:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-477e4b59073mr249272441cf.13.1743576154413;
        Tue, 01 Apr 2025 23:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743576154; cv=none;
        d=google.com; s=arc-20240605;
        b=jKtZE1II9hST70C7GZ2SrU+XrBW/gjaTVOqBZC3+ofNtgH6PAKW2rOSbBi7vImQSx1
         Fg7ONHj1Pk3+ShpvjrUufn8tR9K5i6zpQ2j87lhq0MCPceRHcHMzJ+cA5ePotumuC/j1
         m9YXLj9Yxvszek/9TvLoM/fnjvr9bf33JeIvVkqxLq/TdO743EgkR12H2IKynG1CBdDu
         fOyZ+z+gDJ/N+auHlbooT8NA5PB/0So4XN1RD/vNGQRvNpAFvYGV4UyCX/AqJ5X1LTx0
         jt/8Ns7c1v8fX6gIqkeIUhSL3Rge/xu513L49fE6/hOzJW4zSwt6HEvBhRsrlLxvEa25
         68rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x7pJ4OreKxuvubcq6/pAVF2x2fq5dkngHiRNniaYiZ0=;
        fh=PkwVugkIBbnosWBgf9HDheDFbWY5cvRqBj3VcU97yHM=;
        b=Aw9VO4e3ImP7HZorjXFoOazCZRuwIqPdK/4q/SwdXOSfLn9HvDDWPmTazBIX3sqdhj
         xlDE4d3Lc4VJLmC1BvNjA0Gc4rJpO8S6ZIV0Fwp0lZC9eG8kEb0z0j/ry5vvBujgbD0M
         K7EJfbkgRg5bvj+aNLVCtUzBrwi/qPx7xzcTpaicKnqEc+OsUcZQtbTmYEKWqARicTNg
         59lEHihKuPotTvV0CDLyaZtA3ySMsg8ykgaThdySm2YbSIzfhgk7K+vnOKE5M+xmU6K3
         kZ5RJU/4V0ABztkGsvfjd8eUsK5ipCr5HHF0SkYSGb3CIF9BGXLvu13viUrAnb9eIi9r
         HluA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5xEeqmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4778c5ca3bbsi93853201cf.573.2025.04.01.23.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 23:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5xEeqmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzrnY-0000t2-UB; Wed, 02 Apr 2025 02:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrnR-0000sR-QQ
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:41:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrnP-0000bj-Sm
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:41:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2295d78b45cso37356765ad.0
 for <qemu-arm@nongnu.org>; Tue, 01 Apr 2025 23:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743576113; x=1744180913; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x7pJ4OreKxuvubcq6/pAVF2x2fq5dkngHiRNniaYiZ0=;
 b=M5xEeqmIs6tQr7C5dKNFLGObCkkcELZ9qDsmk6TUuXGBZyA2sbpeTLOTz4R9x98+Sh
 DjNpbciUaan9OkVS1VSoP9ZpkNq6+zqtZFV9dol0Ym8qnHZEXOksOJXwFNyc9NjEaVym
 5wqR2Hmv+GPcdMcc3m2FP1T2KE2NYJhQ3erwm6VEAuE5WKs8o2FyhHYoxuWRd+vqPW4X
 T1GClN5kOn1y7j2D10RLm0AaQPh00llcl5la36Ozre0aOovbnwEC/hWBfs6mmO9WAoOz
 XuB6giKdNi/dlwJriwf3t0yHqd9BfaslPiguJPGcLJOCgWkuv3niygyESPnAc/mFJPQo
 5s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743576113; x=1744180913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x7pJ4OreKxuvubcq6/pAVF2x2fq5dkngHiRNniaYiZ0=;
 b=RxaCD4YvlIqNAGq3oCyVUkC+HWuMeFzaAvlzoABVjbsa9Pdma7tt0duE7Pzv1O4CAC
 9/zBIvk1L7MJZQIl1E5R/FMsuERcMeXsyklgxYPgNSsLTH8RnawhjbC3vjWnnyuY/dnV
 KoK5CWoCoMJena0FsAhSbXEPnyP8uDtlDVFE/IBj2hsA+0dN+VTuS9oE2v1ireVmoLa1
 ycEseyTHXY8F5m3JDPKnulWRBzhq/Ex+1clnjXyU+4SQRgUU/0s/WtuyO6X0PK7YmFWW
 di38z0d4ieBXwUDbvtQl8/sot5iegvTNZf3+sP8Vfiu1wM6BBBserA5W47PpKpbBxXuC
 exHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDcVFuQu9AdNZHOYCHLmBPmBX8SBtDk13ttugNwiUDYRYb6mfYBmNVd7OwWngYjivjuw3wVqnn5Q==@nongnu.org
X-Gm-Message-State: AOJu0YwFgYUFa2eLl5aA/OiTuWyV/AcaSmM5dcQ1FHSRS4EMz5zUl8OR
 QmV95RrAEyJMH1NyDywO6i5fsAFx/BaIxKSWkq7LfjDGRGfBT5VSBreA6TkAJ4s=
X-Gm-Gg: ASbGnctF/bZNEJVC4+x2ScVhifj8+UAze/aFxUDj9KNzLpCSg83ROOKoba5XG/tRSi2
 TlyFid8/Fh8N6BIuSrUiuXtnMbllvbSGP0WIRv6IkeKdzN9kFigrEPFJCSJu7jXhNxaBsXmbBtP
 6llcI8fmIs8lKUY+gYmEoAA+ypCxHyN+b9Lhjq6/DV6N73VI5pzRciEB7i4AkNFePLhi5IupZbP
 cy8cTIckGAFNoJ7UgT0sM65EW6Q2RVOehWZnCc0ngh25vCX+TjaNZdvPdPbFYYRBkKrHP80ZUQY
 dR772fnxIBUGGM+PIrjFBD3XamzEuSKA/V8YMLUfh6vrbXW9UkyWeBYX
X-Received: by 2002:a05:6a20:3d90:b0:1f5:9024:3254 with SMTP id
 adf61e73a8af0-2009f5bce21mr28443917637.6.1743576113603; 
 Tue, 01 Apr 2025 23:41:53 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739710db4cfsm10432371b3a.176.2025.04.01.23.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 23:41:53 -0700 (PDT)
Message-ID: <1d1362a0-b544-476c-a305-a7d2212db423@linaro.org>
Date: Wed, 2 Apr 2025 03:41:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/5] qtest/bios-tables-test: Add test for -M
 virt,its=off
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-2-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250331221239.87150-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aK0ym2Ym2SDV

Hi Phil,

On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Please, put commit message (body) into the commits.

For example, the commit message here could quickly explain that the FACP table
changed because virtualization=on (due to PSCI conduit). I'm assuming
virtualization is set to on because gic-version=max and so GICv4 is selected for
testing. It also could be that  we want to exercise its=off when Arm Virtualization
Extensions are enabled, which is the common use case (I understand that ITS
can be used also with virtualization=off).

Finally, the commit message could mention at the end which struct
vanishes in APIC table and why IO remapping table is affected by
ITS on/off.

A good commit message always help in code spelunking :)


> ---
>   tests/qtest/bios-tables-test.c            |  22 ++++++++++++++++++++++
>   tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 184 bytes
>   tests/data/acpi/aarch64/virt/FACP.its_off | Bin 0 -> 276 bytes
>   tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 236 bytes
>   4 files changed, 22 insertions(+)
>   create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>   create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>   create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec4353..55366bf4956 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2146,6 +2146,26 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>       free_test_data(&data);
>   }
>   
> +static void test_acpi_aarch64_virt_tcg_its_off(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .arch = "aarch64",
> +        .variant = ".its_off",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-M virtualization=on,secure=off "
> +                  "-M gic-version=max,its=off,iommu=smmuv3", &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_acpi_q35_viot(void)
>   {
>       test_data data = {
> @@ -2577,6 +2597,8 @@ int main(int argc, char *argv[])
>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>               qtest_add_func("acpi/virt/topology",
>                              test_acpi_aarch64_virt_tcg_topology);
> +            qtest_add_func("acpi/virt/its_off",
> +                           test_acpi_aarch64_virt_tcg_its_off);
>               qtest_add_func("acpi/virt/numamem",
>                              test_acpi_aarch64_virt_tcg_numamem);
>               qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe73eb7cb9100fcccfa
> GIT binary patch
> literal 184
> zcmZ<^@O0k6z`($=+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
> bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acpi/aarch64/virt/FACP.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25d3a4127eeef227434
> GIT binary patch
> literal 276
> zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ
> CVg~^L
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
> new file mode 100644
> index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
> GIT binary patch
> literal 236
> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
> 
> literal 0
> HcmV?d00001
> 

I think the prescription for the acrobatics to update the ACPI expected
tables says the blobs here should be empty (blob files are added empty)
and at the same time they are listed in tests/qtest/bios-tables-test-allowed-diff.h:

  * 1. add empty files for new tables, if any, under tests/data/acpi
  * 2. list any changed files in tests/qtest/bios-tables-test-allowed-diff.h
  * 3. commit the above *before* making changes that affect the tables

(from tests/qtest/bios-tables-test.c header)

If that's correct, this patch should be merged with the following one (2/5) and
IORT.its_off and FACP.its_off should also be listed in
tests/qtest/bios-tables-test-allowed-diff.h so the empty blobs won't trigger
a test failure.

Then patch 5/5 should add the expected/updated blobs and drop the *.its_off from
bios-tables-test-allowed-diff.h. Patches 3/5 and 4/5 are sandwiched
between (1/5 + 2/5) and (5/5).

At least that's what I get from:

  * The resulting patchset/pull request then looks like this:
  * - patch 1: list changed files in tests/qtest/bios-tables-test-allowed-diff.h.
  * - patches 2 - n: real changes, may contain multiple patches.
  * - patch n + 1: update golden master binaries and empty tests/qtest/bios-tables-test-allowed-diff.h

Otherwise the change looks good.


Cheers,
Gustavo
