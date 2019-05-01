Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6014529wrh;
        Wed, 1 May 2019 08:35:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9aratZsRr7n0DtJG5g596X2FtAjLQDtL7KQKnYv2k3P1ZRgQSsTArAeeejuKO1oo0ieEd
X-Received: by 2002:a1c:7518:: with SMTP id o24mr6971318wmc.42.1556724950594;
        Wed, 01 May 2019 08:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556724950; cv=none;
        d=google.com; s=arc-20160816;
        b=AugK7vxlMzp9syMHOu7pXFdfYgPwpCi3UziH2dOArOd/36lH7T4BsnFwo9qleIMFCQ
         /dTjIavJTz/t5epxceRqqSvTvpKK7Ou3QRR952BrNuebvspOh/AsAYG9mSBEOrff3lck
         EZ/dtzW2Afh0SB5W2KaX9SbOrLiXiMhW2q8yva9Bbbqr9+hxsIzsgwj39m3sZO0GEFvb
         FembXR5a1UYF+L5f1V653T3YU60S2pAQEykY83Asgr4Hza5+lARJ3AJcY2JEko0gJDNx
         AKI+Fq16Hg3kvIGeUIB5kRSqrwQG63ksQQHy6hdrz4bG0xXKQCymFhiFGRnod05qzbe7
         0/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=1N1cRdmZ3JMC/ufMiUPBMh2QUAsuMmLb8Ofy6IZ1/Ro=;
        b=Rhs8/7vedpSn/Bl00NFdMUFjdPuUF4C0UT/JC3VFjGywOc2qaxYuVuGIRSUN8C3uoP
         GQ1IGyr89wzO8cM3kx1lGAMUWrDQRpQSqSxDgyMB2o7CDbSLPuwIzsAayiH+7ya9VKqL
         nMmR/IT6Sh3rISWyP8snZSAqv/uASFVxXDf+zSZzsF5Um8sk3VY2wSNgQrh25K6g3Oni
         J2JG4QsNMIFB9yKkmpK1TvmVq2tupYnp810DwJmOM/3YW8xJxV7eZxkLzJJLmNRu7tgH
         vPk6WQwsiORELwD/kB17hh6tXpsWCZQJQAB+krJxHXvLjxBVuPDJKjNIfH8pMoAYdd4O
         GB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si27691033wrm.105.2019.05.01.08.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 May 2019 08:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLrGv-0000jx-Ju
	for alex.bennee@linaro.org; Wed, 01 May 2019 11:35:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLrGc-0000gn-Mh
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLrGY-0006do-LG
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:35:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLrGY-0006d8-E4
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:35:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id r7so5259038wrr.13
	for <qemu-arm@nongnu.org>; Wed, 01 May 2019 08:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1N1cRdmZ3JMC/ufMiUPBMh2QUAsuMmLb8Ofy6IZ1/Ro=;
	b=gzwEqDCY1u9Epdx9v0UJyLQNowsGLGf0YQmR8cHxBA/g8fbJjvvhn2cvN59N5oSKtZ
	t9yCfJFfI/Z5MK+HNbZQOczZPnwBTJGsj6v4qt+H7CfyJqwWZIk63z+ePnJJ1HEzVfaU
	IeibVu02ZIp6jlJbRxUJbwIRnG/N4EAdE+CJSsq2HxHhDe0BbNWkAFqM5iCOWN+J8/Tv
	XRKVF+iCZKzMMKoCq+X4VbWlKgGZoM1xfZKkznRgu2VurRcoluq2NnRXCddWq6enIqjY
	1mLoR9JDoxQLJO6j3kGgElIpYPLqWMTWyvWcaXc30VBuUNJ3MpiWdfxXmWfi849DWt5L
	n5xg==
X-Gm-Message-State: APjAAAV0BdZu2q+CoKGkjsRykKZeTO+9nmYM04ED2zM3XVDCJVq0TdeN
	f3l5up3s4cswWPF/HCSEm1fkhoiVZAI=
X-Received: by 2002:a05:6000:104:: with SMTP id
	o4mr8803478wrx.106.1556724925347; 
	Wed, 01 May 2019 08:35:25 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	r8sm18136564wrg.22.2019.05.01.08.35.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:35:24 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Cao Jiaxi <driver1998@foxmail.com>, qemu-devel@nongnu.org,
	qemu-arm <qemu-arm@nongnu.org>
References: <20190430181326.1314-1-driver1998@foxmail.com>
	<c794f5a4-470a-3f49-c5df-bd37d97d711a@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4c1ceb10-4dfa-7173-0a7e-1af919154fbd@redhat.com>
Date: Wed, 1 May 2019 17:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c794f5a4-470a-3f49-c5df-bd37d97d711a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] util/cacheinfo.c: Use
 uintptr_t instead of unsigned long in AArch64 arch_cache_info()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lSXHsWyZHRk5

On 4/30/19 9:12 PM, Philippe Mathieu-Daudé wrote:
> On 4/30/19 8:13 PM, Cao Jiaxi wrote:
>> Windows ARM64 uses LLP64 model, which breaks current assumptions.
>>
>> Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
>> ---
>>  util/cacheinfo.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/cacheinfo.c b/util/cacheinfo.c
>> index 3cd080b83d..ce6f0dbf6a 100644
>> --- a/util/cacheinfo.c
>> +++ b/util/cacheinfo.c
>> @@ -107,7 +107,7 @@ static void sys_cache_info(int *isize, int *dsize)
>>  static void arch_cache_info(int *isize, int *dsize)
>>  {
>>      if (*isize == 0 || *dsize == 0) {
>> -        unsigned long ctr;
>> +        uintptr_t ctr;
>>  
>>          /* The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
>>             but (at least under Linux) these are marked protected by the
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Maybe you can use a shorter commit subject, such "util/cacheinfo: Use
uintptr_t on LLP64 model to satisfy Windows ARM64" (or better), so it
won't be cut in git log (limited to 72 chars).
