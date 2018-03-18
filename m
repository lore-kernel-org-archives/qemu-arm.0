Received: by 10.28.91.67 with SMTP id p64csp1985824wmb;
        Sun, 18 Mar 2018 15:57:33 -0700 (PDT)
X-Google-Smtp-Source: AG47ELufJpzdImMYx4WcPf0ZRR16gjZhaQku5PGtYC4cOw52iHT+gEHqL68+Wy+6nFgs5wu8RMqq
X-Received: by 10.200.39.181 with SMTP id w50mr14630402qtw.206.1521413853500;
        Sun, 18 Mar 2018 15:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521413853; cv=none;
        d=google.com; s=arc-20160816;
        b=gafLQef0tS0/1mrc4Le7OGQa1ynkCZbwluFppGYpVquNfX2QG2zrds0zNjLV70ndFr
         U9qk+dB14xofco2MgSFAhz9DlBg0DcxDE3RVXSoyIHJ34UlaiiHpLA4DYLM0RwkfFHt7
         We+m9A8EwtcQd27/D8Q1ADmAmjnhD1R9KPir0ZvVpxA5MlaKNTXFl/9uhqWd5BigcWuB
         z0BSi3ZWIb4tf8XIeD1KHk+n6uZ6D/f5ZYPw070stuyHmuI53ZlesNc5cz+s6hGoXlU0
         b2N8tB/pONv3753Ahy78tVer4TRLhNXKK4ZQ+xeDvMlGazc3Os7ZkMkSWEQioLrCNFYu
         SD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=GH89oNFLOFrOQM88iJETsysC95lDvrJWY/Cn/Ci/fdU=;
        b=QsTX6B2cyQEfM+HvxdsewjX73W98Cg8y0DThOAJJxVY10TPLKd3cFjqXyO+sLFLXXy
         Cs5GiW/bylL3A+oNJLCYFRSKIahfe5t1bDdRSRtTPdHzWiYtrA+Xe7gycYQsuJueIUiP
         Zh3zpYSIdTnte2MBZDXWDxIU8ojqCAVl0ti8VeQNcwyqSqikYBw6YNlGxuGgvQquIysP
         OxOrhdFp5ejzFT06EOXitxaxxUTvcaWPXzZZYRtIjaPcIhQS1l9QX3ZDb3HJA7P3J8Yz
         2uUzGI/+YKDk6x4MbSyQHc40KvaSd6tny6tGnmn85LNuBtic+6or5XiemLhxjiR8gdn8
         KzKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bbdBTZkZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si1845829qkt.393.2018.03.18.15.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bbdBTZkZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exhF7-00025T-2Z
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhEr-00024S-8E
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhEq-0004fN-Ib
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:57:17 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exhEm-0004aT-5U; Sun, 18 Mar 2018 18:57:12 -0400
Received: by mail-wr0-x242.google.com with SMTP id d10so16785584wrf.3;
	Sun, 18 Mar 2018 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GH89oNFLOFrOQM88iJETsysC95lDvrJWY/Cn/Ci/fdU=;
	b=bbdBTZkZgsXPpZgrpCdlhX1uNOQscIq+oepG07Qkrtil4s85AuKLygG5Zj/TiXn2Dv
	ou/GjoLkm0xWFImaSQ5QrKbFv0AyUGN1lp+w3ALfz2CJxSLbt5J/2TH/2H7jMHhnwrYj
	kioRLbOUpoSuU1y0wA928DXLx6Uzhpolp0ahrigJzFmFicLbPNa9X0OUaVzgcyEUIaun
	Om+GY7COgdEhF1vo36nMK9LscYveML1vFdFube5WtTWyoII1K8NoRO8ZUISl+9DUNlw9
	mnwOfXEpKXxlWqQK29sxD4Qf2wUx1NPz6tuPknuzRHMQ4DwLF6+TScT9os5OUhB+2Eq0
	7DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=GH89oNFLOFrOQM88iJETsysC95lDvrJWY/Cn/Ci/fdU=;
	b=jffWu6XtOkgtWczSSNRnAxDFpO0ugkfAc7SfWM9cHNfCuNa/8akhul/wDda5AC+DLs
	+krY51g0QepEZkvnbXWALkMjQgKdnHyh4wFSu8cQ0GTmXatoNdEK67vhbndYBdATwAln
	UKlDAwiQO1mePcpzd7Ct7vHTFqs+lMe+HHXsXO6yNrXHtWUX+9vJUJECIzj8EL5tj/n9
	WT/8DWTp7HVQYzB7k7xBQUbfruCEyUg9obT5hIdCXCyyJo2QUdlphngOqF2u75dUfOBW
	PreuSoe9Ja0jb5BrU3U9ohN0llUDcbyoEdJwyl3Tqc4DxYgMj1EDnijh2hq+J9qwmSxQ
	IXLg==
X-Gm-Message-State: AElRT7Fa2w9KMl9Ui3SlGaiYGlrduJ0ZMlqJp5aHrh8TyBfEgbNi3nQw
	3/Csrcmn73s8soMwpnUH1io=
X-Received: by 10.223.197.1 with SMTP id q1mr7223197wrf.268.1521413831048;
	Sun, 18 Mar 2018 15:57:11 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	104sm7629940wrl.26.2018.03.18.15.57.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:57:10 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Aaron Lindsay <alindsay@codeaurora.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
	<aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d8f5d183-dfd4-c63a-999a-d336dcd352b6@amsat.org>
Date: Sun, 18 Mar 2018 23:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH v3 01/22] target/arm: A53: Initialize
 PMCEID[01]
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
Cc: qemu-arm@nongnu.org, Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LEaA5W8PBie+

On 03/18/2018 11:35 PM, Philippe Mathieu-Daudé wrote:
> Hi Aaron,
> 
> On 03/16/2018 09:30 PM, Aaron Lindsay wrote:
>> A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
>> pmceid[01] are already being initialized to zero for both A15 and A57.
>>
>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>> ---
>>  target/arm/cpu64.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 991d764..8c4db31 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
>>      cpu->id_isar5 = 0x00011121;
>>      cpu->id_aa64pfr0 = 0x00002222;
>>      cpu->id_aa64dfr0 = 0x10305106;
>> +    cpu->pmceid0 = 0x00000000;
>> +    cpu->pmceid1 = 0x00000000;
>>      cpu->id_aa64isar0 = 0x00011120;
>>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>>      cpu->dbgdidr = 0x3516d000;
>>
> 
> Maybe we can move this at a single place in arm_cpu_post_init():

Err, arm_cpu_reset() :)

> 
>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>         cpu->pmceid0 = 0x00000000;
>         cpu->pmceid1 = 0x00000000;
>     }
> 
> Regards,
> 
> Phil.
> 
