Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2521286lfc;
        Fri, 5 Jun 2020 07:50:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxACkLzl2axzMdFEGSeFH80/3p3Y4ssm8Tdfp22ZFzoWGn7oQ5QlTuG/RQ5FFRVvibJjI69
X-Received: by 2002:a5b:44d:: with SMTP id s13mr16615368ybp.414.1591368615379;
        Fri, 05 Jun 2020 07:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591368615; cv=none;
        d=google.com; s=arc-20160816;
        b=K56YnH/jT/q/cIvOI12TPWH0FhoXcMRSW8Fo/4nf7Pax5em2YlbgMbQXF792o04ox/
         FpXW5lBqjNAkPZdnc0pvK1DDqDyfpnUc9JcHVz0o/Lrz3ENlrEVBWRchvUWdsxjVPMxi
         bR9K7sdXWQfb72ym6uCn40QvhCB1xRBbvMfSE91fUKcLLrtjgtHD5dr+RsN+zU1w8NuF
         QmP8y7dlxGX+Xe1Rzjo31EbDmTUKsok5iwqmW7LjXrRRHLC8RFomGMEPOXuQ9nVXY+Pc
         JrboEmIpDb2w57111s7ataO0IQFDgO+y96/IO7f76+obxSw7EszOrcQo4vLeqfXTm0zq
         xJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDCA0K4XBTkPfG5Tn//wBpkNB82Cg03QNPI1nDXfSEY=;
        b=aLEmV/JlpRATs9OL8M0wBEa4xCbPAbjNaxFnF1saozSjSSoWc0wsuqc1Y9f4421NDS
         12+O+HH9POCfDcKeVOZM2rJWWLT7GfPtmvlgZGzmrTDrBz2+Cd+9i98QkqbnNFUnWMWY
         yMWL3wwlcRJoARUe/X1Vl+/HQzx73/5GZ/5YSdXkFAO9PNarvRszAmaamWMWw/ctKyJq
         t7eMk4272jNYjbES8+QpKqI/XtzHNRYr/wAnKyiSCfbsLhbtKV7I3CxR9Srg9LuTBnda
         MEkSJgoUjdnTmQwV2nIRmIElAPrEKZdxs482DZQIT8mE7lqhGcy7nsE1xsg+qDn4FAIG
         bNfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qWQMGCwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si7016180ybu.101.2020.06.05.07.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 07:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qWQMGCwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDfi-0007go-O8
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 10:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhDfa-0007gV-Ro
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:50:06 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jhDfZ-0005sU-KU
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:50:06 -0400
Received: by mail-ot1-x343.google.com with SMTP id v13so7814686otp.4
 for <qemu-arm@nongnu.org>; Fri, 05 Jun 2020 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDCA0K4XBTkPfG5Tn//wBpkNB82Cg03QNPI1nDXfSEY=;
 b=qWQMGCwZNxoluBGNf9Ow4LsK3nnkWqO66YvOSrEUkNT3ypOIusrSvvpiqi1knwscht
 HntrhrZI8lLUitY3f3CqdZuW6xOuZqwdRKj0KPJpOGwB72o7b2EbHvCyZnqUL+SjsNTN
 RZDjPg4Pj7f3soySHLlK71DOmBbuUiAHPAyCpFikxPcfSA9KM2MpVRrVa/q2yURwJjGu
 yQovb8jVEdrh3wXkdLUdReUx3rFPmg61L5yPGpn5nLL2k5x2YDgKJFXZSR5PdBRdPSd3
 UNPedbELYoSD7xLCgzR37NRQ1DTFVVwoOrYDQ67P1n7hfs53Piy6CLjKbthARhZkKlPj
 iEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDCA0K4XBTkPfG5Tn//wBpkNB82Cg03QNPI1nDXfSEY=;
 b=PsUS3wAj9qZmnvL4k2E9HBuHgKTgiosGqMgyEn6OlzhT+S+QJBWCaKVUUBvCbbmE/r
 xHUlLs8ZEDXdVVRwSpnEC/jaK8C/ru7yW9qN/anBZEmGtGpbW2UUosn/QfYRVh37PeX/
 tlUchyuDvkeCL25RSoeNWNpqXtjUiIdTc2y+8HpnJClniLnqRTnziNvZmy3k3Elizby9
 tV5giLMeYCSVe8OPQ9b1XxbUKKGZTg5M8LtJWRzzMJBgDKlr6K7kgZ0/VLf1JL1syqcx
 VkTqdZs4ESvEFzMVZ697NqxAopNlJTgpbBbJJhto2KifVFwZLscpcpPaPgunnOWrPVVx
 TtKQ==
X-Gm-Message-State: AOAM5311/o3/Ube2hRr5AYFtxFTQL/AgaHg7HXFbxt+11VdLeLu4sV+a
 3DL/+d9UQz0s1iEYqG1giI2wZu8qX2I2DEJ6gdzebQ==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr7502622oth.221.1591368604178;
 Fri, 05 Jun 2020 07:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200529180005.169036-1-jcd@tribudubois.net>
In-Reply-To: <20200529180005.169036-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jun 2020 15:49:53 +0100
Message-ID: <CAFEAcA9Q9f4ocZSrgXK8DRz8ro1Yv4bRbTmpWw_wtoqyUO9K7w@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/imx6ul_ccm.c: Implement non writable bits in CCM
 registers
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VOgW5GqN+How

On Fri, 29 May 2020 at 19:00, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> Some bits of the CCM registers are non writable.
>
> This was left undone in the initial commit (all bits of registers were
> writable).
>
> This patch add the required code to protect non writable bits.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>  static uint64_t imx6ul_analog_read(void *opaque, hwaddr offset, unsigned size)
> @@ -737,7 +790,8 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
>           * the REG_NAME register. So we change the value of the
>           * REG_NAME register, setting bits passed in the value.
>           */
> -        s->analog[index - 1] |= value;
> +        s->analog[index - 1] = s->analog[index - 1] |
> +                               (value & ~analog_mask[index - 1]);

Not sure why you didn't retain the use of the |= operator here?

>          break;
>      case CCM_ANALOG_PLL_ARM_CLR:
>      case CCM_ANALOG_PLL_USB1_CLR:
> @@ -762,7 +816,8 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
>           * the REG_NAME register. So we change the value of the
>           * REG_NAME register, unsetting bits passed in the value.
>           */
> -        s->analog[index - 2] &= ~value;
> +        s->analog[index - 2] = s->analog[index - 2] &
> +                               ~(value & ~analog_mask[index - 2]);

Similarly here with &=.

>          break;
>      case CCM_ANALOG_PLL_ARM_TOG:
>      case CCM_ANALOG_PLL_USB1_TOG:
> @@ -787,14 +842,14 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
>           * the REG_NAME register. So we change the value of the
>           * REG_NAME register, toggling bits passed in the value.
>           */
> -        s->analog[index - 3] ^= value;
> +        s->analog[index - 3] = (s->analog[index - 3] &
> +                                analog_mask[index - 3]) |
> +                               ((value ^ s->analog[index - 3]) &
> +                                ~analog_mask[index - 3]);

I think this does the right thing (toggle bits which are set in
value as long as they're not read-only), but isn't this a simpler
way to write it?

     s->analog[index - 3] ^= (value & ~analog_mask[index - 3]);

That is, we toggle the bits that are set in 'value' and not set
in the mask of read-only bits.

>          break;
>      default:
> -        /*
> -         * We will do a better implementation later. In particular some bits
> -         * cannot be written to.
> -         */
> -        s->analog[index] = value;
> +        s->analog[index] = (s->analog[index] & analog_mask[index]) |
> +                           (value & ~analog_mask[index]);
>          break;
>      }
>  }

thanks
-- PMM
