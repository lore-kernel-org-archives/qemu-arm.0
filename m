Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp1069857ejb;
        Mon, 13 Mar 2023 23:24:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set9GHEtvgHAVoNbIlWWchLjPU/JRndpKwls8pEE25C7lNulZ+B/gQOb64Ri0yh/OPbM1nYWS
X-Received: by 2002:a05:6214:1cc4:b0:56e:b91f:aea3 with SMTP id g4-20020a0562141cc400b0056eb91faea3mr16566408qvd.48.1678775074891;
        Mon, 13 Mar 2023 23:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678775074; cv=none;
        d=google.com; s=arc-20160816;
        b=dyyOJtVEkTcnwD1YMwOKHi2aqOX9u0yqGSg7vgERDzffBFXVU9MEtcmcN7T+o5ncPC
         E6MYR/HiEzXeru6yMbx9ala4yQcYZMT9nY1xLTIQPPEDun9pdKS/SdUoVgTf0lZu62Sf
         9V7nNyKXyTa8h3eLtYxC+DakYjFdMDVa/LgvJO94xcdy2ZPQnCFwu7vEW8YVU/CXjJRA
         XdBz0w+kdwRbnuYj47iNPjZ3O+gamL1OnO1cUpANH4zPQOgxY9IW1lD6PjibIBpX4Pbi
         BHrNNyucolN5hrhDg9AgMpEbwyjvmmsOeOSsxkDMq7vyEq9JfYnXkAnuL9XQ0GlvJQKB
         rmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PYRVcpIwJk+u5iy/jxsHnFTWo42dj5wHqOkAhXl6HhI=;
        b=wv4uVBfeT77yxEVbAekdnTel3EkECID4pLRuGGfJSopLgB1oN2MOjUNe5nQut0U4nv
         20VaM5V4TfI8F6QXDinUkF94GAOc+xWA/1w6XHZeu1AuMCFn4lv6wvPvAd2Qoagi/0jx
         +CMclTgpT6pWOgPoXANwRtAKHwVt5fk0tQ3DevVnzRmz97YlMKjyA9JbNo0Gf5hneolu
         d7rMSJxGG6SWvVoGYFHYkdEs6NK8kBqaYuJi+uaBRKD4CLLXPDxMbgLrriWZ61IG2VnE
         lqrCxX1OlAH6XTblFR9dcw2HLHIe2nw7pq5qUaOlf5sSQi2XBVc/CLkF9+JQRCUfDgb0
         Ap7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7zZwfG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a0cca04000000b005a27256f5b6si1560394qvk.210.2023.03.13.23.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 23:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7zZwfG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pby57-0007xh-Ub; Tue, 14 Mar 2023 02:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pby55-0007x6-T6
 for qemu-arm@nongnu.org; Tue, 14 Mar 2023 02:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pby53-00082f-OV
 for qemu-arm@nongnu.org; Tue, 14 Mar 2023 02:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678775055;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYRVcpIwJk+u5iy/jxsHnFTWo42dj5wHqOkAhXl6HhI=;
 b=B7zZwfG7EoaicRz44mC2kRv5CxKD1L/sp+jSy52sKqenG3FNcvka2bfoO5JEDjAGaeHuft
 YfuQtS4wZbC8eJf+aXhuRSwXlj+JVB+153tmEZT46G2Rqro8IWISOiOylVApXXzWG3lGVz
 2Y7eeFhgBOt8A5njmSrf/PmQhQMib9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-VGL9BL0rPCGzqCqkD9-_bg-1; Tue, 14 Mar 2023 02:24:13 -0400
X-MC-Unique: VGL9BL0rPCGzqCqkD9-_bg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31519101A52E;
 Tue, 14 Mar 2023 06:24:12 +0000 (UTC)
Received: from [10.72.13.125] (ovpn-13-125.pek2.redhat.com [10.72.13.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C74492B00;
 Tue, 14 Mar 2023 06:24:01 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] numa: Validate cluster and NUMA node boundary if
 required
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
 <20230225063527.281479-2-gshan@redhat.com>
 <7853d60e-b2f2-c83d-7160-b69b2c7ad8b3@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <bbd783bc-1dca-a005-d545-da9c7d1b9d49@redhat.com>
Date: Tue, 14 Mar 2023 14:23:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <7853d60e-b2f2-c83d-7160-b69b2c7ad8b3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fsXyqVoA596u

On 3/13/23 7:40 PM, Philippe Mathieu-Daudé wrote:
> On 25/2/23 07:35, Gavin Shan wrote:
>> For some architectures like ARM64, multiple CPUs in one cluster can be
>> associated with different NUMA nodes, which is irregular configuration
>> because we shouldn't have this in baremetal environment. The irregular
>> configuration causes Linux guest to misbehave, as the following warning
>> messages indicate.
>>
>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>
>>    ------------[ cut here ]------------
>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>>    Modules linked in:
>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>    pc : build_sched_domains+0x284/0x910
>>    lr : build_sched_domains+0x184/0x910
>>    sp : ffff80000804bd50
>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>    Call trace:
>>     build_sched_domains+0x284/0x910
>>     sched_init_domains+0xac/0xe0
>>     sched_init_smp+0x48/0xc8
>>     kernel_init_freeable+0x140/0x1ac
>>     kernel_init+0x28/0x140
>>     ret_from_fork+0x10/0x20
>>
>> Improve the situation to warn when multiple CPUs in one cluster have
>> been associated with different NUMA nodes. However, one NUMA node is
>> allowed to be associated with different clusters.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/boards.h |  1 +
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index f29e700ee4..3513df5a86 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1252,6 +1252,45 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
>>       g_string_free(s, true);
>>   }
>> +static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>> +    NumaState *state = ms->numa_state;
>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
>> +    const CPUArchId *cpus = possible_cpus->cpus;
>> +    int len = possible_cpus->len, i, j;
> 
> (Nitpicking, 'len' variable is not very useful).
> 

Yes, Lets drop it if I need to post a new revision :)

>> +
>> +    if (state->num_nodes <= 1 || len <= 1) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The Linux scheduling domain can't be parsed when the multiple CPUs
>> +     * in one cluster have been associated with different NUMA nodes. However,
>> +     * it's fine to associate one NUMA node with CPUs in different clusters.
>> +     */
>> +    for (i = 0; i < len; i++) {
>> +        for (j = i + 1; j < len; j++) {
>> +            if (cpus[i].props.has_socket_id &&
>> +                cpus[i].props.has_cluster_id &&
>> +                cpus[i].props.has_node_id &&
>> +                cpus[j].props.has_socket_id &&
>> +                cpus[j].props.has_cluster_id &&
>> +                cpus[j].props.has_node_id &&
>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>> +                cpus[i].props.cluster_id == cpus[j].props.cluster_id &&
>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>> +                warn_report("CPU-%d and CPU-%d in socket-%ld-cluster-%ld "
>> +                             "have been associated with node-%ld and node-%ld "
>> +                             "respectively. It can cause OSes like Linux to"
>> +                             "misbehave", i, j, cpus[i].props.socket_id,
>> +                             cpus[i].props.cluster_id, cpus[i].props.node_id,
>> +                             cpus[j].props.node_id);
> 
> machine_run_board_init() takes an Error* argument, but is only called
> once by qemu_init_board() with errp=&error_fatal. I suppose using
> warn_report() here is OK.
> 
> Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

warn_report() here is correct because it's inappropriate to propogate the
warning message to @error_fatal through error_setg(). When the messages
included in @error_fatal is handled and printed in util/error.c::error_handle(),
the QEMU process will be terminated unexpectedly.

>> +            }
>> +        }
>> +    }
>> +}
>> +
>>   MemoryRegion *machine_consume_memdev(MachineState *machine,
>>                                        HostMemoryBackend *backend)
>>   {
>> @@ -1337,6 +1376,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>           numa_complete_configuration(machine);
>>           if (machine->numa_state->num_nodes) {
>>               machine_numa_finish_cpu_init(machine);
>> +            if (machine_class->cpu_cluster_has_numa_boundary) {
>> +                validate_cpu_cluster_to_numa_boundary(machine);
>> +            }
>>           }
>>       }

Thanks,
Gavin

