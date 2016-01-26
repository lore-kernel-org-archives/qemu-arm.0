Received: by 10.25.159.19 with SMTP id i19csp1776007lfe;
        Tue, 26 Jan 2016 04:05:47 -0800 (PST)
X-Received: by 10.55.71.76 with SMTP id u73mr28085840qka.6.1453809947214;
        Tue, 26 Jan 2016 04:05:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si1055265qht.123.2016.01.26.04.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 04:05:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aO2NW-0001ev-Oy
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 07:05:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aO2N6-0001Kk-73
	for qemu-devel@nongnu.org; Tue, 26 Jan 2016 07:05:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aO2N5-0008SM-34
	for qemu-devel@nongnu.org; Tue, 26 Jan 2016 07:05:20 -0500
Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232]:35715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>)
	id 1aO2N4-0008SC-U0; Tue, 26 Jan 2016 07:05:19 -0500
Received: by mail-ig0-x232.google.com with SMTP id t15so57068220igr.0;
	Tue, 26 Jan 2016 04:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aAyDfYi1yFNcGirV2+/5TG5nrcXCCepCmBk6Wan9uk0=;
	b=H6D9+iS0nx8HeAa3SK3ejL+gSVDyyI49yZiFaPZL15t9YAppA1MIY6KDtHLcluIbto
	Uvoy8E2n8i87WqwuCTMvdoXrhSW4/Yq9vPpYGUswzmZ5sk5v2cpI0zFVdQlM27Qj0qeT
	apahcPa4GG+87AS/OmCPAue51qH8qbl0vmPrePxx37H5e1STY7Rn9OyhDM9MzHlMTK4g
	Hkjh21ud3h8knsDEkQ6FY306C9shJflTzzBMeuyPa3Apl0lLmsiWNzaCMTGTZuSB9jds
	FhMl3OkwTG/XLg5GY5+BfQR0zqx7CNJfJ7cWOXcnjf3zbUIAS8WL6ygx/rjexNJac3Q2
	RScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=aAyDfYi1yFNcGirV2+/5TG5nrcXCCepCmBk6Wan9uk0=;
	b=A0jjcjII2MFZsXFqtcsc5yRRFy65efyWJgWQjlIQeMvSLksUIVwSJjkOzNvOzwYXK2
	QQRK+K2irt/ESceXlupOUGeyqbspuJ4JMRmrV7EGNZi7QYBd48CxNA2Eow9OVrZcnZhr
	kzgeriz/wfNdlGUWNi9r3O0+rPdaV3bZTVXr2UwNmwcx6h8UknF24FO/1M5VCVrgfLgA
	dFm6uCJ7cer5WqT1Nq5/ircKb9m2wFH8kWvqMZ2DwRRn6Se0tMIhe1kUDwhSl1EpCuA9
	efx26vfF/35v2rop7efJ9ejo7fnzYt3+HPq94D2OpQCZrhs1NHtlLKdYMiLB2+Qgd6GF
	mhKw==
X-Gm-Message-State: AG10YOQOSEBc4lSu0oZvxk4Y4ekUh3lX3X7kLOUxqDGAPpz9mqIr7r8hCe99QQxZ26RmFUiUs4cUVayQpXOS0g==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr23439403igb.78.1453809918354; 
	Tue, 26 Jan 2016 04:05:18 -0800 (PST)
Received: by 10.107.130.228 with HTTP; Tue, 26 Jan 2016 04:05:18 -0800 (PST)
In-Reply-To: <CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
	<CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
	<CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
Date: Tue, 26 Jan 2016 14:05:18 +0200
Message-ID: <CAB=otbQD8NXV3DLzcrcQjQWFSQCf1U6ZA3orPr+yM_1B_+gh2Q@mail.gmail.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::232
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] Does QEMU support AArch64 Big Endian
 emulation on x86-64 host?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uL1zXE49kXN2

On Mon, Jan 25, 2016 at 6:07 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 January 2016 at 13:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>>> I'm trying to run AArch64 Big Endian image under QEMU that I built for
>>> my x86-64 Ubuntu host from latest master branch and when I'm running
>>> kernel I'm getting next error:
>>>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>>>
>>> Similar image built as Little Endian runs fine with same QEMU tool
>>> (qemu-system-aarch64)
>>>
>>> So I'm wondering is it possible to run QEMU AArch64 Big Endian
>>> emulation on x86-64 host?
>
> It is not currently supported, no. However there are some patches
> on the list[*] to add this support, so I expect a future QEMU version
> will do this.
>
> [*] https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg03025.html

Thank you four quick answer.
I tried to apply this patch series to latest qemu master branch, but it
fails to apply in misc places. Peter Crosthwaite, could you please say
which commit ID is it based on?

Thanks,
Ruslan Bilovol
