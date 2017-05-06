Received: by 10.25.0.198 with SMTP id 189csp675502lfa;
        Sat, 6 May 2017 09:07:02 -0700 (PDT)
X-Received: by 10.237.55.98 with SMTP id i89mr2277049qtb.162.1494086822811;
        Sat, 06 May 2017 09:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494086822; cv=none;
        d=google.com; s=arc-20160816;
        b=wgXWNEvoaSbzcHNJDzGeNFwgx/VLIUHqIJLOv6qRmGwXQCVsfXAwRmBUmKLpn/ZfCl
         r7X74Ml2auFLzjP6glOiJ+Au2GDBGT1ZB25YWvtbKBt8gcBSnPUhGZkZ1OXekLe3GMvm
         M7kyNX935DzAIyMqGr+ikQ+Qa3OXQ5MXGdsHysG9PVHsTdyxTqjVwxuop9ctyceUd3yo
         w8SDJdVNVIiumZXJE7vefGXHVusjoYXvRCeL3AVrqhlAKLl7eriRlX8hqt7eK/Omt00C
         hiAxew/UM9M9MmS6uNy46EsDsypIrDSZmA8ceTRalD+mvTyhZ6QIyk6ACjpwkfTKSv/T
         zO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LFLsz3SxI4o0lVXHdJ3FnlZzZbcoqlBh82itbXriV1U=;
        b=zYEnxiDctmU/7e/pNSKBSd+TYTfWP4GWg4NtUrYrxStwVwyrr6/ScvndEO/GLJzl/R
         a9+EOdRY/9DQPQUO9asIGN+ijU6OK2SS8ZpJuc/WTLRisJ4SOnY7s+Q7AibZO72CapAK
         v09rF5xEHw7mH9PusC5JC4nvBeT1X0smYGGT8ip484tSgmg/+iKi6kjDzipV/x1l2Smi
         kwgArAy44leXLZOrPGJV9MNFuwL5FqMqlpZ4yN4h2+3ryGla8pocjN9fxfLRh0s2m4CU
         INp9NoLh3ERT3p2QojnwWqvPuuIGufCGmFZFVnBuIn4ZFkiRXNLiNve4E7si/9d1E7FP
         qLgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h18si7653322qtb.259.2017.05.06.09.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 09:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d72EW-0005XK-2f
	for alex.bennee@linaro.org; Sat, 06 May 2017 12:07:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72EJ-0005Uj-EY
	for qemu-arm@nongnu.org; Sat, 06 May 2017 12:06:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72EI-0002Vh-LB
	for qemu-arm@nongnu.org; Sat, 06 May 2017 12:06:47 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d72ED-0002Tv-If; Sat, 06 May 2017 12:06:41 -0400
Received: by mail-qt0-x243.google.com with SMTP id a46so4556072qte.0;
	Sat, 06 May 2017 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=LFLsz3SxI4o0lVXHdJ3FnlZzZbcoqlBh82itbXriV1U=;
	b=XTzlOFlNb/KdBui4QFASM06/1rxPWIA5EJV6UQClNuJOI5TkGYHVZOSgBPLRWwpT4w
	DVCIS2Nuc64dkc26SQxEZU9ZWdpSNQGVDJt1odFtoGi69xTbKvYjGvlS9+KngmnqXyM5
	eL6lAvyeJkD2+css6fQhTR5+v9ah5MhzoDzqjd/3a7wNSL2/CAOz4VPT6tV8bcN3zjsN
	P2QV6eb9RkT09PhkdlTFOTJdDBY+bYVGa/audvGcNL2697MYIowBvsCYe5f8YAVK19tp
	9g1YejuGw9K4LSKu/c2KgZy7Y2fsJo4edRhZRg4oIXlerPSUU2wfwJ6wJYm+1hQyeJ1x
	5jQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=LFLsz3SxI4o0lVXHdJ3FnlZzZbcoqlBh82itbXriV1U=;
	b=iiWlDK/S0umEoARP/Eiv4MRCJfYPUGvVr5dXbTrlBZvIm3l5Mk9W/jySzlIao82+Ao
	x1HtEwfSR5YhbBptHz4biXB0/heAPA/M/mmh1sEU+aiimmWSHIsj4XntmzxmSk0d3qFb
	ncvFiYlpNtfq4tLEIyyT3iZQGCBQjcdaQodUEzWdX0tu72eFdmdTXtMJYMvBifCaZRKX
	Fbi3WtjipNqj9tXxgtR7LlIahzoH6LhPfH+nBnT+wCOB+PbC3bDQB21T0r3weno6fV/f
	L/USlHP4UfpuUa6ci+vNJvvk95Cgvb0VeK0cwHZEKJSR0HSYopNcNA8zIRNJZiRoie8/
	Qx3g==
X-Gm-Message-State: AODbwcCGTIv6xB8Xfv2ODzJG/oMRyN1+zYt8r+BqXPfiU27+xjS5nSkz
	cAIQqCBAZzoonw==
X-Received: by 10.237.63.39 with SMTP id p36mr69939qtf.81.1494086799848;
	Sat, 06 May 2017 09:06:39 -0700 (PDT)
Received: from [192.168.1.189] ([181.25.147.174])
	by smtp.gmail.com with ESMTPSA id
	u43sm5983227qtc.28.2017.05.06.09.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 09:06:39 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170506152414.8704-1-krzk@kernel.org>
	<20170506152414.8704-3-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ab971cd6-51c6-7cb3-4f5e-0520538caffd@amsat.org>
Date: Sat, 6 May 2017 13:06:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170506152414.8704-3-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/exynos: Declare
 local variables in some order
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
X-TUID: OiHPCpWT/c1H

Aesthetic.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

On 05/06/2017 12:24 PM, Krzysztof Kozlowski wrote:
> Bring some more readability by declaring local function variables, first
> initialized ones and then the rest (with reversed-christmas-tree order).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/arm/exynos4210.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 0da877f8db0a..27a7bf28a5a9 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -162,12 +162,12 @@ static uint64_t exynos4210_calc_affinity(int cpu)
>
>  Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
>  {
> -    int i, n;
>      Exynos4210State *s = g_new(Exynos4210State, 1);
>      qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
> -    DeviceState *dev;
>      SysBusDevice *busdev;
>      ObjectClass *cpu_oc;
> +    DeviceState *dev;
> +    int i, n;
>
>      cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, "cortex-a9");
>      assert(cpu_oc);
>
