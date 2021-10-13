Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2820144lfc;
        Wed, 13 Oct 2021 04:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ju5iBP46Z++bpn50E7qzVKy24IXeY25CWpD3Y92Bfik4YnewP6rbFM+hofQANhIbg53o
X-Received: by 2002:a25:5846:: with SMTP id m67mr33931354ybb.231.1634124664178;
        Wed, 13 Oct 2021 04:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634124664; cv=none;
        d=google.com; s=arc-20160816;
        b=i55jIui746K3gBdB221fawgQhkmJfGtORaPAUoCv1r491/8EjJtmHCz/cMDwJl2PVI
         uod7bdw+MaqoiLhkrchakKz3yO6jGsFv9/adax+IpnwjeA0p5DL4TW93BBXkIzgw5911
         Zztk3J6T5uCzpt20FjoXps2lMqkUZqb51GznOXP7OrvioNCdzV7m8Y37xr1i4qtXuBD0
         7aVgbARyhkgKhRM3q2yat1pXC2YNoDZHFFskFSgqJU9fpFtv55fUY0Po2P3adcQBEAiH
         UTKtmcl/bccnKKSFkUUbKc5u7iB1A7wSRQFxn5wAd3qeraFfAFEiiomlhA/+GkhIB61V
         Q9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/Bz0ZINQZd+m3Ah89n6N3Fem/hA/kkA9jwROmqhKYa0=;
        b=T8nw5SvUSGpVEFBMm8Ra4bJQ0ofAQpv6Q3cTS5p21F4+gsBWMH56sazBxVIY4YeC97
         ybiBx6vATVuvSwFrv8veka6e3zz/3GnTLl82WyZYD7+R+qa248oxzl/u5DkElpU+NimG
         G7OjKsOcT+iFyIzYJJJzTZWNoVcuUYlB92vj68p/ak34vN+y47ZGAWrUcAgw8xFYlJQ9
         8Uo6vhH/cet7kO6jDJ4FtGr60ENOxbter6x5y6ynafA54xQiEnComseJHThcUV7sNKPM
         OHht8X8yErK7s2HX0hiL3smtEQ9+pd3bsEgYy2riFIxdDoNoThqSe/seL2fcJXqTKYx1
         viUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F4AzH9j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si14009836ybl.189.2021.10.13.04.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 04:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F4AzH9j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1macTO-0007W4-Eb
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 07:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macSx-0007VY-Mo
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 07:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macSu-0001b6-Bw
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 07:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634124617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Bz0ZINQZd+m3Ah89n6N3Fem/hA/kkA9jwROmqhKYa0=;
 b=F4AzH9j51PmFhDP0Ly94ai0tBvAN2csCMlKB01dffYXjs9nPqSFKktnFtvNsCi60FPS8Lu
 l0Y8UM8NsThFI/TzzVhsErR09c5rOe8QeSaod54U5WRjf4wdjXgw2W8LwbCGXmmsro4z3/
 DfbBUwRdWacFKPobuz3dCLBHC671TnY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-Veg2LXkZMUyzWKqh00RvPw-1; Wed, 13 Oct 2021 07:30:16 -0400
X-MC-Unique: Veg2LXkZMUyzWKqh00RvPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so1928511edi.12
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 04:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Bz0ZINQZd+m3Ah89n6N3Fem/hA/kkA9jwROmqhKYa0=;
 b=DATPa0Ay+wkI9Fv/bX1ymb1RJxcwO9GRA3Eja9uD4XXTONcbBK48ORiJCN3hq2qbhn
 8tHnfY9YK8IQkBjVS16cYkERE7nZ6QskFH+11fg2U27pVje6E0LJt4mPxlMWUCqbHDUk
 qPIaBatXj+B/l2zu+pRIrMDHsSIxNp+2+AlcdVrlISk3KCyRoBGpWjrE6zoVVN0ksaQW
 4hVNwYX5mbcwaYwzuUmKeaMF1F48DgzvItWWqyTrWNM0bbjNFBv1J5vPOt6rNSvR06Mv
 wDY3rf8VyOKnv8yJHQvAcVgQSdF3L+FT6O7tO2N1DS8EYYd9M2XwzctDRNTE/UaMaTLl
 0z/g==
X-Gm-Message-State: AOAM532vHEeGgz44lUSokRYe38DA45pVUSf3z9g2JEk6YbKzd4aY6YoO
 0KFkz12/STFtgsUzNHDjIaDUdh4M0bt14gpi6P0cSuDCumZ+y6cdz8U+AZN5wSZohS74LbpwyMx
 YmZxd/YLYodgW
X-Received: by 2002:a17:906:ca12:: with SMTP id
 jt18mr39654120ejb.451.1634124615247; 
 Wed, 13 Oct 2021 04:30:15 -0700 (PDT)
X-Received: by 2002:a17:906:ca12:: with SMTP id
 jt18mr39654091ejb.451.1634124614998; 
 Wed, 13 Oct 2021 04:30:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q23sm6692049ejr.0.2021.10.13.04.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:30:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:30:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013133011.62b8812d@redhat.com>
In-Reply-To: <20211013045805.192165-2-gshan@redhat.com>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 robh@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JA1FOf7uK5WZ

On Wed, 13 Oct 2021 12:58:04 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on platforms like ARM64 virt. For these empty NUMA
> nodes, their corresponding device-tree nodes aren't populated,
> but their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> This adds extra check after the machine is initialized, to
> ask for the distance map from user when empty nodes exist in
> device-tree.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/machine.c     |  4 ++++
>  hw/core/numa.c        | 24 ++++++++++++++++++++++++
>  include/sysemu/numa.h |  1 +
>  3 files changed, 29 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..c0765ad973 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
>      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
>      machine_class->init(machine);
>      phase_advance(PHASE_MACHINE_INITIALIZED);
> +
> +    if (machine->numa_state) {
> +        numa_complete_validation(machine);
> +    }
>  }
>  
>  static NotifierList machine_init_done_notifiers =
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 510d096a88..7404b7dd38 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
>      }
>  }
>  
> +/*
> + * When device-tree is used by the machine, the empty node IDs should
> + * be included in the distance map. So we need provide pairs of distances
> + * in this case.
> + */
> +void numa_complete_validation(MachineState *ms)
> +{
> +    NodeInfo *numa_info = ms->numa_state->nodes;
> +    int nb_numa_nodes = ms->numa_state->num_nodes;
> +    int i;
> +
> +    if (!ms->fdt || ms->numa_state->have_numa_distance) {

also skip check/limitation when VM is launched with ACPI enabled?

> +        return;
> +    }
> +
> +    for (i = 0; i < nb_numa_nodes; i++) {
> +        if (numa_info[i].present && !numa_info[i].node_mem) {
> +            error_report("Empty node %d found, please provide "
> +                         "distance map.", i);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +}
> +
>  void parse_numa_opts(MachineState *ms)
>  {
>      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 4173ef2afa..80f25ab830 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
>  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
>                             Error **errp);
>  void numa_complete_configuration(MachineState *ms);
> +void numa_complete_validation(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>  extern QemuOptsList qemu_numa_opts;
>  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,

