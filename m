Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3035099wru;
        Fri, 10 Aug 2018 05:52:14 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz+2P/Dh+MIhXIATuHIJYmjsB2IVNpnJJMHa2GuDy3lSifjqB/ewmv33arAxF5pnNx7SEdo
X-Received: by 2002:ac8:1c5c:: with SMTP id j28-v6mr6163202qtk.365.1533905534897;
        Fri, 10 Aug 2018 05:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533905534; cv=none;
        d=google.com; s=arc-20160816;
        b=RVyVFWz/dtHIcP8GZESt+gJtuy5xghkEL7LIdEMtVWT3qCyYaQmPzLJ34KwzAgDFKW
         ejh1V9K+9IDTKsS9bP78B42iG2TAocBr/PbMKgpDgxP99z23tdqT3FPwSrxlzHjhjM7x
         GyIPEVtJZbmTlrm6tcpyhxpeq69AhB+12iZ3w8WUCb2s5ZhSOSEyM7fCobhoEN2nJCHK
         W4OZ+ixnLktXf4nXgFIkU7gxSHcHfxr47ciDBhVU1NWs0ho1o4Sg2OxRjieanK1LnUt3
         JAG/mukQo0gkk+2XwLrxQfI7Vn+45S5TrQQvpVZGi/nMV9TPuN6uYHMU4XLcE22Cn7lG
         OWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:arc-authentication-results;
        bh=vFyTBrqxTKM9kM3qmXnRL3ScMGX/BAa4KWo6axNAQEw=;
        b=SvrMcNGp6wYAzo0022fcM1F+bXZBs8P6W3d9fEA4Oj/9pDGDFI6rfCPKKf2x2tV69y
         8wzhgYExuRa2CS9Eb9H/hNmRX9yA41ldq4sMYg2Q8aHJbLLEYRU5jrvfbZxpbXAG9ZE8
         xOdRTFUdXT3Jeukc8bnSCsTMAVNV6n49TBbfY7D+HLL0c2+hMZhusatsMzgIdyco7IpE
         fsa/NM+cXWiWgzNG97Jl7GCRilTwal8k22S8gC6ZN9WoOQckkI4ZTlgu5PMBBDovWlSs
         Crk6B44iyIbQaUX7CYBfCeYpy+Y5oj+dkAh/NKvO/W3LXWOnF4Uh0qmSwe/OK5RxhEEH
         H87w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=G9YUW3uN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2-v6si737777qvb.251.2018.08.10.05.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Aug 2018 05:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=G9YUW3uN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fo6tq-0006Ag-DJ
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 08:52:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darcysail@gmail.com>) id 1fo4c1-00039u-4L
	for qemu-devel@nongnu.org; Fri, 10 Aug 2018 06:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darcysail@gmail.com>) id 1fo4bx-0000hx-Nk
	for qemu-devel@nongnu.org; Fri, 10 Aug 2018 06:25:41 -0400
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:39382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <darcysail@gmail.com>)
	id 1fo4bw-0000h3-To; Fri, 10 Aug 2018 06:25:37 -0400
Received: by mail-it0-x241.google.com with SMTP id g141-v6so1971817ita.4;
	Fri, 10 Aug 2018 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3du3wOGy0Bpq+z0na9NSC48ImeUre3ff9k22QTjV6aA=;
	b=G9YUW3uN+LhRSHNCKzv4Fa/41Iai2kvulmyV6jBdSJQvoX4Z1Evp/PJa4CK0YvTSQA
	LP1ld70cAXihcSEhem9Ol6ORVoQfmbkRWz3jrAvpwH1J47GRhlwpB1UcFzsmLbKH2WCE
	ldkcojS3bmCEAt9qok8wU/u+CiSS+T2pxLrdkyR9IIir04ST9ypGpVxm8/vniIVRf3fR
	xVI1rSM+qJnLl1swfdRYvzJyNIfN1+D5mBXqwg164M5oq70PagXoiJAJB2b6J8J+jBxu
	hwap0ny51BJ6VTpkFoj6pSVJO4UnYEVi4rjGtsxhRH4LTxfOAActYNPemb+z0XHHmWrb
	1/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3du3wOGy0Bpq+z0na9NSC48ImeUre3ff9k22QTjV6aA=;
	b=JgloeuhER+pbErKp0/DYeI0LhQAfIbjxnKaOQDA+vxne9+9a+XSE06tT3eyrSYA6X5
	IcKHpfsAy2QhLLvtI+qMH5nMzm/L6p3LMCpE9yOxyn/jU/BIKTu9Jc0iS+acMu5TafLO
	qSMG9AGR/R7lGKIdiK42swqh/RwAD5iiJKMEgQOupQmlmIpi7yMUdELPJIny1bdVW6Fs
	AoARrGukyCyMBkO3YmJsQenx19oJIVXZpdkxzMzG+nuW+6xaeidhsMMiHN2DGBmmRrAJ
	GXNyzMZKcZ6htaU3D2Z3QaqEsO/WuKS+SFFGgdZBKqPsSihA+VarPuX1Rax6Piij5eUo
	cmBQ==
X-Gm-Message-State: AOUpUlHEgkx9K7gjzd2kHUHIotArhySa3ysQLuWXhSuFQ8dwOtxXGH2m
	p4SbdYe6+Z71S83FV/36nG/ZUNPZ5j/CdkC2liA=
X-Received: by 2002:a24:6b0e:: with SMTP id
	v14-v6mr1649463itc.90.1533896735684; 
	Fri, 10 Aug 2018 03:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
	<1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
In-Reply-To: <1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
From: sail darcy <darcysail@gmail.com>
Date: Fri, 10 Aug 2018 18:25:24 +0800
Message-ID: <CACX88mDOU1GYsapwm5BHf6HmUP8=TnOVrG8XUU+C=f-cYwa2Sg@mail.gmail.com>
To: f4bug@amsat.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
X-Mailman-Approved-At: Fri, 10 Aug 2018 08:47:06 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex
 file loader
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jim@groklearning.com, mail@steffen-goertz.de,
	ilg@livius.net, alistair@alistair23.me, qemu-devel@nongnu.org,
	sundeep.lkml@gmail.com, qemu.ml@steffen-goertz.de,
	suhang16@mails.ucas.ac.cn, joel@jms.id.au, stefanha@redhat.com,
	jusual@mail.ru, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4CIqVnFLohN9

Thanks for your suggestion, I will review your comments carefully and take
modification in the next patch.

Best,
SU Hang

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E4=BA=8E2018=E5=B9=B48=E6=9C=
=8810=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=883:19=E5=86=99=E9=81=93=
=EF=BC=9A

> Hi Su,
>
> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> > From: Su Hang <suhang16@mails.ucas.ac.cn>
> >
> > This patch adds Intel Hexadecimal Object File format support to the
> > generic loader device.  The file format specification is available here=
:
> > http://www.piclist.com/techref/fileext/hex/intel.htm
> >
> > This file format is often used with microcontrollers such as the
> > micro:bit, Arduino, STM32, etc.  Users expect to be able to run .hex
> > files directly with without first converting them to ELF.  Most
> > micro:bit code is developed in web-based IDEs without direct user acces=
s
> > to binutils so it is important for QEMU to handle this file format
> > natively.
> >
> > Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/hw/loader.h      |  12 ++
> >  hw/core/generic-loader.c |   4 +
> >  hw/core/loader.c         | 243 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 259 insertions(+)
> >
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 5235f119a3..3c112975f4 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -28,6 +28,18 @@ ssize_t load_image_size(const char *filename, void
> *addr, size_t size);
> >  int load_image_targphys_as(const char *filename,
> >                             hwaddr addr, uint64_t max_sz, AddressSpace
> *as);
> >
> > +/**load_targphys_hex_as:
> > + * @filename: Path to the .hex file
> > + * @entry: Store the entry point given by the .hex file
> > + * @as: The AddressSpace to load the .hex file to. The value of
> > + *      address_space_memory is used if nothing is supplied here.
> > + *
> > + * Load a fixed .hex file into memory.
> > + *
> > + * Returns the size of the loaded .hex file on success, -1 otherwise.
> > + */
> > +int load_targphys_hex_as(const char *filename, hwaddr *entry,
> AddressSpace *as);
> > +
> >  /** load_image_targphys:
> >   * Same as load_image_targphys_as(), but doesn't allow the caller to
> specify
> >   * an AddressSpace.
> > diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> > index cb0e68486d..fde32cbda1 100644
> > --- a/hw/core/generic-loader.c
> > +++ b/hw/core/generic-loader.c
> > @@ -147,6 +147,10 @@ static void generic_loader_realize(DeviceState
> *dev, Error **errp)
> >                  size =3D load_uimage_as(s->file, &entry, NULL, NULL,
> NULL, NULL,
> >                                        as);
> >              }
> > +
> > +            if (size < 0) {
> > +                size =3D load_targphys_hex_as(s->file, &entry, as);
> > +            }
> >          }
> >
> >          if (size < 0 || s->force_raw) {
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index 612420b870..072bf8b434 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -1321,3 +1321,246 @@ void hmp_info_roms(Monitor *mon, const QDict
> *qdict)
> >          }
> >      }
> >  }
> > +
> > +typedef enum HexRecord HexRecord;
> > +enum HexRecord {
> > +    DATA_RECORD =3D 0,
> > +    EOF_RECORD,
> > +    EXT_SEG_ADDR_RECORD,
> > +    START_SEG_ADDR_RECORD,
> > +    EXT_LINEAR_ADDR_RECORD,
> > +    START_LINEAR_ADDR_RECORD,
> > +};
> > +
> > +#define DATA_FIELD_MAX_LEN 0xff
> > +#define LEN_EXCEPT_DATA 0x5
> > +/* 0x5 =3D sizeof(byte_count) + sizeof(address) + sizeof(record_type) =
+
> > + *       sizeof(checksum) */
> > +typedef struct {
> > +    uint8_t byte_count;
> > +    uint16_t address;
> > +    uint8_t record_type;
> > +    uint8_t data[DATA_FIELD_MAX_LEN];
> > +    uint8_t checksum;
> > +} HexLine;
> > +
> > +/* return 0 or -1 if error */
> > +static bool parse_record(HexLine *line, uint8_t *our_checksum, const
> uint8_t c,
> > +                         uint32_t *index, const bool in_process)
> > +{
> > +    /* +-------+---------------+-------+---------------------+--------=
+
> > +     * | byte  |               |record |                     |        =
|
> > +     * | count |    address    | type  |        data         |checksum=
|
> > +     * +-------+---------------+-------+---------------------+--------=
+
> > +     * ^       ^               ^       ^                     ^        =
^
> > +     * |1 byte |    2 bytes    |1 byte |     0-255 bytes     | 1 byte =
|
> > +     */
> > +    uint8_t value =3D 0;
> > +    uint32_t idx =3D *index;
> > +    /* ignore space */
> > +    if (g_ascii_isspace(c)) {
> > +        return true;
> > +    }
> > +    if (!g_ascii_isxdigit(c) || !in_process) {
> > +        return false;
> > +    }
> > +    value =3D g_ascii_xdigit_value(c);
> > +    value =3D idx & 0x1 ? value & 0xf : value << 4;
>
> This construction is slightly easier to read as:
>
>        value =3D (idx & 0x1) ? (value & 0xf) : (value << 4);
>
> > +    if (idx < 2) {
> > +        line->byte_count |=3D value;
> > +    } else if (2 <=3D idx && idx < 6) {
> > +        line->address <<=3D 4;
> > +        line->address +=3D g_ascii_xdigit_value(c);
> > +    } else if (6 <=3D idx && idx < 8) {
> > +        line->record_type |=3D value;
> > +    } else if (8 <=3D idx && idx < 8 + 2 * line->byte_count) {
> > +        line->data[(idx - 8) >> 1] |=3D value;
> > +    } else if (8 + 2 * line->byte_count <=3D idx &&
> > +               idx < 10 + 2 * line->byte_count) {
> > +        line->checksum |=3D value;
> > +    } else {
> > +        return false;
> > +    }
> > +    *our_checksum +=3D value;
> > +    ++(*index);
> > +    return true;
> > +}
> > +
> > +typedef struct {
> > +    const char *filename;
> > +    HexLine line;
> > +    uint8_t *bin_buf;
> > +    hwaddr *start_addr;
> > +    int total_size;
> > +    uint32_t next_address_to_write;
> > +    uint32_t current_address;
> > +    uint32_t current_rom_index;
> > +    uint32_t rom_start_address;
> > +    AddressSpace *as;
> > +} HexParser;
> > +
> > +/* return size or -1 if error */
> > +static int handle_record_type(HexParser *parser)
> > +{
> > +    HexLine *line =3D &(parser->line);
> > +    switch (line->record_type) {
> > +    case DATA_RECORD:
> > +        parser->current_address =3D
> > +            (parser->next_address_to_write & 0xffff0000) |
> line->address;
>
> Can you add a #define for this 0xffff0000? Maybe NEXT_ADDR_MASK 0xffff
> and use ~NEXT_ADDR_MASK.
>
> > +        /* verify this is a contiguous block of memory */
> > +        if (parser->current_address !=3D parser->next_address_to_write=
) {
> > +            if (parser->current_rom_index !=3D 0) {
> > +                rom_add_blob_fixed_as(parser->filename, parser->bin_bu=
f,
> > +                                      parser->current_rom_index,
> > +                                      parser->rom_start_address,
> parser->as);
> > +            }
> > +            parser->rom_start_address =3D parser->current_address;
> > +            parser->current_rom_index =3D 0;
> > +        }
> > +
> > +        /* copy from line buffer to output bin_buf */
> > +        memcpy(parser->bin_buf + parser->current_rom_index, line->data=
,
> > +               line->byte_count);
> > +        parser->current_rom_index +=3D line->byte_count;
> > +        parser->total_size +=3D line->byte_count;
> > +        /* save next address to write */
> > +        parser->next_address_to_write =3D
> > +            parser->current_address + line->byte_count;
> > +        break;
> > +
> > +    case EOF_RECORD:
> > +        if (parser->current_rom_index !=3D 0) {
> > +            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
> > +                                  parser->current_rom_index,
> > +                                  parser->rom_start_address,
> parser->as);
> > +        }
> > +        return parser->total_size;
> > +    case EXT_SEG_ADDR_RECORD:
> > +    case EXT_LINEAR_ADDR_RECORD:
> > +        if (line->byte_count !=3D 2 && line->address !=3D 0) {
> > +            return -1;
> > +        }
> > +
> > +        if (parser->current_rom_index !=3D 0) {
> > +            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
> > +                                  parser->current_rom_index,
> > +                                  parser->rom_start_address,
> parser->as);
> > +        }
> > +
> > +        /* save next address to write,
> > +         * in case of non-contiguous block of memory */
> > +        parser->next_address_to_write =3D
> > +            line->record_type =3D=3D EXT_SEG_ADDR_RECORD
> > +                ? ((line->data[0] << 12) | (line->data[1] << 4))
> > +                : ((line->data[0] << 24) | (line->data[1] << 16));
>
> Hard to read IMHO, what about this?
>
>            parser->next_address_to_write =3D (line->data[0] << 12)
>                                          | (line->data[1] << 4);
>            if (line->record_type !=3D EXT_SEG_ADDR_RECORD) {
>                parser->next_address_to_write <<=3D 12;
>            }
>
> > +        parser->rom_start_address =3D parser->next_address_to_write;
> > +        parser->current_rom_index =3D 0;
> > +        break;
> > +
> > +    case START_SEG_ADDR_RECORD:
> > +        if (line->byte_count !=3D 4 && line->address !=3D 0) {
> > +            return -1;
> > +        }
> > +
> > +        /* x86 16-bit CS:IP segmented addressing */
> > +        *(parser->start_addr) =3D (((line->data[0] << 8) | line->data[=
1])
> << 4) |
> > +                                (line->data[2] << 8) | line->data[3];
>
> Can you add a qtest for this case?
> For the HEX loader I understand the specs as this is the same parsing as
> the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
> data[1] shifts.
> This is different for the consumer (i386 expects 2 16-bit registers but
> HexParser->start_addr is a hwaddr, used as a single (at least) 32-bit
> register.
>
> > +        break;
> > +
> > +    case START_LINEAR_ADDR_RECORD:
> > +        if (line->byte_count !=3D 4 && line->address !=3D 0) {
> > +            return -1;
> > +        }
> > +
> > +        *(parser->start_addr) =3D (line->data[0] << 24) | (line->data[=
1]
> << 16) |
> > +                                (line->data[2] << 8)  | (line->data[3]=
);
>
> You can use this helper:
>
>            *(parser->start_addr) =3D ldl_be_p(line->data);
>
> > +        break;
> > +
> > +    default:
> > +        return -1;
> > +    }
> > +
> > +    return parser->total_size;
> > +}
> > +
> > +/* return size or -1 if error */
> > +static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t
> *hex_blob,
> > +                          size_t hex_blob_size, AddressSpace *as)
> > +{
> > +    bool in_process =3D false; /* avoid re-enter and
> > +                              * check whether record begin with ':' */
> > +    uint8_t *end =3D hex_blob + hex_blob_size;
> > +    uint8_t our_checksum =3D 0;
> > +    uint32_t record_index =3D 0;
> > +    HexParser parser =3D {
> > +        .filename =3D filename,
> > +        .bin_buf =3D g_malloc(hex_blob_size),
> > +        .start_addr =3D addr,
> > +        .as =3D as,
> > +    };
> > +
> > +    rom_transaction_begin();
> > +
> > +    for (; hex_blob < end; ++hex_blob) {
> > +        switch (*hex_blob) {
> > +        case '\r':
> > +        case '\n':
> > +            if (!in_process) {
> > +                break;
> > +            }
> > +
> > +            in_process =3D false;
> > +            if ((LEN_EXCEPT_DATA + parser.line.byte_count) * 2 !=3D
> > +                    record_index ||
> > +                our_checksum !=3D 0) {
> > +                parser.total_size =3D -1;
> > +                goto out;
> > +            }
> > +
> > +            if (handle_record_type(&parser) =3D=3D -1) {
> > +                parser.total_size =3D -1;
> > +                goto out;
> > +            }
> > +            break;
> > +
> > +        /* start of a new record. */
> > +        case ':':
> > +            memset(&parser.line, 0, sizeof(HexLine));
> > +            in_process =3D true;
> > +            record_index =3D 0;
> > +            break;
> > +
> > +        /* decoding lines */
> > +        default:
> > +            if (!parse_record(&parser.line, &our_checksum, *hex_blob,
> > +                              &record_index, in_process)) {
> > +                parser.total_size =3D -1;
> > +                goto out;
> > +            }
> > +            break;
> > +        }
> > +    }
> > +
> > +out:
> > +    g_free(parser.bin_buf);
> > +    rom_transaction_end(parser.total_size !=3D -1);
> > +    return parser.total_size;
> > +}
> > +
> > +/* return size or -1 if error */
> > +int load_targphys_hex_as(const char *filename, hwaddr *entry,
> AddressSpace *as)
> > +{
> > +    gsize hex_blob_size;
> > +    gchar *hex_blob;
> > +    int total_size =3D 0;
> > +
> > +    if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size,
> NULL)) {
> > +        return -1;
> > +    }
> > +
> > +    total_size =3D parse_hex_blob(filename, entry, (uint8_t *)hex_blob=
,
> > +                                hex_blob_size, as);
> > +
> > +    g_free(hex_blob);
> > +    return total_size;
> > +}
> >
>
> Regards,
>
> Phil.
>
>
