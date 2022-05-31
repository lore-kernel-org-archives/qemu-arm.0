Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3401759lfh;
        Tue, 31 May 2022 05:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg4ZsCuKv23Np+a29XgDH7j6PuWvD6wWvcFM7D5pF8JW3nxKEUt2YWiuKzzX0X6QNNuYK1
X-Received: by 2002:a37:a1d0:0:b0:6a3:647a:675e with SMTP id k199-20020a37a1d0000000b006a3647a675emr32633465qke.399.1653998760008;
        Tue, 31 May 2022 05:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653998760; cv=none;
        d=google.com; s=arc-20160816;
        b=rjQ2Gz6pVxn84VPnW7WLjie+Hrwl2auPGvZTziqFQYASWvw0wLn+JURMbTzV8oYRVz
         P1r/AOZDSbzCLfMHI0QNTrYRsxP21TTdRNaiZXKFU8iAamY+ZX+oQcvbFTynB9cDNv4j
         frmvLRUl8eWlcZhRKChV8uZlAGopeXcrfAsZL6DhYmX0NgBc0+nw1FLpsH5eQ2poINKR
         UrsBO7lghgFppZDHg/rTMK1PjHCgf43SV10X909ViHcPGNNcXXtWxxwGPFo7c/P25Bp2
         scpsrueZ8UDb8Qz/Gf7DYN7AmQVhv6PNnVC599yeXfG+Nf4U0tZCgPxtdZ1xjQ7mKKV6
         iigg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0Cj9EWwrPDX8iADDfXa2oAbn0w+auohUB82Pt7zdoyc=;
        b=diDlxwImono2nC+R8f8tTNANyme2wsk3npznfwOq8MSLb82WBMtuJ34hnuUTWH7DkJ
         H45dtE/HOTHqXsWkL1L0Kq+XFTPTIelAlKD1NlqQZncN4qSdpIIIlEP/O1+ri66jpwH+
         eMRmd4Ki7q8sBYicdpOEqztt6LM+UXtVxENqIIaeGiEbSkeA3wbEdiFvWOH6BtliHb2L
         5vLWUOU1jWIciUjyJ+/GlLrvz0dE6q0is4a1DxG0hLrnxNH301KSdS16SLFg5szdJ3CC
         90Nr/Lf/REu0ra/so9O/EjNMNHHlRBgKO/afymvmNE0QJEcG4DaQ9/FnhqIG0rLGgUuQ
         kw0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTMWZ9l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n66-20020a37a445000000b006a58e28da39si7759988qke.643.2022.05.31.05.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTMWZ9l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0dL-0004MC-DF
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0cc-0004JW-1U
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:05:14 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0ca-0001sy-40
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:05:13 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ff90e0937aso136844257b3.4
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Cj9EWwrPDX8iADDfXa2oAbn0w+auohUB82Pt7zdoyc=;
 b=tTMWZ9l2l8H4VpHBSmxja7akVEj/Ux0+lwHHy9MJgg3aXRYon4NqorZDxYcYfBmMjS
 8mlxMddnXHkxop0AzOqWR0sqYL0kVZ2zCtJQgvTUvIM/Ei6qfUC7Fs4clCR+mAZY2f6e
 zTLzu2uqQds9zHm2tsm9Q328JKIjtIRHnDbUhO7BaTza3PQ5cYuI0pRnj04TlaQFXZtE
 4jXTxT+ertEKFy/iV0V3OyeQmzlGYR83j4TXjwdBI9Y2YkZ2T0EGZnY0JQpO3hr1p8bE
 graRWxNNK+YYl2wLCjXXfuO9sc2bDTgK+v/Sn7qje9mEBxbEanv9Qe8uiPbrT4x9mlIS
 gKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Cj9EWwrPDX8iADDfXa2oAbn0w+auohUB82Pt7zdoyc=;
 b=BFvuibRuKvVw1IIO7LkBwQF0e+5G1OlgzRFgBsBTHVbrgwGwPoB5vetAV5RpSS0gis
 7y3y69Ew+V0fpUhJtnYtNlDJ8yHB0XjclXQE4FivvsewHLlSbMKl5XHjHALdHSGw8V5p
 5LkBDlJFxhYAnyvG6LXMrEDo4L93MT1+KRv1savjaMKKvDVi/UDnL6IJhidLkMrr++ny
 3j70Fgxi055dAusHWFBpkICCdANP5f6agfiDJeeUvWJtBfbV6PKgR9lcoYm6z4ccViBi
 q05nWJIMs2aKSqOdAvKUyqthBSuanJ0Whp4tesBcqFMBNT9SAkCGqgkjVF8qXjZDzEEV
 NoAA==
X-Gm-Message-State: AOAM532JCKWwhOcqlsOIlDlkHy5I9U6v+N/ROHhb4abJFwYDGxMADE6C
 paxLGmyshMn6vj9W9OA0Zf/bR30sTvrvEg591UH/Jg==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr66044299ywb.257.1653998711081; Tue, 31
 May 2022 05:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-8-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:04:59 +0100
Message-ID: <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXUyNLPrBExD

On Mon, 23 May 2022 at 21:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Read this value once in the main function, and pass it
> around between the subroutines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

What's the benefit from doing this ?

thanks
-- PMM
