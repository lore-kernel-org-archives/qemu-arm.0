Received: by 10.25.159.19 with SMTP id i19csp2025007lfe;
        Mon, 18 Jan 2016 08:55:01 -0800 (PST)
X-Received: by 10.140.19.43 with SMTP id 40mr32940466qgg.72.1453136101771;
        Mon, 18 Jan 2016 08:55:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c108si31722962qgf.117.2016.01.18.08.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 08:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:60760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLD53-00064O-9I
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 11:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLD51-000624-K0
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 11:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLD50-0001aX-Pj
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 11:54:59 -0500
Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234]:35088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aLD4z-0001Yq-1k; Mon, 18 Jan 2016 11:54:57 -0500
Received: by mail-ob0-x234.google.com with SMTP id py5so198289916obc.2;
	Mon, 18 Jan 2016 08:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=M+pF1is5pwOYGC8itjjlhoA6IZ/bs/yUOf1EIzgu0Qc=;
	b=ekxPpCHhKcvhfp52sLCxM7Ns/ApIjQ8QXk2nTn8CHYxD1olJsxdsRBUbp1znyLUTIA
	UIL+m1ztaKa9K4QQFPezFPptI0J+wH+VrQGzsLdMenHRPVyqGaOVBJdwSrBxJAlkKetp
	o8YHjPfJK1KBITVynR5bzAEEga/rZAERJzx2SQzyR0NaFWBdOrP8YelHipEZTHjNMN0D
	nnXLxIjSL07HU57vFK0bnZ6iRraZzJigDNCIyQJYIkc4TbMDGLcAV6vcvn+6Si/Vo99K
	qeJjEWAZ7TnO5Z7IapchXh8tOhpR9+WtBvhUzyiSVmIVO5ii0c/alC6+rU/Q2J3xpNQS
	vA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=M+pF1is5pwOYGC8itjjlhoA6IZ/bs/yUOf1EIzgu0Qc=;
	b=DnQABrfUpqQv4lvwwKzOPuqtxPCbYC4zIEpiRvMKEYOTK9uOHg13s3yYdIImwazpCX
	B8jYefMo40et1GqY0TyWNAyBRR8uD6tDDEEvC/Fa4Cu0PLuPQ8q/spfnkh/o9FZWoE3F
	4tIxeu1l/2uOyEkORT2TWrDU7dkzmwmjaQcaB3myb2m6m4e2KeUuqnxsIWx6KP8kbwV5
	EtuJTSkjqEOC1yp3gkjNuHQ8/PorPNUwgEAnCcek1QEbEJePpNC2Z2iHaQqz+y1TGoLD
	R1EIztF2DZOuLZR2bygge/54LxuWlzarXxekCv3MAC+qlWR7qDSfaPmBpRIxzMHuBU/u
	YCPA==
X-Gm-Message-State: ALoCoQljJFoFyKj1JNkAbvOSWzGYafU2jLF5FwfZ+sDoIub1RpYRuaJ6vZtbjgWpqGuKi/lgVEjD55ocq/UnnEKZcYNBepd72g==
X-Received: by 10.60.128.195 with SMTP id nq3mr20231061oeb.52.1453136096541;
	Mon, 18 Jan 2016 08:54:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 18 Jan 2016 08:54:26 -0800 (PST)
In-Reply-To: <CAFEAcA9DZ6OhN=cXVrbZftazX9eJb1eKRLG2D+Vp6mYnoXP60g@mail.gmail.com>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<569C8B29.4040300@redhat.com>
	<CAPokK=ovLXz__Tbh--dB+GEFpgBK8w3erG=P2jNrKbY37eJWyg@mail.gmail.com>
	<569C9E87.2030001@redhat.com>
	<CAPokK=qhk15US4a-OHLFo=U2GReQv45dT4oL6z=Hu0m8Bkf74Q@mail.gmail.com>
	<569CB702.1060803@redhat.com>
	<CAFEAcA9DZ6OhN=cXVrbZftazX9eJb1eKRLG2D+Vp6mYnoXP60g@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Jan 2016 08:54:26 -0800
X-Google-Sender-Auth: qHn1Rpt6G28JBBUatis08A_4EfU
Message-ID: <CAKmqyKMFsFa81bsauLfsB7UP1dSdboGgn=8vaN+-nnShuG5CMQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::234
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Prasad Pandit <ppandit@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] cadence_gem: fix buffer overflow
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
X-TUID: P0BLsP5+pcBi

On Mon, Jan 18, 2016 at 2:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 09:57, Jason Wang <jasowang@redhat.com> wrote:
>> Thanks for the pointer.
>>
>> In section 16.1.5, it said
>>
>> "Jumbo frames are not supported."
>>
>> So it was in fact not an unimplemented feature?

I'd say this should be a guest error then. Unless anyone who knows
Ethernet well thinks otherwise?

Thanks,

Alistair

>
> I have a vague feeling from the last time I looked at something like
> this that what often happens is the hardware happily goes on dumping
> data out on the wire but this is a violation of the ethernet protocol,
> ie a guest error. But I'm no ethernet expert...
>
> thanks
> -- PMM
>
