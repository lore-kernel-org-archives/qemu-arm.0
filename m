Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp4285ejk;
        Tue, 28 May 2024 07:49:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl46xwOG26Vs+vHot0uI9jjWGYFl1vbrxfNL+000G8/OCnM+MUnfAtqwr6TVznIO2RX7vvxhGKD+T/8V8BLJgFA7+H4aoD
X-Google-Smtp-Source: AGHT+IFfKkTExZk9fGav8Q9gqusODusEtgC17+OV/O+8WhUTRB2xczcHOkEMgUyjeBJsfwlh+uJZ
X-Received: by 2002:a05:6214:2f0c:b0:6a9:2c8c:1acb with SMTP id 6a1803df08f44-6abccfab4e8mr159462996d6.34.1716907782211;
        Tue, 28 May 2024 07:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716907782; cv=none;
        d=google.com; s=arc-20160816;
        b=OMrK31psrjF3ne5jrRiISCBqiIyYMPCQRvIS+NTWB2GvA/IedccuovK6+GBEvBl570
         N5AISKcrZmqm4vn8kba0fL3FP/JodYvpiHhxDODHZcxlVaMnXkDsmQCzD7PKDF5beBwF
         qqXFigWVX4smUvt6wosromwMy+Mcf4n+q0YviJk0kQ/Gm0RyAFYhhbkiU60Us/ktzlL/
         zHNlf6AiTADocu+8nE/VQkH2Gl6E1ix6r8XnqCVNw1VpdwquYqaMyExF0Y+BOBLf9NuL
         2DPu4WUUMmQwcOfZkQLughAEmfQoOAAh2LLK+d5bfCI/o9ibNcO4La/FxowdOSmo95h5
         id5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IxUt6ACqDbtaBlBD2z5cdjz/trusH42rWRMcsDpvaFY=;
        fh=EWckv2COO6/2RuQynlEo5CR2SJPMVA3IM72BUVXXURE=;
        b=VmTLyPp3bo92jM7KT3kliKanCUs1vHzlDp8mS5kn+W264d+bynIgWj1QKpn8T2a5sU
         dk1tqBhWoWY6CDrs0T3/GGsU49uaQynXMjzbJDxowxxDxlXNAIbjrh3JXSGmOzC9F8yB
         qraqEfvORr0NtizY+0x7DydxiZK2tEAdi7N0qOfWX/s71Ni5AOa+Icrk7p80wv/QhFZj
         UZaX2WmbroiY1c0JVHV3j6tGTte7II0beysZMZY6H1p9I+zd2ALwOS3Ns2PVuZYSJ8Hb
         /Gy92/Xe3uHY/khJZlhNm/aqCBREiyXqtbY7zslRW7oT/GhFBl0/9PPEQHl5sGq8tSLR
         i1pA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wM6+YYCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fdb8ac47fsi14618681cf.145.2024.05.28.07.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 07:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wM6+YYCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBy8k-0004KT-Eq; Tue, 28 May 2024 10:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBy8j-0004Jz-Ke
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:49:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBy8e-0005K7-E6
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:49:25 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso1567506a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716907757; x=1717512557; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxUt6ACqDbtaBlBD2z5cdjz/trusH42rWRMcsDpvaFY=;
 b=wM6+YYCvjP3b4r6oQzm5scGpvW5Y9IBin9GNykt/L5nqjHcrXy3Zddk7kYcsUkqtEW
 3qI/zVPLRaNDMA7ykfv0bg2hAmmCav8kNDz5uSRvWhiQ/Z/1oYM2bqwXqUkwLWCdfKB5
 W7+T8e4BciQtV46bqsF2NySr09eS8DIKRO49yjB8mvChoKc9eYD700u2xMzQ2rMkI4g8
 RCCFhDWgFFX4tqzSEkstvHMYiHEneOI7OKLjXE7yScXUwdZhcbVK6CMRavcUsMFs8oZV
 55XPDagj5CYDDdACwucrwux2z5EPNJ16j7gIVua0/dDeLnN8phQI1mS8I8McQwpX7MyJ
 bSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716907757; x=1717512557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxUt6ACqDbtaBlBD2z5cdjz/trusH42rWRMcsDpvaFY=;
 b=pGtxCKRtq6br543hgO0QmgUHwiVP2DDfv2WzeEzfJUPYzfo/5og4FRMlHKZrnS1Vt/
 zZGm1eb7TrIosqyUDAe9ERQCc9v3AZVfeUu1AId1vEix40Qzzvv3HWLJYHZJN7Avtphy
 lVhHMycqthU8R3OBCr5vAvvG6+/BQtvmnhGM8z+VhjTVr0bM0n9LHbxt4CqgZ0EHmd6l
 rl3ET1dku68VVePRstHFWMaYvqMj44lxWaZN5ugelc4E/ZbuZELiIHccWqWATIrt771r
 8ZXp2XCPMYiIk2UfURO77MJFmRK4lpRTb816ohb3RNZUWB1R86P+7hC0BERtswGBxPiM
 hrKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt+bRjJwjEBSvE33KZCcoB3H67U/8lGti44yggzYgRXDG22wUCG2WUu07n6gF2wTAFrGrM9XXWMGpGB+I5fErDMc67
X-Gm-Message-State: AOJu0Yw73yfzDFF6lca0qzRKpGxq0oZxxyrD/bp24b7oO/Srme0WF6Md
 ZCnnygnwm72/Dj7zOxoZ90KQId7HiSM1IZfUTWyulOQaNv+1zfqOO0BItyH3LRmXWce5IjjgICQ
 mvXfhnTbu51rptm4zucNwrAkWwaubU6aC+mNzaA==
X-Received: by 2002:a50:c051:0:b0:578:6481:584b with SMTP id
 4fb4d7f45d1cf-5786481588dmr9113447a12.14.1716907757070; Tue, 28 May 2024
 07:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-5-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240523194441.21036-5-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 15:49:06 +0100
Message-ID: <CAFEAcA-30JquShwj8BH0Yt6hTdgGjRvdMgooBwmGDtOygjLWsg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] tests/qtest: Check STM32L4x5 clock connections
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: rW5fwdFG1FhB

On Thu, 23 May 2024 at 20:44, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> For USART, GPIO and SYSCFG devices, check that clock frequency before
> and after enabling the peripheral clock in RCC is correct.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  tests/qtest/stm32l4x5.h             | 43 +++++++++++++++++++++++++++++
>  tests/qtest/stm32l4x5_gpio-test.c   | 23 +++++++++++++++
>  tests/qtest/stm32l4x5_syscfg-test.c | 20 ++++++++++++--
>  tests/qtest/stm32l4x5_usart-test.c  | 26 +++++++++++++++++
>  4 files changed, 110 insertions(+), 2 deletions(-)
>  create mode 100644 tests/qtest/stm32l4x5.h
>
> diff --git a/tests/qtest/stm32l4x5.h b/tests/qtest/stm32l4x5.h
> new file mode 100644
> index 0000000000..cf59aeb019
> --- /dev/null
> +++ b/tests/qtest/stm32l4x5.h
> @@ -0,0 +1,43 @@
> +/*
> + * QTest testcase header for STM32L4X5 :
> + * used for consolidating common objects in stm32l4x5_*-test.c
> + *
> + * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2024 In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"

Header files must never include osdep.h. The rules for
osdep.h are:
 * never included in a .h file
 * always included as the first include in every .c file

> +#include "libqtest.h"
> +
> +/*
> + * MSI (4 MHz) is used as system clock source after startup
> + * from Reset.
> + * AHB, APB1 and APB2 prescalers are set to 1 at reset.
> + *
> + * A clock period is stored in units of 2^-32 ns :
> + * 10^9 * 2^32 / 4000000 =3D 1073741824000
> + */
> +#define SYSCLK_PERIOD 1073741824000UL

Rather than doing the calculation by hand, it would be
clearer to use the CLOCK_PERIOD_FROM_HZ() macro from hw/clock.h.
(If #including clock.h from the test C file doesn't work for
some reason, you can copy the macro definition; it's a one-liner).

#define SYSCLK_PERIOD CLOCK_PERIOD_FROM_HZ(4000000)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
