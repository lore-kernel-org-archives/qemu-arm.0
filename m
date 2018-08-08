Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1156260wru;
        Wed, 8 Aug 2018 14:32:28 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwokGAEekmVddZhS/HQLjMVHysA5K2G59cCxL0cD4sSv5sTf6phYw9DFodaF12pSWCBitTB
X-Received: by 2002:a37:8b02:: with SMTP id n2-v6mr4129691qkd.157.1533763948359;
        Wed, 08 Aug 2018 14:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533763948; cv=none;
        d=google.com; s=arc-20160816;
        b=i6zLq1YzqWuJx3LKB2lE8kIdtTI8MujfGdqYnTQdTJ0j5HuMk4Vel9gS9kGse9zTh/
         qYwI+Et0Be20jxtO9obEMeTWo+c9E7PrZhz/ZiwHFP8u+kvfgfwEdRS6egXw40HWg+lu
         xWWSFy+eHyeZlJ/AqwPAbE52RPXtx/bysFegjOAFfpMy9dKET5lvxeYO0mcOIJ1OEsQw
         0fR1YwuAtZUzmzJDzcPpi9sgVBs9Wm4X8Krdbk3dQacHwzhpK8WeOdt56s0FWo0gXYsH
         Tb80pA+Qx3fbqfx3QTnymfHWuBdtR+FK2+nwN60feaHwPykPrnaLf27UAVNyV8VfcJ5N
         hNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dbeBZ8wEliasPEHnPBpJFv74HI6mHNBF/cms33/tgaE=;
        b=pKjzwOIbnlt3g2cdxZhfVoq3wjYRMzNOljjcNEywUs4f7QvpNin+BrHBEXEx8DPfgD
         c6xLyb9mCRdit+tXFbit5OBfO7ArFBXnOkWZ45sYPGNTttqFEBBBNU67u63Or0mqFek/
         OQjaGbqzoofTzCDQqVKTjJprBZXGcrPj/dL3id4njly+JWNrgJMcjjtV8fQPrCF+/Wuj
         ffUk9CrhGYCvN8hHhn1Yk/Femy7E/8L7fLqikkQj+k/lAB2VPgdfdHnNdBoPfnfuRKzC
         WSV0+GRRNJNxgpbpu8fzrvQ5VfVX7yCKQGxHTLY+m6wiOpyIAgOYfhqY4fvbFeZ1GMS9
         XRpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DDiybQOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q29-v6si2716494qta.261.2018.08.08.14.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 14:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DDiybQOS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnW4B-0006tG-Sk
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 17:32:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fnW41-0006re-Q9
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 17:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fnW40-0005mW-R6
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 17:32:17 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fnW3y-0005eJ-27; Wed, 08 Aug 2018 17:32:14 -0400
Received: by mail-lj1-x242.google.com with SMTP id p6-v6so2857161ljc.5;
	Wed, 08 Aug 2018 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dbeBZ8wEliasPEHnPBpJFv74HI6mHNBF/cms33/tgaE=;
	b=DDiybQOSKDPUFaBGehugfP0xxvwDDcAgVPd/NQLny3SD+SYmU2CeZLPfGkIKUG7zRU
	rlWX6gTmUc6Sr2BKyurCTFaECbNIGyotpvwzYCS9XD1DvSWg/JdtIoPfEaBBimjBw/20
	5b/25JFLQy4XSRV4YpFKt0ud4erF8kngNkI+J98OCyy47GmmbWxAMIO6Koxri7TGKns7
	wJ40RwnHhpj1ZdbscIOlRcEcyVRu6d7rX7RTktybvGxGNA3FqW3d0S13nfPeoqRFQGrv
	wj4GRmrQUgwgxihZ640koCjfTc4PwJ7ZT49P9hxEH+wzsn9Kx+MoI8aqRRjuzCSko3GP
	S4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dbeBZ8wEliasPEHnPBpJFv74HI6mHNBF/cms33/tgaE=;
	b=slvgxs+dWS424r+d78zrNow4aSlGY6DtcgymNbuUDNfiZQ+TW9CalB8IggEuYzXYAA
	dplG6ytUWwzXpIiRF8uLOyRV4jdzBkSWWghbBi3HvrFrahEhIT2zB7SVSRLJK626Et0w
	OXPL92W0Nja42ZYkKNc9ad9XysxiBvGCbjJhKxGAHMy9t/kgBrnqGTmKuBRWQBnHWp5R
	qNkTsGiJvmL54qjHF7e7/zZNkt/F3xBK3ySKD3ZPa8QblDrWynsBW9SvN/wOk6SY9IZI
	PiOHiMzcDGz6mn/67Db1vmAhLMJf20xHOiPqmky60P52oJ8KI9Vwh2b5D6/t3mBn//p3
	u7Qw==
X-Gm-Message-State: AOUpUlFI8o/yekbbNpQYkK3h/zZxBCwqqa8kpZxairuEDlEs7dZQDDuX
	g/Nr8cCG8EqE+gW19sLwg+ugNpX2tMWhl5Jx+Qw=
X-Received: by 2002:a2e:8185:: with SMTP id e5-v6mr3272227ljg.93.1533763932444;
	Wed, 08 Aug 2018 14:32:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e14:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 14:31:41 -0700 (PDT)
In-Reply-To: <20180803144721.17036-5-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-5-stefanha@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Aug 2018 14:31:41 -0700
Message-ID: <CAKmqyKOthBCQrWc_v9zhdYoBATHYfjyjkUQqx1W5mktm2b+6hw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 4/6] loader: add rom
 transaction API
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
	mail@steffen-goertz.de, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnxpm+XfTacE

On Fri, Aug 3, 2018 at 7:47 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Image file loaders may add a series of roms.  If an error occurs partway
> through loading there is no easy way to drop previously added roms.
>
> This patch adds a transaction mechanism that works like this:
>
>   rom_transaction_begin();
>   ...call rom_add_*()...
>   rom_transaction_end(ok);
>
> If ok is false then roms added in this transaction are dropped.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/loader.h | 19 +++++++++++++++++++
>  hw/core/loader.c    | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index e98b84b8f9..5235f119a3 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -225,6 +225,25 @@ int rom_check_and_register_reset(void);
>  void rom_set_fw(FWCfgState *f);
>  void rom_set_order_override(int order);
>  void rom_reset_order_override(void);
> +
> +/**
> + * rom_transaction_begin:
> + *
> + * Call this before of a series of rom_add_*() calls.  Call
> + * rom_transaction_end() afterwards to commit or abort.  These functions are
> + * useful for undoing a series of rom_add_*() calls if image file loading fails
> + * partway through.
> + */
> +void rom_transaction_begin(void);
> +
> +/**
> + * rom_transaction_end:
> + * @commit: true to commit added roms, false to drop added roms
> + *
> + * Call this after a series of rom_add_*() calls.  See rom_transaction_begin().
> + */
> +void rom_transaction_end(bool commit);
> +
>  int rom_copy(uint8_t *dest, hwaddr addr, size_t size);
>  void *rom_ptr(hwaddr addr, size_t size);
>  void hmp_info_roms(Monitor *mon, const QDict *qdict);
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 0c72e7c05a..612420b870 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -840,6 +840,8 @@ struct Rom {
>      char *fw_dir;
>      char *fw_file;
>
> +    bool committed;
> +
>      hwaddr addr;
>      QTAILQ_ENTRY(Rom) next;
>  };
> @@ -877,6 +879,8 @@ static void rom_insert(Rom *rom)
>          rom->as = &address_space_memory;
>      }
>
> +    rom->committed = false;
> +
>      /* List is ordered by load address in the same address space */
>      QTAILQ_FOREACH(item, &roms, next) {
>          if (rom_order_compare(rom, item)) {
> @@ -1168,6 +1172,34 @@ void rom_reset_order_override(void)
>      fw_cfg_reset_order_override(fw_cfg);
>  }
>
> +void rom_transaction_begin(void)
> +{
> +    Rom *rom;
> +
> +    /* Ignore ROMs added without the transaction API */
> +    QTAILQ_FOREACH(rom, &roms, next) {
> +        rom->committed = true;

My only thought is that maybe this should produce a warning or error
if a ROM isn't committed.

Alistair

> +    }
> +}
> +
> +void rom_transaction_end(bool commit)
> +{
> +    Rom *rom;
> +    Rom *tmp;
> +
> +    QTAILQ_FOREACH_SAFE(rom, &roms, next, tmp) {
> +        if (rom->committed) {
> +            continue;
> +        }
> +        if (commit) {
> +            rom->committed = true;
> +        } else {
> +            QTAILQ_REMOVE(&roms, rom, next);
> +            rom_free(rom);
> +        }
> +    }
> +}
> +
>  static Rom *find_rom(hwaddr addr, size_t size)
>  {
>      Rom *rom;
> --
> 2.17.1
>
>
