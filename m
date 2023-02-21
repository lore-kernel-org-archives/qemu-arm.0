Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3080808ejb;
        Tue, 21 Feb 2023 01:21:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8yyE8A5M5ZVvNCsNIfbffgZgqjXLMz5qm7Sdd+CZ3cVmBqrAafdRkOUe2bheAshCWjn/Ov
X-Received: by 2002:a05:622a:1809:b0:3b9:bf43:fccd with SMTP id t9-20020a05622a180900b003b9bf43fccdmr20057292qtc.10.1676971290097;
        Tue, 21 Feb 2023 01:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676971290; cv=none;
        d=google.com; s=arc-20160816;
        b=xOdfw1SpvYKqZkUKZpkVVcRl4b0bY4iP+GAhlvwD450gdQrvDir/WPkdwzSkmRpfj4
         IhfF3sYcz/5xBmIckb/8oEQXc+r5VSzbijA4NsylIOMBY58SZgObDiez3off9HbBbZBV
         rBgUxAOkM9yt+s2slE4p98bU2Fd/wjVbp1fV4gC6axikiLAoDP9INf9Sla4wN8wBm9+z
         7AxOJE4ifnX7moBOHRPhXVUhzQXlTW73+B72xV3jZDXs58Ds8ei9Bwdf96KNY7jR10Cy
         eE+Ze13/kwbHhA2KxmoegzM8i3QNVuoZezZetJZCNpCyNgtv6KKKqKfdU7+cZKLGlhZb
         luQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=f6tnLnjWLSdpGhFwckMoK4iFutzljn52E/+abnt2enE=;
        b=NdobDqotK1bFGKcwy1R/4ieCqJsD/f0Ln0n1hRx2oLLQaDhJdLbCzWrG73jrUUf47z
         XSLbgTxDGz/4FR5747Cvm17RXdswpBaS+GJxd+29mntImbyLYFD49zivxpfjOsShbBQ3
         liYv7rmVxAvXgAohO3RLmj6iGOJ82ExiQrlQkk//bcJ6OKhKSwx+BbZbiLaKB0uG9nfW
         QTsc+3gtqOJjV3FY/EBICbvQJ7U+x/wX+/EpBCHtqm3TlpNkefIs9u3EJp7DV+kaHewF
         AMKjTrJOp8DUi9Yyh/grqMIoROkGhlp2cld4a/2XeXXVw98HqeHg157KG7W2lT07WCW6
         g06g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MONZF4wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c141-20020a379a93000000b0073b9f0e63bfsi10521867qke.744.2023.02.21.01.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 01:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MONZF4wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUOpr-000706-A5; Tue, 21 Feb 2023 04:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUOpl-0006zd-Bd
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 04:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUOpj-00013i-GT
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 04:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676971270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6tnLnjWLSdpGhFwckMoK4iFutzljn52E/+abnt2enE=;
 b=MONZF4wh7M2uH19GFGWYo0AiS4xOnW6k+wxYmpp8pP8/yhC1TBXTctmeI9nT4gk2ZndQo+
 kQs3xP+utQYU9+2Ry0kfMh7oP2TV8FFYGus44z0H7pK4uf6OAPuC3cyk/TeyqUbTGyKD3j
 7BZc0MbT/WlhrQLunAofF28B6aZVkSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-sKizKDPDP9S7hdnLvPNZtQ-1; Tue, 21 Feb 2023 04:21:08 -0500
X-MC-Unique: sKizKDPDP9S7hdnLvPNZtQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E7EF885623;
 Tue, 21 Feb 2023 09:21:08 +0000 (UTC)
Received: from [10.64.54.62] (vpn2-54-62.bne.redhat.com [10.64.54.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4A3492B06;
 Tue, 21 Feb 2023 09:21:05 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple
 NUMA nodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com
References: <20230221085352.212938-1-gshan@redhat.com>
 <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3e88a2ec-6425-f484-8483-560d511a27ca@redhat.com>
Date: Tue, 21 Feb 2023 20:21:02 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <78d887c3-0241-9552-69b2-bd2e9a8fb74b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: hpYD3VeR8NBy

On 2/21/23 8:15 PM, Philippe Mathieu-Daudé wrote:
> On 21/2/23 09:53, Gavin Shan wrote:
>> Linux kernel guest reports warning when two CPUs in one socket have
>> been associated with different NUMA nodes, using the following command
>> lines.
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
>> Fix it by preventing mutiple CPUs in one socket to be associated with
>> different NUMA nodes.
>>
>> Reported-by: Yihuang Yu <yihyu@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ac626b3bef..e0af267c77 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
>>       return false;
>>   }
>> +static bool numa_state_valid(MachineState *ms)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>> +    NumaState *state = ms->numa_state;
>> +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
>> +    const CPUArchId *cpus = possible_cpus->cpus;
>> +    int len = possible_cpus->len, i, j;
>> +
>> +    if (!state || state->num_nodes <= 1 || len <= 1) {
>> +        return true;
>> +    }
>> +
>> +    for (i = 0; i < len; i++) {
>> +        for (j = i + 1; j < len; j++) {
>> +            if (cpus[i].props.has_socket_id &&
>> +                cpus[i].props.has_node_id &&
>> +                cpus[j].props.has_socket_id &&
>> +                cpus[j].props.has_node_id &&
>> +                cpus[i].props.socket_id == cpus[j].props.socket_id &&
>> +                cpus[i].props.node_id != cpus[j].props.node_id) {
>> +                error_report("CPU-%d and CPU-%d in socket-%ld have been "
>> +                             "associated with node-%ld and node-%ld",
>> +                             i, j, cpus[i].props.socket_id,
>> +                             cpus[i].props.node_id,
>> +                             cpus[j].props.node_id);
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void create_randomness(MachineState *ms, const char *node)
>>   {
>>       struct {
>> @@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
>>           exit(1);
>>       }
>> +    if (!numa_state_valid(machine)) {
>> +        exit(1);
>> +    }
> 
> Why restrict to the virt machine?
> 

We tried x86 machines and virt machine, but the issue isn't reproducible on x86 machines.
So I think it's machine or architecture specific issue. However, I believe RiscV should
have similar issue because linux/drivers/base/arch_topology.c is shared by ARM64 and RiscV.
x86 doesn't use the driver to populate its CPU topology.

Thanks,
Gavin

