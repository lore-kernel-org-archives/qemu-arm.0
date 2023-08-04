Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1712556ejb;
        Fri, 4 Aug 2023 05:31:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuZf4eIcsqjgIGQwdUPkQQ3f4n23u8VTvedN3Wr2DA3EUAC/nRbsO9NPfVQ/CA5lrXjIiZ
X-Received: by 2002:a05:620a:2993:b0:767:e714:e9f0 with SMTP id r19-20020a05620a299300b00767e714e9f0mr2222229qkp.64.1691152278479;
        Fri, 04 Aug 2023 05:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691152278; cv=none;
        d=google.com; s=arc-20160816;
        b=ox259NUA6Sll5p796d43/jT2OywhXk0e8dtBiNrNW0kqmNcN43NpmnIa3Gitl88BX3
         q6D1tGjJdtXkyvtvrQkrLRCNCp/f+7ZWOwaCAn7An7D9L65n0SNPob2mPW/932r0LvbE
         OPuLgMZZkKS4KW9bGTwE40gzVqJ4d51JB7VxHj/mTpKp7d/wvOl0kEX8wrP9sXMQweTB
         ujL6vH0aT89SWuwfka4p4y+dfAm19zWlk6uuG6FzjTszO5017JhSFMJtvJ73GNkaVYUK
         kBkqKzk4W7ZpsnJ/f0GT25zrW8aRraTNuapt7h45w0mhG5ACL3nSm9Hp7uje3U6SbJYq
         XBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=e7e//X0qElnMjAaBtivMTTkIxlU6UVNq5a0mOLXxlNI=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=0qrHlSKEt8nLy0IfGWoeSjbW3KvWv/Tnq1GrmtI47zY7xNdvMQdc51+H1KfoYhG1i/
         4YPTy2OspIu5PKfrhGqLowr5gAva/ttBV6oartaZ8HuryB2tP+M8j7XiFZQZDtVT4hjg
         UQGpy/yMt+Joc8sO1mlsQsxrNkYHHELYv5OMbkNYVlbeb1s1DgBnOCY1sQ+9W9F+YiXT
         WeUVzlyPdfItuCGQGCpQuwfVsbQfR/NAuFtbhMT8xoU0GGOC7T1cnVF1HCC10HzaD9vf
         Prq4Vuo1HkGEJAob4MrhD1MKdLAzsznVG4t3ph/GbnDkTAh+4swf8WQHvkPbsWvBdPLH
         yC1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmsilKL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a284400b007671a6a0bb2si1129640qkp.601.2023.08.04.05.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 05:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmsilKL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRtxT-0003Kf-Oc; Fri, 04 Aug 2023 08:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRtxC-0002QV-IH
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:30:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRtxA-0001Hb-Rn
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:30:50 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5223fbd54c6so2682763a12.3
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691152247; x=1691757047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e7e//X0qElnMjAaBtivMTTkIxlU6UVNq5a0mOLXxlNI=;
 b=DmsilKL14v4OBmM23PftkpTmQ8dYIUPdoMEeDE2nf8cXMCQpU34ZUN9vUOWscX3eYR
 bOslX2QgcRWrbD/tuvhzSc+9FWRZKOUzfpYQmBdzARrElgK+BrigMkVuh+npeBKdcFAG
 lIIgF362iUcSuB/z/egBfKI1Hk+6Osn5D7LFc8mHKs6I3Ky4xByXlDdf3cH48SQHMOVm
 JhPx0G0kyM0kGs3mcnsj8dozHahj6zwvqdFUUviSHKR+hCaYWl2FxOKvO3YYNehcGsVn
 J2ymdPJM88QdDsNNB+5ElHxJo2vx8Z21yvWqLR2ARKDco0hy2mUeL5ICM85vLkpEN9Rc
 8q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691152247; x=1691757047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e7e//X0qElnMjAaBtivMTTkIxlU6UVNq5a0mOLXxlNI=;
 b=j57iDjYStAtKa6bSO2tLq/JSDKPAYdGrm5sy5ngqQk8NitVct+si57RpbRiE3hbWFS
 2f7SAAa2sTuBKJQLilXeURxlsyNUGchz3CMXW75FH/9hWFHlVIjoXCw4D+v+3Mgq/2Uv
 v2OlYG8W+6lAGxiZKwrti6BczVb06ItkCdnfjaNgGe/K9lyZ129jA3CbYg/qnjgzYscw
 082RL7doRlq6Q2QK11B44dqM/0wZCKRgx9UpFdbBb2rJN1Sr/4vb9UP5VlhhwYvVeuZh
 q4cUq56map7aIOD1jRncwsPZfjf1QUbukCWGaNnhm/7ZsaxfzIHOttrCSmoKEIkUw80T
 p1Hg==
X-Gm-Message-State: AOJu0YzijDDYm1wVcIxYHhM1C0UIBesAq4RuQA94Z5FN0WKLaZe3TmfY
 13CkdeifQ0UT/sX7lecKsDa9buioQZWtNnSYvxyeag==
X-Received: by 2002:aa7:dc12:0:b0:522:cb97:f198 with SMTP id
 b18-20020aa7dc12000000b00522cb97f198mr1327319edu.38.1691152247283; Fri, 04
 Aug 2023 05:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-11-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-11-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 13:30:36 +0100
Message-ID: <CAFEAcA9Zo7LcPTmBNrtCs2931EEDkqd-WSpYW-By=tuo=8bijw@mail.gmail.com>
Subject: Re: [PATCH 10/44] Add BCM2838 checkpoint support
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8HIoHnld+d7F

On Wed, 26 Jul 2023 at 14:26, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/gpio/bcm2838_gpio.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
> index 7291e473dc..f1121f9c58 100644
> --- a/hw/gpio/bcm2838_gpio.c
> +++ b/hw/gpio/bcm2838_gpio.c
> @@ -17,6 +17,7 @@
>  #include "qemu/timer.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> +#include "migration/vmstate.h"
>  #include "hw/sd/sd.h"
>  #include "hw/gpio/bcm2838_gpio.h"
>  #include "hw/irq.h"
> @@ -324,6 +325,21 @@ static const MemoryRegionOps bcm2838_gpio_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +static const VMStateDescription vmstate_bcm2838_gpio = {
> +    .name = "bcm2838_gpio",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(fsel, BCM2838GpioState, BCM2838_GPIO_NUM),
> +        VMSTATE_UINT32(lev0, BCM2838GpioState),
> +        VMSTATE_UINT32(lev1, BCM2838GpioState),
> +        VMSTATE_UINT8(sd_fsel, BCM2838GpioState),
> +        VMSTATE_UINT32_ARRAY(pup_cntrl_reg, BCM2838GpioState,
> +                             GPIO_PUP_PDN_CNTRL_NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void bcm2838_gpio_init(Object *obj)
>  {
>      BCM2838GpioState *s = BCM2838_GPIO(obj);
> @@ -355,6 +371,7 @@ static void bcm2838_gpio_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->vmsd = &vmstate_bcm2838_gpio;
>      dc->realize = &bcm2838_gpio_realize;
>      dc->reset = &bcm2838_gpio_reset;

Oh, this is where the vmstate struct ended up. I think
I would suggest putting this in patch 6, since that's
where you add the struct fields. (Define the sd_fsel
field there too.)

thanks
-- PMM
