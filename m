Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1267828lfp;
        Mon, 18 Jul 2022 05:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLr887aEHPjzHCIC9JbSl4r5aLUkWNTXiK4A7ppH7Yq46UGhgvbFI0wnKFR7jCAsVIHtOi
X-Received: by 2002:a05:620a:3194:b0:6b5:eb7b:e622 with SMTP id bi20-20020a05620a319400b006b5eb7be622mr2549043qkb.482.1658146571078;
        Mon, 18 Jul 2022 05:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658146571; cv=none;
        d=google.com; s=arc-20160816;
        b=XFUwH7QLU4wMRd3sKWlar6s+JxnTmzYadKaWlh2bttsdqQWi+esyQz8GHbbF0dSZ0r
         BRLFiPsD2XbMzupdaJKrrpS/LLN2CKFv3n5lKgLMLiKoUBnPaH7O/l+gquUPGz6ZU4VV
         IT2+RZh75XmVy9HsAsJRg7HVSObkGWe+o/OKAJksWkldtXR/Tgkaek0evyex2DbyVJPv
         hjhgFOih1Qgk7CXBlgxvy95emasaMivsbd7HVf8fdWeCO5aZmBgaXXodUq++2CU6XDJw
         pWB2Q/ceE7NChS/6seEDOC6Rh8nvK5TyvMWs2PpFnug5X1CuysdodiU9nVxXeyJgffeb
         Yfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PwzfG1AA52I9ppFKpnK3o0P8pemTGxBo4+qre3vlq7A=;
        b=Gla2kBCYNS4bfarvPfpFgCrpm+xJBfLenYe/3pZfA6F21LfFH4HaWqJ/A2DN7j9fBy
         AvXAGgogCALfOE5RE8abdxW4JJ4CPw0DCWckpRr+9e1OvP/DYecFDudNMB0RgTthY0k2
         eoRQk/rHUVr9rey3yI73wfyRYOEMhOFR6vovmo9JJoLSdBHG3KO3Tlulzt/1KtjJwjhl
         01hUPSApbx//FFTWRDKAySlixEI5o9FLEAaTJ7onG+N74UKXNwlq6WETxueM+BWE0p5f
         5q3UHb4rk3SsOAYpOnP3XaS+uVVY6tVG8vhcMRG5J3kgBnnuAFrN/0ntJ5AQoOQjBu9t
         JsYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otmyx7Nd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020ac8578b000000b0031edf878c1asi3545601qta.169.2022.07.18.05.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 05:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otmyx7Nd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDPfU-00071m-Qz
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 08:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPLx-0003rp-Cz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:57 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPLv-0006XU-TY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:57 -0400
Received: by mail-yb1-xb33.google.com with SMTP id k85so17642276ybk.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwzfG1AA52I9ppFKpnK3o0P8pemTGxBo4+qre3vlq7A=;
 b=otmyx7NdiwELMpj6cqRwkFIm8VJcZylqZVObK6Wj+MSj+a7KjlfYymJ0EwU5TA3wFE
 JKrNjd4EiMCr4ECzT0HnDDncxwiEJgnmk+NJunqYSnySmf1j3RsIsrlO5ZdPtay4c10s
 nXB3Ix1ibHhK/OM1TG/V27/dSCr/N+q10R7ucwDGs2ayMZ/VdXnAmqi5zT8bS00xuZ0Z
 52fXQT0q0ERgxgwZdsyjOVjnSrIG4RIeBSQdS+SlTNha7SoOEkGJHVOrYX58XRfpnk0+
 IUmxMb8cwlEbgkKAmlfRvJ8RU4GJF9ioc/wS0bUYD8POn9CxqqW4KILL+i659pVe4mMd
 4cFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwzfG1AA52I9ppFKpnK3o0P8pemTGxBo4+qre3vlq7A=;
 b=3iGMkNRkTOazQNp0hTke3mjJ0AwHpnUBzKnwd+EiheNMaLrDTFEBt7Lmbn+P+jROeh
 2bAp5+F9rVhuhLgvlxUnXVsZNSea08nPZ3HfLxIewQw2gNi3EVL4K5PL5NFVnYKJOtK2
 2fY3sQoaSFl0QbzWMKTsbvpm7UVwRuQ/u7f9eHg3smkV+SxZrWcHv5dpBP07iS7eeNOg
 j96MDo1BPqcYm7/zKUloJYFZapJwqaDYONSMRKlkg/2nP38dxRsFZV+iJdC3RLe9HaUk
 rI9RViRk2Pv+dZt5IRNsQEge5+jIEKJ1fmY9AgsgbMRHAh7iBvt6lcQGWC1v13Cx0scU
 vocw==
X-Gm-Message-State: AJIora8h0KJcZwD+qcoXzCzaRV5L8Wuo3gyafpw5tDUDNOZ91NbYOq6B
 h0G+mbEKhJEzHkI83EV75AA3zxnnRNPkkCStH9WQow==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr739371ybq.140.1658145354934; Mon, 18 Jul
 2022 04:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-26-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:55:44 +0100
Message-ID: <CAFEAcA8b4cnUvJFEoAmpBhjeMfoaLxSntMB08Ahvq=bYQ__03w@mail.gmail.com>
Subject: Re: [RISU PATCH v4 25/29] Remove return value from reginfo_dump
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: FDB/oUlpCTSK

On Fri, 8 Jul 2022 at 18:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No uses actually checked the error indication.  Even if we wanted
> to check ferror on the stream, we should do that generically rather
> than per arch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
