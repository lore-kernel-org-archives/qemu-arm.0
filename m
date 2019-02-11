Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2722409wrq;
        Mon, 11 Feb 2019 09:38:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZgNbFOtfGTDH9JzUOtXNjvEj6dyJWibiG3olCyeQreKY/t4R/LS4X7i/ljUpuuj1UHhJup
X-Received: by 2002:a25:40c3:: with SMTP id n186mr16225444yba.390.1549906684464;
        Mon, 11 Feb 2019 09:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549906684; cv=none;
        d=google.com; s=arc-20160816;
        b=xtaLb3DxI7W+BxL4qbCXWJnqw4fG6S8r1upI+I8VNYRXm4q9rY0eeKum24OIfGmJOC
         IJUdgwGNU8RDewu9aRMcbsyGT0PsLOqCklW8+qwK/gbu2LyEATXhuKg4O4ZdNG+yfinf
         6wJYMNkX36R4Mf086Qf/iGHLNw2WvVIJbHfcIVlzJzPwM/4GTMgKs5DDw33OvkKIdL3k
         kepIgpez5H+S1NmIgaddbqXLBTcGc7jlTqARBbFUkSt4Io594u72pKW09AlzhwrYhaXS
         0bVUDqYE3iJdlGoSZ7+tYMYsr6SNJVnOQ/YA2A4fb0No5jKfjVOeYUFGDJxq825Q48Cm
         kymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=MRnpMHUUlXqEnOIu5404TzwRZxBvUeGNOB0/CdbBP/I=;
        b=vx1nUeg00biuenzieaeC0Ryc3dC8pbSvmKq3s4/Frh9ZM09c31uRKt6NINKwFEKLJf
         cAoMqJa5EWi2afVxvTz9WfGXySJdfrILu3TumaY/DiII+pkuX2goNJ4muSGkabicG8Tw
         xxkcYy8zhn0oUkvn9oORPWIQk2rWC9l8/i+XCTUjwcG4FgO+agUDw5okXPkr4bSnD52z
         EljhdKUwnZP4pHw4GykvcnqUTcYWuMMnff+cGEGOZgNvQsYQtgri32uMMhcOsVZP3uUz
         M8kuB6qtWY192lAN21PVeRDJeHH2LHseCGRBFNjONfUoJQYdcM2tyPYNeeVAffb7mDSH
         rvhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 202si6013969ywu.243.2019.02.11.09.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 09:38:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtFWt-0000B2-Tc
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 12:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFWj-0000AT-OK
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtFWj-0005Dj-0i
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:37:53 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtFWg-0004uQ-Qd
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 12:37:52 -0500
Received: by mail-wm1-f65.google.com with SMTP id y185so368491wmd.1
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 09:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MRnpMHUUlXqEnOIu5404TzwRZxBvUeGNOB0/CdbBP/I=;
	b=MmWbO4EImYEDe/uqQmCkTy7sEdesrd8aRO1VEDvaUbFkYyjwNPyb0NO8187h3JVzhq
	m8YlKTlvaWVMCNKSvRF3xE1gDD70zfhy9WxHkAfWI4EaU0ZBzoHqLJ93HHTTkuUKmrHA
	GW2pfwJdg1YW6G1ARm15M0RkXd6ZHSLjaSV5bNdHMp7Sqxa1zdYS3WBTLTVSiK6LPtx8
	l3JN5Ze62s7eX6MudNpOvu53Y+nMmxc6RE1YFm6ZJrI2QeOnNH/nxiFewsawk3QPrUqJ
	h3Qx0E6+so+khXuYq2lIjska96i+/JY+32ajdQ1Vu0Ex3ZNBDYbz1wARhubUyhn44R55
	w2Og==
X-Gm-Message-State: AHQUAub09ytcQYEDpFNacYARmkUObz3MQik9UTlpBk/SulE3Sb8xDJYX
	sATDE4MIW+UCBUAk77C7kdNNnFSwMTQ=
X-Received: by 2002:a7b:c00f:: with SMTP id c15mr502181wmb.14.1549906654091;
	Mon, 11 Feb 2019 09:37:34 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	e196sm7210641wmg.36.2019.02.11.09.37.32
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 09:37:33 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
	<1549694366-1284-23-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3d8e2191-12b2-ebdf-7e35-594d160653ec@redhat.com>
Date: Mon, 11 Feb 2019 18:37:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549694366-1284-23-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH 22/25] hw/arm: Express dependencies of nrf51
 Kconfig
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wZGHni/SrTOn

Hi Thomas,

On 2/9/19 7:39 AM, Thomas Huth wrote:
> Add Kconfig dependencies for the NRF51 / microbit machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index c4b3cd2..aad2dd3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -379,6 +379,8 @@ config FSL_IMX6UL
>  
>  config NRF51_SOC
>      bool
> +    select I2C
> +    select ARM_V7M

Don't we need a microbit config too?

config MICROBIT
    bool
    select NRF51_SOC

>  
>  config MSF2
>      bool
> 
