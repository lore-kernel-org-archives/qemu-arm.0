Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp29354wrg;
        Mon, 20 May 2019 04:09:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuwgK40WUyjnSieN5suvGgFU3hhCKPzsCUdwzywwTe12dp4mP/Yg6A03VC3v+vtD6RvX0J
X-Received: by 2002:a17:906:4482:: with SMTP id y2mr52879338ejo.201.1558350596485;
        Mon, 20 May 2019 04:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558350596; cv=none;
        d=google.com; s=arc-20160816;
        b=aDUtLGZdmna7o4FGLmEcnoylEHlMzsYEwciCkyweC4i3ZEqqz6gej1LDT6ymXH/GpI
         v2BSLoki9F0PZuie0llb2hujMvrtGOBBPqlAcXwf0BZFdwtbB7ZRGVC7vWsGgviMKzC3
         qtFX44Z9pHI74KEuBkUiXJ6U6iZWB4EM84Q6uwhWaFB3JYmow1gJf925Aznp9gcaEqqc
         AWMQYeyTd2uP+0y3DTEK4MG8kDJHzi73zGJnZkNkb48S2JWTfTCo6dPw7ryMeLEOekek
         oNmfKDLSBAUL7eDX2lp6l0UBAgwPQSP/NnfLbsVup4Ltv8PZ3bxU4nOAXaCJaU82u1QX
         O6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Fi9JkrAxVjZQtxgJ9kWkUXilTWmZw7lNfIgiEeQhb0Q=;
        b=iq+7GX2WL6CvBPni9849dtrMFcqHh+iWmrJBqpo1sW1la6TWXvKkE/eygeDDi0IzP7
         jG6khFnU0S7u1Cq0V4ghyKb1g5WfokbXaNa+kvq6y43gDXbbPJs5BoTt9MC7YeciA5tu
         OVQ4RRhaeq7+owKAZutXyBBGCdB4AsE3wCBCEM+8GfH8Sa8j0kVbjftAHUkLj6MpivYF
         1wRF7qhGJPWlkgG+CZF7Gm6EA0v3TbAFDtrcw4rMYpclZ1fIM/4cIA0eCAvD0D2TJTo7
         UVoC9O6gOslQRpbXTWrYUde2S0zH1K3q3MFBAh0VrzAJOaCTTfEu2MCPuJZeRvEhn5K3
         b5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs4si8259349ejb.206.2019.05.20.04.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 04:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSgB1-0003Mo-GK
	for alex.bennee@linaro.org; Mon, 20 May 2019 07:09:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSgAr-0003Mb-E9
	for qemu-arm@nongnu.org; Mon, 20 May 2019 07:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSgAq-0006KH-Fb
	for qemu-arm@nongnu.org; Mon, 20 May 2019 07:09:45 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSgAq-0006Im-9D
	for qemu-arm@nongnu.org; Mon, 20 May 2019 07:09:44 -0400
Received: by mail-wm1-f68.google.com with SMTP id f204so12861138wme.0
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fi9JkrAxVjZQtxgJ9kWkUXilTWmZw7lNfIgiEeQhb0Q=;
	b=bAxevcHbzgcwBugbncesUkaTAFbBRYD6Q/QBn2ZCUOrztYXTy/0KJRGfbUGqoVz7+7
	uszKvVZC9SW2nf+t8iNtJPJYtZO7daM8jO/67ui8qbkGKTdlvbr/N+kAryYmPUKTD1yT
	FZ78g2M8kF2jAkcgFf2IbKde274HYyzT5wZkcIRl5Ql9ZC64SwziJL6Q++8GoGhD57Tx
	j49EBIjoPw1nVK5YUV3CRJ69PunAOb/bAkmi8PRsXjZBc95YVrcL25/mkXQiVMFjJDRt
	X7sb5Z9QUpqTIx8zzRO4kft2UCPN4HqAlHNQDsza5Itd2DHsy4rs/bat6dGjaK+q4RVm
	muyQ==
X-Gm-Message-State: APjAAAUN+Rfgy393zw97/4rFxdWTuIK1h/vOa4cSgfAR3a9xRpbncFVP
	DSgmgmMPAQBa6+5qWpsSKL9uDA==
X-Received: by 2002:a1c:ca0b:: with SMTP id a11mr41833907wmg.52.1558350583228; 
	Mon, 20 May 2019 04:09:43 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	t15sm15489459wmt.2.2019.05.20.04.09.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 04:09:42 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
Date: Mon, 20 May 2019 13:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZLaim3Xbub4q

On 5/20/19 9:47 AM, Cédric Le Goater wrote:
> Hello,
> 
> On 5/6/19 4:20 PM, Cédric Le Goater wrote:
>> Hello,
>>
>> Here is a series adding a couple of cleanups to the Aspeed SoCs to
>> prepare ground for extensions and new SoCs.
>>
>> Thanks,
>>
>> C.
>>
>> Changes since v1:
>>
>>  - moved enum defining the Aspeed controller names under aspeed_soc.h
>>  - removed AspeedSoCInfo 'sdram_base' field
>>  - fixed clang compilation
>>
>> Cédric Le Goater (3):
>>   aspeed: add a per SoC mapping for the interrupt space
>>   aspeed: add a per SoC mapping for the memory space
> 
> I think these two patches are fine to go even if Philippe's comments 
> are not addressed. There are valid but not a blocker to me.  

OK, so:

patches 1 & 2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Peter, can you apply them?

> 
>>   aspeed: use sysbus_init_child_obj() to initialize children
> 
> Philippe has taken over this patch in a larger series which will go 
> through Eduardo's tree, if I understood well the emails. When merged, 
> we can try to re-merge the RTC patchset from Joel. I think we made 
> things a little more complex than they should have been. 

Sorry if I made things more complex. I went on PTO after sending
"hw/arm: Use object_initialize_child for correct reference counting" [*]
then was slow to address Thomas/Markus comments.
Then maybe I should start pinging maintainer more aggressively when my
series are reviewed but not merged, to not delay further developments.

I took note of your comment and will try to keep things simple the next
time.

Regards,

Phil.

> 
> Thanks,
> 
> C.

