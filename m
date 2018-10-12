Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp585893wrt;
        Fri, 12 Oct 2018 03:20:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62nvoq4tr/QUOtMdPSBB+HlrS6DzXe0eYz6/DPe7JQ/x9Fl0qPGTa3YNsscLRijCpBJbv/0
X-Received: by 2002:a37:6a01:: with SMTP id f1-v6mr5037934qkc.8.1539339644776;
        Fri, 12 Oct 2018 03:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539339644; cv=none;
        d=google.com; s=arc-20160816;
        b=poYfUP4gPC+ayY8fj8XajAuF5kzV9GlVeAVfC1as6cq+vAr/lu4Zhm3kQq2dN/B96L
         Nq1nZmv9Y0M45lLft9Z8f884dni9HZk6TbkIzdLYKNc7Rln5VMTZUxR+looJSxvYLTvT
         s20tMs2eMYVHCY/rH67rjkdFFMHZwKTpTzyjVDmF8YPMHDjnx1wC0cV9AJsyLX6dKed+
         pujkESWyughlhx/agoqMWpVkKJjkJvPL4R/pfXI8WX0e1nTPacsJODfx2vD0VFNaFZO6
         RD9wnFDcSC05WRqZ3/DfxWxq7aHjTSVxz5gVj64djQl950kDArp0aQrnFrburRWD97Yq
         s/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=L/MasrwFKLDDPGYSjLcwXDZXswHRaABfRfkxsb8/x+Y=;
        b=l1IMR8z6zKcqNffNkxHllqHQEzF9MYzr6JOMij3NyBS2yqcmjIZYmpeQN79E+GURfy
         xTu7R2cYhcE86wkNKoNJBY4+aMiYu9mwvb9i8hoCRkNY2C+t9HdEwh+h8mGpbMILlrUe
         FJ8c1QdUyuECqL5LjFC8O5aSGZ3glzFIMMOiJ2+JEzbLngiH09Rbb5U7uQfe+c9abQQL
         dm9c/qqOCLIArkiMjoNyCQnalBlKi/aFWWVHzViQKy6r386yE6PCCytWhIRVymSx0W+k
         wfICKOsH+3oHdwC38Qe+9EJimtAeMUY7p0h0sQD0bmoBnQNMA25DKozMDskp/yxFg8A3
         iaDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IowSLUHt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Fcj3d2SF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Fcj3d2SF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e68-v6si685183qtb.241.2018.10.12.03.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 03:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=IowSLUHt;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Fcj3d2SF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Fcj3d2SF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAuYm-00029n-7G
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 06:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAuYb-00029g-FO
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 06:20:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAuYY-00041s-8f
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 06:20:33 -0400
Received: from greensocs.com ([193.104.36.180]:51733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1gAuYX-00041C-QZ; Fri, 12 Oct 2018 06:20:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A77736FD8A;
	Fri, 12 Oct 2018 12:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539339620;
	bh=6YpIjxGQCU0ceTh0mp5tb9m8SioprJkN3LN+eSQqVRQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=IowSLUHtuvF7JyhgRanwfcr0es6T/GYHqUekhSRIkjND3bgVUqhOSzHiyqCAz2Jte
	hPvPVr7g8sP+Fkys7uprOUuylnsnv0zMg326sznkg0ir/PPM3Fdj8IDwsgrxnvcfvH
	m087gAqf8wmlGNthYQwvVvr403n1x7iVoxkCWoiM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Fcj3d2SF;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Fcj3d2SF
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJ7duCtRf1IU; Fri, 12 Oct 2018 12:20:19 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 6CCB76FD9A; Fri, 12 Oct 2018 12:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539339619;
	bh=6YpIjxGQCU0ceTh0mp5tb9m8SioprJkN3LN+eSQqVRQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Fcj3d2SFvicw93fIggKRf8DnVi3jUpuoUrKflCuuSZKiHrwAcGVW9kCyu0U3xETGf
	B8i4ZuC4PdtNd9Aqmxu7Alu8uodJxWA3QLTEytEVYO6ppn5mRR59O/7qH0M/w79DJO
	ZN9RKyq7A6bm5wTW3NLzulKBWW2hOhCG7XCouyHE=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EB6526FD8A;
	Fri, 12 Oct 2018 12:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539339619;
	bh=6YpIjxGQCU0ceTh0mp5tb9m8SioprJkN3LN+eSQqVRQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Fcj3d2SFvicw93fIggKRf8DnVi3jUpuoUrKflCuuSZKiHrwAcGVW9kCyu0U3xETGf
	B8i4ZuC4PdtNd9Aqmxu7Alu8uodJxWA3QLTEytEVYO6ppn5mRR59O/7qH0M/w79DJO
	ZN9RKyq7A6bm5wTW3NLzulKBWW2hOhCG7XCouyHE=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-4-damien.hedde@greensocs.com>
	<2478a2c0-7f5f-556c-09c3-1fa503984f38@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <d8807487-72b9-e5c4-ba81-281218023dc6@greensocs.com>
Date: Fri, 12 Oct 2018 12:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <2478a2c0-7f5f-556c-09c3-1fa503984f38@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 3/9] qdev-monitor: print the
 device's clock with info qtree
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51ZmEzYCNmYx

Hi Philippe,

On 10/3/18 12:42 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Damien,
>=20
> On 10/2/18 4:24 PM, Damien Hedde wrote:
>> This prints the clocks attached to a DeviceState when using "info qtre=
e" monitor
>> command. For every clock, it displays the direction, the name and if t=
he
>> clock is forwarded. For input clock, it displays also the frequency.
>=20
> What would also be really useful (during development mostly)
> is a "info clktree" monitor command.

What would be the output ? A list of all clock related devices and their
clocks ? Or something more like a clock tree starting from the source(s)
clock up to the last ones ? (or the opposite starting from a
clocked-device down to the sources)

Concerning development, it might also be useful to have access to the
frequency of a clock output. Maybe I should add the value in the object
for that purpose ?

>=20
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  qdev-monitor.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/qdev-monitor.c b/qdev-monitor.c
>> index 61e0300991..8c39a3a65b 100644
>> --- a/qdev-monitor.c
>> +++ b/qdev-monitor.c
>> @@ -682,6 +682,7 @@ static void qdev_print(Monitor *mon, DeviceState *=
dev, int indent)
>>      ObjectClass *class;
>>      BusState *child;
>>      NamedGPIOList *ngl;
>> +    NamedClockList *clk;
>> =20
>>      qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(de=
v)),
>>                  dev->id ? dev->id : "");
>> @@ -696,6 +697,17 @@ static void qdev_print(Monitor *mon, DeviceState =
*dev, int indent)
>>                          ngl->num_out);
>>          }
>>      }
>> +    QLIST_FOREACH(clk, &dev->clocks, node) {
>> +        if (clk->out) {
>> +            qdev_printf("clock-out%s \"%s\"\n",
>> +                        clk->forward ? " (fw)" : "",
>> +                        clk->name);
>> +        } else {
>> +            qdev_printf("clock-in%s \"%s\" freq=3D%" PRIu64 "Hz\n",
>=20
> IMHO 'freq_hz=3D%" PRIu64 "\n"' is easier to read.

The frequency value in hertz is not easy to read in general (eg:
33333333Hz). Maybe we should print it with an apropriate unit (eg:
33.333333MHz). We can also use the "'" printf flag for thousand
separator but it's locale-dependent (and in my case it prints nothing).

>=20
> However if we plan to add/use a qemu_strtohz() similar to
> qemu_strtosz_metric(), that would be fine.

You mean for test purpose ?

>=20
>> +                        clk->forward ? " (fw)" : "",
>> +                        clk->name, clock_get_frequency(clk->in));
>> +        }
>> +    }
>>      class =3D object_get_class(OBJECT(dev));
>>      do {
>>          qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent=
);
>>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
