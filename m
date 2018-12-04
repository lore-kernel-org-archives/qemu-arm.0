Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8093060wrt;
        Tue, 4 Dec 2018 05:54:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UcsLtf2MeleUnmKZxXaKLCQKgM8IfGZcdZI+hUJqNAi6ooOuHZKLOE3SPH0zwWTLwhCJXr
X-Received: by 2002:ac8:544e:: with SMTP id d14mr19646553qtq.279.1543931646797;
        Tue, 04 Dec 2018 05:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931646; cv=none;
        d=google.com; s=arc-20160816;
        b=xvS85jgObTiAjtfPhipL619y+ylbxRRwM6tSP7giO4XfQRuRkE7pn/340ShXzcS0x7
         I0aS588c6BLu0ywyF5eDFkgnBexat3LGUiozf4nXUmNlvoyvrqizl/Nlv1rHC6I1BrxP
         nwGtQycO22BAGOPEiX5lpY2QKKHX8JlW3vSjYjR8NjsNtHT1A43toEMThdvayLyHzP8p
         +KbCr3IfgWRhsaRT6WZHpYZbPIEnMk4j78Hixwm7XVAibsO2j0IqTy7I1hNIazqIuyLS
         F/n/p84rRMI+JcZFg1JGmMpvChOzhTB7V7XqyHfp0Ur93nV38CZCOh+CY/+4nlfa78gW
         nlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=dgoqXYrHZOkFPpo9t6d4+RsWvNTy3M++KNAXRkkfi6I=;
        b=EpGiVToahCOzSuLzTYC9z+jO6sudRUZdAHDJbK+dBZw6hXd0DXAOy7Yq8PsTg7JYgx
         W8lJiegCwLGBMl0pUkj9BvSNPlBf/BKJAyJTJviFOMwEr7lj5zcI5tGk4aIO/+L6ThA9
         yGQNYJz4Iyxyp0aqnvaN1ArR3RYRth4SFAAf+1LtWIueJpPs7EqTnRfLwu59QTmrvJJg
         27lvEI74Hz+Tn5IZaY9sZolnZ/cXwGBmVFMrW+9IA6iFFgI1rtMw3NPG+Xe+ulwRZspT
         +EMfTdvedQJ3zUd01RF/ZCjWYRFLhuoxfebhCZzLSO57qzZBFBd/kWeunWFchArhQ4mn
         6K8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si3862530qkp.91.2018.12.04.05.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUB9K-0004Lg-Ak
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:54:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gUB8x-0004KR-Jp
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 08:53:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gUB8w-0005n5-Ot
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 08:53:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30319)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gUB8r-0005fO-FO; Tue, 04 Dec 2018 08:53:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAD16811D6;
	Tue,  4 Dec 2018 13:53:35 +0000 (UTC)
Received: from [10.36.112.72] (ovpn-112-72.ams2.redhat.com [10.36.112.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D857EB61;
	Tue,  4 Dec 2018 13:53:28 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
	<CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
	<9ad451bd-7eb1-902f-6023-4b48bb84249c@redhat.com>
	<CAFEAcA-tzZVVXk+vV=uWOeL6dU3EnFiFRzLu8KR69Ju4PsPrJg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <149484eb-c59f-2b22-aa45-d4e5f0abac07@redhat.com>
Date: Tue, 4 Dec 2018 14:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-tzZVVXk+vV=uWOeL6dU3EnFiFRzLu8KR69Ju4PsPrJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 04 Dec 2018 13:53:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C3xVb6YbBi1I

On 04/12/18 14:43, Peter Maydell wrote:
> The point about PCI is that it is the same everywhere and
> discoverable, and easy for the user to add to the system or not.
> MMIO requires extra work for every board model that we want to
> put the device into, plus extra on both kernel and QEMU side
> for every system description mechanism (ACPI, dtb, whatever
> some future architecture might use), even if we have the basic
> "mmio pvpanic" device code already.

Looks like dtb is becoming a standard?  Even RISC-V switched from their
own system description to device tree.  Anyway, this is not too
important.  I agree with you about discoverability, on the other hand if
we could have something defined by the vendor rather than QEMU it would
be even better.  (Even better would be something that distro kernels
already have support for, but that would be asking too much probably).

>> Also, while reusing code in general is nice, sometimes there are
>> platform-specific ways to do it.  For ARM, for example, would it make
>> sense to use an HVC/SMC that "extends" the PSCI, and pass the number i=
n
>> the PSCI device tree node?
>=20
> If you want a hypercall then these days the arm HVC calling convention
> includes mechanisms for discoverably determining whether a particular
> hypercall is supported, so you wouldn't need to pass anything in the
> ACPI or dtb. But I didn't get the impression that anybody wanted a
> hypercall for this particularly.

Not for x86, where each hypervisor has its own hypercall number and even
its calling convention.  But for ARM it already makes more sense.

>> Related to this, is there a more or less "standard" watchdog device on
>> ARM that could be added to virt?  There is the SBSA watchdog, but it's
>> ugly for implementation in KVM because it counts down with frequency
>> equal to CNTFRQ (which I'm not sure if QEMU has access too, and also i=
t
>> doesn't play well with live migration).
>=20
> The i6300esb is PCI, presumably that would work?

Yeah, I was wondering if there was something in PrimeCell.  I found
SP805 exists now.

>>> I notice also that there's a mention in that thread that the pvpanic
>>> ACPI table entry on x86 resulted in unhelpful Windows notifications
>>> about new devices it didn't understand. Is that going to be an issue
>>> for Arm with this mmio pvpanic ?
>>
>> Yes, it is probably the same as for x86.
>=20
> I guess we need to find out if that is a problem before we can
> merge this, then.

As long as the pvpanic device is not added by default it's okay.

Paolo
