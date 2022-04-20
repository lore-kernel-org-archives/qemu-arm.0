Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3196885lfk;
        Wed, 20 Apr 2022 07:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhHGfJ2pqkbtmCLN749ih096SMHuKr8LLMa40hsMEQllve4X1zmOUKFiXkd0H4hXN4fqxJ
X-Received: by 2002:a05:6902:1083:b0:633:d1f:2e01 with SMTP id v3-20020a056902108300b006330d1f2e01mr20841479ybu.222.1650466612298;
        Wed, 20 Apr 2022 07:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650466612; cv=none;
        d=google.com; s=arc-20160816;
        b=Es3F30ONwrDUP6MOHb5oP2TbzlarwFMFBksT/ENJ+onJF/8e3EiHdT+kuq1uUMhi87
         wBj+1Jx6AILKl0MVLuoB+vpg8DhbQoqpeLe5pJkuwXaT73vEZfH0P/D1VTFQtgY+5Ysf
         SJOXGz4m3vsYYUv+56Vl+zu74HmQTDc6BdUr1BXzVUXwBQtWNxZoNH8W/la5vtxNhrg7
         Z9tlObPJL8jHapK5/8TiDeX4rbPj6Ga1iPPhdXIpNtvB0Q3f97Gz+4DspSHSphWlLKEy
         47CBhTbqjTg8gwI97qjZD2KdjmWIv9XZ1d5AY+XU3ufSydgMndQX3kruJazeRKVnUpxJ
         yGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=1aTLpHUw8vkZhTRWzG2wbOiVVKGvJcRxmcqgduknEtQ=;
        b=Q8QcvFSrhqgNvuqonTIKBpvZAFKR/kgvgg8xzkKo1hf4rPUC9DRWhRUZC9AvIzcUPO
         TtnJeHZpJaskPhOPpJZgF5ZZN9xgXtMHwJjxKIKnLT+FN6Z1u4vZGKljVfrOMXzIcPSp
         /l2rPJZFncY1O4j1WwTLivyxcFs6EZwdqIm9hsLfWi2bIha26LPUtXj5W/Z4z9S1VpvZ
         EH0tPT6xqJ2aF3+vf9Ib8f3sit4HmXZY9X6NpsJJY3gfZ3ZIHnGb2+O1K3PBM0jtQEsa
         MUjDqHZL0FFvSZBZxRuSvbTGPHLGv2PfsYOYTU0puqwQsgabRX6eys2AsQ2E+UlpnYYS
         oILg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ou7aktXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j85-20020a815558000000b002ef61de812asi25703ywb.460.2022.04.20.07.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 07:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ou7aktXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhBlD-0005kA-Jv
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBfZ-0001dP-V5
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 10:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBfV-0001f1-Tv
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 10:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aTLpHUw8vkZhTRWzG2wbOiVVKGvJcRxmcqgduknEtQ=;
 b=Ou7aktXZ2aFpDsLmI9i89iGNAK+7endnTxqZ0SeElxpmMiXWgiO6AE+dhDW8yDI6xo98gr
 CUhM9ggtf6AYLSVThd3tU7VP5uj9mVSG1RYS0eybQEKjx6Km4fF7QZTp6DOqdzTd8mi1Bz
 /R21H1qpWKe/zaCU52Jqd5XBE0xgt/c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-jW_iAbEiOnecUfEJ-luHrw-1; Wed, 20 Apr 2022 10:50:53 -0400
X-MC-Unique: jW_iAbEiOnecUfEJ-luHrw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s28-20020a05640217dc00b0041d69ecc528so1341167edy.12
 for <qemu-arm@nongnu.org>; Wed, 20 Apr 2022 07:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aTLpHUw8vkZhTRWzG2wbOiVVKGvJcRxmcqgduknEtQ=;
 b=lUbIAjRTgcc6osQqpeM7KjJgrkP/Hw9DZbOXWK1I2KMulKjoPP9cZvDewCE+PESP9m
 OKkj9KvBdco7cWCaXecLUpTrGhetYXwl22QbppVoeYRcbAQSs4GgY6QCrwLLumKbGOix
 AyI6LtLe6lM93Z+30dCq90uax18fJbLPctEdjwX9Ud4jy0f4OIDTbYpidfJjC2nP/oIW
 kq/n79s00fX98NMtDXWV11Y2l1jsLvZQI/ldCYwzGsG6QJV9J11qQH1cWzw6kry9uo84
 h42Rp2mdsTP3C1u647EnGaAysQIvBo1XFXKJcDpdk4VzlOTYQP2SQvUhcGsIDVJsOHuL
 1Iow==
X-Gm-Message-State: AOAM531zyOewwtrZfZ41UsQe1tlj2Q/BqPs5LABu7DOnE8W0AqKDBSSX
 I+rXLZ8sRdhX2oGu3yfHw64RAqzQ7MTQwxQ54ErHUA1jHes0VxKGq5orixXh1JDPqnK1K386tYg
 hnP5md7fGNeJS
X-Received: by 2002:a17:907:6e89:b0:6e8:d79a:dced with SMTP id
 sh9-20020a1709076e8900b006e8d79adcedmr18951101ejc.563.1650466252592; 
 Wed, 20 Apr 2022 07:50:52 -0700 (PDT)
X-Received: by 2002:a17:907:6e89:b0:6e8:d79a:dced with SMTP id
 sh9-20020a1709076e8900b006e8d79adcedmr18951052ejc.563.1650466252234; 
 Wed, 20 Apr 2022 07:50:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a17090665c700b006efb9a33ca5sm3113754ejn.164.2022.04.20.07.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:50:51 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:50:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220420165050.66dd87a7@redhat.com>
In-Reply-To: <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
 <20220420135032.43711096@redhat.com>
 <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 Jonathan.Cameron@Huawei.com, ani@anisinha.ca, pbonzini@redhat.com,
 lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uJbL4bV3OSpU

On Wed, 20 Apr 2022 22:24:46 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/20/22 7:50 PM, Igor Mammedov wrote:
> > On Wed, 20 Apr 2022 18:31:02 +0800
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 4/20/22 4:32 PM, Igor Mammedov wrote:  
> >>> On Mon, 18 Apr 2022 10:09:18 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>      
> >>>> Currently, the SMP configuration isn't considered when the CPU
> >>>> topology is populated. In this case, it's impossible to provide
> >>>> the default CPU-to-NUMA mapping or association based on the socket
> >>>> ID of the given CPU.
> >>>>
> >>>> This takes account of SMP configuration when the CPU topology
> >>>> is populated. The die ID for the given CPU isn't assigned since
> >>>> it's not supported on arm/virt machine. Besides, the used SMP
> >>>> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> >>>> to avoid testing failure
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >>>> ---
> >>>>    hw/arm/virt.c           | 15 ++++++++++++++-
> >>>>    tests/qtest/numa-test.c |  3 ++-
> >>>>    2 files changed, 16 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>> index d2e5ecd234..5443ecae92 100644
> >>>> --- a/hw/arm/virt.c
> >>>> +++ b/hw/arm/virt.c
> >>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>>>        int n;
> >>>>        unsigned int max_cpus = ms->smp.max_cpus;
> >>>>        VirtMachineState *vms = VIRT_MACHINE(ms);
> >>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >>>>    
> >>>>        if (ms->possible_cpus) {
> >>>>            assert(ms->possible_cpus->len == max_cpus);
> >>>> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>>>            ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >>>>            ms->possible_cpus->cpus[n].arch_id =
> >>>>                virt_cpu_mp_affinity(vms, n);
> >>>> +
> >>>> +        assert(!mc->smp_props.dies_supported);
> >>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.socket_id =
> >>>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
> >>>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
> >>>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> >>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> >>>> +        ms->possible_cpus->cpus[n].props.core_id =
> >>>> +            (n / ms->smp.threads) % ms->smp.cores;
> >>>>            ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >>>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> >>>> +        ms->possible_cpus->cpus[n].props.thread_id =
> >>>> +            n % ms->smp.threads;
> >>>>        }
> >>>>        return ms->possible_cpus;
> >>>>    }
> >>>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> >>>> index 90bf68a5b3..aeda8c774c 100644
> >>>> --- a/tests/qtest/numa-test.c
> >>>> +++ b/tests/qtest/numa-test.c
> >>>> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
> >>>>        QTestState *qts;
> >>>>        g_autofree char *cli = NULL;
> >>>>    
> >>>> -    cli = make_cli(data, "-machine smp.cpus=2 "
> >>>> +    cli = make_cli(data, "-machine "
> >>>> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "  
> >>>
> >>> Is cluster-less config possible?
> >>> (looks like it used to work before and it doesn't after this series)
> >>>      
> >>
> >> Nope, it's impossible. This specific test case uses arm/virt machine
> >> where cluster is always supported.mc->smp_props.clusters_supported
> >> has been set to true in hw/arm/virt.c::virt_machine_class_init().
> >>
> >> Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
> >> the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
> >> make it 'bit bisect' friendly as Yanan suggested.  
> > 
> > so what was error that broke the test?
> > (probably should be mentioned in commit message)
> > 
> > (also is it possible to split out the test patch into
> > a separate one and put it before this one)
> >   
> 
> With amend to the command lines, the following one is used and below error
> is raised from the test. The error is mentioned in the commit log in
> PATCH[v7 2/4].
> 
>      -machine smp.cpus=2                                   \
>      -numa node,nodeid=0,memdev=ram -numa node,nodeid=1    \
>      -numa cpu,node-id=1,thread-id=0                       \
>      -numa cpu,node-id=0,thread-id=1
> 
>      qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>      (reported from hw/core/machine.c::machine_set_cpu_numa_node())
> 
> After the changes to virt_possible_cpu_arch_ids() is applied, "thread-id=1"
> isn't valid any more. The CPU topology becomes like below. Note that
> mc->smp_props.prefer_sockets is true on arm/virt machine.
> 
>      index    socket   cluster    core    thread
>      --------------------------------------------
>        0        0        0         0        0
>        1        1        0         0        0
> 
> With the amended command lines, the topology changes again so
> that "thread-id=1" is valid:
> 
>      index    socket   cluster    core    thread
>      --------------------------------------------
>        0        0        0         0        0
>        1        0        0         0        1
> 
> It should be ok to split the test/qtest/aarch64_numa_cpu() changes into
> a separate patch and put it before this one. In that case, the specified
> smp.{socket, cluster, core, threads} isn't used by arm/virt machine yet,
> and 'thread-id=2' should be still valid. Lets do this if I need post v8.
> Otherwise, I guess it's also fine to squash the test/qtest/aarch64_numa_cpu()
> changes into PATCH[2/4], as we're doing.

if you need to respin v7. do it as separate patch with proper commit message
and maybe add an extra test that exercises fully specified topo.

> 
> >   
> >>
> >>  
> >>>>            "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> >>>>            "-numa cpu,node-id=1,thread-id=0 "
> >>>>            "-numa cpu,node-id=0,thread-id=1");  
> 
> Thanks,
> Gavin
> 

