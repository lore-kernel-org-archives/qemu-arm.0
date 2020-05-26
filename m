Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp332987lfc;
        Tue, 26 May 2020 10:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyikGqTFN+vJnVOI/+aUxTTPLlaz4BfVvRAN71fub9iPoge2ahqWT7SOxnPfG+6tUizDsj
X-Received: by 2002:a5b:b52:: with SMTP id b18mr3294372ybr.205.1590514635660;
        Tue, 26 May 2020 10:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590514635; cv=none;
        d=google.com; s=arc-20160816;
        b=HnUpBJsARTvgnvKX1Wrk/5jKvdzAO+QVgJcAllvxcldQaQx5THRmrcrneOSUmmyQQJ
         SzbwG9UrguZPsBrqK1MSUAzLA2avC4Qc1JzcXrCAWbRkVFRBOhZOjLUnEEpg7jhb3Xet
         88KEZMen4RqxosSfi9kUixYeqirim5F1HPpEU1a63L6Vod39Chni/NMNfXy94sNL7K+w
         xxG+e12umcY0+KY8VjxNn5W0Kk+NbV2NYl16f5NRefh6tL0GTajO9QIw5g0JXTotCvo3
         2V9BAm9t6xhrMJGDaanDlXHa3zG14jcq+XqmXK9iFrnGOcUgLE+BVldUWSjZzo80Vz44
         9ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9TQk01LXu77Qb/2MeYsij309PkMXZLEcP4/iGwIEKpQ=;
        b=OXdG+wgMGKMB3FvC9kPZuhr0Qg6mlihuIN/lmONDxfdBnJjMWpchjjDiOgre0LEWVc
         dlicO4YWinwB1ajRm8KHvf3k7ENBx4d2ov91cPLcPmufIHXZZ+NXZZIRy8NPmFf2AHA0
         h/f+tKf/eIAaSUDzyBN3DmbT6E1AlJraVZWF4kbbTAhzeRmUZ2uByHOuomfcXr+1Zu+z
         LsZcTflX7sTmDb+9P0NySqiC8tHK42zKDRa1k9OqlGmTZh9JsddJPGevpi+pVNgriVUS
         vZneCj8pjsgs5Kn89/2gfY7VVmFaowjhvjzmV3Ipny1GrmQJ2Kd+6Rx29xP/Sa6XpbUw
         Lfpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NbyFaROV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si456613ybh.37.2020.05.26.10.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 10:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NbyFaROV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jddVq-0000Qx-UK
	for alex.bennee@linaro.org; Tue, 26 May 2020 13:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddRO-00035P-Ug; Tue, 26 May 2020 13:32:38 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddRN-0001Ki-Bo; Tue, 26 May 2020 13:32:38 -0400
Received: by mail-qk1-x741.google.com with SMTP id c185so7337194qke.7;
 Tue, 26 May 2020 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9TQk01LXu77Qb/2MeYsij309PkMXZLEcP4/iGwIEKpQ=;
 b=NbyFaROVHFJvx2ICUP1UEIeCigwWBnhxDOj0rcqPq3L+y5GofiFCWhH6bacKg1R0Ix
 k7SeIB+2eysZoA90xB7U4lFQmEkdFCVk5hBejcpFrEwUJ0QGDaSVSdapcx4C+CZcoD0M
 7JCM2tWdeHCeOLFfkOPN3k92bp1W4LR1c9V+Dz6Wnja9Uvnu42NVlZZ52F0UZZH+X1v1
 PTev0JL7Wa5NDIAF/3uXEb00L+ErhgLeFPzYI3Qa38GUL0Hw3MC3zlKisvYM49/m7FcH
 iyNoh3LCbY/9GeK21zpSykEK5GjGvGpq/f243KDDrapkhTuQlC2UHEhzqdo3tuXi4qFG
 02Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9TQk01LXu77Qb/2MeYsij309PkMXZLEcP4/iGwIEKpQ=;
 b=fnz0Ofie7p1pzs5+NZUgMnRFH5K12WUPEV/ZaiHCDJ+EY9V/Vg9FJ07lGwD2Gbh6sn
 kF2BLG6iYwgwddpZVvB7fyX3IBs7CydiMXDHGc/13YAQ7i2bqUh39qTY5UxmJdpfAaTp
 y+a3Gifzvk5nng1LTYZLOd2L6n9NMlMPSFClqXfIZUsZ/xhDJhOnZ8Si2Cg1bs2Ab41U
 A+5U1+kuAKh3rA9JGJIiKWE+MuKXBgd966Cn6b/H5UwZiWVhrCiVlzuN3sO14IIcM3bC
 5R1AesSVNQEOC6KmDRA0rRYW0ujlRqq0r1uVMbGyXazEuq2Wc/FLnkGNa+cDP+H1B0LQ
 pNYw==
X-Gm-Message-State: AOAM532Z5+BzYPeHXT5IT6y5IwlOH9VLSHe0SzdN0MG3aLZKGfsx8PlQ
 yOM8nQi9iaBcVCDWAl5VT2BxtlWV22pJwX9LrGI=
X-Received: by 2002:ae9:f804:: with SMTP id x4mr2619573qkh.164.1590514355126; 
 Tue, 26 May 2020 10:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-9-f4bug@amsat.org>
In-Reply-To: <20200526062252.19852-9-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 10:23:36 -0700
Message-ID: <CAKmqyKPz5zvPuiP7dNoni2rHq_jvo9wJ=c+Q-_xNDN91yf6gGw@mail.gmail.com>
Subject: Re: [PATCH 08/14] hw/display/dpcd: Convert debug printf()s to trace
 events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x741.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7+Frdxx+RsLB

On Mon, May 25, 2020 at 11:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
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
> index bb089a5f5e..72d4c9812c 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -157,3 +157,7 @@ artist_draw_line(unsigned int start_x, unsigned int s=
tart_y, unsigned int end_x,
>  # cg3.c
>  cg3_read(uint32_t addr, uint32_t val, unsigned size) "read addr:0x%06"PR=
Ix32" val:0x%08"PRIx32" size:%u"
>  cg3_write(uint32_t addr, uint32_t val, unsigned size) "write addr:0x%06"=
PRIx32" val:0x%08"PRIx32" size:%u"
> +
> +# dpcd.c
> +dpcd_read(uint32_t addr, uint8_t val) "read addr:0x%"PRIx32" val:0x%02x"
> +dpcd_write(uint32_t addr, uint8_t val) "write addr:0x%"PRIx32" val:0x%02=
x"
> --
> 2.21.3
>
>
