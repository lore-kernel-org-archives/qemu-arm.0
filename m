Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp993535wrt;
        Wed, 17 Oct 2018 10:03:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62DXyJggeF0Y6sPAJVE0t+duRMiU6ZRb2lfNv7EaADOunIi3ouJCA7uqWBzfTHl33mSSiHm
X-Received: by 2002:aed:356a:: with SMTP id b39-v6mr26399971qte.186.1539795780061;
        Wed, 17 Oct 2018 10:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539795780; cv=none;
        d=google.com; s=arc-20160816;
        b=kq0+zTh93OJma2o4zOWG18kVZEtejEGq9kY6v0u9JAWVFoXK8KlGMUh8KfLbkUwWJu
         XdlkblNz7SlxtmvP8dmax8IuRtFrhLYgJrHnU5n47mxvgOnXBwVk3R6fMJJjXSqNPmO/
         gpHiNy4HazW0OVvURFw20sW2f1EXoECPIVJsm2e2gh+hexuyJ7bNYTvk4QuMbH1MBwht
         kg1JfkZz2XNyCii0SF0V5C72opa1E3tKn9aQdCuTMuWjpOX6LTqeaCwrR4kOFLKsqCq5
         mWkTvLQAFyVfQtYKEdelhaCs2l8Rlke2ltggUF/sthWWAxlx7LDFinZOyIkpKYjzzycu
         Qqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=IqSCJ89DeigZlEStNie6ZXB4uicMicuH/o67glMHt/M=;
        b=xRPeOV7rA5kIYcEtdrdBmNJ8HRtflXczy8cuha0KOvErBCBCe3OrKwIDeEg0b7RnzW
         PDMTQr1Uwfu0SE1txWheS5FHYewpn5TNET9ZDt7y1YqngDGAl5Atib9qsviMvwsLcfm+
         2dMPDGL0FU8b2vrJw3h99ogkOiupzimkiTyJwyD5ZDXDKA5U1olApuGk6sPaEBjXGKNM
         pod0UgXKffE1XO7or6MkjCKHRhbO+UXInZX9gzSemli6Ta+eF0GyP6gSOW9/4pyqaJk1
         EzjEmdVt6LDO1oxKwdRB2xJOyfZEPAsZhzWWpRli21kvABIwMyR43tdj8IwGC/dgx+le
         SzOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rx6uXvne;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aFNt7nGy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aFNt7nGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si5276175qvj.223.2018.10.17.10.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 10:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rx6uXvne;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aFNt7nGy;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=aFNt7nGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCpDn-0000pT-KJ
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 13:02:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gCpDe-0000pO-IX
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 13:02:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gCpDa-0004pG-AV
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 13:02:50 -0400
Received: from greensocs.com ([193.104.36.180]:43906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gCpDY-0004lO-5k; Wed, 17 Oct 2018 13:02:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C48675C0249;
	Wed, 17 Oct 2018 19:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539795749;
	bh=DWLuNHhT9HDw+kTO5rb8BUda9gHVK69fDzrEw0w5WLg=;
	h=From:Subject:To:Cc:References:Date:In-Reply-To;
	b=rx6uXvne6T67sy6yzB2TmitVoy189XrvrupCbr44n+dNF7mQ5YH2kJyEF+6wVK3FF
	5jkgRayUjkvnpoT4gvjhFvAXuxsWASWeJzsInPZ1YrA3TngVjrNl0WOX+uHdcrEbhG
	3XVsuITNKJNi5E/aFPtw0yrdRCPoaexgL/YhhWjo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=aFNt7nGy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=aFNt7nGy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7uyMzuArRVc; Wed, 17 Oct 2018 19:02:29 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EA95C5C024C; Wed, 17 Oct 2018 19:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539795748;
	bh=DWLuNHhT9HDw+kTO5rb8BUda9gHVK69fDzrEw0w5WLg=;
	h=From:Subject:To:Cc:References:Date:In-Reply-To;
	b=aFNt7nGyx8uFrD3aSj1VoQ5tI/oYZTPV3X4Wsxk+cvsZczQ7vtMBvh+5bR4kH0X3w
	M/yqm7db88bEBIYfpTnTqBbrYG2VFz7WzvJ8NXZKr9nauLdTA1l8kmtgSLb0IW5Axv
	XgnjkojlzdEjNrnw4H9On9Z1oe08x+uD7wXPAeG8=
Received: from [192.168.61.102] (LFbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 67A155C0249;
	Wed, 17 Oct 2018 19:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539795748;
	bh=DWLuNHhT9HDw+kTO5rb8BUda9gHVK69fDzrEw0w5WLg=;
	h=From:Subject:To:Cc:References:Date:In-Reply-To;
	b=aFNt7nGyx8uFrD3aSj1VoQ5tI/oYZTPV3X4Wsxk+cvsZczQ7vtMBvh+5bR4kH0X3w
	M/yqm7db88bEBIYfpTnTqBbrYG2VFz7WzvJ8NXZKr9nauLdTA1l8kmtgSLb0IW5Axv
	XgnjkojlzdEjNrnw4H9On9Z1oe08x+uD7wXPAeG8=
From: Luc Michel <luc.michel@greensocs.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
	<20181004195225.GV5738@habkost.net>
	<CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
	<20181004215352.GW5738@habkost.net>
	<e4724ba3-4dbc-7b79-b520-96b69be1a73c@redhat.com>
	<20181005184929.GY5738@habkost.net>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5f7f1c42-18a4-5241-d1be-2e06ab86bdba@greensocs.com>
Date: Wed, 17 Oct 2018 19:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181005184929.GY5738@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put APUs
 and RPUs in separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FjEhXRZ9iTTO



On 10/5/18 8:49 PM, Eduardo Habkost wrote:
> On Fri, Oct 05, 2018 at 03:50:01PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>> On 04/10/2018 23:53, Eduardo Habkost wrote:
>>> On Thu, Oct 04, 2018 at 09:01:09PM +0100, Peter Maydell wrote:
>>>> On 4 October 2018 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wr=
ote:
>>>>> Changing the object hierarchy based on GDB groups doesn't seem
>>>>> right, but I don't think it would be a big deal if we have the
>>>>> board code explicitly telling the GDB code how to group the CPUs.
>>>>>
>>>>> If you really want to do it implicitly, would it work if you
>>>>> simply group the CPUs based on object_get_canonical_path()?
>>>>>
>>>>> If a more explicit GDB grouping API is acceptable, what about
>>>>> just adding a INTERFACE_GDB_GROUP interface name to (existing)
>>>>> container objects that we expect to become GDB groups?
>>>>>
>>>>> I'm not sure which way is better. I'm a bit worried that making
>>>>> things too implicit could easily break (e.g. if somebody changes
>>>>> the CPU QOM hierarchy in the future for unrelated reasons).
>>>>
>>>> I don't want things implicit. I just don't want the explicitness
>>>> to be "this is all about GDB", because it isn't. I want us
>>>> to explicitly say "these 4 CPUs are in one cluster" (or
>>>> whatever term we use), because that affects more than merely GDB.
>>>
>>> We already have a way to say "these 4 CPUs are in one cluster",
>>> don't we?  That's the QOM hierarchy.
>>>
>>> My question is if "the CPUs are in one cluster" should implicitly
>>> mean "the CPUs are in one GDB group".
>>>
>>
>> What about having the container implement INTERFACE_CPU_CLUSTER?
>>
>> Or even cleaner, add a TYPE_CPU_CLUSTER which is just a container for
>> TYPE_CPU[*]?
>=20
> Sounds good to me.  An interface sounds more flexible, to avoid
> clashing with existing type hierarchies for
> nodes/sockets/cores/etc.
But we still need a container sub-class specialized for that matter
right? Or are we going to have the generic container class implements
this not-so-generic interface?

>=20
> But first of all, I think we need a good definition of what
> exactly is a cluster, and what is the purpose of this
> abstraction.
I think it has implications that go way beyond this patch set.
Here we want to put the APUs (cortex-a53) and the RPUs (cortex-r5) in
different groups mainly because they have different architectures (I
think the address space is more or less the same for all the CPUs in
this SoC).

The current configuration is wrong since the A53 and the R5 probably
don't have the same features, hence for the same piece of code,
translations can differ from one another (e.g. one could have VFPv4 and
not the other). So the translation cache should not be shared.

We could imagine modelling more complex heterogeneous architectures. One
that come to my mind is a many-core chip from Kalray, which is organised
in 16 clusters of 16 cores each. In a cluster, the cores are SMP,
accessing the same SRAM. But inter-cluster communication is done through
an explicit NoC, using DMAs.

In that case, a "cluster" QEMU abstraction would make sense since cores
between clusters must not share the same address space, nor translation
cache.

Regarding GDB, two CPUs should be put in different groups if:
  - Their architectures are different
  - or if the extra XML descriptions we send to GDB for those CPUs are
different (extra registers).

So for now I think we can introduce this new "cpu cluster" abstraction
as it makes sense for the kind of system we (could) want to model in
QEMU. For now it will only be used by the GDB stub but it definitely has
a deeper implication.

>=20
> If we end up with a new abstraction that is only going to used by
> GDB code and nothing else, I don't see the point of pretending it
> is not a GDB-specific abstraction.
>=20


