Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp600554ejo;
        Mon, 11 Dec 2023 17:24:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFALp0yAHNOuDSs3nTm1TWG5Jh9AMHvOe2XsMjHvRzFoyWOdKPPtNvedXpJ53otDAiwsxo2
X-Received: by 2002:a17:90a:c90e:b0:28a:bf87:90e0 with SMTP id v14-20020a17090ac90e00b0028abf8790e0mr158805pjt.22.1702344284443;
        Mon, 11 Dec 2023 17:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702344284; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZBe7xtflEUDMP7u1gQNDC2vK88/Uzqsg4CAoX0Yr0zpb/3UKgYyR33m6S4+ytFZy3
         90YtH37M+IljBJaudzlRHYppr5O6BtgGAy9zShfWpXJZ/ii3ucQQ8+PaOuwKP8K/ZsmG
         ATvm0jNxfAEvImL4sqyiyJcD4atoZ0iXxlGtmsX6sIGkelKerCg81GLxC3PeUW+7PVr1
         DscmFZlGMEQcVROtvymEkkOkv78WxeOy3H0/Jqso4JupOdlpu+Nhzr1GQpg6JR4fNwsg
         3EtfgrNj3y0+nqcI9Ap5U7ZjOoBUQgpF/+pim7CXbNMkAKjiW7ru7ledJ4JfRi061vBB
         g1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=MmmsUVYY4maJeVMo49QbOhLUdw/TAjSNoQCl5rH3BmY=;
        fh=uo5HeO/zvORk7PjY5W8AZ6Umov4hjV0Red8zoUcoqlU=;
        b=vydwJ0P/twd3VlrMQR+k08c3jioUo5I20k0mlu3L6/DDWnWqa20ehuf35vk1P2YG0B
         4Ove2//TDZBbbpgeiAl338lPnX67o+z0MxKqPAu1FkW1Jx4gNSbMcTXl/2/VbWa8HowL
         EApOxNj2PzhZvtideMO058uY5CtHckTASA7PIdt34xrq4NXdLzcmh1TULQHxd2gAn40S
         zYt30gEIxisOCv+yf5pJR0N6BdqVK3FwEyS3td+yiKNUjDThWP5/eKviJXxnj56U5ra6
         koXh1matqwU3vLJh+d2W4w3dFDzdGw9IMCH2vCPXSPMr1Lf/hjvcRFXCyi5zNBURbP/f
         XbJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gaosong@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=gaosong@loongson.cn
Return-Path: <gaosong@loongson.cn>
Received: from mail.loongson.cn (mail.loongson.cn. [114.242.206.163])
        by mx.google.com with ESMTP id fy8-20020a17090b020800b00280072b397csi8269366pjb.30.2023.12.11.17.24.42;
        Mon, 11 Dec 2023 17:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of gaosong@loongson.cn designates 114.242.206.163 as permitted sender) client-ip=114.242.206.163;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gaosong@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=gaosong@loongson.cn
Received: from loongson.cn (unknown [10.20.42.239])
	by gateway (Coremail) with SMTP id _____8AxXOlYtndlITgAAA--.1431S3;
	Tue, 12 Dec 2023 09:24:40 +0800 (CST)
Received: from [10.20.42.239] (unknown [10.20.42.239])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3y9UtndlvFtcAA--.7888S3;
	Tue, 12 Dec 2023 09:24:38 +0800 (CST)
Subject: Re: [PATCH 24/24] target: Restrict 'sysemu/reset.h' to system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-25-philmd@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b05acf5f-e33a-90ca-94d4-abb818c73dd0@loongson.cn>
Date: Tue, 12 Dec 2023 09:24:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20231211212003.21686-25-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Bx3y9UtndlvFtcAA--.7888S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFy5trW5Ar17XrW5JFyxJFc_yoW8Gw13pF
	nrCa10kr4rJrWqkas7A3WavF1qga1kCr4UZayxuF18Ar129r1jqr4vvwnrKFyUJ398KF17
	WFyayr4Yya95XwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==
X-TUID: 1omHa22gXYak

在 2023/12/12 上午5:20, Philippe Mathieu-Daudé 写道:
> vCPU "reset" is only possible with system emulation.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/cpu.c      | 2 +-
>   target/loongarch/cpu.c | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index dfb96217ad..17b6962d43 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -24,7 +24,6 @@
>   #include "qemu/hw-version.h"
>   #include "cpu.h"
>   #include "tcg/helper-tcg.h"
> -#include "sysemu/reset.h"
>   #include "sysemu/hvf.h"
>   #include "hvf/hvf-i386.h"
>   #include "kvm/kvm_i386.h"
> @@ -37,6 +36,7 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/i386/topology.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "sysemu/reset.h"
>   #include "qapi/qapi-commands-machine-target.h"
>   #include "exec/address-spaces.h"
>   #include "hw/boards.h"
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index fc075952e6..b26187dfde 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -17,7 +17,9 @@
>   #include "internals.h"
>   #include "fpu/softfloat-helpers.h"
>   #include "cpu-csr.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "sysemu/reset.h"
> +#endif
>   #include "tcg/tcg.h"
>   #include "vec.h"
>   
