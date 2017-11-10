Received: by 10.223.150.237 with SMTP id u100csp3727323wrb;
        Fri, 10 Nov 2017 04:57:24 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZMM5EhTAyITIXmDB5a5KI2OHEW1B7ftIjK4LR4cU5nnSaGVSKjufRfOnCeQWSVZf6ELWS7
X-Received: by 10.129.196.12 with SMTP id j12mr171167ywi.393.1510318644301;
        Fri, 10 Nov 2017 04:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510318644; cv=none;
        d=google.com; s=arc-20160816;
        b=ntuLT/IVwyce1JnRA6m4VyrAVYX8AQz1RTVIzHXGTc8mQEsxUmrdDYMc87XyR84CEZ
         +25psc2ySR8OF0whPelakzwqqdTFmMTSeGow/Abk+dwvQlwAkRqGHUEZdi/ETapNDTlX
         WP9KV9gMLsP4jP0zPQWnZXgKYcHVEO3rnmK9G4D4bmG2FPnY4qLg/AHun77eOd26jw49
         JxcllO69kPbjt653qGQoMDclfA0Nc7UnlVWmCsGGkbJquGGUl0Y7XYxrZW5G+p9cMYew
         e6z44iXGfMn8VkLZnna6fJF3p2zn9/un4+eyt2vkziw6AlBDFxULq3luwhY3SoUKo0Pj
         6TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=VbVNaMJ8ReOtN5I2BvPGbokPJTzXlyZ7T6VO3/bSDH4=;
        b=P3dzgE07k/NItIUeBBSeJuW/cWvPz1JPJPcccVI8HfuVHvsetHCIz54H/mYvVgbBfE
         fTyEnJ0xyx3X6dsMlgCaoZlQzpamrKNLZpmfbwvGqlP2sRpJLDtSTMBINVjPPZVTKkOO
         uZV+lI2NPjNV6tIEn3kd3ITTMFbpQ8uMiLZKyTrDI7aJljDh4M+us6bQGLJWgOts0zND
         IpoFGvOhiBYkHXXqXPxHH2unnYi9DuypFxFAtoIQX4WcmWfyL8Es259pMOfAIwF4e/fe
         V0jRbeiZdpPIT40W9bk4d2H0XjY8wjZeXwPZT5jiVK1UFy6dn+mq5KumTmCGLx713gtf
         Jbew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fN6CMFXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3si2127397ybb.516.2017.11.10.04.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 04:57:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fN6CMFXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD8s7-0005Xk-PG
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 07:57:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eD8rv-0005Xb-3H
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 07:57:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eD8ru-0007s3-4J
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 07:57:11 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:40680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eD8rt-0007pL-UT
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 07:57:10 -0500
Received: by mail-wm0-x241.google.com with SMTP id b9so2563274wmh.5
	for <qemu-arm@nongnu.org>; Fri, 10 Nov 2017 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VbVNaMJ8ReOtN5I2BvPGbokPJTzXlyZ7T6VO3/bSDH4=;
	b=fN6CMFXLlT/9yANVPnBrNrvqxIS+ZaF2xQY0ZAovSw4fXG5v1DG4NF5e053PKvrSLb
	lGXeHATJiZULlpY7WhUvkFswu6urG1DyvhfnVFAQWq206ym2Fr6ChaAPz6VMlP1A9JDb
	qRWMJj11FJoAngukvI4CrlW2Vuh9rsOS42bto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VbVNaMJ8ReOtN5I2BvPGbokPJTzXlyZ7T6VO3/bSDH4=;
	b=o7mZxc1bfj6aozVMehu4F9fE7/OkL+/hLT/h/Mf7YtDuznt91VXX6GuPBxBDCDXThE
	IOx9nxD0f3skR362ygcoF71+u37QvbSlvke3f0RvRJU7sqopeTjef2t1SASAvLt3Rnp7
	uq+KvCjY36LX5fH0/Hw0zK3vEWerKidM+ohXuy/eV/Ql2r5tH2aJptmAZjmfVPLLfb5F
	jcVfBDZCdynRS5bhmyzrVFcG3+Nw7/j2+KEnU9xUDC8/4kSMnyXchrxZKssR+J342p/W
	ddBrXFsrz/KCcB8Imat0Gg4k3LtX4tIoGZJZWRmYJnGsYG/WFdKcSKQOVgdDRGNgM6bc
	wNuA==
X-Gm-Message-State: AJaThX7DoY/IaxLaYYS/t4UkHVlYJeRnloOMpA0WpdbuuBXQ9HUdv9Za
	R5dlcTqtVX1R6qopiRnchjSgu6gH/kV4EzFEMsyWRg==
X-Received: by 10.28.46.136 with SMTP id u130mr137169wmu.127.1510318628463;
	Fri, 10 Nov 2017 04:57:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Fri, 10 Nov 2017 04:56:47 -0800 (PST)
In-Reply-To: <5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
	<5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Nov 2017 12:56:47 +0000
Message-ID: <CAFEAcA_0jvR90=N9Pd+oA2U6Yy=oF7vvNV67cEAsUYQFcup9KQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZMnV/PCtfEkx

On 10 November 2017 at 00:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 11/09/2017 08:55 PM, Peter Maydell wrote:
>> I don't in general expect to take pull requests from
>> everybody listed as a maintainer in the MAINTAINERS file.
>> That just means "I'm going to be reviewing and should
>> be cc'd on patches". Pull requests are sent by people
>> who are maintainers for a subsystem. Rule of thumb:
>> unless somebody asks you to send a pull request, you
>> don't need to do it.
>
> Ok, please apologize my misunderstanding. I still think the M: entry
> stand for 'Maintainer' instead of 'Mail', and still don't understand the
> difference with a "Designated reviewer" (R: entry):
>
>         M: Mail patches to: FullName <address@domain>
>         R: Designated reviewer: FullName <address@domain>
>            These reviewers should be CCed on patches.
>
> "Designated reviewer" seems to duplicate the M: entry and is therefore
> confusing. Can we simply remove it instead?

I hadn't realized we had an 'R:' tag in MAINTAINERS...

> --
> Some people are not content with the amount of mail they get, and would
> like to be CCed on patches for areas they do not maintain.  Let them
> satisfy their own appetite for qemu-devel messages.
>
> Seriously: the purpose here is a bit different from the Linux kernel.
> While Linux uses "R" to designate non-maintainers for reviewing patches
> in a given area, in QEMU I would also like to use "R" so that people can
> delegate sending pull requests while keeping some degree of oversight.
> --

So, my view, based on what happens in practice:
 * "maintainer" means you are in effect accepting some responsibility
   for the continued maintenance of some bit of the codebase, ie
   you actually will review stuff
 * "reviewer" is a bit weird but I guess is just asking for cc:
   without promising to actually do anything
 * somebody who sends me pull requests is effectively somebody we've
   given the ability to make direct more-or-less unchecked commits
   to master, so that is given out more sparingly and for larger
   subsystems

But MAINTAINERS is mostly about what submitters need to do (ie
who to send patchmails to), so it doesn't particularly document
how patches flow onward into master, which varies. (For instance
the block layer folks have a two-level setup where some trees
get merged into others before they go to master. ARM devboards
go through me, and "maintainer" just means I let somebody else
deal with the device specifics if possible but am still the
reviewer of last resort.)

thanks
-- PMM
