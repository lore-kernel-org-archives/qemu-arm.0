Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6455088wrt;
        Mon, 21 Jan 2019 12:30:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6fYDd9LRUpYzjDfUkoFY55IBYG+J0RdH0iT9mv3WTHtVs2tjBoNAw4O5ECQMVm38ImypNA
X-Received: by 2002:adf:cc91:: with SMTP id p17mr30159561wrj.118.1548102607915;
        Mon, 21 Jan 2019 12:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548102607; cv=none;
        d=google.com; s=arc-20160816;
        b=Eb7kiUX84typqYAtC2aqPbELwP98WJCDYpjFNw/n8XBsDyJ+9g27+VW3D/tI9QkMWK
         4glASfcqUXqtfQKoKCAkTi5W8prA1G4StyJH/SccJQnWmNZRmtLFU9EViWC9nW46Mk7a
         fXHTPfhOSPrLRitU93aMToOgsci0dWUM2UelkG99KCFA8kCxxnGq6DzRQB+0aUBwcmK0
         hGKS+TtPLszULYbQkrgo3aFsBRw/zujVPL0zx1pA/lBTfSuOVTnyrsFVyOipzEravxcD
         /IpUDUHQxTnjv4xUH1Irc0elPpmLGScphXYXO3XJ3fTWijKU/PKmGE9Ohaa07iNmmsEv
         W5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=ahlMIQsDYebp3JoXzSXU7PuFaHuAcJ4Nv4WyyTa6oVw=;
        b=seTkdAddYut+OxDJHUyy8QfnVuc02BPRdVVFDEnGpDmL+mWG2xDWE1nM4YI3WMPKe7
         0nhwR3t87YsGFkJLf/xu6Nz4ClgCXHKxX5MYOjMkX3OtqSFzAxWvyDP0R53E+KOyzTP8
         bNgIBDasbvSl3Bsp1q3h8ISSiNQDiullSd+q2J9xxFVk1CZZzqxwXlqUx0oPRoIQnHrg
         zc6T+WCmlMS9xr51vb+NAH5irU+BJ+KNw/rjAsiYPFvObX4X9aGUOULPAsn7wSmrsggU
         7aWmgAS1Qo6rFHUbHOQovMb9Bn2rR8paQDOfNILpscyp7FCCVlJyVXOznc6KSyvB5NAb
         LzOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si72643204wra.391.2019.01.21.12.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:30:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glgCs-0000MW-UY
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:30:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glg9U-00060z-Ti
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:26:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glg9P-0004H3-MQ
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:26:34 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53571)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1glg9J-0004Cx-CL
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:26:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id d15so12060967wmb.3
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 12:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ahlMIQsDYebp3JoXzSXU7PuFaHuAcJ4Nv4WyyTa6oVw=;
	b=GQs0ibKv7DjRhRmfjMICb1GEfFLhG4pDTJ+b1Fgjlhit07eXrQtcSViz9qLXLf4m3/
	Dv0UiOiCzYsfekIVLA60BO68kYN8gT9cjZxmd36S3+cQ2Iq02IYR91nwf//sIM7BPJwz
	SulnN5SWcxJhZrJ8G3YUxXoP7QmHZfsgAgUYg4iWTmK4Aj2wkYiXcsZRPpfimqm6c8Nz
	5RYv6wpPH8SXAT0TAqDH7czWk4KHekqVNiVF3nbPhtsjDFpT2aLzT8iVcCaz4+tzbxpP
	gOrwlUcMBE0gGBPfPlO3e3ZlgdZTCPAW7JEWoDZzAe0LB5wlbSF1yTcSPeaW/9QSOURm
	Bcaw==
X-Gm-Message-State: AJcUukf56g9SiGw2vngDumQ5rtKA1HkIwckLRsQM9TE0/6Zm0HwXueak
	gQCYBYJKE8L7qYRNyxXRFbt36g==
X-Received: by 2002:a1c:63d5:: with SMTP id x204mr759099wmb.137.1548102383018; 
	Mon, 21 Jan 2019 12:26:23 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	y13sm75284690wrn.73.2019.01.21.12.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 12:26:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3990ef56-7eb2-7385-8d18-56b854de4b09@redhat.com>
Date: Mon, 21 Jan 2019 21:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/23] armv7m: Don't assume the
 NVIC's CPU is CPU 0
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TctJrdf+LJGo

On 1/21/19 7:50 PM, Peter Maydell wrote:
> Currently the ARMv7M NVIC object's realize method assumes that the
> CPU the NVIC is attached to is CPU 0, because it thinks there can
> only ever be one CPU in the system. To allow a dual-Cortex-M33
> setup we need to remove this assumption; instead the armv7m
> wrapper object tells the NVIC its CPU, in the same way that it
> already tells the CPU what the NVIC is.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c       | 6 ++++--
>  hw/intc/armv7m_nvic.c | 3 +--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index f4446528307..f9aa83d20ef 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -178,10 +178,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>          }
>      }
>  
> -    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
> -     * have one.
> +    /*
> +     * Tell the CPU where the NVIC is; it will fail realize if it doesn't
> +     * have one. Similarly, tell the NVIC where its CPU is.
>       */
>      s->cpu->env.nvic = &s->nvic;
> +    s->nvic.cpu = s->cpu;
>  
>      object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
>      if (err != NULL) {
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 0beefb05d44..790a3d95849 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2274,8 +2274,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      Error *err = NULL;
>      int regionlen;
>  
> -    s->cpu = ARM_CPU(qemu_get_cpu(0));
> -
> +    /* The armv7m container object will have set our CPU pointer */
>      if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
>          error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
>          return;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
