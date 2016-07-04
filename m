Received: by 10.25.21.96 with SMTP id l93csp1466485lfi;
        Mon, 4 Jul 2016 04:15:30 -0700 (PDT)
X-Received: by 10.55.217.152 with SMTP id q24mr14850413qkl.159.1467630930859;
        Mon, 04 Jul 2016 04:15:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si1707279qto.143.2016.07.04.04.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 04:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK1qc-0003fJ-9V
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 07:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK1qW-0003V8-P4
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 07:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK1qR-0006Yr-Iv
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 07:15:23 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK1qQ-0006Yc-Tn
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 07:15:19 -0400
Received: by mail-vk0-x22e.google.com with SMTP id k68so140953303vkb.0
	for <qemu-arm@nongnu.org>; Mon, 04 Jul 2016 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=w+VDVwQ30/R9TVaAEIedKOVHFT7vyHGBnAmamocNz4g=;
	b=QK5WIkrB8TJ60Vv+VnC2rFODX2zVs9meyzyDZDsR/+kmRwehabSGTr5sZT2BRn6CNF
	q1F9dt6/SaDgWgouAxljBJ5C2AUu9ra9rQekghYeJaeKYY99c0Ow3kzzc8K/+QjVqSGZ
	hX4JNrj0Y4L8lsFvJW6L2dzZD+LyoEVfC4C+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=w+VDVwQ30/R9TVaAEIedKOVHFT7vyHGBnAmamocNz4g=;
	b=SLMMPf3p8sQncVljwIeIachHEV6mZHU85qnsBla5XiGNJTZfgCUh1iXPH5VfxuZaEp
	3gyZwyxGpKhw/FH55r0YOkLEknnPjLu8FiugGbMMiFbgwUhjtfvE+NgqElvHcDOKHTPR
	1Q09E+GuSEnVt/fKJbujiqRvnqjCNDcyARO/Tot8HpwxUItHgVg0JZVESCISnVSMQsg1
	ZY0uOENjWYYVrusjtSlwxhqIJPpXinHEmbaHHEnUXA28IHOsnGqmCPukO3oJSsGiN58X
	nvnXDziJlUgHvgz8TJSs3lcnUEJYBJM+UGNnwuLoUw6TY4JSmSoOgKsy2BoOllRdGiw+
	627A==
X-Gm-Message-State: ALyK8tIuCZ3zdRZFN7R45xOsWFk2eT0RqXboIny8/fiVSBvwSxwi8BlZ4QN4uwkMHe6DtQbDelqQGNi3xLff7XU2
X-Received: by 10.159.37.245 with SMTP id 108mr5030655uaf.66.1467630918286;
	Mon, 04 Jul 2016 04:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Mon, 4 Jul 2016 04:14:58 -0700 (PDT)
In-Reply-To: <8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<5778025A.9020608@gmail.com>
	<8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2016 12:14:58 +0100
Message-ID: <CAFEAcA8Mrxj8y=MiHv0RpqNijAGrSS71wpT2JYU6k0okAqM=nw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
X-TUID: 9EArfu/D9yB9

On 4 July 2016 at 10:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 07/02/2016 08:05 PM, mar.krzeminski wrote:
>>
>>
>> W dniu 28.06.2016 o 20:24, C=C3=A9dric Le Goater pisze:

>>> +static void test_erase_sector(void)
>>> +{
>>> +    uint32_t some_page_addr =3D 0x600 * PAGE_SIZE;
>>> +    uint32_t page[PAGE_SIZE / 4];
>>> +    int i;
>>> +
>>> +    spi_conf(CONF_ENABLE_W0);
>>> +
>>> +    spi_ctrl_start_user();
>>> +    writeb(AST2400_FLASH_BASE, WREN);
>>> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
>>> +    writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
>>> +    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
>> Hi,
>>
>> I think you should not make any byte swapping because
>> qtest for all write* instructions (see qtest.c:377).
>
> yes. on a BE, we should not byte swap.
>
> When on a LE host, the cpu_to_be32() call in the test byte-swaps
> the address, tswap32() in qtest.c does nothing as the host endian
> and guest endian are in sync and so the address reaches the
> controller region in the expected order.
>
> When on a BE host, the cpu_to_be32() does nothing but tswap32() in
> qtest.c reverses the order and so the address reaches the controller
> region in the wrong order (LE).
>
> I see two possible fixes :
>
> 1 - replace the read* routines by out* (no tswap there)

This would be wrong: "out*" is a request for an I/O access,
which is meaningless for ARM. (On x86 it's an actual outb/outw/outl
instruction.) In any case it wouldn't change the number of
byteswaps that happen:

 * "outl" qtest command calls cpu_outl(), which calls
   stl_p() on the value, to do "store in target endianness
   to buffer"; stl_p() will do a byteswap if the target and
   host endianness differ. The buffer is then passed to
   address_space_write(), which is a wrapper for
   address_space_rw(), which treats its buffer as a pile
   of bytes to be written.
 * "writel" qtest command does a tswap32s() on the data, which
   converts it to target endianness in a local variable.
   The address of the variable is then passed to
   cpu_physical_memory_write(), which is just a thin wrapper
   around address_space_rw(), which as above treats its
   buffer as a pile of bytes.

So the two things end up the same, it's just that for writel
we do the conversion from a host-ordered value to a
target-ordered value in a direct tswapl(), but for outl
this happens implicitly in cpu_outl()'s stl_p().

> 2 - add an extra byteswap on BE hosts using qtest_big_endian() as
>     in virtio-blk-test.c. see virtio_blk_fix_request()

What is the test actually supposed to be doing?
writel() says "write this 32 bit value as if the (guest) CPU
wrote it to memory with a 32-bit write instruction".

Your problem here is entirely on the test code side, I think.
It should be issuing the same commands down the qtest protocol
for any host endianness, but as it stands on a little endian
host it will issue "writel 0x20000000 0x600" whereas on a big
endian host it will issue "writel 0x20000000 0x60000".

(virtio is special because it has some weird ideas about
endianness due to being a virtual-only device with a spec
written by all-the-world-is-little-endian x86 people, so
it's a bad example to copy.)

thanks
-- PMM
