Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4307989lfa;
        Tue, 8 Jun 2021 04:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoWb+Uq9+b1ex5ClmnHAMwwzcYrs87dXzeguw3PzriyN4V1gpAUMhF/W+hly4GULSCcyxl
X-Received: by 2002:a19:4949:: with SMTP id l9mr14526881lfj.642.1623150098241;
        Tue, 08 Jun 2021 04:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623150098; cv=none;
        d=google.com; s=arc-20160816;
        b=jY697iXQcIbCcC4Vh4d4OltHObFWDOaBecAyLAeY+ISIeRxYUA84UOfSsgm042FFCv
         66/IsOsIdlIOPiCOk88xY9C8mGERZvZ4Fb3bP6Hz88SVrSGA4j4EtzfZni99AQJAkWkO
         O8RgAkG639+ti29NUQZ4Ci5s+xqm0U86Cv57l4b42FpucfI5lyIKLcZ2V4I4eOTKlH7Y
         aGmd9+BuyW5SeRC1WwTGen8eozmbTvYeVElqYQHo6tOiHQUVIJgLUUEKxNudcDDiUQmZ
         xhP1RFFnP5G/OUC9lzmYzAP7+TQGQSA+nqcDTM0LsEYr479Z4KCHVErka0BK/ec2/O8I
         XY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UxHYplQilgAH0I90cgA205y8VSyHLtFGuamK4zfxllU=;
        b=gVunhJZqGBEULUxnw8hFUTK1UR+B5zqwlEbH8cOtVi1twkeL18Zx6X37uD9iVr5Rj9
         7vm0BCmYaIJE71xhOEz0tRkINvU5Jzlu997OYwAM2JU2gtMlbET46kZ7bFgHNs57sCtB
         DhDFHAgvHLzenjZgYi3AJ6NkXjnAgMsDIauVLaQLyahjOLKuruA5DGRoZ6BhM4Bc2Gp4
         HrPWcjtj/M0WqignMzh/TqwTu1w1dFxgzXK26EJyD7Qv0mI2arBx3vJW3kyMUI1NNUDw
         yrhP8PElvKrFd7M+5iBBTazmYt5YCcUOovcURiO+DVhYCDG5FGUG59NbjihRri0JUqaj
         uKrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qS1m3OxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si18730319lfo.188.2021.06.08.04.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 04:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qS1m3OxA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqZUG-0007LE-2k
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 07:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZTr-0007KU-Aj
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 07:01:11 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZTo-0002fA-IZ
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 07:01:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r11so23952217edt.13
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxHYplQilgAH0I90cgA205y8VSyHLtFGuamK4zfxllU=;
 b=qS1m3OxAijK657xV9CffU8fPFk7otxarmAidjuEKXbNLrtprJRz/rfOxsobE3aqQKz
 MLA2hL4Rrv3Q11UBOPCayut5Nh/HcP9XQI3V2jLVCI5BpFpJtkt5kZ3nbBcJZhMeX/y8
 gvq/rXz3U8wQu3lw9yD5udPzreRryN2VwAxBEoeAxz/OV5UrwbpR/XfeQxYJkkH503fA
 IVc1zHZIII4NqMXqOD6cstwnePDBkz6PBqfELVUwSstIazwDr+Sgnm8ZoRb4azbTVYEx
 Enu3jftpi5FhsGtIT621xG8ArdTPvRsvez/vrBn59b+09Ycq5x8YidfLh3zR4AZfhz6a
 XhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxHYplQilgAH0I90cgA205y8VSyHLtFGuamK4zfxllU=;
 b=A9uU1HMI9iKhKyr6PgnwjDpGVkbrdceJOWoZLHuCTTiGHQWQI7Q34a+3N5tNA1v4IB
 ECN6m+exMAc9vyUUm1oAEkNhzx1mgoHpFW16BTG1Qcd5Ys2Bk0WOsNGWEE71ufvsgS+e
 fchAkSDFv3hNU5n6oKcqL+WVSqHExbpANOX1Mfg1YK/paKV+BJH4VZGliD/2e7WMKS5/
 wI0ywg8fc3uA1MF2+DFOJh3sA7HAtfehJxXyghBL2gv9tdkZrHSgwfA+LtYhDMt4LDlM
 q5bAxVVTWpD/PtePD61TzCfH8Ztu0F49JpgVIGagZAwkJKWGXsEbplXAw+LSStTMPf8r
 1/yw==
X-Gm-Message-State: AOAM530ZIzwEUomZNfbK5+G83fyEvskfZ9vWjCQaRZNqCYQGlnWr7WDe
 /CDm3KoPj3twWFcyx0aOl06VJTjMhgh0Uwi1qP5U4A==
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr24626347edu.52.1623150064684; 
 Tue, 08 Jun 2021 04:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-9-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 12:00:31 +0100
Message-ID: <CAFEAcA8syVjq8+mo5h1QhyaW1-CP7EaAOFCbjqRHDmum+bR7_Q@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] hw/arm/virt: add ITS support in virt GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: afHgv/+/s3QJ

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of virt platform GIC
> initialization.This Emulated ITS model now co-exists with kvm


Still missing space after '.'.

> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

I gave you a reviewed-by tag on this patch in v3; please don't
drop reviewed-by tags unless you make changes to a patch,
they help reviewers know which parts of the series they don't
need to look at again.

For the record,

Otherwise,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM
