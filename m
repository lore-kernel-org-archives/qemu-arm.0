Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2837570njd;
        Tue, 22 Apr 2025 23:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVToNf9EXD2fnc4eWZKSZ9JXqlre9U+C7z54a/8/b7SPpBdn9NPgd+GDg8nNBp4RaOoiHRWO/DAGRBtxA==@linaro.org
X-Google-Smtp-Source: AGHT+IHHXQXLMi2DQX6ujps1S2H6A8f8z4BxaW1yNpLL2svN1NkvlenRE1TNwGx9frqBDwrVzcFW
X-Received: by 2002:a05:6214:1c49:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f2c455326dmr317136436d6.16.1745389781893;
        Tue, 22 Apr 2025 23:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745389781; cv=none;
        d=google.com; s=arc-20240605;
        b=JDOccd+SZ041rkNz9CCM765aHzFVkK0+JTH5BTvgyGZwJ/DNgDOSwpxONgM2pWWmbh
         bDorJmH0sI+V1I0a5cPW2O+khvbTbR9hELmRaU5/9rK2PGC+zUw3oxUjx6LOKSzTkHAc
         LbBOsFzs5yZr3j3toASRZZOzq3zdyQAwKOXSxie+QMLeXjms8CJgmBzuGmc4tEBp9LI4
         d9rbzYvk4YSTM7r6J1lV1D/vN09BNrY3HFuZqGRMUd7IN29K1uwU84HCN0l+1xgVuE77
         IHdWx84cYutv0niD853r+s9OvjNcAPieh8qbwBxiA1BgYUNYWfVs8wFWtS6H1qeOjX9X
         I4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PnYUIGVbHUNS49WFTP8lUIYZ/wJDXeanFD2CPqOnTtY=;
        fh=3rKPZdUuFWTjW77V+gzyfcNhrwTTGaILZiEtMVNiUFo=;
        b=kxphxGRgIT5S1vloiaEzcsaaVdkmKcdGOIMKRXFnE/P8SDvkofJH9sNW9XSxy9s7AA
         2wcuXiGryIo9Ccsc2WHJbwViZ6NjRkXgymfheDz1jl8EDNAy3ndMTSAlZ2bzK8xLPJ79
         vtEyTpZalXiL24UyeVHlEZ1hpFMCLk+uMIFoLBDBOllDbFpZsPYfrzAaJ+dJlUshAivp
         Ne8yOdESkj0GAbr6iwVZF43G8BIrGi7t52rd+Mj3xRaWMiAM427hrcP0EgIzMgpWoS59
         mvBuK82Itae0SPNyWEJ9r8jPmZ0qoywvbJVL4rUutlGzPNXjvNHW4UCrYNWCUserwvDs
         /QLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2b01e07si123817076d6.62.2025.04.22.23.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 23:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7Tbo-0002vR-7L; Wed, 23 Apr 2025 02:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1u7TbS-0002Zz-NU; Wed, 23 Apr 2025 02:29:02 -0400
Received: from mail.loongson.cn ([114.242.206.163])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>)
 id 1u7TbO-0003Ji-4f; Wed, 23 Apr 2025 02:29:01 -0400
Received: from loongson.cn (unknown [10.20.42.62])
 by gateway (Coremail) with SMTP id _____8BxlmmdiAhooHXEAA--.63135S3;
 Wed, 23 Apr 2025 14:28:45 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
 by front1 (Coremail) with SMTP id qMiowMDxvhuXiAhodEaRAA--.48008S3;
 Wed, 23 Apr 2025 14:28:42 +0800 (CST)
Subject: Re: [PATCH V2 0/3] acpi: Add machine option to disable SPCR table
To: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
References: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <dea44766-af4a-98ad-54fb-bee8fe647d3f@loongson.cn>
Date: Wed, 23 Apr 2025 14:27:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMDxvhuXiAhodEaRAA--.48008S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZrWxJFyftw1Dtw4rCw47ZFc_yoW8Wr1fpF
 4qka45Krs8Ja4ak3Wfu3ZFgr1rXFs3GFWUGrW3Jas5GwsxKr10yrnFkryj9a1qyw15Xr1j
 vrykKF1Uurn8AFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=mail.loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.292,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DJUo5vMK5Q22



On 2025/4/22 下午8:03, Li Chen wrote:
> This series introduces a new machine option, spcr=on|off, allowing users
> to disable the ACPI SPCR (Serial Port Console Redirection) table.
> By default, SPCR is enabled. Disabling it can help ensure that the guest > console behavior is determined solely by kernel command-line parameters
Hi Li,

SPCR only provides serial port HW description information.

However how to use is determined by Linux kernel, Can you describe the 
detailed scenario which is unintended serial console configurations 
imposed by firmware?

Regards
Bibo Mao
> on arch like arm64, avoiding unintended serial console configurations imposed
>   by firmware.
> 
> Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI boot.
> 
> Changes since v1:
> - Add bios-tables-test for RISC-V and ARM as suggested by
> - Add Acked-by from Michael S. Tsirkin for the first patch
> - Add Reviewed-by from Bibo Mao for the first patch
> 
> Li Chen (3):
>    acpi: Add machine option to disable SPCR table as suggested by Philippe Mathieu-Daudé
>    tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
>    tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V
> 
>   hw/arm/virt-acpi-build.c       |  5 +++-
>   hw/core/machine.c              | 22 ++++++++++++++++++
>   hw/loongarch/virt-acpi-build.c |  4 +++-
>   hw/riscv/virt-acpi-build.c     |  5 +++-
>   include/hw/boards.h            |  1 +
>   qemu-options.hx                |  5 ++++
>   tests/qtest/bios-tables-test.c | 42 ++++++++++++++++++++++++++++++++++
>   7 files changed, 81 insertions(+), 3 deletions(-)
> 

