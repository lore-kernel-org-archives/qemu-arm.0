Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1069721lfm;
        Fri, 19 Jun 2020 17:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwexrmUkEHmBSWDqsnZg5EmV3qrcIehzcvxOCvG17TDLaVB4GZHc4F5DsCVID4q3vxZYXPt
X-Received: by 2002:a25:2d53:: with SMTP id s19mr11118260ybe.172.1592612478535;
        Fri, 19 Jun 2020 17:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592612478; cv=none;
        d=google.com; s=arc-20160816;
        b=SGkSPt95aqdZNhkBL7UDJ0g57utX9bYCXfbBH1e4y4j0mlhmdDVrVwpELOhqmF0fc5
         Pq1AKRPwyPIzIEYh2lyDxuCzvi6yTEaU10KzmcecrV9IbM6VEp2gH0RgPaIWh54FSbro
         jZczXaZxYW7Xa+ThAfErRMC3DtGbVhc519Bo3DDmM0tAZRGpZDW+PbYs34licnwor9Lj
         +iKOIy4Gkw7jXgKiYOiKRl8KyE9RZOKq6tQ0X1Q6rETItnQk2uA1RBB5mqX4rKQDYV3w
         mhlTRGstKtVcNCkmFg4P/aO+tvA0vfw0BZvdfe4jFzGstHl8b29CDCVnKg2WPPRHl9mB
         kA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/0oDVXra3UOJhfTHeQ0tl7iPm0OReWXGWd+ERxzkKj0=;
        b=dItPvEWGrX7VoyV83xjCfqPAMewUhRErDIxuRC9qfY9kOJd9dSg71CAWJ+fec1CcBs
         GA61YHwIqzj40QJ5jzvN2pGtmvx/1+/lj9MbEhkZYluMakQ2/hxucQ+nag2rt0Y/kkvP
         WPGWJ3Tr7/1sEkkRmHFh3Es9br3uv4iLTYclMS6cwKu0Lbekkk5BgUUdIbJ1ie98tM2E
         DPzTOjKdME+tP8LKAVgYSwTcIdHovsR+L9+68XOt2i8qJY5J9plHUr+5K5VgrzvSgEuy
         7mk3/VQa1tTWjbX1714+D06C0NUNSAoeOsgXnCN+72+HqDuxapSOH6/i4dZ9q8lnn0FM
         RE6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsPwg6Bt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si6018236ybq.35.2020.06.19.17.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 17:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsPwg6Bt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmRG1-00079Q-VA
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 20:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRFt-000767-2j
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:21:09 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRFr-0007wm-HL
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 20:21:08 -0400
Received: by mail-pj1-x1041.google.com with SMTP id d6so5064611pjs.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 17:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/0oDVXra3UOJhfTHeQ0tl7iPm0OReWXGWd+ERxzkKj0=;
 b=EsPwg6BtdMks85dO286cZg8yzCwtOhBINR5Uvd3aCCvkAqYtP5jXC5/rK86mN/ClH4
 FJ1DRSI2BBuCgfynKhFGIeOnpMCMyYmTxcs/F0CYsbcxDJKLQ3nY6AJsp78WUgtKRmvW
 W63rkpxKTLecJB4cjTvQMf5IjmWKduKLHYtdSxmFAaWULAGGHWS3EqWbNgV29kISJcb/
 6GkYLU43KYRjNhPwoE+6XUroSPjN7rXdT+ngUBs3sZUVs1/FV5s5IEV22np0XxSspGmy
 hgaZ4ztJaIeyQyImEijpz0XKo2a9HSKWHm3hfVaVr9tEmefHuBhJCiiFYOqBoUo/Xgji
 m5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/0oDVXra3UOJhfTHeQ0tl7iPm0OReWXGWd+ERxzkKj0=;
 b=UwTPHKCwFAsBi63qatl1dHMU5zucYwT8fKhpfdC2thtNjRnjm1PMDD9ndXzjSuD//P
 TYQ6r04Wvr6Bk1huciCN6y1BSFBQ1w5TLh7K9Orwjy6bFw+BODxfjfEWG9HxIZkoHatN
 tK6kfbMZh3Y27a26UwAp7emHI3SP3Fqi45jAF19QOf61Fq6qaoDMytkuaeM7w7dGotVi
 fkcsnLxeDpqS03KDIG6vuwVZiqwjTKV851UntWd4eu2m3CtwZ+wAEsRp0vaByryIMCW0
 q4d3lj4wJj7D+FaT+vJCnId8fKDs5hq1/k6MeIx04Q7Ks4a75+lw0WfckhVfm/nDitup
 jT8A==
X-Gm-Message-State: AOAM532XPa1qKgiczlGQosmqP5EHO/dvmQJmLPnIu9TZzOC3XO5DjnUr
 8GsIz7YNyBsUdn6l6oDU9RXVuL5ArZs=
X-Received: by 2002:a17:90b:e05:: with SMTP id
 ge5mr6043807pjb.49.1592612466028; 
 Fri, 19 Jun 2020 17:21:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 127sm4650601pgf.5.2020.06.19.17.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 17:21:05 -0700 (PDT)
Subject: Re: [PATCH 21/21] target/arm: Move some functions used only in
 translate-neon.inc.c to that file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07fa348b-dc59-37d3-072a-c71c867b33c0@linaro.org>
Date: Fri, 19 Jun 2020 17:21:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f3BRl12EO0/J

On 6/16/20 10:08 AM, Peter Maydell wrote:
> The functions neon_element_offset(), neon_load_element(),
> neon_load_element64(), neon_store_element() and
> neon_store_element64() are used only in the translate-neon.inc.c
> file, so move their definitions there.
> 
> Since the .inc.c file is #included in translate.c this doesn't make
> much difference currently, but it's a more logical place to put the
> functions and it might be helpful if we ever decide to try to make
> the .inc.c files genuinely separate compilation units.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 101 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 101 --------------------------------
>  2 files changed, 101 insertions(+), 101 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

