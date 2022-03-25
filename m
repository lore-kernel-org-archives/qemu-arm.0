Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp4079607lfb;
        Fri, 25 Mar 2022 06:20:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/ZeBZeRjfs7g8YbK7SZuIGOPW9LhYuJIPhlAZ5elGyMPcofqXVlERN9IDX1P3P9wddrdo
X-Received: by 2002:a05:620a:bd5:b0:67d:15ed:2fcd with SMTP id s21-20020a05620a0bd500b0067d15ed2fcdmr6926256qki.81.1648214434007;
        Fri, 25 Mar 2022 06:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648214434; cv=none;
        d=google.com; s=arc-20160816;
        b=Jga3B7e+vn1eMZlDjsNKFNssVGWTVRfid4B2V02IRktakkjja05MZKydLOvTY2x/e1
         /7nQ5aCCjKekwJBb0xkirppGxfrrXxwNsRMH0z0fkQvpE5EvM2aTRDeGmjs/bfUdu+hc
         Z6BxNcURexsIUla7z6IJsM9s84TutG1ZmjH+dV49vH9MZjPSy3CyGTWiTiewM4VxnnGO
         uKXzZSgMZVEXFu6hzMk4URf+55e77FPFZD1KSzBK8az2tDGDTGj2oaKWTCepefcUv+0a
         l64HQziVILxepxNshqyNofVJhxrhmCmhSsqUrjjxf3YFJ/Uia8DKY/JYvPOkDn65hFTP
         AiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=iwlLRHKLFz8ToRimTFcbqyXQRdn/EKRq3MuIOKv+Qyw=;
        b=Q9e3PX6K30TTAg7m24dkh+0z+jyuqfGGB5s3vL7FYMd2IT2z73ONmqnMaLmgktTvyu
         91fPnVT40JU1MuXReFuU13zPjlIFyFgNCGCdHUnB+1qQIC+dMV5viCNbwf2RzLTLL6Mm
         7cpIeFHMpFUqJQ6RmmRajbxbnJobAi8ZlYmid7LSHYYhnQxSeubnpSTe0mKGlnxMx8bR
         yCGG7SJbJVqZ+vefWhoA2KjPToxWZnoxINJ2XuIB2xvT++ssdKHWsNTAgGC3/UVEcrB9
         T7xGRNIIQzEBmdn8cV34UYELBhvqQnmUps+n8kQk2akaUbI/FOsKC7v846S7eIzGrx4D
         eZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEKhaJKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a0c8d09000000b004411eeeecefsi1312165qvb.2.2022.03.25.06.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Mar 2022 06:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEKhaJKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXjrl-0002nd-EW
	for alex.bennee@linaro.org; Fri, 25 Mar 2022 09:20:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjrQ-0002gq-Qm
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 09:20:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXjrA-0002Hg-91
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 09:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648214394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwlLRHKLFz8ToRimTFcbqyXQRdn/EKRq3MuIOKv+Qyw=;
 b=hEKhaJKNxi42oz/GaTbF5tnuUwhFxbGGgd2c31Mif4Ve3DXPi/uVizoo3sfleER0wHRJcF
 rtbF75KdY6iCiw23sjWW4PvmmTtAvOlLCyVyvB2NjtMXv4cfawjRBBLWUCzMVFyet11NWo
 TRlr0BlfoY16eU3RMNZqn7kabx8PzMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-dBLSqet9MKSxFLQ1Q25aVA-1; Fri, 25 Mar 2022 09:19:53 -0400
X-MC-Unique: dBLSqet9MKSxFLQ1Q25aVA-1
Received: by mail-ed1-f69.google.com with SMTP id
 o20-20020aa7dd54000000b00413bc19ad08so4936920edw.7
 for <qemu-arm@nongnu.org>; Fri, 25 Mar 2022 06:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwlLRHKLFz8ToRimTFcbqyXQRdn/EKRq3MuIOKv+Qyw=;
 b=4cgffE3M40B5Cp6WMWXpuw1dgfjInPVGg7vpSsWupdLudT2/dGPM27ROVcI5vCAI3d
 TSQ9t0WZ4NXVo1byd9dmLvAnQg44RigYluWKgPTsndiZOnQ7g3CdsvdeKhho+awFwqc5
 09DzwugcSIj4BKXyZW4GZ+FvWNzsyv1OLkQGoUaC0QwfCLEtD13E1Z/d8v0HAjatoyRh
 Lb7X8e5tSwrRbzB3qY/SGqCcbsZ83U+wJFzAtxgH9VfgJCDFvS0nr6dNML9N5ICxlTlu
 QSz7GdR2EXfLOHN6RvRlBOGEHcpZowBJXpujBBrLQL/5V0dijfACetQ8g27LTHIoifgE
 yogA==
X-Gm-Message-State: AOAM5310SzrdCDMOi6mYTZSq0OcZy5VUdImqZLmTkgUw84BjgCupLqGe
 LdgDiqVWD2ashMB/khqE9LJVBiVx4GnxfS2wCgpk8CnP3DzxDgpx5ZZEc+iGyGk0aS88YIOccV/
 dh9/0yzkWvZeC
X-Received: by 2002:a17:906:58c5:b0:6da:81ae:9eb0 with SMTP id
 e5-20020a17090658c500b006da81ae9eb0mr11545833ejs.611.1648214392058; 
 Fri, 25 Mar 2022 06:19:52 -0700 (PDT)
X-Received: by 2002:a17:906:58c5:b0:6da:81ae:9eb0 with SMTP id
 e5-20020a17090658c500b006da81ae9eb0mr11545796ejs.611.1648214391629; 
 Fri, 25 Mar 2022 06:19:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 mp33-20020a1709071b2100b006db6dea7f9dsm2348259ejc.168.2022.03.25.06.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 06:19:50 -0700 (PDT)
Date: Fri, 25 Mar 2022 14:19:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220325141949.66fc0083@redhat.com>
In-Reply-To: <20220323072438.71815-2-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tAyToi8s1Q5m

On Wed, 23 Mar 2022 15:24:35 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
> 
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine yet. Besides, the cluster
> ID for the given CPU is assigned because it has been supported
> on arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c     | 11 +++++++++++
>  qapi/machine.json |  6 ++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..064eac42f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      int n;
>      unsigned int max_cpus = ms->smp.max_cpus;
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>  
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len == max_cpus);
> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>          ms->possible_cpus->cpus[n].type = ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =
>              virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            n / (ms->smp.cores * ms->smp.threads);

are there any relation cluster values here and number of clusters with
what virt_cpu_mp_affinity() calculates?

> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;

>          ms->possible_cpus->cpus[n].props.has_thread_id = true;
>          ms->possible_cpus->cpus[n].props.thread_id = n;
of cause target has the right to decide how to allocate IDs, and mgmt
is supposed to query these IDs before using them.
But:
 * IDs within 'props' are supposed to be arch defined.
   (on x86 IDs in range [0-smp.foo_id), on ppc it something different)
   Question is what real hardware does here in ARM case (i.e.
   how .../cores/threads are described on bare-metal)?
   
 * maybe related: looks like build_pptt() and build_madt() diverge on
   the meaning of 'ACPI Processor ID' and how it's generated.
   My understanding of 'ACPI Processor ID' is that it should match
   across all tables. So UIDs generated in build_pptt() look wrong to me.

 * maybe related: build_pptt() looks broken wrt core/thread where it
   may create at the same time a  leaf core with a leaf thread underneath it,
   is such description actually valid?


>      }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 42fc68403d..99c945f258 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
>  # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to
> +# @core-id: core number within cluster the CPU belongs to

s:cluster:cluster/die:

>  # @thread-id: thread number within core the CPU belongs to
>  #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>  #       but management should be prepared to pass through other
>  #       properties with device_add command to allow for future
>  #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>    'data': { '*node-id': 'int',
>              '*socket-id': 'int',
>              '*die-id': 'int',
> +            '*cluster-id': 'int',
>              '*core-id': 'int',
>              '*thread-id': 'int'
>    }

