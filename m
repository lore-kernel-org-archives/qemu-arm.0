Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp781575wrs;
        Wed, 14 Aug 2019 05:45:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdnMv81nZQSyX3YcOLx8t/bgnOao9/4bVf/oShspqoXW3kxup94WE787OCJuz6mduaXGUW
X-Received: by 2002:aed:3621:: with SMTP id e30mr16132337qtb.283.1565786739813;
        Wed, 14 Aug 2019 05:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565786739; cv=none;
        d=google.com; s=arc-20160816;
        b=ND3aYAC3SEwSKAokGcI21u/BhVBAfDzH3zQA0xVpSHyaLiuERe6ugomhyEDhLgbRk8
         ib4Ij933GdqUfFQroSddnYjDqI21CY1B/FqGxiChoxZkyWgc++9WCjfDfDo25Hv/PHL0
         bm670sntuGNC5eQ1qGIha21dFQ6W0YDtAZ40QrunCezzmHlaFAE0jMy23EtBRIj7NYOy
         bCg7zgGj4kT4E/7teaAhokOPk3QQNRH49QB2E+2ZqBjqOBGkfFMSk4xMyXrsVcPV5p8L
         mR4jA1PYWi7I4A5PH8Z23gFJrrmrhJtGZogY+EUKfCLf4DVH3LhdwG9KZ7g1vMLnSW9N
         jIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=3spmdXjoXaNLWcQVMlsSQgaqA5ymeCeQN+tvICLsCZE=;
        b=epOxdOtGlC1+fFdvPEUKEGHw5XjuhnwnmHzAMJIsvp0ALCf1vHnEHSNv4XJ1wnupz+
         oz5T9x/0p1uDdlhEeY6P/oywERbsp46j+YVH2j3d5zx7FTIIHPua7qL8AY7obYhchzKM
         ROV4ciQwFSi/idGpWF3BUUGmFkkt0l6QGHrR+Lp4dz9VmmLNa+dTXFxBvA2uD6IIMJ/p
         /kA22E5Qt8PCXhBJ9OZGUcf5pC5HSExuOu47G3nsS0oWoEKWn43+wyyc7ZEeir+SIw2k
         YI7W5tCePLRhC0ZT1aUl9ulfO6fEQazIZRHtr45eMw0YvPL6TdZg/bhE4bJHCjUWhcu+
         wfLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h54si69730806qvh.150.2019.08.14.05.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 05:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxseo-00010F-T5
	for alex.bennee@linaro.org; Wed, 14 Aug 2019 08:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hxseT-0000vz-9N
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxseS-0005X4-7B
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:45:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34234)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxseS-0005Wc-1B
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:45:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so111003718wrm.1
 for <qemu-arm@nongnu.org>; Wed, 14 Aug 2019 05:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3spmdXjoXaNLWcQVMlsSQgaqA5ymeCeQN+tvICLsCZE=;
 b=ngRROB0ckJalO7QXbPeIXFSTxetQBvswTwwsJfGRXkf0JlUGuEoa5T1UuxsPfZLQoB
 bcmknbvM4zdQ0dbGR0BNYD7FuktSDA79Q0+3eH4QFHlLlA5I4UhOAue+wY4Qj8wMocnG
 VUpayVVlxa7YW4LdSqQEHDU1yAfJyW+CSmLfGLQjUcDZjz4VefBdoqOdRJSb2w/+ucNo
 L+2KvnCr3hJOEZLIOIod0RFtGqxd79Fa6u6eurXo6e7xdlQLfbujRAAmJJRVw5tOgPBi
 J+V64iiLzoqN/XC4c+Qj3I7Mk1CLGP0EtFXF40JEbz7RWIlIV+uMl6/kQatdMesCdAYk
 6UJg==
X-Gm-Message-State: APjAAAUQQ5njDwX5SDSfTt4FBnbs554HFvayGFCYzxtkWClUo3A45l/0
 XP37+b4fGtkWQI0WuMy/bH5t3g==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr27035053wrv.237.1565786715001; 
 Wed, 14 Aug 2019 05:45:15 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id f10sm16539190wrm.31.2019.08.14.05.45.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 05:45:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190712133928.21394-1-philmd@redhat.com>
 <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
 <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
 <CAFEAcA8axpVeXjWV+2cz8PL-gR_6GvU=i0BMt01pYhff_1LOwQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4ed2e2b7-91b0-197f-7532-bf9daac075bf@redhat.com>
Date: Wed, 14 Aug 2019 14:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8axpVeXjWV+2cz8PL-gR_6GvU=i0BMt01pYhff_1LOwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KlDjsTFBUV4g

On 8/13/19 4:04 PM, Peter Maydell wrote:
> On Tue, 13 Aug 2019 at 15:01, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 7/15/19 3:13 PM, Thomas Huth wrote:
>>> On 12/07/2019 15.39, Philippe Mathieu-Daudé wrote:
>>>> A series of obvious patches to build without the deprecated
>>>> bluetooth devices. Still worth for 4.1 or too late?
>>>> It is clearly not a bugfix.
>>>
>>> I wonder whether this series is worth the effort right now, or whether
>>> we should simply nuke the bluetooth code after 4.1 has been released?
>>
>> Well, perfect is the enemy of good :)
>>
>> This series is already done and is an improvement to what we have.
>>
>> Regarding nuking it, it depends on the Nokia N-series boards, they might
>> become useless without BT support.
> 
> Er, they're not useless at all without BT support. The BT
> hardware is a really tiny part that I doubt many users of
> the board models ever used. As long as we retain a "simulate
> doing nothing much" model of the BT device to show the guest
> I don't care whether the BT backend code disappears.

OK, I won't insist then.
