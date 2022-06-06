Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1485603lfb;
        Mon, 6 Jun 2022 09:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC6FOAMlb4Gld5izlWR3HZUAWf71WnXRqV+pB7NK7ocGkz8Yj9KuZDIMGTOZsxKvhDTsWg
X-Received: by 2002:a0c:f1d3:0:b0:46b:87b8:d1e1 with SMTP id u19-20020a0cf1d3000000b0046b87b8d1e1mr6637018qvl.42.1654532245618;
        Mon, 06 Jun 2022 09:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654532245; cv=none;
        d=google.com; s=arc-20160816;
        b=fXtZ0rgN+Yox/W7P0vxSJEdoFE89rCmV1TSiGf6xPo8WrQYBUwsE//LqevfmIyNjYI
         kicQdv+5mg1UXUUfPGArz360DcvR7UNveOKGQN7GaKVzzfVW5U9uIxaf0+C7Rtj1aDiW
         zrsfjoYYnbA2IDsGFwZd/wR1vSUDmkxDm626WTPSIppMc7G67TGxUkYMNdsS4Wyz33bk
         uA08i7OEqnyWhpANZVDllSYPTrjFQ2ENKlggg/EwFlYFD4FLCSjXPnxdCIs0oG3pgBQO
         TgvoI+Ll2yoYMTy3L4t7oMZrnHMT8XKxVxxDjon1M9sImLyIUPC9fwI46Yg2yolIg4Hx
         sKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C9Ibxt2Yr57J/IPe0MB9shGKYiH7rIZfONTXOrtDmLM=;
        b=U/N25RUOWNSD6vrcp37Gc6Z1b/tX2cSixsLq+ssfPPDcWe1Cc0AYAPAYQ9AlBhX2gJ
         V+FwrGFv1g5B3rkv0dskgPl+cPSSWARm/LXaKUYTMLSEy7GGKwQ1VatCv/fINAW4EgM6
         hlUGvWq32UyXmcQRgx3qv9hUuqeSb6K4EKF1KYT/Rsp1YxQynI08hi/n6uXcX9JQVJOC
         UunjJ0yRTIiXXw3w7sXzQ3C5poVjec9eoZdh2ZuA9Ap0UL+qY4zlHUOXMSVExqEoQIUh
         VwzKGNXXcykphNoWexSKbbtJ3RJura1psa955ooRSbRQ4oCe7DGyjbf3awMrjbmrblup
         LgsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jchq83uJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b28-20020a05620a271c00b006a6bf226fc5si1491287qkp.362.2022.06.06.09.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 09:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jchq83uJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyFPx-0001KL-4H
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 12:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyFMR-0007LE-RH
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:13:47 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyFMQ-0000WS-61
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:13:47 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31332df12a6so173567b3.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 09:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9Ibxt2Yr57J/IPe0MB9shGKYiH7rIZfONTXOrtDmLM=;
 b=jchq83uJLBHyhpq+jQuaDdfiJcxpDo+TlnITA02efReSdgKXkCWuixHJ43pvph1BeH
 1ND+TFpBMEShelMjnN5YnuPDJi/F3nIB1wspEXcu9qacG2/HO4hQkJJ+R7vVXrLSHf4d
 MEKWN1YS7ex63fnSIN/vRQsx2d0aKG7AZOH7la2M/Hyf08GGPioEXKOA9J+rzVlhpMUy
 jnmlJl3ryQ1ZrpVb/ymbMAm4nvJOve53wpLYqCIkiyR7CtNjpP5tFSlk8e3HeMOSFs2t
 7zYgKRVD2iOb9RbYCutLxccSTBll6ATwJEwjIUwuh9cDVp1JKz35nN5PK2YfgaS1mJ6E
 48qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9Ibxt2Yr57J/IPe0MB9shGKYiH7rIZfONTXOrtDmLM=;
 b=6c2vUcJ408hxeGxtokk2dufRi97jLH7POO9UV7A6y74saxWJoEQwkMuWj7N0GUicDB
 jQFgtslox8icNU74Dq+dun00l7R853SnYMtCDNenNHkq7bWpsdjZRYC9pQCzs5GdnLD5
 /ZMR3jYqAPCxCYXLg16V57yViWrH3ZUe+H7lEOFBFWtm/sI3ciOw/mbuuL7surc2HCWI
 9z0z2Ogcw9X2OE59NN2UiRvdkmulH4nkwCY+JaH78N25vqFZQ4dee2XdgluWmWaU8lAM
 WtXixJZRNBmrbjgRwUjIkyM6Msjux3dSnrDv2lfV3clSyCNb5gh+ot6E6llVBE4cSiIB
 j7oA==
X-Gm-Message-State: AOAM530Z+RApMeFxBDGxWKpTzOt+3wdYURVmWpWD5ml1kBzwW3o2xW4I
 nJKEkqE0WxQAg8c5BneQ4eWBkNFAk1qMoELgkUkizQ==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr26918347ywb.10.1654532025016; Mon, 06
 Jun 2022 09:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-30-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 17:13:34 +0100
Message-ID: <CAFEAcA-eHDnphV14x=7gqezjJzurD_qd9aqaUQL==pcUSEb-jA@mail.gmail.com>
Subject: Re: [PATCH 29/71] target/arm: Add the SME ZA storage to CPUARMState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lvt0RImK93te

On Thu, 2 Jun 2022 at 23:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place this late in the resettable section of the structure,
> to keep the most common element offsets from being > 64k.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     |  8 ++++++++
>  target/arm/machine.c | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)

> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 285e387d2c..d9dff6576d 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
>          VMSTATE_END_OF_LIST()
>      }
>  };
> +
> +static const VMStateDescription vmstate_za_row = {
> +    .name = "cpu/sme/za_row",

This isn't a subsection, so it doesn't need to have the hierarchical
name. What it actually is is just the VMStateDescription for
an ARMVectorReg, right? We could give it a name that facilitates
maybe reusing it later if we have other ARMVectorRegs we want to
migrate. (The SVE ones are an awkward special case because of the
overlap with the FP regs.)

> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool za_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +
> +    /*
> +     * When ZA storage is disabled, its contents are discarded.
> +     * It will be zeroed when ZA storage is re-enabled.
> +     */
> +    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
> +}
> +
> +static const VMStateDescription vmstate_za = {
> +    .name = "cpu/sme",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = za_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
> +                             vmstate_za_row, ARMVectorReg),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>  #endif /* AARCH64 */
>
>  static bool serror_needed(void *opaque)
> @@ -887,6 +920,9 @@ const VMStateDescription vmstate_arm_cpu = {
>  #endif
>          &vmstate_serror,
>          &vmstate_irq_line_state,
> +#ifdef TARGET_AARCH64
> +        &vmstate_za,
> +#endif
>          NULL

I don't think there's any requirement for subsections to
be added only at the end of the list, so we could put this
next to the SVE one to avoid the extra ifdef.

thanks
-- PMM
