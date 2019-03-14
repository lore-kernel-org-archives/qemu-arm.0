Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1121163wro;
        Thu, 14 Mar 2019 10:44:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmYMwrfnSSmmmooHSBBjs1uK9OjlnBuBlq+Q2Wp1URUf7so9ggoxbTINx3ko67m6yCu6b3
X-Received: by 2002:a25:3244:: with SMTP id y65mr40774936yby.491.1552585461079;
        Thu, 14 Mar 2019 10:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552585461; cv=none;
        d=google.com; s=arc-20160816;
        b=JVb3JShRGuR9TaqTqhVuKv7xQQZZw1nctTaOODgrIy3IeNs0XA0rCjXWlNPjcOKdDP
         qihXMnzOdVc5BrcZIIE2jDBtucxZDUNoldHWh3U6croFM0eWCTJkKKFk7XP1NN88CsBY
         e1vv4wDCHanJQYDycb/HZJeC5zyhy4lKT68ZB+KGp54/7CoalxsaFFkAyDN3WR4exA9l
         HCc522rsSOA9QW8LmR6cibGKnEH1bDD9VfYGTtavQyDPRaRWUDbkboKJL3skIHRfRNyB
         9ckfbEM1N5+L0hCh0RMJuSm4MWOp4JW5xggKjuRBwAspTSlcCwYTKsXRVPBP0zq+PSpr
         Puvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=KjoPHBpaUJA936eRC+Dy+tuWPf0zNNnANfIOjz/75JA=;
        b=N+iNxshxIPgmsYH+zlKLWMkN2xsvrHwP4sn1eTuJxXcgz6b/dY+4LshfjA9Xd0zSal
         67aLuIddSdf+uVTKGJ+ZYWwOy533WT7/IA1q1Wu1y3xXC2M1O3Rmp9WKiTcqFT63wNBJ
         HVSXtil0s79Mn05WR4OjlIDqtHfAxYrqDlYi8PiuWLDI+dTgm2gn3wcdybc1SQ/VTLtD
         rK7llabaD7LXlrgqDjcjiEk762Qo6aKyJ1Hv6nvJWkC7Wq113pcXqsgudaSaCDwPpBy6
         znbxo9HJnGJIMrjLbBcRvECUlbX0ZanZHMRaUzy5JGhNzBKFahdqILx6HI231TrdTgCj
         CoVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r133si8881398yba.375.2019.03.14.10.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4UOy-0004QW-Il
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:44:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4UOo-0004QO-1V
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h4UOm-0002ac-TJ
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:44:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18339)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h4UOm-0002aJ-FE; Thu, 14 Mar 2019 13:44:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADF9867BCE;
	Thu, 14 Mar 2019 17:44:07 +0000 (UTC)
Received: from [10.3.118.35] (ovpn-118-35.phx2.redhat.com [10.3.118.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267962856A;
	Thu, 14 Mar 2019 17:44:06 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, Amir Charif <amir.charif@cea.fr>
References: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
	<CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
	<4daad4a8-93bc-05bc-1dfc-5652da3168bd@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
	xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
	xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
	TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
	GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
	sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
	AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
	CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
	RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
	wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
	Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
	gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
	pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
	zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
	pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
	3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
	NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
	cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
	SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
	I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
	mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
	Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
	2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <6c85b09f-9c72-579a-5e63-7c5624311b18@redhat.com>
Date: Thu, 14 Mar 2019 12:44:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <4daad4a8-93bc-05bc-1dfc-5652da3168bd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 14 Mar 2019 17:44:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Check access permission to
 ADDVL/ADDPL/RDVL
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gHgTDHxtcm2

On 3/14/19 12:34 PM, Richard Henderson wrote:
> On 3/14/19 10:21 AM, Peter Maydell wrote:
>> Richard, Amir -- it looks like you both sent exactly the
>> same patch at pretty much exactly the same time. Any
>> preferences for whose version I apply ? :-)
>>
>> thanks
>> -- PMM
> 
> Hah.  Bit of miscommunication there.  Might as well apply Amir's and have my
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Great minds think alike!

My personal preference, if it counts for anything, is to apply Amir's
patch, because it's always nice to have first-time contributors added in
a release.  Welcome to the community, Amir!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
