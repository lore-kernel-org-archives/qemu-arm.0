Received: by 10.25.21.156 with SMTP id 28csp1229359lfv;
        Mon, 25 Jul 2016 08:20:33 -0700 (PDT)
X-Received: by 10.200.51.251 with SMTP id d56mr31104715qtb.36.1469460033369;
        Mon, 25 Jul 2016 08:20:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si18228166qtr.34.2016.07.25.08.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRhgG-0001EP-Nn
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:20:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhgD-0001CQ-3x
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:20:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhgB-0004K2-2y
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:20:28 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhgA-0004Ja-HU
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:20:27 -0400
Received: by mail-vk0-x233.google.com with SMTP id x130so248445827vkc.0
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zQ74tqMbcK7Xkgzc3kK0VI8YC0appqPmNnJQpwVqvCA=;
	b=Ba68v7WlPb76tMtlZ6tjsa4YVVL8QV1rjSVtvJSN58JoAousLdbEo38xyVhQxeeWMg
	viaTdsh9jmvFd4bvYHiFwwSsc0zcBtIE9Lt6AaUsGs7h4gIfwBCmtVvdgWhiFEO5MqW6
	HVMtIut/K6lZBTXjEzjgPxWQATtpFMOVsT124=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zQ74tqMbcK7Xkgzc3kK0VI8YC0appqPmNnJQpwVqvCA=;
	b=eFMoChEZh4F4e7EdcLxez9WfPSkZbpWz/RxqjNjS+fYhvhIJopZ3VjpZyniYEXH2jX
	C7GLYcviXO5oyWcoEYVnskx0g53L+TVFbF/Fbqqysw6tHE2ccdVMI+Qz6cdtTdRvRYzm
	26VLX1X4MPibKdqawYPFnk2jUPwh4z+Ox6nmjCivLeGYMAscPHT4LxO3QSxzLQ5zRTjp
	DxrxwETZRtK+jyl4nVOpASaEv5QanPRI2GUhdPsmjI+zXiNNS3Dcz9YxM+QyoyTsPMME
	BPbaEyS47VYxUv2F8Rwp5DbFoUzvJoNwSc7FSqENWmA//KL0EqhMHQ8Ibux3q/6Zi1H+
	Bqmg==
X-Gm-Message-State: AEkoouu7rgfobtuqngRdxGi5y6AlUEnzkleQGBw9RNAsQnke1HfQGXhdwbAVhu7ja+Yv4GBn2LofpViPPNRwUSel
X-Received: by 10.31.7.8 with SMTP id 8mr8552497vkh.157.1469460025968; Mon, 25
	Jul 2016 08:20:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 08:20:06 -0700 (PDT)
In-Reply-To: <c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 16:20:06 +0100
Message-ID: <CAFEAcA922w7iDEorKb7aRH_V5LH8VnMGCrtiKoGa1RtKLLw5eQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [PATCH v1 1/5] cadence_gem: QOMify Cadence GEM
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1bNCIFP3/lh1

On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  hw/net/cadence_gem.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 8a4be1e..9d64644 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1214,24 +1214,29 @@ static NetClientInfo net_gem_info = {
>      .link_status_changed = gem_set_link,
>  };
>
> -static int gem_init(SysBusDevice *sbd)
> +static void gem_realize(DeviceState *dev, Error **errp)
>  {
> -    DeviceState *dev = DEVICE(sbd);
>      CadenceGEMState *s = CADENCE_GEM(dev);
>
> -    DB_PRINT("\n");
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>
> -    gem_init_register_masks(s);
> -    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
> -                          "enet", sizeof(s->regs));
> -    sysbus_init_mmio(sbd, &s->iomem);
> -    sysbus_init_irq(sbd, &s->irq);
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>
>      s->nic = qemu_new_nic(&net_gem_info, &s->conf,
>              object_get_typename(OBJECT(dev)), dev->id, s);
> +}
> +
> +static void gem_init(Object *obj)
> +{
> +    CadenceGEMState *s = CADENCE_GEM(obj);
> +    DeviceState *dev = DEVICE(obj);
> +
> +    DB_PRINT("\n");
>
> -    return 0;
> +    gem_init_register_masks(s);
> +    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
> +                          "enet", sizeof(s->regs));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>  }

I don't understand the logic behind which things are
in init and which in realize here -- why is
sysbus_init_mmio() in init but sysbus_init_irq() in
realize ?

thanks
-- PMM
