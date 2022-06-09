Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp522739lfb;
        Thu, 9 Jun 2022 08:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnwkVLDbyVuyHjCsyFjSfvxMoZ92v1Z5lEnXUCqqofLV6C6hNEht+J4iEM+rWzR99ZMAiy
X-Received: by 2002:ac8:594e:0:b0:305:45d:7456 with SMTP id 14-20020ac8594e000000b00305045d7456mr6300502qtz.606.1654789096360;
        Thu, 09 Jun 2022 08:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654789096; cv=none;
        d=google.com; s=arc-20160816;
        b=YewdhW890e5FBHb0TNAqrYamMN7EXIzTUygp8EIlO0TGiO+ZVGY9VwqjXeRxC2AzlD
         jrDmXyeUDJ35y3ugUEonGQw/3yystXMFMrBZ1FY3xAe5ISnZLBS7ibfFW99ahM4whZaL
         Do4qLJp9ccYWJM33Sb6icEyX3pTVpWZpRX/RLcliPL3YPgzpF37Gcl3N4hL/s1SWExSI
         N8mPzxFHP2n9fHiE7jSaLouF4ppExyYDU/t6l3HByTB0/qvpC4gEJCb5FRHdMgYlFFRy
         4NHav1JECbIij65oIHiLMSLrBYlgTGER1NG81etqJ2WSAFbqGMeRfPuhGiQCXR+uAWIA
         I15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TaFoQcve8acmP52lu0Er4yQIz3oAJg3YqjK8k1Js8pU=;
        b=iYSJawEbRW3etqVRI2JcIXO8bFE77r04ER+n4kQrdKifWLKvvl0wLwHAbvoDkhKhSW
         b/8ZqTkofjPcdTezdG6K/gXH2l7G6uZqiXlhQU1I0Qz8gtPOga9VSPJknXjaWedm1pNt
         FDbhChMDuek1la/BQBp9JFLprVEtlPcnrfqjDocbaTfT+C9la5oWfWpClCrUUS7flrij
         +cLbYBVLj5LnlfKjqWsOSMA0ThVP6KgRs6ScVcWS58preYVg4FRkQaUaDZijQ7gQakZF
         A324lUYHWc/zlpYWmwK6sme+nGv+fltopGgE9q7nvAZWf72hPH5HDPwOKoJRIwK8486I
         Uqvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OksIUKCR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020a05621419ef00b00469bed5e542si11298780qvc.133.2022.06.09.08.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OksIUKCR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKEh-0003Jr-Ns
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJm9-0001Jj-3G
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:08:45 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:43301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJm7-0005Jq-Ae
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:08:44 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3137316bb69so49425367b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TaFoQcve8acmP52lu0Er4yQIz3oAJg3YqjK8k1Js8pU=;
 b=OksIUKCR616bNE4uvdj47MeK2U3Y0o986Kl6jB0E/pXFaLStNxRzxJC+xzVGiU/OwX
 MMbezHyDHd1crICqsDyfBy5XJP6MvlRLsLdqGYVEPHH5GFrTv45ECnuSRxoe97tKfK5U
 M+rwB77QuGBKQs+CUFtxDzh+6rApPeYK+smGSYRLKiXEuNbVrdkT0uIO+OG20a+QkBCu
 PX0CTp4SwuwRzkvUC4WDQYoxirjOPSD+fNq9G49l6hjZaGIDMRVi+onWaByN0geY+28D
 sdQzG7x2i3ShYBVZiGFpjTTX/+EHdp6eQ7loCZ7GJbcZmudTsHK9oPKcO3PvvNlliFhr
 LPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaFoQcve8acmP52lu0Er4yQIz3oAJg3YqjK8k1Js8pU=;
 b=EJEgZZyGqts9ac5uS5dDYmFiEc3uGrgCBeXdOW+6qfdo46QPMj4n1CAQFBBvLnVaI2
 43Zaj6RnoFG/HJkqkUNHQVNWg+Kgc4kHf25S8gozG95XPlIa59D2wVcXhr3uQScJlmws
 jWrBN8uKvxmzgr0LvyhIJ6rJIfHoE0yiIkhZGVZu95b32sVwJYeFTuaip4zYwz28CiqB
 F1ajHh1MtUiyDzEN9z4ZdGWAQI7WtKHwj6NwSNWnuSJiPCAS6Q2hq24CK1uTx2ST1zGl
 9p0PODU6siliDngrt1y92nPhuHqmDvpeeShmPkUu5RUh7dwbmNUKLsBwAW6RFxbNjeQ7
 PIyQ==
X-Gm-Message-State: AOAM531ASQwBe0ejpSpxE57th9aUrm/mxVLY1gFJG0DXuK+JGKltYaZJ
 uzq3IJHjNELDn8YTEZRn9tWdXyA7g1PMapRfT9Xq7Q==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45090247ywd.469.1654787321915; Thu, 09
 Jun 2022 08:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220605161056.293920-1-richard.henderson@linaro.org>
 <20220605161056.293920-2-richard.henderson@linaro.org>
In-Reply-To: <20220605161056.293920-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:08:31 +0100
Message-ID: <CAFEAcA-Op2HUJmibWeg0okHeS12SSYvz3mmf+9YE43hc48n6uA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: SCR_EL3 bits 4,5 are always res0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p1NoISz9ce4n

On Sun, 5 Jun 2022 at 17:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits do not depend on whether or not el1 supports aa32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Isn't this effectively reverting commit 10d0ef3e6cfe2, which
got applied as a bug fix last year ?

In particular, the reason we need to check something is that even
if the CPU is entirely AArch32-only, reset of the register is
handled by scr_reset() on the AArch64 reginfo struct, so on reset
we need to give the correct answer for the CPU and not assume
"regdef is AA64" implies "EL3 is AA64".

We should probably be checking "is EL3 AArch64 or AArch32" rather
than "does EL1 support AArch32", though...

There's a testcase in the original patch cover letter for the
bug it's trying to fix:
https://lore.kernel.org/qemu-devel/20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu/

thanks
-- PMM
