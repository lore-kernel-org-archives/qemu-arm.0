Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1623890ejc;
        Fri, 24 Feb 2023 02:17:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8fb+SFq4au9A+IATb8ilgODgVM5yZNvYEsIRyuGc1XhDLKImCDHQVxdC4c+Ra8rzLQU8zz
X-Received: by 2002:ac8:7d13:0:b0:3bf:ba58:52aa with SMTP id g19-20020ac87d13000000b003bfba5852aamr2883016qtb.15.1677233873115;
        Fri, 24 Feb 2023 02:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677233873; cv=none;
        d=google.com; s=arc-20160816;
        b=EN74iiaEG79Sc4gRH5VEYLeAj1LPjQr194Ob4Mn46koIwDgpN5OrtdIk1lARuNLv+b
         nc+6T5t8lu08c2jcETZJ74ti/QLTOScBY+JncOibdEhWgBxvHn7eoYIy6bbo8OqMvP+C
         wDEcQrc2ZeELKqPsuR71V5Odg3SUmISL6MHVuIS0nJR96RaqOsI3GMM2g5VzJ3tuhG+0
         8GrBM5JAdttuOTU7TEIsl6jiojaTvUEQb1s4NmYcn/h+OoD7gRihq0cpeIRuinMnJnq2
         9RGgd5+00EulM69e/YLla0l1YrUWTtO6LCi08d36jcRrdHfk6Au4iOzSKLg89eMksKUw
         kd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Oh+P3BbSycHrwvAihhjQcz1YlWZbVn7xiqsHQ8Ir2Ks=;
        b=uqBrYBlGu2k91mxedRpbmuj0/ZG9MNTKeh0jMCk0niwBrY9Xm1aPYehpjyKPl5zrkv
         7K7ivoXfU8T81NqdCl1ivh71onOb6K9u3CsVFVXaipOAMfveq7G9eNDJ00aViwAfTLXJ
         oJfw+J81Q/GKzWmlwPZkJrn4gey4eMwQcRC9TyDwEPmIbexvUQGWsvfE+35eO+fpSvKQ
         VITnL5BbYH8YdFn9cHEWpPn0XWjTaxpisy8jBKEA6Y+tjZY4bwqrgI8hmrWtL8yFiSTL
         9gEccAraP4QHj8PkQKa0HJ59EEUmFV8lLsFusK3fUbwQEUoqXYhFX2xxNl4dBDAVq8sk
         U6vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gJWxAcD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05620a400200b006fa28c50e1asi9223257qko.645.2023.02.24.02.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 02:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gJWxAcD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVV8O-0004dn-7T; Fri, 24 Feb 2023 05:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVV8M-0004dG-Fq
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 05:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVV8K-0002ib-1M
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 05:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677233815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oh+P3BbSycHrwvAihhjQcz1YlWZbVn7xiqsHQ8Ir2Ks=;
 b=gJWxAcD1Y34MzTU3tB6z4mJvaeySOJUS00KUM3OuTn9Asa3T0xZgv4V1xrsyivtim852/r
 b47BBvQrvscs/4Y0nej6QOfw4P8SQMG+vsO10zZCJIkcEzUIkzJs7EBdRJ5BDHJ1nGS/ja
 8/Dxtp5LUjRK9OauOnkwwFFGIfGMKl8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-78_1lABvMhycruR9VFVVWw-1; Fri, 24 Feb 2023 05:16:50 -0500
X-MC-Unique: 78_1lABvMhycruR9VFVVWw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10E6A183B3C0;
 Fri, 24 Feb 2023 10:16:50 +0000 (UTC)
Received: from [10.64.54.42] (vpn2-54-42.bne.redhat.com [10.64.54.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C849492B07;
 Fri, 24 Feb 2023 10:16:41 +0000 (UTC)
Subject: Re: [PATCH v2 0/4] NUMA: Apply socket-NUMA-node boundary for aarch64
 and RiscV machines
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <2d37d157-12a1-07aa-4c70-974ac1503283@ventanamicro.com>
 <fc0d2c66-5600-c33a-62d7-c72f1d16518b@redhat.com>
 <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9e8523a9-9059-e3a0-e32e-414f83e06a6f@redhat.com>
Date: Fri, 24 Feb 2023 21:16:39 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <11e958b1-4763-f710-fe02-832cfd559e7b@ventanamicro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: TdKGdfrzguSo

On 2/24/23 8:26 PM, Daniel Henrique Barboza wrote:
> On 2/24/23 04:09, Gavin Shan wrote:
>> On 2/24/23 12:18 AM, Daniel Henrique Barboza wrote:
>>> On 2/23/23 05:13, Gavin Shan wrote:
>>>> For arm64 and RiscV architecture, the driver (/base/arch_topology.c) is
>>>> used to populate the CPU topology in the Linux guest. It's required that
>>>> the CPUs in one socket can't span mutiple NUMA nodes. Otherwise, the Linux
>>>> scheduling domain can't be sorted out, as the following warning message
>>>> indicates. To avoid the unexpected confusion, this series attempts to
>>>> rejects such kind of insane configurations.
>>>>
>>>>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>>>>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>>>>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>>>>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
>>>
>>>
>>> And why is this a QEMU problem? This doesn't hurt ACPI.
>>>
>>> Also, this restriction impacts breaks ARM guests in the wild that are running
>>> non-Linux OSes. I don't see why we should impact use cases that has nothing to
>>> do with Linux Kernel feelings about sockets - NUMA nodes exclusivity.
>>>
>>
>> With above configuration, CPU-0/1/2 are put into socket-0-cluster-0 while CPU-3/4/5
>> are put into socket-1-cluster-0, meaning CPU-2/3 belong to different socket and
>> cluster. However, CPU-2/3 are associated with NUMA node-1. In summary, multiple
>> CPUs in different clusters and sockets have been associated with one NUMA node.
>>
>> If I'm correct, the configuration isn't sensible in a baremetal environment and
>> same Linux kernel is supposed to work well for baremetal and virtualized machine.
>> So I think QEMU needs to emulate the topology as much as we can to match with the
>> baremetal environment. It's the reason why I think it's a QEMU problem even it
>> doesn't hurt ACPI. As I said in the reply to Daniel P. Berrangé <berrange@redhat.com>
>> in another thread, we may need to gurantee that the CPUs in one cluster can't be
>> split to multiple NUMA nodes, which matches with the baremetal environment, as I
>> can understand.
>>
>> Right, the restriction to have socket-NUMA-node or cluster-NUMA-node boundary will
>> definitely break the configurations running in the wild.
> 
> 
> What about a warning? If the user attempts to use an exotic NUMA configuration
> like the one you mentioned we can print something like:
> 
> "Warning: NUMA topologies where a socket belongs to multiple NUMA nodes can cause OSes like Linux to misbehave"
> 
> This would inform the user what might be going wrong in case Linux is crashing/error
> out on them and then the user is free to fix their topology (or the kernel). And
> at the same time we wouldn't break existing stuff that happens to be working.
> 
> 

Yes, I think a warning message is more appropriate, so that users can fix their
irregular configurations and the existing configurations aren't disconnected.
It would be nice to get the agreements from Daniel P. Berrangé and Drew, before
I'm going to change the code and post next revision.

Thanks,
Gavin


