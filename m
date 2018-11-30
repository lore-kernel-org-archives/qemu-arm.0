Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3726072wrt;
        Fri, 30 Nov 2018 07:49:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wth8m6YbaB/mWG1Rj5xkkiJN+sbOTwJ5zoJA2cDpHyAQglq85AoeRsA2XiRxSYPL5J2D67
X-Received: by 2002:a81:914a:: with SMTP id i71mr6162258ywg.390.1543592944434;
        Fri, 30 Nov 2018 07:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543592944; cv=none;
        d=google.com; s=arc-20160816;
        b=azFObk4fWddUI0ZkpNrm4Slg/OcgP4arQjLhxdmy6pGZnC4VZhElf920YA9kjUBQSp
         BGw0QKubnsZts/XyglpyHlTe/6HGcHC7RUltNjHqWcSgOv8PZWeweA+nQCEa/Cx9pPgP
         C5xfms/W/wi9ACv0qoetYszlBhApigd8nvz/N7SHYuCzHIvYIBvgccv6M8bDh//SAxGZ
         krCAWHcercpD8X1doTZiH4sLCmLVQZpCnoP/Wx9zut9KeEl/OecjO+v5biUaYRaXpoal
         H2CVnz6upGD/tuiVBSY0ntrR5pT6wLVEOZEhj+E88YPWWDO7iV8S2BDm9+Iu011aNnPo
         0vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8s4F6uFXFeDcXzH/nNuFw+MKMzvHS9+RD6ZAqaQnoU=;
        b=nvv777WdIfgK12Jyq4I4/BBGXLPHo5z0pQDfWIl5lhgx+GD+oPKG7RXIxXoHhoErcM
         0TPmwzdZbSOpKL5y5TeomtwPSVg/7Qa4ICfVcldS+qhdCEPMWC/6RaEFpZo5uVy563ac
         tZeq/MhFFKyQvTBDDEIu16/k7qvnor8bxlTbHxJiaUkmyqfEsCsQJM1KK3Hi5l3WCxD4
         +LGIO9ICYFZqji7x8NAw1/po8tdK4+W4sDOhswH1ppPEL7IZUKxPZ9mRNW1OxCp/x2m6
         k17sLc1bN8TQmTmi9zrlr2Cwl7w+vEpwzbWTA2INJwof3ZzcItyxMvg2VxMpdzBxJ/Xb
         TtZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiIshdpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si3079338ybh.426.2018.11.30.07.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiIshdpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSl2N-0003gS-Qs
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:49:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl2A-0003es-Tm
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:48:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl2A-0003wZ-1M
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:48:50 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37245)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSl29-0003vt-Qi
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:48:49 -0500
Received: by mail-ot1-x341.google.com with SMTP id 40so5494257oth.4
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U8s4F6uFXFeDcXzH/nNuFw+MKMzvHS9+RD6ZAqaQnoU=;
	b=ZiIshdplrHULXwJP0fzqNmX3I64MMCPPDzmc7NRKoFEddbdZUHMMjfNKxP3vnijIL6
	TeUsC7Fu3rpOlcHb0siVNK1zUNH/7M8k5qKHO9UppcmrCWTlPbrxKjpRcIpJVjZy1y6y
	9uYPu6SvQm5e/CHK8FxDIlEL9Qe3UpF8SY73Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U8s4F6uFXFeDcXzH/nNuFw+MKMzvHS9+RD6ZAqaQnoU=;
	b=BMhVlsBBIg3rIWljQaTv3g1/vY9rPW+wd226gQ2MRjLMUi0+wMDUiUIcXwm83IXVby
	ixP173diHscMqUJSzW2nZDWezOXIlfEaaDmTh/ixvvgbhxZ0ywu6JYpMjm+7lgE+COJg
	K8pXfvoJ29zVU4aF8mvjbdt2I1/xMrt2HOFKm1ifSholDTL63XVXHTzzuBJIov4biCyE
	ExkLiQKqJwVniaSR7htzTaIobOfwSkK5ULDuuRzlmym8hy21OCQGIBCZT2cuv5uaQnr2
	CWHTijtqNJzCQFbXdxxULkGzvmIE27eduBtihpxuQBjNpydwHFGMDgLlURnQ0LKFcWoe
	DE+w==
X-Gm-Message-State: AA+aEWaxtGoDvqgKzgIE64kp4BiF5mHowgqBp+oa11EEsskc5E/uh1t0
	lb16bmYgR62qOhMH9E5FvmI5+UHAvxIzocOLOpHnzA==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr4018310oth.317.1543592929122; 
	Fri, 30 Nov 2018 07:48:49 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-5-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-5-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:48:37 +0000
Message-ID: <CAFEAcA-D==grLysFf9Mm2iwQ1uUm7hf+OUtx5QKje9tGyu9SFw@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH V10 4/9] hw/arm/virt: Use the pvpanic device
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7MRDYWVn3CxS

On Wed, 28 Nov 2018 at 03:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Add pvpanic device in arm virt machine.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/arm/virt.c                   | 21 +++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491..50345df 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=y
>  CONFIG_STRONGARM=y
>  CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
> +CONFIG_PVPANIC=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a2b8d8f..f2cb5de 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -143,6 +143,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PVPANIC] =            { 0x09070000, 0x00000002 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -190,6 +191,24 @@ static bool cpu_type_valid(const char *cpu)
>      return false;
>  }
>
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +     char *nodename;
> +     hwaddr base = vms->memmap[VIRT_PVPANIC].base;
> +     hwaddr size = vms->memmap[VIRT_PVPANIC].size;
> +
> +     sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
> +
> +     nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +     qemu_fdt_add_subnode(vms->fdt, nodename);
> +     qemu_fdt_setprop_string(vms->fdt, nodename,
> +                             "compatible", "qemu,pvpanic-mmio");
> +     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                  2, base, 2, size);
> +
> +     g_free(nodename);
> +}

Just a note that the binding documentation for this still doesn't
seem to be in the mainline kernel git repo yet; I won't take
the patchset until it is.

thanks
-- PMM
