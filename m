Received: by 10.223.134.117 with SMTP id 50csp12414443wrw;
        Wed, 3 Jan 2018 13:55:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBotdTqDZvTxhWj2P0LiRT28LA4zdzwqEjtzM+yXqn26/hpQyh16ZNh4RyaW+fc4XPopzlWW2
X-Received: by 10.37.135.81 with SMTP id e17mr2616096ybn.364.1515016555126;
        Wed, 03 Jan 2018 13:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515016555; cv=none;
        d=google.com; s=arc-20160816;
        b=YwAHS6zTi/NQzaOZ0abvADn+r+xWwwmqTMrqReLkRdJ+9HYKND+DkFeor/NWCJ/xOU
         dY27QPTXHQMZU15ym0YL2fSGTdj3yxxAKADKU/t6IhwPXMizRyoojDCglTUtOwTp+Ejn
         YN1cAblgYK8k+yh0d3UxhZwiCU5UxAS4WZ8oLxthVpu93DAJROf9cN6itNV9oQiOMDmL
         B8p40O1KqfTK4H6VD9f6rhGz+emHXyomGd0eBMhcISHQgppNZrcy95hFGIx3/igPxCQY
         pQIqOsk0OIRtcQwiRqqQz5p67jBxlGM38zUedBeJM1b2GxCbIIq0M3Ckwx4wiikE7zqk
         PElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=m/hvgdyz3L5rgDLUXaIeIOgBSYNNILH4ZQDKR02cnU8=;
        b=MgwLAWAce/bqyGqCpxfXXlrXZbyQzpVRARi3MXaKkTW7kv/RrtnAJIZCBXx/Y9H7Bo
         F9b3amizkK4K7yS1EmaoKgjn+ZlpTAZYHzfmv0qYTooCq6HNQtXrOcRn23x0HPDqyVVf
         6Smon9hkV4YzRYMFE5SgZG5kIwpacKe+/Sy+KT/5famvMFNvz7c94V+b2Mc5+0NfBdxA
         0wVniTGOfRlb9vFY4wO0irEVBZnyugRiW2Wg0dpYHwwrHV9A11U2fANam0snJdsZPWrJ
         jtMYD+vh7jtG42FoQFS5hMuYDtyk4p9S9kiWRwjmGvecOU7GUTjcrLgeNrSqomByIyxQ
         5Ntg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tr8Wb7GL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si397145ywc.465.2018.01.03.13.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 13:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tr8Wb7GL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWr0s-00067M-GX
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 16:55:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWqxL-0002w6-CR
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eWqxK-0006AJ-ET
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 16:52:15 -0500
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:37602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eWqxK-00069y-7x; Wed, 03 Jan 2018 16:52:14 -0500
Received: by mail-wr0-x234.google.com with SMTP id f8so3222020wre.4;
	Wed, 03 Jan 2018 13:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=m/hvgdyz3L5rgDLUXaIeIOgBSYNNILH4ZQDKR02cnU8=;
	b=Tr8Wb7GLX7EgioKpc/D+BlYa2B72QaLfBp4uj3WBvp4Fg3lR/8049ED9gv665UOtjY
	Y8N07GbllKds+hYaKW/AkWW7xH558KjpPYj9qlIPdgNiIFX0HR7fjzzkPM/aLbhVM0Xn
	s/o3wiEiDqtErOR86zKOGCLs4iAtyRRj+b/kp70IN84CGtbrn3c1wQhRnD5vXITK9GuQ
	fIyNbW13NeRrNvUOXRiqtV5ExMNv+KrtNukSxjSfPbwe1lT/6inopIuJnzb+oSTt9+7t
	BRDEX1iREuedHPkkqtg7U89aH8wN/4ANGSNzkBmMRXt8LtVZ9TgTiLdt6HbC8O1Eph7E
	ykbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=m/hvgdyz3L5rgDLUXaIeIOgBSYNNILH4ZQDKR02cnU8=;
	b=kqC3HYnrqcCUOIaemUubfbE+aUfDEXRAjbqrDyEg/FtWlVKzwWD6POn5W3X0pDOsOr
	xLfmHjAMhI4QsmMWIHP5KXpW5Aq3yvWkTqOmkrNRjX1xEj/C+aENeeg73InhtirGAYjo
	Tdy85g4ki/hO2/R5zthHhJJ1VdMHf/rszbakzaDWOVMrSLBv4LlvJRA9NI9J1vrxALzF
	dwYMm43iGT4Xc+sPTaSzd6OI1pOxbmdlcprv5A8iS23jpz3bcCc19ZBoe9L4ed6a4myq
	V3iFG0ZHKfLl3lhQsvTFGxnsukZ10WRvKRZLBzs1FyZMHeHlw8SbP7XS0IO+vmhzfaYz
	LdkA==
X-Gm-Message-State: AKGB3mJF+4Uk4K1JIPfLWIuon6bBujnRyidV03t1RRYHaWrgib+f4yov
	Y/l2EsUuHqcpBnPmymVA7KXJb4fEiBquXIfjpXM=
X-Received: by 10.223.159.82 with SMTP id f18mr2485473wrg.219.1515016332826;
	Wed, 03 Jan 2018 13:52:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Wed, 3 Jan 2018 13:51:42 -0800 (PST)
In-Reply-To: <20180103162400.10396-2-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jan 2018 13:51:42 -0800
X-Google-Sender-Auth: V1hQTAmZ2gftusHd6VX_hXXzChI
Message-ID: <CAKmqyKOMRixd+TkE=FKwmQFctJAB_RJ1WFdnY2_8VteRszVB9A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] hw/sd/milkymist-memcard:
 use qemu_log_mask()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CKddXo/k3g/A

On Wed, Jan 3, 2018 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/milkymist-memcard.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index 4008c81002..5de3e00e2f 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -26,7 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
> -#include "qemu/error-report.h"
> +#include "include/qapi/error.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/sd/sd.h"
> @@ -138,8 +138,8 @@ static uint64_t memcard_read(void *opaque, hwaddr add=
r,
>          } else {
>              r =3D s->response[s->response_read_ptr++];
>              if (s->response_read_ptr > s->response_len) {
> -                error_report("milkymist_memcard: "
> -                        "read more cmd bytes than available. Clipping.")=
;
> +                qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
> +                              "read more cmd bytes than available. Clipp=
ing.");
>                  s->response_read_ptr =3D 0;
>              }
>          }
> @@ -163,8 +163,9 @@ static uint64_t memcard_read(void *opaque, hwaddr add=
r,
>          break;
>
>      default:
> -        error_report("milkymist_memcard: read access to unknown register=
 0x"
> -                TARGET_FMT_plx, addr << 2);
> +        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
> +                      "read access to unknown register 0x%" HWADDR_PRIx =
"\n",
> +                      addr << 2);
>          break;
>      }
>
> @@ -220,8 +221,9 @@ static void memcard_write(void *opaque, hwaddr addr, =
uint64_t value,
>          break;
>
>      default:
> -        error_report("milkymist_memcard: write access to unknown registe=
r 0x"
> -                TARGET_FMT_plx, addr << 2);
> +        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
> +                      "write access to unknown register 0x%" HWADDR_PRIx=
 " "
> +                      "(value 0x%" PRIx64 ")\n", addr << 2, value);

Can you fix up the secondary lines indentation?

After that:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair


>          break;
>      }
>  }
> --
> 2.15.1
>
>
