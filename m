Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3747315lfg;
        Tue, 11 May 2021 01:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7bzDf4nfpoUzJfPPjfVxPCHuaT3MsQYS7KUNw/rZp3aOYiXbOhc5Hpc2bTkjqRARkEJKd
X-Received: by 2002:a05:6102:109a:: with SMTP id s26mr23123920vsr.29.1620720359172;
        Tue, 11 May 2021 01:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620720359; cv=none;
        d=google.com; s=arc-20160816;
        b=jo8Tn8IYnr7oQUd2l8Y5LNBWJ710zQTwjdxZ3BVbwUhax0wEBZAFeajFmPdIy6BxmQ
         G+iiROSRo0dl8xzvfVIP05FWCqa9UOdBoAlkCtui00DjxOfFMi7Qdb76IJ9vlE8Tge7H
         Eg8Jf93K0atVeXzLmBq3yn2nCYNC7G7Fsn3i8MzaOWizlOR5JlxaP9TGCpAnRae8Gxn/
         +wT7PuFTcc2FEE3A1p2+e07xuGfTYO+985XjeXzLZBGRKZbxb4k0o0bVOVrLvcD7WfD4
         FzFVtcJAIst3w2PAEf0hWKkdEGDaesrFbFz3P5mGJM6Cf+hg3+t7muEJCi7MCvpZoDA3
         Eg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v+0sW2i6Uw8dfhyG3qxpgdKZhdxX684G4aHawd+ytqc=;
        b=gSMQIdyTy5CTIRFF+W5g+LkbiQJRy6rnHYPMp8ZKWQINCtfzy5sUyB6Oy1zS1UWZ3t
         FQUNzwgSYJnSpanS501a7Q8SqHaprjAXLmOUl344sypfBaD6EjTrcW85tCKc/U8L56WH
         7rV9WDwS3QUWI1chxODSl8mzBfUCF6S4z1Ol4/03d+mzsmtw9l4ou8THs0Tdt+LpiW4G
         MyOGRu4lOOfTlOUUKKZzFFi8Ug1HPzO23kPWQ7Ig40qja1e7X6qsGYPjVfFdGWBgh90K
         25mYPak6I8vGQ+390g7J5eafxUJ3C6i/ekayhqqYVpUwUd86yvxAKn2y97ts654wFXsA
         er7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dleuGq3V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si3292565ual.197.2021.05.11.01.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 01:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dleuGq3V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgNOw-000303-H4
	for alex.bennee@linaro.org; Tue, 11 May 2021 04:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNN1-00029I-Ls
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:03:59 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgNN0-0002zV-8t
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:03:59 -0400
Received: by mail-ed1-x535.google.com with SMTP id y26so21764599eds.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+0sW2i6Uw8dfhyG3qxpgdKZhdxX684G4aHawd+ytqc=;
 b=dleuGq3VF1eIs96xXuf+clsQ+GbTTqtkHZhnVfv992IRB950RxoEEe9czrukZ9F4dg
 8Ot0nUy4m47/8JdzLg3Pqi73zraurSCO3qr/aIuaG5je50DcQ9+gb5tDU1M/I6R2ph+i
 KuSpDuzouVECkqH781Y0h2WEuKINuenlxOl8TkmHpCQbmzvIErp0dkqKu3oabl99s8le
 lXKIS7t7Fao5/jMGWgx9VpIMoUeXN2ZpLGIZYCsp4Net6xSabDyNoa340vDpfAWiou1L
 O75zhRcEuRWkMrkkZBjNNFCvUWDBWn97qU1C7IUZDxveSjeckFIOtlhSyw8jyICvbsOu
 874w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+0sW2i6Uw8dfhyG3qxpgdKZhdxX684G4aHawd+ytqc=;
 b=gum6ExPa0NInXxV2x58v8h46WeSHxgthPlqxl/6NqSnpUFBaH0EVJNC3mW704Zz7Ee
 /1skaKWEIoKJC++P6uXAO+NkYWnaZ+p/OatkWtFZtyf/8ihdyW6GVKh66L0IImKW9V2w
 eMon1yw11ujZDy366jNMHYEXXkVywyG7ZDSL3ucJBE74ZHSuCQPE3p+7o3HX0apGd8fn
 l15ifEkhjZ5s/fqr900U95rjHDlM6ZQOYSMZyUgeEnXqeHpD/EsPO+sRKq4iSQIjo84Y
 w4h1KZpSn/kPaR0fBkJceRJfyspy9xccp+e9QGVY9lKvuUpP+PI0f5oc3n9FU7fpLFwq
 s6iA==
X-Gm-Message-State: AOAM531qhjJDec0i50xc7BiYCKyRfmmuST5XodGsnPW+COrgv/5lxkZv
 RYNk9fHZMekND8Rmwxmi2ZwXG9T7OBcl8fYy7Z9BNQ==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr34160774edd.251.1620720236789; 
 Tue, 11 May 2021 01:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-4-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:02:44 +0100
Message-ID: <CAFEAcA906ieEp=1_On4achMG_EHcUt3hG43VMuf5DZt-Lu41FA@mail.gmail.com>
Subject: Re: [PATCH v6 03/82] target/arm: Implement SVE2 integer pairwise add
 and accumulate long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rxFh9d+WBYYI

On Fri, 30 Apr 2021 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++++++
>  target/arm/sve.decode      |  5 +++++
>  target/arm/sve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 39 +++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
