Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2100051wrq;
        Sat, 9 Jun 2018 07:37:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJMIdIuNoqzMA3HXjMnJdiewPlOl9G9vSwn9iY4tpW/Kwf/TrJGAPSMlR1SNDpfzrJ9+5aj
X-Received: by 2002:a37:1624:: with SMTP id g36-v6mr8775805qkh.327.1528555048449;
        Sat, 09 Jun 2018 07:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528555048; cv=none;
        d=google.com; s=arc-20160816;
        b=nqn1fRhLkSlR2dZdGiP1AYin/SV039eLXMhORhkh/d7c8VaZKDRyvpksU6cOswOqrI
         mT+mR9AVgTgKiRzbO57Wa3BO6sDG4xWKxVPuQVlPv0AKt+1Sou8ldJ7OK1KN/jafYf6h
         AaWgGJbq+4rxedHUBrS+F9BFV56smDS1nwR0TvrtOvuYi8TnBNPWgjYdWa1iKeAEyWfO
         4/JdJOX+FojCQ0HMGmg5LNK+cl5B3K0mJAH78oK4IrmdKZ2pF+MxOl1QJ8oFPudQ9NnD
         LpaAnxzeXvAHQoH8osMTS+WneuShWFx7n1sFCJsy1SITOqp5OADzno3IkyH/VAl+hPlx
         i0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KQIITEr+wGCbZTICnbnmRVwFc0SiVDSBK/SvvYh4mGw=;
        b=E5JAQLk6SDrhpL2ISLKrSTndebbndVtYfkXSpQLUTh/olOCEFqFPWLKsaijaLLJkwL
         6LZRm1gwQ56A+KWBgJRh+M6RHIxR+Hzkcwdl4WoCFLaeZ55dc5s4EBZYGy5ayJn+PXGV
         gpfZETB6C1Hf9trhD2K0DhbMdH909tyir4KJwvHkGlwbiKt4EvMSOKqwQl5UnamKoJGU
         Iqz4MNxJ97nV7gC54bI2cc8e0wb3Nb6FVeAUrPpDwrhehjQfhamWaEgbALGdaXiToShb
         IQLskAymaFoUQZC5h5+QLqy2oFKynif928DrnBBk67geJ8ln+ckoNlLko8DZxOmkwh6H
         Dahg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XICy2AOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si2873418qta.244.2018.06.09.07.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jun 2018 07:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XICy2AOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRezg-0002y6-1E
	for alex.bennee@linaro.org; Sat, 09 Jun 2018 10:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRezV-0002xo-P2
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRezS-00024Q-LJ
	for qemu-arm@nongnu.org; Sat, 09 Jun 2018 10:37:17 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRezS-000248-Ef; Sat, 09 Jun 2018 10:37:14 -0400
Received: by mail-qt0-x241.google.com with SMTP id p23-v6so16346484qtn.6;
	Sat, 09 Jun 2018 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KQIITEr+wGCbZTICnbnmRVwFc0SiVDSBK/SvvYh4mGw=;
	b=XICy2AOzNjn+K1Oucr5Q+LqORRJ34mO/BuX6ZVmQvvQnh/hKIn84OdRQUPQZJBNBJc
	IdsiwPzkvWcJAPxoXGzQ8/p4yq7cYoX64gpoLB7d7sAgJpDePsSVP3fOJvLcFzmR7mKU
	qnTd4hYlkR2ZY2FHGlj6dPB55gjDxClV1gogwc45xzzyljDNpuEqiOHLeFrzIRmfEP28
	HfD34FHxVRwI5m1jJFrGioq9HQnIj/Wct93AFFw5r2hMJzE8P0DbqOiSmRznihyaIwjQ
	hks3u6Yc0H4v9iHnNlXwPmYg0GlwgaQfYrPMhHqdd1PNwHZPUpcC27/6tBCBZCCwuIoA
	vQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KQIITEr+wGCbZTICnbnmRVwFc0SiVDSBK/SvvYh4mGw=;
	b=esh6mAZP0ctS8lokvVvoT+VE2hXXW7VAwhWOaQ6TK/rs3tR2FzQ8E/anWGZuIC6w0S
	Wq5PmtF1fDIXOr1HNRKfoXxBTXorX9TSBx/XrwZ6FXi+SjFcYt/oGyGkHmGBXrM092+t
	bCfpvKuM38Jln+gLXLunsiAxw2lwD3WqGLNk3aEPakCXyrC/LOu4d0MwidQXudlGS5N3
	hx6n+MdHuyfl5401N7UgulvfgM+7U18tR02BNStx2yBQ4o+WZocSufWPoyxfd6iLk3WJ
	BA8LmJI94VFsq3iD8YGl6eG+GeoX6MvdmRhto5VhLk8KCZjqPqqilHlqlAWNLGyIM3nK
	MXuQ==
X-Gm-Message-State: APt69E2bE/YWqO+676HYehBFHVCep+5W7he+svE8hqyg3JDlRTDGgh+x
	00mCrxde1zbbm5YJOATLWbQ=
X-Received: by 2002:aed:3541:: with SMTP id b1-v6mr9788769qte.68.1528555033902;
	Sat, 09 Jun 2018 07:37:13 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	s81-v6sm26495422qke.47.2018.06.09.07.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 07:37:13 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-3-git-send-email-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0bdf92a5-7500-028c-5043-3d082b7051e8@amsat.org>
Date: Sat, 9 Jun 2018 11:37:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528554193-27270-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iqfXeIVYZgf+

Hi Eric,

On 06/09/2018 11:23 AM, Eric Auger wrote:
> When running dtc on the guest /proc/device-tree we get the
> following warning: Warning (unit_address_vs_reg): Node /memory
> has a reg or ranges property, but no unit name".
> 
> Let's fix that by adding the unit address to the node name. We also
> don't create the /memory node anymore in create_fdt(). We directly
> create it in load_dtb. /chosen still needs to be created in create_fdt
> as the uart needs it. In case the user provided his own dtb, either
> the bank is added to the existing /memory node or if this latter is
> not found we create a new separate memory node.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/boot.c | 20 ++++++++++++++------
>  hw/arm/virt.c |  6 ------
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1e2be20..2054670 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>              g_free(nodename);
>          }
>      } else {
> +        char *nodename = g_strdup("/memory");
>          Error *err = NULL;
>  
> -        rc = fdt_path_offset(fdt, "/memory");
> +        /* If there is an existing /memory node (user provided dtb), we add the
> +         * new bank into it, otherwise we create a /memory@addr node
> +         */
> +        rc = fdt_path_offset(fdt, nodename);
>          if (rc < 0) {
> -            qemu_fdt_add_subnode(fdt, "/memory");
> +            g_free(nodename);
> +            nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
> +
> +            qemu_fdt_add_subnode(fdt, nodename);
>          }
>  
> -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
> -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
> +        if (!qemu_fdt_getprop(fdt, nodename, "device_type", NULL, &err)) {
> +            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>          }
>  
> -        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> +        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>                                            acells, binfo->loader_start,
>                                            scells, binfo->ram_size);
>          if (rc < 0) {
> -            fprintf(stderr, "couldn't set /memory/reg\n");
> +            fprintf(stderr, "couldn't set %s reg\n", nodename);
>              goto fail;
>          }
> +        g_free(nodename);
>      }

This part looks good.

>  
>      rc = fdt_path_offset(fdt, "/chosen");
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b1e9a6b..46c5c3f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -203,13 +203,7 @@ static void create_fdt(VirtMachineState *vms)
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>  
> -    /*
> -     * /chosen and /memory nodes must exist for load_dtb
> -     * to fill in necessary properties later
> -     */
>      qemu_fdt_add_subnode(fdt, "/chosen");

Here I think you should keep the comment, but update it (info from your
commit message).

> -    qemu_fdt_add_subnode(fdt, "/memory");
> -    qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
>  
>      /* Clock node, for the benefit of the UART. The kernel device tree
>       * binding documentation claims the PL011 node clock properties are
> 
