Received: by 10.25.208.211 with SMTP id h202csp448877lfg;
        Sat, 27 Feb 2016 14:47:09 -0800 (PST)
X-Received: by 10.140.93.166 with SMTP id d35mr10428275qge.29.1456613229394;
        Sat, 27 Feb 2016 14:47:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si19425139qkb.37.2016.02.27.14.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 14:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZndk-0006ps-Un
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 17:47:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZndc-0006o5-Mf
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:47:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZndX-0005np-2w
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:47:00 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:36760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZndK-0005ac-DZ; Sat, 27 Feb 2016 17:46:54 -0500
Received: by mail-wm0-x22c.google.com with SMTP id n186so2429606wmn.1;
	Sat, 27 Feb 2016 14:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=w4XrBJFN/lTcvrYc+Gidzy6lFH9EVCZD0JOxvFYg5J0=;
	b=P4YvMGA2fZPILGxV//ZeC7DC2l2WVCIJ63DzuWv3YM1IMLLHpyMdUel68E7Y8y30Wn
	aZfxNbvXpxyTEOInQIrbQ8wNDf4mDQCcwxYhePqKJHgpbRagqM01Jz1RI2U0Xh0K1Qul
	YM+gOMOG0RD3fzdKx2mm7HsiOUlnGxXPD4/wczgUcYJd5gDQVpm+nKrrzpIIR8Nd34qL
	8MqD5pwww/HZqMHWgVKNsLi3aGbAiHKsl7G4DCzTcUShKhLAnpm10HGYZwTzNZdk2hza
	I0kWLoNwJMH5DGir+cTckoL2UvaDx8A0b4jOnZoGq8IHPy2whDKlo5ivlNdHFxlrU97g
	YuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=w4XrBJFN/lTcvrYc+Gidzy6lFH9EVCZD0JOxvFYg5J0=;
	b=mEIQE4LwHExWMEUJt0P1P6wKKgZRnHL79/ySG1aax6DkRN9din7PTICwLoYNFD38qP
	vKRy2JKo8bp0K24NOfeOr3gFgHKnpYNpxeWMEN9HUAzL8A5vcj9+ebLNdTHgkiAdPUUB
	cg+7TIekbtulnt/F5Qf6ZysawrLmBNRy6H1XaPNSzJovpDF3JNk8aKTE+3KAA+MkurJ4
	dwtjKfxqXXadlNjwVYgvuQxanAJJfv8s/IaWDvjoIYXP/pf1/+8IZlrBjHMbXuJGguBP
	XC4vC+DxT6pqfCkq8zdeDfWjWGh07KkJ3q0OD2sPH5A5Uo8Xrl6g8Y0S0Qy9LecqR16K
	pJBQ==
X-Gm-Message-State: AD7BkJLN1Vtf+7iVCejYrEHO8gyQR4BG4ZFCPRBE4Px01+3pmO6PTvMjX6Jm99TYnRNOWUsqcRVDQ3VDRVywCg==
MIME-Version: 1.0
X-Received: by 10.28.184.137 with SMTP id i131mr4133267wmf.96.1456613201598;
	Sat, 27 Feb 2016 14:46:41 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 14:46:41 -0800 (PST)
In-Reply-To: <CAFEAcA-CQZNV8OvHL22TzQFoR9n1yeadYnmjvhad5UbxNctJUQ@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<06401b2d276819d87a81058279e1d05d4e9ec7b7.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-CQZNV8OvHL22TzQFoR9n1yeadYnmjvhad5UbxNctJUQ@mail.gmail.com>
Date: Sat, 27 Feb 2016 14:46:41 -0800
Message-ID: <CAPokK=pbB_YVYQOp2GjaNGFz5XDuRzAfEBxOVoTirTnmratqfg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 15/17] loader: add API to load elf header
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
X-TUID: VDc/YLZ27zqM

On Tue, Jan 19, 2016 at 9:50 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> Add an API to load an elf header header from a file. Populates a
>> buffer with the header contents, as well as a boolean for whether the
>> elf is 64b or not. Both arguments are optional.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>>
>>  hw/core/loader.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/loader.h |  1 +
>>  2 files changed, 49 insertions(+)
>>
>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index 6b69852..28da8e2 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -331,6 +331,54 @@ const char *load_elf_strerror(int error)
>>      }
>>  }
>>
>> +void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
>> +{
>> +    int fd;
>> +    uint8_t e_ident[EI_NIDENT];
>> +    size_t hdr_size, off = 0;
>> +    bool is64l;
>> +
>> +    fd = open(filename, O_RDONLY | O_BINARY);
>> +    if (fd < 0) {
>> +        error_setg_errno(errp, errno, "Fail to open file");
>
> "Failed" (also below).
>

Fixed (x2).

> I don't think we end up with the filename anywhere in the
> error message; it would be helpful if we could include it.
>

Fixed (x4)

>> +        return;
>> +    }
>> +    if (read(fd, e_ident, sizeof(e_ident)) != sizeof(e_ident)) {
>> +        error_setg_errno(errp, errno, "Fail to read file");
>> +        goto fail;
>> +    }
>> +    if (e_ident[0] != ELFMAG0 ||
>> +        e_ident[1] != ELFMAG1 ||
>> +        e_ident[2] != ELFMAG2 ||
>> +        e_ident[3] != ELFMAG3) {
>> +        error_setg(errp, "Bad ELF magic");
>> +        goto fail;
>> +    }
>> +
>> +    is64l = e_ident[EI_CLASS] == ELFCLASS64;
>> +    hdr_size = is64l ? sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr);
>> +    if (is64) {
>> +        *is64 = is64l;
>> +    }
>> +
>> +    lseek(fd, 0, SEEK_SET);
>
> You're not checking this lseek for failure (and you don't
> need it anyway, because you could just copy the magic bytes
> into *hdr and read four fewer bytes).
>

OK, so I have optimised it away. What I am doing now is always reading
to straight to hdr[], and if the caller passes hdr == NULL, then hdr
is set to a local buffer (and the full header read is still skipped as
per current logic).

>> +    while (hdr && off < hdr_size) {
>> +        size_t br = read(fd, hdr + off, hdr_size - off);
>> +        switch (br) {
>> +        case 0:
>> +            error_setg(errp, "File too short");
>> +            goto fail;
>> +        case -1:
>> +            error_setg_errno(errp, errno, "Failed to read file");
>> +            goto fail;
>> +        }
>> +        off += br;
>> +    }
>> +
>> +fail:
>> +    close(fd);
>> +}
>> +
>>  /* return < 0 if error, otherwise the number of bytes loaded in memory */
>>  int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>> index f7b43ab..33067f8 100644
>> --- a/include/hw/loader.h
>> +++ b/include/hw/loader.h
>> @@ -36,6 +36,7 @@ int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
>>               void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
>>               uint64_t *highaddr, int big_endian, int elf_machine,
>>               int clear_lsb);
>> +void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>
> Doc comment, please.
>

Added:

+
+/** load_elf_hdr:
+ * @filename: Path of ELF file
+ * @hdr: Buffer to populate with header data. Header data will not be
+ * filled if set to NULL.
+ * @is64: Set to true if the ELF is 64bit. Ignored if set to NULL
+ * @errp: Populated with an error in failure cases
+ *
+ * Inspect as ELF file's header. Read its full header contents into a
+ * buffer and/or determine if the ELF is 64bit.
+ */


Regards,
Peter

>>  int load_aout(const char *filename, hwaddr addr, int max_sz,
>>                int bswap_needed, hwaddr target_page_size);
>>  int load_uimage(const char *filename, hwaddr *ep,
>> --
>> 1.9.1
>
> thanks
> -- PMM
