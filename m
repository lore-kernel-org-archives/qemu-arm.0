Received: by 10.25.21.96 with SMTP id l93csp379300lfi;
        Fri, 1 Jul 2016 09:28:02 -0700 (PDT)
X-Received: by 10.200.48.147 with SMTP id v19mr35348433qta.68.1467390481919;
        Fri, 01 Jul 2016 09:28:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184si2765078qkd.178.2016.07.01.09.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 09:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ1IP-0005Rx-D2
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 12:28:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1G1-0002qE-Al
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1Fz-0004tN-6e
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:25:32 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1Fz-0004tB-10
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:25:31 -0400
Received: by mail-vk0-x236.google.com with SMTP id u68so117013489vkf.2
	for <qemu-arm@nongnu.org>; Fri, 01 Jul 2016 09:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2BWkv7wAB9ln0SiVuSomQjYtPluhvuDD33xYMFaqWNM=;
	b=hNikBgFFdMeSTueG5XKVeMWCqGiGHMr8sz5+m08+Fio9GAVWJ+uYpaIxU/1HzYRzAv
	aIXm7+MHIGYqV29NmPmxEr6yCreMLZjakTK3b133fg2nJ3eO8rZEISGbNEUJlfiNV/fN
	k4q213Y4gPnhB2oWSc5igIqMPvZtf0I+v4dmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2BWkv7wAB9ln0SiVuSomQjYtPluhvuDD33xYMFaqWNM=;
	b=eVD+3rhri+nxdSEI5/IGDKSIL+lHD2ers6ibs1NeeJ0UlZVPT1imaqQNzOzTFgTqaj
	lTr17qbUcvZrDFqbMm+ZmgFhdOJt39DpirvFxqxFZ5fR3Z5B2bCBQ3+ko2zxedrFv+fo
	Dn3Y59EPNETO7kzQpat3xSeTL4f8vKUKLc3SClVzrTdaHPeX5ElvcL00N2WE9oydxfh3
	nfK90Gg+dSQGrRxiRHG9//jutYyl+3omDj6x+46eobjR3Nw1V363q6RjsnuSSgTMefxM
	POEA37KCFB9HURK7ZvicOAKP7328cDcI670VnlEHzYnaMsNS/HeynRIEbqFKfZ1tbfLH
	boRQ==
X-Gm-Message-State: ALyK8tLE64+mbi8TzQFm5BH8LoGYELg5jI8InoOpeIH0AvpHtW+Vp9EIgzwHl///Hagc9apu0zDy9AnGutADsj5e
X-Received: by 10.31.208.196 with SMTP id h187mr10019336vkg.120.1467390330570; 
	Fri, 01 Jul 2016 09:25:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 09:25:11 -0700 (PDT)
In-Reply-To: <1467138270-32481-1-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 17:25:11 +0100
Message-ID: <CAFEAcA-TwGtSBh+dHgeDNQH6WKAMsxP+juTmxHczCHZhyMFL1A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v5 0/9] ast2400: SMC controllers
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GwRB8lAU58zH

On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The following adds support for the AST2400 SMC controllers. The device
> model does not implement all the HW features, linear addressing mode
> is underway, but it should be complete enough for the OpenBMC distro.
>
> Flash images can be grabbed here for testing :
>
>     https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalm=
etto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
>     https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=
=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor
>
> Based on commit dc154b1db4b9.

Applied to target-arm.next, with the g_new0() nit and
the missing error_propagate() fixed.

thanks
-- PMM
