Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4623142wrg;
        Mon, 20 May 2019 00:47:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNZxnJjbMeMRNkOnVMUeBn6EylEn456gdF4CCKeVsEi3oGvtbHn7Y74R4YE9OnW/y+kKI4
X-Received: by 2002:a50:913d:: with SMTP id e58mr74415226eda.107.1558338451365;
        Mon, 20 May 2019 00:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558338451; cv=none;
        d=google.com; s=arc-20160816;
        b=wHz4+IlzbJTZt/qfbIr+50AE/1xlrRbA2WdIL1Gd32vFA34s9bvVacbYKro4QI/Bpb
         jIhFDXkw/yAOt154dEKgmxd/wU1+MPS+NJ7Ql3pzXDmvrNGEMjUu3t8CRZowmGf7TG+x
         r9VSNkUZbgaTr5WGfB0kRZP4H2g9u3l6deUAcjoXy3/Uu8ztBSbeZKSC0nfNoah9SpMp
         Aa140LCp5YvJ3cNPwALWK7iXwbeIuyu6Pnjuk6ehv2NIH1Ja1djruPTqtWnn89xrmYKP
         G6nIUmQUbvtnNKcSaX7hdmcbom6Ui7zwOI6SylUHQzq4QN8UVcx1Y/2KHhgscmnbS43o
         fmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=EuMYF/eT4IfkZSQjpUTcD8vynj76fZ1hjE82F7/cqqc=;
        b=JrMRXqN1Jle12BGA1Qw0t1ev8FfzBKhhqXUiHpL3p1Iabz/e2fuwn1XoQOV32zk0su
         5vtht7gOsyEtC9+OSs22A6Nddu/U+ZnBtFfXMv++cn4u3mY6Nfag1YYRcdTGoxd84dL3
         3lR5SihFbd74J1SUJuH6NtxXhsVqnwFQAojfmoaHBbNqigjE4hdiykmnwnEAGpfaGN5M
         HljZ16uzvzSrXiDmXtULIH5TEC5aHZs2Da0K41VpY2qnK70SiitBOKlltGNqq7GaUObi
         jgxNlQmIV1rThDtSJHd+wgdS4mFVAzCtsAJgRZfnEWdfpZogMUBYVrjhIwvWms1JyHIy
         C7hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si9028953eda.16.2019.05.20.00.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 00:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSd18-0007iz-DT
	for alex.bennee@linaro.org; Mon, 20 May 2019 03:47:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSd0v-0007id-3L
	for qemu-arm@nongnu.org; Mon, 20 May 2019 03:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSd0u-0000Yu-8J
	for qemu-arm@nongnu.org; Mon, 20 May 2019 03:47:17 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:50759)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hSd0u-0000TM-3B
	for qemu-arm@nongnu.org; Mon, 20 May 2019 03:47:16 -0400
Received: from player693.ha.ovh.net (unknown [10.108.35.103])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 3BE1F67C77
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 09:47:11 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 797675E77D5E;
	Mon, 20 May 2019 07:47:05 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
Date: Mon, 20 May 2019 09:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506142042.28096-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6592988382054943523
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.227
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NXFepU5CSdEf

Hello,

On 5/6/19 4:20 PM, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> Here is a series adding a couple of cleanups to the Aspeed SoCs to
> prepare ground for extensions and new SoCs.
>=20
> Thanks,
>=20
> C.
>=20
> Changes since v1:
>=20
>  - moved enum defining the Aspeed controller names under aspeed_soc.h
>  - removed AspeedSoCInfo 'sdram_base' field
>  - fixed clang compilation
>=20
> C=C3=A9dric Le Goater (3):
>   aspeed: add a per SoC mapping for the interrupt space
>   aspeed: add a per SoC mapping for the memory space

I think these two patches are fine to go even if Philippe's comments=20
are not addressed. There are valid but not a blocker to me. =20

>   aspeed: use sysbus_init_child_obj() to initialize children

Philippe has taken over this patch in a larger series which will go=20
through Eduardo's tree, if I understood well the emails. When merged,=20
we can try to re-merge the RTC patchset from Joel. I think we made=20
things a little more complex than they should have been.=20

Thanks,

C.

>  include/hw/arm/aspeed_soc.h |  40 ++++++-
>  hw/arm/aspeed.c             |   8 +-
>  hw/arm/aspeed_soc.c         | 226 ++++++++++++++++++++++--------------
>  3 files changed, 184 insertions(+), 90 deletions(-)
>=20

