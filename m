Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp967667ejc;
        Thu, 13 Apr 2023 04:22:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZyFelYp5h06YhddKuZedloDuI2CwMYgVvkAB1a1GCTC4HEwXVuGKKuIdBrHfN9XuUE/dtW
X-Received: by 2002:ac8:5751:0:b0:3e6:4dfe:d48a with SMTP id 17-20020ac85751000000b003e64dfed48amr2670083qtx.34.1681384942017;
        Thu, 13 Apr 2023 04:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681384942; cv=none;
        d=google.com; s=arc-20160816;
        b=EnLVYoDvtnYniZfJ5FT6N7iHrrmfPWnysq1RXtJKuUaUnQjoBoBWL938ghSGG6lP1W
         2/DQaLCrwKSlALadHM6PyALzuB70nSZR14syT2pgvgnTek4rYUU0xnTHhhKH/a0U6S0L
         evkJuOrRX+r9fZURBpCmFqDKbqIr5XCMvNuQicr+lOZErmCZutBA+aufFBEA+dCy4CCQ
         Xve/vJm7/UVIrkGCUDmqxEf1GxocVPCBF3Gp6joxJF+ZRHZ27eKF2P7E4tiJD155esqH
         Q0O8d0Xau1m/xmk+AgEy7P728Js8F8T6hcwHCVjc4FBDc8nt/yoHKOjmoOAxRZ3eSjcN
         r4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=ZzPd5TqTR880GNrspfPIj9UQbcI/qgKnASU77rxoTeY=;
        b=tlRm6hO4QbOa2lBuaA8IA9jFJGUzoRyY/OX4cbU4+0rS+PB+QNw20PxAGlCBs4lC/I
         iN4UF43tVyDKGUW7RUhUutSSb1dAmN+vgg13Tm8LVIppsK7xG5WqN9X2Mclx/LluGgdH
         EBopV7ae3euDrZJLXWPoRQHjNI44NoS/T8/MWs3NGNQrH49ITDc1fSzzL5Vvf2dgRKSV
         dFdkxSJobAeBesW5EFXnfaNSY92ThwUEhE5ma6iUvwS8qRrE6oif+Y/7sR+kjzZEIHRx
         kBS4W6bNJFUgAlW+AKnFy1iuQmLuYSAYzUhnvw51PiXpJVAAUMkX+zw3CxFn+frmdlWV
         Ickg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTnKQ8Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a37ab07000000b0074a27a6ff60si808030qke.115.2023.04.13.04.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Apr 2023 04:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTnKQ8Kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmv1X-0005o1-IS; Thu, 13 Apr 2023 07:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmv1W-0005mC-2i
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 07:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmv1T-0006hx-Nz
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 07:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681384910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzPd5TqTR880GNrspfPIj9UQbcI/qgKnASU77rxoTeY=;
 b=jTnKQ8KgA3fPHL/Ua9y7kpFhSmJUnzYaao7IIfWgGJEMrVMboK9w34qAjnyeDQ7QYtFLyH
 DiDkFnUvS7dLKkMUnPo+zzXZEpV0z1PQd6jFuB/mqc3qrWoaCFfK/oi3FuMTREHH6/rH2O
 9YinL9gDAe9KPCDanaEEhzPoXds5tqU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-ey5KrFjiMb6SFHMq0XXNzg-1; Thu, 13 Apr 2023 07:21:49 -0400
X-MC-Unique: ey5KrFjiMb6SFHMq0XXNzg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a348facbbso210556266b.1
 for <qemu-arm@nongnu.org>; Thu, 13 Apr 2023 04:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681384908; x=1683976908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzPd5TqTR880GNrspfPIj9UQbcI/qgKnASU77rxoTeY=;
 b=GlEVgEJTmekrTdhCWt4fjUoI+u1jMR34GWzNtxu3R2uS6wbqn7fkzgYTZLsHDp+uqd
 kErO5GZzR3tJQfdaohcNEDDpQ+AQCqAuDHGYmRdj3bpH5SbHzXCix4Y/nB1yilZcaoNV
 QEa7VvzskZs3kFjvSmi4WPeZxdFknUYaGbTYueykGHpscOjV0zgQrjEDzRs0iPSXSdmV
 XkTeI/73K/CS0fzED4iOx8jfuaKtuE4eTX7coyRR9J8QsfCzH845ogIIMffo54MS/1Uv
 mua2cIYk5Zt+3yHmYyLRMJbr6l3SpR9ZJBUueZARCSJ8r2dr3PQjNrdDFGRRAxOOXuPg
 paLA==
X-Gm-Message-State: AAQBX9cQmrvW11MsZ5G/2QNK+a1fJ2L/stdz/dGhL48nqoEvfe8kS9hN
 28LLmuWPQjsyfYrSRK6HHjB0j6vLRUx3rHmi+SIBqer/0tV9qsfPwANJqk04PgL/rfc5GT8R1Co
 ogUCHtHckahst
X-Received: by 2002:aa7:cb50:0:b0:4fd:29e6:701b with SMTP id
 w16-20020aa7cb50000000b004fd29e6701bmr1839529edt.38.1681384908272; 
 Thu, 13 Apr 2023 04:21:48 -0700 (PDT)
X-Received: by 2002:aa7:cb50:0:b0:4fd:29e6:701b with SMTP id
 w16-20020aa7cb50000000b004fd29e6701bmr1839505edt.38.1681384907897; 
 Thu, 13 Apr 2023 04:21:47 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a26-20020a170906685a00b0094e09ceafc9sm842684ejs.44.2023.04.13.04.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 04:21:47 -0700 (PDT)
Date: Thu, 13 Apr 2023 13:21:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>, pbonzini@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v4 0/3] NUMA: Apply cluster-NUMA-node boundary for
 aarch64 and riscv machines
Message-ID: <20230413132145.6f7ebadf@imammedo.users.ipa.redhat.com>
In-Reply-To: <e1bb85c9-88f0-f55f-118e-b38afd7da8b0@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
 <20230327152651.41f22ac0@imammedo.users.ipa.redhat.com>
 <3d1d2e5d-0202-ffa8-e07f-1cd7dc2ea3bf@redhat.com>
 <CAFEAcA8ERPiock5FiwdE021V0S_Bofz5UJtvBuet2EcK2bXfZw@mail.gmail.com>
 <e1bb85c9-88f0-f55f-118e-b38afd7da8b0@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: B++5O7MZBYqq

On Thu, 13 Apr 2023 13:50:57 +0800
Gavin Shan <gshan@redhat.com> wrote:

> On 4/12/23 7:42 PM, Peter Maydell wrote:
> > On Wed, 12 Apr 2023 at 02:08, Gavin Shan <gshan@redhat.com> wrote:  
> >> On 3/27/23 9:26 PM, Igor Mammedov wrote:  
> >>> On Fri, 17 Mar 2023 14:25:39 +0800
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>  
> >>>> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> >>>> used to populate the CPU topology in the Linux guest. It's required that
> >>>> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> >>>> scheduling domain can't be sorted out, as the following warning message
> >>>> indicates. To avoid the unexpected confusion, this series attempts to
> >>>> warn about such kind of irregular configurations.
> >>>>
> >>>>      -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
> >>>>      -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
> >>>>      -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
> >>>>      -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> >>>>
> >>>>      ------------[ cut here ]------------
> >>>>      WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
> >>>>      Modules linked in:
> >>>>      CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
> >>>>      pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>>>      pc : build_sched_domains+0x284/0x910
> >>>>      lr : build_sched_domains+0x184/0x910
> >>>>      sp : ffff80000804bd50
> >>>>      x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
> >>>>      x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
> >>>>      x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
> >>>>      x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
> >>>>      x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
> >>>>      x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
> >>>>      x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
> >>>>      x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
> >>>>      x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
> >>>>      x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
> >>>>      Call trace:
> >>>>       build_sched_domains+0x284/0x910
> >>>>       sched_init_domains+0xac/0xe0
> >>>>       sched_init_smp+0x48/0xc8
> >>>>       kernel_init_freeable+0x140/0x1ac
> >>>>       kernel_init+0x28/0x140
> >>>>       ret_from_fork+0x10/0x20
> >>>>
> >>>> PATCH[1] Warn about the irregular configuration if required
> >>>> PATCH[2] Enable the validation for aarch64 machines
> >>>> PATCH[3] Enable the validation for riscv machines
> >>>>
> >>>> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
> >>>> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> >>>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> >>>>
> >>>> Changelog
> >>>> =========
> >>>> v4:
> >>>>     * Pick r-b and ack-b from Daniel/Philippe                   (Gavin)
> >>>>     * Replace local variable @len with possible_cpus->len in
> >>>>       validate_cpu_cluster_to_numa_boundary()                   (Philippe)
> >>>> v3:
> >>>>     * Validate cluster-to-NUMA instead of socket-to-NUMA
> >>>>       boundary                                                  (Gavin)
> >>>>     * Move the switch from MachineState to MachineClass         (Philippe)
> >>>>     * Warning instead of rejecting the irregular configuration  (Daniel)
> >>>>     * Comments to mention cluster-to-NUMA is platform instead
> >>>>       of architectural choice                                   (Drew)
> >>>>     * Drop PATCH[v2 1/4] related to qtests/numa-test            (Gavin)
> >>>> v2:
> >>>>     * Fix socket-NUMA-node boundary issues in qtests/numa-test  (Gavin)
> >>>>     * Add helper set_numa_socket_boundary() and validate the
> >>>>       boundary in the generic path                              (Philippe)
> >>>>
> >>>> Gavin Shan (3):
> >>>>     numa: Validate cluster and NUMA node boundary if required
> >>>>     hw/arm: Validate cluster and NUMA node boundary
> >>>>     hw/riscv: Validate cluster and NUMA node boundary
> >>>>
> >>>>    hw/arm/sbsa-ref.c   |  2 ++
> >>>>    hw/arm/virt.c       |  2 ++
> >>>>    hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>>>    hw/riscv/spike.c    |  2 ++
> >>>>    hw/riscv/virt.c     |  2 ++
> >>>>    include/hw/boards.h |  1 +
> >>>>    6 files changed, 51 insertions(+)
> >>>>  
> >>>
> >>> Acked-by: Igor Mammedov <imammedo@redhat.com>
> >>>  
> >>
> >> Not sure if QEMU v8.0 is still available to integrate this series.
> >> Otherwise, it should be something for QEMU v8.1. By the way, I'm
> >> also uncertain who needs to be merge this series.  
> > 
> > It barely touches arm specific boards, so I'm assuming it will
> > be reviewed and taken by whoever handles hw/core/machine.c
> > 
> > And yes, 8.0 is nearly out the door, this is 8.1 stuff.
> >   
> 
> Indeed. In this case, it needs to be merged via 'Machine core' tree,
> which is being taken care by Eduardo Habkost or Marcel Apfelbaum.
> 
> Eduardo and  Marcel, could you please merge this to QEMU v8.1 when it's
> ready? Thanks in advance.

Lately it was Paolo who taking care of generic machine queue

> 
> Thanks,
> Gavin
> 

