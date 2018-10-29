Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4863681wro;
        Mon, 29 Oct 2018 16:48:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d4Sg7+o6s0BLKy+BDXDvosb1qzm/aNQWWzCup5e5dcx/0+xI/ewd+9EAoqb66+dDnekbJq
X-Received: by 2002:a0c:a1c6:: with SMTP id e64mr7358470qva.196.1540856930140;
        Mon, 29 Oct 2018 16:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540856930; cv=none;
        d=google.com; s=arc-20160816;
        b=QGFFlXx9IWnIM1R+WfTrD7Mal1HzH8gM8Qxl1BMeDkVWdQS+GeZ4sA7G7v6GGOuYvK
         LtAcQwOmkYhvvnEdf+i0ZrSwExCSehB8oUkHe3zrnOuYC44FogLBVTYJ5fyNeQs/nk4M
         CURGWbwtG5sR1y4XwD7UAq9etq2PQ62hPrv1E8Tg1rVpQFUS8NceEKP4Z9ZuAOAlwJCF
         rbp3BLsIfJm4hwuX4KQu3n0y3zQqr/KtCOHloOPflOGNlxHet/vbcp6zbufxvPqHOEAm
         bnTLBTeWVIkIivEJwFqGpkwdKD5g2wvl71n5MfwnvKfalsb0ZM6IikOKhMKmUnN5kl3a
         FUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HQ77n3TJUrtEsfuqKJhGHHIhDzBlXQElt5ot0i4hlKg=;
        b=IAmqgvGjqh349TYj7utK9CDKj6wipogw4Sb3Fx/FpoT+mMDS/WV/4cPJxcOLpRTgCA
         n6FwFtdFHu6LDfZ/33avuRImBkZSHXh35/9Qyk4SjhbHdtmppVP3LUeqArSmBKARxPQE
         Lu/ASt6T1WB5VbN3xBAN6C50aBcHqB9Rgm+4THtdKaQ2/cl052NG1Duuihkhu4ILt89Z
         XGEvK5mw7j0DD5vm3yy49SZlVXN6YzrEZD3FQfLB0An5QPDJ7JukzegQxrKH8Cxq3WM/
         WV575fuvQjuxouWONi1YfieZyTfU4hf4tdbh0MhIFAQrUmMB2yt4ilUF7Qg1cCVE86/S
         8hzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AjUC7ua4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p7-v6si4561521qte.210.2018.10.29.16.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AjUC7ua4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHHH7-0007sH-N9
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHG5-0006Jd-Hx
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHG4-00059S-SF
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:47:45 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:42680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHHG2-00058F-Qm; Mon, 29 Oct 2018 19:47:44 -0400
Received: by mail-lf1-x141.google.com with SMTP id q6-v6so7444352lfh.9;
	Mon, 29 Oct 2018 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HQ77n3TJUrtEsfuqKJhGHHIhDzBlXQElt5ot0i4hlKg=;
	b=AjUC7ua41TkdOiRyXSo3rNvGibQdnkfMjjzHFSreR0smqIc7ykE2R8yuLWH0QfaTw9
	FfYjSpmy9RVeHMnKDY/Eh5yM4ozYoG44Q6+AqcN66PU5T5VEblSp7xihyrnAFV0VarIm
	f1nZO9x/GB13Vq2uLMDckZ8SbNBhD6ug+/1ONlXb04EeOK+1yw4YPSgD6q/MeRwd9g6e
	TjGpkm3O24ODQWHpa6hU3nW3C7lIfQQmhEauBm7Fdu0H0Vp8DdoA7xUqUd8mQmxyY05l
	4B1WEwYzzoB+KedB2V+fThRf8qhgKEfYiYItabVIwwoUt+lka75IZ/h1AjlxpxzS0sYF
	dWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HQ77n3TJUrtEsfuqKJhGHHIhDzBlXQElt5ot0i4hlKg=;
	b=Foz+ZfYoKqc+QGTteKTyarhUtb3a4GYqsSk0Ye+27HQXKjxNSxSFBOLTN0/FCyi+pI
	zWBfOACRsllmrJ7y/nNWSQHdd/3reTACPM5d3VLiXYRL7dZrxFzn76D7LIpmveCuW/a9
	+YFIivp3mBmh1t55zVz9CV5wCZN5vrvJf7SRViU2E9sA7KMknsmGP+jX6SgOkwkPyY8M
	T60N+YgDJ/ODN35vspF/eSiLXue17qh83bsAkOIDvlcw7ZwlVOSdYkf2hL7MgJ/La5cc
	IQHb/C49eGR852OIuYvbXhhUY+8i+rpRmrjJwAKDSES+VT2mqW6Dn/Aatrd0/S6hcQIs
	5HSA==
X-Gm-Message-State: AGRZ1gI/vn6wN6CZmUTqx9y+XzTkRiUE0YCgsSFNG+lhDf4JC22BkyTQ
	YWj9l7d4qprtSykmHM7FNp3hyMe6gkoQi0rFvvk=
X-Received: by 2002:a19:4e9a:: with SMTP id u26-v6mr400463lfk.91.1540856861350;
	Mon, 29 Oct 2018 16:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-4-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Oct 2018 16:47:14 -0700
Message-ID: <CAKmqyKMjJvt3zQuaTc0yX-LaZhTaVR=CQQ-3uKHw7sCNF_aQxg@mail.gmail.com>
To: philmd@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] arm: exynos4: Add dma
 support for smdkc210
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: izwwOTaB0cjc

On Mon, Oct 29, 2018 at 4:21 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
>
> QEMU already supports pl330. Instantiate it for smdkc210.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Use pl330_init from "hw/dma/pl330.h"]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4_boards.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 750162cc95..b36f407a52 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -32,6 +32,7 @@
>  #include "hw/arm/arm.h"
>  #include "exec/address-spaces.h"
>  #include "hw/arm/exynos4210.h"
> +#include "hw/dma/pl330.h"
>  #include "hw/boards.h"
>
>  #undef DEBUG
> @@ -49,6 +50,9 @@
>  #endif
>
>  #define SMDK_LAN9118_BASE_ADDR      0x05000000
> +#define SMDK_PL330_BASE0_ADDR       0x12680000
> +#define SMDK_PL330_BASE1_ADDR       0x12690000
> +#define SMDK_PL330_BASE2_ADDR       0x12850000
>
>  typedef enum Exynos4BoardType {
>      EXYNOS4_BOARD_NURI,
> @@ -171,6 +175,14 @@ static void smdkc210_init(MachineState *machine)
>
>      lan9215_init(SMDK_LAN9118_BASE_ADDR,
>              qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
> +
> +    pl330_init(SMDK_PL330_BASE0_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(35, 1)]=
), 32);
> +    pl330_init(SMDK_PL330_BASE1_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
> +    pl330_init(SMDK_PL330_BASE2_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
> +
>      arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>  }
>
> --
> 2.17.2
>
>
