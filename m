Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4289215lfa;
        Tue, 8 Jun 2021 03:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwb17DYZNYBaccFuXLP0P1eW747/LU593gSrN8EShH+EcCf3GJ5IOdN3wGX7vEztxAUfgl
X-Received: by 2002:a67:d819:: with SMTP id e25mr10686917vsj.18.1623148386683;
        Tue, 08 Jun 2021 03:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623148386; cv=none;
        d=google.com; s=arc-20160816;
        b=Nu5TAOAqoc0ecF/ERJVpvMUwii7Q4UV1jRhVL96DDyIzhJf9/5XpfzN1ub5Ddh7YfX
         +SuoF7v3yEvtEyTRXS3ELCpof+E2q8fn7FiurETJQFCAoGJENAKyyUdi2UAHOlZbziYX
         yESXIzL2ORf5289E7h+NmnscRTTCxSPDdNPcSPWn+uWTicIYxy2fqPNTiBluLT+NsYo2
         2q7zMYFSCnliKy3BakNe8jteP05JCI0vJglD8Lvi1e/DpFHwZ65kDfsO/hiHfF0vPz0M
         SWjbsmMi6TNhjC+e4wFxf3Vlx4z4JQgw3ivS6mr4IxUL6wSl/I/gh3IBztfHuAFBOBn3
         QHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHZxgBHr1Q7qnCvusFw/MCK4t+4kQgjqrniHPvUDYQc=;
        b=Dazo1bQAM62CMBEfkVbLrfBQP7cnzVtnjpND4WyL97ROxX+gOmJZtX7GmO1tPcGgsb
         5e+VwymP+uOS8aIc+05W7GisGC2aJNaIa7vXotgautKlaHrbUolnsT8s1/WKkK0bDTDp
         a0+eKOUjdHvzWZi68XFmq+1XNFBX/SEhrpT7L56+RnLLxn+MFXESfTwN+guTCjgqt6RJ
         uSC1gUS9JTp3ycanPtkx53Abt5sidvvWp2PIjyO9c6KZ438vr9m4wz+3gq6ZdG3Pt4Ea
         iRgD41iKRkKPs5CLgQwQu2tyVzFKjgSXs1U9R6e4bzdgWoCISYWA4v7c4rJPAdgK2R4S
         1+2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OOoGNbgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si5923098vsh.316.2021.06.08.03.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OOoGNbgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqZ2f-0000vJ-VD
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ2A-0000uQ-2Z
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:32:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ28-00018k-4P
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:32:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id l1so31804584ejb.6
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHZxgBHr1Q7qnCvusFw/MCK4t+4kQgjqrniHPvUDYQc=;
 b=OOoGNbgP1R8MM5bWhQDJaJr9icuF5WcTUG4aBwVyOHNlZz4MP+0bbZBoztJHmObkRa
 q5RSW04wnuu12C9Fv5WY91jnATvzKELhctRXnr2NGfUIxtygSLmHgzawxD4YOqq41WVA
 h0CNcaYfcU1ZsuOllnqwn1UhkkVk030LpIMskPEUUz2/fJlCLzZKXLPwYDxokbnZDp+E
 G2yXTyNiWIoZfQeuYz7F5x5RpBlGPnoaITsa5GPzI1OAhXtUSYZTzWnd8gOZ4Mc6fkef
 7Rxl1PDh1VvXHE/mimMYMDBeyahLnh12s3EL6kksV5+c0Pa5w+6vCPEi1/2IC5QOOPMP
 f7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHZxgBHr1Q7qnCvusFw/MCK4t+4kQgjqrniHPvUDYQc=;
 b=D5tqRUV3/FE9WxbBZdWSAlm7FDmrvHUACCDA9EPVxtoPMvnKgY93/pA1TdmnbhbNMX
 YpYeaS8cDqQLev+/K9R2zHiiroVyRj2mIvFXFfqHbQ8j2H/TFZgoT8b22t9C0AJJ+4Bw
 9bi67xnyIicjk9wriMyrA8Ac6zOI3X2CB3SllOHCiEgUGgZE+Nlbvt7HcbxOK2RjpmFj
 YjfyjP0RSpzrmQ3P1yOZts8mKzSqWvcpaxijdq6eJFGLPVZmxmSYMeUnVxeLT8yoC8zs
 jz2ULLupgi6q7jXttPGsQGxjDnpuDb/cx3hYkaQSENquAhbayXYwAirZ3/T3a2njs6W8
 t5Bg==
X-Gm-Message-State: AOAM532W7DdSfL6qN2lhzQVaLZy5h5VFKHPA3AVh0xjK45OYtmvRnYlR
 dw74xemh0n1TxNDxqV5bqyhBh6YdgUgkuf9RSLPq5w==
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr22782600ejb.482.1623148349833; 
 Tue, 08 Jun 2021 03:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-3-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-3-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:31:56 +0100
Message-ID: <CAFEAcA-+x4Tt9XZVPqk8ojT6C2jYXsoCkAkR00vbL-X3ykXdNg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] hw/intc: GICv3 ITS register definitions added
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ryTnIznbjpMa

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Defined descriptors for ITS device table,collection table and ITS
> command queue entities.Implemented register read/write functions,
> extract ITS table parameters and command queue parameters,extended
> gicv3 common to capture qemu address space(which host the ITS table
> platform memories required for subsequent ITS processing) and
> initialize the same in ITS device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

> @@ -41,7 +192,73 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
>                                uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_CTLR:
> +        s->ctlr |= (value & ~(s->ctlr));
> +
> +        if (s->ctlr & ITS_CTLR_ENABLED) {
> +            extract_table_params(s);
> +            extract_cmdq_params(s);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> +            s->creadr = 0;
> +        }
> +        break;
> +    case GITS_CBASER + 4:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = deposit64(s->cwriter, 0, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));
> +        break;
> +    case GITS_CWRITER + 4:
> +        s->cwriter = deposit64(s->cwriter, 32, 32,
> +                               (value & ~R_GITS_CWRITER_RETRY_MASK));

The RETRY bit is at the bottom of the 64-bit register, so you
don't want to mask with it when we're writing the top 32 bits
(otherwise you incorrectly clear bit 33 of the full 64-bit register).

> +        break;
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +
> +            if (offset & 7) {
> +                s->baser[index] = deposit64(s->baser[index], 32, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            } else {
> +                s->baser[index] = deposit64(s->baser[index], 0, 32,
> +                                            (value & ~GITS_BASER_VAL_MASK));
> +            }

This has two problems:
(1) same as above, you're masking a 32-bit half-value with a MASK
constant that's for the full 64-bit value
(2) here (unlike with CWRITER) we don't want to clear the non-writeable
bits but leave them alone.

Something like this should work:

               if (offset & 7) {
                   value <<= 32;
                   value &= ~GITS_BASER_VAL_MASK;
                   s->baser[index] &= GITS_BASER_VAL_MASK |
MAKE_64BIT_MASK(0, 32);
                   s->baser[index] |= value;
                } else {
                   value &= ~GITS_BASER_VAL_MASK;
                   s->baser[index] &= GITS_BASER_VAL_MASK |
MAKE_64BIT_MASK(32, 32);
                   s->baser[index] |= value;
                }

> +        }
> +        break;
> +    case GITS_IIDR:
> +    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }

> @@ -57,7 +322,42 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
>      MemTxResult result = MEMTX_OK;
> +    int index;
>
> +    switch (offset) {
> +    case GITS_BASER ... GITS_BASER + 0x3f:
> +        /*
> +         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            index = (offset - GITS_BASER) / 8;
> +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);

This will allow the guest to write a 1 to a writeable bit,
but will not allow it to write a 0 again...
     s->baser[index] &= GITS_BASER_VAL_MASK;
     s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);

Why VAL_MASK, by the way? The mask is defining the set of read-only bits,
so RO_MASK seems like a clearer name.

> +        }
> +        break;
> +    case GITS_CBASER:
> +        /*
> +         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
> +         *                 already enabled
> +         */
> +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> +            s->cbaser = value;
> +        }
> +        break;
> +    case GITS_CWRITER:
> +        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
> +        break;
> +    case GITS_CREADR:
> +    case GITS_TYPER:
> +        /* RO registers, ignore the write */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid guest write to RO register at offset "
> +                      TARGET_FMT_plx "\n", __func__, offset);
> +        break;
> +    default:
> +        result = MEMTX_ERROR;
> +        break;
> +    }
>      return result;
>  }

Otherwise:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM
