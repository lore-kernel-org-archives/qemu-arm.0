Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp556980lfb;
        Thu, 9 Jun 2022 09:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHVx4hAd9YvhptFXxEegRWzPBNVzN6l2D94Z99Rk6zLo4XEx98b0XRIvxm7X0oZ/2uZddl
X-Received: by 2002:a05:6214:21a2:b0:46d:8563:1e87 with SMTP id t2-20020a05621421a200b0046d85631e87mr3506928qvc.51.1654792299902;
        Thu, 09 Jun 2022 09:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654792299; cv=none;
        d=google.com; s=arc-20160816;
        b=XcVzQ2BlZA9EntNiYkntznpwCQIWMWE/JdmmVYblysuO40KgDFl6KwWnFOXv8ctfcG
         U+iWILkflSrWGvudDusz8OlIhU3YA/J5UR3J8LvUMWXSt/qDG2zCi9m5tPVD7sH7GInj
         2xg1xIglO/R40QpQUWNg6X+iBhunuzfgLG46NrtNDUDRZNJhiEU1m+qJ0itOG27KmwxM
         kcFOlWpwZtL2nt4GwCs90eINALvEDAosb6Qx1LNUGDM14h01CublhpekrGpUM0S4n1AW
         JZ3uPpgLX+mqszS+BCgyYPj886JUYGXk645bW15sp1Ki7EgwU/4Vxbqa8sW+27k86mm/
         7xtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y1SOMzXjzlF03ypC1gMrLc3G+TfWo6oV7tkiIB3mnsM=;
        b=gguZaVGt/enITQI2I5fOAfrvCU0Cyr64WY4l+YUt3jqpp8ZHu3pZ9hNB/KDjQftCrV
         ToTjLvZ7PzJ8yJd5mnHWiMD40sxPzkYlnAcC6Ajc9VIOeZSO+rXB/42fHqLpIpRAFq/S
         ioeZA9HBGhT74eCdnQoy3FG6mqyH0bSbn3BNXREMR5hNqBEiTV7UDFxgIkedaioSUWNb
         vFzoWoUvxZv44g5v+9txzCc5YdUCfIsBcSZDi1mVhNCawoH4l9d4pq2GsbNwgG4fri5R
         qtU+5aIqSmjK8xp4zy90poJbcVjbfXfcLLvEfd0iyvy9PtO5UHHT5/0yZy6up+Ulkk1P
         w9qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xaN/DgF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d4e00b0046bcb1f01fesi3526992qvr.432.2022.06.09.09.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xaN/DgF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzL4N-0002PB-9w
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKbf-0000iO-5q
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:01:59 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKba-0007Tv-2X
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:01:58 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31332df12a6so97954737b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1SOMzXjzlF03ypC1gMrLc3G+TfWo6oV7tkiIB3mnsM=;
 b=xaN/DgF5fj7XTv5MsxNpGFLJG99YxntZ5zp1Sqb9TA23g9ot5v74mq2z1i8g/U7lDf
 +usN4KnmhoQBrU5q8lb1X/JFb2OYB2hbjnexYTsX2RcQe6vbrTkf/sXy+b+LCiPIQVNV
 DOuKnB8WEJ+8y0qyUZPeALhHW/FOGbp5/VW4qn9fcjzhW8sr3KAac4/tyPuc1V7l/XkN
 oHL3QK9BrE2s33LhciTpi3uxHWLKSyu6LSQAdXFeOheQdBOBwtxkR+1ZW/9GT3PAOXuG
 bC7TKZNnUB0mcf9bmxf3yGajwoWXlqaHksdhjM4Z/wziApSIQJnFPpMu1Um8He0y6oy3
 MEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1SOMzXjzlF03ypC1gMrLc3G+TfWo6oV7tkiIB3mnsM=;
 b=zS6VbhPaG80AVAHN7kb+vsmuZO70sRav/s0P0kgzfJVkrLT8fjHFeD+DVMJaVRveEL
 uyBZmt6a4C4pOEQFPL2/pVSKcGpe8d4rCtpMu2pF23tdV2PLmuF7HXmP/OFt1j45rbyP
 u5erWukAxzdiVJAl1uilD3Uhp92rfYYfiW/ruUyQiah1B80NBkzcnFCiqe2J6PjPcX+h
 ysnkBxoWuRuUv39Q6jGhuKaCwjQSYXVYu9tFm+9o3kmyrMKBXj2weznJDFFfGHgMBbXQ
 bpypzdRXi1vhwDcgvk0mPPu9KEsQ3PXvJBr43MgqaimjpbJggh6tHvKbdo3VJAcsaP29
 qGYw==
X-Gm-Message-State: AOAM533qPTqFSKOCghq5q1f5BtmuU/vyK9a+ScF3QJqwleK57sizzium
 6lnJnEuv5pIX/UZhJYagBWkmyiRP92qHvp1ug+Lylw==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42492112ywc.329.1654790512876; Thu, 09
 Jun 2022 09:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-11-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:01:42 +0100
Message-ID: <CAFEAcA9_kFpZZOYoN8jBKNaS5UpSVw=9jQgsELz5HWx4_5Ctyg@mail.gmail.com>
Subject: Re: [PATCH v2 10/25] target/arm: Rename helper_exception_with_syndrome
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: o+cDX1QECyDb

On Tue, 7 Jun 2022 at 03:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to helper_exception_with_syndrome_el, to emphasize
> that the target el is a parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
