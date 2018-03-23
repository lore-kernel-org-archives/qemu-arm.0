Received: by 10.28.71.155 with SMTP id m27csp250798wmi;
        Fri, 23 Mar 2018 02:45:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtcoSSYZhnKOPgdNd2jdLBBxHa3zhPkQCbzGv3CIaELqwyLEhZ4gd1DVKvCfUuF/pTndJHc
X-Received: by 10.55.192.20 with SMTP id o20mr38509304qki.257.1521798359478;
        Fri, 23 Mar 2018 02:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521798359; cv=none;
        d=google.com; s=arc-20160816;
        b=qJ8mM5u4Df8hDRtEfJest41BtNpo1URmXC6Z8VanLXSvls+bTwkLEVcUfyEl88wML2
         OvJrHkJW5T0UqyJxT0gbAPEnwYBV0y4aTrX4PFb2PZZs/0BdfPNf339uPs45+LtzdoCY
         OgVxeoBlqWOeVgDAJ9pUsr/KqN16az9DDKR5SVAo87dcHoYyZRAKpi0kbxrGHT396yTX
         tb7cdOoFpWIk0o49j6EEVhh8Tj9+6Ka0UPEQijt0Q++tJQAtjTfvWk56ocVx/Vv6Tmoh
         +oOoIG7VSwVLJhsEr0R9gelVOKU7Tmq/DIZd9s2ymcDYAD9qAcysaCeHU/0WEZ6cO299
         8hdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=fCyNRXcOI0ydp5pXwj+vvpXojjzevK8Yb9mot/8rYYQ=;
        b=PEjeK6la+FV0t5bd1xq4GB7TuZpJia1FrHSRa6BKaYnoZ0+u3lc07ZSPkdY/yIkBUf
         jkYsKqsIEhIu5WsSzQ7Y6AEWyC3xigtYj/fp9p8rYMd+qk1BdDZ8f+sYzmCx0VyJBV2Q
         fxtSpjpV27uEp873wavovkH9NIB6h4bIWcTIZasp+Q9R1fKB1P682bcVq7A+yZ56Exk/
         4yW7fVS6wchLYlVkhkkiZ8EarFOOMAwCb51toxt9I1ZqQ2ZGfJyRHvFDcHz2c8SKKkls
         pUK2fJby8+9gNRucCdX4TDCA+rqXaaR5CgzA8qMrKYeuxF1y5kAQu2Ra1nef5VVdfTC1
         QzlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jpYNlJah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si8806253qtb.26.2018.03.23.02.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 02:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jpYNlJah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezJGo-0006QU-VT
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 05:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezJGZ-0006Nu-SR
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 05:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ezJGV-0004AO-Qf
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 05:45:43 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:37845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ezJGV-0004A7-Lq
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 05:45:39 -0400
Received: by mail-ot0-x244.google.com with SMTP id t2-v6so12595774otj.4
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fCyNRXcOI0ydp5pXwj+vvpXojjzevK8Yb9mot/8rYYQ=;
	b=jpYNlJahW9qzkltYCL5e+mZkhtaGJ5R8SpCJe2y+b/rE55dXnfULADoa/rqX4qto9g
	9LDDLe+TSWcxB9V1x0JhwLjIRaRxD87sYOILHwOUobbntg6Q70ZkwQAy71PioETelCBa
	WR5RIU4yChMdRLLfU01UFjbq/Dbtv+aZ2ufJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fCyNRXcOI0ydp5pXwj+vvpXojjzevK8Yb9mot/8rYYQ=;
	b=NqUswFW4VC7HLZFSGV7v+Kio1jx00fk9SUAI/zDNK8jb17/GbDiFZ/y5pnlk5vI9gr
	j83wRU1uzhkxz/2tBSQ95SyIC4AF31LxtKT+11INb0CEuEMp/Ud+jkVorfGMEAUetZmW
	+m+PHVV3uv895fKQdGpq5ad1sJNXSyomL3gol8wwGEfarcKRSc4QNXSia9OoipTk4hbS
	l8qOYqKsD/+t5fCtyQmwuIu53OhsEDjd9C0QgoX6xmiPTZsVQFZIdq/mNp590gZksTYf
	U7YO61fYJlcum9e7ILBgVXhy6+90sxpMTGh0NdpiBlYzqwUbFWi3sGcfZZJO+mhREeK4
	nhNg==
X-Gm-Message-State: AElRT7G6e3LdHIQqoGDVjLrWxVO3zqgr2XgsTYBNT+9MtoULfYDLYN42
	x7Fb+N3pX1O7IVwi7sVyOaUg11Tg7uFgg+/K0Q96KA==
X-Received: by 2002:a9d:4c0b:: with SMTP id
	l11-v6mr7299781otf.258.1521798338985; 
	Fri, 23 Mar 2018 02:45:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 02:45:18
	-0700 (PDT)
In-Reply-To: <48f559bd-9f54-bcdd-1f3c-f6fafccfc54e@amsat.org>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
	<20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
	<CAFEAcA8Vti8NnrQK4U4kLuk=nNMC5=KiKjc6wT7cLDnCHFj-8w@mail.gmail.com>
	<48f559bd-9f54-bcdd-1f3c-f6fafccfc54e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Mar 2018 09:45:18 +0000
Message-ID: <CAFEAcA8fLGnPyM0R=O58BqYVYw6gbXtPcVQg0GFiM7n4=GWN8Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7d66Qdnnwbf1

On 22 March 2018 at 20:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> Hi Peter,
>
> On 03/22/2018 03:29 PM, Peter Maydell wrote:
>> On 22 March 2018 at 14:23, Andrew Jones <drjones@redhat.com> wrote:
>>> On Thu, Mar 15, 2018 at 01:34:41PM +0000, Peter Maydell wrote:
>>>> If the GIC has the security extension support enabled, then a
>>>> non-secure access to ICC_PMR must take account of the non-secure
>>>> view of interrupt priorities, where real priorities 0..0x7f
>>>> are secure-only and not visible to the non-secure guest, and
>>>> priorities 0x80..0xff are shown to the guest as if they were
>>>> 0x00..0xff. We had the logic here wrong:
>>>
>>> 0x00..0x7f
>>
>> I think 0x00..0xff is correct.
>
> I guess Andrew only suggested to correct the hex prefix in your comment:
> - ... where real priorities 0..0x7f
> + ... where real priorities 0x00..0x7f

Oh, right. Yes, can do that. I was confused by the suggested correction
being directly under "0x00..0xff" in my commit message.

thanks
-- PMM
