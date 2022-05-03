Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1270403lfj;
        Tue, 3 May 2022 01:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaZ70BwxJQ+tR5EUih1+RlagCwpzz6cJ2cD7anwg5T6n3CShlCbsnf8WSLaCW/afLo+Y3/
X-Received: by 2002:ad4:5bc3:0:b0:44c:a073:a61a with SMTP id t3-20020ad45bc3000000b0044ca073a61amr12755359qvt.131.1651568196690;
        Tue, 03 May 2022 01:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651568196; cv=none;
        d=google.com; s=arc-20160816;
        b=qZV1O1Nuzst7BB2EEfm3+fPB1j3PUEu/CqFfLlpcdurhqZCo7x6nc8byejV4Oo0cDq
         rdMSgTys7pQqT2xcHUqG21oTtYiVhWj1gOTLzHJcUK+Iq0KVOg979yilxsR3lPJ8D14p
         1Or/1MLR+3TzJYybEBNWeJ0XOf/Be6ebdI6Yt1GzmZ58AJO8+AvUvXQYa8QcG2plsQWd
         XR0rvz5joQIp4sSOaEEbLsZOO6j1ZAXXuSo3y13XTtJdV58JNcDRVm/imkIkgsb681+Y
         fT1GFkGD22hWiRU4nPnoiEaUcNuljVGNo7qUY5UEZHRWE1NGf0fWd/3UNuqprt4DgXOT
         IFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=GjnYj/ZOOUL49hkzCRaPKG5onLfJkEFAiy5bl3UjpMM=;
        b=leCs0gsBGyG2cCCg7CxFbs53igEWIVlScaEQcVsE57eBuZx4ZbqKoXczeyRtNlceGb
         51SB58Qzzv7KnkhoNkBRiqTra+DkHCga2Q7DDrQ5e2Qb2eWK32gIKpKdM0fMb7EIywkH
         vvzDh3z1gQIbrXeVDCkLzmQff+pwPLMt2DeYbppmrsdD3ceu7BapXi57BZjv6Ld1ANfj
         JQJXEfZltPN9MnEDNcp2wLYYJHCAvHS+yQ02BQUGreYjqNNgAyI6P1hKBU/7LJVpuRGA
         vTAZj2GveuTj6mkG4HKdoZFme/6Jpe4f5QqLQeB7+Ge2+YgIgW3xPrmOw6oOkyL1kv1b
         LauQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FGVUodSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a0cd410000000b00446527d9487si7114391qvh.22.2022.05.03.01.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 01:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FGVUodSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nloKh-0005FG-Sw
	for alex.bennee@linaro.org; Tue, 03 May 2022 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloKJ-00054Q-Ba
 for qemu-arm@nongnu.org; Tue, 03 May 2022 04:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloKF-0006Al-8o
 for qemu-arm@nongnu.org; Tue, 03 May 2022 04:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjnYj/ZOOUL49hkzCRaPKG5onLfJkEFAiy5bl3UjpMM=;
 b=FGVUodSFAvJgfaQM2js9uoLxE4/3DW1g9TZMudKnkTRceP2YAvKNC+Twczv3GQF8r1Yf34
 Y63mag3+2MnVoP/IoeIvdIN7FoFKRSelQ1m8CI7BRc9UH9Xd88vxi9IwsD4fd8BI5jbrJ9
 +tUAnjqWdDU15QkvoC4CNi3Ildv2l8E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-8NK6r_YtP0qv6J3i_gxmPQ-1; Tue, 03 May 2022 04:56:03 -0400
X-MC-Unique: 8NK6r_YtP0qv6J3i_gxmPQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so6110440wrv.0
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 01:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GjnYj/ZOOUL49hkzCRaPKG5onLfJkEFAiy5bl3UjpMM=;
 b=ZYz0rQEmwW2wraJRe8WviRdocbXDcMCzqrWVfar4dL/Avk8rsZIz7dEEdZ6U/hq3ya
 27EaGcuT09th7/OO5VWfxeoA3lRqoZZq/gGsfCz6BnAot4wJ1FvqI85yFiIuOSnq9Nrq
 zz531QWoelij4WvHHVG0rc/3ny7+bia90hWReneFzum9nSbhxcZj2Na/C3cApatR90Tn
 1AdPUKx4dS9DtJ9ARE51CfqyUZwTt2EqQno/RpKtQRnHMaIHDVwW2qdMd7kRteaTEVml
 kTA09SG0TqgS/9mh+jgoMVNXHxLMCnltmydBybW3AYMCb4eiZRMtC3/JWzZttzzdZcsn
 LQXg==
X-Gm-Message-State: AOAM530glUO8KG76m71FQ0uagcaUBpH8ZHECyj3Tg8T0YhgMQzeYiyFL
 30y05DX9GOhJkB4KOs77B2XRFvB1fJqvlZNfMhlIGhVhCfVeEqCkN1Qz0s7O2QPuMm4N/+LIu7A
 tjMh1fA14mMHE
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr2315002wmj.171.1651568162601; 
 Tue, 03 May 2022 01:56:02 -0700 (PDT)
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr2314972wmj.171.1651568162382; 
 Tue, 03 May 2022 01:56:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b003942a244ec0sm1360264wmq.5.2022.05.03.01.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:56:01 -0700 (PDT)
Date: Tue, 3 May 2022 10:56:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 armbru@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
Subject: Re: [PATCH v8 3/5] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220503105600.112234e2@redhat.com>
In-Reply-To: <20220425032802.365061-4-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-4-gshan@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sOh/ub3oBkZX

On Mon, 25 Apr 2022 11:28:00 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
> 
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine. Besides, the used SMP
> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> to avoid testing failure
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5bdd98e4a1..0fd7f9a6a1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2560,6 +2560,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      int n;
>      unsigned int max_cpus = ms->smp.max_cpus;
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>  
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len == max_cpus);
> @@ -2573,8 +2574,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id =
> +            (n / ms->smp.threads) % ms->smp.cores;
>          ms->possible_cpus->cpus[n].props.has_thread_id = true;
> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> +        ms->possible_cpus->cpus[n].props.thread_id =
> +            n % ms->smp.threads;
>      }
>      return ms->possible_cpus;
>  }

