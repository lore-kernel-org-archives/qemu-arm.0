Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4170861lfg;
        Thu, 27 Feb 2020 01:04:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSrmrHAvLQgj//Cml50pSH+ObK6s9ZFIAy/uSx8kivDDFxyQUl4Mn6jQ2I/pjYgzb6WIzR
X-Received: by 2002:a37:670b:: with SMTP id b11mr4195736qkc.381.1582794263087;
        Thu, 27 Feb 2020 01:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582794263; cv=none;
        d=google.com; s=arc-20160816;
        b=t2s1Xdc5e7H556JXBoi1m9fCL0ercIvSGhgjLIBYPhAHOptZJLrvuJPC82d4QdKHy3
         rBcOXwhuq0uvv4HyvRV9ns3U6o01bgTG1PFsie28mS1OtN5ZqffXnnh03oFt/fTwW6qC
         igwTYM5zvodHPOunaJnrI16gaz4QqZCv/QcD2TEzbtyxa+1F0heOQPdIIiKrt39mESzk
         Cwrs/2PpnQI/B4hc0II7K6o3yL32kAC8cg1pMzIfnAa1q56sM8BBe7ihf9ZHmquFotVU
         sTG1BOCm4x+E6ySH4pMVWm2AeqemxYZKxz1Vkrt1HIh9owM5ZeG0iv7I54ND4ks2BRXq
         AqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=UuVEFGjFoCwRdUXFkpSQiJVRCXSHYZkRwn/XV+QXnS4=;
        b=XDEPEUU9v3GfC46ANx/Rkl2kbIItBJP6eS96Eth7+2mMzlCM0pJHFg7LhlYjU1xptJ
         XPTvO1ordG6F8TjMMHo7Xe5oIASqXmCUJdxe0B7PoFo+VXfl9XhzVS7AmQbFshvFpxg2
         oGHrCvDhR+poP8DT/zBKS4j6jhdbbBbGF3BEIS6HdxXzpsnjRDrICPhax73tJxFM32SB
         mhdUdf3UQU0MgiZ3ZhyrwGdHqgkmYqtMixpiA11CHOZSAXhVSZ5DhzKAUcxIUYzN+Vv4
         jbed7oKIMnEZ4d+dDnG0jgc0fJsjaAD/P+FV9afv9Up7CMc9yQ14+/PC1Yd0XOtQPzjL
         t4bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25si1080392qtq.34.2020.02.27.01.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 01:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7F5i-0007iD-HB
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 04:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1j7F5Z-0007fx-ED
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:04:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1j7F5Y-0002Ki-Ai
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:04:13 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:40813
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1j7F5Y-0002Im-0F; Thu, 27 Feb 2020 04:04:12 -0500
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 3D1BC8138E;
 Thu, 27 Feb 2020 10:04:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYypmEaA3E1k; Thu, 27 Feb 2020 10:04:11 +0100 (CET)
Received: from localhost.localdomain (lfbn-tou-1-1471-22.w90-89.abo.wanadoo.fr
 [90.89.4.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id C5BF98138B;
 Thu, 27 Feb 2020 10:04:10 +0100 (CET)
Subject: Re: [PATCH v1 2/2] hw/arm: versal: Generate xlnx-versal-virt zdma FDT
 nodes
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200227154424.6849-1-edgar.iglesias@gmail.com>
 <20200227154424.6849-3-edgar.iglesias@gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <d921bb4b-0632-cfb6-5275-f25a079ee21e@adacore.com>
Date: Thu, 27 Feb 2020 10:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227154424.6849-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0VvDxZQe7JzS



Le 2/27/20 =C3=A0 4:44 PM, Edgar E. Iglesias a =C3=A9crit=C2=A0:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>=20
> Generate xlnx-versal-virt zdma FDT nodes.
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

> ---
>   hw/arm/xlnx-versal-virt.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>=20
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index e7f4ca8bf9..878a275140 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -229,6 +229,33 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>       }
>   }
>  =20
> +static void fdt_add_zdma_nodes(VersalVirt *s)
> +{
> +    const char clocknames[] =3D "clk_main\0clk_apb";
> +    const char compat[] =3D "xlnx,zynqmp-dma-1.0";
> +    int i;
> +
> +    for (i =3D XLNX_VERSAL_NR_ADMAS - 1; i >=3D 0; i--) {
> +        uint64_t addr =3D MM_ADMA_CH0 + MM_ADMA_CH0_SIZE * i;
> +        char *name =3D g_strdup_printf("/dma@%" PRIx64, addr);
> +
> +        qemu_fdt_add_subnode(s->fdt, name);
> +
> +        qemu_fdt_setprop_cell(s->fdt, name, "xlnx,bus-width", 64);
> +        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> +                               s->phandle.clk_25Mhz, s->phandle.clk_25=
Mhz);
> +        qemu_fdt_setprop(s->fdt, name, "clock-names",
> +                         clocknames, sizeof(clocknames));
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_ADMA_IRQ_0=
 + i,
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addr, 2, 0x1000);
> +        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(co=
mpat));
> +        g_free(name);
> +    }
> +}
> +
>   static void fdt_nop_memory_nodes(void *fdt, Error **errp)
>   {
>       Error *err =3D NULL;
> @@ -427,6 +454,7 @@ static void versal_virt_init(MachineState *machine)
>       fdt_add_uart_nodes(s);
>       fdt_add_gic_nodes(s);
>       fdt_add_timer_nodes(s);
> +    fdt_add_zdma_nodes(s);
>       fdt_add_cpu_nodes(s, psci_conduit);
>       fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
>       fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
>=20
