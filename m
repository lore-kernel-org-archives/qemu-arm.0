Received: by 10.25.208.211 with SMTP id h202csp785913lfg;
        Sun, 28 Feb 2016 12:16:22 -0800 (PST)
X-Received: by 10.55.33.102 with SMTP id h99mr15185975qkh.18.1456690582236;
        Sun, 28 Feb 2016 12:16:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o206si23085297qho.27.2016.02.28.12.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 28 Feb 2016 12:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aa7lN-0004pJ-F6
	for alex.bennee@linaro.org; Sun, 28 Feb 2016 15:16:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aa7lL-0004pC-5J
	for qemu-arm@nongnu.org; Sun, 28 Feb 2016 15:16:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aa7lK-0004Px-6q
	for qemu-arm@nongnu.org; Sun, 28 Feb 2016 15:16:19 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:33509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aa7lK-0004Pq-0a; Sun, 28 Feb 2016 15:16:18 -0500
Received: by mail-wm0-x22e.google.com with SMTP id l68so12664607wml.0;
	Sun, 28 Feb 2016 12:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QlwC6EqNIf65eoKR68CBWhWsPuId72M4sRe9v2D+PK0=;
	b=0pXnhVkOfbTV9xO8PDCiyrMmUuaLZ9fYJxXKicIuBkfh+6y9AqD++k90cah6TVBvNt
	2/3eD6JOf3njLHVyKoKpPtpvgOulTPoJAHGwpWNonbKGYrNDUoi3iYSB9ZKuWzqt1PhB
	5jGlHUNzWr3Ruggf3KL/XZ1jV1E0zaBKjJTEYOs/RW+90dlYC5oIBd04MzRe+0UT/brj
	/Yg2KFhGIbAESdwcXw29BvbkecawengJEKVv40wFKRHA/uFr2PL8Ct94tS7MUw+3TgnO
	g8FeUIFwr1zTidwQsHnhQLSAqGJ2m6xcIkNLQixPjC5FZEBbgjAG5CFSfiPpwnChSsLv
	sSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QlwC6EqNIf65eoKR68CBWhWsPuId72M4sRe9v2D+PK0=;
	b=BXQD/4tzaSKBwXROzDRWIBoko+75S5/YoPJPV1KZJTiex9RgaCArc3rC8ikoyqQMeq
	ZuIWPYWWsKvUYYWpCHssiLDmIaSFaUPoU3fJBXchOm6FnqNfVj61hV83KosBxrvhHPPe
	/onXDOAjjknYqT8EFcjiBSSUrn6VQ6LYjg78m+AbJ/JrKJyjyc4a3iL8e1kpf3qHrM3p
	4U5xZqIs+6kKLXrQNvB3/5fK+doXAkciVOX7LACXWu9LJnSI80Gz/cj9PgPDxbMLD0k3
	VP552GpNmo3Llcx9tC5/jnQQbHBq3C2Zz26jBK07c35JE5W3RMEClkTHEMNGNvj4qggw
	bezg==
X-Gm-Message-State: AD7BkJKQPtp3aoVzgseDLrm+rROov+gpc303arA1tX10kh7QgjByQXb3Sio45xAnWscmLfLmLhn+fTMYqaUuLA==
MIME-Version: 1.0
X-Received: by 10.28.51.74 with SMTP id z71mr7708512wmz.15.1456690577300; Sun,
	28 Feb 2016 12:16:17 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sun, 28 Feb 2016 12:16:17 -0800 (PST)
In-Reply-To: <CAFEAcA_8nx3Hii8f--CnkYQ755esd2SMJg-B5b+G2A3srahO8A@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<e19e839cc4cf495fd7db0ab0fa5dba52657cd8ca.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-ENLO+YZ+b2bZi40o4qVaucdXDmLqPHXUYf9OwM1_Usw@mail.gmail.com>
	<CAPokK=oUdJMnq4PyrJtwcxhHj57eDYmNyV7KMhS5tNqB2wANEA@mail.gmail.com>
	<CAFEAcA_8nx3Hii8f--CnkYQ755esd2SMJg-B5b+G2A3srahO8A@mail.gmail.com>
Date: Sun, 28 Feb 2016 12:16:17 -0800
Message-ID: <CAPokK=qzXgDmN+i+j56--ZYUnaLhw0SghDapKB3BPeAhC0ph3g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 16/17] loader: Add data swap option to
	load-elf
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
X-TUID: nhdywOe8VEHE

On Sun, Feb 28, 2016 at 7:28 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 27 February 2016 at 23:14, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Tue, Jan 19, 2016 at 9:53 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Can we have a doc comment so we have something that defines what
>>> values data_swab accepts? (it's not just a bool).
>>>
>>
>> This is difficult to capture without writing to whole documentation
>> for load_elf. So here goes:
>
> Thanks; a couple of typos below, but otherwise looks good.
>
>
>> /** load_elf:
>>  * @filename: Path of ELF file
>>  * @translate_fn: optional function to translate load addresses
>>  * @translate_opaque: opaque data passed to @translate_fn
>>  * @pentry: Populated with program entry point. Ignored if NULL.
>>  * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
>>  * @highaddr: Populated with highest loaded address. Ignored if NULL.
>>  * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
>>  * @elf_machine: Expected ELF machine type
>>  * @clear_lsb: Set to mask off LSB of addresses (Some arch's use this
>
> Can we just write out "architectures" here?
>
>>                for non-address data)
>>  * @data_swab: Set to order of byte swapping for data. 0 for no swap, 1
>>  *             for swapping bytes within halfwords, 2 for bytes within
>>  *             words and 3 for within doublewords.
>>  *
>>  * Load an ELF file's contents to the emulated systems address space.
>
> "system's"
>
>>  * Clients may optionally specify a callback to perform address
>>  * translations. @pentry, @lowaddr and @highaddr are optional pointers
>>  * which will be populated with various load information. @bigendian and
>>  * @elf_machine give the expected endianness and machine for the ELF the
>>  * load will fail it the target ELF does not match. Some architectures
>
> "if"
>
>>  * have some arch-specific behaviours that come into effect when their
>
> "architecture"
>

All fixed. Thanks for the pre-review.

Regards,
Peter

>>  * particular values for @elf_machine are set.
>>  */
>
> thanks
> -- PMM
