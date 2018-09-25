Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp725391wrt;
        Tue, 25 Sep 2018 07:12:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV617tUYV3btbSt5IgREV+wGato/eJ1zC9FefUkKAroBTAzq1x3jSg2FLwevzELmNeJns0k7d
X-Received: by 2002:a0c:fd8c:: with SMTP id p12-v6mr897172qvr.137.1537884761980;
        Tue, 25 Sep 2018 07:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537884761; cv=none;
        d=google.com; s=arc-20160816;
        b=aKopxPIEVcSiQohsTiDauawGONeoQ+J8vM2UXJK7JigW5Uaw7u4dITBXKi3BUDygui
         wu0oFK8G0KGBg3p6oNKh07vpOMVlidg1ZXTqCQeCA62kAEw45Vv9iKOjQD+WIDhdiuQK
         btz56BE+irpnpYz6mgD0Pp7hb1uB6gD0PGqbT5sTqyknuzrm5s36Fz1WRh2Wcl1XwSPt
         OWlypfp6oHiP5lkeJW+7JtUJmOpINbgmDw4l0AeTwipyJYXzQE8kJYOf0q/cbAT+Q1ad
         OZ5lcXRuOtuEu2CpkvLBPtUeD8fgICrbXmzIGMWLk+FSiRw9UwuIvJ0jyq0fFVyx4P+Z
         SxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=xf5nJSZNl/z6/l7YtkQQDzjFlwpxKtI8vaWQLhfjmlg=;
        b=VG9B0oY0wNUil32iw5e94iLhs3R7UT8jFkptGwCIzqIDYvv02zDKSuWw4eWEolzRgO
         2pCgIZOllgpX8h3OpWT2zXiMX/Au/WBJWskx+M5d70ADuZHRe/6QFyQDrks4Zro5Ph6N
         r00KZIAw88/7DyQKqr/aVjB07kKW8ITN0f6Wk2wTtnVw/s/MOrILhvtXTyD6pODigos0
         Mdmu8kFCj0YOv97sceXRNFRBhGt1GwZjYdmlhFvhKhRS8j+o9RO8SkL0CUjUp4d4k3d6
         fo/f+9t/BFA6/BR+mZo31jHTKXoyxJwrJs2P/lht5XMoVjfChiMaJizpyPxYAOr8FDwI
         Jj7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y64-v6si1804039qky.359.2018.09.25.07.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4o4v-0007Yo-GO
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:12:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4o3O-0006ug-Uc
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4o3K-0000Ge-Ry
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:11:06 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:58964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4o3K-0000FK-Lv
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:11:02 -0400
Received: from player168.ha.ovh.net (unknown [10.109.160.239])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4CDC51D6D83
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 16:11:01 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 0C1AA420098;
	Tue, 25 Sep 2018 16:10:52 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <539cfb28-e4bc-f7d4-6ed9-881bc0cab8bc@kaod.org>
Date: Tue, 25 Sep 2018 16:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4752704985460673476
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtuddgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.178.58
Subject: Re: [Qemu-devel] [PATCH v2 00/11] aspeed: misc fixes and
 enhancements (SMC)
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hv+V6UgqG3um

On 9/25/18 2:20 PM, Peter Maydell wrote:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> Hello,
>>
>> This series adds a couple of cleanups and two main features to the
>> SMC controller of the Aspeed machines :
>>
>>  - a 'execute-in-place' property to boot directly from a memory region
>>    alias of the FMC flash module using MMIO execution. This is not
>>    activated by default because boot time needs to be improved on
>>    recent firmwares. It also breaks migration compatibility.
>>
>>  - support for DMA to access the flash modules. Our primary need is
>>    the checksum calculation which is used to evaluate the best clock
>>    settings for reads.
>=20
> I've picked out the easy parts of this series and added
> them to target-arm.next:
>=20
>>   aspeed/timer: fix compile breakage with clang 3.4.2
>>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>>   hw/arm/aspeed: Add an Aspeed machine class
>>   aspeed/smc: fix some alignment issues
>=20
> and left the rest for the moment (I've still got this series
> on my to-review list).

I will wait for your comments on the DMA part before resending.

Thanks,

C.

