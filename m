Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3714109ejb;
        Tue, 21 Feb 2023 15:32:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+erAHUcaBtBDAIaTLaEROMriU08Gwzrmnwag7G8HZs+26jey9SeGtoc23FZuFXDVbcS2pe
X-Received: by 2002:a05:6214:5011:b0:56e:fb1b:3c6d with SMTP id jo17-20020a056214501100b0056efb1b3c6dmr10183468qvb.38.1677022327271;
        Tue, 21 Feb 2023 15:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677022327; cv=none;
        d=google.com; s=arc-20160816;
        b=xw5C4a/3oc87xSNqeMN6taUDBBjHTaYQrxyj6chId8PT5ybDPlJMsaRKFgPatksK4w
         dXOAuQc4mpg1uMz6TANeyZ00ULrkutJCyS8OVhmpGQzn+z7HaE85vwB20S5T8iUn4kxv
         ZcvWBcu8ZgAbYuzr9uG8ZfsTY2cXGIskh0Cqm1hXPUbHv+9g2zDg7gdBfMGGyUswopE5
         3WFW7kdw4AIasuRtUBnJb+6irvubaQ/tL2cbfkN2lBk4rJpKdCfIp+PfjQM1CC2oqMN6
         gMT6M6JIqqK3IxI52LENj9DT1LsnKgbUakHmmUVweIlznDSSxVPfl5qEXfDIgV2vDlEu
         2Tmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5uxvXRGBI9/B10yveBE80mDp8T1mznwE9dNv+/aatg4=;
        b=Kqps/oD1CiCW3K7rof3qwR+zm4SCYx/k5GkK1vtbfR/uuAt5sUPRemQtPFrwzShCuD
         2068T/iJ4AQ2xR5Tur9Ww882vAsPKnFVekqFShFZ3QoIPgDLnlaYgrETj/KGZouDhipA
         FxDuDgreTALWN7ABxnRfY9riHc4ddaLxxpkBht3StfJJvvyVT3nTpKwJWxjZZJ89aUIs
         i9tus4TkwAj4q1gfGP1YP8gq2byF4ZfgGX3fyC/PFNaSegl/AXWR3Mh2TUcacl5grRXS
         2KzPpO8ChWx2kG6WScoPyhhtKq6zjlDSCihYY7FlVDyJLve+xm+GRNcxdAjkMMZs60M0
         YCBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LktjvSAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p63-20020a374242000000b0073ba79a463csi537616qka.453.2023.02.21.15.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LktjvSAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUc6r-0003tc-LG; Tue, 21 Feb 2023 18:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc6p-0003rl-JG
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:31:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUc6n-0003Vh-Hx
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:31:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so2257124wmq.2
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 15:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5uxvXRGBI9/B10yveBE80mDp8T1mznwE9dNv+/aatg4=;
 b=LktjvSAkHcwpgNb3mznrZzELL43ylOOY2vI2ZBCtEu58xWPGa7y3vGtoQGrVdrJ8y9
 Omjo5zkewwhMJ2mSiWS77Ax19njdWhc5qyQBNvex0ALSYht2z2DhRW6n0XYtED9KL2Db
 ips4UPn7wXazBl1/wK4rNl69k0LQaWntvA9izQ3pyzE4sLMIC/Et7h3zp9O65rznRjN7
 arcZ4qD0oy6Ay4m7k19F1/u/ngerPWTDbHg5ZM5yt6IX0YIK8TMFFF+QG/0E1j/dgQ4g
 YhBOb6g8KtENrSM1/6A658OP0bS18F7o6jcMo4kmDJAkE8V8vaeS1KhoqDG5DPVq+Q35
 VDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uxvXRGBI9/B10yveBE80mDp8T1mznwE9dNv+/aatg4=;
 b=UiUsn7pEoy7A31j7DmwX57zTGvhSbrkggQFPm0hlHyjqKI0FsLpgoz81LVPv2xvIBE
 /DXikO3nakuxiY7n2+njmk25Yhis/xoWDRtv64eUVJq5srUJJ2lq+GiBebrFWjzjx6mW
 Al61R2YnLdWMmIXdrk/fAGPbEbUQ65uQtUbW7+uXXhr1KwrXpRiVnwOtC/RyCNMOHgBK
 TDEgVp1NVq5sPU8/PMDax7nbt+eEWOK12LwXKo4yGXZOcI9Um8Xf4RoMvo9A4ZMVtLnZ
 wQiMjKu7zUiy0CVhAcbGTqoGkkMxwrmhHF4GDgXMSxZhvxXQPMSDLQ1BP5f5LAE+icgz
 MwZA==
X-Gm-Message-State: AO0yUKV2apQvKOEndumEI6DGSrEIlkTi19unJS7AeWf2hA4K9VGGg75k
 L7BmnpQs+IVPy2kv1MnukTaL6w==
X-Received: by 2002:a05:600c:4d06:b0:3dc:5937:35a2 with SMTP id
 u6-20020a05600c4d0600b003dc593735a2mr4999341wmp.9.1677022299896; 
 Tue, 21 Feb 2023 15:31:39 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1c7203000000b003dc522dd25esm6233025wmc.30.2023.02.21.15.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 15:31:39 -0800 (PST)
Message-ID: <d49eb549-9a8f-ad31-9836-cfd7dac78be6@linaro.org>
Date: Wed, 22 Feb 2023 00:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
 <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
 <b76a1ffa-f9d8-192d-ef65-0fdf43dabaa6@linaro.org>
 <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8150f6d9-9c5b-28c5-4744-ee866cf16ca7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: sFGsU0pchWP6

On 22/2/23 00:12, Gavin Shan wrote:
> On 2/21/23 9:21 PM, Philippe Mathieu-Daudé wrote:
>> On 21/2/23 10:21, Gavin Shan wrote:
>>> On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
>>>> On 21/2/23 09:53, Gavin Shan wrote:
>>>>> Linux kernel guest reports warning when two CPUs in one socket have
>>>>> been associated with different NUMA nodes, using the following command
>>>>> lines.
>>>>>
>>>>>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>>>
>>>>>    ------------[ cut here ]------------
>>>>>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 
>>>>> build_sched_domains+0x284/0x910
>>>>>    Modules linked in:
>>>>>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>>>>>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>    pc : build_sched_domains+0x284/0x910
>>>>>    lr : build_sched_domains+0x184/0x910
>>>>>    sp : ffff80000804bd50
>>>>>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>>>>>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>>>>>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>>>>>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>>>>>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>>>>>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>>>>>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>>>>>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>>>>>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>>>>>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>>>>>    Call trace:
>>>>>     build_sched_domains+0x284/0x910
>>>>>     sched_init_domains+0xac/0xe0
>>>>>     sched_init_smp+0x48/0xc8
>>>>>     kernel_init_freeable+0x140/0x1ac
>>>>>     kernel_init+0x28/0x140
>>>>>     ret_from_fork+0x10/0x20
>>>>>
>>>>> Fix it by preventing mutiple CPUs in one socket to be associated with
>>>>> different NUMA nodes.
>>>>>
>>>>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index ac626b3bef..e0af267c77 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>>>>       return false;
>>>>>   }
>>>>> +static bool numa_state_valid(MachineState *ms)
>>>>> +{
>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>>> +    NumaState *state = ms->numa_state;
>>>>> +    const CPUArchIdList *possible_cpus = 
>>>>> mc->possible_cpu_arch_ids(ms);
>>>>> +    const CPUArchId *cpus = possible_cpus->cpus;
>>>>> +    int len = possible_cpus->len, i, j;
>>>>> +
>>>>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>>>>> +        return true;
>>>>> +    }
>>>>> +
>>>>> +    for (i = 0; i < len; i++) {
>>>>> +        for (j = i + 1; j < len; j++) {
>>>>> +            if (cpus[i].props.has_socket_id &&
>>>>> +                cpus[i].props.has_node_id &&
>>>>> +                cpus[j].props.has_socket_id &&
>>>>> +                cpus[j].props.has_node_id &&
>>>>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>>>>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>>>>> +                error_report("CPU-%d and CPU-%d in socket-%ld have 
>>>>> been "
>>>>> +                             "associated with node-%ld and node-%ld",
>>>>> +                             i, j, cpus[i].props.socket_id,
>>>>> +                             cpus[i].props.node_id,
>>>>> +                             cpus[j].props.node_id);
>>>>> +                return false;
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>>   static void create_randomness(MachineState *ms, const char *node)
>>>>>   {
>>>>>       struct {
>>>>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState 
>>>>> *machine)
>>>>>           exit(1);
>>>>>       }
>>>>> +    if (!numa_state_valid(machine)) {
>>>>> +        exit(1);
>>>>> +    }
>>>>
>>>> Why restrict to the virt machine?
>>>>
>>>
>>> We tried x86 machines and virt machine, but the issue isn't 
>>> reproducible on x86 machines.
>>> So I think it's machine or architecture specific issue. However, I 
>>> believe RiscV should
>>> have similar issue because linux/drivers/base/arch_topology.c is 
>>> shared by ARM64 and RiscV.
>>> x86 doesn't use the driver to populate its CPU topology.
>>
>> Oh, I haven't thought about the other archs, I meant this seem a generic
>> issue which affects all (ARM) machines, so why restrict to the (ARM)
>> virt machine?
>>
> 
> [Ccing Igor for comments]
> 
> Well, virt machine is the only concern to us for now. You're right that 
> all ARM64 and ARM machines
> need this check and limitation. So the check needs to be done in the 
> generic path. The best way
> I can figure out is like something below. The idea is to introduce a 
> switch to 'struct NumaState'
> and do the check in the generic path. The switch is turned on by 
> individual machines. Please let me
> know if you have better ideas

Can't this be done generically in machine_numa_finish_cpu_init()
-> numa_validate_initiator()?

> - Add 'bool struct NumaState::has_strict_socket_mapping', which is 
> 'false' by default until
>    machine specific initialization function calls helper 
> set_numa_strict_socket_mapping(), for
>    example in hw/arm/virt.c::virt_instance_init().
> 
> - In numa_complete_configuration(), do the check to make sure the socket 
> doesn't cross over
>    the NUMA node boundary if 'bool struct 
> NumaState::has_strict_socket_mapping' is true.
> 
> Thanks,
> Gavin
> 
> 

