Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3387045wrt;
        Mon, 8 Oct 2018 05:25:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62x+aJH4lTGZd+ygghpxWqItPF+EWDP3AasFZ3sBVyJNZjETNQvQOwqpI0So0u82GaE8CeG
X-Received: by 2002:a37:8141:: with SMTP id c62-v6mr6475754qkd.265.1539001523173;
        Mon, 08 Oct 2018 05:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539001523; cv=none;
        d=google.com; s=arc-20160816;
        b=uFJXksk0Y+ScXRY2dlOqjW3K8Jwdk3f/Uf3E4y56QE9vnqGagLMO2sEd/bZJQEFtl3
         UIRivb4qZ7CaT1Q+dMTsrt+lG5uF15Sb9qdnbYnPmXBOF/wEGQ2v2zLDmZwVXevTFEM/
         W0f2EDrukICUGrH/crsla+AMoT2QaZe5dEmVex4ty8pP9TcNxsIuxQrDQjyWisT3Wqgl
         pBYOBpGZKK4TPqNoxIxSinTrzzbdOB/LeA9ghlcQdRIzAvOITmooNoEKeBfG7o2bmrU7
         GmwSxPjMNsm3q/84AffIBMGS3TlkFsQ0c5LFxDgwSzEV+KD2LlFEWsyjhX8uaJUSOXR2
         88kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=GTFsh4E+NzaJI85m/1kJJZbJcU5iyDsknve/iTdUSIg=;
        b=t7gpJuuCsjzIjyJ2+DYAqKzgaHjkjmSHTMMPyULKHmvMLNby2H+03oe1MvgGpkvYKd
         vtY7jR6rsslSklZ9ae7ayq+Kb07Lp86npvL7ktFhsaeyLYlqmkw8sJuHqZBs06IpmAyN
         3qEqE01Omh6LsFcV8wp2bsDo+8y081Bd10UdOvznzrwaSmmytYPwf5CZmKOpgviREku6
         UTz/xpDrvdyAfZMrBFfgRwr6j+CQF/Mr6DXWqLVuNORtsoJVp48y92pIj2Tnuda/TpV7
         z9kQ26gnsPxF80nBO5LZ0FXpEwfcVpbqkPVLAkmhsVt7IxNwKCT+uqvA+tQpRZnX1YWh
         7FXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j11kfXLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g31-v6si537657qva.184.2018.10.08.05.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 05:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j11kfXLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9UbC-0001nj-NA
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 08:25:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Ub6-0001nY-Nt
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9Ub5-0001PG-0x
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:25:16 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9Ub2-0001Oj-TT
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:25:13 -0400
Received: by mail-oi1-x241.google.com with SMTP id k64-v6so15566719oia.13
	for <qemu-arm@nongnu.org>; Mon, 08 Oct 2018 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GTFsh4E+NzaJI85m/1kJJZbJcU5iyDsknve/iTdUSIg=;
	b=j11kfXLQmjYCaYKoyXcPu6qYW1ns+WqqooJuvLDK2ebELqGAc5lj/VLtLje6oNfEa1
	yqAhEHtYOi/gFTQKwYkRSsyHOfzmkgK6qRAVTyMZQjAVrI6JW2SDF7Lh/N0wbpQXr8zX
	Kf2TnRnidIPeEJXfjOu0kHEgQIynMgbX9AiSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GTFsh4E+NzaJI85m/1kJJZbJcU5iyDsknve/iTdUSIg=;
	b=QrH0qU4X3FedkB5feHQGds4WE85L9uRhu14NPuTXrYycZhipr/3XBWd+A8YbppFilT
	yUZHlA1DY61NPko/o0YY4IusxRHmMqFDXnKMME917mzv/E25n0i7aXTBCWgCsFHlxdYk
	NbCeQ4YNWR6eHZU1ddypY4QMoWziOil4/MWwoUdwAGcbWgFj8JZbNERfhZ/DUIbBZMN1
	rk27McuOshQKIfapmSIZt9sk9B1w0MnvLYo3pefYKR2h00o3NNSBW0RgIPtcDE77tdib
	aJKY4oqZAekBZUJchZJVsacpv4ioiiLgGzQK3/K23C6mWqj/WqDQWV6icH2i7Ar/dqRz
	UZ6w==
X-Gm-Message-State: ABuFfoiYJujZSsCOKDoNbtrFAKMEPbuK/QMdYrVCAbcEV07D1zGOkjgf
	OQ3l1wnktEBQCj256O650R8jxr+CzUlNR1YV6bTxig==
X-Received: by 2002:aca:e7d0:: with SMTP id
	e199-v6mr4977163oih.187.1539001511824; 
	Mon, 08 Oct 2018 05:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 05:24:51 -0700 (PDT)
In-Reply-To: <1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 13:24:51 +0100
Message-ID: <CAFEAcA-tC0wHgkh+CA2s+G015kvdd47h-R+VCbjCRRZVTsUghA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v1 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: swNpS7uvuraV

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for selecting the Memory Region that the GEM
> will do DMA to.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---


> @@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error **errp)
>      CadenceGEMState *s = CADENCE_GEM(dev);
>      int i;
>
> +    if (s->dma_mr) {
> +        s->dma_as = g_malloc0(sizeof(AddressSpace));
> +        address_space_init(s->dma_as, s->dma_mr, NULL);

Why not just have the CadenceGEMState embed the AddressSpace

    AddressSpace dma_as;

rather than doing a separate memory allocation here?

> +    } else {
> +        s->dma_as = &address_space_memory;
> +    }

thanks
-- PMM
