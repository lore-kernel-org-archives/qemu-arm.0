Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2896369lft;
        Thu, 23 Jun 2022 05:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tz2DnzfxBOP/npWwxZGJY8yTszxx70mz+vlefyVLgHvZ1zkG+iIEiuJLkcKlJyQIvS6qy4
X-Received: by 2002:a05:620a:f0e:b0:6aa:318e:55c2 with SMTP id v14-20020a05620a0f0e00b006aa318e55c2mr6048993qkl.577.1655986026264;
        Thu, 23 Jun 2022 05:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655986026; cv=none;
        d=google.com; s=arc-20160816;
        b=uzLKetAcmNuy3kaDJHKR2jZCuIb2iTeGLzCWRb65UghrUGNyLrgqe0/wpvmNvCZPVq
         AEhEY/bA20kRXToy1hOifz1kAz+w3eOolZvpMGhvc6RmvkN0Kh74k1pIQOYAJV9wVBqF
         b87SN9lTqDij84MqmlTtCwHsTW9sBVqE+bA5pEzZCF8ttokmK93K9Pxj3LPBcKDpync4
         hQj7GAlOjArtcxCbByj5UQLuqrU48JoD5h9nxAoLisgemmAgCt13l4Wwe6g4Ng0ca0/i
         sziHUGLLaX01zhAX+exhaPjI57lz/MrHmUDGtUptICgBPcT07fVrChlFatkctIblnRRJ
         d2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DkXZyf4XVgxvMEzuQ9pmvMILwh5omCXHYCnRpLuh43U=;
        b=tKFEjHwyRkuuAO+guq/5bG0x5j37GyZ2FIqXKNnnFuqkJxyu5eNO1UjNTkWKg+iUpb
         ZltzVXHCTwzgJ4xt2a2bUql8CL181b571HqEQbk4OACFkzOZMWvG5SnwdqML8wdfXwzb
         xAWIS52yL8tYwPJo6A6ealN6VXclnoYID+aTe1oKYb0vkeAPkvZhw16VWYqzp9sPu81a
         V0M0j09c5xZa3O3QZiL17hcl3hFXOydVYFfPdy0krI7cdIug0d8eegJIhay6CyLft0Fs
         0CsEAosOGaFnmA7eAXD1Tbi7P20cKfOYrDGUXIP49a0GFFguDTUMpI49cnjPdaVRIezc
         55BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yf4KrP9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020ac87f12000000b003003b9a4a1esi15391597qtk.296.2022.06.23.05.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 05:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yf4KrP9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4Lc1-0007fz-L6
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 08:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4La3-00071Z-Kv
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 08:05:03 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4La2-0006is-1B
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 08:05:03 -0400
Received: by mail-yb1-xb33.google.com with SMTP id q132so1891403ybg.10
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkXZyf4XVgxvMEzuQ9pmvMILwh5omCXHYCnRpLuh43U=;
 b=Yf4KrP9l7oU0cAsCbaRi82g6eDqGVx5j1PfKfg5WAEav8h8zuudHPdffUdTvUHun9l
 yMgQ3l8Z/xJcgaQPuyS4kUnCYxkV+a5sa9vajGy0C+W7s1EySVWTLszxnQx5i6boyL3p
 Rt9lkkLhJwpukmt9zaRGtv29dORJYoNF5jalhTHB26kO6asl5vN2cqgA40W4aotYLlxQ
 2M4rfFEVvDZ2Yovp5yYnX8lwphxTMyALlnSOZhZVYNLye+TSkkM4Qro+5CIFV9BujezC
 JctyvNWXfg2DB/XV8Rs/nxkoaK/nzWVB8lXGkdvqmshPEV5Pkt6dCosi0k2qPnL6bRIW
 aY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkXZyf4XVgxvMEzuQ9pmvMILwh5omCXHYCnRpLuh43U=;
 b=cLs04TBcE2lbIdA+AHHm86mGHSiYDGC3cdxd7UrXeuLvI8akk99B1JiMn4mpYnK+TY
 dUeQmPBwzE4ECzh3MRo+CKgF0dpgKrVX6flTdWqf4ATFHnlb15rRlfMOqbcldyjZvHbH
 X+/7T0y8QmurdKozvwf50IqyvIQalj0UqmfvZweQNoeWiPMPpfUBB3WIXnkFj61uTj+T
 A06Dlaoqr7fCS3OFgd3OordS5FKvt48SOxbbVrLa2RWm8YHDSlC2WMbhl78TNG5r+4gz
 Namgh98IR+7e3WS6aqLuVhh4+HPHo3Btel1Ingl+7AAe6p1Qetoe3xHM+EDPxJxNOS2O
 CyiQ==
X-Gm-Message-State: AJIora9gzM7vM7m+1fNyhUURqVxqX5XykhIh4ccPaR136lREnR9BY1sf
 lmkZ/AeILecy9fIK12VCnC240i1J2W/lUQw+Q81GoA==
X-Received: by 2002:a25:d9c3:0:b0:668:cd48:e56 with SMTP id
 q186-20020a25d9c3000000b00668cd480e56mr8968323ybg.288.1655985900592; Thu, 23
 Jun 2022 05:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-30-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:04:49 +0100
Message-ID: <CAFEAcA__Rfb27dDmbOzRvDep7dxe9kj6LPFeT7B0PPws+CxiGw@mail.gmail.com>
Subject: Re: [PATCH v3 29/51] target/arm: Implement SME ADDHA, ADDVA
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bbIkFrl+QMo7

On Mon, 20 Jun 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  5 +++
>  target/arm/sme.decode      | 11 +++++
>  target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c | 30 +++++++++++++
>  4 files changed, 136 insertions(+)


>  #undef DO_ST
> +
> +void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
> +    uint64_t *pn = vpn, *pm = vpm;
> +    uint32_t * restrict zda = vzda, * restrict zn = vzn;

We use 'restrict' pointers nowhere else in the codebase, and
I would prefer not to introduce them purely for that reason...

-- PMM
