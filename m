Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3736623lfa;
        Tue, 27 Oct 2020 04:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/BfLhRx4w/wlseYoG2WXNz2ciD3GIg4cJLrCr00Zk+lUN/RfIxfZLQoHhAAtuygTh0ip7
X-Received: by 2002:a05:6214:180d:: with SMTP id o13mr2002248qvw.34.1603799233637;
        Tue, 27 Oct 2020 04:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603799233; cv=none;
        d=google.com; s=arc-20160816;
        b=jmt/dFjWrp2fQh0mLN5q+0R9jj0GM35s40O3z2Q/3ccY5mK6RcQ08IJKIHrFADFyFH
         fsexvO+TEBEAaCml5K7SNBEDLibuNwBI/thzL7CeKGnJlvt9qwMRjqndyA6/0JMPa3Kd
         JvaM2EcDOyLPPcbbh5oaHRQdzBB1pcYzwH3WyQJH2q2vFHlQkZ7ZUpa8OKLl2gpelG8C
         Ic1acf4cJwkcvDYzQhazg7WqYj15/UGeV1sLziDzUMchEJGJHQxl1spuJ1Xh6UQaxD2O
         Xg+je0WKsdyEVCq+P6sEK1SZq25+UWxbjJ5nuUosMGx6IzKTU0Gsi07dKOgEznIWxAcJ
         Yihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZjHkoAu2GQuZRbdEyCVjIbSkW16Ixy/i8fRdvBrKSKg=;
        b=PAeNEoZaNKZnmOdHI5U8rmMEfyezunGv+kU1XrxkZf05XcML4xK3eCPijYmn9C8Kcm
         GqZHZ8eNZFnF542s16kxYS81u4Eru/bu3jCkgBpFnSeR7NtC5iA6Uj3Bg1hMoZhN6rfV
         4vUHEzgvTiuMCedSYgdBeFyC2IvXU1HATCN8L8ttookb3eplsjh6A+lzuaQhwx+IbQxW
         cwJBNcdE3AsIuObypTAY2iYMRPxUKtIH06Jfjvpgo9KjTbw/2By08o8SfcTSBSG6lRf9
         TiJYwjqQyoCalJ2u45V3eWp4LFoqyWwtUsQRYbxqjrfeDQLzSJFKoctqKM7jfhVoELVh
         6Y+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUQW3PTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16si602882qtb.366.2020.10.27.04.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 04:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tUQW3PTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXNRZ-0002rT-3w
	for alex.bennee@linaro.org; Tue, 27 Oct 2020 07:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXMuP-0006Mw-NG
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 07:13:00 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXMuN-0001jS-Rz
 for qemu-arm@nongnu.org; Tue, 27 Oct 2020 07:12:57 -0400
Received: by mail-ed1-x544.google.com with SMTP id t20so973385edr.11
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2020 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjHkoAu2GQuZRbdEyCVjIbSkW16Ixy/i8fRdvBrKSKg=;
 b=tUQW3PTZ1LsZuYvAoM1NwNuu36jMBOwT0XCkxMU6KhhbCK6hpfRoZ3dQ/U9qh+BnNo
 AJERZi+MJY0LAfOZw7TS8CZ9xs69u1yHczPVx2UbjhOAehjakAh7nJcCv5tqPlNjocgM
 mSK6IZZiSCij8fei7YJIcQepKHQ5eFa166/TeA2bQJtXFhhsvk6FuBmZAHURMSFNCL5I
 9M1ABo5kLR9OpxYOziq8SHsiF532vj4xbkdKu+spPPPFulpMkxNtbHoFeyBupJr6NC+N
 FDzHrPAcWWYomhaH87m0g6AtgEN4krM/JE6GFaHKMMHCZbCr4x3FTVuKkv6nyILI3/Ix
 gKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjHkoAu2GQuZRbdEyCVjIbSkW16Ixy/i8fRdvBrKSKg=;
 b=LiGKoj1TLpK8l3UnF16LUx4lmU6FXs5JKrFnzd5n4DmkOmYHo98O88fUtbCBLPQIL4
 Ganr3ABT2SB3sFZ715bUJxiQ0ep9uZJ4kShQzYZBI2bQnWOt+B/nuuXVUTzz0u1pO/6g
 bOIv5D8zQmXbEM6wflcA7MmqlhZElzNXub/ALNr6Izv0hC9uvl0uFzf0bQePpyGQDseD
 QyNQXWKCHZ5m2f8V6X5NveQzC+dWD/CmKBxrN3zpcaYr2otS66vMSFQS6FIsQdu2Eap/
 SShy22MSG/RhjAD0Ce4qvMbcrx8H5rzRSEcIzu4Igb/+HwjoTQ+jHgqpjHXIU8FqJQXc
 FT+w==
X-Gm-Message-State: AOAM531VuGpV7FD4VrDGh0jOzrMXbikk9Or4OmLflQ7Thtwtwo0PC+Zr
 T81shbKQW7XsqlHinaNWD8lJ/GjnvcDKlS60MlUXNrpyBCc=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr1703863edf.52.1603797173945; 
 Tue, 27 Oct 2020 04:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201027015927.29495-1-shashi.mallela@linaro.org>
In-Reply-To: <20201027015927.29495-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 11:12:42 +0000
Message-ID: <CAFEAcA9KQwGrS-9J2M41=KCzJm618vFH4cnjRT+H5AwREMxcsA@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add watchdog support for SbsaQemu
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 7uc4z0mYtCfn

On Tue, 27 Oct 2020 at 01:59, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patch series adds watchdog timer support for SbsaQemu platform.
>
> The watchdog timer has been implemented first based on the generic
> watchdog timer specifications from ARM SBSA v6.0 and then used
> in the SbsaQemu reference platform
>
> Changes in v8:
> - cleared irq also along with ws0 clear on each explicit refresh
> - addressed additional review comments
>
> Shashi Mallela (2):
>   hw/watchdog: Implement SBSA watchdog device
>   hw/arm/sbsa-ref: add SBSA watchdog device

Applied to target-arm.next. Thanks for the respins and for
working through our code review process.

-- PMM
