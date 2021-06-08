Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4294840lfa;
        Tue, 8 Jun 2021 03:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpJ6j3dQpphN81eME/CBO4Iblqk4ZZjLNRYpbFbYohiUbWgkeXoqWAneiBHlPrgdnd/Bgb
X-Received: by 2002:a92:d283:: with SMTP id p3mr18785695ilp.170.1623148897593;
        Tue, 08 Jun 2021 03:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623148897; cv=none;
        d=google.com; s=arc-20160816;
        b=CUuD5Ky8z0r00xACh7V96DDpJMqqy4ugzjJwUV1L+xtWZBe93CWMyS9kHQ/2QvpwhT
         8XZJm/h1waGbf61gks+Xynn8ZzXvsNtuhOsLT0ApcLNPVlckBeWFnSxy1ww3n2cI0AZA
         5C5I2kdbv6tRgvgGxAzQF8TgeaOVvMkEU/9sTh7orxr3QUHLZzMtpTlPZt9R0JwHom5w
         EFIXn69Y6dxkfO2oUJW9LZPwl92JbUSFwcoRXYKtmbNIvoCjXfBlUT13zxiWdxOW1XjH
         rwslJV7XqzilyhtPeuY6mKhmwOB9vBLVhgc3XPgidRmcVyPbEdxSQmYmt3PVsZxKutU+
         OY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBL9HgJTqlTdVLjw4jUijMx0K9KTU4lml/nPaOkSmkk=;
        b=02WbzKlgHPMAL85Rt4pO9D7gVqGRzpN1jhT2WV/sYLrH3gI7jzCE2uU29ZX/x7wWn1
         606apBbkAJO/10YBE+ogFxpLurRjdb/36szaAZlEvCn1GDRszecac8+B1+KBSFRBLyj0
         o3zBhZKt9lcaYKXqTia1byAuIlR80XQ9O7x6bZZqU3OD027t5U7KTiipi/fk8RP1kgCa
         u4Q61DngQWxTwqEFHOEgjeMY04KY/MFgqc1mMzaXg8PZk1gXpDr0ju2iLrczd4b+bkEc
         luXePsRiMmoag+0nsAioofkbD/QUgBX/PU0qaqhFsLHX+l+Zdcii8bG9fAksFwTK2nZV
         MtYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X3FX8fvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si19340268ioh.98.2021.06.08.03.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X3FX8fvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqZAu-0007LT-V4
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ8S-0003ij-Ae
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:39:04 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ8Q-0005S7-LE
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:39:04 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r7so9547687edv.12
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBL9HgJTqlTdVLjw4jUijMx0K9KTU4lml/nPaOkSmkk=;
 b=X3FX8fvBvuE0sX7fo4x6RWMnevEaelmxsCGh5O3E0gxp6j6b0Zc31Qskvn83M0CMAS
 86MCQ6DGPuhlB596Qp9JBYzUgOhYjYt0QlwyzBd47XrCuf8fpy9JilYOyCo0UzoMnGcG
 Uxwll4rBR+oNL1oMi7MvTBP0CSThlAyke+E2ex+y8XmORzRgOAeo0fOuW6PTLkpgJuNk
 u1AB5sdIuoqNeoWcM37EMPwOhH19rbckWMMfguCChiBMcXva0Q4hzOk8IHkM94sBLgZj
 LyCZA/Tg2ZfIFrGQlo+04oRma8ASEAVDwcdqoAHTlJk0ok/R37Y3Nxd/eUs/hQGF0CT5
 tqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBL9HgJTqlTdVLjw4jUijMx0K9KTU4lml/nPaOkSmkk=;
 b=TS+Uj57ZLwL0I6vPX+qA6ba0Qk1Tr6qXAYMxM1wg9xkJ4lA8AGYQvsKQWvXhxNTwr9
 ALpXvMRxNgVJAD0myKjNqu0keivs+bHlD/10XHBYG2o7gtwFraIP0kC3S/Y3a1jCqP4c
 fOGNVpcTLvGS7PADUUkaGg26FhBaDW3/VNaT88n4AL3s+rF9gvVg330oaZ5PHwMlwTF3
 PvKBgTHchWvJYpNaCSVkf6dl92SHSb/DRbqq7kXl83vezU8RKrPuXejMwC+FmFqxSApc
 V/lg+H/gYpvy8xC5Uic9aClBru4qcAQ1kDXUGHpUBbVADcRlY3XBEoxT7DsUyWdHe02F
 +iig==
X-Gm-Message-State: AOAM533cNcoHWV0LvLG6hHhgDwsl+2ScGZ5b35NGyc+XpnS7KL4TwB6V
 KsOLWiirnA49+1SaxcFmEadFHiQgbEqdkBi2tUcZOg==
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr14855994edc.44.1623148741134; 
 Tue, 08 Jun 2021 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-4-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:38:27 +0100
Message-ID: <CAFEAcA8Q=xN3U9BMPaX8sHy_ep3YJQipgurDKCJQAiUQNZcLmA@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mgrE9EnQTS+v

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 295 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  37 +++++
>  2 files changed, 332 insertions(+)

> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPC: invalid collection table attributes "
> +                      "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation,in case of error

Still missing space after comma.

> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_cte(s, icid, valid, rdbase);
> +    }
> +
> +    return res;
> +}


> +        } else {
> +            /*
> +             * in this implementation,in case of dma read/write error
> +             * we stall the command processing
> +             */

Ditto.

> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: %x cmd processing failed!!\n", __func__, cmd);

The double-exclamation marks are unnecessary :-)

> +            break;
> +        }
> +    }
> +}

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
