Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2341472lfg;
        Mon, 2 Mar 2020 03:45:10 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt/sp73mlRSbt9OKyamRvz1sTy2oHPB10numaJxFBKGCXOykUccLnQzjXshOrvobwzjAP2E
X-Received: by 2002:a0c:f98f:: with SMTP id t15mr4466464qvn.44.1583149510125;
        Mon, 02 Mar 2020 03:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583149510; cv=none;
        d=google.com; s=arc-20160816;
        b=DywrNBL2rqaYFTf12O7B57CFr4MoWuQM4/lDU9R8hVzCuLv5Gdc2O5vdp5W5IoUCtN
         AaTqkR/6fTC+zE+7wBdBs6rLof4B2S8Ihf0ur9yXLr6swtIJnhLbyYXrkQm5oa+LZ5VM
         sreO8IVjpPO8UT/U/vlVK7/cdSq99eePQnNfDZ3FQCqpdj45esvW0/Zx+I3q3tpHkGlM
         sS3DHZg8AYQtS/mw8iB3zA5WgV38Si7RY++eXNgSDJsFaV2DD7U3CWQM4l1bODnnvWnI
         Nl9jWLumXKJFwpJkkijihRVzzmFFdehQOPG19LzPX3BlVsqypaM1ExgxorWrNTci2mqT
         uhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HzUbiyFOIAhKBOLtvU0wcuoLQzSWzvKiUf4HyRWED/k=;
        b=nhHYZg3R9Yzcg2sFz5UC1U0UwHFhSwHcr7RuJLeVfuW47HE6PHzi0fjliM61Xn4mFf
         rpSwv3ikIiCM+Urr2UgzpUWsN20crIG33B7Wc0nSGHH5mqnQiV89Cz5Uq2yPP741pX1E
         DXkvTrSbBJB7QWtw1tT55lMiuiTFrsF9jxN7Lm6guBOsgsMwSGOzBvyD9As+AkR4dgXv
         r6tASvZBysFHhmG0VHP8LJbzJDwovIFLA2VyYTvjpcxwNQExrG9xl8wX+ptNFX8jG/U3
         +atvkHkCu4zmTamgdA58um3IY6433/iEuPk06+vAIFjTlndTTWMHenbwM5Msi4QLzCgj
         gWKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5nfF6Ei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n90si5420661qtd.107.2020.03.02.03.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:45:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d5nfF6Ei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jVV-0003Td-K8
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jVM-0003Sz-82
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jVL-000572-1p
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:44:59 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jVK-00056g-Sl
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:44:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id i14so2269477otp.5
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HzUbiyFOIAhKBOLtvU0wcuoLQzSWzvKiUf4HyRWED/k=;
 b=d5nfF6EiGCLrlhk/zQoYA4Oi3l/X+sYzzgck+sTDOOhqWVFaSPkboNAI21ta9aFg7K
 brD54B+LFgeYwuOhjg1wb+yd8riCXo5ZbeheWJSXW29YPSy4ygpz6moFr0MIL9aKFx/V
 4K4J8MT7mEz0tqSTwJJAL2gz9SnCDQRGmMzqFiR/3VpimSLNvh0uhA+rlvvJUNgE5lQz
 DXQgitj+F5pyAwDsYyqBR1fWzHyOn1x+1PxI5f6msa4ng9+wi2bx36MfieA+kdX/M4jj
 BUNIi52eFBudEelw2Lwr/DRD3zlBo9Xa/vc93kXP4NIalR7d0xpSeXkRtKYJDN9PMOEX
 gtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HzUbiyFOIAhKBOLtvU0wcuoLQzSWzvKiUf4HyRWED/k=;
 b=cVKMXN2haUAEy++VDmDo8ssRvMoQSW9a+m7oOaIbur4zsUNOsxQAEOryP+jwiWwlQU
 bJo4kCGrE2yxF8gpKXrsKPm4w1coR3zCudZDXxJCMhA/yH7BN9jZeZlUG1uIQu79EeYr
 SQH0baZtOGBHDs1hBg1iP80QnVeOQ5aEpsXM6rvclkQ8w6wxU1vZA9vN5GLjs5n9XklG
 H8IMYX0gSbOTeiKgugsQ58YH000nSrBGqCvvORRp25b0Or3d/D2pMT7jUthoDmiremYf
 kKV+FxnDWmhEIjKV/WOPM9oiU8P+7gH5WMkTrrqSSLCuvUUHkeg65aWskdix4g8m+mSi
 KvQg==
X-Gm-Message-State: ANhLgQ37HQ+yepGbD5mVND7rQEwx+jXPlPWcpq8O/SWf6M1PcAj9xOj+
 wt6xb4QQWcSaVZibnrbimkEZMX6IMJpy/ikqbpswrg==
X-Received: by 2002:a05:6830:1406:: with SMTP id
 v6mr3688045otp.232.1583149497899; 
 Mon, 02 Mar 2020 03:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20200228125351.29482-1-philmd@redhat.com>
In-Reply-To: <20200228125351.29482-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:44:47 +0000
Message-ID: <CAFEAcA-AUSLBirS+1_JHCVQAH5-ZJz+YL+Qp8StALRW7b6EzJg@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/arm: Remove big-endian checks on machine code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HB552PkqjiUd

On Fri, 28 Feb 2020 at 12:53, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We only build the little-endian softmmu configurations.
> Checking for big endian is pointless, remove the unused code.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   hw/arm/gumstix: Simplify since the machines are little-endian only
>   hw/arm/mainstone: Simplify since the machines are little-endian only
>   hw/arm/omap_sx1: Simplify since the machines are little-endian only
>   hw/arm/z2: Simplify since the machines are little-endian only
>   hw/arm/musicpal: Simplify since the machines are little-endian only
>
>  hw/arm/gumstix.c   | 16 ++--------------
>  hw/arm/mainstone.c |  8 +-------
>  hw/arm/musicpal.c  | 10 ----------
>  hw/arm/omap_sx1.c  | 11 ++---------
>  hw/arm/z2.c        |  8 +-------
>  5 files changed, 6 insertions(+), 47 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
