Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3069973lfk;
        Wed, 20 Apr 2022 04:51:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybMb0+S7cZnccZoRz50TAe69n9Hc/pQXzrVLjNTT5CPkT1VFS9w3gHympfu7aVchE4v5/p
X-Received: by 2002:a05:620a:468b:b0:69e:caac:54f9 with SMTP id bq11-20020a05620a468b00b0069ecaac54f9mr3856045qkb.271.1650455483068;
        Wed, 20 Apr 2022 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650455483; cv=none;
        d=google.com; s=arc-20160816;
        b=i1tNGUi/TzasgRUWu0tGmED7WpigH5bQioDVCclQXZTzkW2xGD2R46D4bGJ52jt1ph
         g76gciVCkYSKl+WfxWxnQfnH6ENw4ujOsmvHC1ko2B7NZZwUYr79Ti3XBfKeZL+f9Ats
         eRJrv1hBGoXxZ5ZT8HBG2pwONf9G5udIhs9EaYEBQL+6yLHIW08c/RVyXU5TaLaexcX1
         QYXyopzYX14phh+IChhM5NKVKoECtdah2Cqgdf8bBIvsmYltVwmaGPE2sS7ME8UvpFOM
         ofX7bgN9PcsgC73PjpctB5BLvOW6uQcSrw2XipFhKlqX9et3I+ufIXXy/nA1o2xtKRdg
         X3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=ES5sXcoT4+dHsdY+TpBtfcjQSXQ/WBy2I8rr7J9w36U=;
        b=byBO4KLlAwCF4iU3TuCYSg7BGRUdO9K0ZJV6tfahyoWfbFj1Tdfe0yfxME+m0HwFNO
         utoz0vtp4rU8oE/tAEtkX6co/kPxYp8Uxat22wwKD7VYjEZXOyqjDyiu77yMarYt+UO6
         WZjoToV8UrIiHHdFuRblUn6pUGh1sPvpniEc6dARdyM65aMyRE6zAAT7K/xjKMW5rsqn
         HW98XGMDBK64F9oAiP/d2MD0Q7Hvp6WjEqR65Y7Qnu2s1T4cANTTo8/GMVJn6Ca1KGSL
         9P2/8MuX6ySzdW+zJVZ/Ghfw8HHjzVFK06+3mJXTM+efUBLKfhqR3MgJRjhEGor78zeW
         m0vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=inGHNnSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a210400b0069c739fced5si440899qkl.309.2022.04.20.04.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 04:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=inGHNnSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh8ri-0004vF-JK
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 07:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh8r2-0004sm-Qy
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 07:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh8r0-0002yX-BM
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 07:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650455437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ES5sXcoT4+dHsdY+TpBtfcjQSXQ/WBy2I8rr7J9w36U=;
 b=inGHNnSggFu90fXScZXbMPPFz21WViNnslGkTpCuXdJi8ONgQTw3JX3PFTW5JZLar0fpYN
 iJM8L+LXH6cXxkvQjl0EZEmfiSIMohUmEZvqY+pNLmmwVvTj5ZZXFiJhF/cmNE+mZMJeL2
 yvLJteDF+rCB0t+0+ZbwPbqhDDShok0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-2611JJImPOy4T2QPJ-eqBA-1; Wed, 20 Apr 2022 07:50:36 -0400
X-MC-Unique: 2611JJImPOy4T2QPJ-eqBA-1
Received: by mail-ed1-f70.google.com with SMTP id
 dk2-20020a0564021d8200b0041d789d18bcso1014183edb.21
 for <qemu-arm@nongnu.org>; Wed, 20 Apr 2022 04:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ES5sXcoT4+dHsdY+TpBtfcjQSXQ/WBy2I8rr7J9w36U=;
 b=CDt7032gLb1Ose5PWv2Ron79BJ5btvEctOm4HYqWvmNLHd/02KKepqzrPJbqFT8MEG
 QncjvkKMIZ2WilxO+I8TTqHBsU/U/4W6u011GvsTaz1v6gnbdo1JISbnnWUjwx018WaU
 YltIdayp+u32IpAb6kQaUuPdoERVvQX8CahaS6/a4ExckaGKGOGyfJ2qaqd1vtg/NdAH
 S7V2VHJBSecxQfB3m7Nmv9ihsPXWgkbSOtLF7XqoiclTw0i0mVdpMKjDUzrTBHMJUvCC
 Kgm7ysama3lK8cxMwhheHmhB6s0aMMFcv8ApjFj+x0hGHRcj8J4vkDaBGsntWFbXLCf/
 Wiww==
X-Gm-Message-State: AOAM5306uM6Qi4GERISB0BKf86rQjRgiyC8Qpx3wSUp0fjPKtYH/v8YO
 M9SFaLSrxuX6OVaLtlK4ZAnh1bMtNfmlYgsEywDI3ywITkPlK4IgNo76hc4DevBcv+/WL+LQjhR
 njILMqQmFbSiD
X-Received: by 2002:a17:907:8a27:b0:6f0:81f:4509 with SMTP id
 sc39-20020a1709078a2700b006f0081f4509mr1763834ejc.670.1650455434829; 
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
X-Received: by 2002:a17:907:8a27:b0:6f0:81f:4509 with SMTP id
 sc39-20020a1709078a2700b006f0081f4509mr1763801ejc.670.1650455434601; 
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm6578181ejk.219.2022.04.20.04.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:50:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220420135032.43711096@redhat.com>
In-Reply-To: <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
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
X-TUID: pKWgc0J+RvqR

On Wed, 20 Apr 2022 18:31:02 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/20/22 4:32 PM, Igor Mammedov wrote:
> > On Mon, 18 Apr 2022 10:09:18 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> Currently, the SMP configuration isn't considered when the CPU
> >> topology is populated. In this case, it's impossible to provide
> >> the default CPU-to-NUMA mapping or association based on the socket
> >> ID of the given CPU.
> >>
> >> This takes account of SMP configuration when the CPU topology
> >> is populated. The die ID for the given CPU isn't assigned since
> >> it's not supported on arm/virt machine. Besides, the used SMP
> >> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> >> to avoid testing failure
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >> ---
> >>   hw/arm/virt.c           | 15 ++++++++++++++-
> >>   tests/qtest/numa-test.c |  3 ++-
> >>   2 files changed, 16 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index d2e5ecd234..5443ecae92 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>       int n;
> >>       unsigned int max_cpus = ms->smp.max_cpus;
> >>       VirtMachineState *vms = VIRT_MACHINE(ms);
> >> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >>   
> >>       if (ms->possible_cpus) {
> >>           assert(ms->possible_cpus->len == max_cpus);
> >> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >>           ms->possible_cpus->cpus[n].arch_id =
> >>               virt_cpu_mp_affinity(vms, n);
> >> +
> >> +        assert(!mc->smp_props.dies_supported);
> >> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> >> +        ms->possible_cpus->cpus[n].props.socket_id =
> >> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
> >> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> >> +        ms->possible_cpus->cpus[n].props.cluster_id =
> >> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> >> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> >> +        ms->possible_cpus->cpus[n].props.core_id =
> >> +            (n / ms->smp.threads) % ms->smp.cores;
> >>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> >> +        ms->possible_cpus->cpus[n].props.thread_id =
> >> +            n % ms->smp.threads;
> >>       }
> >>       return ms->possible_cpus;
> >>   }
> >> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> >> index 90bf68a5b3..aeda8c774c 100644
> >> --- a/tests/qtest/numa-test.c
> >> +++ b/tests/qtest/numa-test.c
> >> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
> >>       QTestState *qts;
> >>       g_autofree char *cli = NULL;
> >>   
> >> -    cli = make_cli(data, "-machine smp.cpus=2 "
> >> +    cli = make_cli(data, "-machine "
> >> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "  
> > 
> > Is cluster-less config possible?
> > (looks like it used to work before and it doesn't after this series)
> >   
> 
> Nope, it's impossible. This specific test case uses arm/virt machine
> where cluster is always supported.mc->smp_props.clusters_supported
> has been set to true in hw/arm/virt.c::virt_machine_class_init().
> 
> Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
> the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
> make it 'bit bisect' friendly as Yanan suggested.

so what was error that broke the test?
(probably should be mentioned in commit message)

(also is it possible to split out the test patch into
a separate one and put it before this one)


> 
> 
> >>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> >>           "-numa cpu,node-id=1,thread-id=0 "
> >>           "-numa cpu,node-id=0,thread-id=1");  
> 
> Thanks,
> Gavin
> 

