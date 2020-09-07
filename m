Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3845216lfc;
        Mon, 7 Sep 2020 08:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp3uGhaq3EUlXvaa0n9QZPIKinuzov/YA1+6UJa8p+79ZIA4Z0CiWod3itBQXedwT8rZmJ
X-Received: by 2002:a5b:8c8:: with SMTP id w8mr7140253ybq.199.1599493157459;
        Mon, 07 Sep 2020 08:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599493157; cv=none;
        d=google.com; s=arc-20160816;
        b=z9UI5o/K1lW8xnWDJibqSFHz6+qbpej+xB8HpdTBlOyqZtI4z+zg5/9ZXtg17ZkBKZ
         TKNPatckwXGjXX5hinwXWbHpWvOJjAU2TiPFinErECjFWK9QveAnLKjO5qPSXVJ0CqRt
         RFFsKISeB7PO7W2r5ukwjn/beMY7jSPnoG1tYyJeKTEXpkvIATVrqfPf2+5wYIM8xkoG
         plKPoWu4s4p1OnH7k4+lQLD6UFN/xiR2NgEeOBuKTlFAt1zbofJwOThqj6ZQ8lZdDI+l
         6KmmKqkwBSbgAXkwEENvBTeobKIU6IkbM9udDrXjBk9ddRFkL4Xi/1RNKqcZ5TcvuTAr
         hfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eAN3ObEnWEdYjt9dFqcKaQcQZEkSxhKOf9zRZcbkey0=;
        b=ddDLazeGkd3Lns6d9yCb1t+2aZtyXi63I3kFEotQ+YMzn3HNG9R0sv2PmoJWE2VXKU
         Dh6BbA5baYgoNV5KWhXqRGLyV2F1991oMkio25ppKl3JRH9K3OH5gtGoYpVA40YQOhYg
         wHvpESiQP7urCyijfbCP81Xg9fy+3dUdYU4clHdb/4UujHstrSr5X6VFVLisiU13wXQK
         L3K6WXcLHvzAiukj9CVNpMCNUCKdhp4BzqCuHuhbtKgtosMVuhSmZEeRSrF0rUb6t9y4
         llMx3N6qr7kpPeYEwr6UfTb/NxHOkch1+u0r9OkCx4p/SkP5P8BVdd1d7JGVumslOeBS
         b2/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GN+JZc9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si1995887ybb.11.2020.09.07.08.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 08:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GN+JZc9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFJEi-00045W-Rz
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 11:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFJEa-00042y-9z
 for qemu-arm@nongnu.org; Mon, 07 Sep 2020 11:39:08 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFJEY-0000an-NH
 for qemu-arm@nongnu.org; Mon, 07 Sep 2020 11:39:07 -0400
Received: by mail-ej1-x643.google.com with SMTP id j11so18808005ejk.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2020 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eAN3ObEnWEdYjt9dFqcKaQcQZEkSxhKOf9zRZcbkey0=;
 b=GN+JZc9OIarba65gOW/FbgrDU9TYkedgBl8/866CordL/wG1YJ7WlKo/LS344gNwHv
 b+A3+sWeJAzgZggVaHYOPNVUTvSnrlOx2XSheBH8qnH5VA5pIllfjQPjLgGm87kvY/Mb
 HMBXDU4Cv/ANtJa7rBRmHH7AFKNaPSe1mJXQ1JTFf6CNMZ7lVHTzlX5GCvfmT3csHOzC
 WBGmOESW2/luRrWQ6OQDp6IgNlgLmUHuFWa2qE8nbcT4HPqppoRmbspFlJCsvSMVtF/c
 hh/hu1OLkukJ1tw1H+RMA0QtsKe/AKh9TZBUerKcKAtnKh+OpXceDoQLzTIwsiRM10mS
 SgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eAN3ObEnWEdYjt9dFqcKaQcQZEkSxhKOf9zRZcbkey0=;
 b=VgCKNdBn4zohWXBVdALkd0Zobaxzp29EyhLb6W5WIcfR2rmPn9KbsYjCSnn83V9c6M
 UBW3huK/BFbh5sWQIHGS86rxGDMmcya8lMuf//CqqM4b/DA49gnwdt0DCRTybNTMRh+C
 ykNeSFXVxkX5W+brgjfmc5WsxAO2Ax3lvZMh5L6SIkDCVeyIJISEXJPEZtezvCnUkkP4
 8jtuwhhYuZhgyUCGa574mUWwfNFggsU27G5qMxCi6dw+XDgxUAKR31Lr7weF3Stz/EQd
 vcUDrx5VlDeCoScpvphNNi02Rq53pZISxkYQWV7X6BEUe9Rm01baD6QSDKCg5oX8oOwF
 EpWg==
X-Gm-Message-State: AOAM530W6U7sW3jr9Wvv7g0CYjiqO/GWui2FGEw+WR4Eb4btCmjVPnw4
 cj3Z1//xOb+b6uIiXSnuyhlPwwfcyS0tCscUbHLBKw==
X-Received: by 2002:a17:906:24d6:: with SMTP id
 f22mr20986257ejb.85.1599493144720; 
 Mon, 07 Sep 2020 08:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200901144100.116742-1-f4bug@amsat.org>
In-Reply-To: <20200901144100.116742-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 16:38:53 +0100
Message-ID: <CAFEAcA9wZk4Nm+Eomsv8ATkh_MKJhzpJTmpi1+=wpJiHN6Jx_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/misc/a9scu: Verify CPU count is valid and simplify
 a bit
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6so9K9SEkeC+

On Tue, 1 Sep 2020 at 15:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Trivial patches:
> - verify the A9 CPU count is in range,
> - simplify using MemoryRegionOps valid/impl,
> - log unimplemented registers.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/misc/a9scu: Do not allow invalid CPU count
>   hw/misc/a9scu: Simplify setting MemoryRegionOps::valid fields
>   hw/misc/a9scu: Simplify setting MemoryRegionOps::impl fields
>   hw/misc/a9scu: Report unimplemented accesses with qemu_log_mask(UNIMP)
>
>  hw/misc/a9scu.c | 59 +++++++++++++++++++++++--------------------------
>  1 file changed, 28 insertions(+), 31 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
