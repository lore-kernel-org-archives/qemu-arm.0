Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1168918lfm;
        Thu, 25 Jun 2020 03:56:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/8/d7MsLl2SZqTwvCYkc2qTsRZeORHro7B3+d3fCVA80neuEJkZzpKk9IoMVa8YLjs1vd
X-Received: by 2002:a25:c186:: with SMTP id r128mr52444935ybf.92.1593082573666;
        Thu, 25 Jun 2020 03:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593082573; cv=none;
        d=google.com; s=arc-20160816;
        b=NFrWDV9yPLo3iv3bzc5OEQYT5h3BtiIIIU1nvb+UlrM6KBY6Cw/6B4esN4wSeUwMGt
         0KIwqv7h+++a0sxNVL8FJMah0ctWu0boxAxTt9G3fnjUXl48uN3T6+JaPhdE+H0EoBFa
         i+CLRzejFqu5FiYhqVbqXTZywZr7XzKbacbZJZg0//XQbFMgM8Zkale0fMZEydeUYXWf
         DuDASGdVqLeXk9PkCyjpanTcps+aF6Acoxyqe6/J1D6JyHC7lRXAm7QxUrlp6trmFW/f
         C53WbvNtRNkEg+KQRQMqUARaAoT0FzOa67vNWABr6NsItqWqEZVaIyyNJ5BYx6XoyaUG
         w3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q2M7GQPC2tQspLAFffQmoNlxDsOGbT5YJ7CLVCmMh0U=;
        b=v1MyaLaZxdKVa6wvG7srVA7Q6r7nRBGQkj8ys3C1aSOnWdI+v0BZyElheEL2P/22Xe
         NM3xccn5u0oDwgomf6Ti6zv7UaiTMCExB0iMOkmNo/ZY2mmJh9fRwc3ADY2Ga7Our9Bz
         AiJz+aLlcogd6TGB6J7hyG9kgroyeswn92wFz1mbS/3yi5n4gjqGfrfd8y/Kb4OUxVgS
         q6UOCrg1EhYnU1NJxEx5f+dcC2+TzlRDQvhjvMM4at4sAxaNw+42zSTwVKlfIYOzcWq6
         xruD2hJ1oTzby5hWy/TOm1b3s2STAeY6Z+jZQT5mDq/FDHgBx0MDeoaDLlimTeLrX4km
         U+sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hArdeGkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si1093843ybs.401.2020.06.25.03.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hArdeGkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPYD-0005Gj-4I
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPXt-0005GC-G1
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:55:53 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPXq-00045J-R5
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:55:53 -0400
Received: by mail-ot1-x341.google.com with SMTP id t6so4813938otk.9
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2M7GQPC2tQspLAFffQmoNlxDsOGbT5YJ7CLVCmMh0U=;
 b=hArdeGkloosVFvDlJRUPV5UQd1ms12Z1Z/HFYM5jFJt54Nvzmgu+0rMCKUmFyqSlX0
 zqYPmZyewUrWyBjBXvike4u1bjenov3xWbMckyGB6OHjRaAZw6tra+U1Zixu1yB7l6Ek
 NA/sqKdUpKoQSBHfYCKejigNFwWAjs0QfQmMsbNW8uuNwQLoIVMDEQz9iiZulFhPVHxq
 bhlNcp1Z5X/qOGLUGrmD3GyWzwe+io9+b94ZQAII3PWvq2g4jQAoIINQk0WH1eHLhYN7
 qWdHKAt/LvH3WXSaqfGd3rfab/ZM5FTTufK1sm4IZCr2LBV3db55lzWeq3W76/7fbkIq
 xS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2M7GQPC2tQspLAFffQmoNlxDsOGbT5YJ7CLVCmMh0U=;
 b=NWYHHMRNZlVk43nJNty3RCLrw48yYb/4rTZQ5qzCcfqBSAb/RNMEhH3VFUgiC3zXM+
 P/M068iz92ovdhvp4mVhY8X4wH1sD76vBbeHEuPAcPAgmhquIc2ZDsnfB4KEQPirov4e
 dT22mgHQWu/TwSpl7i4JOIK4Pqde0q9xKou5eja/Boi41gz3lpy3qaVWNePusrEyWrlL
 70wB2d5V/PDileLqfMF4xD2KL4zMfSeyQN1+zTBHSVUoTZcUng8o4HLNQCUZrjrgBtpo
 Ve1tzNsxg84OFXFu+EB49q5qm3hCByyL4tFHeMocsGo/IPSye+dYv5ZS1c4/5HeSBNFz
 XTNg==
X-Gm-Message-State: AOAM5312/hpWprS1HZ9NPURBU+SR7Glme3thtw8TRYitpALa3ZUQqVUZ
 6HFa+NzfE6uBArBLOIdn+VRo+4yvf/UQeDEjaAjYQw==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr26091000oto.91.1593082549370; 
 Thu, 25 Jun 2020 03:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-26-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:55:38 +0100
Message-ID: <CAFEAcA_Hp2MfmTJY0qVZHVGkppzCaD_ZF8TvCMDVJn_XLYQ-+Q@mail.gmail.com>
Subject: Re: [PATCH v8 25/45] target/arm: Implement helper_mte_check1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEsbpK/Lqoxh

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill out the stub that was added earlier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Remove ra argument to mte_probe1 (pmm).
> ---
>  target/arm/internals.h  |  48 +++++++++++++++
>  target/arm/mte_helper.c | 132 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 179 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
