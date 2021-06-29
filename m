Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4977600lfg;
        Tue, 29 Jun 2021 07:10:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7aO/ojtyO+G50BtYpyQ7LqvKOgAAx7feAkp4nTsT4fwHpWNoNt1XVpr2S2H8qrt4GZblO
X-Received: by 2002:ab0:2505:: with SMTP id j5mr863608uan.108.1624975800573;
        Tue, 29 Jun 2021 07:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624975800; cv=none;
        d=google.com; s=arc-20160816;
        b=wdnAvmbte6DIEn0rp06JwAFGFILfI3sNmZLgGkYRi3R6jHlMNlIPndZ2+NpB2UZgcd
         3nIm6MHeKxHRG+pcGcHPwxU5ncGfN/QRCJoyl57X7PhQAYpqv/hzWMEhsoCvmencWU4W
         1FOCcgfBcOYZIzGcfqIvV3h/q/70ctRmtl7kpcidbRuo17n+tTYUwvMr5RxVW7BbEb8d
         9XaLPsou6+meebTlahQXu0PF6uhtkVEhkBdLvWdjmrNvv3nwrgpClNzD00Bb+utVdp5I
         rKw7tvnxN9VdE4ZM0qwSycMfMFPZiPpMB0RsHKp+wVYKureQo8oNaGL5pNYnILx0GX6N
         eVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGyuzy7Out9WLuYPTBx/yGq85eVpLEIcHYrNKiLagD8=;
        b=Iz6AaoirMy96URL8VF/SkNUKFpHIOTuh6gZPh7k1QSnDvCczL0jdjpLTa6mF5y5eXf
         4dZmENeWMCpnl5pImAIWPZ5SbE3RdSbu5Hi7zQMvsBYTwQ3W6B0OQRHcKHFpmDCw0KPc
         fOWh4aD8RFiFtgJjKYdxZxt1I7+UKnsOhyQ0qxfJQtHiQ7WqKOWfIMgg2TP7lyosMebX
         T+nH3RAzsAfZAqg41RJ0JAqa3EcaESwxx7lls0wSDSzrkZoGFC9F2DPUmEkf8tZLNdwg
         e9G42m38H2T3coHokDItGalQmKiI1mpUUS/9hNgNMFvhXEa7caQRARtomUk9y0jjYTKh
         GRYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oCfpf2i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23si3104347vsp.359.2021.06.29.07.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oCfpf2i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyER5-0000Mi-8J
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEQq-0000HR-Vp
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:09:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEQp-0005XT-07
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:09:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id q14so31471226eds.5
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vGyuzy7Out9WLuYPTBx/yGq85eVpLEIcHYrNKiLagD8=;
 b=oCfpf2i+U+y6LH+tFCkApmc3gjSsIZHpCqX4Ep0Cm3mPdDC5woRMzm2wOec1HnoEQd
 1bc6Yz1RWJq4YvkgpgOVSHgEJ22B/Uc/BdMAgvapl0s2/J77Qh7j+0lLzVeQ05xJNJJb
 lMcmKQr5PalBwCLLgiqfXXskeN0zzfNGW6UnGw811s61FtKv+riev375eIQhd2eSq8HW
 /2I0wpdl1UQ3ZAsSMloUHfFBVJ+/MUVOb0269VR49tT5DdbB8lm078yftK1mAw4vwVt7
 4x2LHPuU2z/FZL0y232IahVcSW58kUXBq6tx+pC6W2nkTjGShpAjZpO2wEQ91lU4km41
 zEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGyuzy7Out9WLuYPTBx/yGq85eVpLEIcHYrNKiLagD8=;
 b=MPh3F2HG0K3P1yjUdIYr/XZuz0zIeXgOgCtzw0+i9rEhUdhNeY45Ch2Id2bL3DpSS7
 shP/r9732PihumaqUiCwYUwEeP7kL4gldzaDSXnB9IHAV+IOJwdgKvJxHVd1/+70Ug92
 yvvfIOYGtOoCV6jzHhYU8ADIDAk5Rp72E6MZWmIHbPc5JSxr0KkOOEaobGU23g6zsab7
 dRrGkY33dOv9dtavVmGIl06ixYntKkKDSGdrqjPGuiTDJuiMOCx7vymGG7r5Jb/fkls9
 rIzMo8AMpzCvorPWM9wShlzELbervg53LiHTmQ09bX+S4zWqhHvd4szeVeuumZf7mmug
 iMjQ==
X-Gm-Message-State: AOAM532VL6p9jCD8d1rsNwdmlBONEAT4R+DwE39ra34ZrNqP8uMBQ1mW
 MViYAeeF/sHpcct1bwxY/D01EPLZO2ej7mVRRfLYtg==
X-Received: by 2002:aa7:c644:: with SMTP id z4mr40054441edr.204.1624975781045; 
 Tue, 29 Jun 2021 07:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-6-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:09:04 +0100
Message-ID: <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] linux-user/arm: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yJWA1fThbuDA

On Fri, 18 Jun 2021 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> ARM is more complicated than the others, in that we also
> have trampolines for using SA_RESTORER with FDPIC, and
> we need to create trampolines for both ARM and Thumb modes.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/target_signal.h |   2 +
>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 72 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I'm not 100% confident I checked all the details. Do you have
test programs that checked all the different trampolines ?

thanks
-- PMM
