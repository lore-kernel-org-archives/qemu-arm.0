Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp357263ejx;
        Fri, 18 Nov 2022 07:59:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dWjNRsh0x/YFqBpojcuT4te72q5unou5fYAD+SR9B5sFvVq3BHyZkXykUfURoF8frn9HT
X-Received: by 2002:a0c:8091:0:b0:4bb:b8ec:2bc7 with SMTP id 17-20020a0c8091000000b004bbb8ec2bc7mr7148559qvb.20.1668787159084;
        Fri, 18 Nov 2022 07:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668787159; cv=none;
        d=google.com; s=arc-20160816;
        b=hLyzZC7FZKJhTr/XGGZIIYgpbPj6BgNm8pcFUkISnXjUInrV6g1+S6yIIO6H5IJc5s
         DCDrAlF2HHpxel4tK/7WJ6Eh1tuaUIkUi0nz39E9p/zFyIlygfGrXGDdDVgvmhhnsih3
         +6ZoaMj4+g0E2IVU+njTuuoBXY2f5xxQvkPpPKTeE9JuHg6YtNbObHfKxRuAIUhCPGPA
         5GyTl0CsDqDBrHdLJmRhfJsXwi14vqdFMdyCKZuJrfyPGfDFlyDusw46YPTeqxMCvtap
         onM18LgIqZjuZMdJW+u9zGUR5x2cSPeCnFFQJ1iFjJuknwOiwVqfMthFaqgY/KLYvi0x
         kz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QhKFiLFptcJxmooOlQ95gaC78AS1IC3R5ChgGL1T8Ec=;
        b=uS05FaULrSJCLUHLoaTLLGORO2A6cOlAlZm99IW00Juw7x1113Tu4DuVaFB/EUY8+M
         KghRSsWpBi3Am3NkExgfkLKUJdFejUf9G7fPf5z0UOnGauQe8uzy0d75KHtx98IpW4kw
         V7Tu2mU8z9oc5tGIs/0ooCrsNF+lbYxQvgBn0W5p8g24+Ad0iF4wUTMcRfcUZ8+J5gpB
         XtU5pzHbz6GtwfzU1n7RqdNWEt+upey7Vssm8dFjUNUNgL1KL2QWlkfjX/gTJsh/nNgu
         bo8NDToi38kqUklYGaky5ytyZuQ8PAtIJbjvOxC4ov8IqKpH3m/oCTlsFR4OcwSwqjDE
         eDqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2w1uHkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy4-20020a056214242400b004b18109f675si2278033qvb.522.2022.11.18.07.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 07:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2w1uHkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3lp-0004iL-7l; Fri, 18 Nov 2022 10:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3la-0004gk-Vx
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:59:03 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3lX-0003hj-CE
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:58:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f3so5368975pgc.2
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QhKFiLFptcJxmooOlQ95gaC78AS1IC3R5ChgGL1T8Ec=;
 b=p2w1uHkw/V638pSxJisvj50WxnuofcuC6xA3AfeoaYRVLSmCQvO5A7yAJH4UWYGevb
 g+UjAxknxDyn/WBuCHXDGnQR8Ep26mnyfscoE/tEr2UTUsFSJ4HV7inY/D6PABEScvqK
 bs4g8RBKnc1kwJbdrqXfq+6923QdbG6XxZcV4H9PjYR15s+HNRqK6EDCmdPZDcvhgIsl
 Bb6riH294BPMetxBqCrrCYLwxlpwz+Un3cCiIOk7StYn00XZTDG0Pn/wWUoxT47+pE/n
 6Wq7zA/HVKT2Lg9ZEYMTSWXLf5H4ie/l8FQzwaMl0idqZmNnBKq4xQkR2MUlexCgp1Bo
 Bzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhKFiLFptcJxmooOlQ95gaC78AS1IC3R5ChgGL1T8Ec=;
 b=boCBSV+I3OsTBWJsen4hB83GmW+ZjE3YQDx116ej4BDwB/PxIiPt0Codg2TQ5VS8md
 bVtXJtryVCddQWKtaW/Z1rqWx37yb5ME2DuapIOePrjQt68t80KaCpc0my2/OoCqcHWk
 L6z9EkAiYAUmP6jekxCSCpWCeLCnGIqkdFvBuv1PtsCGrA9fCmehAPd2vCym5QkdgybE
 sJ5NvWhwqMEvDqerDzFllvUlQi7fv9dJb5V6zIjqXUxA3arjBhtrUJ03+/YhvwGGerCJ
 6fz3qIMvtqoLoWAQoC9lh8tAbh3gSrKGXtAYfIaXIlH+iJGiNt9rvh5NsgOfE7A3hDgG
 yJHw==
X-Gm-Message-State: ANoB5pn6PGs4h3VLbOTlta5WNFVDE/4MiJiJn8+RQKVkB3u2DtIvq6Wh
 of2Ilj1Laba76BOja7GtnatdyQtAl2X/1rIKa3BF9W66KPA=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr8402441pfq.26.1668787132394; Fri, 18
 Nov 2022 07:58:52 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-8@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:58:40 +0000
Message-ID: <CAFEAcA9As2gAigMP1GNgWyCXvANWoqfTUjAQ0Ve0iCMCdV2ptg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 8/9] hw/timer/imx_epit: change reset handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ln88czROnjPk

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - inline software reset
> - make hardware reset invoke software reset
> - simplify code flow

I think this patch is fixing a bug, right? We weren't
previously clearing CR for the hardware reset. If so,
that's worth noting in the commit message.

> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>


> +static void imx_epit_reset(DeviceState *dev)
> +{
> +    IMXEPITState *s = IMX_EPIT(dev);
> +
> +    /* initialize CR and perform a software reset */
> +    s->cr = 0;
> +    imx_epit_write_cr(s, CR_SWR);
> +}

Generally we prefer not to do this for the hardware reset
function, as it makes it harder to see what the reset
is doing (eg to confirm that it isn't changing qemu IRQ
state). You can have a common helper function to do the
work of the reset though if that helps.

thanks
-- PMM
