Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1423022wrd;
        Thu, 23 Aug 2018 10:31:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaPHQ2NLcfeEW33qTMyi+j6+zYzxHs1yin4A+OCmIT6CKsbERBXuIlJHjOy4f1IjwUoYP3v
X-Received: by 2002:a37:a6d5:: with SMTP id p204-v6mr20345798qke.126.1535045503339;
        Thu, 23 Aug 2018 10:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045503; cv=none;
        d=google.com; s=arc-20160816;
        b=jH/Gc0JPr/zaNhfz3fEmyNHsSMG9lKu66MEa5cKLCi87rJAo7RcOPC/lJlUmrJqCAM
         U+N9eLwkJtBPkkziPsgAA437Qqb1rlvQy6c6+GP7NKfwvyzKcrPddFY0M76AesE/0Vob
         ZzfM0Z5Q0bt3yIiDOJFGWTh+NVlG/i+dO3g4tEoiEh2vMfv6rS3wyK43FKz4M4t0PtV8
         tmMtmi82aWKKG61sb5gRwWFWJYG7lZHTW1XKXTJzA3cdPJ7lseaXQVfSUJqjtZZExGUH
         o1b7OIMdCeFcrpnef74z0x94X/y5A0ds/xLjul9QLfjQKkIlQ2qqv3IVZAlmIyVJ2776
         VDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=4EG18fTs9mfjtR0ozuVPEVdFAurSRJFyNySc+Kf1MX8=;
        b=ZspkT0PJI9MAcPDNK+Mux8QddFMqHMEH0ugY8/Qe8sgDLix2HR6H93O+gvo/LAz3CW
         MGHd2TTZrGsyT2UIDOnQXbtgkwus+Q6GKs3JPhumiNM0BBJIhIAlCNyW5FXb+61DtBQ9
         NQo34q6uE2VdfdWzhsZhAfRlwwMPnikfjeGmcesQtIDDDv85GjZ4S9gB0xcnlamW1T8H
         hKfNItulCFdVuLh1K7OlJKl2612B2yXkvbcKyD/35OuhHPP5iwFgC5/UpnvrzQIiPqH8
         MSKISGL0NEgSccX0m/TEirbQEUFjNZYRq38NEbcsphPfmJBEzpDxIAE6RO033yXGoP32
         SW/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JKOwyCzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17-v6si4829179qke.302.2018.08.23.10.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JKOwyCzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstSQ-00054Z-Ot
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fstMV-0006Ri-3k
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fstMT-0007fO-VP
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:25:34 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:39364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fstMT-0007dN-JN
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:25:33 -0400
Received: by mail-oi0-x241.google.com with SMTP id c190-v6so10612786oig.6
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4EG18fTs9mfjtR0ozuVPEVdFAurSRJFyNySc+Kf1MX8=;
	b=JKOwyCzWa+okvl9Pxf02PBR5Ums84FVSm1Q+pgfiNCEAWiyf9EQEv7dHWjiAA7F2oa
	waa9qKnDKT77rg9xEBrRckjti20o6qR9jG1fu0aBHlxbTZMFkPH2cyijiJCCqMnrMc0b
	GGHOZirFiT9djzPof8PW6HXjPyHp8oOdaz/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4EG18fTs9mfjtR0ozuVPEVdFAurSRJFyNySc+Kf1MX8=;
	b=BJTq4hlIWjPg133gC15E86elqqdpnHy7qki3Hj3tHnXXaZ+nT09SeCan00v/nbdNb3
	sNDXbNimZTqFZ8aBgDhtPdoinFvmuJa/ab/igKPisGPgURC/aCTv4fWGPCTA5W9KsciK
	HigykzBHEra+51jX+6wJbiFDHicg6dTW9Qw+/moHf4i8CW4gAOm/JDhR/1B7cE8WyLQn
	VX4DJPDxGn4CPu7IOyFu0Irfbkjt2+I8QafTP4DrHLW4sXMc/v56S2PnoIIDDbtidF0Q
	KcikTYrtbB9QrYGNIGQdNqHBLn3jM0niDcl0J0ObZeHEeRD+nQpe5M90fcTH+aOvdwV0
	Ej3A==
X-Gm-Message-State: APzg51A9jm0AswexoGKs1fAvkplGja8MSNoFmgofS5NmjftxAZRNNXmt
	tdo2YUyuvBE43YZDEUyu0Mph4uXqAMvlQu589Rl3pw==
X-Received: by 2002:aca:dd0a:: with SMTP id
	u10-v6mr9485834oig.171.1535045132815; 
	Thu, 23 Aug 2018 10:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 10:25:12
	-0700 (PDT)
In-Reply-To: <6a28d02d-b5b0-62c1-47b7-fd1bcb4779c4@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-13-peter.maydell@linaro.org>
	<6a28d02d-b5b0-62c1-47b7-fd1bcb4779c4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 18:25:12 +0100
Message-ID: <CAFEAcA_TojNCRTCsaQFg3QMwS7vtn1zABimHJY8zXmoKkoEcyA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/22] hw/misc/iotkit-secctl:
 Wire up registers for controlling MSCs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qhk8WfItB9be

On 23 August 2018 at 18:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/20/2018 07:11 AM, Peter Maydell wrote:
>> The IoTKit does not have any Master Security Contollers itself,
>> but it does provide registers in the secure privilege control
>> block which allow control of MSCs in the external system.
>> Add support for these registers.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  include/hw/misc/iotkit-secctl.h | 14 +++++++
>>  hw/misc/iotkit-secctl.c         | 73 +++++++++++++++++++++++++++++----
>>  2 files changed, 79 insertions(+), 8 deletions(-)
>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>>
>> +static bool needed_always(void *opaque)
>> +{
>> +    return true;
>> +}
>
> We really should either make NULL imply just this,
> or export one copy from generic code.  Soon...

I sent a patch for doing the former, but it got some pushback
from Juan:
https://patchwork.ozlabs.org/patch/954507/

thanks
-- PMM
