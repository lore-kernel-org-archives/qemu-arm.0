Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1817495lfm;
        Mon, 15 Jun 2020 09:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytbVd4lRuOkqrMss/iPnAmY4yGwVbZiv6fSTTh396U55ZgqitfuR8+ttmnnxqhsIdzCSRD
X-Received: by 2002:a25:7386:: with SMTP id o128mr44463920ybc.266.1592236983279;
        Mon, 15 Jun 2020 09:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592236983; cv=none;
        d=google.com; s=arc-20160816;
        b=pqf5SgoFMdKjkEFo8+dmtBcmaujXsZu/hlS+LePCqUVP6MUSQORO4xKN7rnVNL17O4
         DgYKRFmnILwuKr+8iaPcHO/cIfov2FyEPSG2Zi3Ho7fWOwAi2ixdh2zCRr0PKGBFLcMj
         DMwleTNZpUdxBb//P9lpKT4egPHShplQV+UAMrwxNRfctbIWC0tRL460pYQUw9PyYqxd
         nSVxPddvB37oiB5caSDaQmKZFSzVh+QVkKGUFyZxHyLef5tvrQy0FENg9xwRWc2XaMjq
         Oabt9R16Dh9ftElCaMjZSjjYXdHwE0cRoQnldDGSMxdjjeIcPPte2CFgcG3qt85F6nWG
         GzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=I3yae7jKC5snnNCoi9B6lvanL8+kneVq8p+MpmcY3ws=;
        b=quJtzOrJB0QiOT2HKX1ppgdp3w2pmILgcTGa+C7zys2rfFwBHFhUntoo/6r/TmLY1b
         cvJK90IpoOWt7qjBgG7iZUFbrPEbu2Aau+ppVURbhZNhnSr8ZGKZIRI132PXJkRpzbHd
         5AiLjrLWwWyCF6pAlPCWeAc0QGQMU16BIKKiF9qpSUJ4c4gjPDyD9+27CRDaWh4ZY4Wr
         VCA34PHNm/3fBcgM7uau0s2xAbUA7sYIZGN7Xmxcxh29+6KSbGVAFpmEBT4m1L/Hoyn3
         oog9E+0b9FNAvuGbopOqXL1lZ3V+Me4LxnrJMpm0lvbccfmcYDLq5cA4N/HkhLXsAITj
         Cgug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=itP7RDKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si13425391ybk.196.2020.06.15.09.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 09:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=itP7RDKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkrZe-0001ax-IG
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 12:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrXj-0007mD-Gt
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:01:03 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrXh-00012v-7B
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 12:01:03 -0400
Received: by mail-ot1-x344.google.com with SMTP id g7so13476027oti.13
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I3yae7jKC5snnNCoi9B6lvanL8+kneVq8p+MpmcY3ws=;
 b=itP7RDKBY1KvCtFrJ0BIKHPe6o+xWSXMDcAe7+wC5hdyoEM6LMmMB08J2oXgwZ+AwC
 v1ka6Q7SMLNop8aFbhyYboih9E5PVXfFd7h6pVLO1CMxORK6RTODqG1zvDnbSqET5DnU
 OPZzCPm/r7BNtKrpqQ8i1DU4WhHelZrJFsXRqTP98bCcesoR28dxXcPFaZ7uh64So/DI
 2dXZdkFd614dOljqeQPetfmWLG7rVdErCa5xHSPrDJVgcC/JtBqq+Pb400ZyvZVZ6AeG
 NPc1QqpCbNuiP/1LUyK7DFvlcVUmm0/hxxu+DCiaqYwNK64c9EiPtg18tVuZp9WA9keq
 NwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I3yae7jKC5snnNCoi9B6lvanL8+kneVq8p+MpmcY3ws=;
 b=IqlRYf4Sr7ImMYv7IgpcPGIRvHKSw1OLeNvLrfuaK3KVdWy1Zc/+aVSWCCKfL6PWlm
 /9CYCVrWKiOuLgm1H94oo/ApkBCs7jWc+JXlEp177nF6hry4ncU8m/X3A+rV0M5y+Tqb
 Y0fNkzSEkOWfByCW0BvEcy03xGaLzAh5nc3Qp+JSUxooS78sKM017vsYctqy3zc02aFL
 y1kLC0xBf34TNX6/gaRHVHazVm7b6oCHH6Wcq2Ggkq46SEGl52OLZblNOy3ZGDuXiKPQ
 JvgUiJkSHq9AuE1tt+bM53TXivEfv02a87Pg+gFoaW6pWpZMCW90CAC1TsV2+yFsqe7w
 D/zA==
X-Gm-Message-State: AOAM5333xpeLNKQkrcyd7Loh0JGFpmLk79HLSriU8MSGcX4/odmVgSKF
 hoN2ifN8Fkrl3RAN6qOCZ66qZrNN0r1LUEyS79yQqQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr22633420ote.135.1592236859809; 
 Mon, 15 Jun 2020 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200612175440.9901-1-f4bug@amsat.org>
 <20200612175440.9901-6-f4bug@amsat.org>
In-Reply-To: <20200612175440.9901-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 17:00:48 +0100
Message-ID: <CAFEAcA9tMd0VxEm_O1yre36kWp0U48SZj8tMna25h5M02X-_VQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] hw/arm/tosa: Use LED device for the Bluetooth
 led
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6QAHYg1ikQv

On Fri, 12 Jun 2020 at 18:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/tosa.c  | 7 +++----
>  hw/arm/Kconfig | 1 +
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 5dee2d76c6..86d7e0283a 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -24,6 +24,7 @@
>  #include "hw/irq.h"
>  #include "hw/ssi/ssi.h"
>  #include "hw/sysbus.h"
> +#include "hw/misc/led.h"
>  #include "exec/address-spaces.h"
>
>  #define TOSA_RAM    0x04000000
> @@ -68,9 +69,6 @@ static void tosa_microdrive_attach(PXA2xxState *cpu)
>  static void tosa_out_switch(void *opaque, int line, int level)
>  {
>      switch (line) {
> -        case 0:
> -            fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
> -            break;
>          case 1:
>              fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
>              break;

Why convert the blue LED and not the green, amber or wlan LEDs ?

thanks
-- PMM
