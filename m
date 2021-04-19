Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1348241lfb;
        Mon, 19 Apr 2021 10:06:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUmpjZO4MqEOMX/O79VheKBv+x2lUPceh+fXp2xEc+SW19e1XVOLjCIsrxbklwqUQCm06m
X-Received: by 2002:a92:cd85:: with SMTP id r5mr18696793ilb.169.1618851999263;
        Mon, 19 Apr 2021 10:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618851999; cv=none;
        d=google.com; s=arc-20160816;
        b=NKtnjmFpA2SBcIviRKRaplZsNn+z2/GeXoO5bB9Rj5VoyfyPfqIXRFT9DH42W3mQ65
         NWcCZuKgTK69AWWIOpLD9u3EfELJgj87mu0Zk8UrIDsZVYutQJsos5whdj2aPVVsim3t
         SLa+51bhJkgyBaCURips/5HtiXoahGL0d3N4FmNBtEJZbOJofd+Ssyml+XlpG83CErXc
         TZUEIEg9jrlIseXgwGK5S8X4yTHD43SWstPcQRx76atoPsWBhjzEQKtS1oFZFntWfkio
         vtWT7jpmvPVliRwuoGWX4JpTs38m7Sk8VhLVyNdyzIjGuJucfVvglpG7WEXk16KhIqJa
         s2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=htfy3zuaRIRYvd+1WLz7TqkKq5Lj15GMTXVKjcjCNiA=;
        b=QbhSdMLgTUprdz9ZFxp9BRNY44SOQJmgsqw3kEyCKgY7WQbjS/IppDwrrxHvY9Oq85
         g6IEByWjormEpXEtZlVc6ZeBCk0Kqpe5wVmHJBfKfVNIIbaXw9QXsAgP/2GnUg8aIJh0
         cl9nev2qLO52JCMKeDemoAor73AZn/ebaAAJG8OO3StnWdaQr2kQPS9Qny2RhBe/HCFV
         OCtG4XEFHKWE8OB45MsyEugJNxOL9OYg4gD7SWlzAXh0EAlTTI1poUyvkx/DLF3eXQ8s
         JStIl6pg6CXVsENQ3tr9ijlKfCjB/OTEJjRQM+R2U4dqg+Wo9ukAYrmQqMdk3PEIf/PO
         lufw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzHVY81S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si26180434jat.67.2021.04.19.10.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzHVY81S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXM6-0005qy-IU
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLA-0004W6-5I
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:05:41 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXL7-0004jc-8M
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:05:39 -0400
Received: by mail-ed1-x535.google.com with SMTP id z5so5129826edr.11
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htfy3zuaRIRYvd+1WLz7TqkKq5Lj15GMTXVKjcjCNiA=;
 b=nzHVY81Sre870loX7bjTx+CPfQmog/WzVgAoGRGgNAILXA2DOfcWIPSLQxA++2uldP
 8Y1UtZX1g81g7OMF7Jj1ivnTeobELnZtQOtIQ+odH6k6mfbibfeVw/H+OxYf7GuDXgwv
 Mt5XKBhiNo+CZQNQ9T0joqozKeEIQj1W/mQchm1D852WzmEf8lLfDPjkVBh3ZHbB3zTO
 mjj8pfJv78DSQtXF2y6ublJDQuUw2P+vS0zuhML1EmuWo7qVisylbaM0/8j3isuLH7re
 RPbVx424rVGk+aYkVaySmBwpfUOoceT87cVZ8VBCzceGlqEKYwi0rnaQ1LAk/RtkQYxp
 CC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htfy3zuaRIRYvd+1WLz7TqkKq5Lj15GMTXVKjcjCNiA=;
 b=FHsBvKHEcRWKbeb8JbTm97jVIK8YbyyMmEMtbhLL54yU0M1sJtqeNYi5kDTZnNOXtC
 2XEoagd0mwCfEM+r+/1+7Wt1xZaME2fX+i0v8DyupYac0G7W+vo0DEpzpLQYSdqTx+S/
 TE9XKwp9vYoEDZqW4UCLOZX7fMRdzinAwdLROsh2ngHvSjqO+50qmLXo+jGrekJ/PaYQ
 hx+kDEJcLnihVHin4iKsdavK8wsq+x1mbjRTm6I4Rn6i0a4Nel4bjhqsoiX0qUjdVqEN
 6yc53tGzgiF2GgzOxilJT6PYBHtBIWcJbsswn+bhI41WikCBdLQixETmz+3dixn5Km8t
 f3Ng==
X-Gm-Message-State: AOAM531nfcW/m7AQzR2ns4KtSihYyKsPy6TlGz4jXbfkH+QsCWlGF5Zr
 h8uZYfWqRNKcWT0ssY3UQSo9DXal/lr834yr+7c//jZrNCc=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr26421771edu.100.1618851933835; 
 Mon, 19 Apr 2021 10:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-5-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:42 +0100
Message-ID: <CAFEAcA9hGnqB2Ztsk=kUQ5djZONRO541+XvnmUCK8FA+BCCVng@mail.gmail.com>
Subject: Re: [PATCH v4 04/30] target/arm: Add wrapper macros for accessing
 tbflags
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
X-TUID: /+2CRyNcThv7

On Fri, 16 Apr 2021 at 20:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're about to split tbflags into two parts.  These macros
> will ensure that the correct part is used with the correct
> set of bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 22 +++++++++-
>  target/arm/helper-a64.c    |  2 +-
>  target/arm/helper.c        | 85 +++++++++++++++++---------------------
>  target/arm/translate-a64.c | 36 ++++++++--------
>  target/arm/translate.c     | 48 ++++++++++-----------
>  5 files changed, 101 insertions(+), 92 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
