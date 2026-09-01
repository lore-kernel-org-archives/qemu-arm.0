Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C85C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 10:21:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LcA-0006nf-Rp; Tue, 01 Sep 2026 06:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lc9-0006mq-0E
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:21:13 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Lc7-0002ZE-I1
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:21:12 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8615bb9d857so5947857b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 03:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258070; cv=none;
 d=google.com; s=arc-20260327;
 b=Ohx7ebYQgDdHEHqT1/MFbYnB3pwuC58MnNVaM0kHr4mRguKnjmhC2nIBbmvi/zIhsT
 1wHUUd9K0hKIzp3BHuw0FqIViGATsW7Rc2wHPUZrDZJ0qaVxa41jp84gZQcczKbO5qhS
 Ykm379NnbnQN6yWg0GT1bT7czRkdzsIrvmf6tYb0VniHtW1y23HjGQybRIm7duIVgJqP
 l9AemmmQ2D4/vw9rbb8Ls344aRdGNbyx8IqdaNaPlq8nYNP5xPW/TB+wA2X6w/q/DXi1
 W6gnuqlWC/8uhIgnNTt5gcyf7oDVUIfxo0GL6fU2o/mntlFs+iEsRyszMdk6+nbtQspT
 ijFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vY/MJJp4a+TGy2l3aR3eRVRxcKLxQb5D6XtRmioKqT8=;
 fh=n2pVSsDpPmSdG/kX/yygkhPPpJCu/5Qv+jCy0V0nsd0=;
 b=oIkN9MKxw13BNBuEOrlJZgL3BLUrGwg6DSEp9nqgFKhUq9ijD4gJHd4NTlyZ/nptx8
 TscRW1IacLpMC3ZiMidhsAn64H9gQdKoJCwQ+/CjrIqx9/SiqnQOUxyICIonKiEwM29o
 ONyBLRJQq6j6cPAZaB84oYV66RWlUUMN/SFlC1RrceGJv3hDn+6WXRYLl08cx6n8tL66
 EIIIqo8+X69hmw9LCAe6iTqU1IOJ4b40XxHmsVRIa0R3PF92kcQxpzx7+tjRD/g2q2c3
 /xTiKzAwxxoSBFY3xqDGI66iMn4IWF+pkMwEiNsQ9XhaM66WLLfabrRXDSEbFp32QcUQ
 EzPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788258070; x=1788862870; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vY/MJJp4a+TGy2l3aR3eRVRxcKLxQb5D6XtRmioKqT8=;
 b=vJLbF2v81Bo+F1GVyl482udMsWmchOXUIoPzGDDQS2VcH4rN1k9WtQH8Hvvl5EtKjm
 exQYM01653ysw23CIpuLWP1r3ut4B+eBiqVIhAXC63cLNb1FstnkUt9LbuX4e6wgqZcP
 38zUhHuzlgzpBTirEHd1Bse838goNDSM6N/eKlA7F261LOBfPS0ORbEXWmQcz24QWRJV
 PdWyT908fg8KPnho13MpPlC1pnWD58woZquksQ+RNayye5m1gx+DV4P0IrS6IuiZvnUp
 lxvr2Ksfqaim9avCQXGSA8XEGTKQa4gfdMFFRysOecKtCtFgBLALviiEXq3zaZ/+ve7f
 WTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788258070; x=1788862870;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vY/MJJp4a+TGy2l3aR3eRVRxcKLxQb5D6XtRmioKqT8=;
 b=oYp6ZAsYuyCw4xwvUNsJwgLu4w/PtYN/KQaMrB1ZHWvo3zE7+XJKrn1nM2iM3dKXS+
 OmVUmklXvC6k5MulAA9a0O55/sFGOYqTm3c2/ggyGOmIw+S2BnwqXpaFCYu7jcJKFQlo
 pH3lneKM35yVPuw+lWey62qVgUguqKY3agfApjMuIvwx3XupGWQPzuLr+4hCLrfmY34o
 GZGSwfko0V2VJP412rK0kIEyik6X0awEEf0jBhD8dYn9uOkU8OIm2DPrcetnZOsDUPGU
 9+FetlvU84uXTuxXiQ7HjbQy3AkE5Ik+vmE2PeQ+9i1Y2W40ev2OZOCu8lkynVjpFMKD
 lPgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqP/ajX8SvEg5JlwllcAaGGXuoT6fu4DNMxXnICMHn4vKjEP7VxE0qRPpyQk/c2sxvhli790Igng==@nongnu.org
X-Gm-Message-State: AFuF++nyFu4AGij8XuLbPdGxI63S7z8EbRvVsTjUwt1nvOsG7Sy7KIZm
 MuEHPs8zUfEf6KY2F090p7R+mONnuJFXwkcp3qDl7nHryOMjWQ9J1TkGairQwCEoGtlv+5OwllS
 uWbuEkAuhdArLsv4fN7Wgf7O2SRE8V78+/cJX2OLy71Oe5nl+FzBkLUg=
X-Gm-Gg: AYBFou16WlBn7r9QtEgfwl4rx78G1b+6IW4OX6waMeH6dMexbEXDDYc+RXsEsz37oi9
 lllkoTdSkiXFbroHELLG60YaMzuGz+bSY6QJ4swBRnLO9alUL8be3IcGKYp8BKEoRk12oSkvajR
 uy7lkI3GMoJ1Oe3E8vZyYD2P7CmBdqf7GcwVERwBRM3lUePG9NioMvO9TzD24BHBbh1Ciyy8yGt
 yVoGEXuFcFao4gNboj/EsF0T+OCnr15D62IhO69WLVWaHY+CPUzC/ijetsAJ6trrdv/YJOYkCJx
 eOhBTzzKyYdruUwAl7gpRopKD/rzIIQpWzggc7jTsWsELNeueXt+74/wAIUhtq12A/LLJUnhKYx
 LTyVEhx0s86JBmOfzto74TtRK1d7p
X-Received: by 2002:a05:690c:102:b0:867:ae30:4ea8 with SMTP id
 00721157ae682-867ae307bcamr34698257b3.34.1788258069917; Tue, 01 Sep 2026
 03:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260827041557.775080-1-richard.henderson@linaro.org>
In-Reply-To: <20260827041557.775080-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 11:20:58 +0100
X-Gm-Features: AcwNN1U2e22oyC5Ud-grvKEybw1Aw0cJb3hMreZMP0qwrJKWHNXRPRzISrgORTI
Message-ID: <CAFEAcA8WARZRJ1GVf2or8g01N47WFLtEgswU2QhOQP_TNhNHAQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 27 Aug 2026 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is something that we've talked about for quite some time,
> having separate "max" cpu types for Armv{8,9}, because Armv9
> prohibits some deprecated Armv8 features.  Retaining all features
> simultaneously has the potential to cause confusion.
>
> Pierrick, patch 2 replaces the one you posted using ifdefs.
>
> Changes for v4:
>   - Adjust for single-binary.
>
> Changes for v3:
>   - Several patches merged.
>   - max-v8 is also present for qemu-{system-}arm.
>



Applied to target-arm.next, thanks.

-- PMM

