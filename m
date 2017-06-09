Received: by 10.25.0.23 with SMTP id 23csp3230969lfa;
        Fri, 9 Jun 2017 14:29:15 -0700 (PDT)
X-Received: by 10.55.98.145 with SMTP id w139mr24756514qkb.106.1497043754920;
        Fri, 09 Jun 2017 14:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497043754; cv=none;
        d=google.com; s=arc-20160816;
        b=bXNwi4JGMjN4s49op8y3iwgNDhjDXIwX6osrkxXkfiX1aaPFLrzIpsVEmQru/n0wxy
         S6+96Rdua8ILl3+OMjWyocFXmGER7p3ZWy4zE+JNKOuY9VZhSndVV5xaE69D+fQFnuUN
         WO1guqxw/nNXOgzDYw/r64OLOPj1lNAAXaqfaZBcd6PmJ/iTq/5g9o9gAefxg8ko9sJU
         4OeHwyqlm7e1NzjbqQwsDgNlAV84uiWtLbYiyHmnI1DVnOFLn2yZpaJ1orBXLQ57Yui7
         fCmDUQwTL+f3sWSFuVC/Ds58gq5gU6bLnQy+VsaF5/BKU1WqdCD3lbQ2P9BHdOGahRSi
         0XNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=O4goqAvWegVxieUjVvyGm/bhzONuui00+D2Tx9QWh20=;
        b=h9PRzspVvUawDaYQtQ+vtVktxodR3S2UqCEaLY9AfaY8AECid0SRPy86Yru/c1m26W
         2xZ+Hnh5x+6S8/rfjerIr/jkmVNnYF9RJWJdQs/1BbZLir3tUj4jtFSLEa89mfHPV9Fe
         2MLJCODs4DqpvCPZcJ71WuwDayazanlTgMsqkHG1/D0pu0I4R2WSoCeA4+7OIzmT/0Il
         RgiogoPs5QWYrPaaFgcuzJaE2iIuGgt0jFaGu24U4ymVeBS400TQ65sdKILufJe6bZin
         OX+NwKJEXYWzT1I9f5pNwPm+XBz3BKmUHDzuNuxr2o7LBFVoh8WNecNaayorK4RsWHk4
         eUFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r23si2138421qta.112.2017.06.09.14.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 14:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJRSy-0005tc-8I
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 17:29:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSq-0005t2-P7
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 17:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSn-0000FD-L2
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 17:29:04 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRSn-0000F6-Fx; Fri, 09 Jun 2017 17:29:01 -0400
Received: by mail-qt0-x241.google.com with SMTP id x58so17825361qtc.2;
	Fri, 09 Jun 2017 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=O4goqAvWegVxieUjVvyGm/bhzONuui00+D2Tx9QWh20=;
	b=t+3o20Co+29bwduZDwd2WsgBH7btyMpv5BN6MwSbzeim/ScJGyO4S/466QD8nnI7sQ
	QLEzngVp8DF7PZjbhn+oxCCFAIN1PxHnRUZcY2hkG/wo/av++apyIwCzoJ68xNCMQXcC
	KkiLOrPEndM0H4SUzL2YIjM80zRvy8256w+lUdf5/qljUmnsnfExKdlwpjER+3P/oY3u
	C7pGbKBu5apOuvw7jdvO/dM5BSAlW/AVgkuorV/+owNXe2lsamCh4+lsdgkxeek9QdPM
	Ovkq7q3X96dqn7P5Lg2z2cvJqcM7uzMSrFZLyXlXezJt4rqgHdp5tfWr/o5RH0rZoI08
	LPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=O4goqAvWegVxieUjVvyGm/bhzONuui00+D2Tx9QWh20=;
	b=QxQNMFVAVjsbqW78Cf5fs+ukBbagdCkEeYDbNl3we/SvlVmX1lgFkpl0Dofoc6psBA
	CpRh+QphYPG4xsyOovFTEn0uy7FF2nDC0/A49yUQkUcxgooKwSc0NvybKwTGzbu7QW3D
	n8Ugb+9jI7BW9A91KNR4VtzrPPdHOad/w2FFOSSD+R2OjS1FwUlByz9SqkzbUMYRF519
	U4K8J7lv3RUMy/KPRTUSfIYuKnweh0VwpaEuesmOuAb5S3Y7u/ag7vfLXc0kWaE4BclE
	ORfupmWDWQ09jBlpLSJ0dBD3gzBqARtyQa+Tc5/Trx0WHpkZ24nsn5qk/gO9bzcQRuoC
	y8+A==
X-Gm-Message-State: AODbwcC6IQH7+8d1l5aI/Y3IZTIc9J8wPFRgXvh1dCslWiJuS89c0Jpc
	uY1Anj8LzffFpquXOwM=
X-Received: by 10.55.127.199 with SMTP id a190mr55970635qkd.100.1497043740675; 
	Fri, 09 Jun 2017 14:29:00 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id w68sm1555133qkb.1.2017.06.09.14.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 14:28:59 -0700 (PDT)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-7-f4bug@amsat.org>
	<79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da9abd44-1f8b-2c1c-e63a-3ca706c95865@amsat.org>
Date: Fri, 9 Jun 2017 18:28:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 06/11] hw/arm: removed unnecessary include
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
X-TUID: +8ZOu3FW14vg

On 05/23/2017 11:58 AM, Michael Tokarev wrote:
> 09.05.2017 02:39, Philippe Mathieu-Daudé wrote:
>> "exec/memory.h" already includes it.
>
> I think this sort of include cleanups isn't really necessary.

Some are useful ;)

> For a regular include file, it's better to include it if the
> .c file in question uses definitions from there, no matter if
> other .h files include that header already or not.

Ok. This one was incorrect anyway :( thank for the review!

>
> Thanks,
>
> /mjt
>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/arm/arm.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index a3f79d3379..b9c11d3fb8 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -14,7 +14,6 @@
>>  #include "exec/memory.h"
>>  #include "target/arm/cpu-qom.h"
>>  #include "hw/irq.h"
>> -#include "qemu/notify.h"
>>
>>  typedef enum {
>>      ARM_ENDIANNESS_UNKNOWN = 0,
>>
>
