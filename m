Received: by 10.25.159.19 with SMTP id i19csp2544177lfe;
        Wed, 27 Jan 2016 09:39:49 -0800 (PST)
X-Received: by 10.55.221.29 with SMTP id n29mr24416438qki.11.1453916388931;
        Wed, 27 Jan 2016 09:39:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8si4989749qkh.115.2016.01.27.09.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jan 2016 09:39:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOU4K-00009u-Fw
	for alex.bennee@linaro.org; Wed, 27 Jan 2016 12:39:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aOU4H-00005y-Qp
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 12:39:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aOU4G-0005og-Nv
	for qemu-arm@nongnu.org; Wed, 27 Jan 2016 12:39:45 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aOU4E-0005o9-H0; Wed, 27 Jan 2016 12:39:42 -0500
Received: by mail-wm0-x234.google.com with SMTP id n5so37958786wmn.0;
	Wed, 27 Jan 2016 09:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dRpyMVbwvXkO7SqFr1PtBaA6k8USDyXeiO9o8d4J63o=;
	b=vnqZWloFLCpXzAXLFLofP/1CKGW0XEEnrHs43lZWsdsheBfYTilXi6sSMhY9twUT8k
	Rdr87+vbTENJx5GkuiLDLwTFCQxqBOIY8V5EefYqXgOio3CllhjiYaihSy6i+rGWygOy
	BhdCAZJV2/FkLMi5dIl18ByUMjzgWpXYszdnASL1KiThWElJ6tFOYDjNpERh3yVTbML7
	M/hxdF55id1EewYEIw0fZvi99Vsx7KPN0wEAewuyHZNbpttJNKqM6BGFjksXhGI64dLU
	i6Qa5j4xZ+5k64VTH3/k+ErDvPam+WHEzgWPJXFnID+uNJcz1XqstesnJtzXyFrpYKg0
	gobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=dRpyMVbwvXkO7SqFr1PtBaA6k8USDyXeiO9o8d4J63o=;
	b=QV5vBx4f9DugStYNstkWqewOMDOmknwtSmh5AHhGg6DnmWChcyRjsfx+odETLY3jc5
	u3ri7DyT+WQCvU3HkCCkDT0R1/JEtQnAKDIhVzUuckOjzwWs0MXO/adY8nE56kiyrmf2
	qdLYefRABOIObryaF+3XrFM1Xlmyx+xlrn/NiHfJDdWnYhoqVznnBivEswNb+kAdMPUf
	sg1V+hh/P2fTtYxKp2Q2Z54xv3aYr8XhMt7uvJBQlo/h/mIiPPShw3fZ8V0IlLv2qN2l
	+l0glRC/I6pbXVEE+nTbRpPz4HF73m+ItNmf2++Opo5sGDNejYGJhMhZlp40ocPDNlaE
	2TDA==
X-Gm-Message-State: AG10YORvofWeBr7id+JC5Zsc6e5Qcl+3kbjbzWOmJweuGn8rC3qfFrBuP4l/KjYWJQPK6stQ9uDsmZPZtyxvcA==
MIME-Version: 1.0
X-Received: by 10.28.217.83 with SMTP id q80mr30322498wmg.15.1453916381530;
	Wed, 27 Jan 2016 09:39:41 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 27 Jan 2016 09:39:41 -0800 (PST)
In-Reply-To: <CAB=otbQD8NXV3DLzcrcQjQWFSQCf1U6ZA3orPr+yM_1B_+gh2Q@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
	<CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
	<CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
	<CAB=otbQD8NXV3DLzcrcQjQWFSQCf1U6ZA3orPr+yM_1B_+gh2Q@mail.gmail.com>
Date: Wed, 27 Jan 2016 09:39:41 -0800
Message-ID: <CAPokK=pSaPuBYMdhJGk742Ty1KXB5A0a4NW8ctq=3iAtJtthPQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] Does QEMU support AArch64 Big Endian emulation on
 x86-64 host?
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
X-TUID: 0QjcuLi2iAeO

On Tue, Jan 26, 2016 at 4:05 AM, Ruslan Bilovol
<ruslan.bilovol@gmail.com> wrote:
> On Mon, Jan 25, 2016 at 6:07 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 25 January 2016 at 13:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>>>> I'm trying to run AArch64 Big Endian image under QEMU that I built for
>>>> my x86-64 Ubuntu host from latest master branch and when I'm running
>>>> kernel I'm getting next error:
>>>>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>>>>
>>>> Similar image built as Little Endian runs fine with same QEMU tool
>>>> (qemu-system-aarch64)
>>>>
>>>> So I'm wondering is it possible to run QEMU AArch64 Big Endian
>>>> emulation on x86-64 host?
>>
>> It is not currently supported, no. However there are some patches
>> on the list[*] to add this support, so I expect a future QEMU version
>> will do this.
>>
>> [*] https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg03025.html
>
> Thank you four quick answer.
> I tried to apply this patch series to latest qemu master branch, but it
> fails to apply in misc places. Peter Crosthwaite, could you please say
> which commit ID is it based on?
>

I pushed the branch just now to here:

https://github.com/pcrost/qemu/tree/arm-be.next

Regards,
Peter

> Thanks,
> Ruslan Bilovol
