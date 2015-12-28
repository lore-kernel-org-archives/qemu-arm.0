Received: by 10.182.158.201 with SMTP id ww9csp6921295obb;
        Mon, 28 Dec 2015 10:43:28 -0800 (PST)
X-Received: by 10.55.74.197 with SMTP id x188mr73294530qka.104.1451328208329;
        Mon, 28 Dec 2015 10:43:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g70si23263307qkh.92.2015.12.28.10.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 10:43:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:45838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDclU-0005Sv-2K
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 13:43:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDclR-0005PY-Bd
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:43:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDclQ-00069i-MX
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:43:25 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDclP-00069L-GT
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:43:24 -0500
Received: by mail-vk0-x234.google.com with SMTP id k1so55656437vkb.2
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 10:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mvuEFDXytASszk1JXNQLRpN1KoIS7piKI/nHbaF4quY=;
	b=SycMuyRUddR4HZW2Eapxfsg+hvF4Y66OS3BUWSFN4QxZGzILdzeKcScE1ZUEZk3I/o
	s24i5JjFTEGACZpDIlr26mG9RJaS+U14k6p3oeYh2/8iYBqv/0eDuig0yQq5mHGAw9K7
	oXyPQ5Zq4M0wPgKLwGNhHOl24zDPp3S8d1Kkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mvuEFDXytASszk1JXNQLRpN1KoIS7piKI/nHbaF4quY=;
	b=BRPv8+4vcdmfomJptrLM3bjkzX7oM+j7WeVoPQ6VxC3KUYrgaY7ZR3Jnw5hQmd/dRs
	/lDF0/+A7JX63IA9+jt7/jQs+hq+dKoOxiWHQqz2/Eh+0WfdqkrePXDlyxEbFqs6IacX
	KsJoaLXJf9+XWmho/FjMVXnTgd0/GmtAk75Snxky41uXX6jdudq6Rtn5Fw+5Zd+uZJpA
	22s0Om45FybBW5GyYHmIKlwPDprzZ1hO/Bk5/TIISU7qr8l820EWUIaLcS3jlxGsjUY3
	vgeZWrFAel1zNFR3oaG6DJhLz0Y4qkXzljPdgP3HIPpynovRJXwXxMjkx5/uadiMOFgC
	Fhbg==
X-Gm-Message-State: ALoCoQkP/z1In1h42Nv+9q02IjD7DpTT5u0JZQLTN7p3WWTINUT1U09had5jrH8ZH7eGmEXFX2UySYyUypCD+qFrDMQ9r5+kMB12/3xsEslM37P9sH0pMbo=
X-Received: by 10.31.52.147 with SMTP id b141mr28976218vka.82.1451328203097;
	Mon, 28 Dec 2015 10:43:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 10:43:03 -0800 (PST)
In-Reply-To: <56809768.3070902@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_qbaJjuZQB91dsN11U3pJRBXCJ25i00U1G8gu4OQFCtg@mail.gmail.com>
	<CAFEAcA8gajKJgAfGn3DZ432+a+KVFDziarpnsG2jRH2e-4pavA@mail.gmail.com>
	<56809768.3070902@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 18:43:03 +0000
Message-ID: <CAFEAcA8+P49=i=4=9oa=w706_8xf2fixGh1LYhdPE6nTM+MgfQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 06/26] armv7m: fix I and F flag handling
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
X-TUID: hYvZeu+t/wMG

On 28 December 2015 at 01:59, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 12/17/2015 10:18 AM, Peter Maydell wrote:
>> because the function you're calling here is in armv7m_nvic.c,
>> which isn't compiled into the linux-user binary.
>
> Is there any reason to include the armv7m code in linux-user at all?

It's not a useful cpu for actual linux binaries, but
I believe there is some use of the linux-user target with
armv7m to test unprivileged bare-metal code, for instance
the gcc test suite. (This uses semihosting for test case
output I think.)

thanks
-- PMM
