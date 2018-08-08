Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1157022wru;
        Wed, 8 Aug 2018 14:33:20 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzT7pieqpZ6qQTm4ZjT4fHygznFjJpGLhdkHGd5FJk6a00a5lXc99ks7NncgkHOc6HGFaXt
X-Received: by 2002:a37:5041:: with SMTP id e62-v6mr4018369qkb.249.1533764000724;
        Wed, 08 Aug 2018 14:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533764000; cv=none;
        d=google.com; s=arc-20160816;
        b=sMiod8cuboRnMax4Fa8PySvL46qBGS3luEVhhJhZwc5HtPVfSEbhrNIgXRLjE17B6N
         Nx6+BCPIT1KPTrQlp2mzrHRT8DaKnFmsh6otATDJgk2P3H8kjURG/Sc8GlLnkDNpW8+M
         3hmD7SEWKz2U/IYkZBu7SJdvbzsM3Ayy61IHzhzTynd0YnqLZvS4RPweYUkE6pHuWhiF
         PolOZu46trDfSNXWgBDHVuOrrLNJv454EfiXk6ZyQqL6vkK6oJHyaUAjXHgBONYCT/lo
         944Z7jl8yVccAZYBR3wxeeD/zwRS721NJ0GrFiDT1XAY3q0KdZkl5152ttLKBa3ooohX
         W/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=t/H08jO+nHu+oH9XbaK4ZaFSLmphviPL9WQIX2rSGAU=;
        b=RsQBMMw1NrHQoMvXNq0HwxTxdZO/ON3keaczz6XDIy8msWUy94SOh/9zL4LfbX2Q8k
         0lboqUIzY2IzodJOd3LiWNVNOIqWrHJ9nsVBZT+7wpUT2NQOq8E9vQVGvXTToxqTUl+n
         oRRzpXU9G8OEmxHwardm75WDHEAjFTwCA8p9VVqpCoVBY9QPkGu/GO4ef6x/0LMUe7Ck
         vgmhPc9QBUQnQoKhP8XPLFBUr2zTDaU7PuVjka6mu54Bsw26fyOgkT0HBy0bX0jLr3kX
         JxLkI4rhY8lUlYpwQAQx4ydIHKR7jhZ/H2ZqgMIde4V5y2CLUXc0lMKdr79kkXzXbrDx
         uf1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=haTPe0se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e200-v6si5343440qka.183.2018.08.08.14.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 14:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=haTPe0se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnW52-0007I5-6e
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 17:33:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fnW4o-0007Gm-EQ
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 17:33:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fnW4n-0006c8-Hn
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 17:33:06 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fnW4l-0006ZW-Ab; Wed, 08 Aug 2018 17:33:03 -0400
Received: by mail-lj1-x242.google.com with SMTP id p6-v6so2858491ljc.5;
	Wed, 08 Aug 2018 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t/H08jO+nHu+oH9XbaK4ZaFSLmphviPL9WQIX2rSGAU=;
	b=haTPe0se/o7GS371ySjFcAzlwdEXtSMum2N2HlwA6rV/SYhStEgdrlSM5qtkd9sJlo
	ynbVqwyIMOG3Iv6d/ZbCoC4c3RLjRKBeHf8t2BGW8keh3oxR9XhCVuD31j7pa39c5nUy
	jpF8XWQ5EXOVz5nKiWtE5bsBOt7B7cEUVBAT4yiyRgRhY4auP/tbRDmF9oJgiWpEM6kC
	/cewl0AefLNXIQhLb5AAUB4d0D3CHkiwW7d7fnWn8HKH8mQB4GBoM8V/sWlRidcFsHtG
	Fg8ivpCZJ7NQq6DBJyAxsPd0gsrUwqkuR1soas1nLkhUJZNrq8OCI+tzPLznc3bx+e/d
	SL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t/H08jO+nHu+oH9XbaK4ZaFSLmphviPL9WQIX2rSGAU=;
	b=h/Hu3Vh7+kT5PCx9wS55EWSBzs0+N6SU/l2v8OsKC+RA0wg/eYe+6NBat1RDSr0CZr
	kDVT2SPYNhSKMcXJTIfRPexaebGzc5ygL0kjHNXadp4vzRxuxSfPdqQ5AHRu83drKA0r
	hjUJjoiW3p7MNmsfERFq2O2WGB0LTrNjQqUZUdGtp9gecXqcXEElCOCDnYEqoZRohsA0
	au9jca4Ev8pArn8VpT1oWsgd/jOD+vXK8gDL28XrCcRZk7bKN1/xDB39/XVvkaRfOneR
	w1nEBHRszwt/z5m85yYia6bQZ9z397KhkgKHjljNIy02WKyk3vSX6CRAuwRO5+8kaIAE
	MnYw==
X-Gm-Message-State: AOUpUlGnlWPXGp4S12BgCZt6t6X0ME+/vhpa0ucN8o0HtABh+EyOCqVB
	PiwfoiIavCvLXO2HY2C0mqLXPDDtl3k3DNG0BF8=
X-Received: by 2002:a2e:8457:: with SMTP id
	u23-v6mr2974067ljh.95.1533763982180; 
	Wed, 08 Aug 2018 14:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e14:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 14:32:31 -0700 (PDT)
In-Reply-To: <20180803144721.17036-4-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-4-stefanha@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Aug 2018 14:32:31 -0700
Message-ID: <CAKmqyKOLkNzAQgrr9rRYTCzrDnsjj1uChDaX4-2xnJMrEtEUKw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 3/6] loader: extract
 rom_free() function
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
X-TUID: yNJARxOcTIeH

On Fri, Aug 3, 2018 at 7:47 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> The next patch will need to free a rom.  There is already code to do
> this in rom_add_file().
>
> Note that rom_add_file() uses:
>
>   rom = g_malloc0(sizeof(*rom));
>   ...
>   if (rom->fw_dir) {
>       g_free(rom->fw_dir);
>       g_free(rom->fw_file);
>   }
>
> The conditional is unnecessary since g_free(NULL) is a no-op.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/loader.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index bbb6e65bb5..0c72e7c05a 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -847,6 +847,17 @@ struct Rom {
>  static FWCfgState *fw_cfg;
>  static QTAILQ_HEAD(, Rom) roms = QTAILQ_HEAD_INITIALIZER(roms);
>
> +/* rom->data must be heap-allocated (do not use with rom_add_elf_program()) */
> +static void rom_free(Rom *rom)
> +{
> +    g_free(rom->data);
> +    g_free(rom->path);
> +    g_free(rom->name);
> +    g_free(rom->fw_dir);
> +    g_free(rom->fw_file);
> +    g_free(rom);
> +}
> +
>  static inline bool rom_order_compare(Rom *rom, Rom *item)
>  {
>      return ((uintptr_t)(void *)rom->as > (uintptr_t)(void *)item->as) ||
> @@ -995,15 +1006,7 @@ err:
>      if (fd != -1)
>          close(fd);
>
> -    g_free(rom->data);
> -    g_free(rom->path);
> -    g_free(rom->name);
> -    if (fw_dir) {
> -        g_free(rom->fw_dir);
> -        g_free(rom->fw_file);
> -    }
> -    g_free(rom);
> -
> +    rom_free(rom);
>      return -1;
>  }
>
> --
> 2.17.1
>
>
