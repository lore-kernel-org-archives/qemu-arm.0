Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3135742lfg;
        Wed, 26 Feb 2020 06:21:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxpRWMp7VDq5kW1CBRDTZjxJVCdBXMmROKBaKdlguCtLyKyAQSOxdc8lLolYMXuyfdig80
X-Received: by 2002:a37:5285:: with SMTP id g127mr5966339qkb.315.1582726891131;
        Wed, 26 Feb 2020 06:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582726891; cv=none;
        d=google.com; s=arc-20160816;
        b=at/gM8qxrWL1xJjWYImQ8mRE0XR0KZtBnEkYDLeLCJXwnZgoRFPPl6Vv+FL2iNN5Qj
         ij5+7JcKkDax7OV2R7ZanZJG664Be14NqMIDkut5H7nbXixO0W+LnyM6WRz0k1+Y3FiS
         b+Qkjb14wp2eyZ5V+IwJOG4p4aYvnYl2ZFzrOOrlwFDGYRhJajjnxUL+4slmMY2tvouM
         T+hf8lPfLyPCW7wseZipDJnsuRGXm6iVSURu2q5j7sIafIVh1E7OiLSpxq1H2RYvSMBn
         2Si8lvHMfY2Kyc1416T2d2/VqdzlczoAOOxnw627UR+eklO0ZW8Zn96KGZQt7j3rhkhq
         023A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MSHbGqgS3B/wr2StKJrKN9dNOj5Ox0ESJKQAivfGhes=;
        b=iq9NUixSzuXoCPkI5h3zew8ecvO/jmZ3Su//6mVPbFc4vRT5Z5085hiverxbtwk2zR
         7gq78/0UBzop70naPUpXMtfI/wDsRxXtkKa4XIDxv2l43Tcvx/yazoS0AIOUcyHcanH2
         diTnHw9aN16Bib+uz8gEifXSNf3OkMQAHPvEM8H8RB3YDFpDa2+MZYpJTxHgB2nGIEm/
         jEAmqMiVcD5LRFmQ1S53ZjrOL+MsDnArQ06PiQ/EA9TIhMHrvnivhyL65iIgTi/S3pwa
         XNd3gJTmzGt2bBPYbo4/fDVbmc8LtLBLf9C+IaUScWag+JG/tyYb09zMdzABlExeIYFg
         FhDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gOA777dc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si940584qvr.214.2020.02.26.06.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 06:21:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gOA777dc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6xZ4-00043s-IL
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 09:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6xYu-00043Z-TZ
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 09:21:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6xYq-0005cR-MP
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 09:21:20 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58831
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6xYq-0005XM-JG
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 09:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582726875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSHbGqgS3B/wr2StKJrKN9dNOj5Ox0ESJKQAivfGhes=;
 b=gOA777dc9tQfr5qMiqPA7N7tgnAfbvwQrsjwspTGkPgWwhAR87NxPXoJmp9IP0Y+kf6YDq
 yRl0Xppez+RrMjQuyquEgS0ZLTPOYuSbuYKj8EguXvtn6MTnnWDOx88lfLTpaMT3s/X52z
 3knynBn5Oq299kVLcFw+fAwG4NtOhiU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-Z0c1C9xlMSSpNq0Pynq8tQ-1; Wed, 26 Feb 2020 09:21:13 -0500
X-MC-Unique: Z0c1C9xlMSSpNq0Pynq8tQ-1
Received: by mail-wr1-f70.google.com with SMTP id y28so1520963wrd.23
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 06:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CBenu/1p0A399odB+r0l5DGS3G3AmJFUTUr0sxpL1B4=;
 b=KPR37lF+YYL9UVv44ZFsIRwwF5AvjeOL1w46WzARu5NVlci6OaVKjaNsaY00nba4jG
 i6njIneJq56nYvfPf3hfVvvjGIIDqlQtajwDUQLg0cVtV691Bv5hvHf3lkgXHzm0we4A
 S6bmj5/nTuaj8r8lkXBaWFv/Zmn2KVznWfLxnA5vCsOUM6xdGtVA7SNITVO/wHpf6Lhf
 zDRVOJVyS1wZTKemvwn63Ta9vajoCLT1ZTyi5fnry39x40BUcDtbnk9KVD7EK912LS27
 12bdJxmiX60QPDs4XPGGlisSuTGze/fm2Ja3olhnAtWWjtVepY6zhbcepmpdiit34sdr
 mjnA==
X-Gm-Message-State: APjAAAUCiBzWRIdak9kXSI6jCo5TAeUP6cVgOJDaB98yYwQaAwX9nN6o
 fm4PHB3Q7o33RT3PKQkUDqH4D38BroRR4J9HHFy5tdTTPafgS1Bq3DEje9mlwttpcKnhus9/UP5
 LdJlMkjPs8l9o
X-Received: by 2002:adf:e742:: with SMTP id c2mr5775599wrn.262.1582726872503; 
 Wed, 26 Feb 2020 06:21:12 -0800 (PST)
X-Received: by 2002:adf:e742:: with SMTP id c2mr5775577wrn.262.1582726872222; 
 Wed, 26 Feb 2020 06:21:12 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h10sm3163365wml.18.2020.02.26.06.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 06:21:11 -0800 (PST)
Subject: Re: [PATCH 1/2] aspeed/smc: Add some tracing
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200206112645.21275-1-clg@kaod.org>
 <20200206112645.21275-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee72256b-8635-41e3-daa5-17ea1b5db9cd@redhat.com>
Date: Wed, 26 Feb 2020 15:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206112645.21275-2-clg@kaod.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R+vWKCIkFH0j

On 2/6/20 12:26 PM, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   Makefile.objs       |  1 +
>   hw/ssi/aspeed_smc.c | 17 +++++++++++++++++
>   hw/ssi/trace-events |  9 +++++++++
>   3 files changed, 27 insertions(+)
>   create mode 100644 hw/ssi/trace-events
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 26b9cff95436..9e4ba95794e9 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -168,6 +168,7 @@ trace-events-subdirs +=3D hw/scsi
>   trace-events-subdirs +=3D hw/sd
>   trace-events-subdirs +=3D hw/sparc
>   trace-events-subdirs +=3D hw/sparc64
> +trace-events-subdirs +=3D hw/ssi
>   trace-events-subdirs +=3D hw/timer
>   trace-events-subdirs +=3D hw/tpm
>   trace-events-subdirs +=3D hw/usb
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 23c8d2f06245..e5621bf728ca 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -31,6 +31,7 @@
>   #include "qapi/error.h"
>   #include "exec/address-spaces.h"
>   #include "qemu/units.h"
> +#include "trace.h"
>  =20
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
> @@ -513,6 +514,8 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
>  =20
>       s->ctrl->reg_to_segment(s, new, &seg);
>  =20
> +    trace_aspeed_smc_flash_set_segment(cs, new, seg.addr, seg.addr + seg=
.size);
> +
>       /* The start address of CS0 is read-only */
>       if (cs =3D=3D 0 && seg.addr !=3D s->ctrl->flash_window_base) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> @@ -753,6 +756,8 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
>                         __func__, aspeed_smc_flash_mode(fl));
>       }
>  =20
> +    trace_aspeed_smc_flash_read(fl->id, addr, size, ret,
> +                                aspeed_smc_flash_mode(fl));
>       return ret;
>   }
>  =20
> @@ -808,6 +813,9 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  =
uint64_t data,
>       AspeedSMCState *s =3D fl->controller;
>       uint8_t addr_width =3D aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
>  =20
> +    trace_aspeed_smc_do_snoop(fl->id, s->snoop_index, s->snoop_dummies,
> +                              (uint8_t) data & 0xff);
> +
>       if (s->snoop_index =3D=3D SNOOP_OFF) {
>           return false; /* Do nothing */
>  =20
> @@ -858,6 +866,9 @@ static void aspeed_smc_flash_write(void *opaque, hwad=
dr addr, uint64_t data,
>       AspeedSMCState *s =3D fl->controller;
>       int i;
>  =20
> +    trace_aspeed_smc_flash_write(fl->id, addr, size, data,
> +                                 aspeed_smc_flash_mode(fl));
> +
>       if (!aspeed_smc_is_writable(fl)) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x=
%"
>                         HWADDR_PRIx "\n", __func__, addr);
> @@ -972,6 +983,9 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
>           (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
>           (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_sla=
ves) ||
>           (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slave=
s)) {
> +
> +        trace_aspeed_smc_read(addr, size, s->regs[addr]);
> +
>           return s->regs[addr];
>       } else {
>           qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx=
 "\n",
> @@ -1091,6 +1105,7 @@ static void aspeed_smc_dma_checksum(AspeedSMCState =
*s)
>                             __func__, s->regs[R_DMA_FLASH_ADDR]);
>               return;
>           }
> +        trace_aspeed_smc_dma_checksum(s->regs[R_DMA_FLASH_ADDR], data);
>  =20
>           /*
>            * When the DMA is on-going, the DMA registers are updated
> @@ -1225,6 +1240,8 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>  =20
>       addr >>=3D 2;
>  =20
> +    trace_aspeed_smc_write(addr, size, data);
> +
>       if (addr =3D=3D s->r_conf ||
>           (addr >=3D s->r_timings &&
>            addr < s->r_timings + s->ctrl->nregs_timings) ||
> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> new file mode 100644
> index 000000000000..ffe531a500aa
> --- /dev/null
> +++ b/hw/ssi/trace-events
> @@ -0,0 +1,9 @@
> +# aspeed_smc.c
> +
> +aspeed_smc_flash_set_segment(int cs, uint64_t reg, uint64_t start, uint6=
4_t end) "CS%d segreg=3D0x%"PRIx64" [ 0x%"PRIx64" - 0x%"PRIx64" ]"
> +aspeed_smc_flash_read(int cs, uint64_t addr,  uint32_t size, uint64_t da=
ta, int mode) "CS%d @0x%" PRIx64 " size %u: 0x%" PRIx64" mode:%d"
> +aspeed_smc_do_snoop(int cs, int index, int dummies, int data) "CS%d inde=
x:0x%x dummies:%d data:0x%x"
> +aspeed_smc_flash_write(int cs, uint64_t addr,  uint32_t size, uint64_t d=
ata, int mode) "CS%d @0x%" PRIx64 " size %u: 0x%" PRIx64" mode:%d"
> +aspeed_smc_read(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRI=
x64 " size %u: 0x%" PRIx64
> +aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%08x: 0x%08x"
> +aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PR=
Ix64 " size %u: 0x%" PRIx64
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

