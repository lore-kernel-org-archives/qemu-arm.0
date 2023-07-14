Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3984301eje;
        Fri, 14 Jul 2023 05:00:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE2RdwPvhRJEOQsBXjX45NjNK3X1bLodVEfMBYR6kg2lxXsQeV3GrA0AaUBd3X8vkiPWHDc
X-Received: by 2002:a05:620a:1a8e:b0:767:dbe5:1f2f with SMTP id bl14-20020a05620a1a8e00b00767dbe51f2fmr4677132qkb.35.1689336014858;
        Fri, 14 Jul 2023 05:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689336014; cv=none;
        d=google.com; s=arc-20160816;
        b=rwGA5EXTKtIBdF+MaI1J6c5pOdp+kRiOpXOmfREQ6h6yqibr/mylhr2wD6lTm2F4/i
         tTWnh4lMzzGSUZBpshzCHiF342SCFVAc/+vK14PcEzKuxtRhOT13580622Kts4oKJRuO
         zTiRDPHKOWLvtS39VDjjG6e+T4iIThiA3WP4FAUh7tB6r2n8A4Ex1deyMHFV9IND5Ayn
         kSd9vyyIMCzNczHpT+6iwsHAaI0zLq0bIuB2Qyg15fko4cQR80QP5eLxCsgFP7hHBVBQ
         t3Zcvdgt3EVFKN5/Ap3lHJBR1sDW3ag5H1jwxavUspU/SsQurpzNoBJpveLGc8YfzDcP
         +9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=pL8kzYo1qhSZ6fIzoUIBM9v4GNhjP0IKX1EVPTyJkbo=;
        fh=c8vW5PCkaRf214jXm9EDxrstE644+gnpXCzouEc1OdI=;
        b=j2V4E2slt3ZfFggkZuWgJeA/zf1IpFiAbVEt2b/eA01LW2p5ECzxpTjbdlt+Y7KlIf
         opq4tYKLkm6xy5r3TqoYZpXFsTVsgNdk6W+bWA/hGmU/UO3tLEhXnI/BJAXWWP77i1nu
         mCG0H8oBKBmbyiUPOziCwPpujP+Eu1c+dSG0lVBJisrWfVjX6ulIYnAEF1e1UDy2goXK
         ffVgFmOjyWnzX+QlAVsQSt1dHwst4L/rbGyjhFZaQJHMgkHAoXo7FTHW43sYRIRfIr+g
         eveXhZnWXSNvtBWCabXMH6UddOZNL8LHbt83s4ZP6li7X0Nbz5DUZaVBHLwYTq9AfFSt
         6JuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyPOT8mf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou20-20020a05620a621400b00765ad67e3bfsi4192408qkn.398.2023.07.14.05.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 05:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyPOT8mf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKHSX-00044F-AQ; Fri, 14 Jul 2023 07:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHSU-00043u-Pv
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 07:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qKHSR-0004Aj-7o
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 07:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689335974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pL8kzYo1qhSZ6fIzoUIBM9v4GNhjP0IKX1EVPTyJkbo=;
 b=LyPOT8mfNQ+QirnIeezhBQQseKWqgWbDWU9wtnLYz7CRSxBWfw7+QwBlVKdPmIS3dtzFBB
 Y7K3kROVugkIzSa6YbQMpk/fe2cLpDAR4hIn95EZlH/yu8OOQGpUJkAGGF6hPSxQp6ujMh
 HifAPipEXWVb4nVQLP/kawhjqDV6Hrc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-oXA7wEO2O8GY8rY4aplVjg-1; Fri, 14 Jul 2023 07:59:33 -0400
X-MC-Unique: oXA7wEO2O8GY8rY4aplVjg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-978a991c3f5so113764366b.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689335972; x=1691927972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pL8kzYo1qhSZ6fIzoUIBM9v4GNhjP0IKX1EVPTyJkbo=;
 b=CqJXBLHWhyWiV9m/Y4/TqnNlrHGdCr9xcGNQ89VoknhGPc1SJjG65hPAAdPg2yQl96
 8Gw64UUs4AuJE5sjfcPfCKCNkoShGkzbXJGPtQc4KqjTQZdIiyn4My8JZiaILu+sEum/
 8JEHTkJSW6hlXpQfuKNI3CrGWtXje2A9Aw3IaETkxHFMfgcxSkm+bCaWIwdvpQ4cnRWC
 oXhyU690QybZl3rmYoRf0IxQjLW1atOkbiE3CrCMag4AbZalJjjuzZaMIjZURpYBLSaC
 iBbbfuurk+ioUAjoX0YyfUN5TynMUKOBxBMg52UiQe+oFuBf0LP1JlVr+IPqRY6fKBiU
 YPEg==
X-Gm-Message-State: ABy/qLaHuLLSV8crf2rxjF9Hvu8dGBZEwgm2kOhVOmcST5pI9M/QQOQA
 sXB6XOQnMmLibVbQfbQFvyhMkOhEiND1zt8pConbCCPxLAQBsfnh0IHw2cy/j0e5oxZQN3UFwnw
 T8oJxqRv662nv
X-Received: by 2002:a17:906:73c4:b0:993:f15f:efb7 with SMTP id
 n4-20020a17090673c400b00993f15fefb7mr3994607ejl.8.1689335972111; 
 Fri, 14 Jul 2023 04:59:32 -0700 (PDT)
X-Received: by 2002:a17:906:73c4:b0:993:f15f:efb7 with SMTP id
 n4-20020a17090673c400b00993f15fefb7mr3994591ejl.8.1689335971786; 
 Fri, 14 Jul 2023 04:59:31 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 gr19-20020a170906e2d300b0098e2eaec394sm5390425ejb.101.2023.07.14.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 04:59:31 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:59:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH 2/3] hw/arm/virt: Use generic CPU type invalidation
Message-ID: <20230714135930.428e7d19@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230713054502.410911-3-gshan@redhat.com>
References: <20230713054502.410911-1-gshan@redhat.com>
 <20230713054502.410911-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KIJp5QqS+bKP

On Thu, 13 Jul 2023 15:45:01 +1000
Gavin Shan <gshan@redhat.com> wrote:

> There is a generic CPU type invalidation in machine_run_board_init()
                              ^^^^^
using that throughout the series is confusing to me.
Perhaps use original phrase 'valid cpu types' with appropriate rephrasing
would be better 

> and we needn't a same and private invalidation. Set mc->valid_cpu_types
> to use the generic CPU type invalidation.

I's suggest to replace commit message/subj with something like

arm/virt specific cpu_type_valid() is duplicate of ...
drop it and use ...

> No functional change intended.



> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc2663..43d7772ffd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -203,7 +203,7 @@ static const int a15irqmap[] = {
>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>  };
>  
> -static const char *valid_cpus[] = {
> +static const char *valid_cpu_types[] = {
>  #ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> @@ -219,20 +219,9 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
> +    NULL
>  };
>  
> -static bool cpu_type_valid(const char *cpu)
> -{
> -    int i;
> -
> -    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
> -        if (strcmp(cpu, valid_cpus[i]) == 0) {
> -            return true;
> -        }
> -    }
> -    return false;
> -}
> -
>  static void create_randomness(MachineState *ms, const char *node)
>  {
>      struct {
> @@ -2030,11 +2019,6 @@ static void machvirt_init(MachineState *machine)
>      unsigned int smp_cpus = machine->smp.cpus;
>      unsigned int max_cpus = machine->smp.max_cpus;
>  
> -    if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> -        exit(1);
> -    }
> -
>      possible_cpus = mc->possible_cpu_arch_ids(machine);
>  
>      /*
> @@ -2953,6 +2937,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>  #else
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
>  #endif
> +    mc->valid_cpu_types = valid_cpu_types;
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>      mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);

