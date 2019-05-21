Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1462542wrg;
        Tue, 21 May 2019 07:25:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeGMU3Q+yctiOPdEX4MwnXFxNhSZhT1XnnTRdXzSRZ30gM41upJNOXErl5fprGtelwIKOD
X-Received: by 2002:a50:89e3:: with SMTP id h32mr22306550edh.51.1558448742167;
        Tue, 21 May 2019 07:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558448742; cv=none;
        d=google.com; s=arc-20160816;
        b=0nrgZUxzXsQoFUDUcLaBwMfkFUupfGRD9Xv6ahecsCf+lyGJLOiH6XzNGtxqAd1/Jb
         3ALsvmFkdCmPgfDTQ1/5f0vW/uIsrBnm8aPZ5O+b8FU9zphPydwyxSIT+X6kQXiIDHfx
         SNoXe18jpDh11lJxXXOgMlARJB8dxS/Amuykm2mvij2T6LWWHup9ev9NV5jm1JtGsLKN
         gb+YJk/L3a8xa4iJielPRNTJxC40ZMJyotvfXZej2R0gHtIgoW5NrQSIaa8Pa+kuGsDP
         xt6wJtwT9c6xncIhSoSAI1ds5aAoVKwbnvRs7a4eY7OypEifF3Q9lNJe5DdqtUBqJdVO
         FAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8hMg6Mf31pTr8e2qazKiIGVX2fefsXToDRaN2vaHcA=;
        b=Ol3KCZStPa+OtT41T8fvZWdfDpEgjiGvYyYLnxqhjx4bT2RAJAzze4MDsEWmvN9d4n
         M+T/RG4KsJnR69oUmZfCRWi+XDMXpGdHFPLGF3P1i147ltcgwqdAYDiGqnhstgMNzFX3
         lK697uKHcOFQNbLZ8ELgmY7/NGX59sAfWo4qHKu0ptwB0gfKixyg/6qADh+TXrnQzTmL
         7PjW5btu5HScYXIqRpzNgaOfdeCJHBmAe4cqyxBqsz64pDSwlkhrbWwEbwdhLrmELqe0
         5xT/K4PAHw23gQXpnhzOzXS3ZppkILgK+R2qmrL1NrhYrkUI92pPgZiwq3lIHL7Zg53x
         WUCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qp+Q+scM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a33si1317810edc.380.2019.05.21.07.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 07:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qp+Q+scM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hT5i1-00049q-9X
	for alex.bennee@linaro.org; Tue, 21 May 2019 10:25:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hT5hs-00047P-HS
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hT5hr-0003dh-MO
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:25:32 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hT5hr-0003ct-GR
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:25:31 -0400
Received: by mail-oi1-x244.google.com with SMTP id f4so12941561oib.4
	for <qemu-arm@nongnu.org>; Tue, 21 May 2019 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=b8hMg6Mf31pTr8e2qazKiIGVX2fefsXToDRaN2vaHcA=;
	b=Qp+Q+scMuNBTWnOXtlLGWMX3ZhQYML8IQyIvRVFzS+Z75e2feI49VGmMhBNjcT6M1S
	h2lt37r660Sj8cHivKhgkhLhgHD3slldn85jmbHqomgOGY28+BExXsGY1zqHzwpWJ5TR
	sOSXPOjJwc27Ol+8oVuqOD/IiRBNI9dgI2yh7iKMRAO5FgYA+vBN0ZwaCW3CEnAtw9du
	tuOork1S1wdA3cBkcRgkEL2Grh2PbsTmP+TDsStq9gLFDUgnq4n52QQDRJc+PZO9Ppm6
	5QIO9YOXt4UF4VxB7FNF3wNzf22z/aZtDHPuwqHGuqhNXDwCywnf/FRDqr1X2L8LxgA/
	rgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=b8hMg6Mf31pTr8e2qazKiIGVX2fefsXToDRaN2vaHcA=;
	b=g69zu1cVW5vxNmRAjrzYAbFjDU/p9LoZBjLg2k7h+1uaJ6fBKRWNf+xrJ5lWobfIXS
	VntPM19gw90I/kuriuJeNWucWXTwZOEAsiTlI8v3JYvxfoC+BADLfFUJJlIjywWykl1s
	nQsZrN5kkL7C6SUg+jsqmOc641MRKUXkazmJXSeFEi/M1bqY90Drw7sI2LGPJeFhEt+4
	cojb+OILvpeJu3liSK18L/Z0Nrcnkr0qGNCV6veeknPZpnEDj7UBz2FHsIyFx+MT5O9Q
	MUPjC8b0UTw7RzxvjTyS68rYUx7gtMSlaT3ARlGLdZxD+JJwqZeLfmLqF17WNi/PBClh
	Qr0w==
X-Gm-Message-State: APjAAAX4l/iKKLg/sVQfrPVVjXzkGcG0zrMcIapfOLZdf8AgEir8Kaoq
	DRlYyWySiEzhVkhNGbAqlLkuBLRMQL5DAi2H2PuE98dwjaU=
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr3682643oif.98.1558448730586; 
	Tue, 21 May 2019 07:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190520162809.2677-1-peter.maydell@linaro.org>
	<20190520162809.2677-2-peter.maydell@linaro.org>
In-Reply-To: <20190520162809.2677-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2019 15:25:19 +0100
Message-ID: <CAFEAcA-pZEgQ8z61gxxJW=-Oc8O_Eg9Q5vwa=1iU4e11LSePAg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 1/4] hw/intc/arm_gicv3: Fix decoding of ID
 register range
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zfhFgvVUUImb

On Mon, 20 May 2019 at 17:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The GIC ID registers cover an area 0x30 bytes in size
> (12 registers, 4 bytes each). We were incorrectly decoding
> only the first 0x20 bytes.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_dist.c   | 2 +-
>  hw/intc/arm_gicv3_redist.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index 53c55c57291..335386ff3ac 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -533,7 +533,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          }
>          return MEMTX_OK;
>      }
> -    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
> +    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
>          /* ID registers */
>          *data = gicv3_idreg(offset - GICD_IDREGS);
>          return MEMTX_OK;
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 3b0ba6de1ab..9bb11423382 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -233,7 +233,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>          }
>          *data = cs->gicr_nsacr;
>          return MEMTX_OK;
> -    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
>          *data = gicv3_idreg(offset - GICR_IDREGS);
>          return MEMTX_OK;
>      default:

Just noticed that I forgot to also update the case statements
in the *writel functions :-(

thanks
-- PMM
