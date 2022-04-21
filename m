Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp256019lfk;
        Thu, 21 Apr 2022 03:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygOgb6tp0iI3cgedhc5Q/U+pkrtid8xcEz84cWtR5L5T0sDOV9yAksiigqn+UxXO6vWNrV
X-Received: by 2002:a05:622a:2ca:b0:2f1:f3db:f253 with SMTP id a10-20020a05622a02ca00b002f1f3dbf253mr15674661qtx.302.1650538713901;
        Thu, 21 Apr 2022 03:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650538713; cv=none;
        d=google.com; s=arc-20160816;
        b=Azqt/GRK7UYHmso4x/To/VmYJ1P03FjFE5Ld/1oaNd/rki9mpFV8KLKufTCkIYiwcp
         eq1BmSdSKJrKJ537mZy+Vgoz8rwyiXAUFqWgzbY2yMMboIgmJQP0Rs1ebvhraHT6Y7sU
         UStt9nr9dmlLF5RIjYrfhH4OSKzerfKzG8hhZTS4AHkqeZ6z8fOFgh65lOcK99Br5Ho1
         uxFRwilIg2Xp9AU6xZwK9GnjudxBILtSE6X3CfH0OChI6mmeUPeeouHc0WCtDmUM2a5Z
         bmaaYgjHdQKCv34wEtqazcmulquPLZoV6lDEO+k8ibaHdvR+QaazujBUrVMHXZGopoJ8
         h8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=660QUaqQvd4rcfLPMXi0b7zjAEPQZCxmC7BNlshr0sg=;
        b=YojJJnIAYKvVsWLOomMbsdFIM4dn1KX/NWPBF0R62UVbi1pSzFnW+PhZL/td1u4E7g
         ybsASMK9TFNeXpbyCrNNiESJZh2/xnAL+Lk0rmZAJJdFBZvsx9D7xQOPIPX3fuN9ol9R
         AsMdV4sdQRBHfAeturIbpTLnTy/f3iyHrcP0AL4xhf0hVo4oEHDqOb3Sco8TVIhT17NA
         43cP8ndDxuuLyTRHWsQ6UfylhdrRm71gizTS+msA7VX00iI2xt2Eims67X+/tBemIkdN
         H6lQfooN7DO8BRHkaGWDDdGjne4cwDGQOAO0+8yfFn0p1AdP1E+aNriBB7d8yqXUWXgx
         QveQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tVvz85ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b0069a1403b07fsi1336051qkn.37.2022.04.21.03.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 03:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tVvz85ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUW9-00058s-DO
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 06:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUSY-0007m7-Hq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:54:53 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUSW-0006lF-VH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:54:50 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ec0bb4b715so47782777b3.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=660QUaqQvd4rcfLPMXi0b7zjAEPQZCxmC7BNlshr0sg=;
 b=tVvz85ds2650+YFjy1BKpupEpl/fHvYLq+/L7XnNIYMQg+iRGCu7/9hGMokIzQFAo5
 L7BmpYerZKg6RHM24uMFK3Cq7AHYA9fU2WvW6UT5dxoNplfR9+mqgOxmH696dtglnfqo
 RBGQNoZn4r5YkBdtnxQYateyOSk8At/330kEyyxBx3oHO/92i5QtH1yJFQP1ZZVsTE+7
 bSGZ3akaAkTQGfDGFbK5Yczq1kgC/ACCkifHmzQeML0OZfztpmyNsJK3lD+VxTghD+9E
 vKzTDi8iOGDMVkDYDhax6Xs7JBZfG5BVVOwRkLnEIeIqtqsE96yjtnYNqeYUovz16z3Y
 MRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=660QUaqQvd4rcfLPMXi0b7zjAEPQZCxmC7BNlshr0sg=;
 b=MB6RETkdoW1LPGj64wEoCwD0aAGDN0JxkeimqkSfdZ6Kw2gZq9nXXrTVAeR+TGRsdG
 FB0jQi6EisMIpOjxm//A3DfHiJO6N6wgGqZZ+QIR7Or1/0FlC7H4BEUgK2W43dKXuKAo
 IpczlJMrvRba7ZozhM4HbRZBrYdS3+1XYMUV10Yzq8Vw35wqyZpISMgelwjiiXsll9es
 MvDR/5KPjgW/SAowxamKyHGINo05UJ13e8DMNyJHbHCBO4v9ei3deV0fHjmOcWKc2VFX
 /30FBXqcoM+COIMNHbsBbu5+lOZblEx0/C4/9nbQEKWERl2YdPTgmFUJKPhF9jsbFe72
 6FJg==
X-Gm-Message-State: AOAM531Pdti2SWJ1WQIEeWaVmNBI9layeXyEAlLxLK7EeEsU8B838tQq
 VEJqjCNHlpUXNfKKuv24nv3P3L7XvmE3ilMaPWWz3Q==
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr26438071ywb.469.1650538487948; Thu, 21
 Apr 2022 03:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-5-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:54:37 +0100
Message-ID: <CAFEAcA_8=sQOwA=MQDp_svwkMVrJS=oqMHQemuPsP+3yO3iG4w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 04/11] hw/misc: Support NPCM8XX CLK Module
 Registers
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T69cgw9xRSaa

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX adds a few new registers and have a different set of reset
> values to the CLK modules. This patch supports them.
>
> This patch doesn't support the new clock values generated by these
> registers. Currently no modules use these new clock values so they
> are not necessary at this point.
> Implementation of these clocks might be required when implementing
> these modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare<titusr@google.com>

Can you split this one up as well, please ? In particular keep
the purely-mechanical changes (eg renaming structs) separate from
actually-interesting ones.

thanks
-- PMM
