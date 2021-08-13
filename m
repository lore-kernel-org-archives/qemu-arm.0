Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp297356lfk;
        Fri, 13 Aug 2021 09:32:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmVo8X8RLH3GzwrQQU0t5/sK8IrWQc6RaxELsgasofvc02bIVb5VCiQxSR0mtmmIEFTL++
X-Received: by 2002:ab0:3314:: with SMTP id r20mr2639986uao.89.1628872359846;
        Fri, 13 Aug 2021 09:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628872359; cv=none;
        d=google.com; s=arc-20160816;
        b=WF09v43vZGbKzWLqaC6NIEGja1QaGxVPUaXlPRAQcppuRjCK1RFHGK5c2X1e+lMXV0
         MTiWuPrs7cZlzWjphkHInosvu5D0ziIKXvyJcrPOogI7MOfh8V/u8bhwJcFII4x02jyk
         ajugdoegRtXGEp93RjR3DkjyshA3bHRvgZRCpgAYpM1PhIG7WL7IvP/pUqzG8BtItqZf
         oU3ndTflt12BJylxkPBKzEam4cLAnRACj1QGHYiMXIUsUAeko97d4ozAgkQe9E53n1vK
         8CzuF2MZfS6PEz8At5nnr8arnEc//bzPeTcE+4M1uTO+BxZzC6dsXC0Cc5gVirYRQI62
         A4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAOzEvgxu71w7bvf0wXMlSQ8ipIFzgsGY7BgMhR+FJI=;
        b=xQaHFZ6Lp+NZvqsOFRmMVdCUeZ/LoJ9LrKosyHaXjMTPnYXl2X+OoDtlQZ8Y2bBKQH
         nOfpDETrA2Bc0dIoN2pg5x3YRT0+TOJciI3+TvSevr0SaAPo+Z/HbWaP6NLfxAK32Hqh
         U0qMYYGDlUrXuMAH84/Er/fGG6ApDSHUe+u3rVBBhFGOQteaARTUyvnghEiu55QKzE/s
         Q95ia2fjd9cTun99f1bJ+0PxwdC4S4gtEj+GCLMg0JirXovmYzaAqzb8AeSVwgR+ajox
         3fShRBsQyDdi6ItNHQ7hnMJURXNAxLvCSwPe57rS62fH8peHuoouXQMFGyqfz270Y5Ys
         VDCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KpRiK2Ql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ba16si758416vkb.75.2021.08.13.09.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 09:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KpRiK2Ql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEa6p-000265-9R
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 12:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa6d-00025p-Hy
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:32:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa6c-0004K0-4b
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 12:32:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id z20so19330454ejf.5
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAOzEvgxu71w7bvf0wXMlSQ8ipIFzgsGY7BgMhR+FJI=;
 b=KpRiK2QlK3bKv9Ejwo63nN5E9EbS0AxpNgQPj57Nazkc24RsPmckTdJUwaL/vnPjtL
 A7qaAbtlvE/qr9jBn1F3eXlmAbTYHnG2DnKMWf2N0YiV1jj0AO5Iu8R6uNzPqSgr4V4Q
 TzidoJ15QS8pimD9nzhDzynxTsCOMVRTQZfTUER58cosOw4zu3D4RGA7uCBGkVtPWDJy
 yGo06jJ2qArRwQLEG5NM0YST30Tx4UQ+IwC6uQoLHpOsqfIJ/yhuaTteFb2DMsvunsft
 u+mGvzksiv2m9Z5kNIYZueqeI2OVFEMJ8Qe7nyJ2e/fzMsD15qA0ct9h1wV41MsDj/W8
 GVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAOzEvgxu71w7bvf0wXMlSQ8ipIFzgsGY7BgMhR+FJI=;
 b=kaHDHbm8KTf0DFuHcxfblGhfazo0WqbrusQFgkDgtH+XMVO1zQ2CQhVUBkvs0AwLyG
 d0rSF0/H80f4JWLY3x2PnJE2tN2nwYcvpfr1CFOjHWXmru1VIcDpc+5150ldH742769i
 bgnjb6Y9la1UvV05vIsKxolItSyvUwEUmGDmwTQ9B2BLjOcxVnKxIYJYLmyHcYSGSIwB
 0X7ZIIET7djgfbq8SR1jAeDLHgjXfI6+90G+Ulkp37llKvG01TNqTapDwJ2fXmKLTg4w
 GK4ePMt6SzAWbBSSYtcPbv4u7SGUxRNZoTzf+XX5KGjtQXf3AuzOkyglXHdsP1WcypK3
 0rig==
X-Gm-Message-State: AOAM531puYJlY6M7yKX4wrY94bhWgY9w0cqHuqilN3XliP7xuADCXsw6
 EqpzCXU9zsLk/l0NH1DGOs+FJK3QnTdYfEt1Z0JhSg==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr3311531ejf.482.1628872344432; 
 Fri, 13 Aug 2021 09:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210810160318.87376-1-linux@roeck-us.net>
In-Reply-To: <20210810160318.87376-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:31:39 +0100
Message-ID: <CAFEAcA82g0w37F9tK7HY8Xq=aLzWkqXErZDk7mu1bSmVncv3Sw@mail.gmail.com>
Subject: Re: [PATCH v2] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as
 unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NMesaep3vNZN

On Tue, 10 Aug 2021 at 17:03, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
> Linux kernel crashes, such as



Applied to target-arm.next for 6.2 with the ^Ms cleaned up, thanks.

-- PMM
