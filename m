Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2339924dye;
        Mon, 30 Jun 2025 02:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/pdAreQBIA79EJUHKs/MuvnGvVjv5OIzx/3LZtKx3Dcfl64/TeeVX2acOIqlMx/6bfmYX49E5quK36w==@linaro.org
X-Google-Smtp-Source: AGHT+IFV4TsPC2/XSAVd1pGzMjSNliuwEK77v9E8dwJ0p3P/RlleZbY95sXISCMZwroeMH7IopHj
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7d44398f399mr1792193585a.55.1751274608277;
        Mon, 30 Jun 2025 02:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751274608; cv=none;
        d=google.com; s=arc-20240605;
        b=eWGqnAVg8cllqLirFrVGOwdOBPJTO3tJRfO1wd9JEYZ4gtrckjlNJqQdpT4mg3y/Wj
         YXlzR9AFlwRTKi6+g0j3LfDHMqVw4BkZrhdRlNZ5kj8lNS1DC/aA+t35S4x7e5E4MK05
         1Y70pnGqhdSYG46QpBy1sdqd+xC2ei2DqgW8QbP9Q84L0fTBMuHBlbPPmLJNiLyQTXVb
         FKLoOXjTewkjbynA0LP1jCmerufXbnBPQ2CTxbJZmkUrnHZ8y031ZZ7rMdU5NP7IaiBR
         f6Pr5W5YaHNAVaraJrUM/5jqr5he0Zhx6k/XWZ8YZKXbIeOojVRhapbLL5zic86v5Fmo
         kv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8aLa30mfa1QZWGHp4Pv7l5Pn3jAcwhk8PsVesC+g/8o=;
        fh=DcgV5nLTkRHCgWNw7cN5N7SvSdX4P0Cd28gTpSCZf78=;
        b=HwITn5MRSqO3iD7yUpJxae3UHEd1Xl/lsuxhg31wGZkiJYZefuco+zrNFPSgoqVYCu
         eGUE5ppNTlOG3j8CD4o/7EgXOXPnQzzidtdrBBLuxU4CjsqcL7W1fTzaz2l2vb3Epl3B
         dkF6QOjb1lkT+S7dxd0j56hqYIqVbPA4W5qrItJiEW9rB31GnU7+npDMJ5VNuaTGERup
         bC+ngSVrafSoYbC1OPQ2Brgn5N4TbQ7JdpFbTXjID100lHHT/aozaoaQd00WHrDWCYfP
         /W5DuZWBSWUDqUBm882UsmJqlnIxRhrOxLgLOEayCGuHNfP4eIDHmtMfr8kuSoq+4sK4
         /xvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThoWlhdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443264f35si732685785a.407.2025.06.30.02.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 02:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThoWlhdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWAWP-0000uI-DM; Mon, 30 Jun 2025 05:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWAWM-0000tH-9i
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 05:09:50 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWAWI-0008D2-1y
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 05:09:50 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70b4e497d96so19069007b3.2
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751274583; x=1751879383; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8aLa30mfa1QZWGHp4Pv7l5Pn3jAcwhk8PsVesC+g/8o=;
 b=ThoWlhdxBRUhY/YRvOVa1RNmATAUU2GVtHlelUdH1HtMjtluVjiG9QccajJqASX5EV
 oL22od6N/VpEJdIedr658jP+SqNZBz65WWj1v3290Mgu7I+dirl94nL4RPlp8FicrPqt
 l58l8T28Ilj/xk50dxzW5R3GI/Wfr3C7YEaeJcnd4xleWON4I1kAvi8mLvvN0eQGy47B
 IPBu8cuQwFv+n2ENZv4YfNvYamneL8z2YKHlpH7RSTl8H9TGxHlOs4voMB9tmEe3s3wD
 QDwoZGBA9RlZ83bmTCVKwxy+B39Q628TXsGrIe0KocRXRm97qGXMGw+xRtuAdlaITopR
 PRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751274583; x=1751879383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8aLa30mfa1QZWGHp4Pv7l5Pn3jAcwhk8PsVesC+g/8o=;
 b=gX0vmCdvn0FtT4HvCcZZwPdIT7SDjyawVgsAow6tmVtdUoIQ4BZZJJaT5Ts0/VeRtO
 qSyKsX85DP2juDtp+q58tbQFQXkWoTGjp9oNKfYh/j0BA95U+/GD4bDtSaSHjE7zc29W
 i7ARQux7gnAC9TgnjwiWjrIJBrsIFC97XHCcS3By+fuxfxsGZZ9qrInow/pe44fpaaf2
 iENu3CNz2EcU9RZPwOWVkmmZ0we3FwhmUDkHyfS+dK989w8dUlUXsIi1fPFz6C8wNabq
 hukx53cwidL9SHGHp4uDOkvEdqdnj8pTWU46JC6LvgAUmxqxcAZ7ZkrDbgR7oO2Q/3zk
 igOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKiKinAo0RLMnbkM/Bz5bMhySBYP7fxxxdd6Ty5sPbPWrIyrFPT3w1eX4ChbzBIqZyrA6PMp8/vA==@nongnu.org
X-Gm-Message-State: AOJu0YyDwynTl6AKS7tXwQeGVOPZ+D8MEqgaQGj7Ax7+kyQ7zRuWg/70
 /16kNTs8JYF/DxEbY3V8Psiek8z/zf/M96897Vw5cg7ohWe4DZACiA2dI8qOhMvVphBTQmimehD
 RVsTTALOaaHM8L9CnomVo1SkvE0xcy8pQZ9vojYjFgw==
X-Gm-Gg: ASbGncudDRsX3aKdFJA1tAh/fxF8ZWaYZwdcTsU8q0uGVG6xGiQ3CSQEepxMZ0JVA2u
 aZgVlC9yFnITvR9Y5mTBLd5PmVbWhCKsTwTlIlc76Ech6x+UfRZ/DWNpt+FVJ20kSzmZCAyTF0t
 xGp4NAceCQ+zVzLJ8AOgpE2xL1svu+NQLxdWWMK2D4XY+ZNRD85OYWuok=
X-Received: by 2002:a05:690c:4d47:b0:714:349:583a with SMTP id
 00721157ae682-7151719c76fmr196612007b3.32.1751274582806; Mon, 30 Jun 2025
 02:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
In-Reply-To: <20250629204851.1778-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 10:09:31 +0100
X-Gm-Features: Ac12FXzsrJq8SMsscGWNIw-g6uIlT--_s19vhIkbjNwE2ZQz6x2enyqrP0YbrV4
Message-ID: <CAFEAcA-HaQwySM1j7Cy_R1z0fM1D9ykiBiMKLYNVYF+Tm_mrPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uVJJUaZiNGH+

On Sun, 29 Jun 2025 at 21:49, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Allows the imx8mp-evk machine to be run with KVM acceleration as a guest.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8mp-evk.rst |  7 +++++++
>  hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----
>  hw/arm/imx8mp-evk.c            | 11 +++++++++++
>  hw/arm/Kconfig                 |  3 ++-
>  hw/arm/meson.build             |  2 +-
>  5 files changed, 49 insertions(+), 7 deletions(-)

This puts a lot of IMX device models onto our security boundary,
which makes me a bit nervous -- that's a lot of code which
wasn't really written or reviewed carefully to ensure it
can't be exploited by a malicious guest.

-- PMM
