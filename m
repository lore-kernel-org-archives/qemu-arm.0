Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp166735ejb;
        Mon, 13 Mar 2023 04:40:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set8VK2l/Qy660Crgzs7DRbQl7vS/vc1+FVmkoCQ0QaLbLU+h6sRrV9wuwK/ewfVvAETWRA2l
X-Received: by 2002:a05:6214:ca8:b0:56f:154:250e with SMTP id s8-20020a0562140ca800b0056f0154250emr14022102qvs.35.1678707644492;
        Mon, 13 Mar 2023 04:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707644; cv=none;
        d=google.com; s=arc-20160816;
        b=0x3EiwUt60t9N2B4fOejmltkLLTfILNIsWXzZgAzJoQT4n3wB5Akt+yyjgEdy2L/gW
         0eRHElNjtKEY0b2EABUQe7Hz+QPrybm2GGhRSaAUOjLBHtlxPi0xqM2jv0LMu15o3KG5
         jQ+Q8Dyb0visLUlUySlDdTQyARKTrf5uWIcjelnAWl6wZIH5sBwjRbtaX/sqvSkBVZiv
         em9r5aR79RrZSRce72+6bIYp84Xf+nzHMCofgpwmslDvKDNMpLJWsgcB+JfridOuOw2e
         fsMADMjgpAVcb6LM7hXWAFk4FP0zhwnOtEIh4Yczsc4bY/qcKzv2Q3EV/BOmgKiNPbSh
         TAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UiFoUA81V4aPPuk00TispSuT5tLI9a4wkzitJ40zKPw=;
        b=xyw9jj8xMPz4cyOXD7Boedp7cwzcP9SBexJ/x46C7kUDGN/ovwUgz2ilix+ryynvhA
         zTw+J7H6X1wlZo168KocLCAaAM3QvxcgsgxOeszFQ+mYYt+WR0VY+kgi/uvcWSLqTXQL
         qLm1hUeUTuPKoXOAjr8rG+Ey/EUHo78T3t9Wg4nvtVKt56Ej2n5ZEwz1x+VZBkNyyI/R
         vIOgu63/4yAHa+Vaer4eqbNByyYyPnFJMpiD5wWL1oDBjQfgpmGp8IwsJw1nyLEIxA+i
         aaaFN930sm386RPRMPCZAmxk99RKcCJ7sgiaLLn7T7dCQZqP9PeUI4M5cuHwBRfHp6tx
         1ySw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QpC6nUm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20-20020a0ce494000000b005a2a06a2a19si4252444qvl.261.2023.03.13.04.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 04:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QpC6nUm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbgXG-0000zS-04; Mon, 13 Mar 2023 07:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbgXE-0000ym-9Q
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 07:40:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbgXB-0002yi-IN
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 07:40:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v16so11047333wrn.0
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678707607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UiFoUA81V4aPPuk00TispSuT5tLI9a4wkzitJ40zKPw=;
 b=QpC6nUm0eRJxdnl5vA4C6A5oSoscBmorqvVWT/KVF4lJGnEkvr1Xd+fCqe1yacrwlQ
 ioOtsmXR2MIq8xnBmsR0Y88SC/dUdEkiscEDaI2eWrG3kbkYHNoYbS51F2+EXbfhDLc+
 wqFUtHRkPmAuIN3UZj2x61PML1WgOYBaidrQfsG4yUWZ1NPQqlArPlFKcouLB4eUkbR9
 mTmZvriBeHgPxI1jYwRAEGWraQEeD4pIKxIyPh9a31rVN8WOOpj02a7VgVZlDI9aYMyl
 Q49Y7DbAu4qVDUigg6MTp5GHjwvtnRVNSHzK53TXZ1Ct7sXBYuY8Y5gb8VlZUQFIfWiw
 Sm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678707607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UiFoUA81V4aPPuk00TispSuT5tLI9a4wkzitJ40zKPw=;
 b=rmp/YCcjK66bJ0xPkkLyoPqmZXII7ZBtcGEK/2wMlPQW48MaBcTP0FkAmLcZ0rTvhQ
 eyE7DH6dtp4PUkc82mxhS5DbGnVSvXEeLvVxQGXkgRx8WefYM4AEWB2BtZHzKW4sDlKJ
 mHOgabvyW7azpyAurm+ybivqS1V5c1H9pxBm+dbQrGGQRXwIi56WeK4hiXx+87SzdI1n
 sRaCuGKCrEL/YRfrWhlebwjCVEIonl6qWvhC2WE+8on1257GCT90tSfu88PzrJjwNrfr
 WBUQIg8dV4tHG0C25EDqFNOY8s+nSSqhIPrFdeDUn6yqXeUJVNeu4tV+wT6HMEb9jujh
 mo1w==
X-Gm-Message-State: AO0yUKVocBmSWYfvk+lQ63ia/WG+7zSf/4qDlcfZ5YgodnHOXrPAI4NE
 ZC/UcJbeBoXjaD2ZcuZ1Q5tQGQ==
X-Received: by 2002:adf:f1c2:0:b0:2cf:6088:3949 with SMTP id
 z2-20020adff1c2000000b002cf60883949mr1859466wro.18.1678707607295; 
 Mon, 13 Mar 2023 04:40:07 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e3-20020adfdbc3000000b002c55efa9cbesm7911867wrj.39.2023.03.13.04.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 04:40:06 -0700 (PDT)
Message-ID: <7853d60e-b2f2-c83d-7160-b69b2c7ad8b3@linaro.org>
Date: Mon, 13 Mar 2023 12:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] numa: Validate cluster and NUMA node boundary if
 required
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
 <20230225063527.281479-2-gshan@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225063527.281479-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: xpqttSADzQz/

On 25/2/23 07:35, Gavin Shan wrote:
> For some architectures like ARM64, multiple CPUs in one cluster can be
> associated with different NUMA nodes, which is irregular configuration
> because we shouldn't have this in baremetal environment. The irregular
> configuration causes Linux guest to misbehave, as the following warning
> messages indicate.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> Improve the situation to warn when multiple CPUs in one cluster have
> been associated with different NUMA nodes. However, one NUMA node is
> allowed to be associated with different clusters.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/boards.h |  1 +
>   2 files changed, 43 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f29e700ee4..3513df5a86 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1252,6 +1252,45 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
>       g_string_free(s, true);
>   }
>   
> +static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    NumaState *state = ms->numa_state;
> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> +    const CPUArchId *cpus = possible_cpus->cpus;
> +    int len = possible_cpus->len, i, j;

(Nitpicking, 'len' variable is not very useful).

> +
> +    if (state->num_nodes <= 1 || len <= 1) {
> +        return;
> +    }
> +
> +    /*
> +     * The Linux scheduling domain can't be parsed when the multiple CPUs
> +     * in one cluster have been associated with different NUMA nodes. However,
> +     * it's fine to associate one NUMA node with CPUs in different clusters.
> +     */
> +    for (i = 0; i < len; i++) {
> +        for (j = i + 1; j < len; j++) {
> +            if (cpus[i].props.has_socket_id &&
> +                cpus[i].props.has_cluster_id &&
> +                cpus[i].props.has_node_id &&
> +                cpus[j].props.has_socket_id &&
> +                cpus[j].props.has_cluster_id &&
> +                cpus[j].props.has_node_id &&
> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
> +                cpus[i].props.cluster_id == cpus[j].props.cluster_id &&
> +                cpus[i].props.node_id != cpus[j].props.node_id) {
> +                warn_report("CPU-%d and CPU-%d in socket-%ld-cluster-%ld "
> +                             "have been associated with node-%ld and node-%ld "
> +                             "respectively. It can cause OSes like Linux to"
> +                             "misbehave", i, j, cpus[i].props.socket_id,
> +                             cpus[i].props.cluster_id, cpus[i].props.node_id,
> +                             cpus[j].props.node_id);

machine_run_board_init() takes an Error* argument, but is only called
once by qemu_init_board() with errp=&error_fatal. I suppose using
warn_report() here is OK.

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +            }
> +        }
> +    }
> +}
> +
>   MemoryRegion *machine_consume_memdev(MachineState *machine,
>                                        HostMemoryBackend *backend)
>   {
> @@ -1337,6 +1376,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>           numa_complete_configuration(machine);
>           if (machine->numa_state->num_nodes) {
>               machine_numa_finish_cpu_init(machine);
> +            if (machine_class->cpu_cluster_has_numa_boundary) {
> +                validate_cpu_cluster_to_numa_boundary(machine);
> +            }
>           }
>       }

