Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3843818wrg;
        Tue, 14 May 2019 03:41:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXI5JDBb5wwky2fHU8NmIYs41JyQPvIB2ZtY2twYkg6hskeiLQHGhkwHdW1DG7IC8iQIKJ
X-Received: by 2002:a17:906:a302:: with SMTP id j2mr12271779ejz.155.1557830517206;
        Tue, 14 May 2019 03:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557830517; cv=none;
        d=google.com; s=arc-20160816;
        b=0PWqyupHsUs6BliOtHKGPe153eM4kx89lo4J7A5rxC8IbsaOKy9fA5mZK9b3tKRGjs
         3r77m8wOcZhE/Y5+TPFRdvmgzY33Lzvws6cOz9nU89DPr2k3o6CGOmLa628tDXKZE8nf
         qLBB86ORfyqhaUYkHo2yZySI9Kp1WIzNvyck5k1neR7FXstd7u4PpXEyNFoZzbgw1lLI
         vFM1tL6Wyhrk+UYwICdbP+MZpMdl1vC/ZoMEN51qSF2o8T2OdcGM0OYtfU3HqFLGr5iH
         8tacroWFLtoAdpeow/H0mpveGnNBThxl6kLeIs21rmd7v4P62D2WrRYGhnBFg+l3khSN
         6o/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=APfPWIzAW58W4BKWrDr3D6/BLxWSkOUQ+0nXQGJPVT4=;
        b=PTtaeQIOVZSC1PfcWrZVQvmxxw6xAxzSeLE6Whvhbx/ubnLYb1E7nVTGAoMbTJCDNg
         vN0X6udUXqil7kGxUPBvoWB0DDLh02RPt+Gff02AmJe3RNJ/uSkITtgFQscP+CXlKrcT
         wNvZL6tnKz95ATLn0kUS82DWvzz5JhUnyCLlr/NJDlCn66e/U5LPIb3t0xNRUvw1bv2f
         FIXL4Oln0mX5UZbeUVlC/K1G9nFQk6hv/roH+vQgYxlYbr7kPfGAuXRfBs+jKP4uS8wz
         Ne/56l0+dANHewwExvZ1vyx7vyYTNSStSPZ4f6G6vKUDndVScnIA5cPqy5Ba8G6YgfGu
         qAtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si2702979edv.413.2019.05.14.03.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUse-0005fD-5v
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:41:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUrB-0004ci-FW
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUr9-0007CM-6Z
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:40:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQUr7-00074M-6a
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:40:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id f2so2276352wmj.3
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 03:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=APfPWIzAW58W4BKWrDr3D6/BLxWSkOUQ+0nXQGJPVT4=;
	b=SDiD9vaAEON4misN+liVx5ByJLcqxnqICBO+HE/cAgu/gZ+G6mc+BaxU1hjJcCE5I7
	+4z1FryEpVSMd5Vb3o26q341Xdn8qoim0U56Zy2cpeYSACrdTceBjg+gmSUCXNuFlzch
	SOHlf+I5M/Ef2ncg//IbM61kslfmi16nqor4u3b9F9wGbnxo7HbFjpdmqjnX/572HMka
	gmHk6buzl3adbh3K86ZoWkHO2Fw5FK7KevTPGPPfdpFX1SNDihSHzRuE3UoS8FEoVrbJ
	ene/DiNUHrLb0N/v/bRWwiYfztQGpDlqK8yPIltzowzV9aALrxrLApGa5c2jsWuLQbmq
	WBbA==
X-Gm-Message-State: APjAAAWoSrz993Iz7YsZJSJ2tIIOSC3nswwZrNQ4xfgb5DkisLDrYsOG
	Czgx/jNbs0yDqexY06wKlssblPaVYfA=
X-Received: by 2002:a05:600c:21d7:: with SMTP id
	x23mr7102967wmj.87.1557830417559; 
	Tue, 14 May 2019 03:40:17 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	s124sm2093306wmf.42.2019.05.14.03.40.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:40:17 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-3-thuth@redhat.com>
	<CAFEAcA9bGr1249Ofx=TXLK3JNs1KMWTnRR+-FexKr__0AJAipQ@mail.gmail.com>
	<41876537-aa47-6d13-5298-a3af03d11b8a@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4655d635-6fc3-2757-8577-ddce41b91be6@redhat.com>
Date: Tue, 14 May 2019 12:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <41876537-aa47-6d13-5298-a3af03d11b8a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH 2/4] hw/core: Add a config switch for the
 "or-irq" device
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cpIdePqHVsQ+

On 5/14/19 12:25 PM, Philippe Mathieu-Daudé wrote:
> On 5/14/19 12:06 PM, Peter Maydell wrote:
>> On Tue, 14 May 2019 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> The "or-irq" device is only used by certain machines. Let's add
>>> a proper config switch for it so that it only gets compiled when we
>>> really need it.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/arm/Kconfig        | 2 ++
>>>  hw/core/Kconfig       | 3 +++
>>>  hw/core/Makefile.objs | 2 +-
>>>  hw/pci-host/Kconfig   | 3 ++-
>>>  4 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index af8cffde9c..0bb3bbe9d3 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -277,6 +277,7 @@ config RASPI
>>>  config STM32F205_SOC
>>>      bool
>>>      select ARM_V7M
>>> +    select OR_IRQ
>>>      select STM32F2XX_TIMER
>>>      select STM32F2XX_USART
>>>      select STM32F2XX_SYSCFG
>>> @@ -424,6 +425,7 @@ config ARMSSE
>>>      select IOTKIT_SECCTL
>>>      select IOTKIT_SYSCTL
>>>      select IOTKIT_SYSINFO
>>> +    select OR_IRQ
>>>      select TZ_MPC
>>>      select TZ_MSC
>>>      select TZ_PPC
>>
>> In cases like this where a device is used both by
>> an SoC and also directly by the board code that uses
>> that SoC, should we put the select OR_IRQ only in
>> the SoC's config, or also in the board model's config
>> (ie, in "config MPS2" as well as "config ARMSSE") ?
> 
> Someone should be able to work on the board without having to look at
> the SoC code/config, so both :) The idea of Kconfig is you only worry
> about a specific device, and the qgraph sort the rest out.

Hypothetical example if you only use the selector in the SoC config:
If you replace the SoC OR_IRQ by a more complex device or extended one,
the board will lack the OR_IRQ selector.

Using Kconfig selectors in all place a dependency is explicit also ease
backports.

> 
> So having in both place is safer, and helps to visualize dependencies in
> the graph tree (I'm slowly working on this feature to help new-comer to
> understand model dependencies).
> 
