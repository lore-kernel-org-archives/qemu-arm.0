Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp862973wru;
        Sun, 15 Jul 2018 14:15:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfLz1X/0fLD2UNS4YUKSGtR5SXzjvYxCwPe8zoRoKTHdvgi18nhg9L7VYbOS6Z4lf7pkM03
X-Received: by 2002:ac8:2672:: with SMTP id v47-v6mr13083011qtv.287.1531689305020;
        Sun, 15 Jul 2018 14:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531689305; cv=none;
        d=google.com; s=arc-20160816;
        b=qSGq2oD8tP2gC9h4eJk+nco6GSnrmunYe5Z/02IdBYX0muuJW0R7CouiFmd28GDA+X
         iorYDXcsT4CqlxxPEkut5U4rcJUpsq98F2gYjx1MFXKR5Frh6F9kJ4CXIEG0BPSkZ4Gc
         woGfUBgsYgWCr8B0x3wJwhGWTBnj1wtL9kKSD4GbnSkJ+igSoJzizus2jc7jDGRkZ7J7
         N6sac8toWmHH4iDKel0K08+nPSStUk8bGhWk8TIDCSMiY7ipzUuqR1nvlEXjObOrDj0H
         3stzh8TTNn4udWyHzBL1gk/Jr9qMehZ1ur3KhtaRgmXJE1G0JrICxHOigv6JCTY6XrcQ
         /s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iLCJvmXY5UK5EujMCZbXsVLfb9PF48aMj8RfsDgp+cY=;
        b=XBvNbvA+uu6StKMVvedlefh9MPzefCZnbPjHE6xMAA4Cey4USVon/IHvyOdxSDGcZq
         B5tEuZQuUPWFTO6OTCoS66c6CMrX9LEkW6N14+VY6zUXJ5Bwng1VVTyEvZ9BUt5HLEvj
         O3dE58sKR+wi/POp0anE4mxgEnWtCF0otQHDLvaWIVhh8bJSisTgXp9UZpWFt21fDEwe
         8bfKthq2s6Dex4WowPqJkDlCdLamiO+LLyCizXWWu0yYQwLV8pJdBuJngWimkUk/UU93
         y7W6al4unr4zz/asalmkTkglefKYs1sysZFrANg2tvmv1On9RCOT4PVuwWivH0SpDdw3
         kzAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZIti+xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186-v6si2009270qkc.364.2018.07.15.14.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Jul 2018 14:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aZIti+xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feoMC-0006Tr-Hy
	for alex.bennee@linaro.org; Sun, 15 Jul 2018 17:15:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1feoLy-0006Tg-1x
	for qemu-arm@nongnu.org; Sun, 15 Jul 2018 17:14:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1feoLx-000235-0U
	for qemu-arm@nongnu.org; Sun, 15 Jul 2018 17:14:50 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:38249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1feoLw-00021X-RM
	for qemu-arm@nongnu.org; Sun, 15 Jul 2018 17:14:48 -0400
Received: by mail-oi0-x244.google.com with SMTP id v8-v6so71281450oie.5
	for <qemu-arm@nongnu.org>; Sun, 15 Jul 2018 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iLCJvmXY5UK5EujMCZbXsVLfb9PF48aMj8RfsDgp+cY=;
	b=aZIti+xjQ1dBwT3IMCqmczeVYTWtfcQlJsXyWvfr0eVy8GeDE2l+V4mNrjDbK3jPkZ
	JMkpEhggVXF6CheiLbCYYkkT+Z7ifp2dlwixtPeNzPGqgrWAaDMIQ18fEr4x8wXc0SXR
	Et812En7vSZ02gDBbPriFdRQPZPjxGt4Aucw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iLCJvmXY5UK5EujMCZbXsVLfb9PF48aMj8RfsDgp+cY=;
	b=Y9fhOoVghUXVQQlxlYeGvT9URMQqNO1VOPCPL6UmjTHOTTfrz83LlYLe33zDcR4ZuN
	RfTYzPgYToFCGmKZU65yrmOFPd0sF+1/2q8HhBoQtiPDMGiBwYYmtGxVNGPm+IXjsr97
	DBh+w9PlLtSlp8XSc9nIlq/GJtMY+P9lCKkxT6vGMdmVxwZCVCtayemNkGPLWOYGlifd
	fJlyDaHyZJ0p0g5/zR9E3umQpPvtikI4gvE2hvFWRlkpnwTXvB1Kv65SE2XLQBy60J70
	SCk9LG8TEIE7+uib+nrX5HHzrXxhJ856wIUfJALoDizPaxjbjUD/do0f7l66z32wAFRu
	Hv/Q==
X-Gm-Message-State: AOUpUlH266wAZtEDHTmD/jRBaAhFEQtMO2duTRyq2DAMcaGJ7uo56Iuq
	sH4FsGT1dkBw6HX65f0gfQWBAwwI1GwM/5/i5i3Rvg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr16317758oic.252.1531689287846; 
	Sun, 15 Jul 2018 14:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sun, 15 Jul 2018 14:14:27
	-0700 (PDT)
In-Reply-To: <5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
References: <20180713150945.12348-1-peter.maydell@linaro.org>
	<5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Jul 2018 22:14:27 +0100
Message-ID: <CAFEAcA_d41+M=tu5DTDrB9=6s5qTQnPZau42s4UyfNWFU8AkZQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] accel/tcg: Check whether TLB entry is RAM
 consistently with how we set it up
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WXqzfR8mAb02

On 15 July 2018 at 01:37, Richard Henderson <rth@twiddle.net> wrote:
> On 07/13/2018 10:09 AM, Peter Maydell wrote:
>> @@ -939,29 +935,21 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>>          }
>>          assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>>      }
>> +    assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>
> Don't duplicate the assert; just move it.

Yeah, the duplicate is unwanted: I probably ended upit
from a botched conflict resolution at some point in a rebase
when I was moving it around.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM
