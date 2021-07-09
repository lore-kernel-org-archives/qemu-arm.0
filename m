Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp808230lfg;
        Fri, 9 Jul 2021 08:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx15S6+Ogh4xVnV4fxfNa81Ri6YJxpRzDGOFTaNeCS5BaROQqe/7fGx1FJ9A1hO9DOe3z2H
X-Received: by 2002:a05:6402:5109:: with SMTP id m9mr47403325edd.297.1625844880197;
        Fri, 09 Jul 2021 08:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625844880; cv=none;
        d=google.com; s=arc-20160816;
        b=PNg6tNvNKOF0vh1jWi6swgYMHb7y9vQn7HzjQ6p3HEI0a+xzoqw1l3b7FgGoTdsSW0
         013Xju/VSH6wB2ipFs8BnOhCXVsXiZsAJIMns/slxnUj2NV/yvpDBQ4XcGKihirw57UR
         cUiWDVisRpJg/NFnqQvesBi7JsC68BUkwGZl/d3hOjA6m0hO4Ny9N8ER8YjfpAKxsgzR
         Zt6tmXa8QvT89Uag12keIReOz/KCTVnCvAApTFXjMfPhYrhyGECGzDszqWyvpHM6rTag
         /b+lfHihsVllV6QuASGPQnvKzNUkLawTD5fb5mLVTS6//ekiqb7lEzRFkBliK6BICrjS
         MwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n8W1JBkkWZRIyProEZXRp4CvX5rfrpL4QHzTFWDL6z4=;
        b=KbcLFbZfafQXlW2A9Hgt72aOztI964NG1/owTKFvCgFsqObHTiTWB+dhtM2mVTuhIf
         D71c7ljVnh8/i57ljhbE+zcbwe8EPfn+TNDyDXWi6MtzNlgTRDeVJyMQE14AXBZ+JKtH
         1f1Dh+EUREDgRvUrH6Ji/VUuw4MXZSKlJa6JDq425CG5gA9QVoIEh8+INO9OWRHDAex3
         G9hEBmj0LykX/kulHDIx5I5g6PR/K5GhWWuW1EDWnY2RL5iq9QyjUAiWW3TXjTKM1Vph
         p/szxUkAiFHVYczUULBrfMvkJNfmWlrn4JQU4VKaISxlDqhHYtyp1xyzqtNLssYmY6/N
         WG4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v4dMOH1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24si9058381edv.35.2021.07.09.08.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 08:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v4dMOH1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1sWV-00076l-7w
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 11:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sW7-00075m-P5
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 11:34:15 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sW3-0000qk-Tx
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 11:34:15 -0400
Received: by mail-ej1-x630.google.com with SMTP id gb6so16890643ejc.5
 for <qemu-arm@nongnu.org>; Fri, 09 Jul 2021 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n8W1JBkkWZRIyProEZXRp4CvX5rfrpL4QHzTFWDL6z4=;
 b=v4dMOH1r7whYHk549c+FEvLWnmlElFu6ArsTrp5tCX1Ud3/GlQB3UvCmwa5EqvldAV
 EuXKtVbRbM2C15QFVa95W0G+vFSBK1jhsS5X0Nahat+ANr1+jaxSgRrrnPohLOfogGcU
 DDO8je1vIf6o8wEy4t1lN7L20yCdl/ugzBzimwlAZUcZ53dO3GAu452LFfN93z1fTo9k
 g0zwUKOVPeASZl/FuaVgzpqVjOce1oTE10/6a9a6Fghssj0taSb9l50HLXIUnXaklD8b
 AnLdO9oSFvlPWFZeWlVxII/O3H+fGwg5d0UD1ejRHA4RYdi9tYhmz7efHPcOBD6v1osI
 qhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n8W1JBkkWZRIyProEZXRp4CvX5rfrpL4QHzTFWDL6z4=;
 b=Q85VU2FiYaVbEcpcewDl9CNwfUwjz2mOznBv1MmR5DI8o3gf2mCz68FidUHuefHmnE
 KmYwlJW2HwBElsctFpczJGmea+u0hS8ByIIUmWgaQQhcHmsN3fBbqOamBJFSNHqW5aJZ
 VoqdMRSGHXgKBj7JtLbdVpg7TuRSeM5qgTWuGdgkYCyTWS/APq8w9r2qumb+yGsec+85
 JS9FhTBOA9piOY5G1ECPorQtQ91r0HpHzBetZ2G6JDs6+CtCzzVlIzf9nrufnc+/2snu
 GyQH3unSQNhL+iI9ETJh3TdYahr/PPbveq81tn70oC69dgV5vzUc4TZ2sFN3UnX2r8qW
 Eozw==
X-Gm-Message-State: AOAM530n+V8wXYxKWHCKAotUqq+BLgHNF/xK4JT6x0O/QXUjeXZg4xfN
 r1JI0AMLRd5GOePMzTvmQHC6j4mBPX1IZE6WKwC86w==
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr20861041ejx.85.1625844849812; 
 Fri, 09 Jul 2021 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
In-Reply-To: <20210708145514.1751773-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 16:33:31 +0100
Message-ID: <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CrhW6wWNyj1+

On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Since v1:
> - renamed tests (Peter)
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   tests: Remove uses of deprecated raspi2/raspi3 machine names
>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases



Applied to target-arm.next, thanks.

-- PMM
