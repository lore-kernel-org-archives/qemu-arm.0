Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3133242njk;
        Tue, 28 Jan 2025 06:33:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjET8PedV8f0rxhzs2JSJr1ZJKk60Ry7lZkIrXxO/oyi5lPZX0xLXoWf0nJIQNi2Gbuz6X3c5HdN4X6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHg2ZdMGJd/pRUE5ZOLZANk1v4D1j8dpl4TbDTWlUv45SrzsYmkIdrAdgZtbviDNrRh4pf3
X-Received: by 2002:a05:6214:62e:b0:6d8:a856:133 with SMTP id 6a1803df08f44-6e1b217875dmr553396486d6.12.1738074827349;
        Tue, 28 Jan 2025 06:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738074827; cv=none;
        d=google.com; s=arc-20240605;
        b=GKsIsMM+eJ6G9sJcnMQ3kPVaeVle33Ig7lH8h+mVgsMbCXJdO5ZKE6OM2vyb2BvKDV
         H6XbPyCz5wF7BKuU7cbsknwTsbJO4EGbI9wwH/UQYIHtaljCRN+l3kgIbbeIzxnNGp7C
         3fJ5w1intKRB7MNhLqZl4MuFAWPsCnJgealQE5iCyYnkDAxSu5q6k6lWWk4r3yULQo+k
         9+oIVfvuvUD27hSe0sDGOhrxDArDdt4U2ThTmBZyiwQBqbKnM+f96wRq7M8LpKt99Bgz
         tmMAj6XqPzzMvGT9y2jEAsnCOdwc9b9roCmmujLFu3l+jCP9XM3xsFm849ujDWoSduwQ
         tuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yBonQdWSAJdGgs1uTdENENUxX2xyohdOtyf/B381iQQ=;
        fh=ZZh1PCkjznRQySat/BF4kXHXQZqaL/n+fAawIVkD90g=;
        b=Z5WiIYXdJpGxkku0ev/Nt4tKTlkB6uQ+OOzXcwo+D+Oov0hbl5iJlcDcyqh/U3hKRq
         TlYXPyYXgyOI4K8WvU2JmRopUnboKSbH1cq7Gqy2AZBnwxOzmRoFTsWvUpCsRUThsxK2
         jU+qTZQMK/r1/ARuQu4jHA5KHHQ70JyZM6gewNgehCMO0rJXjDeFcn2Oh2C6VRxuXlvw
         LyRoHXmsFm7oqTzMT97NsCbvPvp8J/MYdaB923S+9TERN6qfioVfl0LVL2TgMA8+7VGs
         h++Kf0tQu3PjALUYzJf6HmQFu0fTqRzVjrNu4nCJEkoCX+ISQPXNaCVkng1vmdn2sCrg
         6IVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9xb43Ay;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2060217a6si118880826d6.416.2025.01.28.06.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 06:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9xb43Ay;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcmeh-0001i3-6i; Tue, 28 Jan 2025 09:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcmef-0001gR-20
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 09:33:29 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcmed-0004JT-8l
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 09:33:28 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso10048777276.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2025 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738074806; x=1738679606; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yBonQdWSAJdGgs1uTdENENUxX2xyohdOtyf/B381iQQ=;
 b=K9xb43AyoBcD+e6XH5IA8KzzZ1DKYnWcYstAIVLmje6f8O/m8rK7+qZtcW4IZzIuBQ
 Ltwons1MO37JGjWwuiCTxc0Zx51iWWk8iZTSLyTOnNWkn8AECeWXRyioQ+0tY8e+UH5S
 Q2TOfCIeaZA6cS7IPWJ9uwuSVa1aIhagP+/bETHzpTj7nJEMbnQytGExvkVwXgns+sLe
 bVq23/3KrAMMH/OP9Fgvm8HRLQfpOqwl8nUZvCPjbkDTY18CcMdbnKQDntw4pdeH1TVH
 yEV/2/FOcZRh95yGtOdjHoszcLgXzAOAbnd5hBuySOCE+N79bZUKDi4Fiey+7GlfV/rW
 1ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738074806; x=1738679606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBonQdWSAJdGgs1uTdENENUxX2xyohdOtyf/B381iQQ=;
 b=sAnKgaue5Aw6eJprQp9LGXNi0JThuvhgDlA/dAdfnhr0e2VeiuwCdCeY7i6eTBPx59
 6StG+FuiCy1KMhuF/DQ602TrRuZQjmAIsXXpaA0VngELPxkoSabevHAtJ38NCiAZjl5D
 Hy3bVB+M9bWNLk/z1SZwtyrDLAX8AXJX4Qa0h+sfzgLJFHkkzBZmRNu9bpcOAYsa4i2l
 ZhcCgboBXYcWCm6/R7PnJK5udye/XnUC+3oE+PsA8pV+G3pXE/rDU96uU/QnUykJT4r0
 yebIIL/cP3n66zNOlJ+AZrdZmqPxZDYuy2/9esRIB//BvVXmV2PPn68lo5FtNi4VoN88
 jl6g==
X-Gm-Message-State: AOJu0YycPsGYv5Iy8WINZfPx7FE86SDBElJDNQLg8kZ7XFPWt6hvQtNO
 Q9XOHyamLPeorN6ImwyWq4moxRr5uOeV7EMiwKj767+LRXG7ifp4JmRJcrJBRaHt4oqtYVIS3m4
 r+zL8GrahSiWAWbyUm6ALHhKTECEjj1sf5zIfTA==
X-Gm-Gg: ASbGncsrt2Sw8Q2wlOfjlHkZIB0okVzevR9HtlHyJ5mh+NfuQJWzpd01o/cka2fT/yS
 FYA6jhsQQg1ifadNWE2XI3hSDZTzpCx7A5KgIfSI0YfTkTQUjT8rX1wt0TkwpHW+MySHuo02usQ
 ==
X-Received: by 2002:a05:6902:c09:b0:e57:4226:8ae0 with SMTP id
 3f1490d57ef6-e57b1064482mr29044838276.18.1738074805987; Tue, 28 Jan 2025
 06:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-10-shentey@gmail.com>
In-Reply-To: <20250120203748.4687-10-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 14:33:14 +0000
X-Gm-Features: AWEUYZny2nrgaLwmdeTrSwbgWY32uyfmH1C0zgj-b-gG36LlnfuW27Fun1d5xLA
Message-ID: <CAFEAcA9efWMDxaTCfa6t8MiCgFUEU+nsyurNOqVDxAa9=KS=-Q@mail.gmail.com>
Subject: Re: [PATCH 09/21] hw/arm/fsl-imx8mp: Add PCIe support
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZEXVUwDxVMK7

On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Linux checks for the PLLs in the PHY to be locked, so implement a model
> emulating that.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

> diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
> index 1514bc5864..8d48580cb4 100644
> --- a/docs/system/arm/imx8mp-evk.rst
> +++ b/docs/system/arm/imx8mp-evk.rst
> @@ -14,6 +14,7 @@ The ``imx8mp-evk`` machine implements the following devices:
>   * Generic Interrupt Controller (GICv3)
>   * 4 UARTs
>   * 3 USDHC Storage Controllers
> + * 1 Designware PCI Express Controller
>   * Secure Non-Volatile Storage (SNVS) including an RTC
>   * Clock Tree
>
> @@ -62,3 +63,15 @@ Now that everything is prepared the newly built image can be run in the QEMU
>        -dtb imx8mp-evk-patched.dtb \
>        -append "root=/dev/mmcblk2p2" \
>        -drive file=sdcard.img,if=sd,bus=2,format=raw,id=mmcblk2
> +
> +Using PCI Devices
> +-----------------
> +
> +The PCI Express controller spawns two PCI buses, of which only one can be used.
> +By default QEMU assigns the wrong bus, so the correct one has to be specified
> +manually by adding ``bus=dw-pcie``. For example, when adding an Intel e1000
> +network card, the command line looks like:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-aarch64 -M imximp-evk ... -device virtio-net-pci,bus=dw-pcie

Why does this happen? Isn't there some way to make QEMU default to
using the right bus? Otherwise there's likely to be a lot of
user confusion because PCI "doesn't work"...

thanks
-- PMM
