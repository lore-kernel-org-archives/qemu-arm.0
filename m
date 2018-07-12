Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1648510wrq;
        Thu, 12 Jul 2018 10:57:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpctT48GyhtcrK3XSdLalBXfuol7VkxJowvMK1FBdJ08pIc/AjEDY4XuQD47zZmmQ6JZQIKW
X-Received: by 2002:ac8:2626:: with SMTP id u35-v6mr2909842qtu.116.1531418238759;
        Thu, 12 Jul 2018 10:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531418238; cv=none;
        d=google.com; s=arc-20160816;
        b=zXnp9ekyHsQKXYFioYR6BEQKOKjc8Ya7OyzDqkGzF7WLkVZR49l1Ewl3iomjEbtF5+
         /06XY94Mj+x69RnC9PkyM21vhi440k3YA9Te1yuvECwL9OWzxMKccBYSCj2qIKEryD+A
         5DfybuWM8cmH3qVjaenot4p+u/tiin3oHVph639dqyYq/84eloqpIeBmEQWPtKBHb2Uu
         0CvNWQw/EDb33u0t1b5wj1UmqdV3UW+SyfoLZBVMEEsw1cIP9xxkmPVOmY9lu8EXbpaC
         5ZNQavUqocUlfoKuusuugdpScm1AYg4jXhakKbzcHyTGSRf8A8lZHzVRrTB7s9qXRuAw
         p9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=YOo9/jbwnzOyDsKQAqahZDQcKL0w2lQvZImOXOFGkp0=;
        b=dBjCxtZbluM4XeOHRcDcDQcNcBwnLoSOwvkTJkx7hTzinLTZrpzDeIayolLjPsOSoe
         b+bpA/GsalGd3pH4T3vQxx4u1/X9xfavtSvBz2y830bW90y/tHb4cCuHJ/fgIyS6ZCTe
         9JDnQt9relvPD3TjR9EvTDaYYQ0xK3/XFxPFf2RYmt+i0BACLSpnKU+0tKQ1huZTKtwL
         siSH6A41BGpY1yqSuofADioEIoNTG3FWoGxPN8QUzZtqESAfPSeVQYkA/plDV5kYlVPh
         i2LGZrlOsLJjv24o6lCZTh2Hm4CEu3wfVmFzmLXqeSinluxaJxUnSkGevw+OFhAJsyJl
         UaZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXdu8AYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c56-v6si4120393qtc.342.2018.07.12.10.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 10:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXdu8AYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdfqA-0003oC-9a
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 13:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdfq1-0003mG-Ih
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fdfpx-0003sY-Cr
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:57:09 -0400
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:52538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fdfpx-0003sJ-5c
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:57:05 -0400
Received: by mail-it0-x243.google.com with SMTP id p4-v6so8042373itf.2
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YOo9/jbwnzOyDsKQAqahZDQcKL0w2lQvZImOXOFGkp0=;
	b=iXdu8AYmI//EcIPItKT1wga++ba6ZMvsfXJf7ldvE0XRigPP+YI2qPUcCep4IF+NnY
	LHT5o5QeQXx81xiOwBuP+BHpP8NYOoA7ZE363L3bTYmnfHsztqB/rBMfuJ4zYUyp5env
	AIyCEKJFPmRK706fd3styyRxPTvji6BsGkdK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YOo9/jbwnzOyDsKQAqahZDQcKL0w2lQvZImOXOFGkp0=;
	b=EyizJF1i5ImL6OQoNoNGBJ7qH1+Fq0pTMt6ylJj+8lJX/p1Fdh3iu3nNwGo/hGvjSP
	Sc/3utI0Mh2rTNYyIOqY02qaMN+gOYMgc7UUq7K4pjHTppa0cQYHhGI+L/da8p2siYeh
	TgvU7l7tCXnBRxfofvgQsENXbeonJWDRSwbEv50eLyOROAB3EdnoxOYu8x/M44CbvXcy
	CMHi49g6SZy/Vzyc8QvVaqodYy2AZ1oaU+A2Eme8+hpf2TwyIwNEe/SZQI0VPYkc31rV
	3A8rQFy03GLmVcAjWuWsekYv/4gy5KLTKAgk2tIs1lAWJN0e0/7rnN/w7K2mb8EhdCWO
	1QdA==
X-Gm-Message-State: AOUpUlG6UbmdvBi0CfD7/L8VB0EmYacKUQkL0KZMiMCuaED+NyEKqzPZ
	z06Xh1ViPs71GrUYP6mJjbYy5w==
X-Received: by 2002:a24:53c3:: with SMTP id
	n186-v6mr2143434itb.11.1531418224138; 
	Thu, 12 Jul 2018 10:57:04 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.233.255.141])
	by smtp.gmail.com with ESMTPSA id
	v132-v6sm3230698ita.9.2018.07.12.10.57.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jul 2018 10:57:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180712154152.32183-1-peter.maydell@linaro.org>
	<20180712154152.32183-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4374f002-e934-05f2-12ea-45e3880d2973@linaro.org>
Date: Thu, 12 Jul 2018 12:57:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180712154152.32183-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 1/2] hw/intc/arm_gic:
 Check interrupt number in gic_deactivate_irq()
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /grwuIUQN3vl

On 07/12/2018 10:41 AM, Peter Maydell wrote:
> In gic_deactivate_irq() the interrupt number comes from the guest
> (on a write to the GICC_DIR register), so we need to sanity check
> that it isn't out of range before we use it as an array index.
> Handle this in a similar manner to the check we do in
> gic_complete_irq() for the GICC_EOI register.
> 
> The array overrun is not disastrous because the calling code
> uses (value & 0x3ff) to extract the interrupt field, so the
> only out-of-range values possible are 1020..1023, which allow
> overrunning only from irq_state[] into the following
> irq_target[] array which the guest can already manipulate.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
