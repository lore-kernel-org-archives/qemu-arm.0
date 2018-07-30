Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3769788wru;
        Mon, 30 Jul 2018 06:19:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfLNGChHY31A9KTfhQuNB4dh0jxSSuqcJ6bZ2Tgd7JSNw4C5LRS+ObgQ0+yrAM/xjc211+E
X-Received: by 2002:ac8:5207:: with SMTP id r7-v6mr16591329qtn.11.1532956758006;
        Mon, 30 Jul 2018 06:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532956758; cv=none;
        d=google.com; s=arc-20160816;
        b=IqLgFyIgbogqXv2U7qM7GQPNzRm6tvpiOBoEkuvzButJVhvIp0oRZgiwAUw9qLLhUB
         5pTc2XssF2DV3qali+WDD7RlKRBRprDII/3Y1qaEECAS5fSsA0Dm1d8jUdmzfLtyZlOI
         CSDjruYoCAKYU07EFBKEDW8dJsIJy4CTha3BQ6nTg4kDsJSo4mLcLLtqukgm2QU4RLDp
         ZX6677TIumccUpjdDZIkOlZFowLkyLz2ybz/LJrPvhKxUmd1hYKMbQE19vfnYzD00hsy
         m5gbmKD6DsdZfleRGaGc3pz1Ayas1jqHS+ELeZoJ5EYYce4xoHjkP2QN3flKsCzd5BOJ
         VoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=4v3dHIjUOb0/uC56DqPrS8Y+vpu8ozaYS3uyoH+v6BY=;
        b=tUGPhnooMyRTCKeP3RH6OGcUaVarPMWItI9j5PS+fTF2IQK2OvDIe2snz+3mbyy+gi
         600+I/NHNqQLG6zjcgX/erq+7L4AN6OclP4yw2uzD4PEYc/oSaa+/+TwBAVO4yLUcsoN
         P0VBRxSH/0aROUvltKq5dlH7yOBOkHIJ4xX8WkUivS4+8uA3zYHYCjwjfjzVac1IRDUF
         Z99d4NnsQRUr1Gq5AoX8JdCXmdnW2GveQ5EJfCmU7g8Ws93BxG2pKalJl59s5pHFsJSW
         X5styAU3KmRBCWQ0iQvHGzoZMjXCJ5MD3mUjiWcViEAJjU8l8udqkM2Tcft1UqubNP0K
         3/CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3RQy9y89;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k365JCXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15-v6si2862188qvj.254.2018.07.30.06.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 06:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3RQy9y89;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k365JCXn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk84z-0002vt-HF
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 09:19:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.burton@greensocs.com>) id 1fk83O-00026J-G3
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 09:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.burton@greensocs.com>) id 1fk83N-000872-Eg
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 09:17:38 -0400
Received: from greensocs.com ([193.104.36.180]:54402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.burton@greensocs.com>)
	id 1fk83F-00083o-Vz; Mon, 30 Jul 2018 09:17:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6B365DFFE9;
	Mon, 30 Jul 2018 15:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532956641;
	bh=vVJjTiEiZWVEgPkbY141wIr/spDvYUUwLL75OU5j2k4=;
	h=From:To:CC:Date:In-Reply-To:References:Subject;
	b=3RQy9y89og0NKdJxse7RprMyJlHYl70WV9xLObWX7Wg4ZS+EsBWd1/MMJ48//TyqQ
	w35bamTtLeKVc2cr9ENMxyWi1qNSY0YM25E4aKmbcJ0SQYz9j9uGgpjzhix0MMt4L6
	+LjUhUeHhwrrTNY6Ptc9rRocCQERxcWZMiHHMl1I=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hb2ye4jEfuQo; Mon, 30 Jul 2018 15:17:20 +0200 (CEST)
Received: from [192.168.1.39] (109.red-176-86-38.dynamicip.rima-tde.net
	[176.86.38.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: mark.burton@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id F33FBDFFDF;
	Mon, 30 Jul 2018 15:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532956640;
	bh=vVJjTiEiZWVEgPkbY141wIr/spDvYUUwLL75OU5j2k4=;
	h=From:To:CC:Date:In-Reply-To:References:Subject;
	b=k365JCXn+S+G+wuvTSzj3wK+IzPbQz5s2gtcW++uqPqe/ZJNM0T0CtfmabMd0D1eW
	UWBAWtnFZ6N0nJxU0jDEsSvc9TYDTbjlEcHI9Ivy+kQ7unKmFla5HGH7rb2O4lnCVS
	lTXq8ZBQ5KHFt2D3qy2mo/I56+funbSSQ5XeDxfk=
From: Mark Burton <mark.burton@greensocs.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Damien Hedde <damien.hedde@greensocs.com>
Date: Mon, 30 Jul 2018 15:17:16 +0200
Message-ID: <164eb4a8d68.27d4.d127438ad377917fe05d617879a0d354@greensocs.com>
In-Reply-To: <2d22fcb2-b825-6195-a935-bf2adb3e0a60@adacore.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<CAFEAcA-X=eziUHurc0SEcGEeM25t4YgkTczsVeF8myWHjfp3MQ@mail.gmail.com>
	<2d22fcb2-b825-6195-a935-bf2adb3e0a60@adacore.com>
User-Agent: AquaMail/1.16.0-1193 (build: 101600006)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-devel] [RFC PATCH 0/6] Clock and power gating support
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uJT8l0P8daoj

Hi Pete, sorry for the tardy reply, Im not in the office.


Your right  we shoujd have co-ordinated better the 2 patches, sorry for t=
hat.

Regarding this new patchset, we think there is a degree of complementary =
to the
clocktree one.
Here we simply add a couple of generic power states to a device. We
introduce
an interface to control power and clock gating on any devices, with sensi=
ble
generic behaviour (reset on power on, disabling memory regions when
asleep or
off). The device can specialize this to adopt specific behaviours.

It allows easy implementation of commonly found "system controller", "pin
controllers", "power management unit", or similar blocks in SoCs.
Specialization of devices can be implemented as-needed when a machine
requires
it.


Cheers
Mark

On 27 July 2018 17:22:30 KONRAD Frederic <frederic.konrad@adacore.com> wr=
ote:

> Le 07/27/2018 =C3=A0 04:59 PM, Peter Maydell a =C3=A9crit :
>> On 27 July 2018 at 15:37, Damien Hedde <damien.hedde@greensocs.com> wr=
ote:
>>> This set of patches add support for power and clock gating in device =
objects.
>>> It adds two booleans to the state, one for power state and one of clo=
ck state.
>>>
>>> The state is controlled trough 2 functions, one for power and one for=
 clock.
>>> Two new methods *power_update* and *clock_update* is added to the dev=
ice class
>>> which are called on state change and can be overriden.
>>
>> So, you folks at Greensocs had a series a couple of years ago to try
>> to add clocktree support (which included handling things like guests
>> configuring clock rates, some clocks being "downstream" of others, and
>> so on). It didn't make it into mainline, though it did get a fair amou=
nt
>> of design/code review. How does this approach fit into / compare with
>> that ?
>>
>> thanks
>> -- PMM
>
> Hi all,
>
> I didn't have time to push a new version of the clock series and
> I lost the track a little bit (was 13 months ago). Sorry for
> that :(.. Would be still nice to have I think.
>
> Cheers,
> Fred



