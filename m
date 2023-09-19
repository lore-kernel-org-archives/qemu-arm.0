Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3855104ejb;
        Tue, 19 Sep 2023 13:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/j78kPgfzbXst5v351GIdnc+NDNHZkWnJXPXQmKnWJJgUEnpY3fHYMxHEinxy01++4G+T
X-Received: by 2002:a05:622a:413:b0:401:e0b4:a93f with SMTP id n19-20020a05622a041300b00401e0b4a93fmr640764qtx.41.1695155157696;
        Tue, 19 Sep 2023 13:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695155157; cv=none;
        d=google.com; s=arc-20160816;
        b=ug8l973k8FEbh36UAfZlBVl9EYr4eBH3SqaGcAQCdU1EYXbJA7Bi0hSzZ5Liz4GYcL
         sHWWifHAu/gf70mBre+Uq85Hnway2BK6MR/ERHb/rxAoATfO/g2XcUBcs+trIE1ODiOu
         NrwqCBNqfzqmQSxVnRmMDaqgKwxRRjaRLvlQQDZR2WofzK+ypjQDW2Zx6SNqE1Yvqb5t
         WZ233gElgXEc/95i3ieyMfwVo6rtyDO/QizV14d2j0JtkpanmW/BZnix+UBHtTRglQId
         BPU5h5jCb3uJcedPWsE4EzGGa59/MCNyUdyf1h8Q9yrgIz8PvORAMVKoFdf4yaGDi+wQ
         GPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ouMVb2HYYo1v6vIgurlKVjciLo7o07AaquZytwB3QEw=;
        fh=6wln2dfQ/nvtquk8WkbgHCi2N0ApXaCJS7imQvaaxnE=;
        b=zSL7WjQYnKw7JYmfBT+o1/uNgFIFXltz3ccXuw604cdSZf+lrxt3/wPZMBTXCTyTBy
         fO+zuAt/2kwXzZM4ThgBn5zSDTvWAvmbyzS9+qK62MdzqGupV0t2FhYDx5aNaQWs2chK
         OC/mCE4NxwH4Tw+xYZpjai8xMSS/oG4UepFfgMa5ImFAXXWODL/Mp10pqL94zkmruYeA
         zxxGCWXd8LNJohCfK36yeRcdjE2GEsmRS5pUxm5t5oKuYXgqD+SZ1O8Mv0I37kIXB/OC
         KDSV5BwAMfk713/UG8Ds3i5J5Pg2sNU6q9Ndqjy9PcdCwZlPb6PGfWLaYkOI+ocECWTI
         54dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DxvdI0MY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a05620a04e700b0076f19d66ddfsi7922096qkh.138.2023.09.19.13.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DxvdI0MY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qihHX-00017C-WD; Tue, 19 Sep 2023 16:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qihHW-00016L-RS
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 16:25:14 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qihHT-0004ti-KK
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 16:25:14 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3ade1c7ffcfso1110012b6e.3
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695155110; x=1695759910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouMVb2HYYo1v6vIgurlKVjciLo7o07AaquZytwB3QEw=;
 b=DxvdI0MYrCaMqsNjTqB93xSQ7wQME9YVrNECsQ9RAOso0y8MhBn7zmRgUXbApdlHjo
 vdwKc2jmx28P5HtnpfDgXNFNARNsZDN6LYE+yYfW8t3Pl4O+zKfkt3DE3b6m4fwBEfFd
 kyf2LPHDazeotu5sWlYV2RfAe+FusLUjAsX6ENT7DVV6HqC12fPkVcNTTgJ3LtTpGpNq
 wEZvthLYMi6vyW/XO+vHx4Dd8KkFM/y40fosK4ClZvHpilajFxGL1ZKn7I3XpVz83DdG
 YMpEyABk5OP4rH7LZPMXKW72O33zE2xGSjd9qKfCOiYE84660tr5N5Sg9TQNJlFJQFxq
 +SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695155110; x=1695759910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouMVb2HYYo1v6vIgurlKVjciLo7o07AaquZytwB3QEw=;
 b=vER7xpTsbui9l1TVWj3KWK53yd8qBZzgwuSJ5BrP0XEuyIhz2ENhVpuoWipVuvDeN2
 QPf5SrEfjYlPAHqoklVWg5+8iC5BIm+7WkuN8DmWU6KOaaZw08gbNdFG7iUvnzSMs3+a
 u39uHRqtxKqX+ql7+EHtyqqQOjxcsYBakXzJg9Z7NRxqkJOTbAsB2mvdfD0dxERP1Y4i
 Zr78lv57p3xXdOwfQW8ON88KsvE7ZRflefCiZrYh2quifShpXDUVDSFmMntyFgG6ISUm
 hNU0mvSyhQrGjL6gN293PJSer8Mw0Eba7nri4h6Ayloku8xR6QWkeLy2KS8jjAUDxB7c
 KqxA==
X-Gm-Message-State: AOJu0YzyFw9XQFDtkO/Qm/MDEcuX21bZzEO1qH/io+XbTEnQRqu9ktdR
 UXhSWdB2OX/zSAgc+vGFG77QlQ==
X-Received: by 2002:a05:6808:286:b0:3a8:b056:c3a2 with SMTP id
 z6-20020a056808028600b003a8b056c3a2mr375836oic.47.1695155110232; 
 Tue, 19 Sep 2023 13:25:10 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.127.211])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a54488d000000b003a792121f47sm5254501oic.45.2023.09.19.13.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 13:25:09 -0700 (PDT)
Message-ID: <8714d6cd-84c4-f592-1a9b-ecee28b025be@ventanamicro.com>
Date: Tue, 19 Sep 2023 17:24:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/32] target/riscv: Use generic helper to show CPU
 model names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-14-gshan@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230907003553.1636896-14-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +Y+sOG2nIlup



On 9/6/23 21:35, Gavin Shan wrote:
> For target/riscv, the CPU type name is always the combination of the
> CPU model name and suffix. The CPU model names have been correctly
> shown in riscv_cpu_list_entry() and riscv_cpu_add_definition()
> 
> Use generic helper cpu_mdoel_from_type() to show the CPU model names
> in the above two functions, and adjusted format of the output from
> riscv_cpu_list_entry() to match with other targets. Besides, the
> function riscv_cpu_class_by_name() is improved by renaming @cpuname
> to @model since it's for the CPU model name, and merging the condtion

typo: "condition"

> of "@oc == NULL" to object_class_dynamic_cast().
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---


Tested with "-cpu help" and "query-cpu-definitions". LGTM


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c            | 23 +++++++++++++----------
>   target/riscv/riscv-qmp-cmds.c |  3 +--
>   2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..a525e24c5a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -612,18 +612,19 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
>       char *typename;
> -    char **cpuname;
> +    char **model;
>   
> -    cpuname = g_strsplit(cpu_model, ",", 1);
> -    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpuname[0]);
> +    model = g_strsplit(cpu_model, ",", 1);
> +    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), model[0]);
>       oc = object_class_by_name(typename);
> -    g_strfreev(cpuname);
> +    g_strfreev(model);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
> -        object_class_is_abstract(oc)) {
> -        return NULL;
> +    if (object_class_dynamic_cast(oc, TYPE_RISCV_CPU) &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
>       }
> -    return oc;
> +
> +    return NULL;
>   }
>   
>   static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> @@ -2211,9 +2212,10 @@ static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
>   static void riscv_cpu_list_entry(gpointer data, gpointer user_data)
>   {
>       const char *typename = object_class_get_name(OBJECT_CLASS(data));
> -    int len = strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX);
> +    char *model = cpu_model_from_type(typename);
>   
> -    qemu_printf("%.*s\n", len, typename);
> +    qemu_printf("  %s\n", model);
> +    g_free(model);
>   }
>   
>   void riscv_cpu_list(void)
> @@ -2222,6 +2224,7 @@ void riscv_cpu_list(void)
>   
>       list = object_class_get_list(TYPE_RISCV_CPU, false);
>       list = g_slist_sort(list, riscv_cpu_list_compare);
> +    qemu_printf("Available CPUs:\n");
>       g_slist_foreach(list, riscv_cpu_list_entry, NULL);
>       g_slist_free(list);
>   }
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
> index 5ecff1afb3..22f728673f 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -35,8 +35,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
>       const char *typename = object_class_get_name(oc);
>       ObjectClass *dyn_class;
>   
> -    info->name = g_strndup(typename,
> -                           strlen(typename) - strlen("-" TYPE_RISCV_CPU));
> +    info->name = cpu_model_from_type(typename);
>       info->q_typename = g_strdup(typename);
>   
>       dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
