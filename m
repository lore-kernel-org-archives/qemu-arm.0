Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp288059lfm;
        Tue, 18 May 2021 03:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCPtlJlnwCNYC9e3/P8iKO/C+gPz3mShEfkxlp7zqh/HB64fQnckuNpUKVeu5jgbJ+AoHn
X-Received: by 2002:ac8:51d6:: with SMTP id d22mr4023295qtn.67.1621334802681;
        Tue, 18 May 2021 03:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621334802; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ3v4iQykmBTE56QUmdh1XkBJFPqWG4IgHcyc5q5wJOqUScXLC5oekwvwqRAgCqSka
         6UkXswjwbzYiTMiFAc4EbvTwveB6WvJWrWsojAebOY4Z0TIbZvjWs4pMCGBtvYDC+kpn
         keA74ruv8YYiz5xtAYRejk44ZkNmF5u0Ws2X9gMFQoAoruFN6orcPiqn5bJMkqh11/61
         v58aruoeAjXYSkUXBpWWrK483ogAoC+i1PlG0n/dEhEkQMC0dssonoB/hju8hAnnGFzu
         VI21RA6WAdCR/dKNBxQG6c9ODHUKxJ1KVnF6SABJ9V0HMXRxrJqkWpeT3mHqry55o15r
         Rw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CwoqYTsE5sJ0vcf/gmzePZhOnMqbJmbTbU09GZFU6hw=;
        b=XLgJ/TVxgm8iN7SmnjYneoQDrBCiAt/+RPIYQb6B3A37gs6QfCq8mopq2nSPeFJ6UC
         5ut7uuTr7DGE5J6szKcqJXEvJw2NdGn3yhNt+xh3yVPf4v+5lGIvCkoYE4xwVooauYlF
         D4Kz4GNgq5h0ojAKkJQ/bDb8Ac+jDp9mz5UufQbNKSciNgsn8iWP99GTPTlGqtC647Cc
         ZoCc1psXs9DqALsjRlQeItbMVBVRaAoo8COnn6MymhFHKzQbykH9ofM2hWun6nQ+E0oG
         iEr2keKs4Xhmm9meLfa2xCas+zU/a7ioUyLJT8e3l6SXKpqt3yqMMPdTMUdlNwDyNE23
         6PJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ExNPJaM9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si12567274qtw.371.2021.05.18.03.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 03:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ExNPJaM9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lixFK-00043D-0G
	for alex.bennee@linaro.org; Tue, 18 May 2021 06:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCy-0001BN-Jw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:44:16 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCw-0003k2-A4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:44:16 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h16so10531401edr.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CwoqYTsE5sJ0vcf/gmzePZhOnMqbJmbTbU09GZFU6hw=;
 b=ExNPJaM9rvRNZTAjIOjHSSOtgPZcTwqM24zDEDFqVYcFemvXeytvtEDzZQeNZlHhyX
 xa5FhKnibRVk/JfuTOYcNx42dP2ByjbrXpOwdvyBNyB/Jqv2lp1OiM4Af4h3kZS1icSQ
 Fg3H2wfMMpwR5n4F+TlMaiX8FTJ3CMK8TEg3tjherPT84egUa24gZETjNSDxXzkcsXT6
 5u2GJYk0eWiKAbNGakM594mmpYjDWvrVLK6uTC6qa23WLAlZ/iEOiaaqAuKcBi3p30hV
 0DvbSVJ0BXM7Ic5IsCcTMzOMoItqBvDt0dCtdzsw9WbNtOIIVJ67HIuHAz1sKU5o3mkU
 MLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwoqYTsE5sJ0vcf/gmzePZhOnMqbJmbTbU09GZFU6hw=;
 b=NB9S0q09SYoBHu5vpVNiyB3rrLVw2LYApcMY1aAK6VJG6GS6U5zCYMcFHZ1LGCoKGL
 xMVjxyPyXZqWsFEQ6apn5AIA5Z6h5gQCdM0eXyGr0Jo0bafe/7SfnjStFMpHAMUMvcrB
 YrdumtkZmJClKi8IpZifKdXHCWDr03NFzxwuRifg4LDV29UieU9951Z+52607j2moaEH
 mxw60X31kKLtI/H0dImtOE7+/dGGLqqOJFcEzCNnYrCxbeZjpWAtcN5EJNMIlSQpLSIZ
 hEXNqs68Fo/qjVvjcd+fRF06KxHNKrEOC+39LGM4Rrek5eG1ebxyUK/BtUHe2aBLHe9e
 osLA==
X-Gm-Message-State: AOAM531hGQ99dtmrJLFlRsKMgHmVOHD9++iMLrYiaEQHTY4RxftMFEfb
 saK2SpZQseQgbe7NfR5r5RvNogrNVkNBh8eWseJDqQ==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6286515edv.204.1621334652906; 
 Tue, 18 May 2021 03:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-3-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:43:56 +0100
Message-ID: <CAFEAcA90mh3P26ZKScTb_aHxu70LtSAX3kbtgpTbDQ9t-wd+Vg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] target/arm: Unify unallocated path in
 disas_fp_1src
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: h12mEAvNfKLz

On Sat, 17 Apr 2021 at 01:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
