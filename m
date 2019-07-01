Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2532422wru;
        Mon, 1 Jul 2019 04:14:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGiGG92TgG+UMeiyLuVLxmYm7PWNx40z77etCXXNJ6aUGDZUbWW7D/6DaczZfjRfgRB+eo
X-Received: by 2002:a17:906:190e:: with SMTP id a14mr3080283eje.69.1561979657606;
        Mon, 01 Jul 2019 04:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561979657; cv=none;
        d=google.com; s=arc-20160816;
        b=xPy0QuSwTydxr4bkh8B044wKHxoKjdNm2YPX2I1t9Ro8T4d4bYCBIubqcv7nbtMrRW
         7ZwSf5sfHCCgYwvTCqZdpOATDPATeH2awow3IcN2wVo1vZW+0oY/Czsih0svCbYpJ4Mo
         ddFE8JSyWKXBf8Lf/P4pOsgxImvvW6lhy/nhpQlQbUsUkVU73HU0ZlkspG598k0c7eY7
         VZymiNt4L6bSGoZaPhB1BAb4ssCNbk/jnJj6CUiVUmnJGQzB/XKhMtKe0yHVsamrznhT
         ykbGOKUOg1g6DX3jwwnDArABdjnOFart0omhkvR7uFsTnsMlkOf5vM+WAhLQZT02ZZcO
         nVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=LPSeQWkfs5J4+0aio5LX6XJr8pFDPxJtfyKxsNBQOXc=;
        b=uCZY0Dgo4WiogUCsZ+po1RiHmMjlTlVwFqkrhCpJEoOz5Ve7Gm8RartnrOGtEnBxfI
         6z/NZYrdmhXPBM80G1s9i+zjwMyCNvE+V8/F8BWEJA+L1/PKm/uNtY3wGEbKI/G37s55
         nThaW0lK/tcD+XTg7XyxujGZEHbgTSliU4opqowPNbiPyXWD3wg6cO77iTXQ0lkIGBGK
         i/V88v5p6YhmWEb9diXAEFb/hVFZ4sXExpzqnETC+b5KOoegsYcmGAL1NKm00ltIGw8d
         nVFBI/psbBdF9beLfmIydz7tnxhYVCRpnDcdWPX45G6EnnmgzNXBQoEAodNyBF/jksW9
         WPZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ar7wxNAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si8171602eda.142.2019.07.01.04.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 04:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ar7wxNAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhuGG-00049n-NA
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 07:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuEt-0003Gw-Bf
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuEr-0004Vv-FP
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:12:50 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuEp-0004Rn-9a
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:12:49 -0400
Received: by mail-ot1-x343.google.com with SMTP id d17so13090241oth.5
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LPSeQWkfs5J4+0aio5LX6XJr8pFDPxJtfyKxsNBQOXc=;
 b=ar7wxNAd1hV8I8OWCnekf7cL+dmWJr7iva24/6oUtkVZCXec86qh+pfkQNiHo/eYah
 54Ff4IWziohKYeKcE3OBhjaPXC3u1gYYr3Mvq6i3ab/7Ac/MhDuqRXFuzFt8Ab7JGVdF
 LpRimq2ccUAdB5rE/zICa240Y0PqZ4oRV/Amei86KPQfwbau1hRZZqq7+vVJHAP7+Vci
 2FDgj67jU6NY9i2rxFUV1HVeQRBwwa5fjuMbTi/gnLMFOucMCHBFqo5gpucTaJ9LajBx
 cRXNIBD1uStr6NTfkkSm9m4JjFSBXntrhounCNhAu3aRbSWyChScccICnlKB9JV6/fFQ
 nQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LPSeQWkfs5J4+0aio5LX6XJr8pFDPxJtfyKxsNBQOXc=;
 b=edxkkBpG2vyXXhsPc/ZfjW3Wb3YmKDSYMfJdVM3c0A1pl2qn9ZTFEn3AXxnTFblaOW
 HaWl26eKtvsmQVMQ+8dvvkWchslN5lhuW/VmldWNhaPyKd/NQP93uV9Xy0vEb5nfLr5y
 OFmRlQNz1ZBTQEGnx0aEupEWTOAd/xgp/wv5T+lS0ST4coP3t+wSfm2bdCv/1KfgJHPx
 7zXsS8S+l2qje8Tzt+y3SjERGg2L4XB4cTzSb2Fx/oazlwhisHKUG+Ka1raj3uyOQTYT
 HSQubuFjSHP5hT0u16ZmiGyyiDlTkMcLNpGsAC1zm4dINlBEPze+cjyJ+hDXRLOBl9lr
 5kAA==
X-Gm-Message-State: APjAAAVsYLRdSTJrUZ1rGlKtC7zSRG4msRQ8NXnTVn0Z9/IsPYbWNF05
 KywVl2riqLZ1GhQ9avPoflBB3BXylzIFKCwuxDiehA==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr8164673otk.221.1561979565628; 
 Mon, 01 Jul 2019 04:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190618125844.4863-1-drjones@redhat.com>
In-Reply-To: <20190618125844.4863-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:12:34 +0100
Message-ID: <CAFEAcA8ujpMTwBackhT5V3hN77e0V=PFO3+0pvXu5mnuNok7zA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: fix direct kernel boot with
 initrd
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y3cdNHwzOVTF

On Tue, 18 Jun 2019 at 13:59, Andrew Jones <drjones@redhat.com> wrote:
>
> Fix the condition used to check whether the initrd fits
> into RAM; in some cases if an initrd was also passed on
> the command line we would get an error stating that it
> was too big to fit into RAM after the kernel. Despite the
> error the loader continued anyway, though, so also add an
> exit(1) when the initrd is actually too big.
>
> Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> DTB off the end of RAM")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
