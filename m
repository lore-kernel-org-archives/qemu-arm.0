Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp828409wrv;
        Thu, 11 Jul 2019 07:57:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEB4LUGKfl+oLxnzCQH352kHhamtC2yZatCXRd8uzG0M3yELqMtsFgg1n6mtC0C+iqq1xn
X-Received: by 2002:a17:906:30d9:: with SMTP id b25mr3445321ejb.55.1562857076155;
        Thu, 11 Jul 2019 07:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562857076; cv=none;
        d=google.com; s=arc-20160816;
        b=w1SN8AoOL15hXMKDGpJkoCtmOANUu5ysNYwHLntPMcFZeJPYhQZHG4Gij6bwC1wTDb
         5eM0UCHF8fsmdjnDRt2jFqax0RzZ/a97TZgUnqtJb3Jdsvbvs90WN7yPoU1CptNUoRon
         HPB5lVPQ0f1FObsAF/L/JJYOAOHbeEqhpFW+8muUoE0OcvmJbmdLkn7sbuakcrMIkirn
         uuTNafoJ1jPBqskCYl2xeMK+pzFZ98w8NEnitcjlmrTUQ+y8hXqDgQ8Nu5bZTeJGORq9
         6CHoLCl9JfimJm4G97W5J5aQ8pp+maQG3Ky9qf0rVzYlVnB8tmA/xwQdYBZ7PL8l1bVN
         /c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=gBzFXMgegUrsAfRlHD4O9gEuq3Q0SglD0zqttMeYuLg=;
        b=gSrTPdr7Codr1AKoBpJfNJQBN7i6jwFnxjx4VWcyeF/1SNeWUQmQguuw60WkWUvdoL
         b/G3tDUeqIaE7wuEKpIG/CvbWRbF3nMjquBm0LW/hw8Bw2IdOrJdQ1X57AXQvYC/+EV9
         g2bs1IfIEwW1TVe9pdgJBVjIWu3pSwcwUaBg0ycEFUqTYz6rc3Mu3PQIHOfofpbnrSgm
         mDVO8xboE72geXNNc+irPs83EHaG664Aiz58LVxcNgaaid3ujfsy463Jcna6lgJ4tbEc
         AUxZBriDq6HWvyv9MK4927Hudb5PNE/+Qqj6h/lnyMZTV5mn9WoDuMWHrLyrmlLIfZuy
         rDvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21si3311093ejr.44.2019.07.11.07.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 07:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlaWB-00075J-8x
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 10:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlaVg-0006G3-NX
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlaVf-0003mS-Oa
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:57:24 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:35958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlaVf-0003km-HU
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:57:23 -0400
Received: by mail-wm1-f51.google.com with SMTP id g67so1900607wme.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2019 07:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gBzFXMgegUrsAfRlHD4O9gEuq3Q0SglD0zqttMeYuLg=;
 b=S7Q884ALxDso4V6YlQ9+unqCSDHnhiqXs7geu2eKOBsCqhfzQrU06XFuIQGgJ3HpJi
 gtGqvX9gSvPf1gfgIKifbY/NkO8vJf7jThqrHGi0AYIUOQpGtw+ccs1QOcmqzTvdb23a
 eX2E63Ad4FGDOSBNt4Y2GmkLi8uQGwfybQon+X1WkBuRPak2IfcQTiaByD7YezZa9WNM
 D/gMRKoc+2/j2oa05XQsBWcbOqYT1t2xAlYGbQe8UV/jDixxr26Rl1LZdAI88aSj5zSF
 UlZPLlJzvO7lW+vuhMMRtUux8XbP87gLzs7O35IrSAFeJHjTfPcMy6+xp3heKXOnZO2C
 GIWg==
X-Gm-Message-State: APjAAAX3uJr6rtCb1EdfuxiR0jnG7vduxT81e5Z6a2/zZCxU0Gs5nJHh
 YyCui/SeJBi/lYOMA+yam+BUNwfJguI=
X-Received: by 2002:a1c:f116:: with SMTP id p22mr4618304wmh.70.1562857041890; 
 Thu, 11 Jul 2019 07:57:21 -0700 (PDT)
Received: from [192.168.1.103] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id t63sm4754458wmt.6.2019.07.11.07.57.21
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 07:57:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190709113715.7761-1-philmd@redhat.com>
 <CAFEAcA9adoeYeJCnrRU=i=WiYzAuJh2vQupYgL_KRAoomvU4Wg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e4fc24ff-43db-e11e-8068-aba98929e8aa@redhat.com>
Date: Thu, 11 Jul 2019 16:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9adoeYeJCnrRU=i=WiYzAuJh2vQupYgL_KRAoomvU4Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.51
Subject: Re: [Qemu-arm] [PATCH-for-4.1 0/3] hw: Avoid crash when reading
 empty RX FIFO
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GmM4Khc5EzrK

On 7/11/19 4:51 PM, Peter Maydell wrote:
> On Tue, 9 Jul 2019 at 12:37, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Fix a pair of crashes, one is an audit of first one.
>>
>> Philippe Mathieu-Daudé (3):
>>   hw/ssi/mss-spi: Convert debug printf()s to trace events
>>   hw/ssi/mss-spi: Avoid crash when reading empty RX FIFO
>>   hw/display/xlnx_dp: Avoid crash when reading empty RX FIFO
>>
> 
> Applied patches 2 and 3 to target-arm.next, thanks.
> For future series, could you avoid including both
> for-4.1 and not-for-4.1 patches in the same series, please?
> It's a bit of a pain to have to separate them out again,
> and there's always the risk that I don't notice.

Sure, duly noted.

> (You'll probably want to hold onto patch 1 and send it
> out again after we reopen for 4.2, or I'll forget about its
> existence :-))

No problem!

Regards,

Phil.
