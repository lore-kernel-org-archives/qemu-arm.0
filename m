Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1900682qvn;
        Fri, 5 Nov 2021 10:06:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx43KPzpGrVlUsR4vEaDrwqbJ18zp4fgXC5B2l2oTPYpHjlV4C4CDu5e2hzOvI/kdLZfeAF
X-Received: by 2002:a05:6830:1281:: with SMTP id z1mr4576176otp.196.1636131986378;
        Fri, 05 Nov 2021 10:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636131986; cv=none;
        d=google.com; s=arc-20160816;
        b=Cg+Z+CnEcaYFHORPvE8H/GsCGuJxiWgOzkgNiz8i2Hqq692w9pNh/X2Z7LlgrtGMG4
         25hm+CllXlgqGmjeE+FCkoUdRW+CQzSb5heXAC6Ew5Z1XY1O0NTR/d0yhqWs7YNTOUOT
         dVwA2W0xvHs068BV9llqModkU61ctrNi8+EyjgV6Gh9yEDWiUU8C7K7NWhEEpqdFMxZT
         J1EoKBDwXSB/IiPqdcKn9ailtWVW6BDfAyAOl7K5IJQe5bd6cqkVfq3MNQzyzgLye6OT
         jGEHrioh8SFHlnYq3Q4nYiqyIBQmAB4jQCg1Bt7rDLMNmew0u7A6uxdWj1MUuUBw/5rw
         Ox4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w72SCYjTiKkWFcl7Lv6BK+2xMPM0Tg2rSik4TuOz2pk=;
        b=ejgLOHyY75JXj70Etq/ImDblxaDYshYNf3UM7+9degnarI5WcxDAxyxdbheRoGm3pb
         FDtBYjS4n7mZWTxvfr/dMLIDv6XJMngybcc9zWKhmQsjBVQmS+X730WgQeCD0YdVoflx
         frTl/eFyVhT9XC8rjhWmDIpTuinvOy2w9nsWRv1K4ejYI6KbC96VJfd1Xyq1/U+2mo0W
         r2AoTRAPm97g8TbDJhvNxc+agSCQQYNzDpUOYuFUJtba8bRn1ZWRKn+Jc7uUouQ9wvcu
         phMKMmqAVYSx/Clmyt0v2GaP9SHLC5cZIwKMTmuqJyXEsNGBY6QDwX8Fwpd8lZf8lHT1
         AaDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=znSNiCzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si19525487ots.345.2021.11.05.10.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=znSNiCzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2fZ-00009F-NW
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fQ-00008j-Gh
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fO-00064S-Qv
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:06:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s13so14794101wrb.3
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w72SCYjTiKkWFcl7Lv6BK+2xMPM0Tg2rSik4TuOz2pk=;
 b=znSNiCzP3xftT4Vrej1r1BCMPPiQwhFppE+NtC8mZfxqqmOQ7PxEvOii4qNrQFH0TN
 i0csgJ8C01xQLkxw0Nu9wSqMWqD9kt4edsaasqbkIY04cFc2WcmXU+zqxitQM7dfgTHf
 0oNxqyyqtK90hyZsi+ymN+55yh/MKe9KOqrDYDx8ukijlOB42k8WZN/LFd2PeSmqDAOk
 prANDwQvht4KLhKhRctYc4PGCIBnRcz7lEn3yinAVIR2BFGHU9YO8AIGPSiJIDCrBN8V
 69RjJ/+1xBGsNCDRppihCerG9doHFM+Pb6iIQro6rz5DjR3IDUuDKLUraKk7A5dCL9+0
 PVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w72SCYjTiKkWFcl7Lv6BK+2xMPM0Tg2rSik4TuOz2pk=;
 b=b083qwvL+Xn+a2EpqNMhwSNLp7VuCX5vLss7usq97ENnSq6QyRjJaYIKUYYqLvZNu8
 wIVoXv+vnA8oyzOZz859CWbR5Gb5xJooqTj1cZ7aoIbx6rGR2n3zs5ka3Vq6oaYN3n9G
 xtFn/Wm2GpqMUUGE4tK9Z7TXCbqzth6g+2P9jUrCbhfIpM/UOebEIzTCHi6f5197LbCk
 jCejSK5WA18kWoJ72lguLYmCZnyw/wMBMCF6OnSWl89y/3QKwPBhnBkWNxpRYaigOjJJ
 5/PH4mSYgsuqNNQk5VtiZaJ0maLFYjXJyb6rp0cugSSAyIgx3OKf4125KpyNjOF5kf+c
 wcpA==
X-Gm-Message-State: AOAM531Gea8slaAAfmfcr1N6uTIPM8C3mzrnsCCSjYiLqXlJgmmJ0ZvC
 9kn16gR2aDnixg9dVWItrm2DGlPg/Rpj8zBqwB7mpA==
X-Received: by 2002:adf:c40f:: with SMTP id v15mr66203558wrf.302.1636131972702; 
 Fri, 05 Nov 2021 10:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-4-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:01 +0000
Message-ID: <CAFEAcA-XuXM-BLH3meg029GZHnOKx56X9GM9-ga46L7UaA-i-g@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] target/arm: Hoist pc_next to a local variable in
 thumb_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ywDuu/QcbARQ

On Wed, 3 Nov 2021 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
