Received: by 10.25.205.13 with SMTP id d13csp10868913lfg;
        Sat, 7 Jan 2017 11:57:23 -0800 (PST)
X-Received: by 10.237.34.167 with SMTP id p36mr74677902qtc.286.1483819043166;
        Sat, 07 Jan 2017 11:57:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22si1819250qta.238.2017.01.07.11.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Jan 2017 11:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPx7A-0007u0-Pl
	for alex.bennee@linaro.org; Sat, 07 Jan 2017 14:57:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cPx77-0007tr-41
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 14:57:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cPx72-0004K2-7j
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 14:57:17 -0500
Received: from 10.mo53.mail-out.ovh.net ([87.98.189.210]:56818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cPx72-0004IK-1v
	for qemu-arm@nongnu.org; Sat, 07 Jan 2017 14:57:12 -0500
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 510B16606
	for <qemu-arm@nongnu.org>; Sat,  7 Jan 2017 20:57:08 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 10C5862006D;
	Sat,  7 Jan 2017 20:57:01 +0100 (CET)
To: Marcin Krzeminski <mar.krzeminski@gmail.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
References: <20170106184948.3422-1-mar.krzeminski@gmail.com>
	<20170106184948.3422-3-mar.krzeminski@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ab63d2bc-cbfd-7d3a-ca80-efc1e99a20bd@kaod.org>
Date: Sat, 7 Jan 2017 20:57:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170106184948.3422-3-mar.krzeminski@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5193494798958103472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrvddvgddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.189.210
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
X-TUID: zjbJtzqKiphE

On 01/06/2017 07:49 PM, Marcin Krzeminski wrote:
> Modern big flash nor devices consist from more than one die.
> Some of them do not support chip erase and instead have die
> erase command that can erase one die only. This commit adds
> possibility to define number of dies in the chip and adds
> support for die erase command. Nor flash model is not strict
> thus option to disable chip eras was not added.
> 
> Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
> ---
>  hw/block/m25p80.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 6dff81b..b065ddc 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
>      uint32_t n_sectors;
>      uint32_t page_size;
>      uint16_t flags;
> +    /*
> +     * Big sized spi nor are often stacked devices, thus sometime
> +     * replace chip erase with die erase.
> +     * This field inform how many die is in the chip.
> +     */
> +    uint8_t die_cnt;
>  } FlashPartInfo;
>  
>  /* adapted from linux */
> @@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
>      .sector_size = (_sector_size),\
>      .n_sectors = (_n_sectors),\
>      .page_size = 256,\
> -    .flags = (_flags),
> +    .flags = (_flags),\
> +    .die_cnt = 0
>  
>  #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors, _flags)\
>      .part_name = _part_name,\
> @@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
>      .n_sectors = (_n_sectors),\
>      .page_size = 256,\
>      .flags = (_flags),\
> +    .die_cnt = 0
> +
> +#define INFO_STACKED(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors,\
> +                    _flags, _die_cnt)\
> +    .part_name = _part_name,\
> +    .id = {\
> +        ((_jedec_id) >> 16) & 0xff,\
> +        ((_jedec_id) >> 8) & 0xff,\
> +        (_jedec_id) & 0xff,\
> +        ((_ext_id) >> 8) & 0xff,\
> +        (_ext_id) & 0xff,\
> +          },\
> +    .id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),\
> +    .sector_size = (_sector_size),\
> +    .n_sectors = (_n_sectors),\
> +    .page_size = 256,\
> +    .flags = (_flags),\
> +    .die_cnt = _die_cnt
>  
>  #define JEDEC_NUMONYX 0x20
>  #define JEDEC_WINBOND 0xEF
> @@ -359,6 +384,8 @@ typedef enum {
>  
>      REVCR = 0x65,
>      WEVCR = 0x61,
> +
> +    DIE_ERASE = 0xC4,
>  } FlashCMD;
>  
>  typedef enum {
> @@ -514,6 +541,17 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>      case BULK_ERASE:
>          len = s->size;
>          break;
> +    case DIE_ERASE:
> +        if (s->pi->die_cnt) {
> +            len = s->size / s->pi->die_cnt;
> +            offset = offset & (~(len - 1));
> +            printf("Die erase len = 0x%X offset = 0x%X!\n", len, offset);

do we need this printf ? 

Thanks,

C. 

 
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
> +                          " by device\n");
> +            return;
> +        }
> +        break;
>      default:
>          abort();
>      }
> @@ -635,6 +673,7 @@ static void complete_collecting_data(Flash *s)
>      case ERASE4_32K:
>      case ERASE_SECTOR:
>      case ERASE4_SECTOR:
> +    case DIE_ERASE:
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> @@ -881,6 +920,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case PP:
>      case PP4:
>      case PP4_4:
> +    case DIE_ERASE:
>          s->needed_bytes = get_addr_length(s);
>          s->pos = 0;
>          s->len = 0;
> 

