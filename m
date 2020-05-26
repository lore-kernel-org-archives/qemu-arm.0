Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp300552lfc;
        Tue, 26 May 2020 09:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6JFjdKd8b1VKlZU4iH8k4O3qT5Q/yjv4ysUTMCD4r3QZuIOPsv1YQq6RG+kBFPkYRtNzI
X-Received: by 2002:a25:f413:: with SMTP id q19mr3140794ybd.178.1590512047705;
        Tue, 26 May 2020 09:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590512047; cv=none;
        d=google.com; s=arc-20160816;
        b=r9OPpMfdyR9tg0LpBvW+p8JY6PxkbvmZDuXFWC+OBDsWtLiPpvC3qmj4GvaFzMDjiM
         9cqEdP7JU+qytgZZzADSTSAa2oIS2Hjiu61Z+gqtN1k9frAeGH1C5QQbXYdGzcAZv51d
         vbs8ubBhvF9S/I5tCKGt8/wtSN4xBbRnvUb/EAGzuBS8oMEczbDnpDxJg9ebF/CxYiaU
         7WO5N2RPNboXvK0j4ywiZg75jKz2YskGUTLj9QVktEEseIJrqnFzFsbwUaJUxby9d6bA
         Y63rqmFPQZ3hcA/hC5trDs2gPVl/lO5NCXQMlpvNTJOz4Nnc5wC71Db/VOg8KYt51Iri
         MXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cI2kBYN4v92zgki8aIm+KltLVDl7Q7AyJhU1Q/w/19I=;
        b=Fn5GlhfvRRGQXgjehNTxXTGaghhDzBrkYbL/w62YLfDYNklyPO/w5uySHApMtwRh5t
         dSLid7YNeYRfh3FzyY09afVoJpcJLsGAEq9ek7GG80pTC+YgWQrB+7RJqWsdUTGaWA5g
         szHVrn6P9aVN0Yb/SNKxS1pt0dWCaYERq+U2uhSPc/AfjmRnuSdV6NriIHyMWEXddSms
         RQnMkSmobi4GXW92U3BBViwqkwjjN2DS5AgYghMHjumfG9wZM4yjysSajSWwSF1SpabJ
         4/uyZ7EjjQMRhthiJQo+QZQfJTeSFwQfTM9i4WEAxotBeN84PXbkyK0tq9xZ4LHPciZC
         +NQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WH1Iy3+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si417978ybk.27.2020.05.26.09.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 09:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WH1Iy3+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdcq7-0005jO-21
	for alex.bennee@linaro.org; Tue, 26 May 2020 12:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdcki-0005A3-81; Tue, 26 May 2020 12:48:32 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdckh-00070P-1S; Tue, 26 May 2020 12:48:31 -0400
Received: by mail-il1-x142.google.com with SMTP id a18so3871230ilp.7;
 Tue, 26 May 2020 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cI2kBYN4v92zgki8aIm+KltLVDl7Q7AyJhU1Q/w/19I=;
 b=WH1Iy3+HM6GY0QWzvBllseWDzwXzXwH0BylC7P+OrrzTzKwlb0U0RKhkZ4hqdFNVv4
 7CE1CI6eAPJ68XfxUtCdeaJ5H80YGfoAumQQmLUjwMZdVQltnK+xtwi8jHO/eLXLkEfr
 hPnpNpEvfBobhfrau36aU1Mp5baX4u5gY2M3pKgHgzoV8aCWzIoort4z7FecQdXxf4L8
 u5uW3N8+ZEatBbiJM0Y+6l23/u+WuXNYhKduqoREIDel1TXf6AXhST7YMCxZUoLOy2Lo
 TUBJfw4T0jlRTLPI79WLkSjKRjz+7+n9YPMRIXW9x00o4L/Xgbgpoo1h/etI+FOdcdLj
 cMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cI2kBYN4v92zgki8aIm+KltLVDl7Q7AyJhU1Q/w/19I=;
 b=aWOFDSsMrq6bcK+M0iDcE9m1gu9QY97tbkXd4eNdK0rqNYtDPlwG5hrYhWxPq4/Z3q
 Yyy6OhqvfVBYS11ZWy8FB5OR6wTnIGtVfE/1NRCeLmMiS+HkwI8Dp/Olz2X3vvZ3Og3/
 UgX1xs82bTpBBYe2mj7gZ8wCQiQGWGm4fVb2uRgNdzewHWfsyIqS91oVB26ysnEgH9lo
 LNXCwEfPgOx7aYsE7X4v3OLKRWAu1rhFe2SY7efHM1QXNBn5zYnSg4XtLO3RoqlB+rnZ
 cM+mvdn/4XL82z//WUORf0pV09Z1vkFFqJ6LsaDDoCJf8qSbx0+MqiOIfkcU2/kHj+70
 HjsA==
X-Gm-Message-State: AOAM530bm6ftlOMh4E90BV8h1W76JMxUoqcffOPaFUmFqg8k2lcoXPna
 a6BsBYYf4tYaFzp8rIT2K1dik9DXZJmGFVCkVG8=
X-Received: by 2002:a92:48d1:: with SMTP id j78mr2059806ilg.131.1590511708940; 
 Tue, 26 May 2020 09:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200525034459.28535-1-f4bug@amsat.org>
 <20200525034459.28535-4-f4bug@amsat.org>
In-Reply-To: <20200525034459.28535-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 09:39:30 -0700
Message-ID: <CAKmqyKM=i6jp6y023ExLztqTeg6dc+O5Rv05_tYcCYi48E1-pA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/display/dpcd: Convert debug printf()s to trace
 events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcBiXnx2tA+w

On Sun, May 24, 2020 at 8:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Convert DPRINTF() to trace events and remove ifdef'ry.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/dpcd.c       | 16 +++-------------
>  hw/display/trace-events |  4 ++++
>  2 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/hw/display/dpcd.c b/hw/display/dpcd.c
> index 0c1b7b35fb..64463654a1 100644
> --- a/hw/display/dpcd.c
> +++ b/hw/display/dpcd.c
> @@ -32,16 +32,7 @@
>  #include "hw/misc/auxbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/display/dpcd.h"
> -
> -#ifndef DEBUG_DPCD
> -#define DEBUG_DPCD 0
> -#endif
> -
> -#define DPRINTF(fmt, ...) do {                                          =
       \
> -    if (DEBUG_DPCD) {                                                   =
       \
> -        qemu_log("dpcd: " fmt, ## __VA_ARGS__);                         =
       \
> -    }                                                                   =
       \
> -} while (0)
> +#include "trace.h"
>
>  #define DPCD_READABLE_AREA                      0x600
>
> @@ -70,8 +61,8 @@ static uint64_t dpcd_read(void *opaque, hwaddr offset, =
unsigned size)
>                                         offset);
>          ret =3D 0;
>      }
> +    trace_dpcd_read(offset, ret);
>
> -    DPRINTF("read 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", ret, offset);
>      return ret;
>  }
>
> @@ -80,8 +71,7 @@ static void dpcd_write(void *opaque, hwaddr offset, uin=
t64_t value,
>  {
>      DPCDState *e =3D DPCD(opaque);
>
> -    DPRINTF("write 0x%" PRIX8 " @0x%" HWADDR_PRIX "\n", (uint8_t)value, =
offset);
> -
> +    trace_dpcd_write(offset, value);
>      if (offset < DPCD_READABLE_AREA) {
>          e->dpcd_info[offset] =3D value;
>      } else {
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index e6e22bef88..00543f1601 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -151,3 +151,7 @@ artist_vram_write(unsigned int size, uint64_t addr, u=
int64_t val) "%u 0x%"PRIx64
>  artist_fill_window(unsigned int start_x, unsigned int start_y, unsigned =
int width, unsigned int height, uint32_t op, uint32_t ctlpln) "start=3D%ux%=
u length=3D%ux%u op=3D0x%08x ctlpln=3D0x%08x"
>  artist_block_move(unsigned int start_x, unsigned int start_y, unsigned i=
nt dest_x, unsigned int dest_y, unsigned int width, unsigned int height) "s=
ource %ux%u -> dest %ux%u size %ux%u"
>  artist_draw_line(unsigned int start_x, unsigned int start_y, unsigned in=
t end_x, unsigned int end_y) "%ux%u %ux%u"
> +
> +# dpcd.c
> +dpcd_read(uint32_t addr, uint8_t val) "read addr:0x%"PRIx32" val:0x%02x"
> +dpcd_write(uint32_t addr, uint8_t val) "write addr:0x%"PRIx32" val:0x%02=
x"
> --
> 2.21.3
>
>
