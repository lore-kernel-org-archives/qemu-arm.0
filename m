Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp6179008wro;
        Tue, 30 Oct 2018 15:40:37 -0700 (PDT)
X-Google-Smtp-Source: AJdET5erhTMA8Ek1IBoX4u4u7aK5ktl+f/EMyTiB4dQf40jsNszTAGY8Q5FAdTcvemoZTHxIE/oO
X-Received: by 2002:a0c:b746:: with SMTP id q6mr519626qve.235.1540939237372;
        Tue, 30 Oct 2018 15:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540939237; cv=none;
        d=google.com; s=arc-20160816;
        b=AZlcqsYMIxSajbXZCkeK9+fp3PxrUM1l52Nu/ZVSljMubwBAhQOUOqF+l4cd9p+giy
         tiPKnKgNe/Z7v7QNOhXivY91xdz6S9y+bPTaliTD8UvdIM6Vg3hA+KARleljzrgyfuBt
         rqewam3SEZ3sswKO+ChHTFIqnzT+fdVwgNeICSp4JXl5BbH90ZoLFxPE5Hvu8o72Q79K
         4mvpcm2Khs71P2WjH0rGIGxRstdyVLQ0mtqmP4BXAs8xAHkkgRQJDNLlQICaQE+ZDmNg
         4lB+pFx4pkI116sUuvGsyLMMLCGmiaNbh2CHgzRPCWi1LxCkFjl0ACMNZUunewCCsTss
         aBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=QYAVk1A2XF0HvmJvvZWVGAniQvRNspot94Wvf8eO7tI=;
        b=cNdGf4aTGGXoIh2/4afe1FeTQIgSJvBUeQn/6NDZgknVdks9D/GgoGWZYClpLoBCIt
         4hkamrvqTmvR1F+y18o0MgXSIvHGMKd0C54jthzJGT8hHckXg5KLXchBN2Y5KVU7t7xj
         blKdVEA7ni04i8b3KcyBNRP2nA/FOxmctZEfqY6FEJzlj8NNTPdyjpdCBzbCeqHZiohr
         Giocx/0lTov1IAPzdMCZx1IKNqKFywV55cOm8OpjqzIfIjturxF2JEvfjg+4noOJlAHu
         MewHyvI0N+qj7U2OchHMru866s9JNtaFpFYT5ZqAoILBr+WIKC8mc+FxmwJxHImSqrKV
         vmFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si2520970qtb.330.2018.10.30.15.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 15:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHcge-0008W5-UI
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 18:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHcfi-0008Da-KO
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 18:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHcfc-00078d-9H
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 18:39:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36450)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHcfa-00075v-Bo
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 18:39:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id a8-v6so12799121wmf.1
	for <qemu-devel@nongnu.org>; Tue, 30 Oct 2018 15:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QYAVk1A2XF0HvmJvvZWVGAniQvRNspot94Wvf8eO7tI=;
	b=I7LM4FoD0HmJisxZByQ+tQ38vkGBpZpJ/PUgJ4ntfk8aW5qVWAzVWIeQ8R4Ik31Jyk
	9ephSwjs2blji15xH1z4FY6zsOahqQMIrZBketDtzPEfsy5RmUiPMoDgGnPjTgrTZguq
	xO6gr1TUx5zo7rfyCgrLAcTWw5aQejiL4GMiWE/fX7+p0ksKsRli8pK43wYBTrZAPkLa
	J61kIOfyq/1gdu60zn+fl3fCHApav0MA1kPgXl+b3dNKM5yhXdlCoSAnx3k+fReGMPaf
	7GxgdcMDnPGC36VnqU2S51HTtVM1mkCf5cpPsj4noNCWn+XWuQLlsMVR1WuXCjw+LoVn
	hZrA==
X-Gm-Message-State: AGRZ1gIX/7ldL1cOTh4wo31d4McYgYY2HlZUjF+BSUSz+KQvuFei118n
	OyY2uNf0twzoYiTfQDQQYEBJ6g==
X-Received: by 2002:a1c:8fcc:: with SMTP id
	r195-v6mr448514wmd.44.1540939166978; 
	Tue, 30 Oct 2018 15:39:26 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	y7-v6sm15133408wmy.27.2018.10.30.15.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 15:39:26 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20181029223207.31878-1-philmd@redhat.com>
	<20181029223207.31878-4-philmd@redhat.com>
	<20181030063830.edjacusffvgwvnt2@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc4b00b2-dda0-a0fb-e7b8-487065dbf6cc@redhat.com>
Date: Tue, 30 Oct 2018 23:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181030063830.edjacusffvgwvnt2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 3/3] arm: allwinner: Enable USB EHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Icenowy Zheng <icenowy@aosc.xyz>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TauUUif3FjzG

Hi Gerd,

On 30/10/18 7:38, Gerd Hoffmann wrote:
> On Mon, Oct 29, 2018 at 11:32:07PM +0100, Philippe Mathieu-Daudé wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> [PMD: Intented tabs -> space]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/arm/allwinner-a10.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index 0a8ac929f5..92ab66354a 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -116,6 +116,8 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>>       if (machine_usb(current_machine)) {
>>           sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
>>           sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
>> +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c14000, s->irq[39]);
>> +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c1c000, s->irq[40]);
> 
> Hmm, is this a companion controller setup?  If so, then this is a bit
> more complicated  (see ehci_create_ich9_with_companions()).

I don't have enough USB knowledge. Can we have companion setup without PCI?

Per the datashit [1] p. 215 "21. USB Host Controller", each controller 
share the same PHY. There is no mention of companion setup:

   The USB host controller includes the following features:
   ..
   - Complies with EHCI Specification, Version 1.0,
   - and  the OHCI Specification, Version 1.0a.
   ..
   - Support only 1 USB Root Port shared between EHCI and OHCI.


[1] http://linux-sunxi.org/images/1/1e/Allwinner_A10_User_manual_V1.5.pdf

> 
> cheers,
>    Gerd
> 
