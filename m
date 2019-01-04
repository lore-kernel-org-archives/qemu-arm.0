Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp539950wrt;
        Fri, 4 Jan 2019 04:10:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WiAsUpYC2h8NNw9PtoT+U3VLcFITTlp0FXpZfV2hqvgvBVEu6nP7k7p+w4GHz9B+NuBnSs
X-Received: by 2002:ac8:6049:: with SMTP id k9mr49317655qtm.243.1546603849621;
        Fri, 04 Jan 2019 04:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546603849; cv=none;
        d=google.com; s=arc-20160816;
        b=rsMw/q14BzVKiuXqMbGJCPfNaeOalQ3uMUnMRQglYILOqjX8iVHbEFQefheu7PYn73
         wLolqeI5nGTC7WOJSPF+psMjsCy1pc04kkkKQHr2EcAn3rpwyEWpwblljvA2xky7lfx1
         MyoIte34wwpJPotfpcz/zl8vcGOM/N1hFHIxmqq0bGONGpxgBb73kg7QgjWRZaKjDzvp
         PAGWJvDeBH/2ow8iIFZVrKjzQtMNbYnqZwV6z4Zz0gaepTPtHARWmxl3LG6x6G4JJC1R
         WWbDcrOuzEF1lXjZ5yqGcfUZWRBVXQ0UW6+pyaytJlKzNWS2yTNdrWlgn4+boSoKRcyV
         gUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=9umCYlrhxOTrmcaFnkeS/c0sYhS71mdiFLAANI9q9I4=;
        b=XiJl644HrNImwt29escZzoGf+cbLKAJjaS4yjZX4C9r4hDFOQ19aoyq3LIvIsfbd0j
         RLLr8GKE08pIr6B5PS7HuGcH4X7NkE6+43u08JQZdHmt9wIs7ThQH/Ca3jL+Pt+PeQWA
         O4xEtK8cxFvrcnW1/WuUmyTT9pj4VSZx+1TRdBw7yVtH7VEdFemX5Bg1bDA0vlc7w4s6
         jduVJ6D9fWqQPgdccklgftAJPeYc0YRhHrQ2j8npUTX0PaBMFpk/3F/cdMPNT2uVjKJt
         ZPD+gZ82h1gU13i/Dwr8CUfE3RkzRDlUaGtnVDqD8/+B2mpmtYjZKU+BJ0nRZddmhjAp
         hLJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si3493085qkp.186.2019.01.04.04.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 04:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfOJN-0003YT-42
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 07:10:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfOJ9-0003Xd-Rl
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 07:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfOJ6-0005hN-CX
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 07:10:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gfOJ6-0005dK-23
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 07:10:32 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so958331wmj.1
	for <qemu-arm@nongnu.org>; Fri, 04 Jan 2019 04:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9umCYlrhxOTrmcaFnkeS/c0sYhS71mdiFLAANI9q9I4=;
	b=Nb1+Db+hgexfhNWbRJ9xuTZbZFIojMuWg4mLviEnvn3HPGGLgIP6Yl+gyy9ZKpSCgD
	2yUii7k9SSsKWPVPlFmENrgsS3SniKbkuHlVtIMJHtsBYreg1hu5GPlARWhzwVYfR8lU
	tB6HXdFx5zL2LufJgcxmn1iMYL3npjWVk8o910Ftj5M3Myis1hu/EaJSymtNnrvjRF1U
	KF3g2ITAvSBLT49iipjnjoc2x2/wrqRplg7HPTl7FSE2E7K79pTFGoSkc8aC+M3VuJQs
	YlaBwod8kHfSc2HVbUNz0+Hzbie6diOOI1oDoLfu9NZOp/2NXoYZfg7e/BknV/93N6Cl
	kK1w==
X-Gm-Message-State: AJcUukerZbqDruZ3TodQB9vZvM48jWa8XAy6NgO0KvbdIgatzuUYERIo
	8oM3V9mJLRvoCr5ZXh/5zVBChQ==
X-Received: by 2002:a1c:af89:: with SMTP id y131mr1133239wme.105.1546603826352;
	Fri, 04 Jan 2019 04:10:26 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	k7sm43454940wrl.51.2019.01.04.04.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 04:10:25 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190104104749.5314-1-edgar.iglesias@gmail.com>
	<20190104104749.5314-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ae299994-887b-395c-880c-8c69a02e2ef3@redhat.com>
Date: Fri, 4 Jan 2019 13:10:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190104104749.5314-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v1 1/1] hw/arm: versal: Plug memory leaks
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Wls/Dev6LKR

On 1/4/19 11:47 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Plug a couple of "board creation time" memory leaks.
> 

Fixes 6f16da53ffe

> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/xlnx-versal-virt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index c6feeac532..f95fde2309 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -130,6 +130,7 @@ static void fdt_add_gic_nodes(VersalVirt *s)
>                                   2, MM_GIC_APU_REDIST_0_SIZE);
>      qemu_fdt_setprop_cell(s->fdt, nodename, "#interrupt-cells", 3);
>      qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "arm,gic-v3");
> +    g_free(nodename);
>  }
>  
>  static void fdt_add_timer_nodes(VersalVirt *s)
> @@ -364,6 +365,7 @@ static void create_virtio_regions(VersalVirt *s)
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
>          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->soc.mr_ps, base, mr);
> +        g_free(name);
>      }
>  
>      for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
> 
