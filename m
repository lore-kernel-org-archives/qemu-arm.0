Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE0CA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:25:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP1D-0000rk-NU; Sun, 04 Oct 2026 12:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP1A-0000rB-FB
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:24:52 -0400
Received: from mail-yx2-x24.google.com ([2607:f8b0:4864:41::24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP18-0001wb-GX
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:24:52 -0400
Received: by mail-yx2-x24.google.com with SMTP id
 00721157ae682-8aef5f85003so2888117b3.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131089; cv=none;
 d=google.com; s=arc-20260327;
 b=CnGXSY47XoCw1YxAvHKX1i1soKWzphVHE5Z8w8Mr1suK5tIW/h+0biORwNMT8/VVnx
 ySbEJmtTO3icEfzhChP3vVoPaL4qaorfUCwjzr0jyoZdkyDh9hssF8f/ztbNyFHRuEpQ
 H+MO1AEzViAaoRcKgHVH81Y4qCssJ80vDXMZLMR3vytF/NxO+MSvitGF7JXaQePMQC9Z
 lgEWSwsWoCzvzrJzMylCtzrUs8xKqNPT01d9RsbK9f6BHYzRdXVd0dUAYUOl6126DaWk
 OQdeafZgMS9051T4+cK7cm1RK0bRiyP+7KwfU3QUn5JKvy+GwnnZHQjFhyrEAX7uxfCb
 r7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5qtLr5uEt+yONvlhg8U5jZU5Nlv06KQIEhK+R8A01vo=;
 fh=EtwAGmIZHXsRy2euUyK1ZvqjM3aTaiml1gwhkr3kQXc=;
 b=tDcvQRIqUflZZ4iunROixosDwR7jj0gz/ronF6++Qvozy/uv6tQpMWZl56pt+umtm/
 tFvpJgbYjX6rG49R3ehJoN2/omtNBpyLB+EEVLOsw1Y3+urkgTeqKATbwHrQFuqmxuY+
 DOPDeOfD8UGoHF7u44g3zo30/lHXNdaJDWZ7kSYxh4FxhJeyNd1e3bdJ5ryf13fzk0ES
 fvu/m26grENQqMrhic3Rt3YQjjl3Vk2Yxjg2TyOSBJL6F002r4lkh0AsRJC2PXVsd1zU
 cR8He6WApm/BzxGzv8GTvTNCb+tRSlqegZeiKjJ6e8gjH/AU4M9PDIlHVF8hpyl4wtSr
 VVmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131089; x=1791735889; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5qtLr5uEt+yONvlhg8U5jZU5Nlv06KQIEhK+R8A01vo=;
 b=GurPvcSaPIUbBKrKiri6C3s0kcoQFPUEuJpg+hs8RQYfnaKgN6SjamXlhVCx1VXpxe
 wBoc1K8Xdjb56CQ198EepwFQzTp2FvBuqKz9uqiZlQu9agW6bHOgpRf+K/JPR+pI8AaQ
 5BuugE2l024WxyhcIRFN4h9RB9kq1ZkVsnrnfO/PJA87LDlrqXAlMo4oVvpNwhb8Ev59
 N/Hp3xZNlV5Xl2NfabA7Il3AfzAopBHtgUvndXyagOaIbvjGUrFC2fYmvx0ruCvU9bn9
 sRKA7BmbzzWB61jsABSmZ8q9ZcielsBZ3rpr/E0+rvK5bkUhAYPpYqQqWc0XICytOQvT
 nlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131089; x=1791735889;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5qtLr5uEt+yONvlhg8U5jZU5Nlv06KQIEhK+R8A01vo=;
 b=NJYpSt9KLKo/IeTNGWt45rbmWTGGmP74Ccg3/QXFmWUQktTqNtmot+40RLmaeaXMA5
 YjhOI6FCC7y9SRxanZi7WYuSbUP/V08iZ+tvEwzsAHsAbDKI5tacbaKmmY33pbrj2nIY
 qQQAXBsuYPuhRslHjCFPPhipm/CeuqntTfbF79U5ZJd7XlubXKoyLyCkQFTgQwMlCGRs
 6Qrpi52bxz4ioW7uh/UUReIhTE67bf9apNukV6pIMr3Y0ChIsRMB9GaKDAhaaL2Y/BRM
 0ZfcgWBFUI5SZ6dAxSKTmyJKWlnKvjfsEDvd3mmzlgaJXWQBsnTSKAQIXXFOVd8LepDQ
 zfLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZ/jwBBdGRdSFjPYVETRufWm898/8AiaW3YYh+AtBQFD6DXCT+g7fGIHlCbOeG1GTqhxp5L+4wPg==@nongnu.org
X-Gm-Message-State: AFq9FYKy8Uz/Zzy9nqPVVfp7XES+Ahxcrn0p7Zrd0P3OpP7VhqCIWGgC
 HBwCtfUwF574QnxysAUSy1HpmRjGPYiV7Ie57/YGBNGUS83BM/aWsog/zrLZ1X+HCQk3FJy4tuN
 JItYCyuEnjDeccUAs3cG3W3PaxHfEQjc=
X-Gm-Gg: AYBFou2UMnP/nFbEGIoklLsmtEUhhOKuBnHR8P7mMuKsRfjyLFSaYf2VXWIbsGDNzcd
 JFBBR11OtBYPsf5t2qTCNYBG8tcgKJ5mA9PTq+BGh187XLZuJm6VzSkL58dIk2g12sQcizO/Q2V
 IaViBIbaOrAMiBvjsWwH3G2S/2iuSTlSgKBrAx1HC6jlV9kMDaJhNnPQZuZxtR7BebbObO3jnLd
 Uo9T4sD1rFIvQ8YgiTuNY0VN4N5DKgLvACmj5apqwOS4EZhsZy9G0Av4XBAZhT6ffzoauM+dr8c
 ERbKZl44z/prLzoTWlOTP4C8bA5bLE2ye6UuRUt+XJNRgBZ4kExNryBLbJ/zc458+KUKN5zzYbu
 G0X6Y76v9XIg/SnE=
X-Received: by 2002:a05:690c:9d:b0:8a5:208a:d928 with SMTP id
 00721157ae682-8ae3a3f388cmr43829427b3.42.1791131089424; Sun, 04 Oct 2026
 09:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-28-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-28-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:24:37 +0800
X-Gm-Features: AclHuK-tvpn-tHCeiRrCSbV1QlgkAFT2KT3_FfexU42uRFGFtODZugxpnA-wioo
Message-ID: <CAEUhbmVHsK9nD-hGTfzkrQKwGAM5Mp-75FV9tM3RCrGePw_=-A@mail.gmail.com>
Subject: Re: [PATCH v2 27/30] Kconfig: Extract config IMX_SPI from config IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::24;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x24.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_SPI to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig     | 5 +++++
>  hw/misc/Kconfig    | 1 -
>  hw/ssi/Kconfig     | 4 ++++
>  hw/ssi/meson.build | 2 +-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

