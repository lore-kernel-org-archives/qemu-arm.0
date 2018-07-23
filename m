Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5803229wru;
        Mon, 23 Jul 2018 08:52:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeJ0legh3b1ELXUaC5D3QcFGzkp5vE9xif0rmTkFkWTIdzn2wTihTlPImGgR4PcrzX/xz+9
X-Received: by 2002:a0c:cdd1:: with SMTP id a17-v6mr11295038qvn.166.1532361129974;
        Mon, 23 Jul 2018 08:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532361129; cv=none;
        d=google.com; s=arc-20160816;
        b=d1FGjiOlpMlJ2eltQ1hTBCVgGqif6/PIsKzO6F89exNM3OAy+btEhuE/fNvloajmF9
         UbcGAUddkdeRKUasxBWkP1o6fuX0Zgf9jTSt1VVjvQOe03srb5nb1CU95/Mwiilh6C99
         +fAWRhGw9IJ56r5+0ixZ24IWgx6b7hjulDB62nR6i6kq+kYLhNv6n5B9C8mTPwkqri8J
         3gbLhwl41kxwF96zg8EK5iM0uAtdWbfXw21RZXoZ5+CiHZSnGLRhboG/1RAyqXwIv7zL
         NTXsqug1RPqgjDySSvynS4sBH5AoeicRcx+dKIjichzzzRAXmqbaXZWBp/TlLL3+kYUr
         Iw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=+TT7rnPXysvanEaBxvExeIN+2Y09myz41xaZaqsCMB8=;
        b=abBWt15CVl+AeOtyB0v+uNcNVKyE/azgGvoQXfNjKA5nZRNfwZyJvdQrB/kG3n940C
         d5Gt18igsa2G5RhmTlccksXLnO8+pP4vaCQGLcCkCdjz4alXPhAq19Wbc7LbSjFpLGch
         9c6Do+JjvlqDcKMHrXKx11Pglmf2QY7xD0HGGUjNYdvjEntBFWMEn1/LGFhyUkTWhJLc
         MIo2Qr0BTGP1oOB+tKcDwhvItWFTdaDpHfJCkuvnToLXWCxaeq50kSYcVlFlgatVWd+C
         Q5X/o4pti3XiEz7dlskVTBrhMJUp4EWLZagS0UREKJptPGa8qvv1mwDEOnyIwIo2Ie7c
         5n9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18-v6si8865034qtg.13.2018.07.23.08.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 08:52:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhd85-0004eL-Gm
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 11:52:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhd7u-0004dV-EU
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhd7q-0006eb-Nx
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:51:58 -0400
Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133]:60241)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fhd7q-0006dM-Gz
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:51:54 -0400
Received: from player738.ha.ovh.net (unknown [10.109.143.145])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id CEBBEB680E
	for <qemu-arm@nongnu.org>; Mon, 23 Jul 2018 17:51:52 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player738.ha.ovh.net (Postfix) with ESMTPSA id E5BA54EBD;
	Mon, 23 Jul 2018 17:51:41 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<ce2458db-7b97-1672-48cf-b88c24d93157@kaod.org>
	<CAFEAcA88a15YJ86bK+3=OMG-2=URAgfXEjFoAx603YpCsw5X2w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <286bff36-1137-ea8f-077c-270406ef433d@kaod.org>
Date: Mon, 23 Jul 2018 17:51:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA88a15YJ86bK+3=OMG-2=URAgfXEjFoAx603YpCsw5X2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17985125111988587469
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrjedvgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.73.133
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xx72kdsmVKR5

On 07/23/2018 05:17 PM, Peter Maydell wrote:
> On 23 July 2018 at 15:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 07/10/2018 06:00 PM, Peter Maydell wrote:
>>> Note for the Xilinx folks: this patchset makes the mmio-exec
>>> testcase for running from the SPI flash pass. Cedric: you might
>>> like to test the aspeed image you had that relies on execution
>>> from an MMIO region too.
>>
>> I have added a memory region alias at 0x0 on the memory region where
>> the first flash device is mapped and all aspeed machines, palmetto,
>> romulus, witherspoon booted fine.
>>
>> More or less 4MB of data access is generated and the slowdown is hardl=
y
>> noticeable, around one second on a laptop.
>>
>> I wonder if I should add a bool option to the machine to activate
>> or not the feature ?
>=20
> I would tend to go with "not" -- if we need the feature then
> it's better to run slowly but correctly, and if we don't need
> the feature then it doesn't cost us any speed I think.


I have chosen a brutal activation (for the moment) :

  https://github.com/legoater/qemu/commit/10b08c5e8df385bba342f02fa044091=
6203b6fa8

I will send when your patchset is committed.

Images used for tests are here :=20

  https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dromulu=
s/lastSuccessfulBuild/artifact/deploy/images/romulus/flash-romulus

  https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpalmet=
to/lastSuccessfulBuild/artifact/deploy/images/palmetto/flash-palmetto

  https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dwither=
spoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/obmc-phospho=
r-image-witherspoon.ubi.mtd

Thanks,

C.=20
