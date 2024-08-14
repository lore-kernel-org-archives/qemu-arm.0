Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp641929njf;
        Wed, 14 Aug 2024 14:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4BjnUGPNHtcqqP8eUkvR9BgsTMiBRFXK53QfHzX5p/A6A9MUPEGxGzSDQGQT73gtRyH8wUHbTsPR4T2hpOFa/bJeVFuUL
X-Google-Smtp-Source: AGHT+IFaszW6thRdldHl+FOp7aRcka9O7AATk3uCBoiZZPKoZz+Fo/YDmuFIEAna5jv9mIZx5v0u
X-Received: by 2002:a05:6808:3196:b0:3d9:28d0:fcd4 with SMTP id 5614622812f47-3dd298d5a6cmr4092033b6e.5.1723671571680;
        Wed, 14 Aug 2024 14:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723671571; cv=none;
        d=google.com; s=arc-20160816;
        b=kucafZe10JmhRVMMFZ33iuIVIcTdlS7LcDruysPd3+LfmkX+mF8i/9l3BVI9+9NdLc
         di/cF9GkcqKanphYCbu4BzUv4UyCOJNax+EwKCxnhZg/40GT8eWCOILXiXbJ8o3RT+B1
         xazjM2GE+gqnhFh/8WmdgkL4pqfrrlfT4KRxqPFVPlZAk66ct2qPTRnigiibUnUIiB/n
         9BDstkXKg5ynQMGWBH3EHjXh1imCi3SJ9tk9fXkwRIn08owdJZjT89kj//Bqb8c+WUdH
         dBMM8GtCUPh7bU5VnHTMbAm64ENiAEx3ZtJ24aQ8vRO6gqtIM2MeBSHYPRDCK+TiOBoo
         PqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=dMOl9WGfD+jnC+rFtZxWkt1o9423IuQCs6U+pqR6Rmk=;
        fh=qJpuUQrf4VWTRGRxfzRJWgXPu5b0LxnJsVMsIYGSCTo=;
        b=z+5ENhKv065tg9Eznk76PSLZBbuBeRboclKqjujeHJblR2LT/jh2mBScqWntBSICE3
         4XmHMsFEVmQMDNBOng2+GdrQFQhpIuYiZZPbG1owyy1QGjkBCsZq68GrnFdzb8hoD4MY
         2+rGinnGf4nsGfLRpqWf6OHGaRMHn5s/MtZ4Zoo1n1FyAfGu5gfqRmbrCJj+mqyDue8W
         qWomlzFwfts7g5K4fNvLg1DIpOL387cBOo3f7smr5CUTltok2oS0qZDUqfzw+k3b++45
         sDyHASAoOPWaFwCcLVzckcYZ0ylvI9JjQWNKAu7mGOgutTctcAdLZnY1Zn2UtBtrAcbo
         6lOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe6d28si1738991cf.64.2024.08.14.14.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2024 14:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seLhx-0002zv-Ku; Wed, 14 Aug 2024 17:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1seLhw-0002yH-1N; Wed, 14 Aug 2024 17:39:04 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1seLhu-00061s-5w; Wed, 14 Aug 2024 17:39:03 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 58B8F4E601B;
 Wed, 14 Aug 2024 23:38:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id qopeG03LmtOG; Wed, 14 Aug 2024 23:38:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4D95E4E600F; Wed, 14 Aug 2024 23:38:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 466F874577C;
 Wed, 14 Aug 2024 23:38:52 +0200 (CEST)
Date: Wed, 14 Aug 2024 23:38:52 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>, 
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, 
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>, 
 Sergio Lopez <slp@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Jia Liu <proljc@gmail.com>, 
 Helge Deller <deller@gmx.de>, Max Filippov <jcmvbkbc@gmail.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?ISO-8859-15?Q?Fr=E9d=E9ric_Barrat?= <fbarrat@linux.ibm.com>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH 2/5] hw/char/serial: Remove unused funtion
In-Reply-To: <20240814181534.218964-3-shentey@gmail.com>
Message-ID: <22fa9014-2923-b501-e38d-f5dd1e53d15a@eik.bme.hu>
References: <20240814181534.218964-1-shentey@gmail.com>
 <20240814181534.218964-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kVVdMykRcVMd

On Wed, 14 Aug 2024, Bernhard Beschow wrote:
> The serial port's frequency is set via the "baudbase" property nowadays.

Please keep it as some devices might have registers that set this freq and 
this function will be needed for emulating that even if it's not emulated 
currently.

Regards,
BALATON Zoltan

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> include/hw/char/serial.h | 2 --
> hw/char/serial.c         | 7 -------
> 2 files changed, 9 deletions(-)
>
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 6e14099ee7..40aad21df3 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -93,8 +93,6 @@ struct SerialMM {
> extern const VMStateDescription vmstate_serial;
> extern const MemoryRegionOps serial_io_ops;
>
> -void serial_set_frequency(SerialState *s, uint32_t frequency);
> -
> #define TYPE_SERIAL "serial"
> OBJECT_DECLARE_SIMPLE_TYPE(SerialState, SERIAL)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index d8b2db5082..6c5c4a23c7 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -951,13 +951,6 @@ static void serial_unrealize(DeviceState *dev)
>     qemu_unregister_reset(serial_reset, s);
> }
>
> -/* Change the main reference oscillator frequency. */
> -void serial_set_frequency(SerialState *s, uint32_t frequency)
> -{
> -    s->baudbase = frequency;
> -    serial_update_parameters(s);
> -}
> -
> const MemoryRegionOps serial_io_ops = {
>     .read = serial_ioport_read,
>     .write = serial_ioport_write,
>
