Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3564741wrh;
        Tue, 7 May 2019 05:20:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIf0I+pBTtJElVI7Li2TBqON4MrHCA8wH/bJHIZ82lGPC7F7HRAW+N/JrzNz7tkFFb2TeT
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr19960399wmh.86.1557231645967;
        Tue, 07 May 2019 05:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557231645; cv=none;
        d=google.com; s=arc-20160816;
        b=LFknuyOwBov88T8G2pKavo6UACN6/g+wd1fs9erjr4EqUKy/FWHtjNdyDv4ZyJI9w6
         /6IGsVYhB/gfdwrlTSHv9+fpwigL6G0d81taD3ai4YeNQ66XuhSwaT/KPMwnqDRlHvXU
         cBB17tPTGm+up0kiJSEmeb9iobjz68RgCsoBnH/zmsuw6bjMAFBPKqaf3qYf0dnfFXLS
         Hl3Te/TgJc4H2Vr0jYY0iGP97PTJq7WS51L3vfNab31eDDx5RiOSD+jgXnYPoluHzOLZ
         kTzCSZria/mE/grumFugO+6ZcvLfvt/A3CO0DHEfBsqcpnjNcgmEUCcpbJJ7E/0oFs59
         luDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=wQ7a3IoWn+D7T/gfxNx8haQpPb+SKrfVTmzRpH2Sn54=;
        b=YolPHlv93hnPOl9Yfi6kKskyQahGPh/8RTwDoToKdz0UYBCG2RCwwe1KtVDH1xbHh7
         aMRqMRgjorwOcTV/HsIvBV5BcWjR7VQyU3VBkF5S8yL3NFIwKLhtOLlQK3OmHQ26uK+p
         8T3dWCQbKKTHrWxfLgisjCWbQr19hEOC6u3ZOukQhbiYZtZ/bFV8zJ0kSgvtOj7JGPst
         iqm0vkXCcJjvC4D1F6NNNdrN13/EwDPh0U7XyaJE9ZgwI87VVeTnZaFOco4r4ExT5cTo
         KWvMn+W3gV8wKl/pyXNezckEI/BWm8euNsh32bXnSkZRFDT58RAcqSsOvSRdurUDcrLh
         cUSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si9881115wru.324.2019.05.07.05.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 05:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNz5Q-0006Qi-Rw
	for alex.bennee@linaro.org; Tue, 07 May 2019 08:20:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNz58-0006LK-1Y
	for qemu-arm@nongnu.org; Tue, 07 May 2019 08:20:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNz56-0000RC-Qy
	for qemu-arm@nongnu.org; Tue, 07 May 2019 08:20:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNz56-0000P7-6k; Tue, 07 May 2019 08:20:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 753A1C02490F;
	Tue,  7 May 2019 12:20:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-130.ams2.redhat.com [10.36.116.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E05C764049;
	Tue,  7 May 2019 12:20:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190505135714.11277-1-thuth@redhat.com>
	<CAFEAcA_utmcMFAmaGL5CJm4erBg2dZWZpdGvETRqVukOxrdpPg@mail.gmail.com>
	<c304a9df-1b8e-8f15-1daf-6e916dca3743@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <f72b6da4-1f76-a0eb-124e-6e4b20cfe5c0@redhat.com>
Date: Tue, 7 May 2019 14:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c304a9df-1b8e-8f15-1daf-6e916dca3743@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 12:20:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/28] Kconfig for Arm machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHx+/2E2vAky

On 07/05/2019 13.52, Philippe Mathieu-Daud=C3=A9 wrote:
> On 5/7/19 1:01 PM, Peter Maydell wrote:
>> On Sun, 5 May 2019 at 14:57, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>  Hi Peter,
>>>
>>> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a=
6b04f7:
>>>
>>>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pul=
l-request' into staging (2019-05-03 15:26:09 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-05
>>>
>>> for you to fetch changes up to 55e5578fabf744e62038f7357369a68e460fe2=
05:
>>>
>>>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-0=
5-03 17:06:20 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Kconfig settings for the Arm machines
>>> ----------------------------------------------------------------
>>
>> Hi Thomas. My test setup that does 'make clean' before the build
>> failed in 'make check':
>>
>> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_BINARY=3Di386-softmmu/qemu-system-i38
>> 6 QTEST_QEMU_IMG=3Dqemu-img tests/ahci-test -m=3Dquick -k --tap <
>> /dev/null | ./scripts/tap-driver.pl --test-name=3D"a
>> hci-test"
>> qemu-system-i386: Unknown device 'ich9-ahci' for bus 'PCIE'
>> Broken pipe
>> /home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:143:
>> kill_qemu() detected QEMU death from signal 6 (Abort
>> ed) (core dumped)
>> Aborted (core dumped)
>> ERROR - too few tests run (expected 74, got 0)
>> /home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:903:
>> recipe for target 'check-qtest-i386' failed
>>
>> (all the builds that are just incremental without the 'make clean'
>> worked ok). Any idea what's happened here?
>=20
> You found a bug in hw/i386/Kconfig :)
>=20
> I noticed this while working on refactoring ICH9 for the Boston board,
> but didn't expect the Q35 machine would suffer the same issue.
>=20
> The quick fix is:
>=20
> -- >8 --
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> @@ -80,7 +80,7 @@ config Q35
>      select PC_ACPI
>      select PCI_EXPRESS_Q35
>      select LPC_ICH9
> -    select AHCI
> +    select AHCI_ICH9
>      select DIMM
>      select SMBIOS
>      select VMPORT
> ---
>=20
> I'll send a patch.

That config switch is not available in upstream yet, it just got
introduced by my series. But that's the right fix, I think, so I'll
squash that in and try again... (it's just weird that I can not
reproduce the build failure here locally)

 Thomas
