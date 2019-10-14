Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4618871wrm;
        Mon, 14 Oct 2019 09:06:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNtpIiWggWaPnZteZQ4hAUydSELT853+mZjFUg5xAYM8A/psrDIOOQ7FgbL1e852ubM2kD
X-Received: by 2002:a37:5f46:: with SMTP id t67mr29354251qkb.220.1571069219128;
        Mon, 14 Oct 2019 09:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571069219; cv=none;
        d=google.com; s=arc-20160816;
        b=Z//aP2LqCI/RJfwHJLhdsca2KCACB1+kgloZm9mbpCanYeD5semtNO6UYvYTssxnsh
         IyICNCiYYFTVCwTLJEnvQzPTxooiFeiYiszTMqiLHdJHcta9gTZFdeHjf9KObMSgcXjG
         uMNECZImGAsuBtqyur3A1wt18khWVul9ne4Der3nVSAsTTnBb3fXuG20faMG1hmWaBAo
         VgbDVMx4ZpndxakFZ3l/q8yM7YtZSMLW5Jgg2VgAajEjgkIHh+tYK5CQAyD8A3+YQOjk
         OFRaGf+rE8tAPa6p450UTbFxU3slzlNZ0+nUVLGgBQOZ5rpwGCwKgqGPCgSigLgGoUP8
         Dycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=YgzaX05IeVLy26/jBMDsX/zLKJRZZv7VlX1stP6xtI4=;
        b=LlB6B8rOzJoUsihr01/L6MYOWut7UHVwPEUacsC1vMS2cCWY0M8YFm7aLIoPwlr7Yg
         Gjp4exmpvmpE75JXijdbL5TbpQtxt3/MVxBOVwKoETVKEU5O/mdsqpU/NPGiZisH0494
         3VVxUmbU//uMWTlYb6stf4oSux8vLO4QecILE4m1W5CFKSIwiNU+W/2N81I9yZTeZzk4
         bNn7WNOVl7t7JoW6GgyG+/34PMOyBBBRIcRivZdWhmTKQjKXHgj4zRWyUFCA6qYvHFCS
         l6DJV6BlCqjmIRyNKw8LknVBG7opQpdHgIUeBDF6gpEfrpgWaLCFaxg62KQnCJonx936
         Wisw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l205si18703257qke.229.2019.10.14.09.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 09:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2s6-0007Cq-7B
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 12:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK2pB-0002qC-Vp
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 12:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK2pA-0006RM-Lm
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 12:03:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iK2pA-0006Q8-D6
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 12:03:56 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 80A5C882EA
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 16:03:55 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id 67so3820965wrm.18
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 09:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t+KQeUdqW/tvtA05BBSixPN/oQRJVkrrlGyoHqPBegk=;
 b=AktrfDadO4KxI6QSF9Pvv3bug9A24euf3AOxlhDqYvnqTojYu/NZ3En1EUZwcSE13V
 g0vpantI3O/X9nV9MSRpIeGWB55kIvjnGtOinaD+OLSsitgVz3/x3wOlQLrw3FGBKn1K
 0fwayoF3q3zWqHHCdj1AiLYweFpg/UAUWiwAkyAzoWZsuVwLIWUgQFRxRQ3gTPBq+zla
 pRHBpg1z7DNcMqSEUDdHHCQsjwwI5yMHGcRcfGk0SUz9LRT6cdI1l03JLcDajs57Rqx0
 WmdFDx5r/zRlAoHWyes+Tz557+4eeqyN3qL709fMeuKQQkHm4Wa8Y0MhZMtgqyVLm8AS
 PgsA==
X-Gm-Message-State: APjAAAXzQ+Lj1GIL5K+1XcYDFFw4X933NIhMZWnyXMdQnLgxDwG7m3GV
 AaMYoCyVQCunokfDro/67btWV2+bqrmohXrp9rtLmxcwaim4elcvnLC0Kv7yFwT2spY0cQLmgQs
 9NpNVbvylwEUy
X-Received: by 2002:a1c:a8c7:: with SMTP id
 r190mr14433038wme.148.1571069034281; 
 Mon, 14 Oct 2019 09:03:54 -0700 (PDT)
X-Received: by 2002:a1c:a8c7:: with SMTP id
 r190mr14433004wme.148.1571069034066; 
 Mon, 14 Oct 2019 09:03:54 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id u26sm18943457wrd.87.2019.10.14.09.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:03:53 -0700 (PDT)
Subject: Re: [PATCH 06/19] hw/char/bcm2835_aux: Add trace events
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-7-f4bug@amsat.org>
 <CAFEAcA-cbTqYaRr8epJVgUV+tkGgCuf__aM3GxRzbKuqgWfPYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15ddd2c9-3645-23a9-87e2-8e7d5637d290@redhat.com>
Date: Mon, 14 Oct 2019 18:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cbTqYaRr8epJVgUV+tkGgCuf__aM3GxRzbKuqgWfPYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQ3P6g2MZyNV

On 10/14/19 5:36 PM, Peter Maydell wrote:
> On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>>
>> The BCM2835 AUX UART is compatible with the 16650 model, when
>> the registers belong the the 16650 block, use its trace events,
>> else use bcm2835_aux_read/write.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>=20
>> +    if (is_16650(offset)) {
>> +        trace_serial_ioport_read((offset & 0x1f) >> 2, res);
>> +    } else {
>> +        trace_bcm2835_aux_read(offset, res);
>> +    }
>=20
> I'm not really a fan of this. I would expect that if I turn
> on the trace point for reads from the device that I see all
> the reads, not just a subset of them. The device may be
> minimally software-compatible with a 16650, but it isn't actually
> a 16650, and there doesn't seem to be much point in sharing
> the serial_ioport_read() tracepoint.

Yes, I posted a newer series for this device after review comments:
hw/arm/raspi: Split the UART block from the AUX block
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01498.html

I forgot to mention here this patch was obsolete, sorry :/
