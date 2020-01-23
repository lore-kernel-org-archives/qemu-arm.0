Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp460668qvm;
        Thu, 23 Jan 2020 11:16:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHXmiJ+fwCi4if10S+XM7mxY6i70Txsai9ROxsarNfUnhW+vaioPsasT95mhJMnUijLh7i
X-Received: by 2002:ae9:dc82:: with SMTP id q124mr17910488qkf.20.1579807015285;
        Thu, 23 Jan 2020 11:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579807015; cv=none;
        d=google.com; s=arc-20160816;
        b=t82+zZCloz/z2lGRslra/MvVrublGJU6+PsCiuf8tqyoKPQeqQq1xinQhq9ofFLRys
         KV+EBq4Qp+F6Frwf61rOlNTMCKEhHjMJi+qSnLAO+XuclRlunY77Pm2RUvHSsjgpzmoc
         KFTY8siUAL0K6TavDTqsH3mgK6/4SOIWWvC8+3oas3sblBzoo1Uo++X3Eceh636JYCKk
         FsccODMxewHOjnA4em1mW86lW2NWdS02Qu+W1dyrEL3F9jT/Ob4EGL98Y7wWjnwGENVr
         /4+LUL3m4M8rxwEWK2CnjSGYAgsbdUtIYTTKi1CeEJUvxyNggB7VQKEURjwTFS2YSxrp
         chxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dt1vx9CQ8Rq88eZh2Kp4Sz9fZc6c3t91NtQLNsBP9SM=;
        b=lbytRJAq1yU6O5974nvfH4m/+UixjNXx3Kh1uxJP7xol9/Hg2r7mM7eZnR50wgL5rq
         W0ciCd7pWCsMaVoWd0YoH3imfnS0mGfs18PDObE95FNswi2mBacoSR29sh6JeTyLdSxs
         GAOrLCuRRwWE/ig/k4Ja7UVDNuNFhTv+z2XrNlGD5tuXdig3R+J5TOAglWwT0YffnV0y
         pRJnjd0mUhCGyjiLQOXBrUM9E6bZAbCxP87LZvUUmO/ie75h1k+wyPoerMhGOaU+mSun
         dF4F6HqZXXgQGNXNk0JS5IltAsRJmLhGr2R5VW4sDJkqSECcOd4Zg/bFX1gZLiq38vp/
         CLrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B43x15n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y50si2029891qtk.305.2020.01.23.11.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 11:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B43x15n0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuhyI-0004hL-A4
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 14:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iugF9-00009v-Uw
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 12:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iugF8-0003kD-3u
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 12:26:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56884
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iugF8-0003jI-0X
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 12:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579800369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt1vx9CQ8Rq88eZh2Kp4Sz9fZc6c3t91NtQLNsBP9SM=;
 b=B43x15n0exhb2rnpJ5Ndciqssds9QAn45rPJaT498jLrH7PAs2dNm+fVJLuwl2QCGqboRt
 DdBr8MMSXBCrINU/i4nLMmM6ysWzQ4xQWWB/lPEAW5Qy7xwLnYnbqQgiopWl7JOegszLU0
 80NO1DrUJrGV8WHSqAYMs9PAHyuM8UM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-bMkHLigvPPuKHhhZZ_qFqQ-1; Thu, 23 Jan 2020 12:21:59 -0500
Received: by mail-wr1-f70.google.com with SMTP id c17so2174053wrp.10
 for <qemu-arm@nongnu.org>; Thu, 23 Jan 2020 09:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rgMr5G+dNZcGxS6gXizKYDjDxNrxoiX+1AWd+DLUd/I=;
 b=YlvUGuQy/xucwkYQKUKVW0MELZnC0kXLYGgRybD6ubKfrnvLAQ5CywibN325FEBpk3
 38IVi8yp4AfETN/sZssiMgCkNo/EUSRAxOJKLwqqMnOIEEpRv7zQ3A0xD4yQ599nuYri
 z8yXrJmgbFhJBGjJY25a8M6sUzrX9S55VtWMSvTXY6XlXgkMLLvrnTc9/YvTbN9oEvlC
 wjIt5dabmJnB7FGSj9yr+MKsx8C/G4NMTj5/tsJVhKzYEH5quRDih1/AuG0F9KXbsVIs
 HkOR7cFDicLLGHgKkvFQyQNSlofd7pO8RM/yM/pquUXUWRvimJaaK2NJPtlWtFP3LdEa
 EI9Q==
X-Gm-Message-State: APjAAAX92Lu8Ko/BEntqXXgOW9pVHMDNdPnJjiUg8NxN1m4PGo++oR7Q
 mp3uYC4TPy/pSajTpSAaLhgx3hADXMk7fxz6gg7C74/tnlpcF5WyRbtKRkAYBfcSla+PdCv6Wyh
 uM+0Zq9ffcqoa
X-Received: by 2002:a1c:b486:: with SMTP id d128mr5018000wmf.69.1579800117829; 
 Thu, 23 Jan 2020 09:21:57 -0800 (PST)
X-Received: by 2002:a1c:b486:: with SMTP id d128mr5017984wmf.69.1579800117614; 
 Thu, 23 Jan 2020 09:21:57 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id c9sm3730970wme.41.2020.01.23.09.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 09:21:57 -0800 (PST)
Subject: Re: [PATCH v3 2/2] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200120185928.25115-1-philmd@redhat.com>
 <20200120185928.25115-3-philmd@redhat.com>
 <CAFEAcA8-aM=B6G-Zin-yEJycf6v1Brhxkn8it30jPDqrKkyWgA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a8520409-2402-8ae8-f37d-264c2ecdbc10@redhat.com>
Date: Thu, 23 Jan 2020 18:21:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-aM=B6G-Zin-yEJycf6v1Brhxkn8it30jPDqrKkyWgA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: bMkHLigvPPuKHhhZZ_qFqQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cTmAPYFN8S15

On 1/23/20 3:55 PM, Peter Maydell wrote:
> On Mon, 20 Jan 2020 at 19:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   MAINTAINERS | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 52fbc18566..27fbe1abb4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -560,6 +560,12 @@ F: include/hw/arm/digic.h
>>   F: hw/*/digic*
>>   F: include/hw/*/digic*
>>
>> +Siemens SX1 (OMAP310)
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>> +F: hw/arm/omap_sx1.c
>=20
> At least as far as I'm concerned this is 'Odd Fixes'
> status at best. I don't even have any test images
> for it.

Yes, 'Odd Fixes' sounds right (I copied the OMAP section).

Are you OK if we deprecate it?

