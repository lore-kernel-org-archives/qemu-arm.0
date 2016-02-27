Received: by 10.25.208.211 with SMTP id h202csp454641lfg;
        Sat, 27 Feb 2016 15:14:28 -0800 (PST)
X-Received: by 10.140.16.225 with SMTP id 88mr10834526qgb.96.1456614868142;
        Sat, 27 Feb 2016 15:14:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si19496021qkb.28.2016.02.27.15.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 15:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZo4B-0005vr-FI
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 18:14:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZo48-0005vT-Ms
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 18:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZo47-0004lv-Hu
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 18:14:24 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZo47-0004lr-7N; Sat, 27 Feb 2016 18:14:23 -0500
Received: by mail-wm0-x232.google.com with SMTP id p65so2657912wmp.0;
	Sat, 27 Feb 2016 15:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=SN7gkNmGHOr7E+W2HYCL9B45+b1kpGr3/TrZ+7aYxkg=;
	b=EldMRWrtS9lRGs8pAiUcsQM0KjCFnnMu19L2a4ARXYbbA+Onx1R7xUrB/dvszDcy3s
	vgub5Qp7NEU2KiKWVjkKkKPqMccR4rCD7FO2eObVieLYMNO89az2iKZv0d0RkUN/t2hE
	VT8u2IqE1pyODltZv1M+Ul19h0A16pisskkyU75Pqi5udQKlYWx/flGyBNfQqwu/wnWY
	3pyEpUvMlEthaw5V+hGe8hkZws+zxEJDy9q0RKyJQqgg7tY/iDLy1AlmcN2sCarHfMoL
	RhmbAdK0J/yGcdqwdz5xwgQApg91PwYUNKUqfP3B9L/F7/0pjG5I/OAr7U8jhxN8x3Q2
	uqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=SN7gkNmGHOr7E+W2HYCL9B45+b1kpGr3/TrZ+7aYxkg=;
	b=BPMuB4ftd849GG68MRZqTnjJQjocfTdL2DoqsYjOJZPsdxSbgWCeo7pOJmRfY5mWk3
	/020SntMAwFjYYFTxZeyQqpOodKLDa3mMz4upfbxraZERJEVkm3EE8CvXIksdArG61a7
	gLUJQL0pEe3AMIKWZ5aS7JyWG8W7mcMvlnvZ1U7HIaOcFtOY+NbmuyElE0/XosLwzPCD
	1anhQpW/U+m4ZVHIZ7or2cP7fC3OVNDncxyrM9E/tRf+ecBxUMK54C3QNSUcxGjXKZ30
	dUWZZMC9vZ2lPlitS2cFkhIgtifLGdZCMkerpOY4DcfsCHDo7oeHDTK/ZIK12WQuCJHa
	nEAQ==
X-Gm-Message-State: AD7BkJJHdq1LcY8b7RS89y5fnIr6gKKIh+J5g5dl8me3mF1tzobae9pvcJZEeB85hcJO/w3CSmqkXTkDrs4+ug==
MIME-Version: 1.0
X-Received: by 10.195.12.113 with SMTP id ep17mr7648013wjd.102.1456614862637; 
	Sat, 27 Feb 2016 15:14:22 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 15:14:22 -0800 (PST)
In-Reply-To: <CAFEAcA-ENLO+YZ+b2bZi40o4qVaucdXDmLqPHXUYf9OwM1_Usw@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<e19e839cc4cf495fd7db0ab0fa5dba52657cd8ca.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-ENLO+YZ+b2bZi40o4qVaucdXDmLqPHXUYf9OwM1_Usw@mail.gmail.com>
Date: Sat, 27 Feb 2016 15:14:22 -0800
Message-ID: <CAPokK=oUdJMnq4PyrJtwcxhHj57eDYmNyV7KMhS5tNqB2wANEA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
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
X-TUID: zrKo48m/MQky

On Tue, Jan 19, 2016 at 9:53 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> Some CPUs are of an opposite data-endianness to other components in the
>> system. Sometimes elfs have the data sections layed out with this CPU
>> data-endianess accounting for when loaded via the CPU, byte swaps
>> (relative to other system components) will occur.
>>
>> The leading example, is ARM's BE32 mode, which is is basically LE with
>> address manipulation on half-word and byte accesses to access the
>> hw/byte reversed address. This means that word data is invariant
>> accross LE and BE32. This also means that instructions are still LE.
>> The expectation is that the elf will be loaded via the CPU in this
>> endianness scheme, which means the data in the elf is reversed at
>> compile time.
>>
>> As QEMU loads via the system memory directly, rather than the CPU, we
>> need a mechanism to reverse elf data endianness to implement this
>> possibility.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>
>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>> index 33067f8..e542575 100644
>> --- a/include/hw/loader.h
>> +++ b/include/hw/loader.h
>> @@ -35,7 +35,7 @@ const char *load_elf_strerror(int error);
>>  int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
>>               uint64_t *highaddr, int big_endian, int elf_machine,
>> -             int clear_lsb);
>> +             int clear_lsb, int data_swab);
>>  void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>>  int load_aout(const char *filename, hwaddr addr, int max_sz,
>>                int bswap_needed, hwaddr target_page_size);
>
> Can we have a doc comment so we have something that defines what
> values data_swab accepts? (it's not just a bool).
>

This is difficult to capture without writing to whole documentation
for load_elf. So here goes:

/** load_elf:
 * @filename: Path of ELF file
 * @translate_fn: optional function to translate load addresses
 * @translate_opaque: opaque data passed to @translate_fn
 * @pentry: Populated with program entry point. Ignored if NULL.
 * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
 * @highaddr: Populated with highest loaded address. Ignored if NULL.
 * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
 * @elf_machine: Expected ELF machine type
 * @clear_lsb: Set to mask off LSB of addresses (Some arch's use this
               for non-address data)
 * @data_swab: Set to order of byte swapping for data. 0 for no swap, 1
 *             for swapping bytes within halfwords, 2 for bytes within
 *             words and 3 for within doublewords.
 *
 * Load an ELF file's contents to the emulated systems address space.
 * Clients may optionally specify a callback to perform address
 * translations. @pentry, @lowaddr and @highaddr are optional pointers
 * which will be populated with various load information. @bigendian and
 * @elf_machine give the expected endianness and machine for the ELF the
 * load will fail it the target ELF does not match. Some architectures
 * have some arch-specific behaviours that come into effect when their
 * particular values for @elf_machine are set.
 */

Regards,
Peter

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
