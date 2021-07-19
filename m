Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3815735lfc;
        Mon, 19 Jul 2021 05:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlykXH7eHXfZnbThDFyAw/NR3XDWtfEKXQH7gm6rJasT1xJ1FX5OuP8rQVNPBA+ZwhV+U1
X-Received: by 2002:a25:41c7:: with SMTP id o190mr31178259yba.256.1626699125770;
        Mon, 19 Jul 2021 05:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626699125; cv=none;
        d=google.com; s=arc-20160816;
        b=Pbq9kjymxkIiQBLAgpVkcHvv226ZcTNq+jdneZj+pPryo2mlruZlqSKwEi7AvAeuSP
         G27XFNkgiIyFC7UR6Gc7kH+eiz2wFSVGQlwNndKi3M1DywxkbPFNYc7/VixZAB281KS9
         61erLpIDR68Nlgowz0ugGCh+WYIj5blRO+NiZUdYhAUosMWpnn1t4pHTsyBjcN5xrrm9
         RAzBxHrInt0trNtgK+FXEOaJqhd61J4XommyArjoalosd7UWLODBRcUjTXqJOVK2znAw
         CllQPjIyD5T3NYcEefaJ6DGIngWQe5zLiu/m5wTaKPmAglxbk/MA5eCNvHRV1GHZkXq9
         /jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJzQp4T6VNZjp7OmGTaglG3Oa2ZKq03BUH4VsfaK33A=;
        b=sxZlkUPyKxk8g3NPot6K8oQm8AgzNjdWuIR4FNG2/FtENbP+0kInI4lP4QJRDpT4AB
         btGUfDuY5nyu5OSTGbRlFA55V99+6LGQWpEzWxKf5vQl0TMNLecVewCRLsUT2glcrmGC
         G1Qbd8BbOhEx5eqtb2n+E0RF5q0B7bm6vbWRSfXoogK7tawf0U7cxUMxqJEderXHu9UJ
         WjoWoLe1keDyc+BLyJKOiRIWoaAdvabzvcmhowtscuG+me5cWSSf/a0jKKI2VMqE72eI
         ICjZdE4w58bPy3Tyz90AdPbpZM/Gtz/pbqGEguk0eKlCnVRWg5uptuoSGlyb5Sgdbgk5
         IGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FOhK0ICE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m132si20912622ybf.260.2021.07.19.05.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 05:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FOhK0ICE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5Skf-0006JU-5W
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 08:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SkK-0006Gz-G0
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:51:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SkI-0002sw-L2
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:51:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id l26so23755682eda.10
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJzQp4T6VNZjp7OmGTaglG3Oa2ZKq03BUH4VsfaK33A=;
 b=FOhK0ICEOJd4x2mgTSGxXQ/uLTciaPCksnplAc1/MoUdlzQXi5YFVxBtehb5ocTIyV
 8z+Z+9x8axFXRlNNg56976I5wgE/5krQWiZoHwvK5wgholHvjLBiI4chbfEyjUDpkIuC
 ir9BUirZfMEweX+KNqag+CDc6VC2P4GRvNX88GDbqhN5iwR9NxuZPTGILPgi2hc2gCb0
 vBp+3wpWSVOBzBpggrWEdIn6mIFTCDpr95UKK3ToCqBGj2EFa7UgswTCCojxn07ef7Uh
 3yh9ZNEUy6alxAcuwm+fq6hlc4JegbnsxXlWBnA3GNGXuNn5pJzMPtqElY2NNb1WlutB
 Z9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJzQp4T6VNZjp7OmGTaglG3Oa2ZKq03BUH4VsfaK33A=;
 b=otERb91Tv9rph1HMZUz3MwdVvrlwBUsCCRaHLPxXWpXL7wvwHDgcC5fzmbxpGofT4a
 CTKOGUg4n8ayKq0BVQIO0DVpZzdKjS2I/vlDHY7stLdEcU4CBnHiCwnzDRy9TdXRehdf
 +/IOUY3lXd0Z8LRqygIcgYTrvl78yAPDpoV00C/OGmMW6XI+465F7AQW6E3++TV7gsSe
 NdrBse+ZLwgDYcBT2doXogEdAX5M+DMQ9L3GN/63b8pZr2elJ9P8Zm/wJcxNiSC9rfyt
 zlVf9MMM60IOdQrMgRsP73zMkRBBOZlNettEXOzLywYo7I++89HozLqeRI6cIwEX7eS9
 Zecw==
X-Gm-Message-State: AOAM530ggAEhO5xV5BCQ5oQra0d73pdWyZTNK/z5V/PUM2R+A/RCIfzs
 ruWirsH6Rciki3Xf+GVWXe4GyUGd5dSdkL/GLtSRgg==
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr33713046edy.44.1626699101120; 
 Mon, 19 Jul 2021 05:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-2-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-2-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:51:00 +0100
Message-ID: <CAFEAcA8MbO1qSaF__ytMVho7wu70K8jM=0V03zkOcdH46Hy_dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] target-arm: Introduce ARM_FEATURE_A64FX
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qf4JM0uk4IZx

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> This function is used to distinguish HPC extensions in the Fujitsu A64FX processor.
>
> HPC (High Performance Computing) extensions are A64FX processor-specific features
> that are implemented to improve application performance for HPC.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index be9a4dc..e5c8645 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2140,6 +2140,7 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions support */
>  };

Hi; as far as I can see there's nothing in your patchset that ever
tests this feature bit and behaves differently as a result. We
shouldn't add the feature flag until we have something we want to
control with it.

thanks
-- PMM
