Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3253040lft;
        Mon, 4 Jul 2022 07:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4QA2wQQ+INIxCjVWdD+hn66jH182l4BtKPtsmNvNnISU1UhQajox8g0WXauEs7zCgyeTl
X-Received: by 2002:ac8:7f06:0:b0:31d:3c08:222e with SMTP id f6-20020ac87f06000000b0031d3c08222emr12214704qtk.364.1656943551701;
        Mon, 04 Jul 2022 07:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943551; cv=none;
        d=google.com; s=arc-20160816;
        b=S6iazWjkNn8s2jpJgIIaconcBcAh4izEQ6vYjRs1V8mtd8WXrho0VgSpGGfkfMhE4D
         lRsVLjH91ATQjkEZY69fBHpakNp5zUK2DMU5n2vrDAkulWxbNL27LsKnyGzHDY3VF1sN
         O5rfCNMoNp4U+yvDhZ1ORvgmxwUL2E+zQ279Za9XtfGRlvcWFUd1N4Q5E91OeLM6zCDs
         StNp8sPQ+t4Yk43EZk1R8pZVdpvaVKcFZ66tlchvnWZ8YyYQB9xtBTcWMuwrzGJiM2ql
         T3asNDSPm1tHNLmocm3XXKQtu/4WxZ9LN36fioO02//ss9NILx5y0NYROzSWB4bdgbmY
         cfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2ezvAVUKuzndz/NZBA2mYifg8TZWvsk30mzolA5tuAc=;
        b=RdighweRkGV15XEvwiXHaKhEPL11xqgv1o7gAID66SZ0cODlaUD8g3fijWPK5Qvt/W
         uQc+4O7zIcLl68SNxhEs7ZPVQ9kR6UkN3IaKfcKCmup3CVCi4WULKR/1LdJ2t8dOk0z9
         NHUPmjJlNu59ZMZMfUlHyMgcUDzO6IcWNbJzOpB1NB3yJl4Hmzeohiw7tvxzwlbm7z2A
         qnFkPN8Biq5QptRQpoWahPC6WeI8eJxbrHoCYmKhK8nGk0ugT9L34RrEsxnk9Jbtkftf
         Uf9gClUbFItl8rR3rBv7BzTc/crN7g2Pwd+ZFsjA+yaQY4ylV5sfJfEka91SsWsKPUb+
         5iig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTMWRIF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a67f64e000000b0034af06ecbe1si7596511vso.620.2022.07.04.07.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTMWRIF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mhz-0000Tm-6O
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6q-0005CR-4J
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:27:28 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6c-0003oQ-Lu
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:27:27 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31c8a1e9e33so29906287b3.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ezvAVUKuzndz/NZBA2mYifg8TZWvsk30mzolA5tuAc=;
 b=PTMWRIF5zHZxyWp9GFOC9Twzi7tRrC4lP4ZWPuEsXe4662+ldgzWWThpFHp02ahzMe
 q+w+lT2P/vAAZwzdTZk17NqnEnIIK2X4XRnNNjhyzZqPLJyCacxbp92aemJpx5RHK8XT
 NKv0yExDGgpHn6G2vC/Hqo9dMghFMONpZjErptfFDG+Jnmjzu2RDj9FE4CRnNfWwYzmb
 NzN0Ivpr2DFvpXv89swTsTruNBcvCj+VO0t0P9zmINm2h3OByeUwFgUXtRU7c7E5ouwQ
 5z5B78i0HtRL0Z5//P20qUPJMl7eh80S7vi27rBGqGir/uWbyDXhr6UkzPWeZAkj05wU
 MdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ezvAVUKuzndz/NZBA2mYifg8TZWvsk30mzolA5tuAc=;
 b=eaUxm1W9By5FU6zEwKDaM6zI1Gr0DRzsqULw0Jxk1dzOqkwp+2fPFZlS3chkz19e6Q
 hLGuAmDGyaX6TWEgMFwXpJNfGaAdkt2x9Q87jgiwH1mPSPNeAQEnSlYbD+b5buEQ1Zu9
 BETshn5QNXOjyJIjTil9Vs3onODP21KWQFJjXHJqoFKf+zuVHYBi5frpCTiodSjbQ5Ko
 +SGPUCx5Pbhk961Ysrq3S1jFUy5PYzqbx5eYaPkUmrDwYaEOJQIoBPkPHtB/sKnQbfvk
 RaRjwqqUSM2cVx1PiinZf1XZ1foaXeVTR78CExXzU4TX/aqDJeH9VxAOfXyemynZoiRo
 xODQ==
X-Gm-Message-State: AJIora8AGUAXJW/lGFqEvHTZsqztagAAdBXeisW0jUgFrRfPPxH/rOmP
 hdgbkxpVCq+EBeY3lhtEK4v7EmeWoUO6seQK4/r5gQ==
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10026953ywe.455.1656941233745; Mon, 04
 Jul 2022 06:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:27:03 +0100
Message-ID: <CAFEAcA9SMa7dp3sEa2O=6LYR8UCc-EquviJmHoypuCDzqTgLQQ@mail.gmail.com>
Subject: Re: [PATCH 26/40] lasips2: add named input gpio to port for
 downstream PS2 device IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9Y15wrEwREYJ

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The named input gpio is to be connected to the IRQ output of the downstream
> PS2 device and used to drive the port IRQ. Initialise the named input gpio
> in lasips2_port_init() and add new lasips2_port_class_init() and
> lasips2_port_realize() functions to connect the PS2 device output gpio to
> the new named input gpio.
>
> Note that the reference to lasips2_port_realize() is stored in
> LASIPS2PortDeviceClass but not yet used.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
