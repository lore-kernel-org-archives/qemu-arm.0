Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp962189lfb;
        Fri, 22 Jan 2021 07:47:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcOWtSdRoiHGC2pLfNhDXoRAmpTQ/QOmXqXomLehiyNZBJzFoGswZhN4lK1PMYDsWk0yGq
X-Received: by 2002:a25:b328:: with SMTP id l40mr6744449ybj.15.1611330445608;
        Fri, 22 Jan 2021 07:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611330445; cv=none;
        d=google.com; s=arc-20160816;
        b=BKGvPP9dMXGYrHzSmJBNwQ+rEMSqWgRcD6DPj0zrcPJ28s+7B0xFYDqpldGe0KuTn8
         LQwTWDhhpqqiT238vPORJ38W00VI1n8c37lP67Ufo9Yml0QIiMUYfnNQp1k5kT5tPmbh
         Zs7+wT5C4s7wXVtDQjMBwnLIvJPkNdaL1b4bAOobDom7i/j53LNLXo6jN6rfGJMFte8z
         Yev67enFmG8lhbnqJobtRX6avg8qH89N6E/vP5Thi2Q7RXoee1pqeJ7BeEmNAkSccOJJ
         5/gzoyweyaVg3c5P9E+C3FGPD1qRvsQWK0YacuulPN4wd2QJF4370nI/l4ucmyffGk8H
         osfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFF3oHAnCreyQ8d6nvTVlFjwwJGcXT7kbU6Xy7q2N1k=;
        b=T3+jBKE3Re3MaKjiOpWX9C0AzsCfsmokjHzfTfEcrZ5CJpbNe1DJjsWM6oEE2kSHti
         hGkwzJdx1BGt3NgHnynutw7LfAMe6s7BZM4Ei4oHAVvHUn/bvfjutbE5021f2/xb8lMD
         VG5DR1iDm4zNRsUSa3Mhw4E9vzApTWcW8mQji5V8M/TRGR+n8aWEl/iQVGb5pkG7AaHd
         eYr0Mo/2FqQh9xfXv2+TD3hQk6fUnrR8EQvy5VmzH/zCkk1lxe7FcmMzhZITXL6SqFSU
         QfTltFoM8lFA71mgEKIdyS185B1TS+ykMTSs3uYB/r6Zbt8d0iMcAnBBZFbO6hEGrsTB
         s/2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iaD/PIeR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v201si9258191ybe.88.2021.01.22.07.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 07:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="iaD/PIeR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2yei-0002p0-Vn
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 10:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yeZ-0002o8-PN
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 10:47:15 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yeY-0008RX-1B
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 10:47:15 -0500
Received: by mail-ed1-x535.google.com with SMTP id c6so7101319ede.0
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFF3oHAnCreyQ8d6nvTVlFjwwJGcXT7kbU6Xy7q2N1k=;
 b=iaD/PIeRx0mjTev0L7q1j1sq+0t364ARSWpjD3UcNe+3PyJ4xd+ANFfZOS/mvC8IlQ
 nbzx8doo/Lumt3SFf6OWogoBs1jL5htnGLoPZlzLNMDoXbrmh9l6qK/bOS6B/o+NIL8s
 AUMq7VabtL7faSReIJo7s+w77ofb3K+o0s3cLvqanDR5MyigEoxCvBfV7KkqpDoXoOmv
 ZHpI3sX0c+pI6Z7ygGhecpwsLeh+uQTmMKwD0+THgXs6U5WFOf7sOtGAPLx1GWY0ytLD
 fYDb0XMvzGKCo92C4RnvKhFld8lE3wykropoNHfV5JTH0HH1AvRiscvsbg4gwR1787Ej
 IXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFF3oHAnCreyQ8d6nvTVlFjwwJGcXT7kbU6Xy7q2N1k=;
 b=BWwq4UvQLu++yWn9DPCKltrTIbHBBe4uFoSozaUSCQDUm//q5Wm0dB1xeiMULiazu6
 dDh/zEQ9mEAJiIxp7QYVHrpku1Vaulzi7dJtsdbKALkPlg9YoJwpeclDilk0FeopS18w
 byXn075h0kiHVXvycnC3SVk5c5n5o9vpnt6H6tAg3PmF2Eb/Bk1QRsfQNrLxKe+9kNUX
 9fMx9v+zeZMEK310zYy/E+xIyw1/iL8YhxHretW7jJ1aVDR4bzPe59o9j32YgSt8vdTZ
 75amrYQNKhtd/ROKyF3c4JgzyhjQKAuCsg1pT5ilBApDOYH5cnORPZCiy2hcNr0Oa1+g
 4eUw==
X-Gm-Message-State: AOAM531mVGEkb4nV/ue0PDAFbcxMJctIpSvBFnFK6YGg/ueGLIdyKyGJ
 5VY6phDAruUjowBo5fOBMNrQ3FlFuYMf4u1xQNnWVQ==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr3582488edv.100.1611330432289; 
 Fri, 22 Jan 2021 07:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
In-Reply-To: <20210120092748.14789-4-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:47:01 +0000
Message-ID: <CAFEAcA8gGHP0eFmkxu=rV6RqR=g65uPQvZf7utWLTGLp-V8A7A@mail.gmail.com>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxsjsO39lM9l

On Wed, 20 Jan 2021 at 09:27, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>

A nit, which I raise only because you'll need a respin anyway:


> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));

> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");

We have three different names for the same thing here: 'reboot',
'reset' and 'restart'. If we name the GPIO line SECURE_GPIO_RESET
we can at least get that down to two.

thanks
-- PMM
