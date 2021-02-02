Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp257159lfo;
        Tue, 2 Feb 2021 08:24:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5n+mJmD8JBIx0mFIeFXnAzoipuA81V47yb38pgNKB0xoqvPXCh/5DiDJV/gCvkHdeGZTE
X-Received: by 2002:a25:7c87:: with SMTP id x129mr32600114ybc.461.1612283091355;
        Tue, 02 Feb 2021 08:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612283091; cv=none;
        d=google.com; s=arc-20160816;
        b=ivK9wB79rmd+HTreL0hFm4wJBDEGLc0VBxhDsDvw7/3owEveYE1EQyU8VT3bUhNY4s
         L1/LHxbNZqPqa9VX/px46+JnGIP0zl33FfEsd9W5d0eLrSKKOdU8HWcd18D7IzOxqxgq
         R+g3cNj3bdWHAOiKARUFCbX5U6mmo7xibTgsvPtqjfzho3oF+XudVGJAnJq0gH3LthSt
         nkE7/HrAn5yvS4Jxlw8fJ+8bpLClUkYIQ4CVlqslItY08u56YTeYP2rmSH+4JOOt1QIJ
         UjTiIsGWy1JyZXRFF2Iq9h1OLeRw2/tQnxLbq8QU56AZLwBxzO37UosKdgJEDF4OS3RZ
         FFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3Z35U0jqq7f51s6wUa4I2AgwKVAY0oS+XX6xxqFC5QE=;
        b=NyqNH6xCnmUiCWLGNNsBUrrDP5gNF08Jeuj7wUOmzV3ncbXZ1Wg7b+ZRmr1ciRwA0a
         12NyrivxMoIElHMHZ/rGMIKtzKdEtE7DXEr61N0j8nuPEGPj1oU9Vi4Cd7Px9UuahoM+
         d89Gg1HaMlXESyTRAXG02UrsLyln8vrsDS8oZT4ET+N/6GYHkPKKING0EqEBJL0u13VF
         d766kPzucAUnbojpYxjUtTjOvv7R5uwofSWa6T13f06eiE1S14J9fAvjQ7fGQOZU4jGs
         30uohMpiO16err4zCW2S+Z0YuhSNu74c8/7SF9ziRHIrOkvN/rcRUK+Ge3NP8HwedE3m
         1Jdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKn4FjPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x205si11940341ybg.160.2021.02.02.08.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 08:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKn4FjPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6yTy-00082i-Ml
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 11:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yIJ-0000Er-LC
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:12:47 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yIH-0001Z8-Oj
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:12:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so23564778edd.5
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Z35U0jqq7f51s6wUa4I2AgwKVAY0oS+XX6xxqFC5QE=;
 b=BKn4FjPvaLur8I8Z7H1EFeTBMbA2wllJpF6ooAuKqoNVKJ+t7ZVYUMxhJh/baDyK/3
 kna7qChBIiTUJrZQaxPxB6WttIyZ7fGlJpyITWawb+q0XbqctDf1Cneivt6r04SUait0
 UqmpfzU5CVF0S9mUC9pJrVncLLv/TOi0lOmZ8BvOfIQLc3YGxlSeJL59niQ8FkCKnmQQ
 nfhuYtDcJqUxRfn52+7m6DErn4WZsZXLX3z40UaWMtfqBeSlpOgfa4IAzMK3nFhdI5Na
 VDteqbsokUNOTz3GqNuMYSyK/mA3D4nqfMm9hM1ETbY+8UOOSqL7NW4HFyybbuiIN53u
 047g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Z35U0jqq7f51s6wUa4I2AgwKVAY0oS+XX6xxqFC5QE=;
 b=LtbGV4ylwZktCiyqysGlAp+58I4GqpPbUsD8ftcO6PXti/QObshE6nnaLvRkZ++rA/
 B+6kLw1Vc9VBmdwnw82ZQbkMEr5kXit4JI3sqNEBHT+IphjpV77cPRJeGWsU7CGH3DhL
 AYpYYSFG4J3CsQEHMU0TY7CmcpjHUfENxBRfSp8ozyvjIXX1Swjaz0cnGyV4aZvwnt0z
 foXZZdW+v20BQ91sM8oPkoga0Ywi520e3ZVmb/1pJKxWPVl2IeVAstIsn3em1wDNtfyw
 f4rzNoNbt/g0mcLGeqV5QKS2MHAL0bA9AA5eaWuueTVqXXHY6R29InvCpnjVXizOnDOS
 M7MQ==
X-Gm-Message-State: AOAM532pF7Ux1ZXCQ90v7Do+dsBoFONe4XxNSFzrjMq6aycaz04468g4
 7U+yW3xW17pnKH8VuJTldXHCORtxjNIlIHJklLf5Eg==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr24314030eds.204.1612282363875; 
 Tue, 02 Feb 2021 08:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-2-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:12:32 +0000
Message-ID: <CAFEAcA9TwSMpVq366ZDU9NZDs7enY4RNAWj=PPK48rk-ACnd2g@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm: Use Kconfig 'default y' syntax instead of
 default-configs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bqc4+R/0ua3r

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Machines can be automatically selected using the Kconfig
> 'default y' syntax. This change allow deselecting these
> machines without having to modify default-configs/ files.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/devices/aarch64-softmmu.mak | 3 ---
>  default-configs/devices/arm-softmmu.mak     | 2 --
>  hw/arm/Kconfig                              | 4 ++++
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-config=
s/devices/aarch64-softmmu.mak
> index a4202f56817..a94c7786919 100644
> --- a/default-configs/devices/aarch64-softmmu.mak
> +++ b/default-configs/devices/aarch64-softmmu.mak
> @@ -2,6 +2,3 @@
>
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
> -
> -CONFIG_XLNX_VERSAL=3Dy
> -CONFIG_SBSA_REF=3Dy
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0fc80d7d6df..7d55c156bab 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -3,14 +3,12 @@
>  # CONFIG_PCI_DEVICES=3Dn
>  # CONFIG_TEST_DEVICES=3Dn
>
> -CONFIG_ARM_VIRT=3Dy
>  CONFIG_CUBIEBOARD=3Dy
>  CONFIG_EXYNOS4=3Dy
>  CONFIG_REALVIEW=3Dy
>  CONFIG_VEXPRESS=3Dy
>  CONFIG_ZYNQ=3Dy
>  CONFIG_NPCM7XX=3Dy
> -CONFIG_RASPI=3Dy
>  CONFIG_SABRELITE=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy

Why are the 4 boards xlnx-versal, sbsa-ref, virt, raspi special
but not the others here ?

thanks
-- PMM
