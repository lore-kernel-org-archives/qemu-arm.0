Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2727742dye;
        Mon, 30 Jun 2025 14:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXK2qfkXUdifPzS+t0gAayihR6LE9dXHEAAOdtJVpJvmomXKdkU5gTlAMnN52RiSPxVfer3U6hROmGD5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHuq55PZV7BpGzlDQrZ4DeKGiYUVRZEDYBMxo9D0fY1BlDPcEhMYaa3SfzGo0x7tgnPmqCB
X-Received: by 2002:a05:6102:38c9:b0:4de:d08f:6727 with SMTP id ada2fe7eead31-4ee4f790b0fmr8729757137.13.1751317420143;
        Mon, 30 Jun 2025 14:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751317420; cv=none;
        d=google.com; s=arc-20240605;
        b=hUuyO+Fbj/SopYVvwlTZm6p1gFDkjR1FJWymkeqR6DuACZlkZRmnpbEsKbaJlNVZ0u
         El8MICgssTJh8BaCGzwxyF7qjHvIYd00KmWvHGu+bjkxc8Y5iSbgKSdFNezww6lpxE7p
         vFLIdjocGqZtoIHvmmtXdNn3w9WIKZ3sy7R89QyA7x41xJ1ciu8lUbiDRRxf1k3RZD2Q
         Md7tMmoXJ3mu/8kSZXZYok2gZp//bk0gk65JdMKUrkSj3KG/SKs01/E4w/elGO3K2yXz
         mLjbuJ3VuStJtXTWnMd6s45EWbYN8szPYhnljIyYBLgCdY9MBZycvd8SANqshx/33krY
         SC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NmPND9wxci9DtmMrcq/WTTks2YO6OirLlpLmStV59AY=;
        fh=LUkXHlWmxyMfLFTNnRexLPZpYYkRKl6+AxLiKGIvP+A=;
        b=TkLRRyxkCaS1zz27GSpQsN8PGl8Wh8EJrZGdEKceFUCtu5MC+EwPQFyfoV9rgvlE6T
         0k+B603tPalEeyVo6PklT3arECUWzk2YSlfpOf4jcl5ZoxdxZS5EpoiD/dOOrOnEY7Xq
         isnQDQFkZF/EwtzUcmpXTHdx1cFg3vwE+Bz1Q5M7m6MzDYZstXeG4IWRx8ot0AuT46rV
         R+z7Ihs6/41fnrI8W7/+NQHb7cEmwUcAwKMd7MyLShaTisC09zSo4apmzkeFDCDzt6W0
         eXN0U9tEds3U9kHd46/F7OnwRibxsc5n/VtoXK6NpGI7qI9/wB/hyYv68tJ8uCuLPeCh
         vufA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JnJZ4ZpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cc9d55asi1981681137.656.2025.06.30.14.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 14:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JnJZ4ZpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWLew-00059W-Br; Mon, 30 Jun 2025 17:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWLes-00058z-M7
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 17:03:22 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uWLep-0004Bm-F0
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 17:03:20 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-711756ae8c9so50083667b3.3
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751317398; x=1751922198; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NmPND9wxci9DtmMrcq/WTTks2YO6OirLlpLmStV59AY=;
 b=JnJZ4ZpY6tUNOWCUU4E8tLqheacr2uWO9r31gkgzyqaVsV9lDX/QddVA3LUH/kZMnv
 rnurnUkCWLz/p0klNPeDrUxHftx5qMSFoLexJeeFgaAnZIxsblhRZqxnOwO83odMcasJ
 qhel92Lh0QKTGLM/Oe3CUsIRPA5ZIp2wACX3K8Y/obeecm4VHxPBJBJSFFssatxqG+BW
 5BMmrnuiTvkkokETeLqnE8uwUtgrTXoGbUP9wd8Yn4p883+c+npqr1bJ4SbrOW5d4Csr
 UDKY03eg3ahYIwq7ex997k0aRDIoAW6d1gvFEYFnJ4XiArjXAJlPEaUWYkjzMljF9TWk
 /eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751317398; x=1751922198;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmPND9wxci9DtmMrcq/WTTks2YO6OirLlpLmStV59AY=;
 b=kgLQEOrbEd+IEbRmmaWl9svXe3dY2zb1+rFrPbsglPVGec4YpZsOeJgw+7ISWaWySL
 zS+yWyb3vZ5KPPbKODCb9iNg5SNreAzqx7FIpl0fsUmrlqc/x35mgcPNW+As7D/Pa3Md
 8NTVf5o5QjRkXEvlnQd5lUTU7HLpD8Q7EtYVx7lQZpqRavv1j9/lrdnv0O5cDCuNGf+3
 2mAAUY2VD+/kuVQFWV2S0B/oaLXaaN5uv63y8q7+PhK5PbHTzm7OsC+AQMf1COYjjIoA
 BHEiFeGWviV15KwY/M2Wst5KQ5jYkV1W4dBw/fF9kgmFMkU2M41Dg+mNClMD+ZjFZFTd
 2XuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnonbLiQ9fx5nOvEgRb5yS+PgbPTFF1HVJMk4S9fQ5sA+ngi/uNbwmEKF+mpnBmxboJkp/CHL+hA==@nongnu.org
X-Gm-Message-State: AOJu0Yz2RqPTUDpraEQZFQUNEuqouUKntmW+h4Fl2Q1Za1/RtRf/r2s6
 YTtRQQO3U/6DuOH3J8GM14Trs4sFvLCrx0tv5T1nd9i77BP0xZKiudRE8+fUcstwqsL6ZXvhXBG
 NbdN5WAOO6A8C7uhtlca4UvnjPhVA8f6xUaOLW+b5yg==
X-Gm-Gg: ASbGncs8TMbEMzkCjmIkloSoWAIK4+ebhQhcjwnpDQJ128xObux+81qN/7JvOb8fAEc
 SeOawHlLNaVaZ4bYWw0fSB0FBuujwlPjHvGVYJ1W3AwB0/Tu/zOkdj4XBrgA+fTw2HMWjDQ+gHA
 tAr7gt60ZlfiCIS9MDgBb5jF6UqJbsc0Cj5/h/GyhonPET
X-Received: by 2002:a05:690c:6b82:b0:70e:326:6aeb with SMTP id
 00721157ae682-71517160c29mr233568307b3.10.1751317397901; Mon, 30 Jun 2025
 14:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
 <CAFEAcA-HaQwySM1j7Cy_R1z0fM1D9ykiBiMKLYNVYF+Tm_mrPA@mail.gmail.com>
 <78B2535C-38D8-4612-8958-49AC28482A8D@gmail.com>
In-Reply-To: <78B2535C-38D8-4612-8958-49AC28482A8D@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 22:03:06 +0100
X-Gm-Features: Ac12FXy-ydrU040KxiliqQUefdv_6GYVq0EN1ZpAtNKvHvNcTBYSxfJAxb-sRsk
Message-ID: <CAFEAcA9b+1xx+Esnt80Ny1gWBOsh-QYYxuP6PwiPk-B20xv0Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e9BIzt2N7SvO

On Mon, 30 Jun 2025 at 21:22, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 30. Juni 2025 09:09:31 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
> >On Sun, 29 Jun 2025 at 21:49, Bernhard Beschow <shentey@gmail.com> wrote:
> >>
> >> Allows the imx8mp-evk machine to be run with KVM acceleration as a guest.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  docs/system/arm/imx8mp-evk.rst |  7 +++++++
> >>  hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----
> >>  hw/arm/imx8mp-evk.c            | 11 +++++++++++
> >>  hw/arm/Kconfig                 |  3 ++-
> >>  hw/arm/meson.build             |  2 +-
> >>  5 files changed, 49 insertions(+), 7 deletions(-)
> >
> >This puts a lot of IMX device models onto our security boundary,
> >which makes me a bit nervous -- that's a lot of code which
> >wasn't really written or reviewed carefully to ensure it
> >can't be exploited by a malicious guest.
>
> Hi Peter,
>
> Does KVM increase the attack surface compared to TCG?

Yes, because our security policy says that TCG is not considered
a security boundary, whereas KVM is:

https://qemu-project.gitlab.io/qemu/system/security.html

(It would move from "non-virtualization use case" to
"virtualization use case".)

thanks
-- PMM
