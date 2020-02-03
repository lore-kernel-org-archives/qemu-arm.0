Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3742332lfp;
        Mon, 3 Feb 2020 01:59:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqywsldQu38ZFY8Nx+u58VC6kYLLJnvWywOa3Jie41/KhFPtxFgnofOMnR4VkTGAXwnxLKpZ
X-Received: by 2002:ad4:514d:: with SMTP id g13mr21443893qvq.190.1580723941336;
        Mon, 03 Feb 2020 01:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580723941; cv=none;
        d=google.com; s=arc-20160816;
        b=vglaksMwowPUShVwQnWA9WZ+WIDiPWtTFvdZcdOgQaCg8OAYir8t84GFYmmg754j1f
         b9V7yoj/7i+2bAMD3qppiD+joxD1k19BPTs6OhRh1ByKFnw31FHYyVN339sTG55OlRXL
         IfnU6R/HUMk0YCnEeayM7j5ZpGgpDRlKiHrUAPWP/pTymk5YUyObd0+G/6/HQRHaAk2V
         zmt2QSCNJiWoGMaJpOWkk+lCd8pjfIpNJbQR08lo2Uwe3H5L+sVHaP6YBAI4kXd7b4qF
         nthrHSLMd1hwJ8CJo3g6qa8mAjy9mBeSEeH7bi/VNOGI9vlYszgChjhPpYcIGgItp7TG
         +ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=6OKVhoxbcOsa4y2NJ/NR0P2E5oTl2ckYF89/zgSjhPU=;
        b=df+z6QruF/QP4MMBgYoCQBi3pMVGQDRi2CqqmZNAF7sQA5mOSq1AhqoBmOCKF2W5f6
         hd8N11qhmxwdTYhyWSzRBUXCFvBoHhNfp9SQueUpItKQDtlxeeWwi9Iau0QP0isOFvcD
         CZu9yiIyZxJPLtum7AnRiJMtsmhf/WIj+UlLTD3Aj2AIXLQ5lPPvH3I3V/+jlLsGh90o
         wX1TZGecQHl3J4To7bkIINyK5FJwrOcbhwEQ+cEwTZaDOQoPoeXKpZZb6L+VOh20gScE
         vpg07cG8NAN3I8zGBjoTzrP7tdop6MYIDEXPqoO1y7l27BBsTczf7WdZcWZTpZheCrE9
         ZYyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hoZ+fz6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si12658691qkj.74.2020.02.03.01.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 01:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hoZ+fz6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyYVQ-0001N3-PL
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 04:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iyYVE-0001K6-F2
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iyYVD-0003fa-8f
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43441
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iyYVD-0003ev-4r
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580723926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OKVhoxbcOsa4y2NJ/NR0P2E5oTl2ckYF89/zgSjhPU=;
 b=hoZ+fz6xs9jYF2saBmbtMzzYKbdnM6vGlnt55KhymSJ9ioNoh2NX2zJ/ZKi5Y0hjO0sQuy
 0CF1ZzmzEZhohnAPKhjj/wFnv2q6pQ5o1MUTubxk12znRqdIJDcQOLEk9Z3LyRN7jGVWO6
 kj+zSJG0/4jOaMiEPqyWVrI/9PQ3WnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-10jlmojkO02A8tfOGlx61A-1; Mon, 03 Feb 2020 04:58:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2A41005512;
 Mon,  3 Feb 2020 09:58:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29BD28EA0B;
 Mon,  3 Feb 2020 09:58:40 +0000 (UTC)
Date: Mon, 3 Feb 2020 10:58:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/6] hw/arm/raspi: Get board RAM size from board
 revision code
Message-ID: <20200203105839.2d369c9f@redhat.com>
In-Reply-To: <20200203082619.7426-5-f4bug@amsat.org>
References: <20200203082619.7426-1-f4bug@amsat.org>
 <20200203082619.7426-5-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 10jlmojkO02A8tfOGlx61A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cNhx3lTsa4Up

On Mon,  3 Feb 2020 09:26:17 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> The amount of RAM is encoded in the board revision.
> Add the board_ram_size() helper, it will allow us to quickly
> support new boards.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/raspi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index f5e54fe876..656d834e07 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -13,6 +13,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/arm/bcm2836.h"
> @@ -71,6 +72,11 @@ static const RaspiBoardInfo raspi_boards[] =3D {
>  #endif
>  };
> =20
> +static uint64_t board_ram_size(const RaspiBoardInfo *config)
> +{
> +    return 1 * MiB << extract32(config->board_rev, 20, 4);
> +}
> +
>  static int board_chip_id(const RaspiBoardInfo *config)
>  {
>      return extract32(config->board_rev, 12, 4);
> @@ -222,10 +228,13 @@ static void raspi_init(MachineState *machine, const=
 RaspiBoardInfo *config)
>      BlockBackend *blk;
>      BusState *bus;
>      DeviceState *carddev;
> +    uint64_t ram_size;
> =20
> -    if (machine->ram_size > 1 * GiB) {
> -        error_report("Requested ram size is too large for this machine: =
"
> -                     "maximum is 1GB");
> +    ram_size =3D board_ram_size(config);
> +    if (machine->ram_size !=3D ram_size) {
> +        char *size_str =3D size_to_str(ram_size);
> +        error_report("This machine can only be used with %s", size_str);
> +        g_free(size_str);
>          exit(1);
>      }
> =20

