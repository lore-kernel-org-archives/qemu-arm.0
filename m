Received: by 10.28.91.67 with SMTP id p64csp877896wmb;
        Fri, 9 Mar 2018 06:52:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELvgqkPRfg9LvGwDb2SHYExhPJj/UOFo8zM32oruLoytVn1J6k9KudzRxeU6spSRq/a9ubWw
X-Received: by 10.129.109.82 with SMTP id i79mr19079543ywc.60.1520607151554;
        Fri, 09 Mar 2018 06:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520607151; cv=none;
        d=google.com; s=arc-20160816;
        b=Idb4BldxhH2akhmlfzujtfialIbpVCnCg3UBRABDnKKaA2mE8YLdVNsi7C/o9dC4uQ
         4dDc6dY5IHQz78Ib3sZfwHnX1r+cMv1PICt9F5u56ECYCtYrCpiRW4fCej72fJ4Zciye
         +f2zELh7ztgrAt8ROWyHB4mSqpqAriE4lfUH2x8vrZKF1cZf+wgJQuCvtld+i2AdE1eN
         J+Tgkzp1zp9ilUAEGSpUprvl18ROi4DyB2aK80pz7aZtTXToz2lMogmWYh2rGV6kyVBe
         2Ce20GgHsyw5lmBquHWFj+yZRzOu8uJn3yqydkX5dzNDqCe38pmehOpZVM+NDz7PabOf
         yGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=+DItJC2BaRy2L7U77agVd8cJiHDL1ZeJRxFtZyUi1D8=;
        b=fVqudQzH1EYaHgE1Ds7lIoZGdfvsq8NBdmrdpWZJejqyU64w3lZM83kWaqlRvxKMf7
         SBmrvas+Mx0rD0E/JzBjHuaimQZKnuQO7uftmn0dYPHuqzS/DJEYip/1fTwWCOn7c7VD
         amiFPmmu523uu3plHDXPmLLwYf58OmpqJ+X0T/cmiWgmv2265McN60xtXHav2gIx1D4B
         1p1QVKCMzygZJzg5vji4uuMe+FgUAgJ//7wQu+5cWO8W+gUnRrRc8v/Tm1Ynd0iNnLQP
         klpz+kRAjw8Vhx2pr49ONMffMVlBUZ/CxCHzOAxtKQbFfeaUom3seIAT3pX2msD0nMyf
         z0WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c26-v6si192957ybe.776.2018.03.09.06.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Mar 2018 06:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1euJNn-0007n3-29
	for alex.bennee@linaro.org; Fri, 09 Mar 2018 09:52:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euJLb-0005ve-6R
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1euJLX-0008Cp-7t
	for qemu-arm@nongnu.org; Fri, 09 Mar 2018 09:50:15 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59120 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1euJLX-0008Cd-2m; Fri, 09 Mar 2018 09:50:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A591406E8A4;
	Fri,  9 Mar 2018 14:50:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8B4215CDAA;
	Fri,  9 Mar 2018 14:50:07 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_4ANVq-Rd63R7BOhd2axy7_Jn-BchzAksKR6g7JbjnTA@mail.gmail.com>
	<2d530201-d5f3-1b02-17a9-1c2ed9e2d5e2@redhat.com>
	<CAFEAcA8or88+BG48VbWyVf3jg6xkw1+3AXvg49pg6dn5SRRF0Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <466bf19a-5b5a-a07c-2b15-5df8b832fb88@redhat.com>
Date: Fri, 9 Mar 2018 15:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8or88+BG48VbWyVf3jg6xkw1+3AXvg49pg6dn5SRRF0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 09 Mar 2018 14:50:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 09 Mar 2018 14:50:10 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 05/14] hw/arm/smmuv3: Wired
 IRQ and GERROR helpers
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxB1QKOcQnE2

Hi Peter,

On 09/03/18 15:18, Peter Maydell wrote:
> On 9 March 2018 at 14:03, Auger Eric <eric.auger@redhat.com> wrote:
>> On 08/03/18 18:49, Peter Maydell wrote:
>>>> +#define smmuv3_eventq_irq_enabled(s)                   \
>>>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN))
>>>> +#define smmuv3_gerror_irq_enabled(s)                  \
>>>> +    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
>>>
>>> These are only ever used in smmuv3.c, so you can just move them
>>> to there (and make them inline functions, ideally).
>> smmuv3-internal.h contains helpers, macros which are only used by
>> smmuv3.c . I though this could avoid putting too much code in smmuv3.c
>> and would help in the readability.
>>
>> what is the exact benefit of transforming those into inline functions
>> instead of macros. Not meaning I don't want to take this into account
>> but to improve my coding style ;-)
> 
> You get the benefit of type checking (and it self-documents that
> the macros want to be passed an SMMUv3State*). You don't have to
> worry about trying to write your macro to not evaluate arguments multiple
> times. These are one-liners so they're fairly easy to read,
> but when you get to 3 or 4 lines you end up with a lot of '\'
> lines and the inline function is I think more clearly better.
> I prefer to save macros for cases where you really need a macro
> and can't get the same effect with a function.

OK. Thank you for the explanation

Eric
> 
> thanks
> -- PMM
> 
