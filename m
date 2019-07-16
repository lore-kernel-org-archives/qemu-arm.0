Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp574848wrv;
        Tue, 16 Jul 2019 00:02:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwovhTk29RG3KrX+qrRGzDLqGbLt2IfM5zsy1WDMD753l3e1ll1qxKvxR00pRVzJGXJAFKP
X-Received: by 2002:a50:95ae:: with SMTP id w43mr27444961eda.115.1563260560495;
        Tue, 16 Jul 2019 00:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563260560; cv=none;
        d=google.com; s=arc-20160816;
        b=WMIxupuHkBHoiG6Vtr0g1c/yXciKQj8qsKqNmVzF5sRdSxTnpt9XhilasSdXwGBCQR
         Qxu0iYeKwM7P0aUoIPkRD2sXkqRjo7vnPKhoNp8PKaWct3YNShp3Zpla5tgkL2oE3UJr
         gVHT5rdv4wnRqPZsFtgqertO4LjYH4Ve7rlErDW+x2nFfGDQ+b4T25qUndysxFde6gBd
         ieEy6ijPPgSO3cXQvwAptpxGg2445rDbiXb99r16wCQyoFcSvXnAuooGSFhnZbu2at/X
         CpzETil8SdcwPFjuwI3aZJYpyx9T3GC3nguPz4uadGwZ94UKkVMxpJLbwcjoEbnimIvf
         NkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=2F8wvGb9EClt8zkzwDfthI5rbiKK8I/K/suAIUtGOSo=;
        b=hIEoKZiHNQ8ydwjsSZMLgTK4rM5ZujwlR6VaH43p2Z3Ln5EJftXzXjO+ptkmHtW4WM
         b0UFFA9IoMtI/bcjypsudCGmIm1M4wXcTRF9wb4WKahPZhLM1CnmMvi4fQ556fdn6Ksp
         Huv04D6994LnXDU5ZlLBGSYNKd1XBkfkp5d9TdFEOJ7Z4M7keQxizGAtBf7+Hw4hZ0iO
         C2oM/WwlRv9wYQLGgKSpXef+X9PFgZPs5PchVQGxL24ppsRhM74CoR8H+3OsKv5GZQRA
         yTVfJcoqT8NrmMpuTMc8UJQq9H6FoL+bDDW6R5oK5O9Z5XmbGv3X7gk3HrJPweUd59ZC
         f59A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga14si10633721ejb.297.2019.07.16.00.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 00:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnHTz-00034L-Cd
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 03:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnHTu-00034E-Sk
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnHTr-0003uB-76
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:02:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hnHTo-0003nR-8m
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:02:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so19688328wru.0
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 00:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2F8wvGb9EClt8zkzwDfthI5rbiKK8I/K/suAIUtGOSo=;
 b=pujlUL9i1qNuXQikDu/uaDyfHsqJqlolQ6CB37qsUSstNtxUH2NhskqJtEOmY415zd
 IQ8lwLgpTVOjEOT7r1iNvUvcQ7RrR9i/DGbiLzFoWg3Mmb4BpCtLLOFwvU+Nu2+U+Gat
 TEthPJmIeaHdzbWxJgwDpN+kC67zvrPyWG1BxSiRUQbXVr8JLrf16bWPxzhft1qPY0d3
 RD1hKLoZkIbj0XEyGd7Kyf7scKpej1qs9gzKWM7b3La+g99z+13vQTo3o2npc6sTOJh5
 j2EWqa2KwUCgnA0pZa5CeCRnXiHFcgQUCwZVA3C+GjV+KImekVhqlI3FZe6zc5pyv+To
 9ACw==
X-Gm-Message-State: APjAAAWeSDl+7nhXC2Efezuzv7l+3YsbegfwfWed0TZ1rWM6RjmcB1WI
 BSfDJbqfAGkk3zs0fXuE5qLitw==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr33031260wrx.175.1563260541525; 
 Tue, 16 Jul 2019 00:02:21 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id g19sm34905185wrb.52.2019.07.16.00.02.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 00:02:20 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
 <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
 <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
 <CACPK8XfZq1FvMBXLgS-WHoJy4s_L9k19hLW-XgBNoiY-DhGhWA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f5ed785c-027d-66fe-aba2-d03001b44162@redhat.com>
Date: Tue, 16 Jul 2019 09:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfZq1FvMBXLgS-WHoJy4s_L9k19hLW-XgBNoiY-DhGhWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6blR1P1Fmnbp

On 7/16/19 9:00 AM, Joel Stanley wrote:
> On Tue, 16 Jul 2019 at 06:54, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hi Peter,
>>
>> On Thu, 4 Jul 2019 at 12:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 04/07/19 12:13, Stefan Hajnoczi wrote:
>>>> On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daudé wrote:
>>>>> CC'ing Stefan & Paolo for a non-ARM view on this...
>>>>
>>>> I'm not familiar with the various clock smoothing techniques implemented
>>>> in QEMU and KVM, but this looks okay given that Linux guests expect
>>>> this.
>>>
>>> Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC timer.
>>
>> Can we please merge this so guests can boot on 4.1?
> 
> Cédric pointed out this lacks my reviewed by. I had not provided it in
> the past as I wondered if we could come up with a better fix. However,
> I consider this a good fix for 4.1, and if sometime finds time to
> further rework the timer model in the future then we can do that work
> later.

Agreed.

> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Tested-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
