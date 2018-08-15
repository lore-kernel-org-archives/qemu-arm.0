Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1205510wru;
        Wed, 15 Aug 2018 16:02:42 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz3Y2MlfYzxtnYm14TAFIpYV+Jlim4UgBt4dJYE5NpLlIktpkYDZ2H/FkPeAizqsSGaqitE
X-Received: by 2002:a0c:a8cc:: with SMTP id h12-v6mr24673912qvc.161.1534374162735;
        Wed, 15 Aug 2018 16:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534374162; cv=none;
        d=google.com; s=arc-20160816;
        b=Lr9SKrqcLTlKjmiWkDIopgJWcKeMXuZ5vpANqO7kwpHfPGG0Jv3NR/lIWsyytqrDPx
         +m5Y9OsZLriOWnh7PT0XPH8oujRdGYZGJuUtyoJ5amSWg6pr4Rpi6QJVWaFXWnvcPFNt
         VbyTZJdR8zXx89wj3ORGZTndS1rrO4xJEeq+sf9/y4Feod4qV/0ZOcCcmHqEvOEAMH7L
         HgCFC0yRD5McaYUAJ8WqZBy8YnJuB7ydrspTCqiZxKweBdXaTO0WjJ5+TJm657Ln2U83
         MnpIrT24T+ehKIxtCynWyZpRe5aj0pvZMSPasryUI5sE6DBO7AUpNScCo24gX50oIm/w
         vfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KMzvEJ3ebpV5GpgRvDMPUNtahEhd+JVV0mNgJWfdGKk=;
        b=KgzCa9DWqcaOa8AaOkHPOfOvFa87CR7tBZ2GKUBn3a2hZcAcGSeEr9Bk9otwLwoLmM
         MzSo2GEhekHoxDrI6tp5q8fraWUMRrDJv6qVNEvTzlQ0ZFfeNCWq/vU9t805pq0GZRz0
         37aUILBlJRVRvLOpnYrv1lpQwHoOeEAXN8fGO3i3qp1mo1dgy19xcvSKZeWizyQRNVfL
         hiRTW1AJpDrQq57erPHkx4+CPyFVEdBibQ3m89sfazF1280YfVZ8epURQ+BCDS0Gcj1A
         FaU7tVseKgBv1GjmAFJyA0aatroSX/lvYdv9diaJR5rNJQ5R8lH7Oo1TSIAmdqLbrJk9
         GJzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QL7tUz8t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11-v6si3975895qtp.174.2018.08.15.16.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 16:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QL7tUz8t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fq4oM-0005fE-Ad
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 19:02:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fq4o8-0005es-7M
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 19:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fq4o5-00012k-Ak
	for qemu-devel@nongnu.org; Wed, 15 Aug 2018 19:02:27 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:43946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fq4o4-0000zz-GH; Wed, 15 Aug 2018 19:02:25 -0400
Received: by mail-lf1-x141.google.com with SMTP id f135-v6so2008754lfg.10;
	Wed, 15 Aug 2018 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KMzvEJ3ebpV5GpgRvDMPUNtahEhd+JVV0mNgJWfdGKk=;
	b=QL7tUz8t9q74yKdIeIOIvu5IvGRUj79FFDKjr1QTwnkguk6O33rSXmN7FcBAjI4iLp
	+CoZDkysT2gX5SR154B7KFPxqvOCDk9Sygt+2BudFZjHAvJ6VTycD9H/4d0Pg2gQEwJr
	jka6iSPpzeQnWiuWiH7Jl0sveMYe3O33Xh7phv/T0FJBUuwSmTg/wBwA50YdZFLHKrXC
	3yycAMC5QmJT8gqGWCn7BZ1LI8+b0uYNcV+NPbZdCJOw0kwXICihyW2fOpJvToGOD4tS
	s5ocNikDoP+p0hd6X0joMQHCyChBHWC0m/xPPqwzC51U9mDN3eyTyApsQn0nXeXPprJB
	qXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KMzvEJ3ebpV5GpgRvDMPUNtahEhd+JVV0mNgJWfdGKk=;
	b=VbkAcYIZnoutkVCCLrrWP3LX93xx0nC8HLWSpdZMw83uN0k80SUYtTneq7mdJTbjSl
	SsUmLUdxs107FVu7Xq5SQRYYsHrjWmQm/IVL32B2tMCXPBViWhuqk1Lafi24gub4awBG
	T4+eAjRtaJwWpgNHkMCEamV+oa05iLqXi/shxhXZZdLvnPPZfj9eCfyBvMHZEpB76aZU
	kc4BH8LHr4hkfjDl7UHJzmoCP4P8zSJJWTpmebbR63eSlb1WZri6FA0YrufeTmejQ69H
	BJt+WwXOUoYq5SiqreGyU+xjaB7l4uTzHpGfGCn71HlSIXijCbyH3WDZwgrfvQi88mSH
	CPRA==
X-Gm-Message-State: AOUpUlEGi8KcLFkyKjrsUssTFMeLyVZHvNkIKw83ULe3PJ7JFoAv5dP6
	LbaGfohvvijyFBsyn0U4uQK+ew7L5LbpZ8phOPk=
X-Received: by 2002:a19:7d84:: with SMTP id
	y126-v6mr18605857lfc.94.1534374139069; 
	Wed, 15 Aug 2018 16:02:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e14:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 16:01:48
	-0700 (PDT)
In-Reply-To: <20180814162739.11814-6-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
	<20180814162739.11814-6-stefanha@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Aug 2018 16:01:48 -0700
Message-ID: <CAKmqyKNV574_BhNMY2uEEUhuuv+Tp+Jid8fwaEJGNRzGq6Y4dw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v6 5/6] loader: Implement .hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j9Qy5QsSQFM8

On Tue, Aug 14, 2018 at 9:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> From: Su Hang <suhang16@mails.ucas.ac.cn>
>
> This patch adds Intel Hexadecimal Object File format support to the
> generic loader device.  The file format specification is available here:
> http://www.piclist.com/techref/fileext/hex/intel.htm
>
> This file format is often used with microcontrollers such as the
> micro:bit, Arduino, STM32, etc.  Users expect to be able to run .hex
> files directly with without first converting them to ELF.  Most
> micro:bit code is developed in web-based IDEs without direct user access
> to binutils so it is important for QEMU to handle this file format
> natively.
>
> Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/loader.h      |  12 ++
>  hw/core/generic-loader.c |   4 +
>  hw/core/loader.c         | 249 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 265 insertions(+)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 5235f119a3..3c112975f4 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -28,6 +28,18 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size);
>  int load_image_targphys_as(const char *filename,
>                             hwaddr addr, uint64_t max_sz, AddressSpace *as);
>
> +/**load_targphys_hex_as:
> + * @filename: Path to the .hex file
> + * @entry: Store the entry point given by the .hex file
> + * @as: The AddressSpace to load the .hex file to. The value of
> + *      address_space_memory is used if nothing is supplied here.
> + *
> + * Load a fixed .hex file into memory.
> + *
> + * Returns the size of the loaded .hex file on success, -1 otherwise.
> + */
> +int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
> +
>  /** load_image_targphys:
>   * Same as load_image_targphys_as(), but doesn't allow the caller to specify
>   * an AddressSpace.
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index cb0e68486d..fde32cbda1 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -147,6 +147,10 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>                  size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
>                                        as);
>              }
> +
> +            if (size < 0) {
> +                size = load_targphys_hex_as(s->file, &entry, as);
> +            }
>          }
>
>          if (size < 0 || s->force_raw) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 612420b870..390987a05c 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1321,3 +1321,252 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict)
>          }
>      }
>  }
> +
> +typedef enum HexRecord HexRecord;
> +enum HexRecord {
> +    DATA_RECORD = 0,
> +    EOF_RECORD,
> +    EXT_SEG_ADDR_RECORD,
> +    START_SEG_ADDR_RECORD,
> +    EXT_LINEAR_ADDR_RECORD,
> +    START_LINEAR_ADDR_RECORD,
> +};
> +
> +/* Each record contains a 16-bit address which is combined with the upper 16
> + * bits of the implicit "next address" to form a 32-bit address.
> + */
> +#define NEXT_ADDR_MASK 0xffff0000
> +
> +#define DATA_FIELD_MAX_LEN 0xff
> +#define LEN_EXCEPT_DATA 0x5
> +/* 0x5 = sizeof(byte_count) + sizeof(address) + sizeof(record_type) +
> + *       sizeof(checksum) */
> +typedef struct {
> +    uint8_t byte_count;
> +    uint16_t address;
> +    uint8_t record_type;
> +    uint8_t data[DATA_FIELD_MAX_LEN];
> +    uint8_t checksum;
> +} HexLine;
> +
> +/* return 0 or -1 if error */
> +static bool parse_record(HexLine *line, uint8_t *our_checksum, const uint8_t c,
> +                         uint32_t *index, const bool in_process)
> +{
> +    /* +-------+---------------+-------+---------------------+--------+
> +     * | byte  |               |record |                     |        |
> +     * | count |    address    | type  |        data         |checksum|
> +     * +-------+---------------+-------+---------------------+--------+
> +     * ^       ^               ^       ^                     ^        ^
> +     * |1 byte |    2 bytes    |1 byte |     0-255 bytes     | 1 byte |

I think it would be clearer if this followed the language used in the
documentation. Otherwise I don't see anything wrong here.

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +     */
> +    uint8_t value = 0;
> +    uint32_t idx = *index;
> +    /* ignore space */
> +    if (g_ascii_isspace(c)) {
> +        return true;
> +    }
> +    if (!g_ascii_isxdigit(c) || !in_process) {
> +        return false;
> +    }
> +    value = g_ascii_xdigit_value(c);
> +    value = (idx & 0x1) ? (value & 0xf) : (value << 4);
> +    if (idx < 2) {
> +        line->byte_count |= value;
> +    } else if (2 <= idx && idx < 6) {
> +        line->address <<= 4;
> +        line->address += g_ascii_xdigit_value(c);
> +    } else if (6 <= idx && idx < 8) {
> +        line->record_type |= value;
> +    } else if (8 <= idx && idx < 8 + 2 * line->byte_count) {
> +        line->data[(idx - 8) >> 1] |= value;
> +    } else if (8 + 2 * line->byte_count <= idx &&
> +               idx < 10 + 2 * line->byte_count) {
> +        line->checksum |= value;
> +    } else {
> +        return false;
> +    }
> +    *our_checksum += value;
> +    ++(*index);
> +    return true;
> +}
> +
> +typedef struct {
> +    const char *filename;
> +    HexLine line;
> +    uint8_t *bin_buf;
> +    hwaddr *start_addr;
> +    int total_size;
> +    uint32_t next_address_to_write;
> +    uint32_t current_address;
> +    uint32_t current_rom_index;
> +    uint32_t rom_start_address;
> +    AddressSpace *as;
> +} HexParser;
> +
> +/* return size or -1 if error */
> +static int handle_record_type(HexParser *parser)
> +{
> +    HexLine *line = &(parser->line);
> +    switch (line->record_type) {
> +    case DATA_RECORD:
> +        parser->current_address =
> +            (parser->next_address_to_write & NEXT_ADDR_MASK) | line->address;
> +        /* verify this is a contiguous block of memory */
> +        if (parser->current_address != parser->next_address_to_write) {
> +            if (parser->current_rom_index != 0) {
> +                rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
> +                                      parser->current_rom_index,
> +                                      parser->rom_start_address, parser->as);
> +            }
> +            parser->rom_start_address = parser->current_address;
> +            parser->current_rom_index = 0;
> +        }
> +
> +        /* copy from line buffer to output bin_buf */
> +        memcpy(parser->bin_buf + parser->current_rom_index, line->data,
> +               line->byte_count);
> +        parser->current_rom_index += line->byte_count;
> +        parser->total_size += line->byte_count;
> +        /* save next address to write */
> +        parser->next_address_to_write =
> +            parser->current_address + line->byte_count;
> +        break;
> +
> +    case EOF_RECORD:
> +        if (parser->current_rom_index != 0) {
> +            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
> +                                  parser->current_rom_index,
> +                                  parser->rom_start_address, parser->as);
> +        }
> +        return parser->total_size;
> +    case EXT_SEG_ADDR_RECORD:
> +    case EXT_LINEAR_ADDR_RECORD:
> +        if (line->byte_count != 2 && line->address != 0) {
> +            return -1;
> +        }
> +
> +        if (parser->current_rom_index != 0) {
> +            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
> +                                  parser->current_rom_index,
> +                                  parser->rom_start_address, parser->as);
> +        }
> +
> +        /* save next address to write,
> +         * in case of non-contiguous block of memory */
> +        parser->next_address_to_write = (line->data[0] << 12) |
> +                                        (line->data[1] << 4);
> +        if (line->record_type == EXT_LINEAR_ADDR_RECORD) {
> +            parser->next_address_to_write <<= 12;
> +        }
> +
> +        parser->rom_start_address = parser->next_address_to_write;
> +        parser->current_rom_index = 0;
> +        break;
> +
> +    case START_SEG_ADDR_RECORD:
> +        if (line->byte_count != 4 && line->address != 0) {
> +            return -1;
> +        }
> +
> +        /* x86 16-bit CS:IP segmented addressing */
> +        *(parser->start_addr) = (((line->data[0] << 8) | line->data[1]) << 4) +
> +                                ((line->data[2] << 8) | line->data[3]);
> +        break;
> +
> +    case START_LINEAR_ADDR_RECORD:
> +        if (line->byte_count != 4 && line->address != 0) {
> +            return -1;
> +        }
> +
> +        *(parser->start_addr) = ldl_be_p(line->data);
> +        break;
> +
> +    default:
> +        return -1;
> +    }
> +
> +    return parser->total_size;
> +}
> +
> +/* return size or -1 if error */
> +static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
> +                          size_t hex_blob_size, AddressSpace *as)
> +{
> +    bool in_process = false; /* avoid re-enter and
> +                              * check whether record begin with ':' */
> +    uint8_t *end = hex_blob + hex_blob_size;
> +    uint8_t our_checksum = 0;
> +    uint32_t record_index = 0;
> +    HexParser parser = {
> +        .filename = filename,
> +        .bin_buf = g_malloc(hex_blob_size),
> +        .start_addr = addr,
> +        .as = as,
> +    };
> +
> +    rom_transaction_begin();
> +
> +    for (; hex_blob < end; ++hex_blob) {
> +        switch (*hex_blob) {
> +        case '\r':
> +        case '\n':
> +            if (!in_process) {
> +                break;
> +            }
> +
> +            in_process = false;
> +            if ((LEN_EXCEPT_DATA + parser.line.byte_count) * 2 !=
> +                    record_index ||
> +                our_checksum != 0) {
> +                parser.total_size = -1;
> +                goto out;
> +            }
> +
> +            if (handle_record_type(&parser) == -1) {
> +                parser.total_size = -1;
> +                goto out;
> +            }
> +            break;
> +
> +        /* start of a new record. */
> +        case ':':
> +            memset(&parser.line, 0, sizeof(HexLine));
> +            in_process = true;
> +            record_index = 0;
> +            break;
> +
> +        /* decoding lines */
> +        default:
> +            if (!parse_record(&parser.line, &our_checksum, *hex_blob,
> +                              &record_index, in_process)) {
> +                parser.total_size = -1;
> +                goto out;
> +            }
> +            break;
> +        }
> +    }
> +
> +out:
> +    g_free(parser.bin_buf);
> +    rom_transaction_end(parser.total_size != -1);
> +    return parser.total_size;
> +}
> +
> +/* return size or -1 if error */
> +int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
> +{
> +    gsize hex_blob_size;
> +    gchar *hex_blob;
> +    int total_size = 0;
> +
> +    if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
> +        return -1;
> +    }
> +
> +    total_size = parse_hex_blob(filename, entry, (uint8_t *)hex_blob,
> +                                hex_blob_size, as);
> +
> +    g_free(hex_blob);
> +    return total_size;
> +}
> --
> 2.17.1
>
>
