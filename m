Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp62838ejr;
        Tue, 10 Oct 2023 04:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMnMNC0tfMcDWdXs04l4SgA3efm/mcIGw+v0p+9UuhVThSG0vcOLJKQJ/NzDnCut2t465L
X-Received: by 2002:a7b:c456:0:b0:405:3e5e:6698 with SMTP id l22-20020a7bc456000000b004053e5e6698mr17363488wmi.27.1696937744718;
        Tue, 10 Oct 2023 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696937744; cv=none;
        d=google.com; s=arc-20160816;
        b=l5hWcVN4fI8BL0Nznmo0clQ8ZHm0+XGqMgmu8EY1aN1QgHZoBr3D5ii954QekAaD5D
         6ba88h3yCF9J5eWEKgEbOZwoeg2R9NlimQerBp9xiZuuv4SPNlxgb+t6wwc6tJWTYwtS
         6tR/StP/A8tUhZ6TiYTlbj93pBk8LohiIUHXW0/i1O4+K5vnWg1XRlwP94zROVRwR3ak
         PV4vVTe1CQF8PyZHL+9zobpRkFl0DfAB/hat24e7T24tsM4bukLKjxc5gSWGZ+v/JTvz
         m6v5WSpNKXBaIf0E/a3jzLSQx6b7b5Zv4I4xbhFLnp2B2Tdwmqf59kGqDeM7Yny8lkTu
         ZNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=oJBF49nNgNIKur3FxwjG57P1aK4VF28iERXOJ/m8+pQ=;
        fh=RrTLZV0A5IZHRs0gL1etM0WUwmKqocsoR+7SZbDKYTk=;
        b=gESi4MoAIKmYE4krEnuYghHIliIzq2QgVz9ekcwkMw+XJrsygpBlnEQ0AFBBiTb7Hl
         /3Xifl9N0vx32JAUZiyn/a15qmaR8uey4syjvjZVeTZwkWfHMjQiN14t3xs0p0phUnTR
         1QprPrF9BZsObX1xQfy0j6AuFsb1MZ/foq8EvVgUWguVzpm0JT3dfMqVv1P0DifWe1xU
         HJ2UCKNT0eow4qKCNOyT0PhmJfTv01hgHVwBoUWRl9jrg1t/n3cB/cQyn4G1PdKT+FID
         aJ0fUrZVabGKNkZnJPe3byDWUd0LpGKAUjc/ookcROdU5tPfIVWDz+RdxF7AG2xh8/md
         708A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a05600c225300b003fe40475dcesi7491776wmm.210.2023.10.10.04.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 04:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qqB0X-0003yQ-7Q; Tue, 10 Oct 2023 07:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqB0R-0003wU-P3; Tue, 10 Oct 2023 07:34:32 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqB0O-0002Aw-K3; Tue, 10 Oct 2023 07:34:31 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=43; SR=0;
 TI=SMTPD_---0VtsewtW_1696937651; 
Received: from 30.221.98.57(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtsewtW_1696937651) by smtp.aliyun-inc.com;
 Tue, 10 Oct 2023 19:34:13 +0800
Message-ID: <bbf67862-f1ce-443f-81fc-f56d3466ef08@linux.alibaba.com>
Date: Tue, 10 Oct 2023 19:33:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/18] target/riscv: Inline target specific
 TYPE_RISCV_CPU_BASE definition
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-11-philmd@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231010092901.99189-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fp/J610WP8lZ


On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
> TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
> definitions which are target specific. Such target specific
> definition taints "cpu-qom.h".
>
> Since "cpu-qom.h" must be target agnostic, remove its target
> specific definition uses by inlining TYPE_RISCV_CPU_BASE in the
> two machines using it.
>
> "target/riscv/cpu-qom.h" is now fully target agnostic.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu-qom.h | 8 +-------
>   hw/riscv/spike.c       | 8 +++++++-
>   hw/riscv/virt.c        | 8 +++++++-
>   3 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 8cb67b84a4..f607687384 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU RISC-V CPU QOM header
> + * QEMU RISC-V CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2023 Ventana Micro Systems Inc.
>    *
> @@ -43,12 +43,6 @@
>   #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>   
> -#if defined(TARGET_RISCV32)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> -#elif defined(TARGET_RISCV64)
> -# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
> -#endif
> -
>   typedef struct CPUArchState CPURISCVState;
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 81f7e53aed..eae49da6d6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -349,7 +349,13 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>       mc->init = spike_board_init;
>       mc->max_cpus = SPIKE_CPUS_MAX;
>       mc->is_default = true;
> -    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
> +#if defined(TARGET_RISCV32)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
> +#elif defined(TARGET_RISCV64)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
> +#else
> +#error unsupported target
> +#endif
>       mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..620a4e5f07 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1685,7 +1685,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->desc = "RISC-V VirtIO board";
>       mc->init = virt_machine_init;
>       mc->max_cpus = VIRT_CPUS_MAX;
> -    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
> +#if defined(TARGET_RISCV32)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_BASE32;
> +#elif defined(TARGET_RISCV64)
> +    mc->default_cpu_type = TYPE_RISCV_CPU_BASE64;
> +#else
> +#error unsupported target
> +#endif

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       mc->pci_allow_0_address = true;
>       mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
