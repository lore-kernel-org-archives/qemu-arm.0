Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3744380lfg;
        Tue, 11 May 2021 01:01:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt3ZW80fUMiE2/HvVJ28HmvrswpRMGWBkKymlaJzVwKpiUyoxL21sj5HoXrABDuA6Nb+Is
X-Received: by 2002:ab0:1385:: with SMTP id m5mr23559111uae.55.1620720108270;
        Tue, 11 May 2021 01:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620720108; cv=none;
        d=google.com; s=arc-20160816;
        b=IlG06li3NaC5tnX9/AdJimBeuP0yqlRM3oAyxaJWFcNoAhm645O3Qsw0xrDG208S7j
         /QMF4+WJLJH6PNWm0hz58KGcO34pxFCROK+1r/EaT2N/PgfdCev6eYfG2WGDVYPbv91O
         M/d0q06QHJqU9ZmRM3FGPD/j5VBrEghgTaBf+f5ZHNkPO57rKQvZJQccFvFapzbQ15ij
         EVITl9ufP0vocBT0Yk0NokCI2kmUm4w2e5KAOC/ahvdb+R8dB156V1rRtPYquwK81ECA
         PngK1S7zwBNgaqxxgNeim4hC70BPOhRn4mfOYTK5vjmteNc9ABrA67ys/go5cNTaP4IU
         OQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwaZq7zm68Awg9uZLD3YE0KuATvaTNmFcL1OLhJkZuY=;
        b=zQAhLJtM2bAME67TyRohswm++FBqBo7RRS50DVHR9Z6JQl7zEw93xJLejfuELQKNND
         jZdjCYzRXZqVkHKhgkYowtmtdWaL0nIdu7rVAnwlcN4p2lPv0/TPd0CBp3V+UHZgpeiI
         5+UgI4fhe+iVPAudT7Hnv6d0SO3qCaZDgtGWMnHlCY9ry8lCV4UF7cugKFxghmazTOMa
         Wid6EPI83gW78CLGHTj88CJDmKJIFLWCvHmA0fXGzPqG3pIYpVH8yfjcVzz2QFuzNiQa
         rHphXEAc2QtAnW/+qM6w7xB/eOf6mcpgI7M3OPJbTqzH5KCxDg+eKPLPMD+G+IbC0LTO
         nlGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RfRyCtHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si7538198vsy.259.2021.05.11.01.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 01:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RfRyCtHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgNKt-0000a0-JE
	for alex.bennee@linaro.org; Tue, 11 May 2021 04:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNKR-000074-Cn
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:01:19 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNKP-0001ZR-LF
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:01:19 -0400
Received: by mail-ej1-x630.google.com with SMTP id w3so28426157ejc.4
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwaZq7zm68Awg9uZLD3YE0KuATvaTNmFcL1OLhJkZuY=;
 b=RfRyCtHjGcSGc0EoRhxOUAkZIW4bcu9mI3pujzoHwAdX+IDFYTk4Mgbw7CC+P0Ed/d
 pXkVJk7mj9zYgOg8OWWtwCVwvtZxgIByoW4vjTK36N0caS/YObCcgFQR6otmBoGSxC04
 1F7c8Gy4BaVC3mFZj7Zs8wJkwwe85XdFVU19hdbYLVqcfryE2tf8wU2FC51N8vN0dFOZ
 gRZ/9/R4l3RhNJ2MKpFv1PXFLFlweW3CDou/6La6c1SSgejjLR/iwGeh54Z1eaHpF7hE
 Uke2NfnG13NVclk1g16JjNNNVwcWi/wI4tqLFmeTifQUXgRflbyjFIbsXBMyuWW4h/yF
 ptPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwaZq7zm68Awg9uZLD3YE0KuATvaTNmFcL1OLhJkZuY=;
 b=XpVulLnZgek5AH3+mUoG5lYBhuZ7VJCrCxf6B3fH7dRvQYYYv1Uk1uh+pmcN3qw9UZ
 0oZANdgAEE2QKFnkWk6K1Wct3+MW6ygVdsc8kIubzhvzdu8ahM03ocbVVxqyIeEt3Vs/
 mW1BAcJRVcfY87gCdBz3z998UkOCo7x4Fa5V+I5zqunl1lH3o4G2gFia2TWs460/FXGO
 tuNHAJQljTdXt57wID4t53DCTMiS19JEsxXsKJrlCZzh9BIkxRaDe3ve61XNCPV/4iYM
 iu2nFdOLGTeF4CsbKnSgizsVuvD4qU5UQzOrYriDYWRaVn6EwhmycaILZ8nKegjc6XxC
 dZyw==
X-Gm-Message-State: AOAM531HfyQ0BOTycD6aacxh2oWnJfoRFqnrJT2EUYzyOF+2iOcO/e/s
 e1Ltn4g5xsGKGgyxFTye/Ko2u17vWqGY/RONF678jA==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr29923405ejb.382.1620720074426; 
 Tue, 11 May 2021 01:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-3-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:00:02 +0100
Message-ID: <CAFEAcA-9Xnh7QRRWtrXfk4jtcTAczX1kK4RjNtL9+DAVsfDY0g@mail.gmail.com>
Subject: Re: [PATCH v6 02/82] target/arm: Implement SVE2 Integer Multiply -
 Unpredicated
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +74oAI/P1Vdi

On Fri, 30 Apr 2021 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For MUL, we can rely on generic support.  For SMULH and UMULH,
> create some trivial helpers.  For PMUL, back in a21bb78e5817,
> we organized helper_gvec_pmul_b in preparation for this use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 10 ++++
>  target/arm/sve.decode      | 10 ++++
>  target/arm/translate-sve.c | 50 ++++++++++++++++++++
>  target/arm/vec_helper.c    | 96 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 166 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
