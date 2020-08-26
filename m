Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp954502lfc;
        Wed, 26 Aug 2020 10:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMPOA8epKP0+fsmM0ZQH1wAvqkmiz4SLpRJS9C9uEVPhi4ZL2hAKlDAhxoUbErAHt7BFDq
X-Received: by 2002:a25:7453:: with SMTP id p80mr22769242ybc.441.1598463779458;
        Wed, 26 Aug 2020 10:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598463779; cv=none;
        d=google.com; s=arc-20160816;
        b=D2j1SOrzmlxB/yaoBYa7COzHVsoCBZYPzPY4v91/oyfUOWEJW8xlOKnCZ38OP3yiuT
         YL9liO91ZJJ4qmZzzRSZntyhonpn7W0wrnplppWapFE6M0MU55+xjpImAxeGiOmlymQD
         SRijMGXYduyVGKWaC77T5C1QFh/ErmtTInkdjP2TUzdaiWepckTRfrNuZWWrsGp4EnB9
         98lai7TyvGyEpPAojvQ4MJ1X68ka5S8CbLlTtxe31XBLCeAqf+YdbqWdEQa1eU/Ej1eh
         M9d90tIeg9IC9HuWfj4uCo5X0qwUhLcpjNdy/NwnE+egheOdXcLkreiRSuz5MbkAI57V
         ggwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=3qb9iRO/PwSV9NFhKNd1ED2pxLCZVEdGyUkv49j5+x4=;
        b=I3RXKA8HEbH/klHGWNNi/kTurInuUHI7zH8T03sncnKAPcNKCRYJVmBHFTXqgzHWNX
         UJHTFjTeRosf7pYDTucqlXGDFtBIk8kiKrv0fuwDWa53ApJ6ebTpwgBKuI6JRDohGxLe
         Cc1ixkKCHD9w2c7IjqcvIq/FCYA14QJoS/w6RpFbZOOlJTFoeVsIghaffPYTag5kuMYW
         joKnSzq3H/fjxKSMlM0ERqdixWwGIJWSK973JpbOhO7fVshw4+mtrAUd2bAvvaFoyIVh
         WHBDhyJnlW1UvCynnJ0z2e/OgBldEM7SqL5+z4B394kVr/9Cu0N59KTVll6TNjbaLLuQ
         KGXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WsH0N28S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si2561417ybp.130.2020.08.26.10.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 10:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WsH0N28S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAzRq-0002pA-R9
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 13:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAzRd-0002oB-U5
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 13:42:46 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAzRb-0001LX-Aw
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 13:42:45 -0400
Received: by mail-wr1-x443.google.com with SMTP id r15so2656914wrp.13
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3qb9iRO/PwSV9NFhKNd1ED2pxLCZVEdGyUkv49j5+x4=;
 b=WsH0N28SkEPk9DBooqvPuEz1x0Luu8vrvJgiaMhFOL7xrREyyERULBQ9c/OSZfzbn5
 FZkET/gJCqNJbX5FQULCdNyCNv6CI0Hni701heMycDK+aZ7I1coSie3OmGdemoS64B/M
 YyeiEBGKn9R9Q0WK/GJp5QYjA6SJu3LnXZTdNf01sq6pDFIeRnM8hyAWpvj0NOd5c+Dp
 yXWwt1GnovU1ogkyxWtJleEev0c2KfP/wzlr+HvBPVIRr83glm4Vau+zJ6qtFKZ2t8om
 WHLph7OK1cFMe6y7t8VaeB4lHRKHyEnoQav0EVbm6oBsAccyo5mzBWj2y1H1txiDE6dw
 5ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qb9iRO/PwSV9NFhKNd1ED2pxLCZVEdGyUkv49j5+x4=;
 b=UXuWs66znQGOmwqPGX3bSDA6oia1TKqLyEp2ptWSmO8zHtbv91Z0ElQJc23o9IB8kL
 xxQ4IBX2nlhE3VTpYBgHzqhSzOccn1BP7oVAtVHn1aXatZmrMHwUOn8ZDVNIreQPq0sB
 VjQzXpJyFMdzqWEQwtmcQf7U4I0UU1O0HzY+T+kQYn2nhzz0GoQzzcTtfS3qFKo0cxrb
 I/pn3wHDLSrFceznJRCT1A399UFSpgAEKKtgVx5EKBWrkX3dbx4TgRlFu3bNcPkWfPIz
 rEd6uGdQ4qO/CLnrTojL7Nb9Warveiskm9pkhpKuAHGqKRHgl5g1dKox4P0IN2g3GkJd
 5kdw==
X-Gm-Message-State: AOAM532b+NEtwCuw7Gq1HkhoQwFqJiebskUAEAr0nUXLSz7rFzCIhFSp
 wDZ+VeyzkrOpq8B3mGrVCl1LXQ==
X-Received: by 2002:adf:ec4d:: with SMTP id w13mr11678817wrn.60.1598463761421; 
 Wed, 26 Aug 2020 10:42:41 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id j5sm8587452wma.45.2020.08.26.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:42:40 -0700 (PDT)
Date: Wed, 26 Aug 2020 18:42:39 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Leif Lindholm <leif@nuviainc.com>
Subject: Re: [PATCH] hw/arm/sbsa-ref: add "reg" property to DT cpu nodes
Message-ID: <20200826174239.us5etrvktv7m77sa@xora-monster>
References: <20200825165217.7379-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825165217.7379-1-leif@nuviainc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=graeme@nuviainc.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIyBX1WKAqhI

On Tue, Aug 25, 2020 at 05:52:17PM +0100, Leif Lindholm wrote:
> The sbsa-ref platform uses a minimal device tree to pass amount of memory
> as well as number of cpus to the firmware. However, when dumping that
> minimal dtb (with -M sbsa-virt,dumpdtb=<file>), the resulting blob
> generates a warning when decompiled by dtc due to lack of reg property.
> 
> Add a simple reg property per cpu, representing a 64-bit MPIDR_EL1.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index f030a416fd..167c57a08b 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -183,7 +183,22 @@ static void create_fdt(SBSAMachineState *sms)
>          g_free(matrix);
>      }
>  
> +    /*
> +     * From Documentation/devicetree/bindings/arm/cpus.yaml
> +     *  On ARM v8 64-bit systems this property is required
> +     *    and matches the MPIDR_EL1 register affinity bits.
> +     *
> +     *    * If cpus node's #address-cells property is set to 2
> +     *
> +     *      The first reg cell bits [7:0] must be set to
> +     *      bits [39:32] of MPIDR_EL1.
> +     *
> +     *      The second reg cell bits [23:0] must be set to
> +     *      bits [23:0] of MPIDR_EL1.
> +     */
>      qemu_fdt_add_subnode(sms->fdt, "/cpus");
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus", "#address-cells", 2);
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus", "#size-cells", 0x0);
>  
>      for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
>          char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> @@ -191,6 +206,7 @@ static void create_fdt(SBSAMachineState *sms)
>          CPUState *cs = CPU(armcpu);
>  
>          qemu_fdt_add_subnode(sms->fdt, nodename);
> +        qemu_fdt_setprop_u64(sms->fdt, nodename, "reg", cpu);

To obey the statement earlier shouldnt this be taken from the mp_affinity
variable in armcpu?

Graeme

>  
>          if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
>              qemu_fdt_setprop_cell(sms->fdt, nodename, "numa-node-id",
> -- 
> 2.20.1
> 
