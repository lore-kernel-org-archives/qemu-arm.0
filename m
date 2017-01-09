Received: by 10.25.205.13 with SMTP id d13csp11450840lfg;
        Mon, 9 Jan 2017 03:44:57 -0800 (PST)
X-Received: by 10.55.3.3 with SMTP id 3mr83172328qkd.236.1483962297033;
        Mon, 09 Jan 2017 03:44:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si56080842qtc.272.2017.01.09.03.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 03:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQYNi-0008Fe-AF
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 06:44:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQYNe-0008E4-1N
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 06:44:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQYNc-0000yq-TZ
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 06:44:50 -0500
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:33635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cQYNa-0000wv-0r; Mon, 09 Jan 2017 06:44:46 -0500
Received: by mail-vk0-x242.google.com with SMTP id j12so3518231vkd.0;
	Mon, 09 Jan 2017 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lNbiWP4leoZirRRjJoYBUvzEUZKrYL5s8vFuiENka1k=;
	b=jNbT4kKlpanTbiTJzcq0l7/xTa58nvVu/TC1Airlo4hsWRePjDw4HjEzXROGZ4eAnW
	H/RtIWW8kv/x5YjegTxWaW4J53sPsEnAVUcuO8tk8NhNbp9O4lLye2F5wOD4pj55H/La
	XveHjL7ts8fZx79MpdRXUrwzGJ6VR0NcCAfSk0BpN803zFU43Dru+I3D8jh7bBKA/m4L
	JOefxRZbZv5oxx9yQ+g2IHN70WnkJ6hoyx4Z7azaMd7V+VMeCMOPh8whbnJC9wOPNKoo
	a1NTbIjTsnoKWCusc2XlUHRR4eIPtduoy47qaOXDD/jKInoriBP8xjc2JWLgD3bQyf2T
	WOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lNbiWP4leoZirRRjJoYBUvzEUZKrYL5s8vFuiENka1k=;
	b=j/eMwiMfjSqbt4XPiXRj3mX2coWye3cIzTGQYhqtrjulX1D5CaqRcunweeoleZeoHS
	Ol8fMzoYRhicQW+0p2y21S/+Z7VAJmIL/c1zvYafoFX/qDUJb/k6Mbdx+p+xSU8/dzJ0
	BGSIfsRmVdIvALIjy0AhMdD2IsZMQmtcLPxS1y9+dq8MF6YwgZHqtBIfoIWr1FEo//t5
	EBGFjr3/Sph9zNwm/Hg8lkUrF98V3rY38c2le6NYr/Ups2DgcqdJGf+XuhECBdeoD7Qo
	dPKfFv8JqyWz1fZEdloAA+SdqMntRS7RF28BAmROixK7VfEqofjSogKT7fiUP07cnXsp
	fElA==
X-Gm-Message-State: AIkVDXLtHpPtMVzF1CTEuWINlhvzzbM515n7YWkgdGXVPmmD9E3hvIvv8tSDa/8b1n51RyDhfIiKol/hBOmtAQ==
X-Received: by 10.31.230.134 with SMTP id d128mr6542451vkh.118.1483962283818; 
	Mon, 09 Jan 2017 03:44:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.4.205 with HTTP; Mon, 9 Jan 2017 03:44:43 -0800 (PST)
In-Reply-To: <20170109111004.GH14990@toto>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
	<20170108083854.5006-3-mar.krzeminski@gmail.com>
	<20170109111004.GH14990@toto>
From: =?UTF-8?Q?Marcin_Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Date: Mon, 9 Jan 2017 12:44:43 +0100
Message-ID: <CABc_YGBqDSO+fysXjnUBdeLBJsNC2pO6sNpf3L_juPfjfCXUeQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-arm] [PATCH v3 2/3] block: m25p80: Introduce die erase
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zTQYTPJlk1af

2017-01-09 12:10 GMT+01:00 Edgar E. Iglesias <edgar.iglesias@xilinx.com>:
> On Sun, Jan 08, 2017 at 09:38:53AM +0100, Marcin Krzeminski wrote:
>> Modern big flash nor devices consist from more than one die.
>> Some of them do not support chip erase and instead have die
>> erase command that can erase one die only. This commit adds
>> possibility to define number of dies in the chip and adds
>> support for die erase command. Nor flash model is not strict
>> thus option to disable chip eras was not added.
>                                  ^^
>                               erase
>
> The commit message could be improved but codewise this looks
> good to me:

Beside fixing the typo, some more information/changes should I add?

Thanks,
Marcin
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>
>
>>
>> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
>> ---
>>  hw/block/m25p80.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 6dff81b..a9b025b 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
>>      uint32_t n_sectors;
>>      uint32_t page_size;
>>      uint16_t flags;
>> +    /*
>> +     * Big sized spi nor are often stacked devices, thus sometime
>> +     * replace chip erase with die erase.
>> +     * This field inform how many die is in the chip.
>> +     */
>> +    uint8_t die_cnt;
>>  } FlashPartInfo;
>>
>>  /* adapted from linux */
>> @@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
>>      .sector_size = (_sector_size),\
>>      .n_sectors = (_n_sectors),\
>>      .page_size = 256,\
>> -    .flags = (_flags),
>> +    .flags = (_flags),\
>> +    .die_cnt = 0
>>
>>  #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors, _flags)\
>>      .part_name = _part_name,\
>> @@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
>>      .n_sectors = (_n_sectors),\
>>      .page_size = 256,\
>>      .flags = (_flags),\
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
>>  #define JEDEC_NUMONYX 0x20
>>  #define JEDEC_WINBOND 0xEF
>> @@ -359,6 +384,8 @@ typedef enum {
>>
>>      REVCR = 0x65,
>>      WEVCR = 0x61,
>> +
>> +    DIE_ERASE = 0xC4,
>>  } FlashCMD;
>>
>>  typedef enum {
>> @@ -514,6 +541,16 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>>      case BULK_ERASE:
>>          len = s->size;
>>          break;
>> +    case DIE_ERASE:
>> +        if (s->pi->die_cnt) {
>> +            len = s->size / s->pi->die_cnt;
>> +            offset = offset & (~(len - 1));
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
>> +                          " by device\n");
>> +            return;
>> +        }
>> +        break;
>>      default:
>>          abort();
>>      }
>> @@ -635,6 +672,7 @@ static void complete_collecting_data(Flash *s)
>>      case ERASE4_32K:
>>      case ERASE_SECTOR:
>>      case ERASE4_SECTOR:
>> +    case DIE_ERASE:
>>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>>          break;
>>      case WRSR:
>> @@ -881,6 +919,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>      case PP:
>>      case PP4:
>>      case PP4_4:
>> +    case DIE_ERASE:
>>          s->needed_bytes = get_addr_length(s);
>>          s->pos = 0;
>>          s->len = 0;
>> --
>> 2.9.3
>>
