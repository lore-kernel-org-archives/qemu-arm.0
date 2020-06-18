Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1560872lfm;
        Thu, 18 Jun 2020 04:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwctYX8F995Ju7l+V6DrCnwR9oBQ8Rpj9zw9M5jhHeu0vnUvHGFD9fy8BT6Q3T/tHlKUite
X-Received: by 2002:a25:e08d:: with SMTP id x135mr5666482ybg.482.1592480918783;
        Thu, 18 Jun 2020 04:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592480918; cv=none;
        d=google.com; s=arc-20160816;
        b=xRjwUzEn6tl/sfbY6gPyP/V+UE6Xdg22lX72vR8fhLwDhgG+9hsU9ivLPZJyiyg4HP
         PUGNuemunlxT1KEIRMh+RnQmwNDWHenP0vE6rAw+dSBsSdmJ5Vs2GYypU1L55e0iVz8O
         35R3Y9DM3YPfoF/SrBGipdM+379hoTPIEamWDd9FqMgynLn21kjTAw39QduvMxCT1i80
         b/4jvRGVYodR/mhkIXmry/rXSjWrV/AeyusE9Huugtu+4Yq8ran9ryo+QhLyMoPpBTfr
         E3vxj5MEV/3AFqWf+dh3i0MyVpczGulVL4S+jqvAXq99R11nuBYtlpJH5XcMCxXgn6VF
         yjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D22VcfyRjlQuALjFU0ECZnILjd/N66CzW7Qs8JAQl+I=;
        b=RQlzqxwIaKcet8HR949MnGTTCnn2tG3dewCcMkNbsO02lO+KmMBvIuTozh8LvwW1ue
         w7WGlmvdQikYJwu0NeARkuWDDnsYZqVPVfviZZbfacYMKEPibc/599Z6zMSitT/eshw6
         FWzBRvbLR9AUpBF0/wsNdQDfGX7wnR4MHoneubiVS0Kxr6zDKcP1Gjv7BklQmyHWDzRl
         pziMrWdHZGK0EtTxHoxUbArqfhkUQvEe6tGj8X7/BlOEwB4rte5Gc4Ix6sph+mtdKhW/
         /naVkcop8KCY+IAWyJTYBYNd+RDMR8ZZIK2wo7ryfgFH11RKOK26F+3C7qLNYC1ON6Vq
         fzhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdKSbcPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l70si2286421ybl.11.2020.06.18.04.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdKSbcPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlt26-0002N0-35
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlt1w-0002Lt-Vr
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:48:29 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlt1v-0004dy-2N
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:48:28 -0400
Received: by mail-ot1-x344.google.com with SMTP id k15so4263970otp.8
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D22VcfyRjlQuALjFU0ECZnILjd/N66CzW7Qs8JAQl+I=;
 b=bdKSbcPujoI86voW0veg6fvB6cwyUYUn1icJB4A/TEa9GlUrWJ6/tG/fZIrj+or0Xh
 v9VGalXTiXrpH/v3SZ5MdnRei/MXxpRPapvzIHF79q3Z+kTeI52sUMtxqYY4uBKfqBTJ
 bF+9tHs4nzu02UFMDzfLSTTYqpHfUwW0U5ynt0Uoedv4jwtdrCcZA55Z6V9m38jm8DVo
 7gtzgO2hiOPhst5DXlK1b3giKqp+DxlOJ4XYAyKk6QTEW+ADAvM8srfiu8Z6JBaMRZcg
 LjjLW8MkjXTTE0zWtqJEfXWzU+7XFsZBlPaJy6OZQUvgyFlmmbAxKeaR2NXV9jH91Dx1
 8OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D22VcfyRjlQuALjFU0ECZnILjd/N66CzW7Qs8JAQl+I=;
 b=NG2PQtUSLEvb1s4PToCc5vq6KJ3rgGf9iqdob8J9iUKdwPtTKEICfd0vbA1g/UyL9/
 GNW/qezdaaSYGP1zcI7nvLKeXa2qwNOvawT6kkUHRJfsLRh2ILLPY1zq1uEFVqO88b1I
 tqBKu9sUyPjzO44iz/WBVZbl/xkMqIDybULM7C+7JuTatzdkyHdMju59mbq+6cQpbeX9
 L8nkjjEMBTPHiDDeFv8hWbAJgONAgmJ3rXC4UubckGG/T50m0VRDSVlJHsktR3jmGRD/
 UTH/qG2n3ePz1lwj13QfTbI10aD47SwXJ383/diL3/0zPXl63hFTqTc7TOZtMe8Rv3QD
 CdQg==
X-Gm-Message-State: AOAM532WIWQOZ4DIvf/jJ+1bEFExG8zJxm6+YgogxvJwHNPvTZDOieCO
 BachxTabLO2gdeQ0JlsCkL1EtrjuEv6hLMaGiXZB7g==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr3120733ote.135.1592480905704; 
 Thu, 18 Jun 2020 04:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-10-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:48:15 +0100
Message-ID: <CAFEAcA9pgcfCrTXX6_9_ULhdiBDXhwdZw0Mv3prCcf_Po6H=wA@mail.gmail.com>
Subject: Re: [PATCH v7 09/42] target/arm: Implement the IRG instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zgGfgQW549pn

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update to 00eac5.
>     Merge choose_random_nonexcluded_tag into helper_irg since
>     that pseudo function no longer exists separately.
> v6: Remove obsolete logical/physical tag distinction;
>     implement inline for !ATA.
> ---

> +static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
> +{
> +    if (exclude == 0xffff) {
> +        return 0;
> +    }
> +    if (offset == 0) {
> +        while (exclude & (1 << tag)) {
> +            tag = (tag + 1) & 15;
> +        }
> +    } else {
> +        do {
> +            do {
> +                tag = (tag + 1) & 15;
> +            } while (exclude & (1 << tag));
> +        } while (--offset > 0);
> +    }

Not the way the pseudocode is phrased, but the effect seems to
be the same.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
