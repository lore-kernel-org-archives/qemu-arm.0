Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp281084wrq;
        Thu, 7 Jun 2018 18:13:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLiKqyzIkGug9PC0Zgp1H6FrLeGn3famdadhEzeKILnSfaupaiv95uxFylSG64B1I0/up/T
X-Received: by 2002:ac8:3338:: with SMTP id t53-v6mr3850611qta.312.1528420396677;
        Thu, 07 Jun 2018 18:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528420396; cv=none;
        d=google.com; s=arc-20160816;
        b=jaSptnsp3HmJxeGH1emdG2sSnGHq45P/8YG5TVDMxHNLyZbmf/7yRCdPpBnLtAZ6NJ
         rh3uUC6gAKHxb+GzcImCWF8dMywqT9U8LDIl84ItuMp64panx4l8nbODZU8kWtdzrBky
         bd4Q19seXw/35SBbEKGdFL9+MWBs4QeuTrg/70mwTld1KlgruR1AKcmGIggEKA3T9gw7
         meZDnD2u8WrcTLts2mWxYM4VxuCFl/5knboAojA3IhZdwiODSGRm3vQsy6FYRLTxVMrs
         Kv6aOqM0ZKy89W8eEarMaTo6iHZIo5iuj5yGPN1hW5lq5BvlrZyjd1C1D6ojgq6FARdF
         e3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=v4T4jFZvUtwg9yrmPiu2WyFKgUCbO4Ziuy02u0PkwWo=;
        b=DpmuRJy5DLCG3/Kehzf1vknh2XVpnSCbpDPcEjE1Iyvqi8tMcwrWtrSTBihHDzyGGj
         bsoB3R4Ky+qLUR0CsHN408K7KgnSlzQbLbmGUhJfaFKneAWh/pceEnliZowpepOFziAW
         chfLCAnZJG/dchBKf1cJoCJ5XWCvJBHLyOPY7LOykn51WKeL3tGtkHFgNpt4hE+PFUv7
         yRN34Y+FFfDIOL7/NSeL17D8cTf7Ima0izAqPPO6OoCHOPpYBONI6ss4zafd8OKMKwiF
         7HmswcNrrCBkJXuBpBw33Z8dNqYbmQRoSzXCSyPEzPAXuVowrF145g/7T8z6KytVk5Km
         4HyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ekdj6Uc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m24-v6si6617115qtb.86.2018.06.07.18.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 18:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ekdj6Uc1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fR5xs-0003M6-5C
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 21:13:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fR5xi-0003KM-8Y
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 21:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fR5xh-0008OS-6J
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 21:13:06 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:44598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fR5xc-0008K4-OZ; Thu, 07 Jun 2018 21:13:00 -0400
Received: by mail-pf0-x242.google.com with SMTP id h12-v6so5759654pfk.11;
	Thu, 07 Jun 2018 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=v4T4jFZvUtwg9yrmPiu2WyFKgUCbO4Ziuy02u0PkwWo=;
	b=ekdj6Uc1FtrOqbJa8/rGXHtoUWL5UykOTLEjisux40lCGlh5tulcMfO+5RqxyqIWRb
	ZxusOGwuFbw/DJ7QtMG2GCas/CLIxn84gPWubIM6LVdw6nImeyQy7VTu2Rk8nNbP9aVy
	J2E2+DpvqAcNVNKjtrLSlemOSb1bsCw5otDg71IrtPJlaVpVCwPSbBh1ZiIUpAswhi1A
	FEyMeBBlPgTyQtiH/2OnxRPvgYvRCz3tTkR1RF0IYRXjrzdFl/e8ofoCDyXFC9uuR5DO
	Ce3hrUloWpB2My6VkJUlpRDemYg3DY2DCLLN6U7VCxT6MqERG/NXClvGkYcU/KDPk4JW
	n9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=v4T4jFZvUtwg9yrmPiu2WyFKgUCbO4Ziuy02u0PkwWo=;
	b=krP9xwZzbnEAic+gIOvsIFqCC8XBvzR2qs+71FJQhbMUhTZcyk3j72vzgOXltlqm27
	aSr0ojsNA2RP9Yw13MQDFDPmRaGYCwvnTkrBYBu/eSqUX9MzcFmxHhpuHxqSee0GZXwt
	ZJ7nrzxZfPb8pPo68i5zjuATcb6YmciBqublyP7YhGcB698QAiysCQnmZXM1sGwLkaHU
	pLxV7+6XsBNrqyLm2rkLCppk+vsse/0kJwC3M7r+j54IuzoYaWkMUDBUqaFxX8DKqCVy
	oLainUUVDu3kY37w5lbomzdK59LRY/lKLpYHYvtpkSlK2ENhWTP6bSS6zyyMKUnb+V1Z
	9u5w==
X-Gm-Message-State: APt69E0JvU01s9oHuLONFamW0WcZ1ltBl3F+KB4KnkZ4Y9qGW2oWOTb9
	atViNjdkOxRkmP8zH0AoQiDdXZLx
X-Received: by 2002:a63:9543:: with SMTP id t3-v6mr3320435pgn.77.1528420379855;
	Thu, 07 Jun 2018 18:12:59 -0700 (PDT)
Received: from [0.0.0.0] (67.216.217.169.16clouds.com. [67.216.217.169])
	by smtp.gmail.com with ESMTPSA id
	b2-v6sm66017181pfc.44.2018.06.07.18.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 18:12:58 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
	<a1e699ce-c6c3-c21f-41eb-5664f52c2b86@redhat.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <e68a81d5-d13f-2cfc-ba52-98abe6768735@gmail.com>
Date: Fri, 8 Jun 2018 09:12:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a1e699ce-c6c3-c21f-41eb-5664f52c2b86@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/smmuv3: fix smmu
 emulation when guest smmu is in passthrough mode
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
Cc: jia.he@hxt-semitech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YQM7C7L4DIt/

Hi Eric

On 6/8/2018 1:06 AM, Auger Eric Wrote:
> Hi Jia,
> 
> On 06/07/2018 03:38 PM, Jia He wrote:
>> There is an exception when I passes iommu.passthrough=1 to guest's
>> kernel boot parameter(host QDF2400 kernel 4.17, guest kernel 4.14).
>> The guest will be hang when booting up.
>>
>> When guest smmu is in passthrough mode, entry.perm will not be assigned
>> to flag in smmuv3_translate. It seems not be correct.
>>
>> After this patch, I have tested in 4 cases and all passed.
>> host smmu on/passthrough + guest smmu on/passthrough
>>
>> Signed-off-by: jia.he@hxt-semitech.com
>> ---
>>  hw/arm/smmuv3.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 42dc521..5c46102 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -560,6 +560,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>      }
>>  
>>      ret = smmuv3_decode_config(mr, &cfg, &event);
>> +
>> +    if (cfg.bypassed) {
>> +        ret = 0;
>> +        goto out;
>> +    }
> Thank you for spotting this bug. Yes you're correct: on bypass we
> effectively need to set the IOMMUTLBEntry perm flags.
> 
> Reading the code again I think the error handling logic is really
> confusing and if you don't mind, I suggest I submit a global fix. On
> bypass we should rather have a bypass trace event issued instead of the
> translated one. To me the aborted case is not properly handled either as
> we are going to record an event whereas we shouldn't. In case of
> abort/bypass translation structure decoding should rather return 0 I
> think instead of returning errors. Please let me know if it suits you.
> 
Ok with me

Cheers，
Jia
