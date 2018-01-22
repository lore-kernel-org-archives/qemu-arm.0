Received: by 10.28.71.27 with SMTP id u27csp3101228wma;
        Mon, 22 Jan 2018 10:06:56 -0800 (PST)
X-Google-Smtp-Source: AH8x2279txI4anj5Ch3y7uTkyXtnqfLhk5SDPwYw9nkT5JG7HJtwkhugm3KrKJSTnGEK0oO3Zhvo
X-Received: by 10.37.214.76 with SMTP id n73mr8235540ybg.319.1516644416510;
        Mon, 22 Jan 2018 10:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516644416; cv=none;
        d=google.com; s=arc-20160816;
        b=HUGCZzhFj90m5plPLIQYJZ8l9IHHIQRYxt5lcoZ46zmVKBLMs6Umx30DP6IU5Zrg6/
         0wtfCQaeHyu48Yex4LKdGmtCI1iro8AFkh0B8f/3oxTF3GbnePL8c7nh3ucNCJ9GoIoH
         0cM8cB4HGup6EEL+GW2BnY3OKzcwCJZpjvB5yoRMVAP4h6WmJff2XBbML5bMbchOBGTE
         ss8eAq9QqKPY1svISDmJE5hYjA1X9zNu7YPzch/DOTLRd+atLVfTSN0DqvWLBhCmVO/p
         mjrkYEz7xrrqo13bOkfHMeEHvtb9knuIYGCiaZpvWkVp0kPQ6DeSqQuy3BwpzDfjlIKm
         oGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e84aNtN79RqnmNv3o6tzs7E1cCJea35j+J2949EV7os=;
        b=pz3SjBgOkEXCfgzvpmLhE5kWtJGunVORVT1/JRPvCHqHK6UIRG56vNGsWF28/sJUCs
         pFDmmveoaeUBk+1BmE5H1L/v0nlUYF9V6KAGcERuEfteQG/W8UX/xUdyzTvR7pGDikQu
         tsfe5YGf2Eq9JZFWzWcduq/Y04hqLfLvWK5AugZ4KVTLFxSqfYYg/kXS+oKjZkOTo/bL
         z/P4YkuU/8HNSkJt00KnXC+nqGIUPgZcdSDilQB6sjbz95HRvH4AufGK8GRO9cqucC2a
         huWtvNRqcPWsZDXDjKuJKrKE+FwnHOAnlQe+gAlKx2p1j2tBK6uQ59ukaH53k32D1QFF
         o80A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GEkVmrxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si3734361ywi.218.2018.01.22.10.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 10:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GEkVmrxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edgUh-00005H-UF
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 13:06:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edgUa-0008WT-9M
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 13:06:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edgUZ-0001Ha-BH
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 13:06:48 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1edgUZ-0001GQ-4h
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 13:06:47 -0500
Received: by mail-oi0-x244.google.com with SMTP id y141so6578453oia.0
	for <qemu-arm@nongnu.org>; Mon, 22 Jan 2018 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e84aNtN79RqnmNv3o6tzs7E1cCJea35j+J2949EV7os=;
	b=GEkVmrxhbuu1+/PtjkvlPwpSzjljK5hyuKn/lMJvRc9cHzceScvLNQxB5EM1LkPbkD
	ZXw75Gk+7ZkmdHGDD/ZC5fiaxccU5stzwIhKthHNZaElplV3B98/FGqa56dg2ZkDrh1j
	v9o88TSiTfBnO/w7U9Nb2ua7WouqGqfYGP+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e84aNtN79RqnmNv3o6tzs7E1cCJea35j+J2949EV7os=;
	b=p+TdeGZH71GkvTc3SeNJwomNu6WTxlGwEjP8DcqI+VczdwNL7OkFo4TnXNBxl6ybNU
	MtkIX5mrzVgsNO/dKnZHPWmOwVmRbbpOBEAp4X/z58dGzzbwZld7Wp/d2yDwys9CQKZR
	5uSA9EpidPxXW9fcjX7eH4F1eRFL/+xlZNaHgSe4sC5ZqAhTrWeuOURRS5YHgx2BsGqR
	2dh89jWWIqQKSSYwFXs1rH2D3RJtgvcXisWRsfoedWg589KnN7KoL2OsthxpN7KPs0FV
	o6lA2Tu15O2yxsag3Ygo4CpVmepLHsJP4M5veyyDRG5WwwzXV1jpp016lLaKOMrThrIU
	DXzg==
X-Gm-Message-State: AKwxytdwrS/kNjAp5bvZqtBvvz/3jNG/hpYQjKSk2G2gP5wx2/2taM97
	id5JvsbEaDM+uvCWESbVahBHhA9gr+x9psZ1kTA2Cw==
X-Received: by 10.202.180.133 with SMTP id d127mr4669951oif.328.1516644406475; 
	Mon, 22 Jan 2018 10:06:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 10:06:26 -0800 (PST)
In-Reply-To: <20171209010811.GJ3037@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 18:06:26 +0000
Message-ID: <CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oMRGly3c837o

On 9 December 2017 at 01:08, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, Dec 07, 2017 at 07:37:31PM +0000, Peter Maydell wrote:
>> On 7 December 2017 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > This patchset adds support for '-cpu max' to Arm, along the lines
>> > of the existing support we have for x86 targets:
>> >
>> >  * under KVM, -cpu max is the same as -cpu host
>> >  * under TCG, -cpu max means "emulate with as many features as
>> >    possible"
>>
>> Forgot to mention: -cpu max for qemu-system-aarch64 will
>> be a 64-bit cpu, and for qemu-system-arm it will be a 32-bit
>> cpu. (This differs from all the other TCG CPU types, which
>> behave the same for the 32-bit and 64-bit binaries. I think
>> it is the same way that x86 -cpu max works, though.)
>
> Are they going to be represented by two different QOM type names?
>
> (In the case of x86, all the CPU classes have different names on
> qemu-system-x86_64 and qemu-system-i386).

(Just pulling this thread up from before Christmas...)

I guess a better way to approach this would be to ask: how is
x86 implementing -cpu max, ie what is the required view of things
that I need to provide for target/arm in order to have QEMU
behave the same way x86 does? Did we write any user-facing
documentation for this feature?

(The code in this patchset makes '-cpu max' give the same
QOM type name for both qemu-system-arm and qemu-system-aarch64,
with different behaviour depending on the binary. If that means
we don't provide the same behaviour as x86 then I can change that,
but I'm not sure where the difference is exposed to the user?)

thanks
-- PMM
