Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp810045wrq;
        Wed, 20 Jun 2018 07:06:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKWZZkwWILFTs+VmAgxfvuF44t2hGKuTNG8eS71Oxg481nAvWxYmWvsTJgEEgFSWYy2xENu
X-Received: by 2002:ac8:21a7:: with SMTP id 36-v6mr19022567qty.252.1529503597561;
        Wed, 20 Jun 2018 07:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529503597; cv=none;
        d=google.com; s=arc-20160816;
        b=P3Ttrg/XjzsSfZpZkzSyERHKZBjYgkCoSkylXmknQIzHxlNDhCXEsBIDHvaSIlGan3
         dwS/RfFVHUPtUITtmypKLg064D99NgySoqK3KPxQEi6cVe8s/Xe4LEUxANMtTY3e4oFT
         l9Veuc+ZA+WA1r33jxBxlpbX4gYUq0VCbNwKKs4+uIv1pMsKyXsTZR1W/9Gou9MVC3f8
         tLbVvS2vz/CskMBeJXJwBrLFQKr5gPRr8MC1QbqiCF3/QqE0UPAd24qdhbMiYgX4M6RH
         lkvfXuVShKK5RJUQA642tfFzkyTRwZJGctlACFuAwAReLkLTga8oQqJfNhw9NNublcGD
         tDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bmQAs2Tnr9bjwSkzuf+D2T/jE4Uw/TCDSdJOq8Lk1d0=;
        b=uMkmgzok+bVjaZ513l2z5lnqSX3UwR/wuNQbEAfERPWM8QmIHLbplfjcS12mHByzYC
         eNfdKVa/zC8str8viPACCUiV+wNf4lyqNVNe4m/cw0jVSYbWFHIzfAbP13u0y5HoNaHB
         MU3mAsQjdxMWO0LaMPXFcENbmQi+roM6LPAEVF9nzzhbgnM3JTy6PdPcoONCwZWboz/C
         OpcmlgZhohmlbibvtDfuNTTi4pbPetTATesq6jKNqmLItm3j2JeJJKGIiKSrHc3+vsnW
         IFQHop71/Z4BX06wf6/GeX8vLWedvh26pBpCdrTZ+FUxgVHD0oEHRdLu6JPw2j+pWaJU
         llYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvmSfvvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9-v6si2360513qtc.88.2018.06.20.07.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 07:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvmSfvvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdkr-0005LQ-2j
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 10:06:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdkg-0005K9-Rd
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:06:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdkg-0004O6-2I
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:06:26 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVdkf-0004Nq-TG
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:06:25 -0400
Received: by mail-oi0-x243.google.com with SMTP id 14-v6so3126531oie.3
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bmQAs2Tnr9bjwSkzuf+D2T/jE4Uw/TCDSdJOq8Lk1d0=;
	b=RvmSfvvkVG6mR1EhFk4MX+wDs8C9Js+9M+ljzjLtXMVTc/MvqAlKzvJHA6X14rgYw1
	cuG0tQOEx0pBqfR20ubJkivbKdsPoFjsl8N8rq0PrME6ioD9kvKcYswQgqfntUA9c9nz
	9WDkPMjLjglwO44cq+vjiIg/8S419ZKd8h5po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bmQAs2Tnr9bjwSkzuf+D2T/jE4Uw/TCDSdJOq8Lk1d0=;
	b=aMmhxrzQhuiR1cD/PV2pvYGFds7ojsEVQvz/W9DuVzDX3S65k5qfUL99mirgp5ho5P
	6djJrCoswqXGHHvJQJuULPZU5foSV6PHGUYUYNlPTUqSOTNIRoLVbwkS8xhXfmUM6mjy
	ox5gw2mvDrqBZc4a7U7/DJQ12j44uTvsvvakYpF0yOqH3wOjfMK/yPkpiXM7A6UGYoJB
	csB53v08fouNAYbTtPAeqiF8RlE3JVBolljx1oCzoYe9pVff0CMOEdcngx2EqF6Nsm/z
	aeSzHd3e2ir4vg98fwGhvQZWWpNAHXPLSxD7hBIhqRZyudclORE+a6OEp/oturKXrqxv
	glgQ==
X-Gm-Message-State: APt69E0NBsS6e4RobmXp8y5lrhGlNKqD5bJB3yLWm7+rzt+EQvQkMNYZ
	u5Q64KeDclOPV233NRSOp4Uv3+MC1OSPOYKijjg6Ag==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr11118315oif.337.1529503585364; 
	Wed, 20 Jun 2018 07:06:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 07:06:04
	-0700 (PDT)
In-Reply-To: <7fc96a3d-f1e2-7ab4-a46d-3d3482cc5e71@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-wS9oy1JSgpwrCZie9GQaKLOf2wQxZOUtaLfw+HGP_GA@mail.gmail.com>
	<7fc96a3d-f1e2-7ab4-a46d-3d3482cc5e71@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 15:06:04 +0100
Message-ID: <CAFEAcA_s+LY-WS20HEi5xSkMRoA313To55kqeiX+GWW2qXq+XQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/11] linux-headers: Update
 to 4.18-rc0
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zcFQT6BpNZ10

On 20 June 2018 at 15:03, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 06/20/2018 03:57 PM, Peter Maydell wrote:
>> On 15 June 2018 at 15:28, Eric Auger <eric.auger@redhat.com> wrote:
>>> commit b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
>>> Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> What's 4.18-rc0? The upstream kernel doesn't have a tag by that
>> name and looking at the Makefile the last thing before 4.18-rc1
>> was 4.17.
>>
>> Still, since it is a commit on mainline I guess we're fine?
> Yes it is post 4.17 and before 4.18-rc1. I didn't know how to call that.

I've tweaked the commit message to read:
> linux-headers: Update to kernel mainline commit b357bf602
>
> Update our kernel headers to mainline commit
> b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
> ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm")

thanks
-- PMM
