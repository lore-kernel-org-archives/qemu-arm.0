Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp62819nji;
        Tue, 15 Oct 2024 07:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8QaZkPDwSscSEnblfXM+DnAhQsPHpCEjf3VQtvLl9SXiHrx4/ikIYwcuqx2ANowFDBGbC+lm6MrsO6g==@linaro.org
X-Google-Smtp-Source: AGHT+IEZUtqIVd+ggn6+OkTDNHrMSO+aJI5mmpBl7PStegCP/PQiq+YRtxM4RTX8ykAWQtCU88rh
X-Received: by 2002:a05:620a:2684:b0:7af:c60b:5acf with SMTP id af79cd13be357-7b120fa7df5mr1776157685a.10.1729002111133;
        Tue, 15 Oct 2024 07:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729002111; cv=none;
        d=google.com; s=arc-20240605;
        b=TDzOZKI+rNM5VvwMtqSISJ88c++uWWMWrhv/uD9rAO1TeKspPhGg5F0vFE8XWabo5Z
         Lt3+ehn6tzaMES7XO1KEQd+1Rka3oGJ8W5A4MOVoslwWD/RqAjC+81HwfRSFpNLaAZca
         j7AIcbiH2Efh/CI3DQXUPmq8/Vd2YP30O0g6hVccYj0+yZruwK2lcCuntlFgYCze+oFW
         Tps4QmVccT9x7N802dptteR0T+N+wSp8xOCuB4iXjiorez2y0xubTJxuQfUyBeUTnl86
         53f9Tdp4tuSpglNVQ79P+MQeO9ftq0MUr2IJLkHds1chb40D5UAHRLOtaxj3zw3C4roo
         puGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YdpUI49LyWqdj8Rnto7CJrV3mF8S6CujfvlBzRZHUyw=;
        fh=HkWZYxn5KcnLxWZ8X56EcMe9sD8QfnGb+BmwnjYrkDY=;
        b=QHBzLU96ApQKjj6QamZjTgWXtAOtSpptpz+uNFn+8/T8IpszXMQ7XGjZW98gpScZET
         XQ3s7cK0qNRm2ameZHyiToLF5t10mV8jq7GMoJLsDSSrw3U3zrTZp4wU/fhO6k86e42j
         JLrRy25xzOrSPJdAdxlG8JML9h0DlLdnARM20q0npjWWyNFc/WRkuccA/SezAF+gpP/k
         vysFZ2fXF5miC36fq3wCPiDrXLOE11XV8LCQBy0aK+elV3ncjDKquDjAen2fnXJcO8Mv
         u/57ygNNKMVN7CTCchS0y98SLhJgHjH7MDugTgI+cUcLhGOEhLrP+KSlz4dLsfjMmBCN
         PBsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1SRcCOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363e1aa4si146143285a.449.2024.10.15.07.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 07:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1SRcCOE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0iPy-0000pC-11; Tue, 15 Oct 2024 10:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0iPv-0000T1-Gn
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 10:20:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0iPt-0003k7-IC
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 10:20:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c984352742so2332776a12.1
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2024 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729002052; x=1729606852; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdpUI49LyWqdj8Rnto7CJrV3mF8S6CujfvlBzRZHUyw=;
 b=N1SRcCOEvy4T7zT6/5clFFG4w3Vn/DbRV4Quw4ut4ECKKEOxSd1TSL8k4RRbfLJUUq
 1BM4BRiqdaEnKipqYfGBLQ5YdFlljFg+e7LcepSEytcDKz1qo3rt4AEeOan7OxNTkPOM
 dqAPkK9GD+kWfQXqbKwaSL05bBHCzpUJk3YVuIaCnB1fGX9/LHeHuDBtvE8CoSZCMKq2
 IhmjMrxxFJHwQ2FM4AxVBCu79J20Za4iUHlTIv72vFHSrDLNU+Qiz4HeJxWU+RbzflGP
 xifpHGmD4MoVBfptGm5aG4h/QLOSraAgkmCPWnpnA36j+YJS+WQ7bty/clWcigJJ10xr
 08/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729002052; x=1729606852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdpUI49LyWqdj8Rnto7CJrV3mF8S6CujfvlBzRZHUyw=;
 b=h0sJTgrw2QHqZRMvnyso+7THnw1uC+kelcWIb7DxH39VTGLK5YkAFmdEJDob1czNVW
 4QVl6xvvV/LGSGychAdmobLQHW69ZPI7KT4w3633aSbI45XZh/lMfiuZYJhUdUSvwu3c
 re3d5PxxS5irHC9OBAQg9aCj6CwyZM0faPQFBZjvAnchanclerIL8KfoVP8nvtc92HvY
 vVry7WTulx5Q/5XE+XixcpTAWjeOp9Y0WPjywa+Muq+ARw1JjJy3h5dpytz1qMJpqxGX
 Hr8wv1lFz5M+UTezs0YlZh4c6o36Ap9X/tjx2dtvXAc1t/0KjDJXRQpAsojRGqUKlif7
 U/FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNJhsjnWKGTJd2vPFuNG+tr+XPmoe6WEYDpC9WmEeRZEkBfIZGlOrtpqjWRXVuo//eXtqVtmvVzQ==@nongnu.org
X-Gm-Message-State: AOJu0Yww8Y00S32TOmsc/2U0G3HjXXBeZnKOICRf2AMzDp2ejVOy5p84
 AsDcX6BFVu4JDCUsBEjDzQsamLpn9LtJhu3WPdFbO94UAd07BNu4TwJUmwOwcApJlMUHJ8Hwdvu
 pC+ktT9U6muhRc2BBI9DpbZo49iljjeY3TurZRA==
X-Received: by 2002:a05:6402:908:b0:5c7:2131:5d3 with SMTP id
 4fb4d7f45d1cf-5c9950e1343mr339583a12.12.1729002051747; Tue, 15 Oct 2024
 07:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241003081105.40836-1-ines.varhol@telecom-paris.fr>
 <20241003081105.40836-4-ines.varhol@telecom-paris.fr>
In-Reply-To: <20241003081105.40836-4-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 15:20:39 +0100
Message-ID: <CAFEAcA_0eyAa=XjDnobYqkinEnW1wOetKDBqus7k1BTWTyLLpQ@mail.gmail.com>
Subject: Re: [PING PATCH v5 3/3] tests/qtest: Check STM32L4x5 clock connections
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc@lmichel.fr>,
 qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Samuel Tardieu <sam@rfc1149.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: W9HGriYsjocK

On Thu, 3 Oct 2024 at 09:11, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> For USART, GPIO and SYSCFG devices, check that clock frequency before
> and after enabling the peripheral clock in RCC is correct.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Luc Michel <luc@lmichel.fr>


> +static void test_clock_enable(void)
> +{
> +    /*
> +     * For each USART device, enable its clock in RCC
> +     * and check that its clock frequency is SYSCLK_PERIOD
> +     */
> +    QTestState *qts =3D qtest_init("-M b-l475e-iot01a");
> +
> +    check_clock(qts, "machine/soc/usart[0]/clk", RCC_APB2ENR, 14);
> +    check_clock(qts, "machine/soc/usart[1]/clk", RCC_APB1ENR1, 17);
> +    check_clock(qts, "machine/soc/usart[2]/clk", RCC_APB1ENR1, 18);
> +    check_clock(qts, "machine/soc/uart[0]/clk", RCC_APB1ENR1, 19);
> +    check_clock(qts, "machine/soc/uart[1]/clk", RCC_APB1ENR1, 20);
> +    check_clock(qts, "machine/soc/lpuart1/clk", RCC_APB1ENR2, 0);
> +}

This new test is missing the qtest_quit(qts) call at the
end, which makes it hang when run on OpenBSD. (I fixed
this up in the pullrequest.)

thanks
-- PMM
