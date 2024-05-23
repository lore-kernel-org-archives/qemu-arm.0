Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1014268ejb;
        Thu, 23 May 2024 05:11:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrX6joHfrlMvDLJaZwlZk08IeDdDYmIbswFVmLoH2XEhH9CmPcl0to/bSmWSy2UoPWjo3apm2GOWGrFMs6AWtu5GAUp9Xw
X-Google-Smtp-Source: AGHT+IHQ/OugY6LjT6C0nO3On7TC/aHGiBjvkeF2YSS/+irQ8Za0OKGDR7bjmlJ5NhP7Cc5EcH6Y
X-Received: by 2002:a05:620a:198a:b0:792:643e:ee7b with SMTP id af79cd13be357-794994b11e3mr578479585a.49.1716466297024;
        Thu, 23 May 2024 05:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716466297; cv=none;
        d=google.com; s=arc-20160816;
        b=tZIu1R3qLRnB+juUgPv+7kjjydOQB9qvlPT9IQD4x0A1JAX8/+95Kl7SFh9+PtC+x0
         DN/UPwsL/ba2qobjgaEBU44DZnR7TMFrlLTlepxtPcABpvqgW5mGuq0DDRk460+c2rT0
         nXfbjfu952onK+jOnBh/2laIiog26mukIuZH8DfLU1X8OIe9aNUgHjukxMmLNIwy1hEQ
         LmZbaYdETuAuYpi7Yw7HjbqnOacjuJ2gMiV4kVcgOynwXzT1OIOukeRaIdU/ifYzqAZT
         NZSMUrHvGfFpRBSp34G3jkb1Df70Sjg7AFLAjaeaKVcFelPt9mkeNuuvUjqskbFsP+x5
         gf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SvLubM133Y1oQ1PaVzdQ3YepdyZNnd83vLc3wjbvM7Q=;
        fh=Cu80zD8MSWwDFY4TEsy+NhxEom9/vpUH0M9L5ClGPPY=;
        b=YCbHxrHv6fFT0OSk8zgXSsWuyFhgUeJpq5AWv6t0egRp7hKc4LYftvBtAt5YyPu60k
         s8OPcVqZPGCkc3kdB3BWpTnhmkLvZQkFsp3O2ITPzbjyhXqS8DntIp3FIHboGHHGawfv
         OvlK2Rk+Z6+KeQIukltk6UMZO5aOU8KaqaS5+hGNbOzNB/j8EG22VDn6rkjv2nvCdiUW
         CvSqiD5UJ8si5dl5JBQoNqTmIxT+d7xEFUiZ8viSF3HvMwqqZVuapFt73uujTk4K4uCx
         IAu5P1qO7uUCKkvGJ3E1HbQldUBLPj/dGfm5J69YD1xN+vz0kS2DWOHBb9kwjof6fwGA
         pcnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEsRMJPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf27780dsi663567285a.149.2024.05.23.05.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 05:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEsRMJPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA7I0-00017h-W6; Thu, 23 May 2024 08:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7Hu-00016i-Tm
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:11:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7Hr-000450-SE
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:11:13 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so9381895a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716466270; x=1717071070; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SvLubM133Y1oQ1PaVzdQ3YepdyZNnd83vLc3wjbvM7Q=;
 b=DEsRMJPDXVuOYc27uG09hlvb/kJbNdUFRezSofxdjyzZYVqKUiKEsC32EoqRkPlxHC
 W6qo79uMTPsWQawuHznBUaLmUdisldc8ymK7wzLlOhPjXcMgGaccIYecteqKU93cPn/2
 gYTadqteyjVRlzM7jt6yDdcbfEBhyNEQFZae8jvUaHx7LVj9PIkspv+vwoSyKLFWvG6f
 QaJHBiqfk/ytuUBa3ithiJwqfdZNQSi12PfhQVS2o6msvEoDZxEdsCGBNSv2j2qlbM+I
 cFysUlSr+SGYdZBqJptpbYj97lTq5g0DacnWkV+/oK8GkcHgsHe5ZVCLabduiiqSVrSI
 US6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716466270; x=1717071070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SvLubM133Y1oQ1PaVzdQ3YepdyZNnd83vLc3wjbvM7Q=;
 b=QZDdYNchBrVdK9QBpXvPDitph/2w3B0c3NkV6u04VXSlljHPc4H3ZO/laV0xCjzAd4
 sA7tQj/PZ8442WrUjvhZRH77m+/8ERaqU+QJg4I9QhJyQUrxWHgHAxB1YOMD7hliIdCN
 Q5/diYXjyjOycY2dMOgCED5dVZRk1bAeUNd3t6rBXhyzgOF12omfp9J28Q4tYWnLLA+G
 NTzR0uowli8QTPjNvTrxf1oHsEwnAgp3KxW952sBcLC1LZrRpDf1VP8wkcSUIjC+Srep
 YO91tJJgXqdz7cNYqReIVQIYoIgy8iXzLLakjnpY7S6tCsiBMIu5Rnmmu490eqpDlwXk
 IR3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPjbQuXno0UFNuKrqW8M1iNymOdboixQQ8pJatQFin9+5zzFllfRKM+Jq92/nOmtNUgEGXWWqL5l7sg700yt990XLW
X-Gm-Message-State: AOJu0Yx8V3PiwfDLlXREUrfpGaVoMM6gGy33GprQk0R8TXNjYzJIEJ6l
 4kQsMJ/n5WMa4BB1ImBoosP2/WFkoZtmypfiPprtu9H0L1Vk0t3l7dG5JgksGDXmYPtyJ1sMzWn
 49gl9SazUE3E1JklIEtdYaMDIOG0J7MpZkwBnjw==
X-Received: by 2002:a50:d581:0:b0:572:5f4b:bf2e with SMTP id
 4fb4d7f45d1cf-57832a3fa43mr4101108a12.23.1716466269820; Thu, 23 May 2024
 05:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-18-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 13:10:57 +0100
Message-ID: <CAFEAcA9zPQLzGPHcB8iFRga0cySG8uwRLE+V9iaxnhf_gij4aQ@mail.gmail.com>
Subject: Re: [PATCH 17/57] target/arm: Convert FMLA, FMLS to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +tlsPdVFBiDh

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |   2 +
>  target/arm/tcg/a64.decode      |  22 +++
>  target/arm/tcg/translate-a64.c | 241 +++++++++++++++++----------------
>  target/arm/tcg/vec_helper.c    |  14 ++
>  4 files changed, 163 insertions(+), 116 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
