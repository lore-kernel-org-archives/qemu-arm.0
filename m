Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4749661lfp;
        Tue, 5 Oct 2021 03:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF+POpUcob7LgZcr8qaN33IhIA9qlQzpLvpEPV/a6aoK5XYYAeQiLcFjvGiwGZ919PHmJR
X-Received: by 2002:a05:6e02:1708:: with SMTP id u8mr2366872ill.8.1633429670252;
        Tue, 05 Oct 2021 03:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633429670; cv=none;
        d=google.com; s=arc-20160816;
        b=V3NJ+2E8QDe3ljAGh/NtBwdKdQ6moq5ycS9oBU1zJByvcCl6CuKoaMbzz2IEwC/YH6
         O7bXPWmA5Ut11gXqMblugyThDqDWrwJYmDDEzHyhzCTyaldQUdTZaduzAfRHogRqpAnG
         xuTGTGOyUyWEE5SjAFamcFL/u2zXcUc4BlNCJmQEGZnlxHZLvNRUtFAh8YsWBJ8+wP4B
         Qtre+lAfax/7OqLJdFkD3U8//mN81GFpCE647uTsTUZyQmiZor/jizXQEAkEkbLuxbuq
         B5K3QD2JuvzMkP2+Hk8fd9YeTEjj1Z1f59c2Es/fF1BZGrxd7aCHSvk7mnD9PBdi03Hn
         yPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=gmvNn8dpsEMsyigwipfxPxHmgS5i+wmu6qf+EYFE8OA=;
        b=BG3ai4gwTjKnw/vwcOvqH7erj6r2rJITpDZd4hXtHWxFbHHiqv2WkjyT1wBP6SI20g
         NaJbQw5HzTZJFZvOV5gCL68JzvGOVqWRtWGMUR2r4eH7fBFbn/TGFtbI5jBSi/bLYOBH
         X3H2pq91gPUfYW2OBevlD/ImCG4RvQq+BoVgXcPtAB/jzuK21jLpktZsFv4m5UDHujUK
         uImOeKOD0nvslIOmapfl8le2mD7Hm6HFLBChQk5sOD3liuLtqx1tkUkF0pdk7bJZ3cZA
         nmgz8KrL4vaSvGc5nBC20GSUFFpKBr0CyK41AgTCFmP5D/9n/yY71A/gVDSaU/zV6+y+
         jYRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=bUO4987+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si27020666ilu.130.2021.10.05.03.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 03:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=bUO4987+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXhfp-00063T-Gf
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 06:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhfV-00061h-50
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 06:27:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mXhfT-0004wW-BI
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 06:27:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2062761pji.2
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gmvNn8dpsEMsyigwipfxPxHmgS5i+wmu6qf+EYFE8OA=;
 b=bUO4987++naSloSkYagYtFj1osMfL6og2+pIaSSxK1vvscSw8JICX2Y0X9xPpUooHk
 2WvQxq8AwJXMOXzM8T2dbbMMoEfxI2Hk3mSNnFZ337c3oxhoNHmy68fNcJFaSHYDj8W7
 1gsjWpCv3mOl8qF022hMaxVOVoh0GR9t+ej+oYzuZqs9oI6+mgNfOtmYOWme/IGAdYqp
 vnLs45wBJ3Cegn0PcgN++r5QUBFa17thIuRkfZFO8f84jgYgW7xcR3oYLJ6M73JmoPyY
 1uwJEbGBvfGJ/c/XNyK70Zd2UF1ATpiJIKCw7I9wkkhvSyU3DSncr7aZw7tOT0qBZOjQ
 knGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gmvNn8dpsEMsyigwipfxPxHmgS5i+wmu6qf+EYFE8OA=;
 b=u0Cz02+wFbBwaDUyOFQxMDOB+gAKi7E0pY7TyPsfjCOjVQvXKSXqb4m7LOsqpTPrFW
 TQQXVPOYlm5l8b40/Vcjwdlge7yYC1ud7qsHkP1Gc21vZxBdep7ntCurBZzNLeUFpz3K
 95fQ0hDjLFIYSicT0nuiwiu3bBBvbGseXvkKiRJH/eFH3cLW9iI1SbB9pzqPKpI1gHY6
 pizG6R386/qj0VbOLISGrHM1debU/PtLFaj8shxXoke+QZDhiRNjmw4wyge3yns4TgSb
 lIZ4UhBVNyxjLxPEFXnrwOVa2OdB8O5VbX2THepE2f+t9vPD7T1h8uosvnQwVj98JV5I
 jiPQ==
X-Gm-Message-State: AOAM533zokF+q7tz0VsmLbSPTZsVTHrotnnF4fX5Mlw6oBMhg4UOQchB
 ylUbNQ//YFs5XLLlEkjyCVYVvQ==
X-Received: by 2002:a17:90a:30b:: with SMTP id
 11mr2859972pje.136.1633429645849; 
 Tue, 05 Oct 2021 03:27:25 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.152.16])
 by smtp.googlemail.com with ESMTPSA id a28sm5158652pfg.33.2021.10.05.03.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:27:24 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 5 Oct 2021 15:57:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 09/11] tests/acpi: add test cases for VIOT
In-Reply-To: <20211001173358.863017-10-jean-philippe@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2110051556270.820442@anisinha-lenovo>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-10-jean-philippe@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvarAjbXizcW



On Fri, 1 Oct 2021, Jean-Philippe Brucker wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This might be a stupid question but what about virtio-mmio and single mmio
cases? I see none of your tables has nodes for those and here too you do
not add test cases for it.

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
> --
> 2.33.0
>
>
