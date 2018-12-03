Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6663029wrt;
        Mon, 3 Dec 2018 03:21:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X4GGtN31Ma6RexvaLF+KwbcejfHZgKXL/95mYDe52vZBgXBicKvNmtFM6Rgksjydpg5Orx
X-Received: by 2002:a37:cf9b:: with SMTP id v27mr14070631qkl.160.1543836090780;
        Mon, 03 Dec 2018 03:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543836090; cv=none;
        d=google.com; s=arc-20160816;
        b=zC3Jlycu5ESD8v7wAPc/ExxqVHqpFS+KoKDEkWE7mICA7YBhnvhuo3pbLIeLsu7Kv4
         ArkdwoE1BmNCb3hGl/rxU8K6WB1d8MMeKuIvbbCC3jeDVMa5ymh+2W0btZrWuyDM0y+y
         ahIulAU05oczREy2QkgInsGT09sLD64mURb3Gm4xdwQySYeK4SZHqHw8x+AfkoOqK7a+
         YY14F/nmcn4ZnOHQke30VuokH/qZvbkwABWrlZD63eDepHMhaPwPF4W4Nos9iQ+d71Sw
         HeLSTFpM3DCi5IMNHdt79iFCj1FaN6nf88p4ukYor+Mz2WN2NLm8rC1Kk1P287eBb9nh
         c5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=xT/KdiSZovNtt6LaRrmYP/EU1++mv8lJvgw76khBOPI=;
        b=nG+Fbq/tyaaDOTr3uh2g1DxFuXSpnEU+y+EV+c5CqRYMgio+F7Ss0oqmjODvAAvmax
         wosev/Zrld3FvVUDf9FgOnyokh6ckUUGnW42lgnIzlH5yrjk7tHfLjrlxZCr9Ybj3+dw
         y24mINL6V7uw5K0oO7fdwaM6RLcyxD2sDC0Z1u93xMvjKTo2snMSJOgkZ/WTHOZc19uy
         tLfZC5ASGb02RdKhoEAT1tF3qDK04cv/Mzkz2F35Bbx3KOFK/RvMxQXsEHm56YtRcnCv
         L5JDi2sE3B0l39mF8yHs/WyoM1e8JOE8jHOV4D2teoxygDxloyMq6eO5p1EINmc4foHB
         iU1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ae2LKiTV;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fKu82Xvp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fKu82Xvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k15si952746qke.86.2018.12.03.03.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ae2LKiTV;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fKu82Xvp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fKu82Xvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTmI6-0003xw-8T
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:21:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gTmHt-0003wu-UL
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gTmHn-0005uE-Re
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:21:15 -0500
Received: from greensocs.com ([193.104.36.180]:48980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gTmHl-0005qs-U6; Mon, 03 Dec 2018 06:21:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CAD4F645DEE;
	Mon,  3 Dec 2018 12:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543836060;
	bh=VKTOg/cdooO0l4OB1cMJFvMTAirYa+krlIy/tzRzWUA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=ae2LKiTVrhbN3TZZoMqzAyf8ilwxAytd5gKyKNoZWvPXCWGewGvvwKFOZXtyYvZpv
	UwiPThbGP5OcXVH1aY76kZ9f8WkfRTUyY+pmBj6EeBxZyRRQp4KV0R+2jXlSOLZSfn
	NHmxqdbBuTk/vXG2yckyNRTcW4PNGQDSpvN3G860=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fKu82Xvp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=fKu82Xvp
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoQ-uSG-x-vI; Mon,  3 Dec 2018 12:21:00 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id E0BFA645DE7; Mon,  3 Dec 2018 12:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543836059;
	bh=VKTOg/cdooO0l4OB1cMJFvMTAirYa+krlIy/tzRzWUA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=fKu82Xvp6PmnuD/AT3R8xHAxM9lw64T7CZqiVZcc1wK8OR8OgW5J9TflLgsDVMJkD
	5Rv4YbiWh7VDISAMemBIsaFoGa40Oq/k3oypmdlNCHjUumRZOKAThPSXsQw2VnQneg
	hMbjoVnMeUycwVSYbVluoFJbbVypUo3HHvv+53v8=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 64F6C645DD2;
	Mon,  3 Dec 2018 12:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543836059;
	bh=VKTOg/cdooO0l4OB1cMJFvMTAirYa+krlIy/tzRzWUA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=fKu82Xvp6PmnuD/AT3R8xHAxM9lw64T7CZqiVZcc1wK8OR8OgW5J9TflLgsDVMJkD
	5Rv4YbiWh7VDISAMemBIsaFoGa40Oq/k3oypmdlNCHjUumRZOKAThPSXsQw2VnQneg
	hMbjoVnMeUycwVSYbVluoFJbbVypUo3HHvv+53v8=
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
Date: Mon, 3 Dec 2018 12:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x5+za6wRJi1W

On 11/30/18 5:52 PM, Peter Maydell wrote:
> On Mon, 26 Nov 2018 at 13:27, Eduardo Habkost <ehabkost@redhat.com> wro=
te:
>>
>> On Sun, Nov 25, 2018 at 10:27:04PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>>> Hi Eduardo,
>>>
>>> On 23/11/18 19:10, Eduardo Habkost wrote:
>>>> If you really want to do this and assign cluster_id
>>>> automatically, please do it on realize, where it won't have
>>>> unexpected side-effects after a simple `qom-list-properties` QMP
>>>> command.
>>>
>>> This looks clean enough to me.
>>> Do you prefer we don't use static auto_increment at all?
>>
>> I would prefer to avoid the static variable if possible, but I
>> won't reject it if the alternatives make the API too complex to
>> use.
>=20
> I guess the alternative would be to require the cluster ID
> to be a QOM property on the cluster object. Usage would then
> be something like
>     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
>                             sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
>                             &error_abort, NULL);
>     object_property_set_int(OBJECT(s), 1, "cluster-id", &error_abort);
>     qdev_init_nofail(DEVICE(&s->rpu_cluster));
>=20
> (ie one extra line setting the cluster ID explicitly).
I had such a line in v3 which was removed with the Philippe's
auto-assign suggestion. Discussions seems to converge to the removal of
the auto-assign mechanism though. I can rollback to manual assign for my
next re-roll.
Philippe: is it OK for you?

>=20
> SoC objects can probably reasonably assume that they are
> the only SoC in the system, ie that they can just assign
> cluster IDs themselves). If that turns out not to be true
> we can make the SoC take a property to specify a cluster ID
> base or something.
>=20
> I guess if we've been bitten by cpu-ID auto-assignment
> in the past, starting out with "user picks the cluster ID"
> would be safer, and it's not too much pain at the callsite.
> Plus it avoids the gdbstub changing its mind about which
> order the cluster "processes" appear in if we refactor the
> board code.
>=20
>> In either case, I'd like to ensure the caveats of the cluster_id
>> field are clearly documented: no guarantees about ordering or
>> predictability, making it not appropriate for external
>> interfaces.
>=20
> The gdb stub is sort of an external interface, of course...
>=20
> Luc: what are the requirements on boards using CPU cluster
> objects? I assume these are both OK:
>  * does not use cluster objects at all
>    (the gdbstub puts all the CPUs in one process?)
Yes, when no clusters are found, a process with PID 1 is created and
used for all CPUs.
>  * all CPUs created are in some CPU cluster
>    (the gdbstub uses one process per CPU cluster)
> but what about
>  * some CPUs are created in a CPU cluster, but some
>    are "loose", not in any cluster at all> ?
> Is that just invalid, or do the "loose" CPUs end up in
> a default cluster (gdbstub process), or do they get
> one cluster each?
Currently this is valid and the "loose" CPUs end up in the first
available process (which will be PID 1 if we are in your first case,
i.e. no clusters in the machine).

>=20
> If it's invalid (which doesn't seem like a bad idea),
> is there an assert somewhere so that getting it wrong
> results in the board failing to start (ie a "make check"
> failure) ?
I could add such a check if you think it's a good idea, i.e. assert that
"no cluster exist" or "all CPUs are in a cluster"

But maybe in the end this check should not be done in the gdb stub? For
the same reasons maybe you want to ensure that all CPUs have a well
known address space or whatever information the cluster will provide?

Thanks.

--=20
Luc
