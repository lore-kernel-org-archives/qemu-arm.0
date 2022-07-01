Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1205168lft;
        Fri, 1 Jul 2022 05:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vX/J6N/iFfiToQVcSzl1IW0rou94rKoqGCvMBDomC7inxkX8JJWupEQx/wWwoFzqbszt9b
X-Received: by 2002:a25:324b:0:b0:66c:f553:211 with SMTP id y72-20020a25324b000000b0066cf5530211mr15386965yby.18.1656678804995;
        Fri, 01 Jul 2022 05:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656678804; cv=none;
        d=google.com; s=arc-20160816;
        b=Zg30bX9N7yBRPE9YeHKtW1NtxWeDld4kgYsp72F3Pu65TTCkT0K0C7r+kOb/1yRfKr
         v1Sd2mgNypWRCkaTXjGk654LNIC37RJJYdM5FH6xlHz/w4A8j52OtJeEyxe7lbuDGH02
         ueV4QS0c297VrCIO+v78GvD68SsnDzff92kWhKgDIQEZ3uwUbZmFfcT0cxIwmHUfYWlx
         m+RG82lRUV0xnqnAiYbkbd0w5NiShK9o7lo21hgopme4bjYWhCqVyvd3hvPhJer/3vPe
         eb6b/iE90sajhLndGo4RArs3m1sHeKai0X9zwr0spxIxvlBzQzC7Hrr3FO0h0ekTA2xU
         H5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Mi1p9K6K9fweGmybPfhP0Bh/ETz0sKcyTNWyLt0js6Y=;
        b=etON66Pypw2f5veZatlotTJKxLFmTohQwjnaat9pW86TXhBrirqP733ZgHKIb0W1lF
         hIjXbEHB8p1fgJKd5HfukPCr+11ZycXP519M4hTKqb7dGNHUP5vRcHMudsm93xuhgbF8
         vyd205nTiToccmE1K2OwblM3VM3qiPjX/YGRAsGEiQtz2oyEkvQF3kgzyvd0UqDqnnqd
         71Jf7untix2YYnGGnqRWQtydF28QGXu0fT7gVIfvxm3AJUIh8CQ4FZPn7Ff61RMe0WCJ
         RLdKe+hxSWEPZVR8qPzl5IQVexDf5ad9m1zs/gJ4kD57zGPNZGGrf4uuQYrA2zXFkl1a
         9i7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bz94pSn4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a250609000000b00669b70c9740si25174011ybg.210.2022.07.01.05.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bz94pSn4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Fps-0002HU-62
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fol-0002EH-Pm
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:32:17 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Foj-0005dC-Rc
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:32:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id h187so3882942ybg.0
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mi1p9K6K9fweGmybPfhP0Bh/ETz0sKcyTNWyLt0js6Y=;
 b=Bz94pSn4O6EmyQbvr97IWa/o8XwqJ6MdLc8zeerGk990sgtMIEYghhcEla4NjWRqzt
 5j8Hyf39YQYRlZYdLS6IIHuDJrixd9mNISK1/7UTh6UurHUarHZxlsUJ6LGOUdodEp5X
 iQvVbENcoiV9x7o7OmZLFBO6Tl5mxAuxdXU2LtjxjKJm0L0eAPyoz61TUwa4/5lN1ljm
 21ECHAg8PFhz6eW3cm3y7G2nBiwqr9zt+z3sKduF0DVQMOuQZ5emsZrMm9wPR4GqlWZP
 zTt8fyAwdO9PP0RArWz5ol2GGv3F2ZPdJTflgs0MRwCUG8gosjNgiMHLfiM8k/2IaIpF
 rPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mi1p9K6K9fweGmybPfhP0Bh/ETz0sKcyTNWyLt0js6Y=;
 b=WiTS3SqTEibYJbfNeq/7J/PXUUn4oi4NgQRTbvygE2fZwpGtQEAHh6oqU1eaT6mtvU
 4kaRI32S/yvsOppYnQvCv60bSDDmOD4cr8XZD5bzo0ZMrK1AY2+Kb/DY6zTOBS9vNAvC
 /t5csJYDZMMY+F63y0atQHPy28ikxdby9O8V9zOwOnlIBSXB8NsuKRrF4GGWT0HbqRAw
 fpy1QsxnlNuary6HcCSMfkU5QNeW/1X/2azeGurXgX+VtGfC0nzzP51V0BDRPr52FMtF
 yAjgeC4DbKRrxr+gNzQrE8w0BjUXXY5Sq/LGEmYHK5Qy+P71Ymr7PfyD34ICUMqA/rFb
 9/dg==
X-Gm-Message-State: AJIora+cEJBdTO4gyWPGvQkvlH/UB2ve953PiasRLlsiHol6FHx7zPfj
 dXXnW8+dY02kkWlVGKfPPFL/38JMHa3x6cabQYEZYg==
X-Received: by 2002:a25:5c5:0:b0:66c:b809:ddde with SMTP id
 188-20020a2505c5000000b0066cb809dddemr14887386ybf.67.1656678732847; Fri, 01
 Jul 2022 05:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-13-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:31:34 +0100
Message-ID: <CAFEAcA-1Ds-EYL5sybAb5BNh7LAVF_0N9itw8FRyqW1CGrview@mail.gmail.com>
Subject: Re: [PATCH v4 12/45] target/arm: Mark gather prefetch as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3Yihqsx1loZw

On Tue, 28 Jun 2022 at 05:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap if full
> a64 support is not enabled in streaming mode.  In this case, introduce
> PRF_ns (prefetch non-streaming) to handle the checks.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode |  3 ---
>  target/arm/sve.decode      | 10 +++++-----
>  target/arm/translate-sve.c | 11 +++++++++++
>  3 files changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
