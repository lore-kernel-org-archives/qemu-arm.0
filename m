Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp431559dyc;
        Thu, 3 Jul 2025 03:16:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHIUYHXOY0aU5b3TUhsPirGbrL75un/EAUM3kIpgDHADZxcXJjCmPVpIf3BA8riu0Svwyh70y82pppOg==@linaro.org
X-Google-Smtp-Source: AGHT+IEX9RwDnbtBU1DFMAZ2vN8STtm3XGkFnaWhtOTItPpElxc5nuCeu7lLARt5QLguvM/c9FWN
X-Received: by 2002:a05:6214:4883:b0:700:be60:9515 with SMTP id 6a1803df08f44-702b1a529f4mr91495816d6.9.1751537771582;
        Thu, 03 Jul 2025 03:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537771; cv=none;
        d=google.com; s=arc-20240605;
        b=Am9WhbF2bARpNC14WtTuLUFkfwXqoiiF523K4JHZrQ6Kj9sk3XhzyxFKXDfSUY+cvi
         Jlx/3BVqyn375cB/IXidvL/GPJSGxZ91VMzNN/LcYCjlXyiDbnpgqSLhGPP0jeaAUFoA
         vYNi6ec+e5XHnHhrnxmV3BgmM9owtPPyO8x9pBKGj4LpZw6HYuytly34nnVVxNBHFP+q
         nPcbDolli8JqFnW0Gsgiw9SP50s49aqKJPbcFoVmjgJsRzAaO35X/TC0BaZp6DYiZWcv
         fy89RO5lN2mgiB7DSaqgchHSftU8tx9r+dzwoeTAX+5ZhzRuaKl0irzIs34O8k8wdd2Y
         bUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EYx/7QnBvX30mhGX0gngEYFo/Sqp6D3SUtEhqOi/Icw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=fvpypqLOUo2t5GcAQRvn6y+DtL0+FepzLHPJNbmC+kUvwEJehZQubBUu9HKk593DlC
         Y53qIlCa8flVMPiDYJa2ByEEkLkt+k5JAHE4QDD3dQuHEQZAeY7ZYqM09vTTKr03X+P+
         pC7B3n40B8CuYOpxhtjxot3DKJs31idzLaySEKcS73yRAPo3kgi6nHMKhs879OOJy5VF
         lvkIT2FmTQOilAcml1RgxenbOGzJgH738w/cFwdDrjJimo7AwV9vFbIjed0qQtow2ir1
         mhtNs7nmarNBbNA9TZNnO3zZptgr3Zf2G7rc3CXS1D+0IxgLsiSm5B7EF97vPuz71euA
         EsCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iiqiekgf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77287305si166321826d6.63.2025.07.03.03.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iiqiekgf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGyd-0003zl-Oh; Thu, 03 Jul 2025 06:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGyZ-0003gz-6K
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:15:31 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGyV-0001dA-Rn
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:15:30 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-711a3dda147so84724547b3.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537727; x=1752142527; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EYx/7QnBvX30mhGX0gngEYFo/Sqp6D3SUtEhqOi/Icw=;
 b=iiqiekgfMwAFHeLm9cVarakT5Vlc81ToFnOOxIO+tLzfjdUsdyZADVWSm7k1bxs5VX
 VTbIhr1x0tI1s76oly5qTUPekCTaSSQIF3EYisSuW5DKK33KjmAiFzdRhddbo8OKt0cw
 HGAx2hIclLvLPYXlJTCjPGkwaHcx4fKfNKAFYrqgGLZNAyVaM0ieESi7IgcNKC0L4+ze
 sJfW919MVy/fXd4jjyq8y0d3S0aBTtLFefhJJDUQ2jAHQbqExxpooD15dZqLEVKOeIDQ
 z7QnXZ278+YoHG1gxoHeLhPuswsiR89k8v82Wa89WrYzmam1eQrFTmw0MVP8A3TtQ07w
 lG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537727; x=1752142527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EYx/7QnBvX30mhGX0gngEYFo/Sqp6D3SUtEhqOi/Icw=;
 b=VqZqRY9HHissTVCmY8D938b6L81yjIDLHYygq8hNTx+9+R1xAJzz7QeL8Nqahca7vo
 c/bbPhHvldL7hKvCHFgvxI9NayxBiBJ7odKRtclUqYIC90WT3VbnousxZyx27kJ1wODG
 RUqete+72zsjKDddJWzza0rdl/u+rpcp9MH7nKsIKzKmE+iq23rrL6Q5jOpIuJOCsZgy
 hedZZP8odWyQRPFHbm/hyvN2R446xF+l0s9B2dI5ATxGTvS8ER1UvMh3RzpsZGCfZyS4
 2q2e4J7qfZxrMqRC10sOscU3VNOvZET07fqrbvcSM2dwz3/gWNq3Cpf409yzRvQChctd
 nLoA==
X-Gm-Message-State: AOJu0YyStxcjkdvuCZcpkOGvor2aSI13bHfba9VWkH/adV/wzt1daC0G
 9KGjCniFQ47FHuiQUzeB/BaEL+O6eyXj+k/ayzZq8Bf/gvlhooq3QYd3wwywinqoDVOuoyXbgT7
 dr6qruFBnKEA/8OqLJKpojLQQxiTQBcy3GHjnwQcB1Q==
X-Gm-Gg: ASbGncsid5vvVRS7sFIg+TM/hhhpG1bfoULmvhzk/B+qCJwFxXL7IlQ/KIZ23fvPJvB
 2xv5E79y8c+anQsg2dTotNs/dM1uTjf6mzXIp66nIA1ZpNteelanY54NwkkH098jS3EPw7vVLhx
 S/XLsFrWNe06Oo3jscVGuUiMmb2LtIowbxsFeq4pvkwtFX
X-Received: by 2002:a05:690c:6ac2:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-7164d4db0b0mr89570037b3.22.1751537726573; Thu, 03 Jul 2025
 03:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-49-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:15:14 +0100
X-Gm-Features: Ac12FXxEllNTpMRXremxLHNFw05PCcDZUdy_3FWOncrWEe5sANnYOKDeLoH9DYQ
Message-ID: <CAFEAcA8bWwFZ31g1QsrQL6eNq_0ZNJ47BJ2P=yE=-BE9ebZ+NQ@mail.gmail.com>
Subject: Re: [PATCH v3 48/97] target/arm: Use do_[us]sat_[bhs] in sve_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MG+5OQw7MZ7R

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace and remove do_sat_bhs.
> This avoids multiple repetitions of INT*_MIN/MAX.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
