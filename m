Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4904793wrt;
        Tue, 2 Oct 2018 03:57:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63UItEGRI6gX5yw1JiUh4wM6OJ5A5aLddfxpytUSYXy+AcMh6McoSbQJzcsmsyR29B87+r8
X-Received: by 2002:a37:a84:: with SMTP id 126-v6mr11598421qkk.267.1538477855985;
        Tue, 02 Oct 2018 03:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538477855; cv=none;
        d=google.com; s=arc-20160816;
        b=njwp7F4AYXH3Z65xIQ+a/FSh1EnLln+yzMvwRZaGZNMY86CPRZFPzsoZujOO1L/rsq
         YL+IRJRZoQJMn0iZOcUPsoEhebYb35Ae5/5kx4PwKrNJUgibALhiSr+CVDmxn1SHqbJD
         v31bFweKblS/F/Qfu7mXa8tw9QthTSGOa5ryOKXrs3GB4hs2vePc06rFhoQlm/cqY8JP
         MA1O9ELnDig+uUu2TEoKg0V0BJ4Tzvqf/u210vSuyMl8GyRK20Nall9D1nDpg3ASjUNt
         Dy6H/3ZMJ8B0tDfyAZncr9J8h7pSMAhjGY+Gp3iMsIpKaEdoJQmPE4wt3Nm+ucQKBgqR
         e4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=dSQV2ZAUojF22kv2aswizRFoLV3kMgw01ko6rA7uYFc=;
        b=ldS4RaEqykkuPupWnTADxyJSVpIRuXBLOzUtFCy9yxaCDWh9Kd9fPogTsIG4AY0YMv
         Q7Xz0Xe4wGK/sp3MHBXkU44EzgLGi8S59WXA3hoX4IVx9OkZjRL/mWaGMAQbewcCntvb
         Dm3rmuAk2CHB7uoD6wvRaiz6MI30JnEw2H+MiqJal0R+FPN974/kzYe3u13AtcC1WvYY
         5gDvpUdZs44P04QrxNntkGE42gui7Xurpniw82GT5nhyAagk3I70Cudx0DnnkHY9771C
         2VJJQLsnZ7tus9Vi+IdmHd6dAGGX56P7lo7On1OOBk3nto/LvU/pofMswPTaqnJzM7py
         I0DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DUS7zmhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8-v6si1317721qvr.26.2018.10.02.03.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 03:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DUS7zmhX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7IMx-0006ZK-H1
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 06:57:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7IMn-0006VO-3y
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7IMB-00069m-DU
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:56:48 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7IMB-00069b-2x
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:56:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id w67so1412640ota.7
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 03:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dSQV2ZAUojF22kv2aswizRFoLV3kMgw01ko6rA7uYFc=;
	b=DUS7zmhXAWdthivlms6MM39FMijonNrM+WnWAH/OfiUCVO85JVQuWzeAyqs9p6kwEv
	i6nPodEYwVDOLjUtELI9Y7QEAK/9azW7oy7n3gvvsWUrWoUBqPCeITb2vQBabjRC1oJP
	m2SuSpVIFYhW616fzPbPU2DiZGYngUZX+4Pek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dSQV2ZAUojF22kv2aswizRFoLV3kMgw01ko6rA7uYFc=;
	b=DDYXRCuH68e+G7T9gxl0PKPMsErGA+R0XxS4S4YNNQ41+w2qaVJLWC9U0kGMxbsipG
	FL17VZWKf16W4GIut/JX7M279f7Sog7EolNhDbsr4MnzlSSQePhW/RFjwJxvYcGAxUu1
	u/jtbX0+ea7OM1hG7dhN6bpemk1gCaI7V7O2DvvbxdRMg3z7rgQ+uqFUlmqeWj2QmCgz
	70XLq/hOtczi+puV38tcJze63D1Lynt1v55lKcmyXazos9Can8yVfXKojNIM7XMyFREM
	ci+9Ya+MPEbPjzp7iqrOQGFPDaG/7Q0YlXGO//SxPryGhNytwm7Wprbfl7+B+eQWqHsM
	kzZg==
X-Gm-Message-State: ABuFfogPYXlp9PCEZYyA77NspCkUhz3VB+tno7eRQZLNKYZ8AAwT8RhE
	1nnCUGrhg1ak0pagewoBBFIkvZkGYrA969uOgQIMKg==
X-Received: by 2002:a9d:3c47:: with SMTP id
	j7-v6mr9496563ote.317.1538477806352; 
	Tue, 02 Oct 2018 03:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 03:56:25 -0700 (PDT)
In-Reply-To: <20180921161939.822-9-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-9-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 11:56:25 +0100
Message-ID: <CAFEAcA8W0ixkfje4NSx-+kdw4rNh44JgNTu2OhDD_p91nHK7hw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 08/11] aspeed/smc: add support for DMAs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0ulyAHcvkmL

On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The FMC controller on the Aspeed SoCs support DMA to access the flash
> modules. It can operate in a normal mode, to copy to or from the flash
> module mapping window, or in a checksum calculation mode, to evaluate
> the best clock settings for reads.
>
> The model introduces a custom address space for DMAs populated with
> the required regions : an alias region on the AHB window for the flash
> devices and another alias on the SDRAM.
>
> Our primary need is to support the checksum calculation mode and the
> model only implements synchronous DMA accesses. Something to improve
> in the future.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>


> +static void aspeed_smc_dma_rw(AspeedSMCState *s)
> +{
> +    MemTxResult result;
> +    uint32_t data;
> +
> +    while (s->regs[R_DMA_LEN]) {
> +        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
> +            result =3D address_space_read(&s->dma_as, s->regs[R_DMA_DRAM=
_ADDR],
> +                                        MEMTXATTRS_UNSPECIFIED,
> +                                        (uint8_t *)&data, 4);
> +            if (result !=3D MEMTX_OK) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%0=
8x\n",
> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
> +                return;
> +            }

Does the device really not report DMA read/write failures via
a status register bit or similar ?


> +
> +/*
> + * Populate our custom address space for DMAs with only the regions we
> + * need : the AHB window for the flash devices and the SDRAM.
> + */
> +static void aspeed_smc_dma_setup(AspeedSMCState *s)
> +{
> +    char name[32];
> +    MemoryRegion *sysmem =3D get_system_memory();
> +    MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
> +    MemoryRegion *sdram_alias =3D g_new(MemoryRegion, 1);
> +
> +    snprintf(name, sizeof(name), "%s-dma", s->ctrl->name);

I would suggest using g_strdup_printf()/g_free(), since it's not
immediately obvious here that s->ctrl->name is guaranteed
to fit into the fixed-size array.

> +    memory_region_init(&s->dma_mr, OBJECT(s), name,
> +                       s->sdram_base + s->max_ram_size);
> +    address_space_init(&s->dma_as, &s->dma_mr, name);
> +
> +    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
> +    memory_region_init_alias(flash_alias, OBJECT(s), name, &s->mmio_flas=
h,
> +                             0, s->ctrl->flash_window_size);
> +    memory_region_add_subregion(&s->dma_mr, s->ctrl->flash_window_base,
> +                                flash_alias);
> +
> +    memory_region_init_alias(sdram_alias, OBJECT(s), "ram", sysmem,
> +                             s->sdram_base, s->max_ram_size);
> +    memory_region_add_subregion(&s->dma_mr, s->sdram_base, sdram_alias);

Rather than having the DMA device directly grab the system_memory
MR like this, it's better to have the device have a MemoryRegion
property, which the SoC sets with whatever the DMA device should
be able to see.

Otherwise, patch looks good, though I don't know enough about
the device/SoC to review those details.

thanks
-- PMM
