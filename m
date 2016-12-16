Received: by 10.103.86.15 with SMTP id k15csp1436724vsb;
        Fri, 16 Dec 2016 08:36:12 -0800 (PST)
X-Received: by 10.237.36.90 with SMTP id s26mr3462043qtc.114.1481906172598;
        Fri, 16 Dec 2016 08:36:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 94si3560749qtb.140.2016.12.16.08.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 08:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHvUQ-0001qE-5A
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 11:36:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cHvUH-0001i5-GI
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:36:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cHvUC-0003fI-Ng
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 11:36:01 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35106)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cHvU1-0003bE-Bt; Fri, 16 Dec 2016 11:35:45 -0500
Received: by mail-lf0-x244.google.com with SMTP id p100so1622381lfg.2;
	Fri, 16 Dec 2016 08:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9OU9KTEuP1rMMopqcJ2FqxhpIet1yOPnPBp3CCsdLrA=;
	b=N2xUbKCk14zjIP77zyz4drSHqwbcXMeJZC3Vm//kPQ69aUV4doox2Do4VgFrNH9QmQ
	ZgqB+U6xeSypsHvnwGhdwKE7sbR8XOopomVHYBrZhLDQTaGW0Ps1kMl38WFXHw7sec4l
	LJjGA7z36YiBL25uTKxLU9vdc2FAMOKzMjQeznj9SFZ5zfOxI5V5IhQwRfBg79PQ68rS
	qs/wQxTP/PneIonHD/S9nTfNIVL6cnTMsrO+g4SJUAZvNn6N6BlW6paERn6pXV3vPGwq
	RchEUXSfcQElILZciTWrar9fSbQ/Ty7BjIBh9rTao3QfXD0ijTcQpkPPpSp9VvJoSTSt
	z5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9OU9KTEuP1rMMopqcJ2FqxhpIet1yOPnPBp3CCsdLrA=;
	b=ICHbtam+CLvTrudZVi8Z0c8Gg+WHkWm3R6vY/l+DBDHN1KJ49WEdqh44LBDuyYGJbg
	Jg0J/h68MTpXOboG2uupE9Sd5Yvl3OZsfq4/z6vyrTMj76zVLqn9OT2PzjdGtCiSk3uR
	pQ/9b0ihQXT9X/k/83motSHzx87b3GLFKY8waUpGwDqZUeS7MdsCO4vE+BC0JJx+iBMy
	qGRy6vRQOUHaehckHpx4EUB6elytxrV2eDlsXBCGaYNjBGLAeJt2DOIbZVQw1O++4yIE
	PK4zYo/s6NfHhSyjkgAXopvcwOl6Yr+sU+Kw/3ZJgpHpT6Mm6pCOydJ70ww/eOgTtLV3
	RKXA==
X-Gm-Message-State: AIkVDXIuhU4MSXO6yn01LMmVmCZMQehpFmeOVQeC1MFHYH7bCv1NdLMJAwWaXszWj7Z5zQ==
X-Received: by 10.46.13.26 with SMTP id 26mr1418305ljn.53.1481906143700;
	Fri, 16 Dec 2016 08:35:43 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id z1sm1485412lja.27.2016.12.16.08.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 08:35:42 -0800 (PST)
Date: Fri, 16 Dec 2016 17:35:42 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: marcin.krzeminski@nokia.com
Message-ID: <20161216163542.GQ9606@toto>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894862-14102-3-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481894862-14102-3-git-send-email-marcin.krzeminski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e81UoSgSjBER

On Fri, Dec 16, 2016 at 02:27:42PM +0100, marcin.krzeminski@nokia.com wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> 
> Big flash chips (like mt25qu01g) are consisted from dies.
> Because of that some manufactures remove support for Chip
> Erase giving Die Erase command instead.To avoid unnecessary
> code complication, support for chip erase for mt25qu01g
> is not removed.
> 
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>  hw/block/m25p80.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 2bc7028..0bc1fbf 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -216,8 +216,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> -    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
> -    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
> +    { INFO("mt25ql01g",   0x20ba21, 0x1040,  64 << 10, 2048, ER_4K) },
> +    { INFO("mt25qu01g",   0x20bb21, 0x1040,  64 << 10, 2048, ER_4K) },
>  
>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
> @@ -358,6 +358,8 @@ typedef enum {
>  
>      REVCR = 0x65,
>      WEVCR = 0x61,
> +
> +    DIE_ERASE = 0xC4,
>  } FlashCMD;
>  
>  typedef enum {
> @@ -411,6 +413,7 @@ typedef struct Flash {
>      bool reset_enable;
>      bool quad_enable;
>      uint8_t ear;
> +    uint32_t die_cnt;
>  
>      int64_t dirty_page;
>  
> @@ -492,7 +495,7 @@ static inline void flash_sync_area(Flash *s, int64_t off, int64_t len)
>  
>  static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>  {
> -    uint32_t len;
> +    uint32_t len = 0;

Do you really need this?

>      uint8_t capa_to_assert = 0;
>  
>      switch (cmd) {
> @@ -513,6 +516,16 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
>      case BULK_ERASE:
>          len = s->size;
>          break;
> +    case DIE_ERASE:
> +        if (s->die_cnt) {
> +            len = s->size / s->die_cnt;
> +            offset = offset & (~(len-1));
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d die erase not supported by"
> +                          " device\n", len);
> +            return;
> +        }
> +        break;
>      default:
>          abort();
>      }
> @@ -634,6 +647,7 @@ static void complete_collecting_data(Flash *s)
>      case ERASE4_32K:
>      case ERASE_SECTOR:
>      case ERASE4_SECTOR:
> +    case DIE_ERASE:
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> @@ -684,6 +698,7 @@ static void reset_memory(Flash *s)
>      s->write_enable = false;
>      s->reset_enable = false;
>      s->quad_enable = false;
> +    s->die_cnt = 0;
>  
>      switch (get_man(s)) {
>      case MAN_NUMONYX:
> @@ -716,7 +731,15 @@ static void reset_memory(Flash *s)
>              s->four_bytes_address_mode = true;
>          }
>          if (!(s->nonvolatile_cfg & NVCFG_LOWER_SEGMENT_MASK)) {
> -            s->ear = s->size / MAX_3BYTES_SIZE - 1;
> +            s->ear = ( s->size > MAX_3BYTES_SIZE ? s->size / MAX_3BYTES_SIZE - 1 : 0);
> +        }
> +        /* 1GiB devices */
> +        if (s->pi->id[2] == 0x21) {
> +            /* MT25Q00 has 2 dies N25Q00 has 4 */
> +            if (s->pi->id[4] & BIT(6))
> +                s->die_cnt = 2;
> +            else
> +                s->die_cnt = 4;

Decoding of die_cnt should probably be done in realize().

>          }
>          break;
>      case MAN_MACRONIX:
> @@ -880,6 +903,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case PP:
>      case PP4:
>      case PP4_4:
> +    case DIE_ERASE:
>          s->needed_bytes = get_addr_length(s);
>          s->pos = 0;
>          s->len = 0;
> @@ -1217,6 +1241,7 @@ static const VMStateDescription vmstate_m25p80 = {
>          VMSTATE_UINT8(spansion_cr2nv, Flash),
>          VMSTATE_UINT8(spansion_cr3nv, Flash),
>          VMSTATE_UINT8(spansion_cr4nv, Flash),
> +        VMSTATE_UINT32(die_cnt, Flash),

die_cnt is fixed per instance. Since it doesn't change, it doesn't need to be part of VMSTATE.

>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.7.4
> 
> 
