Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3702900ejb;
        Tue, 21 Feb 2023 15:13:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/3Bx3Yz7/1fZxfvZyGAFAbVIQ2jpXQ47rl7GBJYLGSPt5DXpe0I4XVVBXbXXbZnEOOY7to
X-Received: by 2002:a05:622a:144d:b0:3b9:b43e:5733 with SMTP id v13-20020a05622a144d00b003b9b43e5733mr12275798qtx.61.1677021208738;
        Tue, 21 Feb 2023 15:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677021208; cv=none;
        d=google.com; s=arc-20160816;
        b=a6ki5+n7QW5SEg6CIDYS169Ey3Ce1q56AitrbgmAQYIDABbOJZMbeB4ZVO7LMmB3Y7
         YFFRMCF3IqIpfxz9/UqMFthJDeXZ33h+nTl4oDUZ1yIOCCNGxU02LVycix5IndV/nh7N
         v70DLI8WHSznDNGtss3Er1Fr7Gj2DQwtx9VyZx7CAsl1nGzTWxc651lskAdl8/VQcydZ
         hiQHwvkdm8v4Y7MpbNMVRMqeeJhEwT7HIFemmBR5pxHYQXEUzdUHXu28ZmMrAvw3tOsT
         A4RxbpRiBiyedhDf731cTsX//iSIoMnLLQ+BjlNv6zGYgi7jDnN0QOq5YYaCY9dKbvnt
         WzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=epKb2cEAGEs/ZO+CT+qZUFkJb8zy5umFRE1O+tZ8JeY=;
        b=J28J8P+FXRWCIvq+Wj6c21a4ZI0QcCmP9qHKTd5jZI0fpbPmohGskBlSoHf+wMBiNL
         Gyd9JoRUAvxzxMnkbG0c5VYTeAPQUvBubzBiDx46SqINKa7PbP/GDPI7SWJStDy+q8o6
         yLpk/bI1dXRoxV35Fx3raZSkN0CUqTp9twp09y1752jUFjMy3kZGPY0VGJcJAJyXoSRQ
         PMe/5O8oUPOhIdvoyprwrYAbNDOT97Lb3cx2W4G1P+tc6CkphI/zz0DhSraETC2eAJF4
         pgYr2Evn30RNrtJE5EfC4X3BM7ATaQz0DDNTI3FyYAEm9cGadTmGmwTtZ6NIWK8eppeE
         F3Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdwUMpFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05622a018d00b003bb7eafc0efsi3463490qtw.654.2023.02.21.15.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdwUMpFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUboq-00087o-2i; Tue, 21 Feb 2023 18:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUboo-00087X-KM
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:13:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbom-00084A-7g
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677021183;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epKb2cEAGEs/ZO+CT+qZUFkJb8zy5umFRE1O+tZ8JeY=;
 b=AdwUMpFfmKxGQirz5fQC1V8P1PASt7s39j/xTOMUkvwEeJHVpMvgqV3oPPTT978gXLRfyx
 PD7tT4ef6LajKv10yuNrsYdA3yb7B1GDKwaReIrxoROQEtRZ7gLzs7AEYtAlQuGqAmMOQR
 WvJBdaQY01/K5HevmdFDcQGG2YCQkDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-0U0PsZ3LNKu9zhBT4oAbLA-1; Tue, 21 Feb 2023 18:13:01 -0500
X-MC-Unique: 0U0PsZ3LNKu9zhBT4oAbLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBEC380D0F0;
 Tue, 21 Feb 2023 23:13:00 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94976C15BA0;
 Tue, 21 Feb 2023 23:12:55 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
 <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
 <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
Date: Wed, 22 Feb 2023 10:12:46 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: alh8ujNgtI9B

On 2/21/23 9:21 PM, Philippe Mathieu-Daudé wrote:
> On 21/2/23 10:21, Gavin Shan wrote:
>> On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
>>> On 21/2/23 09:53, Gavin Shan wrote:
>>>> Linux kernel guest reports warning when two CPUs in one socket have
>>>> been associated with different NUMA nodes, using the following command
>>>> lines.
>>>>
>>>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>>
>>>>    ------------[ cut here ]------------
>>>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>>>>    Modules linked in:
>>>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>    pc : build_sched_domains+0x284/0x910
>>>>    lr : build_sched_domains+0x184/0x910
>>>>    sp : ffff80000804bd50
>>>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>>>    Call trace:
>>>>     build_sched_domains+0x284/0x910
>>>>     sched_init_domains+0xac/0xe0
>>>>     sched_init_smp+0x48/0xc8
>>>>     kernel_init_freeable+0x140/0x1ac
>>>>     kernel_init+0x28/0x140
>>>>     ret_from_fork+0x10/0x20
>>>>
>>>> Fix it by preventing mutiple CPUs in one socket to be associated with
>>>> different NUMA nodes.
>>>>
>>>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 37 insertions(+)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index ac626b3bef..e0af267c77 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>>>       return false;
>>>>   }
>>>> +static bool numa_state_valid(MachineState *ms)
>>>> +{
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>> +    NumaState *state = ms->numa_state;
>>>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
>>>> +    const CPUArchId *cpus = possible_cpus->cpus;
>>>> +    int len = possible_cpus->len, i, j;
>>>> +
>>>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < len; i++) {
>>>> +        for (j = i + 1; j < len; j++) {
>>>> +            if (cpus[i].props.has_socket_id &&
>>>> +                cpus[i].props.has_node_id &&
>>>> +                cpus[j].props.has_socket_id &&
>>>> +                cpus[j].props.has_node_id &&
>>>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>>>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>>>> +                error_report("CPU-%d and CPU-%d in socket-%ld have been "
>>>> +                             "associated with node-%ld and node-%ld",
>>>> +                             i, j, cpus[i].props.socket_id,
>>>> +                             cpus[i].props.node_id,
>>>> +                             cpus[j].props.node_id);
>>>> +                return false;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>>   static void create_randomness(MachineState *ms, const char *node)
>>>>   {
>>>>       struct {
>>>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
>>>>           exit(1);
>>>>       }
>>>> +    if (!numa_state_valid(machine)) {
>>>> +        exit(1);
>>>> +    }
>>>
>>> Why restrict to the virt machine?
>>>
>>
>> We tried x86 machines and virt machine, but the issue isn't reproducible on x86 machines.
>> So I think it's machine or architecture specific issue. However, I believe RiscV should
>> have similar issue because linux/drivers/base/arch_topology.c is shared by ARM64 and RiscV.
>> x86 doesn't use the driver to populate its CPU topology.
> 
> Oh, I haven't thought about the other archs, I meant this seem a generic
> issue which affects all (ARM) machines, so why restrict to the (ARM)
> virt machine?
> 

[Ccing Igor for comments]

Well, virt machine is the only concern to us for now. You're right that all ARM64 and ARM machines
need this check and limitation. So the check needs to be done in the generic path. The best way
I can figure out is like something below. The idea is to introduce a switch to 'struct NumaState'
and do the check in the generic path. The switch is turned on by individual machines. Please let me
know if you have better ideas

- Add 'bool struct NumaState::has_strict_socket_mapping', which is 'false' by default until
   machine specific initialization function calls helper set_numa_strict_socket_mapping(), for
   example in hw/arm/virt.c::virt_instance_init().

- In numa_complete_configuration(), do the check to make sure the socket doesn't cross over
   the NUMA node boundary if 'bool struct NumaState::has_strict_socket_mapping' is true.

Thanks,
Gavin


