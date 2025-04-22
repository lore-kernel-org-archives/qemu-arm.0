Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2346262njd;
        Tue, 22 Apr 2025 06:19:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzXUi7iACHpPSm98ObMhZBAr8MncP80TgsSi/o95U8YLxW1QJhFs/myA6PeGnjdGpjUgI6rqmntnTkBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHqdDyDMyLda6eRVTd4NScRI/dqO3Rv7GRHlpo2rkk75qPS1cqHArRC1c8iKmA4B83MucEG
X-Received: by 2002:a67:ef86:0:b0:4c5:1ca8:d385 with SMTP id ada2fe7eead31-4cb801d0cebmr9022059137.18.1745327950961;
        Tue, 22 Apr 2025 06:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745327950; cv=none;
        d=google.com; s=arc-20240605;
        b=UJF959leY3tqJExAk3KPjxQtPBukQLPvWisqlB7Wrlk/fdjx1lT8nwVyqlxXWOjbKO
         L4sy32UzX1rUgp59oOfZMb9bBGXwJeONa/luBTYH2/XWooMdjR7gxLdA7oAnj+2Z45eN
         DrsJ9nbA+xUT/mYVLuG7Fz9jOdy+5ioIICnK8ElfZKKbNaayZFND89horqfBljXCugp9
         8ylB8PrzAdlQY0jMteAPiAqRFCN9h1STg7gPtcgGLTif2O/dfjaK0MVgUXYMtQWqJWVX
         ez/T9L2B7ldPfXm/Ahh5Kv0dwIxvo4w+gyP/8fW/BDRnUFHDhMbzuSPUphlfNstLJ/Df
         k4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=77yyRGOmizuCBU9T40JZpDpZACJ9np8VqGyH6gRCUB4=;
        fh=XpmnzUOSbsyxyQku6hV95m4W7GnQyaccktd6MPXJCTA=;
        b=gJ6IWa+h5yf/T8GTMb5Vb30N8aQjg23F6ewbLQ+QS4NK5gZBd9jg8Dm2P+GQAa8cqH
         W3BmUEkzmltMVH8DoXgADF4ODMaG8pxb2PbGW5rGXhYYnNWuB37skjTyiaOAgN5GoDFX
         hcUgO4WwkF1eKKpolPqFxv0kwvfpt5euQ84b0bt8O3r8r4QtG+kxa39RhGRLCquNcFjX
         JrCJJVCNMrceddIh5gYjWgSMr0j7HL2IJ6bXo5aA6QJMpV9qjplUSqPIlJLyNq7g8vMr
         eIjBGYkqlgT7spFafCOkFB23ro1soIuumWXQyVYWHx0o0mXmySIrY5WO9d4IeVqtK/Im
         Cpqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFOohJpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb7dec17bbsi2319776137.256.2025.04.22.06.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 06:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFOohJpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7DWd-0006tP-7T; Tue, 22 Apr 2025 09:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7DWX-0006oU-4w
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 09:18:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u7DWU-0002En-Kb
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 09:18:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so37854365e9.1
 for <qemu-arm@nongnu.org>; Tue, 22 Apr 2025 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745327929; x=1745932729; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=77yyRGOmizuCBU9T40JZpDpZACJ9np8VqGyH6gRCUB4=;
 b=QFOohJpFyLwK+dgWjvjHD/xMrVi1xg/tlL2Nna51t6OYiNfX5eyLo5wdq2LK8aWSem
 QNCC1smf7NnDa4DZUQjZzbrM3cimDuCdRYftAgOu8++YtHm/UiXZO1MYBpKITudZX0k2
 VwAHCXX6M5TyAX74mm/FNauK+gJM01U5O1OtpksPbHPAd0NOk4XJD5rdxslSpVoWrqhD
 Jndn4dAollepPzhwiBMspV4Hlr9I7h0b7Dg3eX4Tag22Uq4ct19JmvIFz2D0rKey0DFv
 UeMS9RtcFi8hV81t9Brn5z3tE9AfkJjzWK35kPNGpP96DRkqYqZNphBZEy9lgU9kt74f
 1lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745327929; x=1745932729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=77yyRGOmizuCBU9T40JZpDpZACJ9np8VqGyH6gRCUB4=;
 b=L4vXV2WiuJL//NkY+rc348O4vrEc4RM1izdV8g5gwueTndXFXkxklcEnf6GOEw0pIL
 vvsO7ExiQ8anfWl0MVQ+smXxWWoi0722QbnwrHSHJAUy3pqQdl69ol9N4BPvpUOKuiIy
 PFVrKHWieEOabH3fOzfcA0iv6wEEtl9xb3SrFw89YLt0amKJ9musI5kzx+vvi/eQSsDj
 YqzdRIJDpvMV83p0xLLZCpPMeYjkjFUsWTO+H5J/QxGIXpXPkbs36VOF6raDeLWVsMqs
 Lel4Rib4N7S2eRvWACqPyRNE4Nj3cHmp1HfGWB40Tu2pC7SshTfwdHNfI24HfNPB/qvi
 UCFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1MhSpwu/NDkjkwvPllQl8kxSFaUQINVeAmzSREF0emsxfIyYSk15c3Tg8qcEOYfitBAjrbapwAg==@nongnu.org
X-Gm-Message-State: AOJu0YzNfZIEQ/nTwWaLun8jm166AFw5E56NadNBbEPhMzoZMDmNVwag
 OiB56Bb6XFBMWmK/PCKUdvhsvt5Av0tlY1j6XUxHn+/YENdr2RACvmqrOZJbSEw=
X-Gm-Gg: ASbGncuPAzbZUvHy4EvGJ4w9fU2uH/rvwkDUPAgpoAHQn2UhDxYAW3i8lApJDgoJ17A
 8Oh1QDAnpxonb5QXvBQbvV5RMI86Sx6TPn/B6fWqcgm1dh0BdT7v1WWLdg48/QQ7OHOJCeKIlCT
 UG6EAIx4yXwD/DioIvc9eYIhVzZU7cmMe3OWO4ZdM9SvrBm+G3Zg16MabSdMsrJ0oMsHBoxk2VT
 x6KNJksdxFnmR5WPDyhMvCVmixqsn6+Kw/wafAZ2AeEPW0g2fjwlsRLlVlxN2FGkl9MXhVwcPcV
 hgeP0wiVk8G1Xvby75dddQt7nmIbbajxO53K2vE+hjPh48JF1TWlhdwocwm77V37qTzcK5tPLjJ
 mfGqO1wv0
X-Received: by 2002:a5d:4345:0:b0:39f:f0e:8328 with SMTP id
 ffacd0b85a97d-39f0f0e83aamr3307811f8f.35.1745327928757; 
 Tue, 22 Apr 2025 06:18:48 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4207basm15053641f8f.5.2025.04.22.06.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 06:18:48 -0700 (PDT)
Message-ID: <c67391b9-297f-478b-aea5-c27b0dba6cfd@linaro.org>
Date: Tue, 22 Apr 2025 15:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] acpi: Add machine option to disable SPCR table
To: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
References: <1965d621e25.fafa759e911037.825810937022699867@linux.beauty>
 <1965d6357a1.dfa9d35b911644.778874035603636753@linux.beauty>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1965d6357a1.dfa9d35b911644.778874035603636753@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: ap+2y65NjVZW

Hi,

On 22/4/25 14:05, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>      -machine spcr=off
> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Changes since V1: add Reviewed-by and Acked-by
> 
>   hw/arm/virt-acpi-build.c       |  5 ++++-
>   hw/core/machine.c              | 22 ++++++++++++++++++++++
>   hw/loongarch/virt-acpi-build.c |  4 +++-
>   hw/riscv/virt-acpi-build.c     |  5 ++++-
>   include/hw/boards.h            |  1 +
>   qemu-options.hx                |  5 +++++
>   6 files changed, 39 insertions(+), 3 deletions(-)


> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f22b2e7fc7..cdf2791a50 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -444,6 +444,7 @@ struct MachineState {
>       SmpCache smp_cache;
>       struct NVDIMMState *nvdimms_state;
>       struct NumaState *numa_state;
> +    bool enable_spcr;

I'm a bit reluctant to add a field used by 3 virt machines as
generic in MachineState. Shouldn't it be for each machine state?

Also I'm surprised we announce the SPCR table regardless a virt
serial exists. Shouldn't we have a disabled default and only
enable on virt machines, preferably checking the serial port
availability?

>   };
>   
>   /*
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dc694a99a3..953680595f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>       "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>       "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>       "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> +    "                spcr=on|off controls ACPI SPCR support (default=on)\n"
>   #ifdef CONFIG_POSIX
>       "                aux-ram-share=on|off allocate auxiliary guest RAM as shared (default: off)\n"
>   #endif
> @@ -105,6 +106,10 @@ SRST
>           Enables or disables ACPI Heterogeneous Memory Attribute Table
>           (HMAT) support. The default is off.
>   
> +    ``spcr=on|off``
> +        Enables or disables ACPI Serial Port Console Redirection Table
> +        (SPCR) support. The default is on.
