Received: by 10.223.159.74 with SMTP id f10csp6659141wrg;
        Thu, 14 Dec 2017 10:47:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBouUdEEh83bRmCH2Bub2u0g9cI3uuerg04FUGy2dPZKdPgIaJD5uE/s+8mcfheeN1gfHmE+T
X-Received: by 10.37.161.9 with SMTP id z9mr3125458ybh.258.1513277231128;
        Thu, 14 Dec 2017 10:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513277231; cv=none;
        d=google.com; s=arc-20160816;
        b=ohWncaqdcJ/5hsJgSa3BQOg8NapbeUzVYb4bCXqvQwRVoksUHLrC6ve8gqbNadQeHJ
         R6fVp08zEslnuIblw/l4gD5LXln6Ci24xQtKOc+/TAxYpBNStkEz3kPPPPCb0//3Qzca
         VX3XuEw/7JwIXjjSBoLvUdg/NE/VrVOo4EfQmhLX9O+I0dymOZvWuvGm4GHWwxzBMz2W
         bVCuuzfOqYCdNXHnA1uh77SKaB+m8I2J6OLy8YPznonQ/5tCrc1RB/XJ2Gydz0m6gvlf
         FQl1PaksEbZ/7AHV0K8LkXePktvL/SSWJFZm6nnRrgoEh3yTaYl8TY9vMokCCQI96f9V
         PG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5nTheaYzC+dBCu+FVU1SqmQ+TWI6y/ikV5LELkLfEf0=;
        b=Nb+biFFLQdxWMXzeUgiKR3gUNKLh+qcZcRIum8t1eQLxwEXaAUQSYdwOKo8yp7mo6N
         edX+WvQNBULZ45IY2r8vVd550W0AAO6itE7cxZAlYrG5nnGqEU6ldNEidNKTeQ7hGC81
         LW9JC2c0IGyizytMo9zfHmhZZdnJ62aNBnHQ7kNqsmKoOnEmWaLqARe8F+1SBmeMYyoa
         S/wrp3FYC3KBMjiGc/0RdmyJqEU7YTvzNvKPUo03fH1Ah6jAHm8Wo4/N0M/VUxN/1+4z
         sba/QOMjRakGEyDHMT7mZGh3n1bhZ3BnNwT0iEAoKDdx8DlTz0CiL0qFaQs2cVEJtw05
         ZIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aR/PbzWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l75si935450ywe.370.2017.12.14.10.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 10:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aR/PbzWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePYXG-0005bE-J2
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 13:47:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePYWz-0005ZA-8d
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 13:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePYWy-0002M3-9k
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 13:46:53 -0500
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234]:40673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePYWt-0002FS-H1; Thu, 14 Dec 2017 13:46:47 -0500
Received: by mail-it0-x234.google.com with SMTP id f190so13341354ita.5;
	Thu, 14 Dec 2017 10:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5nTheaYzC+dBCu+FVU1SqmQ+TWI6y/ikV5LELkLfEf0=;
	b=aR/PbzWPhLzb2ttOztm61NTVXsjNPNTnJLfsuI4JGbazOfI+w/iG2uUjL8DnTL2/Zp
	glPCVRORq5hB6z1mOapZgbdenCyu47swWMZv4GFhFc/BK/MzlCWr5gLVIwSECSu83iok
	//d9zx6nL8cp2ezkbebxzeoxNIy+2pNiXgzNAQxOIu4f3x3lPZ8GHSDbbY4yXKpmO5ca
	h2NfK+ZCpOtvtb5T9545LJMh/C/dPcr1v2Mw3OfPkBW1iWJzos/ELqBgG346IAEfs5Y/
	ff9mVMeQb749GWazwQlnl7ok0yg82CSgSs620MTGOwAEvH9yfr26YbzOm14L5DQABPCA
	mgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=5nTheaYzC+dBCu+FVU1SqmQ+TWI6y/ikV5LELkLfEf0=;
	b=UWwhq5wV5nLMZoZvNlA7/Uc5NJs9QyjuFmiHsWYV6CYTnGQMceKUdFwrHqOYq7Vlm7
	ssLPwm8JT2j/7NaA/AlBXhEwYXeyhw5/e7I7RxIgShP6HyIq5gKmraojVtWGz4On+8aR
	IiuKygqt33W30xty5CPE64Xdzmx47pfD0fdEzhKEiyolANFI6MwqpvqSRDtHRDVW17J4
	Ej5v3XyNVXrkTrNiE9WA1+JReS1NEYZsvoJ6N8bzFzu6irc6xB6axWR2s1KG4cxbSPE+
	Ed/T8sLn8GUGVAc8S30e7BxH7OCAQ8tTsf9pcNFmo4AxA9lb8OT7/X0TF60zAlFtk8E0
	8yuA==
X-Gm-Message-State: AKGB3mJ44UvAeRq/6A1ZYUre4+ORb0wGy4SzBvEuKils3+CraU6kzprT
	hckNYtx9z9MdaQlFKCO8sO+A4pTeFCHR//4SMto=
X-Received: by 10.107.89.10 with SMTP id n10mr3869386iob.224.1513277206708;
	Thu, 14 Dec 2017 10:46:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 10:46:46 -0800 (PST)
In-Reply-To: <20171214171810.GA18098@stefanha-x1.localdomain>
References: <20171213213557.26561-1-f4bug@amsat.org>
	<20171214093907.GA14433@stefanha-x1.localdomain>
	<7bc179c8-5699-98b0-8a5b-b4d8e6843b25@amsat.org>
	<20171214171810.GA18098@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 15:46:46 -0300
X-Google-Sender-Auth: ntJ1ib7QoM1DnUzt3nXSiGMnUyw
Message-ID: <CAAdtpL7_tHk3GUep8r-cFc6fVS8Pj42DYbZQuY_CkKGoiU6V4Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::234
Subject: Re: [Qemu-arm] [PATCH 0/6] QTests: use Python to run complex tests
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2g+JMmT6nKQn

>> > Is there a specific reason why adding SD Card support to libqos is not
>> > possible in C?
>>
>> Short (joking) answer: Would you write tests/qemu-iotests/041 in C? ;)
>
> 041 is not a device-level test.  It doesn't poke device registers, it's
> a functional test.  In my email I said I support using Python for those
> types of tests.
>
>> Now thinking about the specific reasons...
>>
>> What I intend to do is add qtests for the SDHCI implementation.
>> There are different revisions of the standard specs.
>
> It would be great to have SDHCI support in libqos.  PCI and virtio are
> covered today and support for more busses will help reach that critical
> mass where tests can be written for most QEMU device models without
> first writing a new device driver framework.
>
> Please post your SDHCI test code, so we can discuss the details and
> consider whether it's more like 041 or more like tests/ide-test.c.

The SDHCI test is like ide-test, poking register.

Being not a 'generic' series but only SDHCI I didn't Cc'd you,
you can find the test here:

http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02391.html

and the SDCard python test here (you got this one):

http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02350.html
