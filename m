Received: by 10.25.205.13 with SMTP id d13csp10880580lfg;
        Sat, 7 Jan 2017 12:45:28 -0800 (PST)
X-Received: by 10.237.37.209 with SMTP id y17mr8969055qtc.136.1483821928137;
        Sat, 07 Jan 2017 12:45:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 73si1781043qkl.61.2017.01.07.12.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Jan 2017 12:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPxrh-0001sM-Hn
	for alex.bennee@linaro.org; Sat, 07 Jan 2017 15:45:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPxrd-0001s5-Sj
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 15:45:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPxrY-0003RW-Uw
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 15:45:21 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cPxrY-0003Qa-Kd; Sat, 07 Jan 2017 15:45:16 -0500
Received: by mail-lf0-x242.google.com with SMTP id v186so2485874lfa.2;
	Sat, 07 Jan 2017 12:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=VUTAYVlEOKGh+zvdB6iQMoGp7uZqVqBV9mnhYXzaeJM=;
	b=OSMCrLi4I06RUhj0ERsJ1HLLcZksbjDPw4AP8pEcNZQs4Cv7fdGIhNMwlPs5QCZ5Da
	VCRTppb+buaGbNrLzDSg89O7gDlQBl+M2vZ8uFkbBT5NCnwsbE6Ib5qBTXZsKe4Z/hFB
	DbGulYsF948EiLRg8zQJ9kKU82krfUX8yj29x1vv+KZc+YHI5dNmbqQYXaTJaYyT2WNA
	dN6CozQWaca9tQfV6BkkzXud1xa0HLAEv8F6Z1fJo5nQSWTgFE8KrKeGHpTyri/N8kF0
	z+k5nR7x/GjE3pJFPYTEEEL3m7X6QcZwPw0leQw3LZRk2x3yiA3cC88GmlnIOEGUj2Eu
	7wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VUTAYVlEOKGh+zvdB6iQMoGp7uZqVqBV9mnhYXzaeJM=;
	b=CtOvylXypl/fFRoBZTAlHyTXaeTMMhQG8z09INg7JyIuq9/mcK8EkiE8dI3AlIwnLv
	uL9VQpYMBdWgAlP0Oo7CLIArJ8ac9xckD62Ej5s27Yp7ZdNEsarDNeASwsGw62zgMEaT
	8wQBoi+DOv5+l3Rr+yzTE+uRnNex4+EqwtGyK8YCcDSvlYJJGSGdM+95xtRaMjgEBNqQ
	naDPw7iD5xv6O3YBvQDBBBVWYzBnsXDOjFB96HM8NQ4tqeALnT/XZaeRJP+aJAx/3MT0
	NlZIUrgNCKLWCCp1tS+XfBKX+cD0isxc9SAAC5qsAGRRO9/FLi4oIs/wcw7O3zX6IoeT
	IGzQ==
X-Gm-Message-State: AIkVDXJ8Cs3GHXguHgbFAKnXWtv1aOSqfDpMRdkFUsKNOs5KzdNzy6SdWGm7PBcwF6ZYSg==
X-Received: by 10.25.157.5 with SMTP id g5mr23000833lfe.112.1483821912593;
	Sat, 07 Jan 2017 12:45:12 -0800 (PST)
Received: from [192.168.75.106] (89-78-94-50.dynamic.chello.pl. [89.78.94.50])
	by smtp.gmail.com with ESMTPSA id
	s63sm20113573lja.19.2017.01.07.12.45.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 12:45:12 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
References: <20170106184948.3422-1-mar.krzeminski@gmail.com>
	<20170106184948.3422-3-mar.krzeminski@gmail.com>
	<ab63d2bc-cbfd-7d3a-ca80-efc1e99a20bd@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <8b690e14-e45d-bbdf-4b30-c666ce442d97@gmail.com>
Date: Sat, 7 Jan 2017 21:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <ab63d2bc-cbfd-7d3a-ca80-efc1e99a20bd@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v2 2/3] block: m25p80: Introduce die erase
 command
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJudWmikHzRd



W dniu 07.01.2017 o 20:57, Cédric Le Goater pisze:
> On 01/06/2017 07:49 PM, Marcin Krzeminski wrote:
>> Modern big flash nor devices consist from more than one die.
>> Some of them do not support chip erase and instead have die
>> erase command that can erase one die only. This commit adds
>> possibility to define number of dies in the chip and adds
>> support for die erase command. Nor flash model is not strict
>> thus option to disable chip eras was not added.
>>
>> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
>> ---
>>   hw/block/m25p80.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 6dff81b..b065ddc 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
>>       uint32_t n_sectors;
>>       uint32_t page_size;
>>       uint16_t flags;
>> +    /*
>> +     * Big sized spi nor are often stacked devices, thus sometime
>> +     * replace chip erase with die erase.
>> +     * This field inform how many die is in the chip.
>> +     */
>> +    uint8_t die_cnt;
>>   } FlashPartInfo;
>>   
>>   /* adapted from linux */
>> @@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
>>       .sector_size = (_sector_size),\
>>       .n_sectors = (_n_sectors),\
>>       .page_size = 256,\
>> -    .flags = (_flags),
>> +    .flags = (_flags),\
>> +    .die_cnt = 0
>>   
>>   #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors, _flags)\
>>       .part_name = _part_name,\
>> @@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
>>       .n_sectors = (_n_sectors),\
>>       .page_size = 256,\
>>       .flags = (_flags),\
>> +    .die_cnt = 0
>> +
>> +#define INFO_STACKED(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors,\
>> +                    _flags, _die_cnt)\
>> +    .part_name = _part_name,\
>> +    .id = {\
>> +        ((_jedec_id) >> 16) & 0xff,\
>> +        ((_jedec_id) >> 8) & 0xff,\
>> +        (_jedec_id) & 0xff,\
>> +        ((_ext_id) >> 8) & 0xff,\
>> +        (_ext_id) & 0xff,\
>> +          },\
>> +    .id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),\
>> +    .sector_size = (_sector_size),\
>> +    .n_sectors = (_n_sectors),\
>> +    .page_size = 256,\
>> +    .flags = (_flags),\
>> +    .die_cnt = _die_cnt
>>   
>>   #define JEDEC_NUMONYX 0x20
>>   #define JEDEC_WINBOND 0xEF
>> @@ -359,6 +384,8 @@ typedef enum {
>>   
>>       REVCR = 0x65,
>>       WEVCR = 0x61,
>> +
>> +    DIE_ERASE = 0xC4,
>>   } FlashCMD;
>>   
>>   typedef enum {
>> @@ -514,6 +541,17 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>>       case BULK_ERASE:
>>           len = s->size;
>>           break;
>> +    case DIE_ERASE:
>> +        if (s->pi->die_cnt) {
>> +            len = s->size / s->pi->die_cnt;
>> +            offset = offset & (~(len - 1));
>> +            printf("Die erase len = 0x%X offset = 0x%X!\n", len, offset);
> do we need this printf ?
Ups, testing leftover. I will delete this in next version.
Thanks!
>
> Thanks,
>
> C.
>
>   
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
>> +                          " by device\n");
>> +            return;
>> +        }
>> +        break;
>>       default:
>>           abort();
>>       }
>> @@ -635,6 +673,7 @@ static void complete_collecting_data(Flash *s)
>>       case ERASE4_32K:
>>       case ERASE_SECTOR:
>>       case ERASE4_SECTOR:
>> +    case DIE_ERASE:
>>           flash_erase(s, s->cur_addr, s->cmd_in_progress);
>>           break;
>>       case WRSR:
>> @@ -881,6 +920,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>       case PP:
>>       case PP4:
>>       case PP4_4:
>> +    case DIE_ERASE:
>>           s->needed_bytes = get_addr_length(s);
>>           s->pos = 0;
>>           s->len = 0;
>>
>

