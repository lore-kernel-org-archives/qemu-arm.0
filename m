Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2393505ejq;
        Mon, 8 May 2023 17:35:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DbFfwrGdxdxPfO+02UiUmz52SLeiWa9+J3bfEhJ48Ha++oU9/T+OY5lAynHsESwvPiZKs
X-Received: by 2002:ad4:5aaa:0:b0:61b:5ca6:b7ef with SMTP id u10-20020ad45aaa000000b0061b5ca6b7efmr18291944qvg.42.1683592501959;
        Mon, 08 May 2023 17:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683592501; cv=none;
        d=google.com; s=arc-20160816;
        b=pwgOigEnbkKLM123PP7uSKZaW7Itow4qTpxbu4Xt4NIQ2ZnTYYS/OzsD60krFIUf3J
         jB+MihGEsACRi94mJ77dVLMHX1Q9cVsRh0Rwj8F2niqiVUJBRHJlOk/gItgNFI98Fpxd
         I/Cgf/CbzkS+QLCvSfqVjshyK3MGw9Zo+qEmErBA/3YnjsHHc/OULG5kwmJwXTYhUA6Y
         8kFLQWPY7ezXRNVY3qbH42M2gojZaws3cvs7FvWKUUtCJJ8I9Fvr0tFWjLXi/zclkVTZ
         gR8RZ8QPsps/6aNqB5bidBchPW5dZE50KgPxpmZpulylKFkU+Vi9n9lMskU562U4rqBK
         /nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:dkim-signature;
        bh=I8ro7Z6VSUYbajOcKU44uRgjWpkmf3ifQP4vt9f43Ws=;
        b=Hp4Tyafcl6W7i0J2j7pMpnvAY5MqZhpT3eOIFpBXs/mIjMjkHCdm1jDEb2BIJ9SVlk
         g1bxlBv/XU479VcjkEe3BB3EtpcMqM3AHyo5J2GJhI/bo7iuH0F8LgLMmQX2xogU5UEz
         8jaVxdDqBcRNgMim/fLULfEUfbaBf7i+11fYiebttOFH7KjiInFzXhD7B4SwZ5LA0bYX
         o9qU2o6/PL/pNaU+5hP8SPFlI3Mr3GLjHJqU9bGmaD0gsGHdkeFSehwTEfmzGeWGG7ny
         H3nYcugCRX8mrO9OFrt1ckLqCaN5TPSkKH/3h8Uh2Jb+gFA8TPwuHEUdt8s/kaZUBHlj
         WXXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awk0dIqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020ad45c86000000b005f604e3cddfsi450520qvh.418.2023.05.08.17.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 17:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awk0dIqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwBJ9-0007ol-IU; Mon, 08 May 2023 20:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBJ7-0007o3-U1
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBJ5-0005MN-Fs
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683592458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8ro7Z6VSUYbajOcKU44uRgjWpkmf3ifQP4vt9f43Ws=;
 b=awk0dIqwWg+BbarwmwTyQHNT2XlAtvS9nw99q9PmIkz97npjfa59Axo2qvZpe7e6k9Bw4s
 i7hhG5PWEPSyHe9YXBv+SJbuVbQ0OZYFvC7FttXaqIrE5JrCPP7PtJGKNVkIKzmCTA+70p
 /ir1qvuzSwCcDzuO6QAndr4WkomN7vc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-mq0efNuOOQuZasrz-3hgBg-1; Mon, 08 May 2023 20:34:15 -0400
X-MC-Unique: mq0efNuOOQuZasrz-3hgBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48402814245;
 Tue,  9 May 2023 00:34:13 +0000 (UTC)
Received: from [10.64.54.118] (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA77C1121315;
 Tue,  9 May 2023 00:34:05 +0000 (UTC)
Subject: Re: [PATCH v5 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64
 and riscv machines
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
References: <20230509002739.18388-1-gshan@redhat.com>
Message-ID: <41a56ce7-1db0-ca97-85c6-6584fd322173@redhat.com>
Date: Tue, 9 May 2023 10:34:02 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20230509002739.18388-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MhhbUKUqWSvB

Hi Paolo,

On 5/9/23 10:27 AM, Gavin Shan wrote:
> For arm64 and riscv architecture, the driver (/base/arch_topology.c) is
> used to populate the CPU topology in the Linux guest. It's required that
> the CPUs in one cluster can't span mutiple NUMA nodes. Otherwise, the Linux
> scheduling domain can't be sorted out, as the following warning message
> indicates. To avoid the unexpected confusion, this series attempts to
> warn about such kind of irregular configurations.
> 
>     -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>     -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>     -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>     -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>     Modules linked in:
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>     pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : build_sched_domains+0x284/0x910
>     lr : build_sched_domains+0x184/0x910
>     sp : ffff80000804bd50
>     x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>     x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>     x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>     x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>     x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>     x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>     x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>     x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>     x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>     x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>     Call trace:
>      build_sched_domains+0x284/0x910
>      sched_init_domains+0xac/0xe0
>      sched_init_smp+0x48/0xc8
>      kernel_init_freeable+0x140/0x1ac
>      kernel_init+0x28/0x140
>      ret_from_fork+0x10/0x20
> 
> PATCH[1] Warn about the irregular configuration if required
> PATCH[2] Enable the validation for aarch64 machines
> PATCH[3] Enable the validation for riscv machines
> 
> v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-04/msg00232.html
> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01226.html
> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01080.html
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00886.html
> 
> Changelog
> =========
> v5:
>    * Rebase for QEMU v8.1.0                                    (Gavin)
>    * Pick ack-b's from Igor                                    (Gavin)

[...]

> 
> Gavin Shan (3):
>    numa: Validate cluster and NUMA node boundary if required
>    hw/arm: Validate cluster and NUMA node boundary
>    hw/riscv: Validate cluster and NUMA node boundary
> 
>   hw/arm/sbsa-ref.c   |  2 ++
>   hw/arm/virt.c       |  2 ++
>   hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
>   hw/riscv/spike.c    |  2 ++
>   hw/riscv/virt.c     |  2 ++
>   include/hw/boards.h |  1 +
>   6 files changed, 51 insertions(+)
> 

When v4 was reviewed by Igor, it was mentioned that you're handling hw/core/machine
changes recently. Could you please help to queue this series for QEMU v8.1 if it
looks good to you?

Thanks,
Gavin

