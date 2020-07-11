Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1833427lfm;
        Sat, 11 Jul 2020 11:33:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqd9/4O6EcMa12rqK20X33rzydjyIZnts6kaQHtVmX25XFtBfwSLDwfnn5Zq+Or18syBbS
X-Received: by 2002:a25:c606:: with SMTP id k6mr74055895ybf.0.1594492417860;
        Sat, 11 Jul 2020 11:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594492417; cv=none;
        d=google.com; s=arc-20160816;
        b=qpJQFhJf3r1HVVGxXcEfHNRhzO1+12DMNZk+N+wn8JIjXbUUVJWKRro4kLXFFYvhh8
         fcR6pHvWRmNzignTvM2YZ52OtHhJmlb7cl+GTxfAJDS8u1Z0oxZY+4DPp7fkLR4B63nw
         W3z6GtpRV6QO7A6vxW+MWreiHJmHFgz4mg+HBgXkrRVTwWspAi+Fpzvmd0EZdlAGn8Af
         B5FCit4pqpkkxfUOvCSJvXS3jlpbrQ7yiC8Pc5PqbwJaB2Yjbca4Z4JjXF1U+VqqDWsZ
         /Ih4bCujV4nBXKCpZ8vweDNra+prPwdY/CY1HoXWgn9MCoCYLiyvc/3n5YDH7oAv7LzV
         69hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+aYABooH1OESbaFVdKpN9uc4H4yGymKyz0M2s5rGCSQ=;
        b=lH/B74j5l9Zf0aNQ/eEiRuuVO39+aTn65y/ju4H6ZCejxT6RoWt4VU9mSxuG2TATUQ
         ygsPPBy5Nl8xL98cwUDrg0xcptOdmZfeHn2O8WCUpnUaN021kKc8hWt8BFFHAE2HHE51
         0vXkRCP6KNQ6uue9ADSN0Ds97M2m0u0tTTSWQFn8Yzy9ciBQqX1PC8yCAaSbD5GmQgz6
         iOZ8R2jdtyU2iX2Axxkb+IelFKV7ynTbJLscNHqQywwWXKc6lxpd8mt9+gDDq87s8SpL
         EdE2bsXnbAvn7XawzsJCt8qvqxhDswGo7q3YfreHt5LK9aJXllZMpuRi7ZXxxLI3bwvX
         5bLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpRVPyNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si8933444ybn.72.2020.07.11.11.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jul 2020 11:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpRVPyNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juKJd-0003vz-8j
	for alex.bennee@linaro.org; Sat, 11 Jul 2020 14:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juKJU-0003vE-Jv
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 14:33:28 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juKJR-0008Bs-6f
 for qemu-arm@nongnu.org; Sat, 11 Jul 2020 14:33:27 -0400
Received: by mail-ot1-x343.google.com with SMTP id d4so6636220otk.2
 for <qemu-arm@nongnu.org>; Sat, 11 Jul 2020 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+aYABooH1OESbaFVdKpN9uc4H4yGymKyz0M2s5rGCSQ=;
 b=dpRVPyNi2j324OhciYBIvF09TmZgPkdr0anKtdgtCUpx1tmiuKPe4ZXwBnAiF86m3M
 RXBBENJ2NrLt3wQ5EIJoOuFVCy/Nl0A9OmLI6pDjnl/iLAQ3Eq1xy+5SV4TMEAR2FN6b
 VCjc1yQ39ZEH870XHMlwGS8aBmQ9p+4PJmXArtBu6hkmOFpa/KXQQTt/LLobtzqvFnug
 7UKErtBINJel63cOQ1bWgAWpHqkrn3L92KWEUlRhIAnuURlEmxMUKr9kNWyQDwh4phkw
 dJsPxGMLW1PhOPW6CjzFeNrtxyO8C7uzE6LKSKOS9AR2tSf0RV5zV+6x6wQATjnSQnfZ
 auwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+aYABooH1OESbaFVdKpN9uc4H4yGymKyz0M2s5rGCSQ=;
 b=CzIWiOl2ba6ResvGXPMTjoeDdBe25plwKjr1jfGD7F87X1wZLynlzAsnG5HxUJ3JlE
 AuV7v5aHQVYwDg6UdOy/yEcbB9a8HfN2tCRH8TASZoTf9u6gegRH6WI6Hyt9kwXDHqWT
 xAjkUKvikDv9NsIlbUR+lQYRrGHA/UqUst0FrqMytx+sDxg3xPaQtQ/ETzMCi5eN3Rna
 wfRYp2Il2xx1WEi30uUxZ6CErEB29wu7RBUJ3lut/pq4yVYvMA63Y0z4Xr/3TtOWjGbF
 0IpTcgolpQkb38gySwMzyix0mARMfJjpOrg6HhRaVfh5YxWtFfLe1ZWjpFcecvBpFODD
 Ax1Q==
X-Gm-Message-State: AOAM531mYn3QHf7dDTUfXifwqmAvU2+zoJA05WwnwQhwXRJE5fK4tya8
 fvC4wyMs8Rt+HBQI6GIQ9xFyfczDDXnLL2FmpvYjuFQd
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr56355260oto.135.1594492403004; 
 Sat, 11 Jul 2020 11:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200628214230.2592-1-peter.maydell@linaro.org>
In-Reply-To: <20200628214230.2592-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Jul 2020 19:33:12 +0100
Message-ID: <CAFEAcA_yJZ7TF=xq-q6kpdX965iOZOS6B9kh16EM9Z0zCkVXdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/palm.c: Fix Coverity issue CID 1421944
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gqdqODL6oAxL

On Sun, 28 Jun 2020 at 22:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> As for spitz and tosa, fix the Coverity issue CID 1421944 which
> points out that memory returned from qemu_allocate_irqs() is leaked
> by encapsulating the GPIO handling into a simple device.
> As with the other series, detabify the file first.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/arm/palm.c: Detabify
>   hw/arm/palm.c: Encapsulate misc GPIO handling in a device
>
>  hw/arm/palm.c | 111 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 77 insertions(+), 34 deletions(-)
>

ping for code review, anybody?

thanks
-- PMM
