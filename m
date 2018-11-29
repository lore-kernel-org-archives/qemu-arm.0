Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2804575wrt;
        Thu, 29 Nov 2018 12:53:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WKjUajYc0LAGi+DJF7z+1rnQDhugr6SC+SsbdUyvujD/yEk1t7E7L6IqQ8+wVSnyAgs0tP
X-Received: by 2002:a81:a705:: with SMTP id e5mr3095189ywh.111.1543524802564;
        Thu, 29 Nov 2018 12:53:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543524802; cv=none;
        d=google.com; s=arc-20160816;
        b=VLGJ9qq0w1Z1GlW4bVfRZiUG8v1gTEJOojXCcD8K7aEhTvbk6O4iiCSHdClBEzcm7y
         9SPOVuUi58Hoa6N9TnkXp06/GmQiBYhKVK/yU7C+xYCczB1ZfIhWI5fjUIR2+MWQ/Ep6
         4LeH3nLTyzDhG1RT4Q2pGkZQqWButzMmZp3OlQ6QYM4yWjf0Cr5Ull21U647KJyWtnOD
         F4rwoIvsZjGi0XuIgCwi9jYXn/YjJiIdItiQpslRosNZz+hh53N6oN/qNVAhC37+Lh83
         Vvwg/uRS0tNtDvruTnEyOItTxPaD8ikp5IDaF0KbXlxY6eK3McD8DY5UM7R+DJKaSaUZ
         4zcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oNMW1kjFYr/Dv3PEHZr45k3W1DRHqwsUIVV4jDXZME4=;
        b=HruU8xvCrq9z30tbvQu9GFALSECH93XKFfPeYU+ydIQq2E9naIpInXmDZ3Ifgl4lFS
         IAzrxqvtWevEHvrOtWHUWM3FVYjToxhPWfPp6PjFYOXiopH97vtogu8Y9fQdly5bijH6
         Yxjmji9zJ4cfFfEnH1h0+TP1e08vvTgqY/Tt2FJbLmSqUc+sgas/mFoFMkbbPlsRSNmY
         10EvWlT08jDZTHlSYII2qjlON6iFImJTJ12SKkf5khWsn7vqD8CxbXfrF5np0qKdhJEm
         3TlJXRa3S3CDrzj3CqMq7HMiNfC1n+mzX/awaWbT8682zQdeyCBSP03lgEe4WtGREotq
         9jHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a2Fa4uuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si2025507ywf.16.2018.11.29.12.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 12:53:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a2Fa4uuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSTJJ-0000u0-DF
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 15:53:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSTJ5-0000sS-AY
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 15:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSTJ4-0008BM-K2
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 15:53:07 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gSTJ2-00087w-St; Thu, 29 Nov 2018 15:53:05 -0500
Received: by mail-lj1-x244.google.com with SMTP id n18-v6so2995794lji.7;
	Thu, 29 Nov 2018 12:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oNMW1kjFYr/Dv3PEHZr45k3W1DRHqwsUIVV4jDXZME4=;
	b=a2Fa4uufi5PLcJXUZPjQMxk0sPO7TSpHMP0FmWsDUBmNF0MUEVAIpysnn/M4fmZlq6
	8sizXAUArIFkdD/Jxwgqvme4L8s5IR7Klr+q5FyxxH5BXLS7aTDnmRB6+sJ7NXZx1cPZ
	hcpzkmnedp1OZ/G7V/gqEyjHB84MJcvBJOVMzffjCXFo5kMM4JI30AyHC93MxvX8yPVR
	OO/2btEiBJSSv0MgWgiVGgonTt5yHSsrAj/7PWC6SvPg+nt7AtRwhPQhAMS2XMQtoFVm
	GYssXP39p4Cs0gIMHTic7D7ypTq15/KhNqMdh3NpzPLVh2wcUE27Bqcmxdy4SEtfpC3t
	vSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oNMW1kjFYr/Dv3PEHZr45k3W1DRHqwsUIVV4jDXZME4=;
	b=D5Z9d3X90fwy9J8Fds26kOGbdRvuj3y/DDc3BMwfQDNveX4n7ZR0AKFtPaHiJ5MiMb
	mGnONmcjRERQedQBCK48lIGjpXwpHw4JQObkGseUSJiNBzbAfTpivTuPziOhqHPfcwGj
	DxrkmF2AGiCFBzp64TCwdM+RBnGWjX9s4FYUUmB/t1Z0bYdZ0XImPI3hqs+WFhzdaz5m
	axljXTzbDjji2p6cobDBaeKUMJt64GXfXksbpyr5/65Q+HNtI+2wzhUKyPwGTsbkz6dR
	RF85m7LogxJy7JgAN7D7nCxdqiC/ZZHRCZPin9gj7v/xy+XqtBsjGuIKBItagBQUkqHT
	jx3A==
X-Gm-Message-State: AA+aEWZtDvYh4QpgqoneOJ5FjpzCCio3BtBDagxU9BOckQyZgyXbXsoO
	UZOivYSrC7BPBtRo7FzIEgUK3/Nl/C2rzb7Uf7I=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr2102437lja.58.1543524783663; 
	Thu, 29 Nov 2018 12:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
	<20181129163655.20370-3-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Nov 2018 12:52:36 -0800
Message-ID: <CAKmqyKPu-8T=vxdr6fN+2iZMBhBqAu60M7YuRkLnCySaPGqK4Q@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/4] hw/arm: versal: Reduce
 number of virtio-mmio instances
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>, muhammad_bilal@mentor.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyM43KA65EUF

On Thu, Nov 29, 2018 at 8:37 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Reduce number of virtio-mmio instances. This is in preparation
> for correcting the interrupt setup for Versal.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 41b8d801c8..2ed6ee9934 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -342,7 +342,7 @@ static void *versal_virt_get_dtb(const struct arm_boot_info *binfo,
>      return board->fdt;
>  }
>
> -#define NUM_VIRTIO_TRANSPORT 32
> +#define NUM_VIRTIO_TRANSPORT 8
>  static void create_virtio_regions(VersalVirt *s)
>  {
>      int virtio_mmio_size = 0x200;
> --
> 2.17.1
>
>
