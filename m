Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1038235lfc;
        Mon, 9 Mar 2020 04:36:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vviP0V7HALkzZuhH+6FB7b8N7oNsL2cy/la2YKpB3xVVtQAiQyI5Yfmg0rtfYhZC5H08wFF
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr13682382qte.18.1583753761452;
        Mon, 09 Mar 2020 04:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583753761; cv=none;
        d=google.com; s=arc-20160816;
        b=jJ1DVtPg0F+7dVJ4NIpPdnAfRra4xRH5Z+olFIdkxsAHd3yCLlNp1UdXw7ml/1QdLP
         031GP3E1m1Pl17I2k9zh2s5gttk5rCaiqHsl1nNClXPE7mA1/AKM1ClOav87RN38HPWV
         adkcSs514S3NdzHewG/dw7tVtNlw/TgHwKbDoOYDD+G/0cranlnlTrHdXllA2TVTM5x5
         2GjywjQbINziVcIim7Mqjhz939lJoamwarBu1JfZiVI9i2dqzHy5IUnGHeiQOK0DYIPu
         EFUoQzf/OTd1gB0NgNei1nFHlvFiaEgrLFZdYaW01DM1Z171cUg1uiy6pzgTSRL3EEhF
         NZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bTtip2cL91MGIrg0Mc4JsWOrVFkqocrQtKDXBnTyWsk=;
        b=CvCGerw7Y1/V/M5cCaevSOcFMlHVRwlIxe3/djkx86KWhhTLBmpzcfusEaEpi69uL9
         FiOp6loctsH9KS8/W0gAUK9la4Rzg9kHQx46+DbFe25+ug31wxZ4L9tWuNsXrUy2ACpO
         6Ep6xSlq1OftOlChL9FMC47k7T/PRPRbC7G+tv5eZPdQddhJAEQxVEWzS3hQGBhG0HLU
         Ca3+N48QrwekML1YxyZpK4PjVZxqJ0Uv7KBwfufwTXpT62xfxrjASfwH4a24tXHliK6L
         wZnAudza3BQzal2k/6Reo0S6kmh0SXiFRo6Wbchp4NW3KbtKwXnCNCibJLiwuHgVnzVz
         XgHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Og1BL3ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76si5679613qkb.176.2020.03.09.04.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 04:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Og1BL3ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBGhU-0003DZ-TC
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 07:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBGhF-0002wR-7J
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 07:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBGhD-0001az-VC
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 07:35:44 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45429)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBGhD-0001aa-Oi
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 07:35:43 -0400
Received: by mail-oi1-x243.google.com with SMTP id v19so9750176oic.12
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bTtip2cL91MGIrg0Mc4JsWOrVFkqocrQtKDXBnTyWsk=;
 b=Og1BL3cenMD7H+Yljomz3Y6K9fOixWW0CJudQSIqkUiBjALZt1/45/b1dNqIHKk7IQ
 arZmwyINy5wpe4rrIznToh18Rid+sAy4+9UyEIoywdkIAN/Rwi7i3PJ1sdUXAD7b6IKb
 I/Z0q4EV/eLI/KEDl1eZkujkB4NfXeX/Ta1yb/WDHWMVN2QOQpJzfpUE2x+Mro2j2MPn
 Hn5Ywp6lBSs4jtdTgRnRky466VKYZuB23lYbQv0XhYbv5Av5gtiU7GZqzEH91dPuW9wK
 j55tobReXgC8BnVecDMM9PbMHVczgTFCxddv2LlWlrKpJcMdHDP8fe1ZSxfAGlCWMD1c
 3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bTtip2cL91MGIrg0Mc4JsWOrVFkqocrQtKDXBnTyWsk=;
 b=Mo4O49JcodnHUY54tHP+qtmosjaHvUWOkYVm5RDfGiPRXDcXIPZHR465U364gSfxyv
 8W/lz2st21Y1ZrwpopeQ9yRwoOGwPJ9wKT/cnJTL6J264nLuMg1+gLoLRbmN3+L2rRnZ
 GP8/IJUBRFwWOjtw2KqcHeAc8OMWLrVtNImu+ii6caiWzAo3JVkWJ7u1EkTESgZ0LTqU
 Sjleq9rM9CBE/npaXN+MvyWXbDDMbPtIrbEP8e34lxWY5I5UD/maMVBhkdiyIWL0Gf+7
 6ndolat1E3QUwPDX9KSHdzb9knboSaMrtjTy6FTCXGP0fDrDFskWAhpMkDxnaAIsKS3r
 X6gA==
X-Gm-Message-State: ANhLgQ0OEZVUjpSl1LpuFemAVRX9kBKD/vrVUV5a9u8tQCqr0Trzp2Xu
 SXvZhLYRg/IWii2tYQSkRCGgSheH8PD61QPu8lAANw==
X-Received: by 2002:a54:478b:: with SMTP id o11mr10542380oic.146.1583753742834; 
 Mon, 09 Mar 2020 04:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 11:35:31 +0000
Message-ID: <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZeVElsuEupD

On Thu, 5 Mar 2020 at 10:53, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> The current code causes clang static code analyzer generate warning:
> hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x0000000f;
>         ^       ~~~~~~~~~~~~~~~~~~
> hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
>         value =3D value & 0x000000fd;
>         ^       ~~~~~~~~~~~~~~~~~~
>
> According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
>  should be written to registers.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2:
>   The register 'ENET_TGSR' write-1-to-clear timer flag.
>   The register 'ENET_TCSRn' 7bit(TF) write-1-to-clear timer flag.
> ---
>  hw/net/imx_fec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 6a124a154a..322cbdcc17 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -855,13 +855,15 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
>          break;
>      case ENET_TGSR:
>          /* implement clear timer flag */
> -        value =3D value & 0x0000000f;
> +        s->regs[index] ^=3D s->regs[index] & value;
> +        s->regs[index] &=3D 0x0000000f;
>          break;
>      case ENET_TCSR0:
>      case ENET_TCSR1:
>      case ENET_TCSR2:
>      case ENET_TCSR3:
> -        value =3D value & 0x000000fd;
> +        s->regs[index] =3D (value & 0x00000080) ? (0x0000007d & value) :
> +                         (value & 0x000000fd);
>          break;
>      case ENET_TCCR0:
>      case ENET_TCCR1:

This isn't the usual way to write W1C behaviour.
If all the relevant bits are W1C, as for TGSR:

   s->regs[index] &=3D ~(value & 0xf); /* all bits W1C */

If some but not all bits are W1C, as for TCSR*:

   s->regs[index] &=3D ~(value & 0x80); /* W1C bits */
   s->regs[index] &=3D ~0x7d; /* writable fields */
   s->regs[index] |=3D (value & 0x7d);

thanks
-- PMM
