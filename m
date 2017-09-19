Received: by 10.223.172.38 with SMTP id v35csp4731593wrc;
        Tue, 19 Sep 2017 02:49:20 -0700 (PDT)
X-Received: by 10.200.53.35 with SMTP id y32mr1055359qtb.276.1505814560522;
        Tue, 19 Sep 2017 02:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505814560; cv=none;
        d=google.com; s=arc-20160816;
        b=Rv7OSCF4HwIJXMwDX52/mkCIpRsDY3ERrO4rOS55qliIHCyd8gyemBjmg9zpWd6+qk
         46gyG+xZ4Ena/qQwV1tcSlGJu9RP9R9IjHBgsFLzziWwZKV30+3tbWYsWssL24+MylgW
         NbH2dZdsUv4hWfQR3IBUsv0G9HRAQR/vhIKQQGlWYbbpgdIxQsivWn9sgjZi7V63GuFL
         XEQc43AovULkQkSHJ6hH/oqn4t9VJjh13o96ilGmbH8043D8VDGmX8VZKXkzDfc82SYY
         9nKHlrIiPyLtzO9jJcoMgavY17YORccYi6CSjftiY78GLH0dtod5dMBndY1ZmmOK/m4R
         Cvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=0+mO3Tsj2Q/jUMuJp1KGWpUTFqGxXOMjcZzktqkm+f8=;
        b=g7jCsRWDFWl8I31AIfr4f438qb+QGffOcYMUGZQg01mFXGDlnu5dYnEwqLxYxGxVtV
         /XzM7Vm2vLg9FmWyNtBp7Q70gdmsRhaO5ZYrFt18oa7Hlegm5mRCcRIKSjF8Qv3YEZ/W
         DPTjgfNPhaW4YiFb/bPJnKiZZ11Mqy6XBByJM9TQ5j+BtQcbT+lpz4UkCBtsjQwtbRgE
         GqpzPDtZ52qMY7lRNpPGdd0/co/4ldF6p4nOJK39rraXdqGXrdyNtBdQrUmHVa1g6cNZ
         HlHEVvzpchNmu7e55qG4Ar69UY9+6xAw/1VT+mAO8t7YSWcocjlRJLYZtw6crxdjUmMB
         k2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xi9mlq2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si4071986qkb.458.2017.09.19.02.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 02:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xi9mlq2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duF9Y-0006c0-CJ
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 05:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duF9O-0006aD-7a
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 05:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duF9K-0003o4-C2
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 05:49:06 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1duF9K-0003mj-7N; Tue, 19 Sep 2017 05:49:02 -0400
Received: by mail-qk0-x242.google.com with SMTP id g128so1930884qke.0;
	Tue, 19 Sep 2017 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0+mO3Tsj2Q/jUMuJp1KGWpUTFqGxXOMjcZzktqkm+f8=;
	b=Xi9mlq2OunDtS94XtZoozVAdx/NnTnVUjO13Ipv0GJOHR4NXDhiiRdZGiRHZue1W4K
	cS/ocVcWHzcsuH83FETqYROanDPyGrHHGKTyLNo+LNmwmn245VFXiTH1pezNykPM3pPx
	FqajGmTryy33bmzVpyN+eRlztE4C9C27oqqC+jFg7C5VcCIGxSSlVJry3NPwG2/UqjqX
	6+Zcy09sB3CAiT6Q/OQDH66zrnjkEJNHalTZ6WJqffkjCxdms+z3uS2Z6B6lQpiNEuUc
	xE/QrQpHUXdaGD6rNnSHn13wxJbDInB54h7TZt7HMhTgimhz9S18vhWcsXTK9U5soBlb
	wIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0+mO3Tsj2Q/jUMuJp1KGWpUTFqGxXOMjcZzktqkm+f8=;
	b=ONT7lvP2Vd+6NhZFT0Q2MFK8yRYzHAzUmNqtTHCKgLhANNzaWLve4TLRWgFy4myZEt
	pxLcuSHbsVt8ekua2BJuxmvxDaQMVOnOty2jPpW50QQLXg3yQzoGbNri4MWH9qeQnHqE
	OZD38Y2ABZnFDIygix7o3cKOMCrvjL+lDRtVOlxXrX+++y+TlOKeNNREa7vShlvw6irs
	IqJ08OzCCWVQ+/DMeJeHBv5C3wGZs6Gji2WM+R5vQNQVBAAaJ6SS8fhQI776lmIEAHsw
	wIpyPPk+evFnZ4tm6c7ly+s7D7Px5WIL2dvJ4xVqOCjFZUpN+skY40v3vDmKSo4aO4IF
	Bz7w==
X-Gm-Message-State: AHPjjUhVKxhr5C9GGFRVqyCsZArY0aCHjZA1EP9DlGzEwqnsqPkqJrlQ
	jOZtFYVGEYhQo0k0IWkYOwg=
X-Google-Smtp-Source: AOwi7QDx8T/PZmDMwsLU3WnwY1AA2OGG/7rLEWUz0cyEZFGuZ7vP3dnqWILIc5Zeo94w9WIvXdvNYw==
X-Received: by 10.55.215.20 with SMTP id m20mr1075241qki.137.1505814540279;
	Tue, 19 Sep 2017 02:49:00 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	y11sm6503580qkb.20.2017.09.19.02.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 02:48:59 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>
References: <20170918221124.17159-1-f4bug@amsat.org>
	<20170919020837.GA11534@lemon.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8cc735e-3f23-5a0c-4e31-d253111fcee0@amsat.org>
Date: Tue, 19 Sep 2017 06:48:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919020837.GA11534@lemon.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] msf2: drop cpu_model to
 directly use cpu type
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +KkZvQlueLfJ

On 09/18/2017 11:08 PM, Fam Zheng wrote:
> On Mon, 09/18 19:11, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> after Igor comment:
>> http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg04709.html
>>
>> Fam: I'm trying your patchew "apply over series" feature on these 2 series,
>>       hoping they get both applied before my patch:
>>
>> Based-on: 1505318697-77161-6-git-send-email-imammedo@redhat.com
>> Based-on: 1505762601-27143-6-git-send-email-sundeep.lkml@gmail.com
> 
> Only one based-on will be picked up, so this doesn't work. Patchew basically
> applies the series on top of something, where something is the result of a
> previous applying. So it can be thought of a chain.

OK, here I used each series trail, luckily they apply independently.
It seems your script only kept/used then last Based-on.

> 
> To support multiple patches, a different approach needs to be implemented.
> 
> Fam
> 
