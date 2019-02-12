Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp598640wrp;
        Tue, 12 Feb 2019 03:17:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ41+3pZ/mQqAPhxjEBRU1WCC+GjZU0xDaTxl3TktXpjBefDBkMJFNznykEHUXccxbNeuNX
X-Received: by 2002:a25:e095:: with SMTP id x143mr2399153ybg.353.1549970264068;
        Tue, 12 Feb 2019 03:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549970264; cv=none;
        d=google.com; s=arc-20160816;
        b=syf1Hvv1IzfPd/+OWBiZfavIBqebp1qXoVnc8X3D7huzq05v+Y4/ze0ox0mjwsUOHs
         qSyOifsmvbDQHtGgV0eDutwV4dIhHOZto5ovvfewvQOAUB8TaG0HdLjtJSqQ339YboOU
         a+PoZAH6CzSpZst9z+qoEQZzteNBocUcVQtqbScDCYXElah5Y3hwa6eQbUCUJvKBQ0WV
         dwC/GoSLRB+S8TUHCdVlQhKe2I+mJGjPz8q01jKz9HMmDnV7WIyGdOcIRDsvzbdDOkyH
         cvxIlRDY7Hpk3cCbpcXfYaJT/m5p74EkQToHxjbGLjzYrRmSw42+5kG6KQkoCplYVFK8
         wToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=0DjyC+cnxs/WfYaV2oEv1j9fVF/oyKWiu9LEOHMcxYw=;
        b=N2ne1AA/VMj+XJJ4elD7wt0mW+oAFw2jcRcAuSthdpRVgz2p9G/8gFiuOIn2ln77d+
         tkVzrzCIHvtXff97+lwxS9xQRjU9lRbNrMADiN++1oqcaOuXwuz1vbUjLpnE8IN6MfEB
         Lzf6IRNC3fjsJF5xVFhBosd2dEfuEAF12/ZZu51kcSxs82I+D1jy9Pw7TfVS3v8OqsNr
         gwZfiCkT/IqJ6K2PNS9oR6BVrdd3hniKjCC48wGbifay3sup4J/PNC37BiiRdpqUCIdZ
         uivNmvJC5yDHiluxHVipL5DdVsEPKJvXOy/vDt3EwbMn5LblY1gMIVg/AEDidjTr2j0f
         Lkdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u124si8193725ybf.150.2019.02.12.03.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 03:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtW4N-0000F3-Gp
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 06:17:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtVsP-0007Bf-8p
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtVsN-00057H-Hn
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:05:21 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36543)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtVsN-00055B-2A
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:05:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id j125so2562209wmj.1
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 03:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0DjyC+cnxs/WfYaV2oEv1j9fVF/oyKWiu9LEOHMcxYw=;
	b=H0fWLm5GGKRIDcjSY7vC9gdtIS3Uyl/B39lFZW7LzdU0lCWq3zI1ppFTkGTkx4kpdQ
	m14aVtx6UGpcLLbJ/uAgN58DJJRgsfV4vGado8TYOJarARvTgTv2q1vsI4senGRFkYRP
	cFGAekHi5OVRkquwA9K6+JDS+rvZknYVEYR8auJ+cnI5PbhcNX5OtlUTqEhw6+U/k36o
	sD0K2sPWlx8xfYnnOpPp7kpDDQGcWnvZTzVAlScm4W3JNplUKLjrA2A/Q/nZFG9/YO9F
	wJfck7cTylLXqhPyON5lYaQcotJDsBOHJ/A3tdrWGyppn0iz/JZC/liEXLIo2+wflORK
	xuLQ==
X-Gm-Message-State: AHQUAuZq2m9HgYG0qk2O2zTn42Zc1mrrYMAyFFowQXsIZ6AYrCW5fSmw
	/OlPPeItfSjgDUss7jGh6mslxQ==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr2454448wmb.24.1549969517522; 
	Tue, 12 Feb 2019 03:05:17 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	b14sm22917066wrx.36.2019.02.12.03.05.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 03:05:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190212105201.13795-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1df0da56-7abd-4688-0fed-6dc2bf10ebb6@redhat.com>
Date: Tue, 12 Feb 2019 12:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212105201.13795-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH] hw/arm/armsse: Fix miswiring of expansion
 IRQs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MBOktttTEBJn

On 2/12/19 11:52 AM, Peter Maydell wrote:
> In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
> the ARMSSE, we set up the wiring of the expansion IRQs via nested
> loops: the outer loop on 'i' loops for each CPU, and the inner loop
> on 'j' loops for each interrupt. Fix a typo which meant we were
> wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
> to external IRQ 1 on CPU 1.
> 
> Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configuration")
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> It turns out that the ARM-TFM image I was using to test that
> I hadn't broken the mps2-an505 doesn't actually rely on any
> interrupts from the external devices...

How did you notice that, simply reviewing? Via 'info qtree'?

> 
>  hw/arm/armsse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 5d53071a5a0..9a8c49547db 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -565,7 +565,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          /* Connect EXP_IRQ/EXP_CPUn_IRQ GPIOs to the NVIC's lines 32 and up */
>          s->exp_irqs[i] = g_new(qemu_irq, s->exp_numirq);
>          for (j = 0; j < s->exp_numirq; j++) {
> -            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, i + 32);
> +            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + 32);
>          }
>          if (i == 0) {
>              gpioname = g_strdup("EXP_IRQ");
> 
