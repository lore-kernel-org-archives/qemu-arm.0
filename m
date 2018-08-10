Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2650184wru;
        Thu, 9 Aug 2018 22:01:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzbDm8t/WU7Ugo2OqeRrMM5zGtOas91CNZB75hj+l8C/oXRCr2qHzUH3bB9NpR/PQQ77y4h
X-Received: by 2002:a37:d197:: with SMTP id o23-v6mr4511571qkl.210.1533877266739;
        Thu, 09 Aug 2018 22:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533877266; cv=none;
        d=google.com; s=arc-20160816;
        b=NryL1iPLICFbOf+o+GyKjDY/9ECDUJAmFk/uTQYlwb3wXazOWKadvaMKWFCWTgjQVY
         nXLUMOE15zsp7NichHCV0kPRlIr7gDJYEJ5CjDALN49bI/un6npEfl7BhWGGkJFYteYo
         Hryf7Ed3vyaXMeNfWAAhWRfLbGxRbpbECncORM82dKDPu07L9AHl6pXujKSGOmN00MIA
         x+TiJet6TpyJje0RNCmluM/WeMyTTVOy2C2HG1vO23sPd5DzbVO5thaLm14lcTB4aq9J
         6EkfrQK38DjgFShaCCHsUafygIllKHzuCQ4Mo4KdxEcK/yxJtW/eRyMky0hxQUqhWVpZ
         WhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:to:autocrypt:openpgp:from:references
         :dkim-signature:arc-authentication-results;
        bh=gOs/mGZ/sOpTq9NQlqx2raPYgp6BDLoXNqKnpoSnFaY=;
        b=DU5JJC3XlkqumK4LU95PGRnqp7YbPB2QbmBrACCGcPThqltQpXXVv4qn7mikNBvahi
         LfVvxIdZYMeOkQjEuegWw4qumx5gcIzQKPXJ88d3zCLKTysr+D6FnbyVFuvkm/Vg3lDO
         LSXjymaYC8OSl4grjKrfRnUltQgAEkCiaj9vb0JT48g7CMb2MTassr8o98Hj22ANrUSD
         4XFHQNLHGghbEx/nxi/jJkCFWQR683qkSLq6A2Cb/24ZMtEY+tmYGC95C0T1N+sYauj0
         2nQeE7RnwINQs5uu/CpeP+x2F7NnZQ4taWPlA/gIGqJzyt+GlsDflVkoIbGqPN//s7a3
         6eXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mSBlj6nY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72-v6si2197398qka.308.2018.08.09.22.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 22:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mSBlj6nY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnzXt-0002Mf-Vg
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 01:01:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzXl-0002MC-RQ
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzXg-0007qz-Uv
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 01:00:57 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:34058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnzXg-0007qV-Lz; Fri, 10 Aug 2018 01:00:52 -0400
Received: by mail-ua1-x942.google.com with SMTP id r15-v6so636050uao.1;
	Thu, 09 Aug 2018 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:cc:references:from:openpgp:autocrypt:to:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gOs/mGZ/sOpTq9NQlqx2raPYgp6BDLoXNqKnpoSnFaY=;
	b=mSBlj6nY90wfl0mJ41RzqyJO0/hFMSqXpwAtoiu82ULiwU2VRyOy2dkgUr8wVXtS8a
	SAQXQ1jJkiJiL3ix12GYYiyhAT1xlCOfJJZyVXebmk+9KbDVo8Jwahh4NzaMq5jxix/4
	QNP2k/IvZ+i04L5zyw4nIqlPLFm9ULQVQIKsdHVfyCAUVa9UZsUw2AIl3G+IbRHQxhhb
	/ByXGhoKhhn2+hlut1GJJ6/5yOma5rev5EnFwR7VLVU1DO8HsgQSwPyqp+iHWKX4kJNI
	foPGJ6YlHGp/CWGNehyC0S4Ix/b/VGqaSF0kJ9Bm6Texn479eYutM3PBpNddZUj4pFZ+
	K/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:cc:references:from:openpgp
	:autocrypt:to:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gOs/mGZ/sOpTq9NQlqx2raPYgp6BDLoXNqKnpoSnFaY=;
	b=rg4J6OAkj+7m2DbyEQohUoZLYDisoT8n6R60upQptY9+P67M6Gbe4cz4yxfxKiHuCh
	0hpIxv0+gqZQWoSczWiATW7YPyzoSnqIxCatEsSkXNralE6gQBe9B4WkAt4Qj8ApaXTu
	6fD/do+BS/bNYwXKSPbid/AHmK+coIbJKQn0KwRXxdkt8awQTwWypTq7Fe5ZWy+ZnUtg
	05Wmb/+pLisKcPed0Xt0hRJYpqVWOCxKMKFxThOZboRspIQvQ4ZyFkX+855U4MpyBSWQ
	ql3x8PHhh8L7xXp5Zsm8i5b56b+dcUm+NBS+/reiFJbnNyDlQQjbJsbyN2P/RQs/WEFa
	Pu1w==
X-Gm-Message-State: AOUpUlH2D3c1bnRIogRwP9W9cEb1TjuUD2yJaUDTu3GTxE+iWQqoEaYH
	30Eexo1jB8TWLMMEInmB8U8=
X-Received: by 2002:a9f:2633:: with SMTP id
	48-v6mr3307346uag.182.1533877251643; 
	Thu, 09 Aug 2018 22:00:51 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm2667772vkc.4.2018.08.09.22.00.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 22:00:50 -0700 (PDT)
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
To: Su Hang <suhang16@mails.ucas.ac.cn>
Message-ID: <1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
Date: Fri, 10 Aug 2018 02:00:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803144721.17036-6-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::942
Subject: Re: [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: skHl1nafvrzp

Hi Su,

On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
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
>  hw/core/loader.c         | 243 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 259 insertions(+)
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
> index 612420b870..072bf8b434 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1321,3 +1321,246 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict)
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
> +    value = idx & 0x1 ? value & 0xf : value << 4;

This construction is slightly easier to read as:

       value = (idx & 0x1) ? (value & 0xf) : (value << 4);

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
> +            (parser->next_address_to_write & 0xffff0000) | line->address;

Can you add a #define for this 0xffff0000? Maybe NEXT_ADDR_MASK 0xffff
and use ~NEXT_ADDR_MASK.

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
> +        parser->next_address_to_write =
> +            line->record_type == EXT_SEG_ADDR_RECORD
> +                ? ((line->data[0] << 12) | (line->data[1] << 4))
> +                : ((line->data[0] << 24) | (line->data[1] << 16));

Hard to read IMHO, what about this?

           parser->next_address_to_write = (line->data[0] << 12)
                                         | (line->data[1] << 4);
           if (line->record_type != EXT_SEG_ADDR_RECORD) {
               parser->next_address_to_write <<= 12;
           }

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
> +        *(parser->start_addr) = (((line->data[0] << 8) | line->data[1]) << 4) |
> +                                (line->data[2] << 8) | line->data[3];

Can you add a qtest for this case?
For the HEX loader I understand the specs as this is the same parsing as
the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
data[1] shifts.
This is different for the consumer (i386 expects 2 16-bit registers but
HexParser->start_addr is a hwaddr, used as a single (at least) 32-bit
register.

> +        break;
> +
> +    case START_LINEAR_ADDR_RECORD:
> +        if (line->byte_count != 4 && line->address != 0) {
> +            return -1;
> +        }
> +
> +        *(parser->start_addr) = (line->data[0] << 24) | (line->data[1] << 16) |
> +                                (line->data[2] << 8)  | (line->data[3]);

You can use this helper:

           *(parser->start_addr) = ldl_be_p(line->data);

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
> 

Regards,

Phil.
