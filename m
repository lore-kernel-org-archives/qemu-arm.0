Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp905386lfc;
        Thu, 12 Mar 2020 10:19:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvp0APY6Rap7kSvmxAqYnlledfqCmSlygETWiWh5ENHatLy378yQk0XJgsHORBnyfP5N0pe
X-Received: by 2002:a37:702:: with SMTP id 2mr987106qkh.134.1584033562882;
        Thu, 12 Mar 2020 10:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033562; cv=none;
        d=google.com; s=arc-20160816;
        b=JGsMVALqUjdeTB3t6qcvmT+zsDRPyIqjrZt3a9ZElZG+LZm5h+OsqrlZLvX1VnWvf3
         O0bIOxUxgv7AX8ZNpp4a50P8k54MueU243vnEsXE4wKTDSCyFxGyHM286zMQJNtWE+dI
         ltmczgnJQq/6mRRat1/B8DXwVQYjBmTqBiP6UUUSJgCrdEeRyIsBqPqrxzPkIsijVxpq
         ZVh8zoZcWDVhD5m9zI0z2BXTkPm8yccqUSDUBdjPd0wbw6pdOMCEvKjR8tZK0+7pz/Jf
         W/PIisYC+6sSrAL5UwX6Dp2aow0jpkkc605ExZwpXkR2X1eBnm6NDQy+UuvBFUQ55epc
         kDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sG2XHxtL29liFM8qAyu3jpV/gaMswIfwBnXLqD75KIw=;
        b=FvQHJyvrGNscnTUamJ24L6Hkaofg1dnbk/aXLqofzjJQ1h0qfmC+WFh5kyLKYIRRNZ
         u+WYOgp4gNqqixQirvvKT2fL1TS3rTultyfYRcLJGwWybDee7brpIvkM5BEbBTF2PJLJ
         CJCEU6WOw/5GEG9EEFBq6Scu0O7yTxHpWobN2VrtZk0sTulUX55YTTrCtcPETdOfJHS6
         m5gx3iZ46RYkEzhIzhoqZlBUIHr3v4CE8qSrAm1PZNthTXfethqgLmizUf2bX7VZTpMM
         H/Of8zXChX5ctupggf3Vq+UwFcp1YtW+H8k8vjl0qAjBf1JeFkTKik5zOM5VIGaDoDXX
         BsIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUY0rHtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m130si1045402qke.23.2020.03.12.10.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUY0rHtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRUQ-0007VI-Bk
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRCf-0006IO-3z
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRCd-00084y-UP
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:01:00 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCRCd-00084N-PG
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:00:59 -0400
Received: by mail-oi1-x242.google.com with SMTP id g6so6208777oiy.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sG2XHxtL29liFM8qAyu3jpV/gaMswIfwBnXLqD75KIw=;
 b=tUY0rHtEFZga2G8zMqXXlIUYHIZ+tIEwasI8rTQMdtlszrxnH+GZ3gyv1DaUQpyy0U
 Xy7GJ3pDw0Rqp+WhO1ASz0i+TFyU1EE+RGBVR6amSqNjbVhfb/NDIQJXym+0DbFM6wt6
 eirhDm+K1X4e3rUFsDw+0TpAAMDoW0NV8YCk+6njKAqUpsJHG/n5JA6y2nTuieHyVMIq
 guR1Lcl0/aJiQljsjhtVRY3d3MGaW9KKcYE5vHpLHJv69JSqkLqa+o/q+J0B7bFsi7Gf
 7rG92FXA9u9sc7ygSEVSORBsjyh20/wDDjOfU2X2Dhbwmlj8lyq6BsDroqzQo2ecBX8z
 RbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sG2XHxtL29liFM8qAyu3jpV/gaMswIfwBnXLqD75KIw=;
 b=BfFBwGbUmImxv0F0sFMs6m/2NjJ70LUI3FCGYNFv8PqHwdY9kSXOv/7psOtvV9nOVC
 /1Vrs6QujqtFLhU36d1rCQMnPPB1AHmy6xW+FpH5BaVAsPzB+MlsTiMdT+vGRhnGOPmO
 WyuYcffPhXvLG+UBkvHzw3NRsUQmsy4qZ7xLny/HmFxu9+im2kESm0S+GqFIA9mxBAhW
 CU0CrAmiVfG54WOUgtcSSOJCR+yd2CpiBXDnHl5M0/TeNRfJdxgEAimPp7u4ucXkB8OW
 GhBc6mfxPHN+grWKY8IJgIZyWgeuXlnhpYdioh9lvHIsxR0S102KRyIy7XjgenxImBBT
 3DjA==
X-Gm-Message-State: ANhLgQ0YucuGL8Xqi7x2Esti5mie5/6iRb//aOMUlcigYO3aloBahaBy
 o47rnOuxXD81YGW3yb8mlLPdq+kb3TBhn4SH+XOyXQ==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3226853oic.48.1584032458496; 
 Thu, 12 Mar 2020 10:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
 <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 17:00:46 +0000
Message-ID: <CAFEAcA-q4t3yQcHaHzOGx2GpKpuW=kti51myuFK_K3aieRY3dg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v21EWgv+hS28

On Tue, 10 Mar 2020 at 08:08, Chenqun (kuhn) <kuhn.chenqun@huawei.com> wrote:
>
> >-----Original Message-----
> >From: Peter Maydell [mailto:peter.maydell@linaro.org]
> >>
> >> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c index
> >> 6a124a154a..322cbdcc17 100644
> >> --- a/hw/net/imx_fec.c
> >> +++ b/hw/net/imx_fec.c
> >> @@ -855,13 +855,15 @@ static void imx_enet_write(IMXFECState *s,
> >uint32_t index, uint32_t value)
> >>          break;
> >>      case ENET_TGSR:
> >>          /* implement clear timer flag */
> >> -        value = value & 0x0000000f;
> >> +        s->regs[index] ^= s->regs[index] & value;
> >> +        s->regs[index] &= 0x0000000f;
> >>          break;
> >>      case ENET_TCSR0:
> >>      case ENET_TCSR1:
> >>      case ENET_TCSR2:
> >>      case ENET_TCSR3:
> >> -        value = value & 0x000000fd;
> >> +        s->regs[index] = (value & 0x00000080) ? (0x0000007d & value) :
> >> +                         (value & 0x000000fd);
> >>          break;
> >>      case ENET_TCCR0:
> >>      case ENET_TCCR1:
> >
> >This isn't the usual way to write W1C behaviour.
> >If all the relevant bits are W1C, as for TGSR:
> >
> >   s->regs[index] &= ~(value & 0xf); /* all bits W1C */
> >
> Yes, it looks better.
> But do we need clear the reserved bit (31 - 4 bits) explicitly ?

Not necessarily, but it seems to be how the other registers
in the device have generally been coded, and it's clearly
what the intent was here given that the original (buggy)
code was masking out reserved bits. So I think it makes
sense to continue in that style.

thanks
-- PMM
