Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3618441wrq;
        Mon, 18 Jun 2018 00:45:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJlcrvhNnI4S1WRE8myhqph4F3dHR3O7ZckgqjKN75a9FIvl80/+iGY9jC2ALEXPczj9ZsI
X-Received: by 2002:a0c:e642:: with SMTP id c2-v6mr9950685qvn.56.1529307931644;
        Mon, 18 Jun 2018 00:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529307931; cv=none;
        d=google.com; s=arc-20160816;
        b=aGowEjZ3hH8CR+upctqinIEYp8GhSzjTgPcwRg5/W26K4hgPfEXQ3pZeVI7JhyGIUz
         DGvHmRbUEiazsnDvcv2tF/AJl3zlrE1Y9gcAjKjcSX5V40SrSR3LMUik3QYK5jDxf+ar
         LT+vcQNEDHXO0cCKU+d75wYyHu9yX9+gmqoyOQ5GGQ05oicjkDraT6JRlAWGtJoJ1wEi
         7t3br6BF//dO2edM9PrxBU9Zt0WE5V+4qx3Ct5y439G4ydQmXqdcszHB5Q0kr+oe619N
         /M57GzFjcsbKC7jokH/DwnLv/fLfEwGXxNyx0bz3/7sC0kVRlrJWt1dGHqYayVWwJmUU
         orNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=CVQlllwIHFHywGeSOBZ8ukZ9uJ5FFStwPNVuiBXp0pU=;
        b=vNeqETEyKjfFClzfkXPjMvyLMUOaSt+V6j2NCltl+/mokOV6ZHAO0yp7ICb/yylKCU
         eWlEODNLcpNdWpqmPOsKBoA3PNM/4xrhA4qDZORG5GaRvqUtIUmyJPxeDqX+jKdQWuyN
         eEqXE38XMxBgHLZYaR3DxvUMImEk3NIzc2FEjDm/IQ3FF4WyKmmN8GE5+yVd0rfNyJmp
         ghM5XHHprbO7rv0c9fE2UxpM+UXmYBhDIIEse3nA49qTKr3F+A3u8QWhoYTPf5rVkhwr
         5cLdfbm2RXv74Id7rgrd90cRc7eryWuZ+t4U2xp/tqAYTnfqmXKNRipjFVHQF1Pq5oC1
         aGPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id j126-v6si2840558qkc.31.2018.06.18.00.45.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jun 2018 00:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32FF8401DE60;
	Mon, 18 Jun 2018 07:45:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com [10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 734F7111CB8C;
	Mon, 18 Jun 2018 07:45:27 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 08/13] hw/misc/tz_mpc.c: Honour the
 BLK_LUT settings in translate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-9-peter.maydell@linaro.org>
 <64ff124d-fe34-75eb-e9e6-7c419827ee3c@redhat.com>
 <CAFEAcA8ioVZuB61XWQKKRyGAJxn1gge4fjbrQuK21-drh6y81Q@mail.gmail.com>
 <CAFEAcA-keXSuHBN9HVem0yoG5bySo01DH1GtbzNcRjsFcLPU_g@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <81c9d91c-516f-78f2-6684-3edda6a40348@redhat.com>
Date: Mon, 18 Jun 2018 09:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-keXSuHBN9HVem0yoG5bySo01DH1GtbzNcRjsFcLPU_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Mon, 18 Jun 2018 07:45:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Mon, 18 Jun 2018 07:45:31 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: O5ZiLYd8NxL1

Hi Peter,
On 06/15/2018 06:09 PM, Peter Maydell wrote:
> On 15 June 2018 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 15 June 2018 at 08:31, Auger Eric <eric.auger@redhat.com> wrote:
>>> Hi Peter,
>>>
>>> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>>>> The final part of the Memory Protection Controller we need to
>>>> implement is actually using the BLK_LUT data programmed by the
>>>> guest to determine whether to block the transaction or not.
>>>>
>>>> Since this means we now change transaction mappings when
>>>> the guest writes to BLK_LUT, we must also call the IOMMU
>>>> notifiers at that point.
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>>>> +        if (newlut & (1 << i)) {
>>> Add a comment saying the block is configured as non-secure?
> 
> ...actually, how about instead having a new variable
>    bool block_is_ns = newlut & (1 << i);
> 
> and then here and in the later if() having "if (block_is_ns)" ?
> I think that clarifies without needing a comment.
yes, looks good to me

Thanks

Eric
> 
> thanks
> -- PMM
> 
