Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp939346wrq;
        Wed, 6 Jun 2018 08:06:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLf4aaTpJOoCL/jDooYdz+aqF2dcKbSIAZalc5oEGU230NsUcYH7eMreUI6my0iwrEXFWGf
X-Received: by 2002:a0c:86e1:: with SMTP id 30-v6mr2926121qvg.143.1528297604865;
        Wed, 06 Jun 2018 08:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528297604; cv=none;
        d=google.com; s=arc-20160816;
        b=F6I2v76KzJELADOfL26XM89fhnM/X7d7fgDCH4Z3cDpOizHW+uTadGWHWuaRQBy1P+
         p/tBHTKjFynUO/ixFeYYcz+i1/wt6HUwK7ngOPLQ4KPCarDeF4ctFbZXxYdYdsHDsSva
         TQknmBxFLiCfoav2s2iiND15bWKEXa/6+mBeXuwdGCc4mStnENPInUqiX4e5OuNdQ8Df
         OKGGHx4xgsY0VF+IyWGjio+MUKtPDfEufBE/EitR0gUQ6q2mI/P0IFFKpcclWAovsFi2
         NmaeQ5XpKvfDSPHgBivus5nk168okmF1f2fhktVJAxZRQmmcqI4iZu2UGHXlLFTNonOP
         p3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=FoAVI0mUmjSIlpONpr8pZ2tBYW2YVH/GNM2v4CvSamQ=;
        b=oExBh/FOTAZP4ceEx9X/Tz84V0jEo0yiOPuaxDXL+PVZGFGdssElyu3RohuQWReayS
         1W7grcNi49ugeHvxml4V+mI1WeJ8Cp2xbJz81adWlfEqTzhSVEKgMrs5PQ0zkYPIzCIG
         BC39kaGNns85E5GlI/QzB09ibsfll5CIgLHSJozR8yheOmh9Wc70bi53Fed6x9t3Fkaj
         KeMOYFcsYrOpFvLti2oqQsaRB57c/Ckhe3r4wom7Utncpgg7pFU5w+1Q2O4ehTacj7oH
         uFaeA9g3NIpTNcnu+iZNuIx9UACAfuhMDRBYysl66HXzc5nXgmJUaUjBp9nFZvrUq/wa
         LLig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t0nsy9R+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10-v6si7753654qkh.150.2018.06.06.08.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 08:06:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t0nsy9R+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQa1M-0005bY-Az
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 11:06:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZxW-0001jQ-7v
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZxO-0001Cr-CV
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 11:02:46 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:41759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZxO-0001CY-7v; Wed, 06 Jun 2018 11:02:38 -0400
Received: by mail-qk0-x242.google.com with SMTP id w23-v6so4123498qkb.8;
	Wed, 06 Jun 2018 08:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FoAVI0mUmjSIlpONpr8pZ2tBYW2YVH/GNM2v4CvSamQ=;
	b=t0nsy9R+G0j6LAobDJKBdoZsO/sO0PeGdLLA3OsBgblMqwYMgZDkNHmudv9B1XVGdm
	97ACuxiB1uuPw5ZU21VfN4HDws+E8u/SY6saCdt5yxpM8NnmvJOjC/Gw9eNOBzWBNhtO
	H/cdm8fCdEgUxsLA8Vtz9Vt7rSi7qfEOR1I4aIlH3vmURasOFgtq4cSljaxfC17RNh/W
	wPyyoeF1hhfOyijbyO280bvriOHUo6OtSN8oUYpm2JjVsLAP9kqy3ksSc5v+AQZL10T0
	8XSG+MwDMUW87j6UuI+6b8y3ClfA71xd1XsC/f3jgt8ZEYuF/jukmArV059RlhzJPzw+
	ISfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FoAVI0mUmjSIlpONpr8pZ2tBYW2YVH/GNM2v4CvSamQ=;
	b=WgsH9rb9ddBq2AGziROXn+vkzynHP9BhGQwQT3ulE0QNhky9jJFzT+lUrflczzi6g6
	Vsel1Qt13ON20ITV8Gkby8s5/e0uPuZyNZaihYG2VVAzQ9Gwtq2zDo0ME4IRf2A+3nib
	5uE2WzIU7DDJ+BTatknG9sn+ggzI/52/Df2xnuGWmSRcIjKzT5cXycJZXYS2aTy5sol9
	0Jp0eYDzJh0kwSoGFH3kMbKRZZszNwpjJTVlb7HtTcFOHuJU00Sw2XxRtg8Qk+lxeEfn
	Y+Thvzp1JoUTo1sKUP7jtLdjtnKiRVfSk2+w3Dm9uiwkKfLa2nYtQPC/lRsfzUubBdDD
	0uTQ==
X-Gm-Message-State: APt69E2auQ3tQeaLZc3opd83AgxZFjw77GBn4UbIzAXCdrgeYQ/JDHwd
	Tyo73krvhuDFowKBg0nICDk+cD10
X-Received: by 2002:a37:1904:: with SMTP id
	k4-v6mr2695789qkh.370.1528297357522; 
	Wed, 06 Jun 2018 08:02:37 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	a62-v6sm28611389qka.11.2018.06.06.08.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:02:37 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180606144706.29732-1-f4bug@amsat.org>
	<1160f838-5625-b9bf-6c34-3071ed185074@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0c5018d5-7e87-bba1-7522-c8020277bde0@amsat.org>
Date: Wed, 6 Jun 2018 12:02:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1160f838-5625-b9bf-6c34-3071ed185074@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Adopt the Gumstix
 computers-on-module machines
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ni5Yqt8tOjOE

On 06/06/2018 11:53 AM, Thomas Huth wrote:
> On 06.06.2018 16:47, Philippe Mathieu-Daudé wrote:
>> These COMs are hard to find, and the companie dropped the support

"company" :/

>> few years ago.
>>
>> Per the "Gumstix Product Changes, Known Issues, and EOL" pdf:
>>
>> - Phasing out: PXA270-based Verdex product line
>>   September 2012
>>
>> - Phasing out: PXA255-based Basix & Connex
>>   September 2009
>>
>> However there are still booting SD card image availables, very
>> convenient to stress test the QEMU SD card implementation.
>> Therefore I volunteer to keep an eye on this file, while it
>> is useful for testing.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  MAINTAINERS | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 41cd3736a9..1825deb762 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -491,9 +491,10 @@ F: include/hw/arm/digic.h
>>  F: hw/*/digic*
>>  
>>  Gumstix
>> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>  L: qemu-devel@nongnu.org
>>  L: qemu-arm@nongnu.org
>> -S: Orphan
>> +S: Odd Fixes
>>  F: hw/arm/gumstix.c
> 
> Great! So we can also remove the Gumstix entries from
> https://wiki.qemu.org/Features/LegacyRemoval ?

I'll remove these now, eventually adding a new Gumstix COMs
wiki entry when Avocados tests are merged, although reading
the tests should be enough.
