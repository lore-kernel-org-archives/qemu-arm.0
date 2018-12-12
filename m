Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1718509wrt;
        Wed, 12 Dec 2018 03:38:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UM8J538VThgumUFmZjZYf2lNFNYidsorhfKiiGS6UEkmwdsDhRZxg6Z0MNReHyYhFDLUg6
X-Received: by 2002:a37:ef07:: with SMTP id j7mr17662733qkk.35.1544614733824;
        Wed, 12 Dec 2018 03:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544614733; cv=none;
        d=google.com; s=arc-20160816;
        b=J03Ccax0h0vwCFob/RlIFSfgdJwZh6gSb7ZhIuKyN+2Subtg3IEso5WiOYj5L3/GAJ
         /dpuQBIcOhNLG5VtoipgE0nZ1bnkwJrCxuyweVeGSWYfvZ6ZCoXseY3vcJbY0UTedWG7
         HO5Tg2IWJ+iL7jPKowB0MjLIBpT0ssLVPWpN3aJm7ya/wCDwcXPglrtF30xZq84CZos2
         VNJPwMYVyHwQuJ+E2R0pI6GLYsFBwecjdAVkH+IAMv88t7LuUNh8vJUar+vm5R0SgX/T
         IHdnyO9Ydx47GI2FEGR+fr6km3fF04h4ipLm1tSP2t+kvq9PZ3j9xFiO0CO3gefRILyl
         theg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=BKAzr1I/R2bRX0ky4bIVQkTaF7pDXm56wV2nnxHzG88=;
        b=FS2tr7TZNJb3gHMZrA5N3tcyQmAxjP0g5XPtagXu++JHkXoWgSzdKyWEG9UaPf28H/
         l16tclu3r7VhMhfgrOJ8TdCh/a2LpZX0pq43E4tNiwhOnvU8ECSxBp9HC9eJS0y6WP8p
         88tyzQt+Bop52rkXYcWqTzUfGto3F/Ktru++U1Z1IXk5yK3TTPNh8rNJJ7PA7uVhPzVy
         Voy4TfLS/Y6dsMBMPfccLNCVqEJt43aG/3s7lWt9mol8RjCcGSOO/BBamCB4b2SgJPNU
         g3XfZzY8fEyF9eyEikKwuFla46EytyjK7wTY9D+6roQuLi5/mBKmcglvP/ihAujnMJYK
         QoTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si1748202qtn.132.2018.12.12.03.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Dec 2018 03:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gX2qr-0000g5-BL
	for alex.bennee@linaro.org; Wed, 12 Dec 2018 06:38:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gX2qe-0000ep-4p
	for qemu-arm@nongnu.org; Wed, 12 Dec 2018 06:38:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gX2qW-0002cR-2V
	for qemu-arm@nongnu.org; Wed, 12 Dec 2018 06:38:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gX2qT-0002Wf-S5
	for qemu-arm@nongnu.org; Wed, 12 Dec 2018 06:38:30 -0500
Received: by mail-wr1-f67.google.com with SMTP id j10so17342953wru.4
	for <qemu-arm@nongnu.org>; Wed, 12 Dec 2018 03:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BKAzr1I/R2bRX0ky4bIVQkTaF7pDXm56wV2nnxHzG88=;
	b=Lk1N+V3orceIS3tqtThMqKJ/kfrZNBJFyWolgydpLj970kin95rrCayAf2haN9YYU9
	NJ85suNRBCjFGqIioJA2kaTXJVEUW6t6x8VH0sCI+6jMRWmZOP2JV6NafmrmCWaZzFz2
	5G/6m/cMUxEm8axAb0zguSc8i72qjlGTXCBOrQBHAbuazhtK+MO9FAFEF2laiikkDOjq
	bap82/GoMekli3RVKk6NTCs3aSAyAOa43G4LiMe9tcq0cjQ11ryHkGUcu9l9ddYdI61E
	yXgH1OJZUnyGHKInYw8aNOskQO+jm3Dnm4L7H1Pfr058PdH3aACzH32z4y8/TKOOYIYN
	D8Ig==
X-Gm-Message-State: AA+aEWbcmVbTlFmWoFzwln4IalhTvr+276OuI6Y1d96KPzGuWW8+pd1U
	3V9AvHG+x9miI0YtkMJBwvYUIoEnb7Y=
X-Received: by 2002:adf:f649:: with SMTP id x9mr16733958wrp.247.1544614706073; 
	Wed, 12 Dec 2018 03:38:26 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	v6sm16841326wro.57.2018.12.12.03.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 03:38:25 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20181212003147.29604-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca246525-69ab-abf8-7352-d5b1d73b1925@redhat.com>
Date: Wed, 12 Dec 2018 12:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212003147.29604-1-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] virt: Fix broken indentation
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R+4RkmlMaqUb

On 12/12/18 1:31 AM, Eduardo Habkost wrote:
> I introduced indentation using tabs instead of spaces in another
> commit.  Peter reported the problem, and I failed to fix that
> before sending my pull request.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 951597607696 ("virt: Eliminate separate instance_init functions")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 17f1b49d11..5b678237b7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> -	.instance_init = virt_instance_init,
> +    .instance_init = virt_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
>           { }
> 
