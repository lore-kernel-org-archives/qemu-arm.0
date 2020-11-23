Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3478931lfb;
        Mon, 23 Nov 2020 02:52:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrT4oN28qcPoTqZCYCGCGw4zrESlI3tHEolQqzQG7vjYQtFcy53C8gH5aox+AOl0O/9bx9
X-Received: by 2002:a25:504c:: with SMTP id e73mr40326375ybb.376.1606128726194;
        Mon, 23 Nov 2020 02:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606128726; cv=none;
        d=google.com; s=arc-20160816;
        b=AdDFrdzpLY+kASPLxXOxn+mctcb/bVgQvDO/SxqbOVQFNf8ilSX7mH3Wb3lJXFiL+f
         nDfaUmGSRdP1bDnAsk1D99QXoYbyegF8BZKP9uZGaHKIFufANxU3OO3qmct62kn2zlYf
         B+SO2tGQTaJ2PVfJQRCDwwJu1NDR5zqmPjdEtu/uFTpCodKSUVf15XFwHeqUxPK2tG79
         bqqLci3reUPV9xlevLWfeOFpvrgBtj6M7H3IrpPnt3gJzD8ZpSlPMcF78b+LZ7OcS87H
         CM+6VlK4cS+lsJKtcbc+PrhwkRCzH+bk8+8RhjrtQ3e85RxIOGBn5mjzC1Jt/DTdcMs4
         jhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7c5smF5ygigAWtci09fXgHOmo5sEKFj9RYcH9d7XejA=;
        b=I3UL2GfPDoJkO6Hsw7TEXWuzwl72RvyeIV+fnRBJZod6NUOUDpeAJKwK1MxKwlJDrF
         IuHvQpPd3sDBxVezgoAIsahaGfrLiz+lLW/d6n/B1z00oHRisojGbkazKbOjIexta4/s
         IIHVKwIguRa4SbOnP70S3O3YggIXgVQ0zfebi1Xtjqwatnw2fJEVdII6PUNEWOAUH8iA
         Z5nzccbrzzcFUJd10fYJ9SAyXsTE4RYFZDHRIoUMuqT9PFYuVh4+SEyE3oEmq8auoHd/
         35O0403Fi+niNIHVbWncRav5U2a8rq38X1oVb0se8gmDVzJdW6WZJqL6RkpV0WVqMxrc
         5IgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLSPgstt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q77si11587545ybq.221.2020.11.23.02.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 02:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLSPgstt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh9S1-0002J3-Km
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 05:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9Rt-0002In-Bp
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 05:51:57 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9Rr-0000dI-Uz
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 05:51:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id lv15so16770660ejb.12
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2020 02:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7c5smF5ygigAWtci09fXgHOmo5sEKFj9RYcH9d7XejA=;
 b=jLSPgsttSG4Vqfi6nebDDNNkdmdQdivphlmgLKOG3P7/m482v7t+NlRNhcdA11oKH0
 1qYwHuAMFiDS//22ri7VLMt5dYpQXsKjkVIw2244e4BDnMaZgbWkGCN3k4ReQcJkel2L
 WQl/kVanxRyPoNTnaInvp4V0KcD+702dhv6gatQ8kJADiWA4gb/Yb6Voaht3wSKC4rhE
 +K8j+mfj8NB7ALfSUFcX4MHcF5eulWkprN66hWNHiYFF/exi3AY92fVNmU3cb9ehi7e+
 vZoYsCGmFyEMcCRA++nT51hbK0QIfCpGR2Xdkb/9AoTavNuSifSItwT+BBWwUZsG8p3V
 M7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7c5smF5ygigAWtci09fXgHOmo5sEKFj9RYcH9d7XejA=;
 b=STi9Gu2ClYrBW95f4LZRkPeBZ4ZMXbxOg9xmNEqupkKtO9JTr5YtlElbr0Gg5pxKgJ
 NvviGW1+XhSFkqreLedYJ7bWI7qz7G3BYqBEyCG/Wz46jy9WGGepcULuvf6hQfiqzPjI
 km0LFuXnM8cec85BvI0sf5Vfp5cS2h0hsQTWLjbAIJxTi3bjWK5YD2/WhQjkV6NEBeoR
 khIvhvnW3H+aJQ9hZvRp0L9ULbM0TSM1raY7B92kucIbmOtHL3FTKlU+VKVtzgK3OWi+
 qLWg7iqEgXwTV5oLPk9nkgRLswb9VMvDGCm0wLYRKf9KrfE/CNVXwWl03TRmgCq7Bj1H
 TVFg==
X-Gm-Message-State: AOAM533MGstmEdc3Hzsk+CMYFPkQnfn8qWLSByFymps9CKmst3Hwrxhb
 hTF8jI8Sl4pM1kUzN6FHnPjA/ZcjxUGkiHIB9/IPug==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr32334614ejd.382.1606128714314; 
 Mon, 23 Nov 2020 02:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20201120154545.2504625-1-f4bug@amsat.org>
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 10:51:42 +0000
Message-ID: <CAFEAcA8bjTvVY7R3hKhJvRiPVrUVh90Z8suROKVdZiR-GVEU+A@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 0/6] MAINTAINERS: Fix docs/system/arm/ entries
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6JHrzbWkzeI

On Fri, 20 Nov 2020 at 15:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Correctly docs/system/arm/ rst files in MAINTAINERS.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPUs
>   MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC machines
>   MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton NPCM7xx
>   MAINTAINERS: Fix system/arm/orangepi.rst path
>   MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF machine
>   MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines



Applied to target-arm.next, thanks.

-- PMM
