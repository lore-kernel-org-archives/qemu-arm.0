Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp89486lfc;
        Fri, 15 Oct 2021 06:12:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQe/A0mtI3r+Dsr34YyoadgrAEzmLOJ8TuFETpoIBYc63IDEoKTlt+5ryylNMRVWb4C8/X
X-Received: by 2002:a67:df07:: with SMTP id s7mr13430007vsk.42.1634303542104;
        Fri, 15 Oct 2021 06:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634303542; cv=none;
        d=google.com; s=arc-20160816;
        b=qCnQDCaU3dns+w5jnFUUKGQRziyOH+VlQjAGcu+PbADGFwz2F3cn2J1LrP6By07Q8y
         cXO4oLVEVHB63fY+W92PfIVKT1DRB+FVN9nmhpINmxtNXc3yCdAwFGIfTK6KYIobQ5VY
         MKfNWCIOP5caFPe0P6HINtU7mQF/iX3kKSadSB2Hc+Q5GTrE5wQ1dALB7NpsqG6AgqMa
         JCuUvs5yFDsyDov4mLZu75mmENZbhklyDBF2+mhvLmwFZCYuJH0qSwimk7ub+4Nztcxe
         Vj5WcszdGe+Zmc4Xw1xmN3Vp7PwajBUAdN6JD9MpsfoRWKOydVib/1gBe6pCvym4dy1v
         RXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
        b=R1JCfp3iqT8rn5T4mEjXZWyWKLvJfhFnWAF4DzWhPyP5LLdttVQyTPP77gdxboZSFJ
         86KuTOkNlnduipwrXyI22Dcl9jECOAHD2I6EtXao5FLDpTfDnlVAaTctjMRe8NPxEdwp
         F6aXOl459j/EiG/61WMI4MkfYtj6IKhrIA6jlkxlBgwy2Se+dwHcAgpxrDiAHVKjr9Wt
         WBtdunhzIyTwJ5dq6fuK8ORd7kHKQOPSTCMel4uZEWh0HvcRk/kxwllL4Vo1aM5bzEQs
         nce2g9PHv9B8R3NnWqE9kR2I0/BG9KZs6nGfdmK+M9bDiHdjLpuOwBZJRgXXhgFbBoVY
         9kKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ut5yHHFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si5974064ual.236.2021.10.15.06.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 06:12:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ut5yHHFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbN0X-00060L-BK
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 09:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0G-0005jY-Fz
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 09:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0D-0006ju-64
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 09:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=Ut5yHHFvW0U/vkQtuLfL7Lnzp+c/xq/CwyTBSQwuhpS+KQyuYIvjFYfgWEzSx1CafEmxl3
 HM/Odf9XoaYpzbMOf87h7FoOmR4bopL9mpuFtcgf81IZC5TsJsDn7bftzmByXjjZNdrxaG
 B7Eo7A8Js8ZHHisxvlb86cT3MhmOzqM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-4NcQ0bjePbO2m3we6X4kHQ-1; Fri, 15 Oct 2021 09:11:58 -0400
X-MC-Unique: 4NcQ0bjePbO2m3we6X4kHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso660404wme.0
 for <qemu-arm@nongnu.org>; Fri, 15 Oct 2021 06:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=exkSNzVgjTGnK979DjJsZTVfvmNh6gRy2PiFypj2Os3JTR/WiThRQNNy8l9XGNGPlr
 MnKXfDEWCK9RwqtqKeM+p30Q21J7D3G2SMRFyCC6PN032OBy0RCWeNhjV2Ywt275TFhD
 ip8wl2EeAGiMGTKCTM191RGfx8HNIBt8Oxj+o9VgtLzjsLJD77akVAqHmaxChke9CWZJ
 iQ4igrAHTkt6atXosWO8tjWu2246iq01r1rf+49zbFofJc1t0cQV79RhHME0oT9s7vR5
 iAZQVOkwBKMvmLyzAdoBZ909BnHdycy4U0CRWMXICuOcCYHf1uKjvGWoLraioI6M8mlV
 4M2g==
X-Gm-Message-State: AOAM531sQ/ykZhclHqzaLZedAroPbyUf/ChIDp7BpY69HduIGT9Vl6rt
 upuWp/d+REzrrV0dO0zHtHhnPGK4eZQeWA4F+TFB9XtkYbMlfBO1Jb3iVZpBPl6JDWloH7P5ezx
 XcW7IWzBKP3pw
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520955wmo.62.1634303517623; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520899wmo.62.1634303517258; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id j16sm4955421wms.16.2021.10.15.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:11:56 -0700 (PDT)
Date: Fri, 15 Oct 2021 15:11:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Message-ID: <20211015131155.jkxapvfvrlteo4k7@gator>
References: <20211015124246.23073-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: robh@kernel.org, qemu-riscv@nongnu.org, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eOdeIR47j9KL

On Fri, Oct 15, 2021 at 08:42:46PM +0800, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=512M            \
>   -object memory-backend-ram,id=mem1,size=512M            \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>   -numa node,nodeid=2                                     \
>   -numa node,nodeid=3
>     :
>   qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.
> ---
>  hw/arm/boot.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee4..74ad397b1f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -599,10 +599,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>      g_strfreev(node_path);
>  
> +    /*
> +     * We drop all the memory nodes which correspond to empty NUMA nodes
> +     * from the device tree, because the Linux NUMA binding document
> +     * states they should not be generated. Linux will get the NUMA node
> +     * IDs of the empty NUMA nodes from the distance map if they are needed.
> +     * This means QEMU users may be obliged to provide command lines which
> +     * configure distance maps when the empty NUMA node IDs are needed and
> +     * Linux's default distance map isn't sufficient.
> +     */
>      if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
>          mem_base = binfo->loader_start;
>          for (i = 0; i < ms->numa_state->num_nodes; i++) {
>              mem_len = ms->numa_state->nodes[i].node_mem;
> +            if (!mem_len) {
> +                continue;
> +            }
> +
>              rc = fdt_add_memory_node(fdt, acells, mem_base,
>                                       scells, mem_len, i);
>              if (rc < 0) {
> -- 
> 2.23.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

