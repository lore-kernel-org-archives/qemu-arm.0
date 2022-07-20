Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2494797lfp;
        Wed, 20 Jul 2022 02:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukH/HZ/tJ+eLQjRWaTmVywM6w+ll+4kFUC148b6anpb15PA3h5zpTchp13FgKgRYj8OTY5
X-Received: by 2002:ac8:7d02:0:b0:31d:3248:ad61 with SMTP id g2-20020ac87d02000000b0031d3248ad61mr28618413qtb.246.1658309527715;
        Wed, 20 Jul 2022 02:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658309527; cv=none;
        d=google.com; s=arc-20160816;
        b=gKVPJJ013HysbGC6+GyWNZwgulaEf7s+lw8b0RkNxTCS2Cp4RIQIiWsjVM9tN7cNes
         EXGZnBNrb2WMDO3oYhDp1850u2gYLcQJvLhrFu1srW5Q5BzdfyO28QMq7p20pVJCxZtQ
         5o6oy/5YU0tqa8bFkLrfHXVuj5PtElc7b1CDpdEBiY4b+uU2sUjuS50gr5A7WtmGEpy0
         sP5Zfg0RpqqEtj7rqIoHDJMJuQVSwSY7qfLUhKLneUyquh79ssX2FQZgoQ+usGLFYJoX
         JhGU+kEWXd29zcsEBCD4/ofytd12VmvnV4ExBWQHY5kUqw5GPIrT3FOlfySHPaUGT4F8
         kuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mntNSLRi2OnybX4B2MgKEAFVQ/EZ1/UoFH7P+c8HX0w=;
        b=VmZxQzAnGPhdaHbkX4SQg26oNNajbG/6prHu6PU8T+QAoclQXVEVFONwVZmOWkIJWj
         bl79K2Gqeje33r6RAJA5jyRsRszH6WQPURZvGP9rasroxiZNS8ODzgrnZOElUH+FyGS2
         h+14GQAr5OT2EDem5wVJ3ibdBMQYHiilzUK8RRqBNCD5y6Zami7q+B/h+js0P7qZKS0v
         Sl259AIcEUk9A7hd9pMbO26+96oZNJaWrxSGIxgXslIQyge5BhSG4QmzoKM8SyO/ze98
         GjTMfEiKLXd+yJDOMZau0jZg5qIcj+kVOkFSn1EyM11aSibIp0HcoUeMQJo9ZKErSZ4B
         MJWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nibctnzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw4-20020a0562140f0400b0047362947e64si8257433qvb.37.2022.07.20.02.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 02:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nibctnzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oE63r-00028C-6o
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 05:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE62M-0000tX-JQ
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 05:30:34 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:41590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE62G-0006Cx-Oi
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 05:30:34 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31e1ecea074so90968137b3.8
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mntNSLRi2OnybX4B2MgKEAFVQ/EZ1/UoFH7P+c8HX0w=;
 b=nibctnzp/JyMwnk1QBQa++nwziYlV4ckcGHO7rojs+9oMgsSfezVPFWNTX8FHMvMY0
 Y8tEnO/Npc/HbgQrVrnm2AAK1FCfaWP44A1hUohWG/sy/wv2A5YF/CE1nrI38a+2TudJ
 wPqXp6wTgxfGav0KT6huSTaGpCM/PMFmha8Hzd4wO5ZD4XqzOhcC+dmMb6gRww9nOfiX
 0kmh9cfvAyP40XPP+LbUQGGLcxLqjr+qN4lQ5pQEw1xtpnxzS6mgCVf0q29UL9kpSROZ
 o0aQHIZZaGjE6vZdPlbbPIXXmK8TDnoM47ZTBQjmtdMUC7Fr/CCYtH8ZWLyJZZi4G0ZM
 wBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mntNSLRi2OnybX4B2MgKEAFVQ/EZ1/UoFH7P+c8HX0w=;
 b=6IDfnEYu6xEfE/4pT8sEGVKsh+Tpy2P2uLBMx6nTIQERTzL3Y+AOddGSAhIXpZ/C3z
 qLFgdw5/m9bOBkmqDHtZmpiJNzuG0jtgXKkCdkO0mK0pNC1KPlUgBOC7gC7z7tWevi4D
 D+RMK+5JmA0oK5DCgjpFFKSyAUModBuJRLNaksQ8mlRziPqLw/j2g9+w6mtWjj80bfy9
 4/6zvgwLa2fwIb2gzx/Eck7hfz1EcX3oNV/zp/xqV7OU/fq3QVfiF3G4i/yJJ8VJmX5M
 9b7LnSedq5uhI0JOyHDPocVM3inFYJfHW+Uy9ylFZrG9qtDLmEK9GMNhzQeBoE6YzAW4
 dkAg==
X-Gm-Message-State: AJIora9NReKhPGaMnxl9LM7r21AT2j91Tg38wFJTygrFFKVmebxXm8jn
 aYiBBUcKZfVEeOLvZQgOWrt3/8mpyCIC2M4cK+9YXuIxfs0=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr41023314ywe.455.1658309427427; Wed, 20
 Jul 2022 02:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
In-Reply-To: <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 10:30:16 +0100
Message-ID: <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10GXBXJmotCK

On Tue, 19 Jul 2022 at 23:09, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello Peter,
>
> I compiled the latest Qemu version with standard options. I did it for the dynamic qemu-arm option.
> Anyway, I get the same result.
> If you do not provide the -L option to qemu-arm, where are the arm-libs which it does need to run?
> i.e. qemu-arm: Could not open '/lib/ld-linux-armhf.so.3': No such file or directory

I build the guest binary with -static, so it does not need any
arm libraries: the executable is completely self-contained.

> Which ld and libc version are you using for building and running the app?

This is Ubuntu 20.04, with Ubuntu's cross-arch arm-linux-gnueabihf
libraries used for the link. So the libc is
libc6-armhf-cross                             2.31-0ubuntu9.9cross1

> Would it be possible that you provide me these libs and the app you created? Then, I could try to reproduce this good behavior on my side and discard possible issues in my environment.

The compiled binary is at
https://people.linaro.org/~peter.maydell/timertest

-- PMM
