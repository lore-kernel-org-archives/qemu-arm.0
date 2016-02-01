Received: by 10.25.159.19 with SMTP id i19csp236436lfe;
        Mon, 1 Feb 2016 11:04:11 -0800 (PST)
X-Received: by 10.140.231.137 with SMTP id b131mr32779639qhc.63.1454353451089;
        Mon, 01 Feb 2016 11:04:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si10798025qhb.39.2016.02.01.11.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Feb 2016 11:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQJli-0005cc-77
	for alex.bennee@linaro.org; Mon, 01 Feb 2016 14:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aQJlf-0005Ze-Jo
	for qemu-arm@nongnu.org; Mon, 01 Feb 2016 14:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aQJle-0008DO-82
	for qemu-arm@nongnu.org; Mon, 01 Feb 2016 14:04:07 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aQJlb-0008Cw-Ku; Mon, 01 Feb 2016 14:04:03 -0500
Received: by mail-wm0-x233.google.com with SMTP id l66so86027623wml.0;
	Mon, 01 Feb 2016 11:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Df7Ubhscl4g/OTIAwydqoVi8e6Vo0BWhvzo/AXSObNQ=;
	b=nv33o8itK8W16j2DJiHA2ooFsbBA55TjGhCkWOFHXpz5r43g+//DtrJtQOMSe4Og0s
	WwVWBlHeQ3wIdQ9RDzRK++ej+PeM4N76dFhFXWcewHo2kliclBNkaYZtJZWCjznd19Pp
	gJgXaO+uczcNNJ3rfoh0nHn+ifinjj0MthmWbHnqDajDHdVcakVlGnrrGshJWNZDH9Ef
	5S9MiHEuZHQFpbAhAAFq53TSTlPI0XyZQVhQTXgPAQAY5m6FhVl+icG7cd3DVYBTFS0e
	Ipb3r/YaADRDx+1k+mkFEtsk8EtV+2pgb7K2BC2e6zkPt+1f5jsJTICUGmd73luA0OeE
	yDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Df7Ubhscl4g/OTIAwydqoVi8e6Vo0BWhvzo/AXSObNQ=;
	b=QHO57lpg4tT9OUQlRfCW1qVdAbKSwdUrLsjuqc51Zas/0hp0PULk3T4jgsqHDBQppx
	kno0f8noB/wbOZltZXCbO1sdAzkK1sFIrKeaNEahgq6U4PNVyTf8Nax2UsnqUROFXpbI
	wamdF5C1e/QvlfzFKWk9IWEcjojYcvIRFrTeC2hvFJvoUWPokgqn8fzxsbh6Lma25ZOd
	uQHQJckKP+6b7iKkbtjZXD0DfqBXOp+z5tQHvcm50KBfeNfVGfQs+JF2gzZ2qdkXHaI+
	CEskw+4OyNWo5uaSdNZCH06cUOYwe4r3ZvpO+1ixg10n/uBoOtHdhMODFgLT3SXVm/sd
	kR1Q==
X-Gm-Message-State: AG10YOSfc6kAH4SCcgh/9SUuC8uh9AllJtQIoFfv7FB/3+nxWr2IhU1PgOEr7eBCPwhZH7OYgGeuaErr83lvMw==
MIME-Version: 1.0
X-Received: by 10.28.216.134 with SMTP id p128mr12546352wmg.59.1454353442783; 
	Mon, 01 Feb 2016 11:04:02 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Mon, 1 Feb 2016 11:04:02 -0800 (PST)
In-Reply-To: <CAB=otbQgZUcrnsAVFkepGEKBbO7EDh0yjC+6+AkoYsfQz69G2A@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
	<CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
	<CAFEAcA-Qm+vgjPt3eGfGdzZ-JMUoZ0-2dMiR+q1JRVzosbdRrw@mail.gmail.com>
	<CAB=otbQD8NXV3DLzcrcQjQWFSQCf1U6ZA3orPr+yM_1B_+gh2Q@mail.gmail.com>
	<CAPokK=pSaPuBYMdhJGk742Ty1KXB5A0a4NW8ctq=3iAtJtthPQ@mail.gmail.com>
	<CAB=otbQgZUcrnsAVFkepGEKBbO7EDh0yjC+6+AkoYsfQz69G2A@mail.gmail.com>
Date: Mon, 1 Feb 2016 11:04:02 -0800
Message-ID: <CAPokK=oZqr3LTg196bpKqE+Rk+XYBQ+kEvfkdSoO0fPL8ozsGg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
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
X-TUID: wFXkRLk8lerO

On Mon, Feb 1, 2016 at 3:25 AM, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
> On Wed, Jan 27, 2016 at 7:39 PM, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Tue, Jan 26, 2016 at 4:05 AM, Ruslan Bilovol
>> <ruslan.bilovol@gmail.com> wrote:
>>> On Mon, Jan 25, 2016 at 6:07 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On 25 January 2016 at 13:51, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>>>>>> I'm trying to run AArch64 Big Endian image under QEMU that I built for
>>>>>> my x86-64 Ubuntu host from latest master branch and when I'm running
>>>>>> kernel I'm getting next error:
>>>>>>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>>>>>>
>>>>>> Similar image built as Little Endian runs fine with same QEMU tool
>>>>>> (qemu-system-aarch64)
>>>>>>
>>>>>> So I'm wondering is it possible to run QEMU AArch64 Big Endian
>>>>>> emulation on x86-64 host?
>>>>
>>>> It is not currently supported, no. However there are some patches
>>>> on the list[*] to add this support, so I expect a future QEMU version
>>>> will do this.
>>>>
>>>> [*] https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg03025.html
>>>
>>> Thank you four quick answer.
>>> I tried to apply this patch series to latest qemu master branch, but it
>>> fails to apply in misc places. Peter Crosthwaite, could you please say
>>> which commit ID is it based on?
>>>
>>
>> I pushed the branch just now to here:
>>
>> https://github.com/pcrost/qemu/tree/arm-be.next
>
> Thanks Peter.
>
> I've built qemu on this branch and tried to run it with my
> AArch64 Big Endian binaries but still get same error:
> "qemu: fatal: Trying to execute code outside RAM or
> ROM at 0x00007fe60d8e0a30"
>
> So it looks like (unfortunately) these patches do not enable
> AArch64 BE support
>

You need to patch more information, including your QEMU command line
and possible a link to your binary. Are you using an ELF or a raw
image?

Regards,
Peter

> Best regards,
> Ruslan
