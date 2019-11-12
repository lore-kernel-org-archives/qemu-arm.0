Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2368532wrr;
        Mon, 11 Nov 2019 23:56:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhm4sKAApC5SsPldwGH7N4vKPHiJEkpHxJ8iDEDVw5x4hNPhuUSlZaahKu0hieqiL4HAUp
X-Received: by 2002:ac8:3789:: with SMTP id d9mr30882530qtc.132.1573545415660;
        Mon, 11 Nov 2019 23:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573545415; cv=none;
        d=google.com; s=arc-20160816;
        b=wwRSBHDn9qjIM+xAickGTIVQeNTi1NYriUzzg1JA2rwEb5ZZvBtWsvttysXkOQWBX+
         IhNM/6kMIEfjd5FciN1Pmg02l28gR/2261HWhtvklL0Oshq+x6KABLK0naoN5LytPo9D
         vWStXk6W/bDq8FgwbQEDY//R0oWnrHMc6Fes3G/TIq33W+B6lMzIInKSYkrpeT2L4hVo
         xYMtRYmp88zheODeOEp5ZE0lQtWb8NcFWSqHxgh2CD8Q90Vbd479vFwh16A6/HXD21UW
         viHJvhfL80rK68LhaWesDjt4F+QCqNkmL6epIM+l/ayoz9POovA8rDF00fwpgpVT++KA
         qKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PDdzmDuuXICnTzRkm3zBnH9PUC89J6knRXEy96irb24=;
        b=jo4Wa52cCDdT3m3PpsgVfSdc/Cqet7qa2NaIIPkM96tEFhjS9gxxmmzLohy9NV0NWc
         PAYlWH+RVLCVIWoiSMfsRZ6eJtbe77jtyRbRFnbiqKZ72YZpg+TzycH6XAOztv0gMzDo
         Club4YNKJMGg/KgEvBs1orSDdsPWZZwIMT1v2HcEPfvFEflQ8k8OROzJqEeiZUh5lYSY
         BuBPncgRStlXwF3A/SekQAect0jSQbwREo8Ktp/SRGWkn50zfJXKYVYzM90Yuk5bie8F
         2uruWD922pCv1ffUE7H1wyuFz4lpU3ccXQ3in11N29Uutj2qdUGLJe2odSqsU2VmQLvN
         zbVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26si10103650qtn.249.2019.11.11.23.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 23:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUR2l-0005Bq-1y
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 02:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iUR2b-0005B5-Al
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:56:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iUR2a-00089l-2j
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:56:45 -0500
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:48338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iUR2Z-00087D-Sp
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:56:44 -0500
Received: from player799.ha.ovh.net (unknown [10.108.35.223])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0D0CF71723
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2019 08:56:42 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 7FFFCBEFD2A3;
 Tue, 12 Nov 2019 07:56:36 +0000 (UTC)
Subject: Re: [PATCH 4/4] watchdog/aspeed: Fix AST2600 frequency behaviour
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
 <20191112064058.13275-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <87e0a727-bfd5-a485-e986-e26fd4cccfef@kaod.org>
Date: Tue, 12 Nov 2019 08:56:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112064058.13275-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7329889868546018112
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.50.107
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 66Fz0lbd1BtW

On 12/11/2019 07:40, Joel Stanley wrote:
> The AST2600 control register sneakily changed the meaning of bit 4
> without anyone noticing. It no longer controls the 1MHz vs APB clock
> select, and instead always runs at 1MHz.
>=20
> The AST2500 was always 1MHz too, but it retained bit 4, making it read
> only. We can model both using the same fixed 1MHz calculation.
>=20
> Fixes: ea29711f467f ("watchdog/aspeed: Fix AST2600 control reg behaviou=
r")

which commit is that ^ ? Did you mean :

Fixes: 6b2b2a703cad ("hw: wdt_aspeed: Add AST2600 support")

> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

C.

> ---
>  hw/watchdog/wdt_aspeed.c         | 21 +++++++++++++++++----
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 5697ed83325a..f43a3bc88976 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -93,11 +93,11 @@ static uint64_t aspeed_wdt_read(void *opaque, hwadd=
r offset, unsigned size)
> =20
>  }
> =20
> -static void aspeed_wdt_reload(AspeedWDTState *s, bool pclk)
> +static void aspeed_wdt_reload(AspeedWDTState *s)
>  {
>      uint64_t reload;
> =20
> -    if (pclk) {
> +    if (!(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK)) {
>          reload =3D muldiv64(s->regs[WDT_RELOAD_VALUE], NANOSECONDS_PER=
_SECOND,
>                            s->pclk_freq);
>      } else {
> @@ -109,6 +109,16 @@ static void aspeed_wdt_reload(AspeedWDTState *s, b=
ool pclk)
>      }
>  }
> =20
> +static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
> +{
> +    uint64_t reload =3D s->regs[WDT_RELOAD_VALUE] * 1000ULL;
> +
> +    if (aspeed_wdt_is_enabled(s)) {
> +        timer_mod(s->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + re=
load);
> +    }
> +}
> +
> +
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t dat=
a,
>                               unsigned size)
>  {
> @@ -130,13 +140,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr=
 offset, uint64_t data,
>      case WDT_RESTART:
>          if ((data & 0xFFFF) =3D=3D WDT_RESTART_MAGIC) {
>              s->regs[WDT_STATUS] =3D s->regs[WDT_RELOAD_VALUE];
> -            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_C=
LK));
> +            awc->wdt_reload(s);
>          }
>          break;
>      case WDT_CTRL:
>          if (enable && !aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] =3D data;
> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
> +            awc->wdt_reload(s);
>          } else if (!enable && aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] =3D data;
>              timer_del(s->timer);
> @@ -283,6 +293,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass =
*klass, void *data)
>      awc->offset =3D 0x20;
>      awc->ext_pulse_width_mask =3D 0xff;
>      awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
> +    awc->wdt_reload =3D aspeed_wdt_reload;
>  }
> =20
>  static const TypeInfo aspeed_2400_wdt_info =3D {
> @@ -317,6 +328,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass =
*klass, void *data)
>      awc->ext_pulse_width_mask =3D 0xfffff;
>      awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
>      awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
>  }
> =20
>  static const TypeInfo aspeed_2500_wdt_info =3D {
> @@ -336,6 +348,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass =
*klass, void *data)
>      awc->ext_pulse_width_mask =3D 0xfffff; /* TODO */
>      awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
>  }
> =20
>  static const TypeInfo aspeed_2600_wdt_info =3D {
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt=
_aspeed.h
> index dfedd7662dd1..819c22993a6e 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -47,6 +47,7 @@ typedef struct AspeedWDTClass {
>      uint32_t ext_pulse_width_mask;
>      uint32_t reset_ctrl_reg;
>      void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
> +    void (*wdt_reload)(AspeedWDTState *s);
>  }  AspeedWDTClass;
> =20
>  #endif /* WDT_ASPEED_H */
>=20

