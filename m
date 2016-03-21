Received: by 10.25.208.211 with SMTP id h202csp1350731lfg;
        Mon, 21 Mar 2016 08:57:22 -0700 (PDT)
X-Received: by 10.140.96.22 with SMTP id j22mr40911249qge.92.1458575840857;
        Mon, 21 Mar 2016 08:57:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48si11640991qgd.15.2016.03.21.08.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Mar 2016 08:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:58539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ai2Ci-0005U9-S5
	for alex.bennee@linaro.org; Mon, 21 Mar 2016 11:57:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1ai2Bu-0004CB-Le
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 11:56:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1ai2Br-0000uY-F9
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 11:56:26 -0400
Received: from forward19j.cmail.yandex.net ([5.255.227.238]:47136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1ai2Br-0000rs-57; Mon, 21 Mar 2016 11:56:23 -0400
Received: from web6j.yandex.ru (web6j.yandex.ru [IPv6:2a02:6b8:0:1619::306])
	by forward19j.cmail.yandex.net (Yandex) with ESMTP id 5612621B12;
	Mon, 21 Mar 2016 18:56:20 +0300 (MSK)
Received: from web6j.yandex.ru (localhost [127.0.0.1])
	by web6j.yandex.ru (Yandex) with ESMTP id 63FBB37006C4;
	Mon, 21 Mar 2016 18:56:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1458575779; bh=S/eq2IF37Bl3FAPPEDMIXjSPh2jandUg8gqWLo9bBuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EgoBajCmyogJDxOPQ1mac7wBpN0wxgbz84eoxrWDg/BHl3OPzDbgAYn3aEecDPMPK
	oFP/PTel74mrmbU5yOB3ubu50MrN7w8iGlam3B2bW7DNjJ7cPlxhLRPN1ZqqUbBWDj
	puStDBJgAAJkU62COGtKP3iMFX6NtN6tQvzFct0A=
Received: by web6j.yandex.ru with HTTP;
	Mon, 21 Mar 2016 18:56:19 +0300
From: Sergey Sorokin <afarallax@yandex.ru>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_+znhWyJFWC3eMi8JiZw-nb2MyK_+uD6Fww76reinoeQ@mail.gmail.com>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
	<CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
	<628941458228094@web26j.yandex.ru>
	<CAFEAcA_+znhWyJFWC3eMi8JiZw-nb2MyK_+uD6Fww76reinoeQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1362381458575779@web6j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 21 Mar 2016 18:56:19 +0300
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.238
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
	in ARM address translation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zEcmJglI9FID

17.03.2016, 18:24, "Peter Maydell" <peter.maydell@linaro.org>:
> =9AOn 17 March 2016 at 15:21, Sergey Sorokin <afarallax@yandex.ru> wrot=
e:
>> =9A=9A17.03.2016, 14:40, "Peter Maydell" <peter.maydell@linaro.org>:
>>> =9A=9AOn 13 March 2016 at 18:28, Sergey Sorokin <afarallax@yandex.ru>=
 wrote:
>>>>> =9A=9AIf you want to implement the AddressSize checks that's fine,
>>>>> =9A=9Abut otherwise please leave this bit of the code alone.
>>>>
>>>> =9A=9A=9AYou said me that my code is not correct, I have proved that=
 it conforms
>>>> =9A=9A=9Ato the documentation.
>>>> =9A=9A=9AIt's a bit obfuscating when the doc explicitly says to take=
 bits up to 39
>>>> =9A=9A=9Afrom the descriptor, but in QEMU we take bits up to 47 rely=
ing on the check in
>>>> =9A=9A=9Aanother part of the code, even if both ways are correct.
>>>
>>> =9A=9AThe way the code in QEMU is structured is that we extract the
>>> =9A=9Adescriptor field in one go and then will operate on it
>>> =9A=9A(checking for need to AddressSize fault, etc) as a second
>>> =9A=9Aaction. The field descriptors themselves are the sizes I said.
>>
>> =9A=9AWell, may be it's enough just to change this comment as you inte=
nd:
>>
>>>> =9A=9A- /* The address field in the descriptor goes up to bit 39 for=
 ARMv7
>>>> =9A=9A- * but up to bit 47 for ARMv8.
>>>> =9A=9A+ /* The address field in the descriptor goes up to bit 39 for=
 AArch32
>>>> =9A=9A+ * but up to bit 47 for AArch64.
>>>> =9A=9A=9A=9A=9A=9A=9A=9A*/
>
> =9AThe comment is correct as it stands.
>
> =9Athanks
> =9A-- PMM

I mean in the patch.
We need to fix lower bits in descaddrmask anyway.
So:

I could describe in the comment, that the descriptor field is up to bit 4=
7 for ARMv8 (as long as you want it),
but we use the descaddrmask up to bit 39 for AArch32,
because we don't need other bits in that case to construct next descripto=
r address.
It is clearly described in the ARM pseudo-code.
Why should we keep in the mask bits from 40 up to 47 if we don't need the=
m? Even if they are all zeroes.
It is a bit obfuscating, as I said.
