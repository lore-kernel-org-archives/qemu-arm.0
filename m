Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3952107wrh;
        Mon, 29 Apr 2019 13:56:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywco0To5DNJzyfcJPQ4EHEq32xd4nc4r0f/ReGztAIRAhTPtg9kMbrmYyuK7925Ykts9o2
X-Received: by 2002:a5d:408e:: with SMTP id o14mr9281522wrp.318.1556571380731;
        Mon, 29 Apr 2019 13:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556571380; cv=none;
        d=google.com; s=arc-20160816;
        b=iCqjnLl/2o4RVhiCcBW/cG4rKWS3LxnJz+38riflpraJKHmjgPekLJF3wireXGInEX
         3dfDmEiQDdl72nID1QWyxVGSh36gVilD9cOmaQS6Yw1C80x+X/9BXUAty0CHJz5wNuRi
         OgeXC+1+ujx1wP7beX6hshONQ6zq0nYCqjZNH/6q6B/lTcxVG9l7TVpAqOYrKTqPhKtM
         LFfS+Hoc1v7hYwnz+TqP2U4lj1dTQcfEKIAPiYcANadPfP/cZauyiT9qjM4xiYcYYTel
         x0VLnlddjWgGWPG4jKvXc9WU8YDcocfW2FfojEcy5NBex//UtalX6bZe7rjyDqrA6khL
         Bltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=BEMr4HbLOWMg3VTbSJU5yEbI0WrJuAavWVGkqW17nUg=;
        b=hYWU58zLbH57fyVrqmdjChQaqB6EXXELfme4ffUFqdw8gKr8JvM5zM2mDHhcnHV6ab
         fqRDFy84ztIBVoTUY9GEQu86/MelQGHwhZJkkjo0K9dJXdIcTXpBq3+juRlq/OmDXgkF
         1nlzGIqVzLpOzx9n3D0bytVUvsx97XJhieWfMsj10HNpfhRGkutOarP2l5jMdP8iXIO9
         qW3N+bcLaIGDoESMLOhm0okDGvl96cgdU9wyrb2/hUfJ9mC0puDkdRWeJEOn1pwiNq/w
         POjqqUFG7rfh2myy6O5aRy9i1ITD3bo/CcgAyToHHibqBrfmjbUcfjPfKb2gdqPEPT7C
         iQgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si10033248wro.27.2019.04.29.13.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 13:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLDJz-0002xA-RM
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 16:56:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLDJp-0002wq-4T
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 16:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLDJo-0006kE-3T
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 16:56:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLDJn-0006jc-Tc
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 16:56:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id b10so1020365wmj.4
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 13:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BEMr4HbLOWMg3VTbSJU5yEbI0WrJuAavWVGkqW17nUg=;
	b=BBEw7aR5PBs2uAfclha5iRZrhmEUf/tzaYB3b/B7t70UCBZmKTTd9W0bzVFXGpk5wN
	RcRj6gT4XBWSLdPJ5PiFV3sRu3o/+Ng85xBlz1f2QUVMbWRiWkUtmBRpjGgPRNpTy4i6
	MxXoJbhaH1Q3C8SrolB4fnSwBrQk9dSl4wQBkmy1Yd89M9gmoUD8BORw5ewHxkWBa/hQ
	uZi2J+b3gesmU4Er0M0cMVMYIZLvSPKJp2b9KHTcGNjJ2+C+At9OUqBKUs4T4NDHIU8h
	36zSC4FQFwIkpeCe0lWmPa5xW2OIIFiGFLWQflEyGhyRWR6YxoS+4wtRx9/Ty6SQNimW
	ofOw==
X-Gm-Message-State: APjAAAXxY9LEDARqaQW1fjBjeLmrKj0XzgJcPKhh+u+qWJ5Wk4LE87FK
	kIZW7seBBKSh44kPojydcwEk6w==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr671049wmh.136.1556571366678;
	Mon, 29 Apr 2019 13:56:06 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	r29sm3417914wra.56.2019.04.29.13.56.04
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 13:56:05 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-11-thuth@redhat.com>
	<377a2033-504b-a84d-0eb0-765de81af730@redhat.com>
	<fe977ebc-3ec7-fbf5-7a72-c9418286f0f1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d06a1288-277f-050e-e16f-e62b82a284c9@redhat.com>
Date: Mon, 29 Apr 2019 22:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fe977ebc-3ec7-fbf5-7a72-c9418286f0f1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 10/29] hw/arm:
 Express dependencies of stellaris with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8qBY0uTtJta

On 4/29/19 9:25 PM, Thomas Huth wrote:
> On 25/04/2019 23.41, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 4/18/19 8:00 PM, Thomas Huth wrote:
>>> This patch is slightly based on earlier work by Ákos Kovács (i.e.
>>> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  default-configs/arm-softmmu.mak |  7 +------
>>>  hw/arm/Kconfig                  | 10 ++++++++++
>>>  2 files changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index b7ed3c530b..3f82d635e4 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -16,6 +16,7 @@ CONFIG_MUSCA=y
>>>  CONFIG_CHEETAH=y
>>>  CONFIG_SX1=y
>>>  CONFIG_NSERIES=y
>>> +CONFIG_STELLARIS=y
>>>  
>>>  CONFIG_VGA=y
>>>  CONFIG_NAND=y
>>> @@ -24,16 +25,10 @@ CONFIG_SERIAL=y
>>>  CONFIG_MAX7310=y
>>>  CONFIG_TMP421=y
>>>  CONFIG_PCA9552=y
>>> -CONFIG_STELLARIS=y
>>> -CONFIG_STELLARIS_INPUT=y
>>> -CONFIG_STELLARIS_ENET=y
>>> -CONFIG_SSD0303=y
>>> -CONFIG_SSD0323=y
>>>  CONFIG_DDC=y
>>>  CONFIG_SII9022=y
>>>  CONFIG_ADS7846=y
>>>  CONFIG_MAX111X=y
>>> -CONFIG_SSI_SD=y
>>>  CONFIG_SSI_M25P80=y
>>>  CONFIG_ALLWINNER_EMAC=y
>>>  CONFIG_IMX_FEC=y
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index 71126254ff..b91503f5a6 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -91,6 +91,16 @@ config REALVIEW
>>>  
>>>  config STELLARIS
>>>      bool
>>> +    select ARM_V7M
>>> +    select I2C
>>> +    select PL011 # UART
>>> +    select PL022 # Serial port
>>> +    select PL061 # GPIO
>>> +    select SSD0303 # OLED display
>>> +    select SSD0323 # OLED display
>>> +    select SSI_SD
>>> +    select STELLARIS_INPUT
>>> +    select STELLARIS_ENET # ethernet
>>
>> This one misses CMSDK_APB_WATCHDOG:
>>
>> $ qemu-system-aarch64 -M lm3s811evb
>> qemu-system-aarch64: Unknown device 'luminary-watchdog' for default sysbus
>> Aborted (core dumped)
> 
> Oh, well, looks like this has just been added recently in commit
> 566528f823d1a2e9e, likely after I assembled and tested the initial
> version of this patch...

Ah yes, correct! This happens when we take too long to review a series,
and since this one is huge, I was keeping procrastinating...

> Thanks for catching it, I'll apply your fix in v6!
> 
>  Thomas
> 
