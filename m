Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp39724ejb;
        Thu, 8 Feb 2024 03:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdrl0NCNQVe+s3ZMSPNoFXvYfCQxuFC5gEOd8k/1NV7uVLgvfPNLOimuJXgEMe6nWjWMOl
X-Received: by 2002:a05:6808:1a18:b0:3bf:f395:818d with SMTP id bk24-20020a0568081a1800b003bff395818dmr2030915oib.55.1707392220618;
        Thu, 08 Feb 2024 03:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707392220; cv=none;
        d=google.com; s=arc-20160816;
        b=Pu761Q0XYuXektRYQ/KMoq370fj/h2KcLPjeQD3zuoK1hcgKwnauj//C2qVCVLZ+G0
         qEaBewZGYmMO4dC9m9AQusxui9/66yjsa7AUVctnhGfdyM7hSc5bj3m1anawYxP+4G6r
         b2D1Tc4FTTBQvheuOembQFZVQkpheEMS/NwHPzHgjz4tvpSeMjagmDOv17PUm6ipGeNj
         0RY1OJVXrxCxiMPwp23EoNxExtysD5+cWQWzZ0MpnEdfeYFFrpAUtygYy6B7fHW2gpYd
         FoewCiDQsgUlhWiYpuQo2pLWHvauSWNUUeH1y6G0KmpTKEVZWgRIRICqO1JvCcTTb8Hn
         SFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8x/YgZw1AGkDrc//lQ1l/l9Zb/CYBXjpvIK5sQ8j7Mg=;
        fh=yWJriInIEy/d542exoj1kJyyEQ5i1YfXMfzQ30gjvGA=;
        b=b/Mj7ZPRj1PK2XVCtBFQ9V97hDD8T1JZN184y6+Pm4vAsHuaGKJ4Z7TVKEA4JdOIDJ
         C5m558y+Rm1AeFcq/6mTq6gq3pRN0n7whzgjUN4G2sayE3bzL+Wpxs+T8Ni/AOEhiUSD
         O1iJkpAriOJxIQPQXisISkCvPn5T9gYSA2ONHIAfFB1pMwbHokrARQ1kZlorwKQSZUOh
         8wL1eV4ocy50OyBj2fpPixlcPFq/iEh/uBJkSrtoDbakdLeh26zfxU0wzaZI437RDn7n
         +icoqPBniSdJGBtFAjIcnjuJO1Sph2nzpdpYWcKxXAynzs6CEQzuVwtO2SnPATh3wmXT
         lzjA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4DA128w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVCMokafxudLcAt5PLg1FGsWFND6SVM3ORj8Lv/sv9xeuEWr8gkZ5FeP08d5hfUZ9Yy4qRvr3Y7XjkbLEkK1rEO4gPLrhro
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ac85a8e000000b0042bdc3f52b2si3215717qtc.386.2024.02.08.03.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 03:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4DA128w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY2hy-0001LP-GD; Thu, 08 Feb 2024 06:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY2hu-0001KQ-Vt
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 06:36:43 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY2hs-0006Z8-Cy
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 06:36:42 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55fe4534e9bso2051161a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 03:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707392198; x=1707996998; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8x/YgZw1AGkDrc//lQ1l/l9Zb/CYBXjpvIK5sQ8j7Mg=;
 b=v4DA128wj1T8bPBX98MzWJSMDWWkcRbSVKo8bkGltMgfZVKXaq43oLHRCLUxO6TFpy
 b2MYzDsi5F6UbguLXevoNG1jl0/bCHxgv3XO4GE9CR/lL2v+IdSbHykG9oUHA/UXtueH
 LcgP0HfhOoKCvacxjWAx07iWM0BzvxeV+bEION2K9AaZ7HOobZnfIiiUfIZz6qVvTDVe
 +4SopAlRwYnmar7IBiNMc2zOFZS7beBq70XEX+6TKXirzxy29E+345Wb6jxH6HjOLu/U
 YSODt7H3RfIG9RgZnEqjpkipj3//XOJtbk0aOt8+cR4+/SwnHJ2OYksPB3XLYDBSfJbo
 GDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707392198; x=1707996998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8x/YgZw1AGkDrc//lQ1l/l9Zb/CYBXjpvIK5sQ8j7Mg=;
 b=L7khHe+uxSkvtVr1UdYDP8/UAucCz6rqYm9M2TKnTMxn3k428cGtH2ThYCJUMIPnvY
 B7e92A4yZqzwUSXQ6W+xhbHwuMFPlUyTe6/xIKRzII8YukKX9p5vWVIKNKhIdNd8sC+1
 enF5joPOq9Pj5rb7i34iUNc+C2V2LkJi36Nyi00aUtaBFsgsv3XuLTI0Pz0yfhwNPbn9
 MiQSp8KsFii20wFcJvmiVFO/KrH4eaWou15gOuuYrc1JjIGM45vQC/VqjE+dcxv9rBhk
 CLpZur8yJjosuSy8IC2vOSzNbEXB9bUOQ+SrdBfaPnkvIry/y1bzpnmLVcMDknU6UkHE
 odaQ==
X-Gm-Message-State: AOJu0YyrRlqTdlIiSD+YtwOfvb0k7JpjT7G9Vz1BeQqdk1pX8ZlMi0Gp
 zKVmFdZNhUUy6/AggKB599J8BKmClFVlRnc29qizDZGfa5GJO+QXAHNZ3b8rkSs1rgCOcMsfyZ4
 oTU4uLNXTmwqIcsi73B86UNFRIcKphqoVbutbMg==
X-Received: by 2002:a05:6402:1b1c:b0:55f:99:c895 with SMTP id
 by28-20020a0564021b1c00b0055f0099c895mr5580279edb.20.1707392197849; Thu, 08
 Feb 2024 03:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20240207050308.3221396-1-tong.ho@amd.com>
In-Reply-To: <20240207050308.3221396-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 11:36:26 +0000
Message-ID: <CAFEAcA-JnKM9TCbp5=_Ogsnz+GSO96CcP1T-_5jTrSEXAyXc2Q@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Add support for loopback
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wml1zK5xpWmt

On Wed, 7 Feb 2024 at 05:03, Tong Ho <tong.ho@amd.com> wrote:
>
> This patch adds loopback for sent characters as well as
> modem-control signals.
>
> Loopback of send and modem-control is often used for uart
> self tests in real hardware but missing from current pl011
> model, resulting in self-test failures when running in QEMU.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>

Hi; thanks for this patch.

> ---
>  hw/char/pl011.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 855cb82d08..3c0e07aa35 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -121,6 +121,51 @@ static void pl011_update(PL011State *s)
>      }
>  }
>
> +static void pl011_put_fifo(void *opaque, uint32_t value);
> +
> +static bool pl011_is_loopback(PL011State *s)
> +{
> +    return !!(s->cr & (1U << 7));
> +}
> +
> +static void pl011_tx_loopback(PL011State *s, uint32_t value)
> +{
> +    if (pl011_is_loopback(s)) {
> +        pl011_put_fifo(s, value);
> +    }
> +}
> +
> +static uint32_t pl011_cr_loopback(PL011State *s, bool update)
> +{
> +    uint32_t cr = s->cr;
> +    uint32_t fr = s->flags;
> +    uint32_t ri = 1 << 8, dcd = 1 << 2, dsr = 1 << 1, cts = 0;
> +    uint32_t out2 = 1 << 13, out1 = 1 << 12, rts = 1 << 11, dtr = 1 << 10;

Please don't use local variables for these -- define some
CR_whatever constants at the top of the file for the CR bits,
as we already do for eg LCR bits.

We already have some PL011_FLAG_* constants for FR bit values;
you can extend those to cover the new bits you want to set here.

> +
> +    if (!pl011_is_loopback(s)) {
> +        return fr;
> +    }
> +
> +    fr &= ~(ri | dcd | dsr | cts);
> +    fr |= (cr & out2) ?  ri : 0;   /* FR.RI  <= CR.Out2 */
> +    fr |= (cr & out1) ? dcd : 0;   /* FR.DCD <= CR.Out1 */
> +    fr |= (cr &  rts) ? cts : 0;   /* FR.CTS <= CR.RTS */
> +    fr |= (cr &  dtr) ? dsr : 0;   /* FR.DSR <= CR.DTR */
> +
> +    if (!update) {
> +        return fr;
> +    }
> +
> +    s->int_level &= ~(INT_DSR | INT_DCD | INT_CTS | INT_RI);
> +    s->int_level |= (fr & dsr) ? INT_DSR : 0;
> +    s->int_level |= (fr & dcd) ? INT_DCD : 0;
> +    s->int_level |= (fr & cts) ? INT_CTS : 0;
> +    s->int_level |= (fr &  ri) ? INT_RI  : 0;
> +    pl011_update(s);
> +
> +    return fr;
> +}

I think we should not call this function "pl011_cr_loopback()",
because it handles all cases, not merely the "loopback enabled"
case. It also seems to be doing double duty as both
"return the flags register value" and "handle a write to
the cr register" -- I think it wolud be clearer to separate
those two out.

> +
>  static bool pl011_is_fifo_enabled(PL011State *s)
>  {
>      return (s->lcr & LCR_FEN) != 0;
> @@ -172,7 +217,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>          r = s->rsr;
>          break;
>      case 6: /* UARTFR */
> -        r = s->flags;
> +        r = pl011_cr_loopback(s, false);
>          break;
>      case 8: /* UARTILPR */
>          r = s->ilpr;
> @@ -267,6 +312,7 @@ static void pl011_write(void *opaque, hwaddr offset,
>           * qemu_chr_fe_write and background I/O callbacks */
>          qemu_chr_fe_write_all(&s->chr, &ch, 1);
>          s->int_level |= INT_TX;
> +        pl011_tx_loopback(s, ch);

This implementation will send the transmitted characters
to the QEMU chardev and also loop them back into the UART
when loopback is enabled. Similarly if we receive a character
from the real input we will put it into the FIFO still, so
the FIFO will get both looped-back and real input together.

I think we only have one other UART where loopback is implemented,
and that is hw/char/serial.c. In that device we make loopback not
send transmitted characters out when in loopback mode, because
the 16550 datasheet explicitly says that's how its loopback
mode works. The PL011 datasheet is unfortunately silent on
this question. Do you have a real hardware PL011 that you
can check to see whether when it is in loopback mode
transmitted data is also sent to the output port as well
as looped back? Similarly for input: we should check whether
the UART continues to accept real input or if the real input
is completely disconnected while in loopback mode.

>          pl011_update(s);
>          break;
>      case 1: /* UARTRSR/UARTECR */
> @@ -300,8 +346,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>          pl011_set_read_trigger(s);
>          break;
>      case 12: /* UARTCR */
> -        /* ??? Need to implement the enable and loopback bits.  */
> +        /* ??? Need to implement the enable bit.  */
>          s->cr = value;
> +        pl011_cr_loopback(s, true);
>          break;
>      case 13: /* UARTIFS */
>          s->ifl = value;
> --

thanks
-- PMM
