Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3242757lft;
        Mon, 4 Jul 2022 06:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzqJ5BgCe5v78wncUEyN4eJ//Z52achsLg1S3iPjglz0HUg9rebiWJPPL40y7i7d6NI4uF
X-Received: by 2002:a05:6214:1c8c:b0:46e:15b2:3f35 with SMTP id ib12-20020a0562141c8c00b0046e15b23f35mr29160233qvb.76.1656942615477;
        Mon, 04 Jul 2022 06:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942615; cv=none;
        d=google.com; s=arc-20160816;
        b=ztAP7YyRMWbcvE6xa+JjcdGIJlIsZlD6BpxEfNYhYODaQoixlzVV1tZ8go1K/2f/fD
         pAwN998AqffUwgy77ypg83raYxDblDccm6gNSzvaw8MtJcRJXREA6M2qQDD+0qvCYWh9
         dp+1bLLmJDqJ9Y0Z8iMvyEH8BrrBBU6Q9CKpvmQNm011vXmHKkxIBD3JlVSRL8K5h4wh
         kOHal2hjC2RVvDhq+uc2NCV/Nx4IY4bntioIyXa7SxbnRNJAOcFvGS/kARa7QZY2qCQZ
         xrh5dGreQDxOLjpouQtjGbg57KZVk43n5hlat999dxMB5djae2Neik32jA8BS9DHiqAU
         Ufbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CobRFxQV+OgOPr6ejbawRauIsdUfI6eu1GMk5h9WZ4Y=;
        b=lOFSqMRaHtyhyTeGLwZtWrbmHM6m0NLHZrs3zj/JstjCTaMu+6b2xN+1pV1ZYYvjN4
         8M27whkRDDn6jGt1a6O+vTGSnh7/yXP29aKJbv8nOovfOpa4zGd7KJOq0dlwstWKz4cm
         TsCNgGkpWKHfliASfVq9eB6xWF/IBAszH2nwMc0mLyrIIxUvfKudblWhHiRprjKnEQ8i
         isy0eyjWefNk8eDq3X4Px6A1GEHvOXKiwGA2zYvPgtWi/HxA+UnKJ268mc0LQuWT8kgT
         PuxtP7FJoJt83bf/0b3tJtPiR++72kjKg/kWwYB1+NpxzNIRvB08+8enbBParod56rEb
         aOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BWlXKfh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a0562140c8500b00470d4f31441si13325705qvr.355.2022.07.04.06.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BWlXKfh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MSs-0001HY-T5
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5z-000404-6s
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:26:35 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:34611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5x-0003ga-Mh
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:26:34 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31c86fe1dddso34612367b3.1
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CobRFxQV+OgOPr6ejbawRauIsdUfI6eu1GMk5h9WZ4Y=;
 b=BWlXKfh/9Xr5bGLSV5kkbC3HCMNRnxTT2bfUHkctsPlFP1E3mz9ga75ISLf0XFpyvG
 oDu95UnmNX1QlYUfmKBDQ1bjmftAvUmK0k0apXuRHf4MRR2Jg0Cln3FKxBaBGllnM7rw
 WmPrIlmScfZuiFGEn05lRp27B9ayD+HCMgeHGXEI7lSui1t0U3xsS8csZHmnwhEeJORC
 Pw+2WLQOZ+xyrYPrb5fV1pjwfbWwXKo6bZT12MlS6mUnTl2wCRxL8hCNR+QXx9iF77/o
 xAnqpP2YpaurlTeGbaku3zBJGi5MnDJ5pN2ZozVvME8gyHaMOWCxi4ZH9x8VAjDdkQdM
 wqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CobRFxQV+OgOPr6ejbawRauIsdUfI6eu1GMk5h9WZ4Y=;
 b=06j6RvIZ8ABZyyyTuOblkHQfpcYZLvsnYQaPgZ5S6xbfo3Vvu+Q3Vh1IX9nukW8GsQ
 AhVclcCCGCZfM09y3ua3uBCOac+pYCvtjHi/d49iI4WTmUzpImbqT1veoH7c5jAyVXbp
 KrbgLQx5foGvP5+kPevQlQotKrMtLHNNOd1NUU/Rh//lGDbZHzza2K43csV8s9TVLarZ
 Y7O42GObm9B6ytMgPHp0G9toWza8/J6hHOWjlqqOsr4VrGN+5rMRSaa6AoG3A3nlHJyj
 KVwkus/wyRklg1ruL3HHyjxPc7bn1pP18h6II/DvW4pwz4Su4e7VP4NatmVlJSdQlRbn
 e4Ag==
X-Gm-Message-State: AJIora+kQRPetvpSXuudioc6GMaYGw7cM1hWJhk4l8upmV+m16IEF0IH
 9jM0PPA3sA1PA+b2WnnkCAXAmfeibTKI4z7jxcdysQ==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32435106ywg.329.1656941191608; Mon, 04
 Jul 2022 06:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-25-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-25-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:26:20 +0100
Message-ID: <CAFEAcA_QX06P4YEEnMCBFPodgh5+iZJhOATt5muksMNZDxanTA@mail.gmail.com>
Subject: Re: [PATCH 24/40] lasips2: introduce port IRQ and new
 lasips2_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Y3X4/JyB5jvX

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new lasips2_port_init() QOM init function for the LASIPS2_PORT type
> and use it to initialise a new gpio for use as a port IRQ. Add a new qemu_irq
> representing the gpio as a new irq field within LASIPS2Port.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
