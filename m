Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3351659wrt;
        Mon, 7 Jan 2019 03:46:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4lJ3qaoeS7A+L/Gy6gckXdAbmnKWprD3Qb6seA2sHr3WpSWFGObUQOXlJWeBjzxz3FNl1+
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr27318448wre.244.1546861592981;
        Mon, 07 Jan 2019 03:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546861592; cv=none;
        d=google.com; s=arc-20160816;
        b=KCpR13rcC254G1d47LeCAxBkpUuRoiC0rbCIXWylaaOUt8CObQMvSC3DhFcS7DO8/w
         +UMfwo3d7evCgW62gvLoue/gdVC5XGLhZLFNLtdtwqldxaWNx3J6dgD/21+qu5wn5xOU
         tkuT/EbEBuVZ8xATIkpkSu7AAmhaVc/lYlItZfwTk3xfLxkSeTerm2J8ZpLISfgBAgoI
         U86Lq8vrMvEgKeAq1QFeRUM5t54RrOq/uAYBgqP+mcB9oW9BM2XKs0x/nG3R7nmQP8r8
         P31L5wdKpzJRPwBmTpE7Nc9vsOHD7jpHsvhXkQz3o/3d4+TB3I2X/bkcr8Ah7Pt+G36w
         7dRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=1wyczKUjmeRVHVwLD2q8Uv9ShmmMPzq6bVTYpHGCdF4=;
        b=FARP/5B1Cs6p1sqmkHzGJBw0PqToH46WWQ1hxdT5QRvh9Ql7xaU0S6h2xVhgtPDDCH
         JYkaszvAP0F+lkyCzZpOZcPqLIzhF9QMQu5j9pwJA0at4OEz1E8GM63L80LTD2Kis4HQ
         GskK2BtpGBul0Mh2tiENOBlKvS+65S/JKp7Ux0b3xHhFrC+fSlHsWNEOUndlU0kjZDGW
         4NKX1gDNUhJY8uNpZlITSCfQwEajCoQW9WLWUSAS70R8k8nCp36dUoIPhzHg/0FzKE+w
         3SwPESF9KB7NlzxdURP1kE15j+Mkr5Dej+q0xa5pFImijauYK4675crxD+X3+TFTkt51
         xh9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si30756835wre.392.2019.01.07.03.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 03:46:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggTMW-00067p-12
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 06:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggTKu-0005PO-4z
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 06:44:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggTKt-0007pR-AY
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 06:44:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggTKt-0007m4-3D
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 06:44:51 -0500
Received: by mail-wm1-f66.google.com with SMTP id d15so592227wmb.3
	for <qemu-devel@nongnu.org>; Mon, 07 Jan 2019 03:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1wyczKUjmeRVHVwLD2q8Uv9ShmmMPzq6bVTYpHGCdF4=;
	b=dnT2qYNLUl+HGA3wABFNedQ3Grrjb+rYKcBdtfq7kHEjvso/8s2Gczlhz/bOgW7QZ1
	odThdVmS4yEObfr+IEUzNdUfCPfLGkbu1dNK0W5PgW/AVKHzSl40dBS6fc0Q5MrJfHWD
	ckM8FMC3MqZ95d0RUGuYMCPE3sjTMvP5J6Ar4v2gg9HnuqRze2XLsLvYtG6D65+gapFa
	DIPJ/vpcTH22aYYVevYYQ4T7xev8bJxOZ3IHjluUOuiJDdI8pVjWh+qN9P8ddEfaam0I
	EB/hssSLIrMXG1GNGeKefSFB74P6pI8+1MqE26vp5JV0d6u6rK+lKwOVFOgwsw7UpdFS
	ZdDw==
X-Gm-Message-State: AJcUukcRvyq5Wh63GUnQR2TDIBuCGjyGjiX70cvAF/SSZoRqN+koE8KW
	SaYgXwEXy3p2mOKrx1LksxaDIw==
X-Received: by 2002:a1c:4807:: with SMTP id v7mr8755361wma.53.1546861489957;
	Mon, 07 Jan 2019 03:44:49 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	k135sm7951474wmd.42.2019.01.07.03.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 03:44:49 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-9-philmd@redhat.com>
	<fe31012f-9311-1455-a20a-70eb83400e50@redhat.com>
	<6443e9fa-6fb3-56d8-8568-93608cff0d69@redhat.com>
	<2641db06-06c3-3c18-c00b-db7e17cffa55@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d896d1b9-230b-521b-1ae4-865ebcdf5004@redhat.com>
Date: Mon, 7 Jan 2019 12:44:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <2641db06-06c3-3c18-c00b-db7e17cffa55@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 08/16] MAINTAINERS: Add missing entries for
 the TI touchscreen devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rkHiJwFa4UeM

On 1/7/19 9:05 AM, Thomas Huth wrote:
> On 2019-01-07 09:02, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 1/7/19 8:18 AM, Thomas Huth wrote:
>>> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  MAINTAINERS | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index f571b29077..03872552ee 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>>>  L: qemu-arm@nongnu.org
>>>>  S: Odd Fixes
>>>>  F: hw/arm/nseries.c
>>>> +F: hw/input/tsc2*.c
>>>>  F: include/hw/display/blizzard.h
>>>>  F: include/hw/misc/cbus.h
>>>>  
>>>> @@ -649,6 +650,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>>>  L: qemu-arm@nongnu.org
>>>>  S: Odd Fixes
>>>>  F: hw/arm/palm.c
>>>> +F: hw/input/tsc2*.c
>>>
>>> The Palm machine does not seem to use tsc2005, does it? So I think this
>>> entry here is wrong.
>>
>> It does use another touchscreen controller, the tsc2102, which in the
>> next patch are declared in the same header (you suggested "tsc2xxx.h):
> 
> So using the tsc2*.c wildcard for the *C* file is still wrong here,
> isn't it?

Oh I got it now! Yes, you are right :) I'll update.
