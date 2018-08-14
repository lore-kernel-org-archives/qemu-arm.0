Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4428930wru;
        Tue, 14 Aug 2018 12:21:46 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxCQXYlyR6BiTyTV7NFjp+tFDaqoWjcmOPAJUzfD9n1S4UmgBlKyUTNNqv/R82NKJxSLg+k
X-Received: by 2002:ac8:1738:: with SMTP id w53-v6mr22822240qtj.421.1534274505963;
        Tue, 14 Aug 2018 12:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534274505; cv=none;
        d=google.com; s=arc-20160816;
        b=meu4M8h+/8XIzp50Hmr/rD5xQ1QSSVFBMAtmlRbB73Gv9DCSdCcGFns5FbAs75ZJQG
         TO16i/m0F/lBfc6fZjVQCzoB69x+Fx1No9/vDQi20m3vpq9Pjf9m3Ocr/uiQE38DRO4t
         puDenlpdr157/oqoFPQulsOONcj+MmUPl1abJgA3xn2tNDmCX4b8NcVNRcjseVZWGChN
         ZkScORtnZe/1awenK6pjDgEHWu+4npWVWo/Rxei+3F636bSHVWNyQZbRpf30kJy+slY6
         F1eyJcEoRS/UMvKNhgHG1jdR94UMJyhKpAgRZDvN0qh700Vljp1pvwu50To3KMcJZttc
         HmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IG1Nb6EDqcCaJz1rgaskn/+4zmhL/vQvcSBOUvS31Nw=;
        b=WGpod5J/v54P0nnwiEJacETiGT0rMapZ3RCKySvNoXVI0gnIWNMpIY3i8cOO1WeJLc
         EPttxW/6Y6Jnob0RWZkWSwp9tWncXnDD3BkaJjYJcQHAkN9ZBC+A+nDbGLjCwWMoi2FY
         7vXYZiAGPMdnX4WZgyX1ofcBtDd0fU50/zuykIbVQnBTNaHC4SJ/ek9qvE9akrTWNa5K
         4E9yaJrTiUktdxwUCdSwdvmGICS5UsZntb91A2b3PHxAoQ8BKe++koj7tPiGjnD3VdUQ
         PxaxppqJ3S+YCDVFbZz0rU06AgGJSWgmn9aH+iXlT/qFnzx7ZONXnRSAEcuIt2qPFYsv
         zj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ye4hirXb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q28-v6si1108883qkq.59.2018.08.14.12.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 12:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ye4hirXb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpesz-0005rr-EG
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 15:21:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fpdvo-0005B3-6O
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fpduI-0006qN-Pa
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:20:36 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fpduI-0006oL-0U; Tue, 14 Aug 2018 14:19:02 -0400
Received: by mail-lf1-x142.google.com with SMTP id l16-v6so14457863lfc.13;
	Tue, 14 Aug 2018 11:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IG1Nb6EDqcCaJz1rgaskn/+4zmhL/vQvcSBOUvS31Nw=;
	b=Ye4hirXbQjfzrpNRCDwdC0FhfrLDzR5M4JMjk8qleWE2M6I0LEVjWkkoy6sxEZbweh
	SY8ZDIym+SiOX5KZRqTw/l8CcxCNeaMusUC5PllimZpcX1jrpcVWi10tt9cYwd0rWyfo
	00b8APk/20uvU6JsY6YUm0Ik0yNWzQgeF60L9GvB4Nad6x6h28HT8KC8V/mcz6OCdQyg
	arcmyjzIJLlrf51TG3AhQaJBvpTasAf2Jcf14HSYxWYrH5so5XKepxLOPvAYIotJc5SU
	Q9ZS7OgdhEJ8dN13bxkHXrXzokCqcfSvP1wmSGMkTDg/qUNiAvDNT0PrJFHnwj4pqy42
	nvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IG1Nb6EDqcCaJz1rgaskn/+4zmhL/vQvcSBOUvS31Nw=;
	b=qDPmovn17XoLCLweIxVCEDbPlpth3Y8sR4hgHhLBuhRJKValp4ut9iYYeNa6xxOexC
	xCEX6Qxxr0nhIB48uyQCXpZzQ9rq+WJMEdx1ZqE5CCLlCQYkmkuLPKiTvzeKjY0dz1ZB
	z7phm4h1dMJkc6IsM8NFoSOKhYrhj9m8GRQxKlrfPJbOx42ltcVnt2yZpyYi6eOjSoJR
	6sPjJIZf1BX1XY7UIHfG7IYDPsYLth/dBiGRR5AqaXCzY2Dy1tgmbDbLiIvtDZ9OYjAN
	Hqsy3JCPc/hnr2/Jas0ouhmucxymJgwDGfldD/0lWUUFGkCQ4zgPF/VSZ5JhJ+NtJLU3
	OEVw==
X-Gm-Message-State: AOUpUlE93PM0gjv+sWFZNHezRVFof+BQ6mQs3jiVNmAoKHRjA/WVKiKc
	WOGiSQ/DkD8TH+Ixh3QVIG/ks5IbDphAjas8h8I=
X-Received: by 2002:a19:910a:: with SMTP id
	t10-v6mr14030650lfd.24.1534270739098; 
	Tue, 14 Aug 2018 11:18:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3e14:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 11:18:28
	-0700 (PDT)
In-Reply-To: <20180814162739.11814-5-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
	<20180814162739.11814-5-stefanha@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Aug 2018 11:18:28 -0700
Message-ID: <CAKmqyKOdA-gXYRxxd0qLkkstYJWgk4gR4H5uwW5W7WWi_57n_A@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-devel] [PATCH v6 4/6] loader: add rom transaction API
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hkaUZUQ4q0lP

On Tue, Aug 14, 2018 at 9:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
