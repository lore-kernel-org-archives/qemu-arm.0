Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2334393lfg;
        Mon, 2 Mar 2020 03:36:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaAuEDbWZ+fDeS86I8ErdrdeMCoG7nrRTmsuG7gHjmkf++AYVcekUdeeKe5rZtaDfW6Br5
X-Received: by 2002:ae9:e204:: with SMTP id c4mr15842359qkc.429.1583148962178;
        Mon, 02 Mar 2020 03:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583148962; cv=none;
        d=google.com; s=arc-20160816;
        b=Tpa6Umup/6zWyY9LQmusBBZ0M6ae16YfipVMzuACAgd1kN4Af0Z0lehpzdXTQzpMnX
         a06sORub3+7RRCxOPMuO59ON7uGta+KBoQeydo7IruqRnkdTpLUR8kQbqx0dbxyg2r3s
         Z/7J0YKKvd+hVSqYWvRKLlLsVCmtM6kXOBb0eVRMGa8NRHiLDyepN6kzqxTTVpUWQzQT
         zcCwCv8PCx5rOmoI5HL1OLUt5IOOaBmQfuMe4buPV6Wvw/shClAbeWLU7YePbttfe1tU
         9IAz7CRuqpVUxqHaKc3WqK8g8mCcJ/aqRTbOIu6QdVJrdZYWsYDjSAGMVjNzGocpn+tu
         4j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1PfBpAz4U9Q/Byx3V1zrSqBUAxWhaHpnyZd5bkeP5Y4=;
        b=t4XOR2D5aaKQS3153rbCMMGAbSC0WGCikmLEKa+3HvzmTnALEPFuEQcSuy10lkjW9J
         IsmNgMWikMau7fun7F4eSUcuGFI4GiYt5Vp/8eP/+yOXTG3Rdpp++NV2gvomQ3xCml8n
         Cu1IzIE9BfFEdauDCnHwmd/outEsa4x+DUf0MkeHuHIsWRv2TYMdCWI6gTRM+YhBrz+P
         KLaP9h+79ak75K4E7OHR3b/2j8fJQL5pvyp6uCzYw8eVdMs1FhRrUlBFWBO4SwxgNS9A
         qKSnw1voBrGFZ52SWeaIfqWernKrAm9bxbxwzZk9VlnfuKhluJOgIGPUNPgWQZbBjiWf
         Whaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UM015nNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si5509218qki.355.2020.03.02.03.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UM015nNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jMf-0007nX-LU
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jMV-0007hi-EI
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jMU-00018w-Fn
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:35:51 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jMU-00018V-AJ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:35:50 -0500
Received: by mail-ot1-x343.google.com with SMTP id b3so9356987otp.4
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1PfBpAz4U9Q/Byx3V1zrSqBUAxWhaHpnyZd5bkeP5Y4=;
 b=UM015nNkTq2L8KPG0yKHdGvOz5PjPLc7GjhmREK6YE/VXG97CJMcqk2oJ3Cn1GYbMg
 oYNWaOdwxRo6k0zwyYghQ3DitU+PZxppnvU9ZHqISs8ACxJ2SXvwT5TJNAaQ0kFn9HiZ
 we3lsn2Ai7eqa/D5OqYjKWP2oRKrzvA30rFQkIICuHo5yS0gOD0jXim6SNFhlGLh8YP3
 Es6mzaJ0HAvJQkDL1AYG9vXoEDW24IlnYK0mUbF4eJeg8xajZkkQsQJ6RqY+ekD01jJg
 3BxHn/BPH5upwWpyED2SLVfxOQ15wiZN7oQWuBRkrHar7V7eKdcB4Ipx4WCxATHtcDgb
 qhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1PfBpAz4U9Q/Byx3V1zrSqBUAxWhaHpnyZd5bkeP5Y4=;
 b=l6TlptKs4stEYJltiR7D2VpfSyL3VQf/SUtriXXtVRoM2KOXpDV3vX8jHr1C1bWKV/
 Y+j26fJkHHxTENzVbJPi8rdV8/vD8ZR/DGe6lPMtqQmCJjrQ7eLoHoLWtI3yyRh4GhUS
 KsO27EtXs6Eh30QhJF0gDGJgiBrqXAGRFMJXc0w7OHohAa3TVU3CI9rQrNDVUL7SP6wi
 4xbBy1dWYIdd+55HVpFeOD84SaO6u25hpAG6E4isZU5GO9tvOBeU6Ok8tdCkMjDoOoFP
 bzTSPytWmSFCkA8WMmKhmIL/Ljzn+Y23RUH97calH5ayS8/VD95+mbWo2gG51runZsIn
 K3xg==
X-Gm-Message-State: APjAAAVbmd+/zvL1TzJEwVMBRAj6/bcTTv1AneMg7tSVnDent+7ItFTt
 NG3T1JXAm6IBjWLSuKPztShIzUZBjkLGBjPYjRx5KA==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr12889550oto.135.1583148949522; 
 Mon, 02 Mar 2020 03:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20200227164728.11635-1-philmd@redhat.com>
In-Reply-To: <20200227164728.11635-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:35:38 +0000
Message-ID: <CAFEAcA9MtOyMdz4ezuc-sL0tiD__m7m+VXyvtq166bW1Ewu3hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/smmu-common: Avoid smmu_find_smmu_pcibus
 return dangling pointer
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LC0mA9OQKDWF

On Thu, 27 Feb 2020 at 16:47, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This series include the previous patch from Eric, then a
> code refactor to avoid similar mistakes in the future.
>
> Eric Auger (1):
>   hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   hw/arm/smmu-common: Simplify smmu_find_smmu_pcibus() logic
>
>  hw/arm/smmu-common.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
