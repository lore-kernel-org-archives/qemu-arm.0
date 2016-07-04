Received: by 10.25.21.96 with SMTP id l93csp1483002lfi;
        Mon, 4 Jul 2016 05:01:47 -0700 (PDT)
X-Received: by 10.37.123.131 with SMTP id w125mr6750161ybc.69.1467633706789;
        Mon, 04 Jul 2016 05:01:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128si1806234qke.195.2016.07.04.05.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK2ZO-0004AI-64
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2ZK-00048d-J5
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:01:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2ZG-0008Oy-DE
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:01:41 -0400
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:33475)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2ZG-0008Or-24
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:01:38 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 0B4E2FFBADF
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 14:01:37 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 5C34948001B;
	Mon,  4 Jul 2016 14:01:27 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<5778025A.9020608@gmail.com>
	<8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
	<CAFEAcA8Mrxj8y=MiHv0RpqNijAGrSS71wpT2JYU6k0okAqM=nw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b7a505f6-459f-377d-9e88-c42ba1b2897c@kaod.org>
Date: Mon, 4 Jul 2016 14:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Mrxj8y=MiHv0RpqNijAGrSS71wpT2JYU6k0okAqM=nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 5773614726092983216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.33.202
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MSNVyLJI6ee1

On 07/04/2016 01:14 PM, Peter Maydell wrote:
> On 4 July 2016 at 10:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 07/02/2016 08:05 PM, mar.krzeminski wrote:
>>>
>>>
>>> W dniu 28.06.2016 o 20:24, C=C3=A9dric Le Goater pisze:
>=20
>>>> +static void test_erase_sector(void)
>>>> +{
>>>> +    uint32_t some_page_addr =3D 0x600 * PAGE_SIZE;
>>>> +    uint32_t page[PAGE_SIZE / 4];
>>>> +    int i;
>>>> +
>>>> +    spi_conf(CONF_ENABLE_W0);
>>>> +
>>>> +    spi_ctrl_start_user();
>>>> +    writeb(AST2400_FLASH_BASE, WREN);
>>>> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
>>>> +    writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
>>>> +    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
>>> Hi,
>>>
>>> I think you should not make any byte swapping because
>>> qtest for all write* instructions (see qtest.c:377).
>>
>> yes. on a BE, we should not byte swap.
>>
>> When on a LE host, the cpu_to_be32() call in the test byte-swaps
>> the address, tswap32() in qtest.c does nothing as the host endian
>> and guest endian are in sync and so the address reaches the
>> controller region in the expected order.
>>
>> When on a BE host, the cpu_to_be32() does nothing but tswap32() in
>> qtest.c reverses the order and so the address reaches the controller
>> region in the wrong order (LE).
>>
>> I see two possible fixes :
>>
>> 1 - replace the read* routines by out* (no tswap there)
>=20
> This would be wrong: "out*" is a request for an I/O access,

yes. that felt really wrong.

> which is meaningless for ARM. (On x86 it's an actual outb/outw/outl
> instruction.) In any case it wouldn't change the number of
> byteswaps that happen:
>=20
>  * "outl" qtest command calls cpu_outl(), which calls
>    stl_p() on the value, to do "store in target endianness
>    to buffer"; stl_p() will do a byteswap if the target and
>    host endianness differ. The buffer is then passed to
>    address_space_write(), which is a wrapper for
>    address_space_rw(), which treats its buffer as a pile
>    of bytes to be written.
>  * "writel" qtest command does a tswap32s() on the data, which
>    converts it to target endianness in a local variable.
>    The address of the variable is then passed to
>    cpu_physical_memory_write(), which is just a thin wrapper
>    around address_space_rw(), which as above treats its
>    buffer as a pile of bytes.
>=20
> So the two things end up the same, it's just that for writel
> we do the conversion from a host-ordered value to a
> target-ordered value in a direct tswapl(), but for outl
> this happens implicitly in cpu_outl()'s stl_p().

ok. thanks for the summary/explanation.=20

>> 2 - add an extra byteswap on BE hosts using qtest_big_endian() as
>>     in virtio-blk-test.c. see virtio_blk_fix_request()
>=20
> What is the test actually supposed to be doing?
> writel() says "write this 32 bit value as if the (guest) CPU
> wrote it to memory with a 32-bit write instruction".

The test (and the guest) is writing and reading data on the memory=20
region used by the SPI controller. This 'data' is then passed on=20
to the SPI flash module objects which expects BE order when there
are flash storage addresses are in the flow.=20

So I think the test needs to use mem{write,read} and not write*.
The result looks correct in the code. I will send a patchset=20
right after starting with this patch.

> Your problem here is entirely on the test code side, I think.

As the guest boots correctly, I would say yes also.

> It should be issuing the same commands down the qtest protocol
> for any host endianness, but as it stands on a little endian
> host it will issue "writel 0x20000000 0x600" whereas on a big
> endian host it will issue "writel 0x20000000 0x60000".
>=20
> (virtio is special because it has some weird ideas about
> endianness due to being a virtual-only device with a spec
> written by all-the-world-is-little-endian x86 people, so
> it's a bad example to copy.)

yes, we had a taste of that when virtio support was added for
the ppc64be guests :)

Thanks,

C.

