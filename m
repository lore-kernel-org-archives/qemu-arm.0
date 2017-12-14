Received: by 10.223.159.74 with SMTP id f10csp6351450wrg;
        Thu, 14 Dec 2017 06:04:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBosiH1A/IucreErvokPYK2r2YXI6eCksix6MngBMr59U9RindLPhLpkd6I67yXhhEskfT5PH
X-Received: by 10.37.222.194 with SMTP id v185mr4172526ybg.224.1513260242706;
        Thu, 14 Dec 2017 06:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513260242; cv=none;
        d=google.com; s=arc-20160816;
        b=UWtH4r6b7igPpVAT/BYzHBlOmrYZHGJYR8N0U4da8zZDSL2eF7f/eJdp1PPUTchZ6N
         ovFSiMKAH0ew396zPgzFY0PR1A9JJO9J19KjamZdUTPgHC/s3nkzOpIQ1bIiVr+zzXne
         VDr92Le8LMP8nYaNTO73kxhnzJTwz0t4StJHZvWFtMTpg5aHZ1ze3yAi8tLXd7WzeCBE
         GUzq950cQ8E7AP5SLLNJCJ42/WAUM8z5mdDNecWV5x7RXtMBvScGaLBu1vVJpsTtmbo6
         LPrwN1fpDVB3nXupHDfObnxlGyTE948R0+uArLT7Q66ropRnksFl77ziVW/jRJ5rWtO1
         WgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=gVjMVr/LzpC3f/9RvpqePjKzp1AR84wb+/zfQQ5PtQo=;
        b=gONWcC7Rl6QZ1Beq6uFzG1y60BMEVIGLbnsB/NC+0OzLif6+8qBhIyihDd7FJHcIpq
         zDzs26TIVEA6PtBwCBIEvpDZi1J4VIFO1PcplUohPD6WrP+QdP9uVt7ZbZx1n74QirmI
         tL4cnPEsJmeT1Id/MYP3DDiVTtwQaAV4vtrgNN5DQ1MkPh66+lo0+erX3uULaU4Zjtxl
         W46t2TUSIzyeKs1z9Tz1PJFMA3j84gssJjy/eWl3Db3bsz8QnhJYRi+V5Io3FnbE5Nzj
         x8GhUvUhMMAOUBNH2g3Sh7OHM3VMTRStnLCVhK3QglIzN6SDwC4tb2/JejkI8jjvRe45
         3mGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NDG1307n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l132si793592ywc.172.2017.12.14.06.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NDG1307n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePU7G-0006Yg-7O
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:04:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePU71-0006YF-M6
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:03:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePU6v-0006PC-Bh
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:03:47 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:38924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePU6v-0006On-5Z; Thu, 14 Dec 2017 09:03:41 -0500
Received: by mail-qk0-x22e.google.com with SMTP id u184so6318566qkd.6;
	Thu, 14 Dec 2017 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gVjMVr/LzpC3f/9RvpqePjKzp1AR84wb+/zfQQ5PtQo=;
	b=NDG1307n8Gjrs23vl96ExB8UaADFAU/Bm/QaPsqICtiCi1svhrlax3NbLGp5Czy/yq
	PIFDDmupl3boPEn6REnMaLGdP2FgeYPdstapjg9sSyksYTLPHmJQONJWP6EDTGd5E+vg
	BtqokeezcDPCQBpHmIxYwvPB1CiDLLlKQfYBMWV1z83NB5d+S7736owYwKoyewj1GqSs
	3vTTXGNpNccRtu7vT8tmCPQP/zob9kvlpoY1oOuzWd7eguFXnNf/oCMvfaOx50dJBmFP
	zOUkklIZq27ExspSbdl3TVSe+a/FcblzJZ1F/5rpuFA1Iow8CZycIT7mO8zfLwpuks/V
	pUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gVjMVr/LzpC3f/9RvpqePjKzp1AR84wb+/zfQQ5PtQo=;
	b=s9koFqKUzyzbX8U1bIjjq4XaPbb5/E8aXIKyYjtuw2lF/P1eNyFBgqutKlY3cUIwlW
	X3TH/DTKe0uso86hVcfuq2lsjoYTieSI8YY6Ovw8cSFupUNzt2fJaYUYxq2WL96lYeBZ
	9LsWT3Yu+O73w3uaCDVzzEiWt75LikhTFWIMmoAUj18Yz8yhLg8m6uUGAQZRUJ8AFBo/
	6PRLYiCBl/eZkHFDxPrILR3kOFNyLKKuXvkNalQHlR1WiqMWYkK4heJt7kwWDYiv1vo1
	9B31Nk8EWPynTKmUkVQFqrVdpiCCpKT/DOHO3ohYbL1HORBnuaLrYoDMyK98eZBfLI+A
	LYew==
X-Gm-Message-State: AKGB3mLMOIbadvaPrvgS8uIOtZ4sgoc77eZoxsK42OvMZcF99LalB+tg
	J4z3PXFRGaFnFd2pixzwM/DtSuYuCmXSo59qjog=
X-Received: by 10.233.221.3 with SMTP id r3mr14953760qkf.11.1513260220022;
	Thu, 14 Dec 2017 06:03:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Thu, 14 Dec 2017 06:03:39 -0800 (PST)
In-Reply-To: <CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-13-andrew.smirnov@gmail.com>
	<CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 14 Dec 2017 06:03:39 -0800
Message-ID: <CAHQ1cqHhN=hLun2mzqvg0N3NkxEbPpBU1iEf5-mAdnHqEs3KYg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: Re: [Qemu-arm] [PATCH 12/13] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eJSwbEZvPUia

On Tue, Dec 12, 2017 at 9:52 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
>> IP block found on several generations of i.MX family does not use
>> vanilla SDHCI implementation and it comes with a number of quirks.
>>
>> Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
>> support unmodified Linux guest driver.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>
>> +    case ESDHC_DLL_CTRL:
>> +    case ESDHC_TUNE_CTRL_STATUS:
>> +    case 0x6c:
>
> Isn't there a name we can give 0x6c ?
>

Unfortunately, not that I know of. It's a mystery register not listed
in RM and the only place I can found it being mentioned is in Linux
driver as a part of errata ESDHC_FLAG_ERR004536 fix, where it is used
nameless as well.

>> +    case ESDHC_TUNING_CTRL:
>> +    case ESDHC_VENDOR_SPEC:
>> +    case ESDHC_MIX_CTRL:
>> +    case ESDHC_WTMK_LVL:
>> +        ret =3D 0;
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void
>> +usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>> +{
>> +    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
>> +    uint8_t hostctl;
>> +    uint32_t value =3D (uint32_t)val;
>> +
>> +    switch (offset) {
>> +    case ESDHC_DLL_CTRL:
>> +    case ESDHC_TUNE_CTRL_STATUS:
>> +    case 0x6c:
>> +    case ESDHC_TUNING_CTRL:
>> +    case ESDHC_WTMK_LVL:
>> +    case ESDHC_VENDOR_SPEC:
>> +        break;
>> +
>> +    case SDHC_HOSTCTL:
>> +        /*
>> +         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
>> +         *
>> +         *       7         6     5      4      3      2        1      0
>> +         * |-----------+--------+--------+-----------+----------+------=
---|
>> +         * | Card      | Card   | Endian | DATA3     | Data     | Led  =
   |
>> +         * | Detect    | Detect | Mode   | as Card   | Transfer | Contr=
ol |
>> +         * | Signal    | Test   |        | Detection | Width    |      =
   |
>> +         * | Selection | Level  |        | Pin       |          |      =
   |
>> +         * |-----------+--------+--------+-----------+----------+------=
---|
>> +         *
>> +         * and 0x29
>> +         *
>> +         *  15      10 9    8
>> +         * |----------+------|
>> +         * | Reserved | DMA  |
>> +         * |          | Sel. |
>> +         * |          |      |
>> +         * |----------+------|
>> +         *
>> +         * and here's what SDCHI spec expects those offsets to be:
>> +         *
>> +         * 0x28 (Host Control Register)
>> +         *
>> +         *     7        6         5       4  3      2         1        =
0
>> +         * |--------+--------+----------+------+--------+----------+---=
------|
>> +         * | Card   | Card   | Extended | DMA  | High   | Data     | LE=
D     |
>> +         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Co=
ntrol |
>> +         * | Signal | Test   | Transfer |      | Enable | Width    |   =
      |
>> +         * | Sel.   | Level  | Width    |      |        |          |   =
      |
>> +         * |--------+--------+----------+------+--------+----------+---=
------|
>> +         *
>> +         * and 0x29 (Power Control Register)
>> +         *
>> +         * |----------------------------------|
>> +         * | Power Control Register           |
>> +         * |                                  |
>> +         * | Description omitted,             |
>> +         * | since it has no analog in ESDHCI |
>> +         * |                                  |
>> +         * |----------------------------------|
>> +         *
>> +         * Since offsets 0x2A and 0x2B should be compatible between
>> +         * both IP specs we only need to reconcile least 16-bit of the
>> +         * word we've been given.
>> +         */
>
> Thanks for this explanation, it's very helpful in figuring out what's
> going on.
>
>> +    case SDHC_BLKSIZE:
>> +        /*
>> +         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
>> +         * Linux driver will try to zero this field out which will
>> +         * break the rest of SDHCI emulation.
>> +         *
>> +         * Linux defaults to maximum possible setting (512K boundary)
>> +         * and it seems to be the only option that i.MX IP implements,
>> +         * so we artificially set it to that value.
>> +         */
>> +        val |=3D 0x7 << 12;
>> +        /* FALLTHROUGH */
>
> We generally write this lowercase: /* fallthrough */
>

OK, will fix in v2.

>> +    default:
>> +        sdhci_write(opaque, offset, val, size);
>> +        break;
>> +    }
>> +}
>
>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>> index 0f0c3f1e64..dc1856a33d 100644
>> --- a/include/hw/sd/sdhci.h
>> +++ b/include/hw/sd/sdhci.h
>> @@ -39,6 +39,7 @@ typedef struct SDHCIState {
>>      };
>>      SDBus sdbus;
>>      MemoryRegion iomem;
>> +    const MemoryRegionOps *io_ops;
>>
>>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>>      QEMUTimer *transfer_timer;
>> @@ -83,8 +84,13 @@ typedef struct SDHCIState {
>>      /* Force Event Auto CMD12 Error Interrupt Reg - write only */
>>      /* Force Event Error Interrupt Register- write only */
>>      /* RO Host Controller Version Register always reads as 0x2401 */
>> +
>> +    unsigned long quirks;
>
> I asked for this not to be unsigned long in the last round of review.
>

Ugh, missed this one, sorry about that. Will fix in v2.

>>  } SDHCIState;
>>
>> +/* Controller does not provide transfer-complete interrupt when not bus=
y */
>> +#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
>
> I asked for a comment saying we're following the Linux kernel's
> quirk bit numbering in the last round of review.
>

My bad, will fix in v 2.

Thanks,
Andrey Smirnov
