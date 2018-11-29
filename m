Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2804319wrt;
        Thu, 29 Nov 2018 12:52:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UCJ8PiUaAyN/bXpPAnzIRHWvU6p3xPAMCiiwc7Uyy7VUlCUvEh4vE9pJ4BcFovOd1tfWLB
X-Received: by 2002:a25:160b:: with SMTP id 11-v6mr2905248ybw.129.1543524777257;
        Thu, 29 Nov 2018 12:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543524777; cv=none;
        d=google.com; s=arc-20160816;
        b=G92HPEGyiUN/A+Km860rmR/D/xPUSGfXFx5B+ADSH2YZ0hSX4YGG8hG8Gz65ZrUFGI
         YSIPQy4iZTOl6sDbE2wIVYxj3CuPIkA7hb7/bmVWzLq/d6ACLTZ2nF6xnHSGCBV0A9O1
         +7CVnU+kRbOn/q3psvkwfMBzjWDGGoKfepMzGGZyU7GSZlYjTaJ7mT2zAs5ZBUdu5wMS
         mlSUrsUTxz5p+nI105ajlZ8guDhnwW2rtcFCCTNjgORwYDOMgsVfrxbfe2mcY8XiItik
         HF6YKSg2FMt8YCvdN1IMQtEN0MbzjsGPhykwZrvLeJC1tk3LuRonWh9qjLH/sFAKu/qE
         e5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sELhbtkYMhXi+W1Z9hQd4Lo4U1jYYPZCBwql39tHzKg=;
        b=gJ8NWE/lFijb4Vc3+NoW40x7mEDCVKupJJsbe6gyA51Jjm9ZpOaKgBIFEFBf3XL2+3
         wZZQo9rfiqiLQiWhKfFCBCxXvAvQTkFNoWloiuq1h0ZhSAQSg297eEWSGcwgn8PyL0JX
         G/O+YDnUORdWAvNbE1/JwQNLAWoDK7kSa7pe1jjiEYKBIavMDRfRjh4ApY6osO+sJkiR
         zPVtvGExLxGSI26oGbow0XaXdJFlLWkI+4a+Io+ZrIwHfKOABJhUE9usYYdUniQwQ7qp
         4BJ9hv4EE6XVOF9uWR130nW+vHMf94vdUlS26aZmlEfEkKN/R6iZRp/pCiumX5SUJVAN
         dWXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pIxlqsrN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g76-v6si1825088ybf.292.2018.11.29.12.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 12:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pIxlqsrN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSTIu-0007g0-NX
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 15:52:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSTIU-0007fm-RR
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 15:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSTIU-0007mp-7K
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 15:52:30 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gSTIU-0007kI-04; Thu, 29 Nov 2018 15:52:30 -0500
Received: by mail-lj1-x243.google.com with SMTP id t9-v6so2995934ljh.6;
	Thu, 29 Nov 2018 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sELhbtkYMhXi+W1Z9hQd4Lo4U1jYYPZCBwql39tHzKg=;
	b=pIxlqsrNGhF2P2sASZB6kA0MHqn3kQU7rt0rvPaahbywg+MTcxnaoe1rrw8+roC03x
	3g6FdM2IqiT5tp9lDN1pXDTXsRPAB0wJ4v1AtEvjB8UXq2HNYIv0ExVOI6JMNsb4LPM6
	Rhrve9D5ssMCJFHaC2MVJ56T6Ek+CJpaJe1FC4zIjALv/yDvL57muhk2tKkP+7fGhrdq
	fvcspdTwsbROnhhSa+p19RmIyBDaTZO6QOmDCmq3G29E+9lhDQxXCPZdHiBc7GiT6JcF
	P+zlDYa7EFXhXW3CObdTYlUactPGScNBLnTkV9zTE10A7BfqDa0qZyYoszUviYLFPLEb
	kzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sELhbtkYMhXi+W1Z9hQd4Lo4U1jYYPZCBwql39tHzKg=;
	b=HBij3GSt1SeKRfs+CoDvBGNXKIwfQtWkSLLC1BqSYbVgXpcFOt55I7NJdDdd5QOh0r
	JUB40TeQ7N4OvvPDFI/tY6drc3Ay0aTgE+fjMDGAhocB9v7HfeA0Z8CamF6iqEQ1W/G1
	LOddWvh3wFW6wTsW+de0cLIeLlgm4+uF6EtOehASD2UtHHierBkUUaI7jbvJ9Lq4X+DT
	G94vUab4h6kdEB3WicBJIQRY9OmAPfUaHb4APd9djFrxtqprRTd6l91PBd33cL33SsZh
	hJ02KMOgmvQCNojTIbn6E1mdn4UKWDv+1zgtAqf7qIsKWQ3ACsc3rTIoaaz5LAlUsTMA
	lCgw==
X-Gm-Message-State: AA+aEWbYidEfGrgkPDbViOWcqDMilQdXVfhAHLs5zpUzNVFLoPMrcRBP
	dNO7B5yDVaVSt0jyEt+5fbDdZmvG3hAWijrdu/c=
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr2045788ljf.47.1543524748675; 
	Thu, 29 Nov 2018 12:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
	<20181129163655.20370-2-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Nov 2018 12:52:01 -0800
Message-ID: <CAKmqyKPPz0oz_ZcegsySRVc+=bw3Hkm1VUVVucfCmwGG0_ipeQ@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v1 1/4] hw/arm: versal: Remove bogus
 virtio-mmio creation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KyB8wCxKeDVY

On Thu, Nov 29, 2018 at 8:37 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Remove bogus virtio-mmio creation. This was an accidental
> left-over an experiment.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 1e31a3f442..41b8d801c8 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -364,7 +364,6 @@ static void create_virtio_regions(VersalVirt *s)
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
> -        sysbus_create_simple("virtio-mmio", base, pic_irq);
>      }
>
>      for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
> --
> 2.17.1
>
>
