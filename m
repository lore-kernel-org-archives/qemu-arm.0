Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3347910wrx;
        Tue, 19 Feb 2019 04:29:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYC+gJXj5MJhg1SVHRGLzzCup0tm2U70SzmPGYJfIgVABb3wXY5QoOgjuRAm+QK+Mc9xNp7
X-Received: by 2002:a81:8606:: with SMTP id w6mr23583033ywf.105.1550579396453;
        Tue, 19 Feb 2019 04:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550579396; cv=none;
        d=google.com; s=arc-20160816;
        b=TuqJZL/Yei3kpG8GIf1dFVBx2v+l0S3sLtJJkakRuydXhHU57s4ncWAZBgWY1d/aNh
         me4oCJAwC65cvGVYNLIjyqL0S9bX0Gn17pOpLU6sPHbi4wNvLwDChshja61uv7iKfDV7
         gQ3z/EQoS4fNP7SPxR+ToLkrXo3FOj4c4UVM/+nd+ajA72IxfDEB+JY5fyNMWSQ5D6ej
         yKC4to29eoeoBYbHpGC5NmUsMKWbu+Uw3K0Dms8+my0uKaC6MVqfdFw8zlyAjnUh9PF1
         RHG/CYp9GW+Rt8FaRcaSxN/8PjyTxle8PwDGnDhdF2IRFvftzwWpbnjQSBn1CMxEe6fb
         FEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JjWGn3qT69J4mEWxH2KkNyLSRzJyfBUjkD02mzo9PqU=;
        b=P/oq2MK3UxATIn7xGFR6dz3+NXID3EMZ2fyx0Dy0VThoHN4LfeFEA+KYU00f1In6aW
         AQAFKM8zYR8poQSMlWmn70qVhNyM78eV+zudL7AqjPZCLroOOkuWqPD1ymXWJKL20h9w
         RJ0ChkN6G+2m5cF5aHwZI/AAb2yWK5sLQkfMLX/8bHuSdNe8/psKvglRgY4sECo3jQwo
         TNaZEw6UKFtGwsUo/K+PGztJIgb93x3vQW6+oxUFLpQQGjd+sUdL5pGFBGipGwf48xGv
         dnzlLFprGw4BjYYuYlOyNLZFn00IKWTkLTnlqWo3eztqPoM0N1MW8ZZv+KdYXFH9lJaZ
         jXKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mIFKlJy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si9189277ybc.344.2019.02.19.04.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 04:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mIFKlJy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw4X5-000499-Vr
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 07:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4Wy-00048h-Vj
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4Wy-0007km-1I
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:29:48 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4Wo-0007Q3-RG
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:29:40 -0500
Received: by mail-ot1-x342.google.com with SMTP id v62so24967440otb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JjWGn3qT69J4mEWxH2KkNyLSRzJyfBUjkD02mzo9PqU=;
	b=mIFKlJy+L7IqGuAq4uuGmhhGW5KmHcXLn/m0EkLOBlHTFJPX866r5KAd2dd1jbOFmp
	p7drSJ//IGmfK8LVnDQHgqwuAtp5evApTP1wvaLun5ut+DwkKqChLdOPxOACWZsM06TL
	HmVmFtM6L9oSbeQPBiPOTauiQhgkL6GAdbA0AWHE59SVLXFSVe4vcawNnGIIjgLNcn9l
	luBk35lK2YWKvjLKvIDV98zQ1kbprmueps5YVvqQ0byNKPdXn5pP05Z5uftPtmwwq7sr
	u4knH8vydx8vVt2b6aDNRG+IXfGfhIEiOjHdXcVTMc02ucpC0KqLbfcu+jo2zd0MdVlG
	Afbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JjWGn3qT69J4mEWxH2KkNyLSRzJyfBUjkD02mzo9PqU=;
	b=Nmg/ubtABdw9mj49I/FP8pk5FN3mL55cYBgUkNPkbAzRRdMeAE2Ug+fIcX7i9nIMDz
	e5fKKJ+KBGmWlqVwsIJPJpPjAD8mhRGruLj3zo/Y6Yy+M+ptuXo2Djv102MtOg3NyY0X
	eGoUIclqje55O8BvVDK0Bj8rNoBv69V4vTW3O4V619QB53eBXynhVwRLohPjhWnUi8X8
	2BGTzKKhEQwS0Pd+u8Xq7ndmTUxj+tCq1d4Xd1PeCv+RenkzPIVWiuhnPKfA5kYhNppn
	LKkjDRNXC91weZO0yEeC/SeNIumYXqvZjzgVHzOZSpvLLkluyJLifWaju5taJig3sgFb
	P8/g==
X-Gm-Message-State: AHQUAuaHZth9Xp5UU524Jxx8NKoKGalhCmNm9sutSkJfb6kQ3T0dc0lY
	0tEr3Uc/QZaP4wNyhLLIOa2uv1RzV0KV+/oBEwCBiJMWql8=
X-Received: by 2002:aca:bf82:: with SMTP id p124mr2184604oif.48.1550579363780; 
	Tue, 19 Feb 2019 04:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-13-peter.maydell@linaro.org>
In-Reply-To: <20190214125107.22178-13-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Feb 2019 12:29:11 +0000
Message-ID: <CAFEAcA_Q-ZSnaCE2-xQii4gGwwDDck6BM8PvRxs8d0xRMMtogQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 12/14] hw/arm/musca: Add MPCs
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5fyS0H0tI82

On Thu, 14 Feb 2019 at 12:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Musca board puts its SRAM and flash behind TrustZone
> Memory Protection Controllers (MPCs). Each MPC sits between
> the CPU and the RAM/flash, and also has a set of memory mapped
> control registers. Wire up the MPCs, and the memory behind them.
> For the moment we implement the flash as simple ROM, which
> cannot be reprogrammed by the guest.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musca.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 147 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index 8774e0b87b7..5fadac8c09b 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -27,11 +27,15 @@
>  #include "hw/arm/armsse.h"
>  #include "hw/boards.h"
>  #include "hw/core/split-irq.h"
> +#include "hw/misc/tz-mpc.h"
>  #include "hw/misc/tz-ppc.h"
>  #include "hw/misc/unimp.h"
>
>  #define MUSCA_NUMIRQ_MAX 96
>  #define MUSCA_PPC_MAX 3
> +#define MUSCA_MPC_MAX 5
> +
> +typedef struct MPCInfo MPCInfo;

[...]

> +typedef struct MPCInfo {
> +    const char *name;
> +    hwaddr addr;
> +    hwaddr size;
> +    MPCInfoType type;
> +} MPCInfo;

This should just be "struct MPCInfo { ... };" to avoid clang
complaining:

hw/arm/musca.c:165:3: error: redefinition of typedef 'MPCInfo' is a C11
      feature [-Werror,-Wtypedef-redefinition]

Since it's a minor thing I'll just squash it in when I
apply this series, assuming I don't need to respin for
anything else.

thanks
-- PMM
