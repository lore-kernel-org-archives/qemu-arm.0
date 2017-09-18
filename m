Received: by 10.223.172.38 with SMTP id v35csp3253426wrc;
        Sun, 17 Sep 2017 18:11:52 -0700 (PDT)
X-Received: by 10.200.63.154 with SMTP id d26mr48201625qtk.212.1505697112005;
        Sun, 17 Sep 2017 18:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505697112; cv=none;
        d=google.com; s=arc-20160816;
        b=ouNYR+VfD9npoQ3Z3jTi9GXGD273LAtnM9Zxjo9vttU96dMgDPaS4DXfYvER98MocP
         Kscm1dYu93XZX1BpoL+ncXfo3dFKRvs3MeKIpNbQt8X5zZTjcBkgB9Mu82cHA2YEtNjD
         sopoZwsFSK9dvrURT5TERehrDG7/XOZI5lQG5Q1VXg3/7hVchjTDNzn+gtd877IdZX81
         AIqOIDKBuC9q0KOSgsZa0/OlwqULAgiw66/AU9bVBgFXlINBrnVMasWQmP81fGKTn0sd
         aCW3hAZ0k85AF7ewDFHILgmEHGyRA8AleZdFPBIqdW5IOxPg088riHkPulNY4McLcmEQ
         N/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=eGLlQwMNMWreHZ5MCF4Pg3s7R8pAP35yMpqOjoq1nM8=;
        b=aogR4g4XhIVne5SIF6Xtv0cA/7aH3fhAv9Uhaj2K3FuHZsTdBft5STSgILToacYghz
         s6S1AuN/8Eeg0yTP1Uoeeq1j4tWeNsjN4TTE8Tv+TjPy1iBE20hYDRvWWsaorbxnry5C
         ww2Uot0gfaJ7wxdJAzo8RlIumSv9MfoqiGSmWm3Q/vMfBeYhCBYTrLqa2Z/7dEDRLtLT
         h2dkHoSgy/aIij6pgZN177IvJ7vlqyFAXGmm10NIiJnbydYVKJrVeZ86itgHIMyHmuy9
         STQtkUUY6TIwRyQDKYz2fALutZv/JUhRRt8i3FQiH7HA6GcjR1blTf4dfz151HMt3qZY
         +0wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qy2P7d8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si560376qkf.99.2017.09.17.18.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 18:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qy2P7d8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtkbF-0005Pn-JW
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 21:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkaS-0004yc-GL
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkaN-00031s-HM
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:11:00 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:51031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkaN-00031c-Cg; Sun, 17 Sep 2017 21:10:55 -0400
Received: by mail-qk0-x233.google.com with SMTP id s132so6003010qke.7;
	Sun, 17 Sep 2017 18:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eGLlQwMNMWreHZ5MCF4Pg3s7R8pAP35yMpqOjoq1nM8=;
	b=Qy2P7d8F4dHS3gUDM7TzrVeIvW1rnCCPZfYzx99JTfGmyjJDdEKtOvF18Pc3zoXa8l
	7Tg2DfDbkRr+XkGLGJ1AOxSHgDnHOYr/PaFRa4xgiKGudE4gA5gl9bCXNkp8e0dOHIF1
	E+ngIrzbnRAb0IDk158WzgJ0zLPkwXP6pcUlGpEkNVRdEn1ekW83pZm8OIaQ4T38uJlI
	AI7DKRONPWWpgdtulZw9NBdsgebSDp6bVpzO264f8o2XvyZdWH/Aoj7KWotEtfcaUfQc
	tTHITdJm/Hi0o/VoM8bMTDW55EiSoAYsJO/+pytcfmpn648MqxbKJUJJHHhSFyTN2YSf
	11yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eGLlQwMNMWreHZ5MCF4Pg3s7R8pAP35yMpqOjoq1nM8=;
	b=gBxhw7Syedx1ywSoc/CEqIHLMfAOixawaMPh82i2knAtU4S55zdJ6QL2+64bFPC4+/
	w2whcjhk+HMTQ5ebl2x385rCU+UkCMNT7Xwc3SwenQRAjfLA4u+hYqB0VnT1EsEE9uhb
	S3ytLlL1wUQPp3zKJRdJ3bZWYsN548OQXLSZBIiJPnYlm2ziRwTGkddTg7GviGLmqV7X
	vBH9CbLwDxmUvvZMQ6oiv5/Qr3Tf1XnJoPTHTWtnj22uIQTWXKKQEjR+HrHMPqf4FBTq
	Op0PRBROiWIxR/Vd9yum7d9eG7UpoOoNzWDsIzZx+mM2lloj9YdvXGhyBlzDpDBwHsyg
	B/1Q==
X-Gm-Message-State: AHPjjUjEjOOJzhXD6lsH/ghc7C8yaE7Mz/KykHurJS1SfOtfUP+0nNgs
	z8smHFybTkY0QT8S6T/Ogg==
X-Google-Smtp-Source: AOwi7QDv7Iuj9/ojxhU0xdV+WdUEtyGJ/pRg3x8TbLLUf9HOK9TvkuK9vtXY2hfwDT2bHoPoaZO/3w==
X-Received: by 10.55.178.68 with SMTP id b65mr14388qkf.155.1505697054973;
	Sun, 17 Sep 2017 18:10:54 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	v32sm4507301qtc.66.2017.09.17.18.10.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 18:10:54 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-4-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <37188039-5725-51d6-c844-f89cf67ecec2@amsat.org>
Date: Sun, 17 Sep 2017 22:10:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505494753-10837-4-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 3/5] msf2: Add Smartfusion2 SPI
 controller
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 28OaYUpfTGW4

On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
> Modelled Microsemi's Smartfusion2 SPI controller.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
