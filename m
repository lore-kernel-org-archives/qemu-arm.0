Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp686127ejf;
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWonz9M8YiGswCs8fVG+Tf1chF6ksR8UdY2SsnoyDgyYjukFJTXX+ahu406KcsDYQzU9qmcGgl0ylUL/ouUzSbQc6Vdsw9n
X-Google-Smtp-Source: AGHT+IE0KUnI/NaoeNU/KUooxmwpySKMwK3Tcigw3KbwWQRWNbX55beK8G86lPDSx9PQA8SahIQr
X-Received: by 2002:a05:6808:1190:b0:3c1:35f2:ecb9 with SMTP id j16-20020a056808119000b003c135f2ecb9mr364845oil.49.1708707453114;
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707453; cv=none;
        d=google.com; s=arc-20160816;
        b=geAJf5k92WIX+eNESBgIZYZITQm/ZTV/wiYCgmEPsdON7m8LUtqpqGXW9z5Rb15DSL
         2xXBvscvMaoA4z1L07x3FW9OeoOmLxZgue+h8IAbsGnKTC+mtKs9vT2Lk6J1OkLW2+a0
         ksaLkbnVp7vrAivfyV3AU8xvwJw/thnf5b/yNor2az6/jS4T0Rl4wEvUz/a64n4Q4CoR
         cAc3zPqsipPD+vzNxMx3ePBUDon+cqQbF65EmNc2U3NoL0pNPYht4kHoEepH/QcDR5Xy
         hRqho/GkozAO+QXl8TANcJ1jnyGa52KJvMAx5xSzkPGMEgvN4r8saD7Rln3bUShyV9yY
         TMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N++o/xZQDN2B/M4OL8iVIDR6P8lcXyUhAsIK1lW9Pf4=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=emzvE0GErD9nPEIYST4KPGlifRtYdg4FxbXM4lLGJcTbRUoJGZSfxr/UNq/J0TIVYs
         XQI7LXnit4ACjstobiptt+tpllMR3AWbQQQ2Wr7LUStn6aE0zXCMKjwOyQVI5OI9QtSu
         lfAqIGx07QmBDfz3B33haUcb53THgECXKOS1lTGaeD6Qcc1SS3qR0wOTOUJEFbqqKVTw
         BovfMGM5z5SugGPIlxlwBRJ7dL57gsGpAIAyfYLOfXS9AL9wJOzv7jJwGsze9TEIhY4L
         gIzYH8URiIvQapIj9TzSzIvM1xNEOPVOomGYLa9VJ9xQPFwT29A65alS8tdLKXUzdtv2
         JMTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZCx0cAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj19-20020a05620a1d9300b007871947002esi16000844qkn.177.2024.02.23.08.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FZCx0cAi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYqK-0007uE-3x; Fri, 23 Feb 2024 11:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYcw-0003Jq-Au
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:42:22 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYcs-00015H-AX
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:42:22 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so722258a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706537; x=1709311337; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N++o/xZQDN2B/M4OL8iVIDR6P8lcXyUhAsIK1lW9Pf4=;
 b=FZCx0cAiRC1QNjCwcRUBmPVo7vHRKFjXPp1+j7iDLo9S8GZuLzZt6CIGxQGRehFVzu
 T1PlcSjemifkQiGo5NdnEBHqWGPXc9eX3LUVIe2GIsgSyStPH7+N6P5CnbBwO9r5zAio
 7iCyarjmCnoKURng0FJKv19TMuqqcJrWBT0TOMtOe/qU5yOIZW8E1+l2lVDZNZEFtZGP
 Mfmf6GxHZmiEhj8KBAWvUtxtTGuVBVriaqujzrkDYhmm5sfSojqZv45RLy8caqJTfIlW
 GiTepOsxGYwzuI3DzF83om70A1feJFvVb0Q50E3oihiZRyCq520spXuS6ojkhzgXyMGl
 ZUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706537; x=1709311337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N++o/xZQDN2B/M4OL8iVIDR6P8lcXyUhAsIK1lW9Pf4=;
 b=EJigp3x+K2Sz3TUmsnTXdRtofUFSD19WTKeaGvH3esOT4GyYdcbe64SAwjuH1lrnQL
 59Bh2jCPOPG1XrgstqM7rnXMbbVVzU9vVDfwl4tH+22p7gJ1QqkMDDyfg7muTFsUq61w
 huX+IlNF5hE/J1MW7BvnOdZge+H6SJ7pMYRPAWIbRnUqaFRi1Gocz+MZcu8yTplU+zuO
 EsJi88/tsfpq9msQNnMn3LP5qZih8tHlOe6yTs3xkQN5KjCwApYHFTagZzGATRjmwoF3
 7/HAYzJpOkCKcT/XfGL8Lhrs6sGWmofh6DwWjdIo6NU42JpHn0+aQgnhotQWAjECWKIg
 gr5Q==
X-Gm-Message-State: AOJu0YwiEAhzavOw751Ywoar/MCG5D4ZIVB9xDgXvuiDYh7BL+zcNgm+
 Tr0T6Wf+uqPQVzZG00MyNdxz/j8IPXNLYVsscbToaWzQR4Ou4Uv3PoAseJIVx4EwXI0YHmsYoBh
 bsUz4FOifDGalZ0hWZNFQvKy1Eyiqs+tNSDbgkQ==
X-Received: by 2002:aa7:d751:0:b0:565:396b:2c1 with SMTP id
 a17-20020aa7d751000000b00565396b02c1mr248955eds.8.1708706536839; Fri, 23 Feb
 2024 08:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-7-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-7-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:42:06 +0000
Message-ID: <CAFEAcA_0sa6bBUdja+bhMKKN+4ve6tTHC1Yqp+77=Fzede-4Dw@mail.gmail.com>
Subject: Re: [PATCH v5 06/41] Add BCM2838 GPIO stub
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SKiO53erFM/c

On Mon, 19 Feb 2024 at 01:19, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/gpio/bcm2838_gpio.c         | 153 +++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build            |   5 +-
>  include/hw/gpio/bcm2838_gpio.h |  40 +++++++++
>  3 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 hw/gpio/bcm2838_gpio.c
>  create mode 100644 include/hw/gpio/bcm2838_gpio.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
