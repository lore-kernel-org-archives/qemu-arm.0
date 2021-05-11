Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4133739lfg;
        Tue, 11 May 2021 09:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl89ZlGw9abNSVOK0SNBWO2X33dCQ1vyVCBTu4ZAfzCFpJsXpXFpUAU/kKmpMpjVWgAb2e
X-Received: by 2002:a05:6602:718:: with SMTP id f24mr22127296iox.59.1620749592870;
        Tue, 11 May 2021 09:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620749592; cv=none;
        d=google.com; s=arc-20160816;
        b=blKP10W1PQ5cRwenwvLDkY1DS4Hn77eQEWIIA0TupoEx79Y5trlIvSWIeS8Zn2LIGL
         Xc4JpDu2DlAVTOwjBAdpIAOtXhs25oqTdGksrbhg/u+4vy95B/huqKY9i74/N+Qx8f/J
         pXbvjnHmkzda7rgIbeyEUjgeb/Uaz024JvGY2Hg6pjfJlwi48xdH2BYVRy5abf4KGKLX
         yXk5Q2ilRQ3rb8R0hdwstsCMaaPMAYd0d50342LigkaT104NH0JZH/6NLMr5DojFbYeh
         8Gb0wFHI6bI0JbrdKjga2sQlubWUZucGuaK1s9vNSA+fkzKszHIMXh1sSVrtjePsBy/W
         uwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQDIQEIF71Ng6srpZTv9mLqX5s/ul/zEa4vmGZUU95M=;
        b=dnUkqyTo2JRNHGo7o/nxuOx117qAQO+IGiX4RcxlcEI/IIkqF3znVODOvjRsHo2vM3
         yGzbdrEvbYYkuUbMcPS4e4rrLKQRR4um0zhkcWE4x9JJNuKo/KTm1MgpR1/cSphijeTn
         tpq4mYX6rx78LPAwui2r6Z1AQ5DbajenNIrajKefIhsBOGw5+UkYCtHIY00RDhVFAtm7
         1aKT6hjpfDlR7zMGe5db1dd2dyHl+b+tKtYWWjulz/5Zh+mBgHGAt12rsh9JyVdoBQBZ
         4pJ9FFDZTgmlJ8ZDwRZb5QLUL+VG1R8t217xyeeYL8dMuK+kN/iQp7LZBXwOyEbUrJhs
         1QWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x4XdrGO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si7507793jal.57.2021.05.11.09.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 09:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x4XdrGO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgV0S-0000OH-5z
	for alex.bennee@linaro.org; Tue, 11 May 2021 12:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUyL-00047o-V0
 for qemu-arm@nongnu.org; Tue, 11 May 2021 12:11:01 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUyK-0000EQ-8Q
 for qemu-arm@nongnu.org; Tue, 11 May 2021 12:11:01 -0400
Received: by mail-ej1-x62a.google.com with SMTP id m12so30615497eja.2
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQDIQEIF71Ng6srpZTv9mLqX5s/ul/zEa4vmGZUU95M=;
 b=x4XdrGO51RfkyqzrmHK8U1XoxObwh4Slck6C1zBeP9r9kprsRHCp4+ROpCP9RC3tqj
 okD7aYW1R3qzpG1yuE17dxliiT/KnJMvZSNj3csqiGvB9c0AXX53hzihQdkiQcsuYS7m
 yOpUmz/I0+NBKUUFl9QNkGG5rvn82qJOKJ55iFd+2sj+2LjTXZZ0kKzMNc60+jtBGKrl
 fClxq8izllzaQEsac2aTlF1h9W9rQjryhTKBcU/m9X8aUGX/3nTYKxWV44ZVFR1vzOMJ
 DEaYvBwIFIcDyAoz/eugSHlLnQgxVhBwePnqrPU2BXkk8Bi+hHl+p+d3hiNrIz0MqR18
 7HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQDIQEIF71Ng6srpZTv9mLqX5s/ul/zEa4vmGZUU95M=;
 b=qyqqlsAKsjXTHRG2fVS/n0en9qFz2ivLqkhkSPPBSynlLJ2/SPUnpBki/MwiJqnXbK
 engBW1Ly0bsfFtnlHBdiJhv4PE4TmcPsB8Mjj0Vjq7mzRMI1BvdPFYciNXz5D+iHlDb2
 bCC31W0u+OEVpxpuGoMdLQQcmxvvrPrf3fNBVOYkshqcPtBXjU7eCOTWPMVRTZ7gtiQW
 FpANtlNc0Ur1jy4mxTn2RE4PzUWMdUvz7smgCIlbSn+PhFM3RcIntYsMRUyJr6chNJgv
 9tJo2fe59kHxsvurF/50K1Hm0j/JK85W1KULwq3eaLT+bWwKP8lXWiQ3Aa+dE9Mu/lvw
 Q81g==
X-Gm-Message-State: AOAM532xCGpn1UDHr0PGmuLCflfzYyNowMVocTh7EOrS8d1jHyxDeqEL
 XHGnEyiXdIONjYgKdWoL/uAGD79f4YXK2nR+nDMD1Q==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr3161919ejb.482.1620749458586; 
 Tue, 11 May 2021 09:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-26-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 17:09:46 +0100
Message-ID: <CAFEAcA9EKrNAFuPcnKg1oXMo27OfyJ6y1Lg=EMpas_D2VLsu0w@mail.gmail.com>
Subject: Re: [PATCH v6 25/82] target/arm: Implement SVE2 floating-point
 pairwise
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gC+trEc04Njq

On Fri, 30 Apr 2021 at 21:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Load all inputs before writing any output (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 35 +++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 +++++++
>  target/arm/sve_helper.c    | 46 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 25 +++++++++++++++++++++
>  4 files changed, 114 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
