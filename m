Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2143646ejb;
        Tue, 30 May 2023 05:37:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qFCxozs1XBEHpflAEC6RLYTwiSiWBXzu74hCtvuXQguWRDqFqRHXcSoQKQysQPmLB9Oyq
X-Received: by 2002:ad4:596d:0:b0:626:3a5a:f8e9 with SMTP id eq13-20020ad4596d000000b006263a5af8e9mr854031qvb.54.1685450247860;
        Tue, 30 May 2023 05:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685450247; cv=none;
        d=google.com; s=arc-20160816;
        b=qkdecB/hCkMwdFWk6gLFJS0ofBZ5PylpnzxAS66IhOppvUROA1ELbC2I7l5a8FjBEf
         xPkctIBbFfO9ShvlJG86iV7UqF93gJJLUyElz47M2qGFsfUORg7Kdpg+y1VDWS0Hfes2
         zwh2WMVA8MGwVcg1kGjFjAfhLN7cpVidp+mmobbZe7nDAB5zZO8eBrYbfpzvUUa3jYZj
         jtWTfKhfFwSv7fmnZPuxaQn2Ke/20bDPGdu57UBO64AvKVPpuhokLF7EmmA4Usjl3sPn
         QISDFi4eI9evH/EUWCXYZh/xnieuHBbqlzmBfm92wK7Nsf+4e3KFxhSDAZslhCWaQnfd
         mIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xj+iLiINqefgnt5kZosZHtx7moN7sXIAZMNLQ7bIJXI=;
        b=KqzgF5eGmaB09EyEUPPvQSOBmypgrCx9Ohn8U6utPOQC+Z+P+ZIM7IaUydXf0ClhVY
         Ez3fGJ9sq3P+3x6N+B5cH1NM+U8IAC8up2oAk27qbUtxM6BP1x/1olrJOJg/GoaIEQvf
         KBAmobI612Gzqow6nExC2/S96pfH7IMe6Ok+avwtluc6iM6cUG5GLr+VQDJYeIB+Mp8j
         UgPFZCkZbfP8aRB8V0A6HXwnOHMZaXguOxV0W3aGW0mB1ZkLCQZVQwvl5E+ub28JHuOX
         wjHRDv3s5LIZq4kAymiYlD9JXYxQhiDEetn2L3U5Jnb7i8owQ8t+9kGX1uhs0FtTyAtn
         g8jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uM5ZOP0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a0562140c4300b0061b5a6032b2si6437404qvj.571.2023.05.30.05.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uM5ZOP0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3ybK-0004jJ-M5; Tue, 30 May 2023 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3ybJ-0004fx-M7
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:37:21 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yb3-0002jv-ET
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:37:21 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so4956156e87.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685450214; x=1688042214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xj+iLiINqefgnt5kZosZHtx7moN7sXIAZMNLQ7bIJXI=;
 b=uM5ZOP0qmym2M5a5697zaKFm9QWjFHyevl0uj3kVlQs6iDdU/5/fvG+74NzLo6dy93
 9c0bIto9T74NHhLHJMqFcebpwN3XCIucmf3/X2XdWZsc6hsKLeeeBmp/M4gidnPIOzS7
 St2QA7BE5kLB32KOFEoXBcYNg6gXwBZX8ftXkzccXuWxqm4lE36+KjPa1xQ0rpIiC+9/
 tODhPDw10HIEZJycr34FRuPUk687KQ2D3aLugI/G2rXeatSLTAeVj+kLhmfh13AKwFEd
 yMhqqJAJhRlXGXYv+H6vi0jVaEXuU5p3vz9K8DkiZAwF9jeEy0TlVkTHJxzlY5MlI3GX
 NB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685450214; x=1688042214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xj+iLiINqefgnt5kZosZHtx7moN7sXIAZMNLQ7bIJXI=;
 b=MVe4xbf8XVBbkbw6CtD14QwXl9JeLiCUzQYbzNcQg/bq8mjmjPxXKFBi0eZ6bd4YXP
 R57sRAIpoGAq7u1RNv9XUVbkn5a9feQXrb469T0cF+tBooyY5egy/8NOYeSdcSUW9AZ8
 FBfchD503Sm8si15QeFT+4iOWLfWdJ15QPKkS2K4rs++DjxmS9GnFbpFm0oDXsiS0+59
 N6LBq6e/CooxfXS2Z4a1Um967uQCZAKLwWpnzx8Lj5dIibtT2XPSnaUo/yPqATvFFYWI
 ujxYOHtZwcpvTJ5VHtYHh7FFNw/Otz6YY2UvipW7+l0LEPWA7oz3BNLiIiZZG6+iMyDd
 l0bQ==
X-Gm-Message-State: AC+VfDzGl0o5m6Di4H9/lxqDjVk8byqUlRrDdSaakRJbwCntIHmwVAkA
 Tu+tdooXiKyjHMOjxpvSx0ouXF9hQUmJa4uiNHMEjg==
X-Received: by 2002:ac2:5626:0:b0:4f2:34f1:cf24 with SMTP id
 b6-20020ac25626000000b004f234f1cf24mr662955lff.22.1685450214427; Tue, 30 May
 2023 05:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
 <20230524113308.834675-4-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230524113308.834675-4-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:36:43 +0100
Message-ID: <CAFEAcA-bjGmOn_hyT8a45c+jBnF_GuKBwB3XTOxqb7pzNJCdAg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] docs: sbsa: document platform version changes
To: marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CEwZtkOv2yxi

On Wed, 24 May 2023 at 12:33, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> We plan to start adding more system information in DT so firmware does
> not have to use hardcoded values.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  docs/system/arm/sbsa.rst | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index 016776aed8..922a29700d 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -6,16 +6,35 @@ any real hardware the ``sbsa-ref`` board intends to look like real
>  hardware. The `Server Base System Architecture
>  <https://developer.arm.com/documentation/den0029/latest>`_ defines a
>  minimum base line of hardware support and importantly how the firmware
> -reports that to any operating system. It is a static system that
> -reports a very minimal DT to the firmware for non-discoverable
> -information about components affected by the qemu command line (i.e.
> -cpus and memory). As a result it must have a firmware specifically
> -built to expect a certain hardware layout (as you would in a real
> -machine).
> +reports that to any operating system.
>
>  It is intended to be a machine for developing firmware and testing
>  standards compliance with operating systems.

> +Platform versions
> +"""""""""""""""""

All this stuff about the DTB format isn't interesting to most
users, so we should put it at the bottom of the doc, below
the 'supported devices' part. Also, the subsection title should
be something like "Board-to-firmware interface", and it should
lead off with the text that clarifies that although the data
blob provided by the board is in DT format it is not intended
to be a complete compliant DT but is just a mechanism for
providing the firmware with specific information about the
non-discoverable components in the system.

> +
> +QEMU 7.1 brought support for "platform version major/minor" fields in
> +DeviceTree.

We don't generally document things in terms of which QEMU versions
they appeared in. The docs just say what the current status is.

> +
> +Version 0.0
> +'''''''''''
> +
> +It is a static system that reports a very minimal DT to the firmware for
> +non-discoverable information about components affected by the qemu
> +command line (i.e. cpus and memory). As a result it must have a firmware
> +specifically built to expect a certain hardware layout (as you would in
> +a real machine).
> +
> +Version 0.1
> +'''''''''''
> +
> +Additional data are provided in DT to the firmware:
> +  - address and size of GIC Distributor
> +  - address and size of GIC Redistributor
> +
> +Simple "/intc/reg" field is used.
> +
>  Supported devices
>  """""""""""""""""

thanks
-- PMM
