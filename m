Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1313420eje;
        Mon, 10 Jul 2023 09:47:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0eMm0P3Yhrb+kInkXnM+bO/jJMNX53x3RcqXTz8ZP6HBzes7IWU9QXsVWW905hXgJKEUP
X-Received: by 2002:a05:622a:591:b0:403:a9aa:56d6 with SMTP id c17-20020a05622a059100b00403a9aa56d6mr7684256qtb.58.1689007640496;
        Mon, 10 Jul 2023 09:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689007640; cv=none;
        d=google.com; s=arc-20160816;
        b=Aa8qCK54dRBhPOfir/1v3dYnQBWONcyXOvZS7AE5Gn1vPEh/5TTcdaVonu3iUHxStU
         IStKBkGmpg1f9F9xjLU1s5HnMv6p6PkV4RWARYPsVu7Z9Kl01m80OZdVf4HzX25woOBw
         u4g/AK51eSZxN0xMfi8MKoL3XiDtPOwz3pT1E/Z0StaY05TkeBOPtZOQIV0lYcBLFgLB
         YIus1WKaSGqC2oU6VCRQUrP8l5IISxr0Sk28fM1FoYSPzzFVYs7hNx5VnUyVWRrAw4sW
         77WKt6RLCdoV4AI0x5lZRfbxY3CXarbKgZUlodfsoUtgol5L5c2QumeRsU46+VBkC3zp
         /t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hzXuJiN9pCFADU/dX+oImSpOI8tpQKMscKL4VxNjS/Y=;
        fh=DjFcf5x540nYnyRj+nrzzvmu8+sx0bTdo0fYzBaWDzs=;
        b=G9WqsehsVlVIxX1or/LdLC2u/ppY7+fX0NE7skdF3/NF+WM/GK4EW59c0Rx31xLHnC
         2x1pGS7tkfdudpx0qPFxvttn81cn+hgsUIZWfWMmnp12tC10d8LohkZ4NALQTL1dJPkt
         5rAN8C+QCamD0wAcKf7ou3SseGve/ttXAH2QRnYocv++DexX17rWaf40UbX8tKq5vPmK
         YG6vyCKDspqqrPfMObO4bCSBu5TyvY9m7fjhmJut19hbh+m897Q/d6MW4gygILzhYJCN
         UxyXSVdQciXM3bSbAuAjpUrkagto6gqINr4k8zGCN/4/nBHZycvfOGhCkSIeF7ZzpUCM
         706Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kG8qIupq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b00403b39bfaeasi65630qta.602.2023.07.10.09.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 09:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kG8qIupq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIu2V-0004KP-Qw; Mon, 10 Jul 2023 12:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIu2K-0004Hh-Jn
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 12:46:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIu2J-0004RT-09
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 12:46:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso4134964a12.2
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 09:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689007613; x=1691599613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hzXuJiN9pCFADU/dX+oImSpOI8tpQKMscKL4VxNjS/Y=;
 b=kG8qIupqPL7swRnNde8pNdHuYnzeJIHnDePL+TCVu6uZNCgQyW6fh9jfIUfqSenAYe
 hOYRycLEihYxTdxcKL7hxe1mW+dmTvlXPE2myFTB/ySZz1BqQIOA607pLcuRTRO0lRY5
 ttfpJyOt8l80RPxJBNRFJyjUlh/g9DNKUV1YRH5S2cP7YEyOIcwDIbd4UcUWpXaWksYb
 R2NZT0GrI564pHxwdl5gJ85JJk0uqGHjHw+fztbBWfxF0ubf22fJSsW4rtT0vUxgsgyG
 KfQ/pKdMh/Blye1/AeGoc4Q1TNEY/Uo0ab/TJzr4gClVuatZzHkGt2MI8vU1vj4VVmAF
 XzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689007613; x=1691599613;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hzXuJiN9pCFADU/dX+oImSpOI8tpQKMscKL4VxNjS/Y=;
 b=gaELDYms9AtlpckdtzsEwXbQr37cyaUBYK6LI6KtW4/YqcyxK9GuFFBrcS4/DDklg7
 b53QmQ3KDv3RwY+LRkaNUzW7xApvv5v1XCafd2ul9Pk8/uFMX7NEHRD2b0HsAZJbHrnZ
 4jpy3pEebMz2+3jk6l6ugJKgI6pI/Ekjnqj3qgRGjtkVRY+lgaMKaSuHtGgEvgADkdhk
 1BJfiZr36ZfshoQPzwIYIEWFm+NJPrFqPNAi2fwmlYRrwuzoNpmAZAbi7hXycZB5FjaR
 ybmnYYmxGNS0+zF46vw95gBroL3kHJlz4sY+bifteaN2voChD4d3wATMrQ7FJnJamKGK
 Tz/A==
X-Gm-Message-State: ABy/qLY1zUjRSdC5/HKoB4T1iNb5mmHwQv+gXzDrr2poFDv2yR/QlYhL
 hwUZh4Jjb1jpe/YFyXglHFCqZo1HLvMv88GzS3SFJfKxQhnFOkTT
X-Received: by 2002:a05:6402:2038:b0:51d:95f2:ee76 with SMTP id
 ay24-20020a056402203800b0051d95f2ee76mr12232978edb.27.1689007613161; Mon, 10
 Jul 2023 09:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230710152130.3928330-1-peter.maydell@linaro.org>
 <20230710152130.3928330-3-peter.maydell@linaro.org>
In-Reply-To: <20230710152130.3928330-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2023 17:46:42 +0100
Message-ID: <CAFEAcA9=8y84p_fFQE1TYa4f=HoL0ypy=sf-sfUXtSRUOjVDaw@mail.gmail.com>
Subject: Re: [PATCH for-8.1 2/3] target/arm: Fix S1_ptw_translate() debug path
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e/Sy0G6PInKs

On Mon, 10 Jul 2023 at 16:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit XXX we rearranged the logic in S1_ptw_translate() so that

Should read "commit fe4a5472ccd6" -- I put in the Fixes:
tag below but forgot to update the placeholder in the
commit message text...

> the debug-access "call get_phys_addr_*" codepath is used both when S1
> is doing ptw reads from stage 2 and when it is doing ptw reads from
> physical memory.  However, we didn't update the calculation of
> s2ptw->in_space and s2ptw->in_secure to account for the "ptw reads
> from physical memory" case.  This meant that debug accesses when in
> Secure state broke.
>
> Create a new function S2_security_space() which returns the
> correct security space to use for the ptw load, and use it to
> determine the correct .in_secure and .in_space fields for the
> stage 2 lookup for the ptw load.
>
> Reported-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Fixes: fe4a5472ccd6 ("target/arm: Use get_phys_addr_with_struct in S1_ptw_translate")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
