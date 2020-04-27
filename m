Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4562816lfm;
        Mon, 27 Apr 2020 13:17:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJXwpFClloQr/V6uQGkN+Qq/PmZKzeFWloGVTznt6/2DV6KKdy27lX+v7iePaqHEOwrZ0b/
X-Received: by 2002:ac8:2d94:: with SMTP id p20mr24016820qta.121.1588018647274;
        Mon, 27 Apr 2020 13:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588018647; cv=none;
        d=google.com; s=arc-20160816;
        b=Aj1OM1qoHbkBurrtKFavMXv5ihZBAtTd3jA/TIZki2+7ZeQHSob5nFqCf49Lq99vpH
         6gDD1yf/j1QtSM8DCUj2v+/Z2WsCyetFQz1bOu81XaMmtiT0Srwh63C5Y8IQaQEX+ii+
         H2W6ZH7WwDarfYvbKJW1ohTTTW1MQBXzppFz8n3+w28SymsxOkx+Q5wfkT4CkR7dgTfm
         LJtFzfNwfgnjyDXy673lpDVu+Y+WIQk4ckUcPswQrpBHXLbpFrRUbo9apC+1obI8Am58
         TUkMkW/d1B5jFNrgwyKoSJCy/MJ76FLLtS7Ju34wa54plnH784mehSiORSMQocDHR+gj
         01ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Coyf2FtT8xJGe7dQak7YvdPIn882vu160FqkJpe4Gjk=;
        b=o4Is1J8DjsvPv4Rtnqi8h0Sq6zNQ3kDYH7e+lV3uwnmO1MxusBRTvTMhsyn0vTE3nQ
         WaiFlr/V9SISMSz+8lVadKatpDFKhJnDc2p8JyODfzzhEfxTBc0pAOd6/9C7XLTzqjAY
         3wj5Ik2bnKUQOCz/VdtujM9hs0pzfOzVDmakrMrTgQ9k4VXoDi6ONu/UC3Hi4+jyQylp
         2iGniGxOSP4ymOEAl6KPND+ONvh/JoJWhevrk06KyQy+MjK3hiEUS5m0h8YJUsxGa98t
         +XUVOJE5eJFfepKk3NIpWfUMo+WJpUgQVU2p+QmRL/+Lz0zPJ3QCmPm3RucMfrcrTJCt
         paFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nP6sCS4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si1016492qvx.171.2020.04.27.13.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 13:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nP6sCS4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTABy-00008K-LG
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 16:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTABk-00007d-Jg
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 16:17:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jTABk-0000Be-8r
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 16:17:12 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jTABi-0008QF-NK; Mon, 27 Apr 2020 16:17:10 -0400
Received: by mail-il1-x143.google.com with SMTP id c18so2782894ile.5;
 Mon, 27 Apr 2020 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Coyf2FtT8xJGe7dQak7YvdPIn882vu160FqkJpe4Gjk=;
 b=nP6sCS4I3BtkZAwk0sA8b5sxf+o8opG0I3qIST120ewhCNoYkZdwS7M8XGBGdvNhYd
 GOlJKtJm4J2uYrIaYRa4im2zrSnksVWeZJGd8t2pzzhWRF2AaQvxCRm+nQl9ruFIlVxI
 pfSiiUlh25+LdSmGAYDuvpfZeacJM/MrdKfNBsZvHcMh2UvxBvwVHxurcldE7z1cpvGm
 PpOUOiC9z2afW+piwl6W032L1yVhvI2SBqnmIBllR8ByzCV6K2/89P9vhZbYBy4r/Ntj
 d/SaSVm2HxMiyOTNPOeaXnzBmel6f72Ub/XofWQJqXXzj6vcF8yCYCrhYcERImXj8TNZ
 K3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Coyf2FtT8xJGe7dQak7YvdPIn882vu160FqkJpe4Gjk=;
 b=mLbnevHd4aE3OEYBvczBUHbLRd9Z+9IgWKVjVYXwGyr9wk8dpWgN5UmI1QQaYiEIJp
 Ioz0IYMPu5gU9BM5EaUUrSfsQTKLYLXAoVYc7SMGaKhQfaKmfeVuowHfeELJOw/DhHn+
 7y13hNYge7atmIgJxmicAiUy+THlBWxKTJlAWAJLbZBOQ3h7xnMyIrvGmoRex/yUJOJP
 ARyIplony6ZBxFPl0f0kLUF0LLKjeakbWvNJJt2XVrAzMiGQA+8W1CKtylE4DSNPGQXH
 /LAhiJo6dtj/Cu3xwIHNe2FhrJLUWU7WLcPrCDVp+5o9xVeh3lVQHLt+Azo0hYKqZWm3
 xikA==
X-Gm-Message-State: AGi0PuaWBr+zRwxWj+zxTMTHfP0G3MIcVXuMwc2MHaPgQbdXpr5QXKpZ
 m67tqnMED4xKexAEE5KI8qxITLVQB1+qU1LJpwY=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr3750609ili.40.1588018628827;
 Mon, 27 Apr 2020 13:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200427181649.26851-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 13:08:30 -0700
Message-ID: <CAKmqyKNEH6vYoRxaM1SGEYjK9Lv6hxm09zHSgGPt1da8+sRYkg@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] hw/arm: versal: Remove inclusion of
 arm_gicv3_common.h
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::143
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUcDnvAeohY5

On Mon, Apr 27, 2020 at 11:17 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Remove inclusion of arm_gicv3_common.h, this already gets
> included via xlnx-versal.h.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 94460f2343..c73b2fe755 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -20,7 +20,6 @@
>  #include "hw/arm/boot.h"
>  #include "kvm_arm.h"
>  #include "hw/misc/unimp.h"
> -#include "hw/intc/arm_gicv3_common.h"
>  #include "hw/arm/xlnx-versal.h"
>  #include "hw/char/pl011.h"
>
> --
> 2.20.1
>
>
