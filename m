Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3385325lfm;
        Tue, 1 Jun 2021 00:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLb2ztkXQ95uby974i0WGD+QvTtnhUG1KFowAnMmuQXB8K+wgSW4rEtivOvrq5s7NdW9af
X-Received: by 2002:a67:c904:: with SMTP id w4mr17389197vsk.48.1622533862967;
        Tue, 01 Jun 2021 00:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622533862; cv=none;
        d=google.com; s=arc-20160816;
        b=o2dMT5hwGnTLQ+V7iyAvxlAA858MCF0rsFG0qMK4oJc2GTeqIbL7/xXfcMJZwW4oCs
         JIaysoFpEZtuSDTDX31j7l75eCQ+1acWe/QiuETczn83bWEkpDionHFdClMg0xU4Og9d
         DjAARs2QoM+4/Kct/qQFyDA2qDJCu7A1vSect5mqT8GuX4EKJf09UbUFEJtrJer+gD9i
         wwAo6C7qmUwFLAYBYhQ7zoLiSwBrTvF0GHWwq8eZO3nRmZ51sUtEw2OxrIlTI+C79Ie0
         uLIW797Sf7wyP8cIkhxnY9vB2VjNGlt1ZulOxN6lj8iJ7v2RqKQLwARiNSPMZKa5767K
         MXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=C64e75GgMTRWfcurqOMRagNaQwEx0C5Uf35Lq9xHlK8=;
        b=gyLC7CeXsmFGlEWgPUVaAftKeQY9NzzD21rmJoMlsTz9dsA2cENDJF1ZShXXZdEqyS
         kxzLCnpbK8i0IjLto8C8OBXLcBj8E/YOcAVIoYP31UDAF+lIHfDaOpjyvH8NetETAcFl
         pwQ2iG01rxqAV/dD8fsmBIAJq0OKDTJhtuL0zAUCEWMgkvB8GTMSsYZleCqE62lxOUkk
         8cfZR9aQZ6XSdprRucvDorYyAbIebJxP7/yu09xPTGCXmdqgU++WaQOsVEuJOC/zAc6T
         jyGEO5mXFjrx4sqb60YEywxYAS7E/fs2ya62KErUtI+pK/LKq9xRpfyLHsRl/beQ9Aew
         k8Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RZRs3bie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si5936244vsq.262.2021.06.01.00.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jun 2021 00:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RZRs3bie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lnzB0-0008GU-9w
	for alex.bennee@linaro.org; Tue, 01 Jun 2021 03:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lnzAt-0008Do-1C
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 03:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lnzAq-0004nG-Re
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 03:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622533851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C64e75GgMTRWfcurqOMRagNaQwEx0C5Uf35Lq9xHlK8=;
 b=RZRs3bieTgLKPeZUFy6n4nI8HBbqh+KjMVpMHqSRD5jUFIgrzzuLXWtaDrMJ4B7ghq4Lld
 5c9taSthCq5IL1V1RkY5QPOFDea8I32U3+aKO3gEE2q5tYf9lKHF6huwbreWGP6wltTXSZ
 7Q8x9Q0EK6dzMCM0Z0fK7/xDCj4dwYA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-seBYOvqvPCiMjgEQE0do_g-1; Tue, 01 Jun 2021 03:50:49 -0400
X-MC-Unique: seBYOvqvPCiMjgEQE0do_g-1
Received: by mail-ed1-f71.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so7394666edt.23
 for <qemu-arm@nongnu.org>; Tue, 01 Jun 2021 00:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C64e75GgMTRWfcurqOMRagNaQwEx0C5Uf35Lq9xHlK8=;
 b=nC6QGIyUeVHwKz8MD6FDdOXU0jU81G8UVSJCqm+j/27BXzRa9MYIu3oafzBEOOp/4i
 Baf+2AGeYdcdg65Gopbyj2AmHuqYW67eqlGoTveJUs6RRZY35CJMwwRChELAuZFSriEQ
 UU0gFBbHJuWjLDvKdyszEC+42GmFW+I80Q4C0wtlI+JjkfN+r/Hi8gNWs5X8++OJCJvQ
 GMa8+zutbY52Y9i3LJh553vio5KqZ6Uh3u5FM40ILnQ/fAhrb7YABX88ci2FzduSjJbC
 ACtjmKZIhIgrBS3CF3L///bpFwGYeO/lDyg+UU/YwGYH9k8JCPNyi3LVxxUMhVfeFtaS
 7bvg==
X-Gm-Message-State: AOAM530fztqOBpsXapIjXA7AGFabhAicBRkULsj/MgmdTqK25X4Ad/NX
 0Q4hstRICF3sHFjfnzsClTnnqXsTF5tmPrpiHlFCftABHoxBOXmMcxHPcwY6UwpzdBcyIRjnoAc
 LFvFMYSzFr/kP
X-Received: by 2002:a17:906:27d3:: with SMTP id
 k19mr6628297ejc.368.1622533848140; 
 Tue, 01 Jun 2021 00:50:48 -0700 (PDT)
X-Received: by 2002:a17:906:27d3:: with SMTP id
 k19mr6628271ejc.368.1622533847904; 
 Tue, 01 Jun 2021 00:50:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id bh3sm6857061ejb.19.2021.06.01.00.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 00:50:47 -0700 (PDT)
Date: Tue, 1 Jun 2021 09:50:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210601075045.ppmceogd5hp5rqcf@gator.home>
References: <20210601073004.106490-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601073004.106490-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M5t6ptTUDio3

On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> We possibly populate empty nodes where memory isn't included and might
> be hot added at late time. The FDT memory nodes can't be created due
> to conflicts on their names if multiple empty nodes are specified.
> For example, the VM fails to start with the following error messages.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
>   -accel kvm -machine virt,gic-version=host                        \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
>   -object memory-backend-ram,id=mem0,size=512M                     \
>   -object memory-backend-ram,id=mem1,size=512M                     \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
>   -numa node,nodeid=2                                              \
>   -numa node,nodeid=3                                              \
>     :
>   -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> 
>   qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
>                        FDT_ERR_EXISTS
> 
> This fixes the issue by using NUMA node ID or zero in the memory node
> name to avoid the conflicting memory node names. With this applied, the
> VM can boot successfully with above command lines.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/boot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d7b059225e..3169bdf595 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>      char *nodename;
>      int ret;
>  
> -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    if (numa_node_id >= 0) {
> +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> +    } else {
> +        nodename = g_strdup("/memory@0");
> +    }
> +
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>      ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> -- 
> 2.23.0
>

Hi Gavin,

Is it conventional to use the unit-address like this? If so, can you point
out where that's documented? If it's not conventional, then we shouldn't
do it. And then I'm not sure what we should do in this case. Here's a
couple links I found, but they don't really help...

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#sect-node-names
https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#memory-node

Thanks,
drew

