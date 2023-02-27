Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4578035ejc;
        Mon, 27 Feb 2023 04:39:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8Oiv1Ge/8fswn9ClEwVp/RiDqtBUnSpNNG7E9kKLvKvb0a5W/ruuYufk4DLLoX3t6ZKBM1
X-Received: by 2002:a05:622a:1002:b0:3bf:cac4:a3a1 with SMTP id d2-20020a05622a100200b003bfcac4a3a1mr10515327qte.66.1677501555077;
        Mon, 27 Feb 2023 04:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677501555; cv=none;
        d=google.com; s=arc-20160816;
        b=1E13tHKrfMCcnZ5DA05LDGBm8VP7t2TjKNCB06jX/M+wldz8t6zv6JnQeQL4WeDa5J
         DKsSbD58i5xBZuvFeKN8UndfAhkWQWGz24nqVfAG0CdMdhBuAMEJpadBwmCi12BqtSoy
         pZLtT+ErgjPeZW4WwYLj7yikfWkpFEkp5ZH+1Zx65dFKRSDgm7Ezf0eYJ62jkDmvAOR3
         Ev38Mjf4muvVmXp+B3vdnA6/GutQBuhwaB5lU1XcjkznNU/J5nijQLinvB6+MeTlqyvm
         vlIsWteZ4eaIZxY2YKIJ+EahjlJDDEEH4OngAPRPP7n30bDdeX5cyjTmAN2nI5gH69VQ
         vzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/Tdw6LYsYhKnnDa1lcyJZ/PkbGt3pTohjvy5MbVoz0s=;
        b=FIs1U3/mHrxveRox+5cs0Zstb2VR22ZXiRbry99cStkevhvv8PpJc5ecl2swIEL84J
         VCeJq5cX1KENKQhvt4bltyH6zLHuHap8yQDlDqVatW8E1q/fDSUsFuP/oy6pLsFLJUsf
         oYcGjeIxPw1xYcL2eScJrzc73KtYYVRgkTFa61IQhcyK4K1s5/d3U3ikZZlgeYNUSMZb
         WixNvuHk1IKehlW6Z3tQI5B2X9TGTN6UWeKcOy2aI0nydVmiHTBTEpwTvgy5UOm4A4zc
         UbewPO+AILX3DepuTlYmC0wg06cYH+dy1MAXOyk8QlFgy1+CtdsptQMi2lajKjQeN/Xz
         Xn9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=TlctZMjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18-20020a05622a041200b003bd165ffc87si6571402qtx.569.2023.02.27.04.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 04:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=TlctZMjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWcmV-0002F3-3u; Mon, 27 Feb 2023 07:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWcmD-0002Dk-T9
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 07:38:47 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWcmB-00015v-J5
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 07:38:45 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-172334d5c8aso7208835fac.8
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Tdw6LYsYhKnnDa1lcyJZ/PkbGt3pTohjvy5MbVoz0s=;
 b=TlctZMjJH8r3iIN6DnSUn4MxtjyOeRwXGrw6Mh9yajL2SXuJumYk0AiYGbpXVDKXfD
 Yu/EK0Qjb/abbAKQNXp9fA05UvmQp+pZnKpBzdePERRWrm1U7ImQO4YKs5tXuHuU0azN
 6uE+Zvb591YCj8ROkGmJS9HjF1NFfqtPLI+RuV/uDO4Zn20qGm+bpeF2ykuNuZsfqaap
 ayp/SxJEGxVCpaoZQhbaJdJl9jOj5qZ6cdpyfAniwx3uLbBKA6NbU9f+OtXvSOZ3Rag/
 vaENkcRqBphh7YnMC+RWssEOqx8YMqJo60RvdEyeqalnCGnOHXdmGp7yv6B92MfUbGk7
 8xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tdw6LYsYhKnnDa1lcyJZ/PkbGt3pTohjvy5MbVoz0s=;
 b=B4m8y8Q3mF0MBp0h2qVq41R0r1mtcbeAhrgVT6D053Cn8miBgMeNwCDdDVYF1yzpW2
 cyEZiDcIasJJ3sGcBoaz2iKIyynAlOiRkw3SQ5UdF0xS1vo2wCQ+bR623Apqa2JnJgN/
 POprwtl+KVUbP6qX0Vd/KD9scB+IJN5FJlxZwxHTniHxKCeWmdbSJZp3bgsWJuZLwrsr
 8EUlBrJBcEEVSd6Ln/IIcFI8ro5B9d3Y9D990vYe0Z4KWbTEzO5yRzsTRPJBIx2MKA8u
 +CGyJhC8UcebV1uiyk4G1uxIJnhLIQtmlYyxN/BTVrlUa39XiB2gmAY+j2X2WqNlaAR0
 +aDw==
X-Gm-Message-State: AO0yUKUhTZMYPIcCe9hKsdv664bnrfhNqQ4rUOGHEPICyGOkR9yRiKh/
 hWdRHE8S6bCckwcjnug1WekDDg==
X-Received: by 2002:a05:6870:80d4:b0:172:c150:9200 with SMTP id
 r20-20020a05687080d400b00172c1509200mr5962078oab.20.1677501522014; 
 Mon, 27 Feb 2023 04:38:42 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 ds53-20020a0568705b3500b0016e49af5815sm2225824oab.51.2023.02.27.04.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:38:41 -0800 (PST)
Message-ID: <8141699e-d035-ca7c-e284-d91cc00d10a4@ventanamicro.com>
Date: Mon, 27 Feb 2023 09:38:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] hw/riscv: Validate cluster and NUMA node boundary
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
 <20230225063527.281479-4-gshan@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225063527.281479-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: 80nc46grgD5r



On 2/25/23 03:35, Gavin Shan wrote:
> There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
> Both of them are required to follow cluster-NUMA-node boundary. To
> enable the validation to warn about the irregular configuration where
> multiple CPUs in one cluster has been associated with multiple NUMA
> nodes.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/spike.c | 2 ++
>   hw/riscv/virt.c  | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index cc3f6dac17..b09b993634 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -357,6 +357,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary = true;
>       mc->default_ram_id = "riscv.spike.ram";
>   }
>   
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b81081c70b..e5bb168169 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1636,6 +1636,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary = true;
>       mc->default_ram_id = "riscv_virt_board.ram";
>       assert(!mc->get_hotplug_handler);
>       mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
