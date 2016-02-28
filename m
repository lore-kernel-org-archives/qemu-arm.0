Received: by 10.25.208.211 with SMTP id h202csp706344lfg;
        Sun, 28 Feb 2016 07:29:10 -0800 (PST)
X-Received: by 10.55.221.18 with SMTP id n18mr13780954qki.50.1456673350281;
        Sun, 28 Feb 2016 07:29:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y16si22261082qhb.66.2016.02.28.07.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 28 Feb 2016 07:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aa3HR-00067J-Ou
	for alex.bennee@linaro.org; Sun, 28 Feb 2016 10:29:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aa3HP-00065v-Im
	for qemu-arm@nongnu.org; Sun, 28 Feb 2016 10:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aa3HO-0003kP-My
	for qemu-arm@nongnu.org; Sun, 28 Feb 2016 10:29:07 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aa3HO-0003kC-IX
	for qemu-arm@nongnu.org; Sun, 28 Feb 2016 10:29:06 -0500
Received: by mail-vk0-x22a.google.com with SMTP id k196so114658062vka.0
	for <qemu-arm@nongnu.org>; Sun, 28 Feb 2016 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eifecBePHwPaWNvBod3ZRXA6J/muOyv7Xf7LGHXKFMg=;
	b=LlFYhBrz/CWMf1p47QvtxU6QBd/gw+/4lL/JySjnxcrfITdWrnUVfhbP7mLfXJU3gU
	kfV6peAGING0MejHPN8/fnpQhi40igX0KIprUlDm0nTXZTAGWUpWslvor5o0gBOlJ6sv
	o929Bs8K5pqmDcfEl35CuiJQVleM9pyuK85MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eifecBePHwPaWNvBod3ZRXA6J/muOyv7Xf7LGHXKFMg=;
	b=G/YqoyzFpjSxM1Cb7cIDL6ro0OypxwxOeFSHHmGPxc/jWX+au9Kmab8waDHnBdtxO2
	l/shQgOOb+tzLmxhqB1PlC3L9B+LS8GmSXbry2uTVqXBQil9G7yrW7JkxjkpleiV96ES
	jYMD2zoesgxbJQ1IwKuroelSLjbYFH12vXKrciRAR3BVDZzjrh+v+t1A+HmuEaUuLY8T
	rc8ptvE7ynUt7obUVSDMloG3SwLYuauN74J6RZeHVI3qK89CwhFbHUKviFghP4DLdvGj
	l2hHaYfUKupOMz6E4Cu2cgJ/jR5uDzv5Ak4aHPaSSE3LdEAmZO284hdLv8zkBc02Yf5J
	FLng==
X-Gm-Message-State: AD7BkJLchcNkFFNTQlWr8NOkQfRG/8K8g2j4XXjDpuSQwqkYo9QLIm2ONxN4MdJpQY6qiy/RAKjAtFMwd0KYXD5b
X-Received: by 10.31.52.147 with SMTP id b141mr8446504vka.82.1456673344911;
	Sun, 28 Feb 2016 07:29:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sun, 28 Feb 2016 07:28:45 -0800 (PST)
In-Reply-To: <CAPokK=oUdJMnq4PyrJtwcxhHj57eDYmNyV7KMhS5tNqB2wANEA@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<e19e839cc4cf495fd7db0ab0fa5dba52657cd8ca.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-ENLO+YZ+b2bZi40o4qVaucdXDmLqPHXUYf9OwM1_Usw@mail.gmail.com>
	<CAPokK=oUdJMnq4PyrJtwcxhHj57eDYmNyV7KMhS5tNqB2wANEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 28 Feb 2016 15:28:45 +0000
Message-ID: <CAFEAcA_8nx3Hii8f--CnkYQ755esd2SMJg-B5b+G2A3srahO8A@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-TUID: BFFdS5Z4NOe8

On 27 February 2016 at 23:14, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Tue, Jan 19, 2016 at 9:53 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Can we have a doc comment so we have something that defines what
>> values data_swab accepts? (it's not just a bool).
>>
>
> This is difficult to capture without writing to whole documentation
> for load_elf. So here goes:

Thanks; a couple of typos below, but otherwise looks good.


> /** load_elf:
>  * @filename: Path of ELF file
>  * @translate_fn: optional function to translate load addresses
>  * @translate_opaque: opaque data passed to @translate_fn
>  * @pentry: Populated with program entry point. Ignored if NULL.
>  * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
>  * @highaddr: Populated with highest loaded address. Ignored if NULL.
>  * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
>  * @elf_machine: Expected ELF machine type
>  * @clear_lsb: Set to mask off LSB of addresses (Some arch's use this

Can we just write out "architectures" here?

>                for non-address data)
>  * @data_swab: Set to order of byte swapping for data. 0 for no swap, 1
>  *             for swapping bytes within halfwords, 2 for bytes within
>  *             words and 3 for within doublewords.
>  *
>  * Load an ELF file's contents to the emulated systems address space.

"system's"

>  * Clients may optionally specify a callback to perform address
>  * translations. @pentry, @lowaddr and @highaddr are optional pointers
>  * which will be populated with various load information. @bigendian and
>  * @elf_machine give the expected endianness and machine for the ELF the
>  * load will fail it the target ELF does not match. Some architectures

"if"

>  * have some arch-specific behaviours that come into effect when their

"architecture"

>  * particular values for @elf_machine are set.
>  */

thanks
-- PMM
