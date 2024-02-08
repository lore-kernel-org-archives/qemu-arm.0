Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp69618ejb;
        Thu, 8 Feb 2024 04:36:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8rduyXjwbMFMPYU/P6WH1BrhypDHdu8M96so+Llga3v9wxUFIARr+hMP9fnlu7MRTl6RN
X-Received: by 2002:a05:620a:214d:b0:785:90c9:16a5 with SMTP id m13-20020a05620a214d00b0078590c916a5mr8012370qkm.8.1707395773919;
        Thu, 08 Feb 2024 04:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707395773; cv=none;
        d=google.com; s=arc-20160816;
        b=aHiVGfge4NknC/nKz04/hob8Gl3f3YOwDkFYIcv3DFIr3eokymkNZ9p48ba4wsXqBr
         ziQwqggmkqWdy/Y/PQbSl3Mcegqxwbo+be72Pk66N61+mexE5MkJCQEdiHDpxRwBb5Mz
         QQf2EfQWSVJ0PLXmbR7tVfYaaBYDnUvNOGmE8o5a9h2Kt1zAmPa+8FvJ2bPEAJN+dRiR
         P3V56P/QBN8iopf7aa3C7s7AWHT219hpofAD4doMoVtsUnne5WnXngUf1J3xmcvgEX9u
         37pcHcYOfYI2bGHHpUKU+G1b/QkXi0vJs+1WoRc1nszLw3JUq1XrdROiYY39p61fZHgD
         7peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IFxEPyrgtMgsWPugIr4F6nPPOpLplKAAn58++iebiKY=;
        fh=zpY/WeZbMNuWtEc49H/qdn8gnhu+VmlzfinqQHsqY6s=;
        b=DciRK9I60l9bUVPQ/bDeNXTClpdezoMvLFF4j70aNJ7u6G1SegQkn5Va1cQk/m2PYi
         nN//yopj9aQmcpYhTJ3RSVKrRHxXs6zqys1VKrJtlsNXqZ3S+4tsgbYdcJ8jqmHuvZHt
         RfbEoY34TDkTfmH4H4ipXHHg701PoP2ho4cPK0EoGgYPMJmjxWOgYz5emxOlSZyxZCet
         12LZtk6QiygaRJ+Tv+ui+zTdf7EAWj1a6IjIDlZTWvprfqN4dQojIn2uN31ADM/HFx2N
         OU41lWAn0UY9wBtpiw5OFck0VLD3TYVzO6wc+UUbknqpO2R8/KGIFQboL8EgKQP9VgDZ
         8Miw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLPyesqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWZzk7eNxfnqG0rgVFC49H78gu7mm0Im9o+qrv0g2J33HcLKwnBpk3VDzQf65ZUktaA6y0WPvJj6mrNnI/6N9DLnOPerd63
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a37e109000000b007840449a485si3147189qkm.234.2024.02.08.04.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 04:36:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLPyesqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY3dT-0006fT-7R; Thu, 08 Feb 2024 07:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY3dR-0006f7-JX
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 07:36:09 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY3dL-0000x9-Py
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 07:36:09 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a90a0a1a1so2470054a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707395762; x=1708000562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IFxEPyrgtMgsWPugIr4F6nPPOpLplKAAn58++iebiKY=;
 b=gLPyesqo+Qe/wX0960yUrX7N6FgumFUakbdTjaUsTEtV/ZfdquyO/gx5Y0QjDvYpBn
 P8IrQTqOnNBpfRRUPYvNHDK+sF3iPlvoe2sggXn4nOH+gGsrwBjFV469KWLpHMpFfetF
 kM0r935tR72Ass3ne3fv1UrnzVVz/VEokjv71DtKGiZmUdGfhTduArRool1+sAtld/Tr
 7IyDwXXJFJbQdqZaRtJU3q+2SXK0lGIzCtn5TaVfBq5jHeonjuvxDAXBat/LmP4zsj4M
 Rbr9inWmNf9TyQnVLjWET9Yem/JgFH6Vj2m09jpciGpFmYk136ZDI7seEbYNh+VdMXa4
 18Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707395762; x=1708000562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IFxEPyrgtMgsWPugIr4F6nPPOpLplKAAn58++iebiKY=;
 b=l1ZYm87CaSV+3vZgOT2bj0Fuk2z4FjWT7x+/sMqnX0dWmL64GLAp/8KVZrARWBE0z1
 rf2KF91N6l1obu4tF6/HcgHK3TAWXiwTi2zRTy5oJh9r1mH6hnZp5SpzcanF6ocuvRze
 8cBxuQSh4oMNrkrI1ZJwWZcZAkxudIsD9av3qx688J4GJJUhsIwPcFtUMS3UFNazzyAA
 rTYpwmPptcJYyzfcWie96K/YwKgJwzJAW2oCoU1/B1lXBM0oNboOuiVgIDBJ0u8cEv/6
 5pcTVsuq9VBoh0FFJ8clRvvU8nLqJX7iTtXFkmhrnNypGa0GJ9FNdC45oh7JiaW4yn7k
 m7zg==
X-Gm-Message-State: AOJu0YxFfL8Dj2hmtt0qJUj5N5lVGnnXitNfIIfC7f8y9xiNmNSvUfdM
 igumaEm+a6t8YEcQIxRcf0aJh+HmUHtMIavKiKTjhDhgExRQy1urQEYr0RufWVo=
X-Received: by 2002:aa7:c991:0:b0:55f:fdd4:437b with SMTP id
 c17-20020aa7c991000000b0055ffdd4437bmr7256390edt.0.1707395762112; 
 Thu, 08 Feb 2024 04:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXnK/rBsJDbLzPVj1w3JqKXl6YQtU4WN7Nvh8uomq/MLNW9TX/TbvVEvhefG4VIMBjrqmsLBpaJ8rgvVmWUeI6E0196r2SL7Ygiuzjrxz+aaOPAbLT5zqauyMzJxSQixyASOHHCsWdYSJsCf2NtRWkAbDcAlwfBJD8XjnBrxrulKPqSaHdN6BLZRwtiirbIcvUS1FKFTJnUQmL2giXZ7Kbs8/Evq9RWdjmU23DeifXRu05DYfIcJ2Gsyk87iVY1krHLRWhycHR0ysHAzBXtZpDXYm7uic20LdxCJKdCUAq7oSRmZrYt92wvSaEqkbfJMj8rgID6u9+jyLdxjul+iJlB0j4=
Received: from [192.168.69.100] ([176.187.214.82])
 by smtp.gmail.com with ESMTPSA id
 fi7-20020a056402550700b0056098a293cdsm745304edb.69.2024.02.08.04.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 04:36:01 -0800 (PST)
Message-ID: <244db2c3-ddf7-42a2-81dd-bc45f4035826@linaro.org>
Date: Thu, 8 Feb 2024 13:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240109160658.311932-1-ines.varhol@telecom-paris.fr>
 <20240109160658.311932-3-ines.varhol@telecom-paris.fr>
 <5a7594d9-3fbd-4d90-a5f9-81b7b845fba7@linaro.org>
 <1921238046.591194.1707388492770.JavaMail.zimbra@enst.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1921238046.591194.1707388492770.JavaMail.zimbra@enst.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MYi6IGvub6Se

On 8/2/24 11:34, Inès Varhol wrote:
> Hi,
> 
>  > De: Philippe <philmd@linaro.org>
>  > Envoyé: mercredi 7 février 2024 23:02 CET
>  >
>  > Hi Inès,
>  >
>  > (this is now commit 52671f69f7).
>  >
>  > On 9/1/24 17:06, Inès Varhol wrote:
>  > > Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>  > > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>  > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>  > > Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
>  > > Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
>  > > ---
>  > > hw/arm/Kconfig | 1 +
>  > > hw/arm/stm32l4x5_soc.c | 52 +++++++++++++++++++++++++++++++++-
>  > > include/hw/arm/stm32l4x5_soc.h | 3 ++
>  > > 3 files changed, 55 insertions(+), 1 deletion(-)
>  >
>  >
>  > > +#define NUM_EXTI_IRQ 40
>  > > +/* Match exti line connections with their CPU IRQ number */
>  > > +/* See Vector Table (Reference Manual p.396) */
>  > > +static const int exti_irq[NUM_EXTI_IRQ] = {
>  > > + 6, /* GPIO[0] */
>  > > + 7, /* GPIO[1] */
>  > > + 8, /* GPIO[2] */
>  > > + 9, /* GPIO[3] */
>  > > + 10, /* GPIO[4] */
>  > > + 23, 23, 23, 23, 23, /* GPIO[5..9] */

BTW I only mentioned #40, but note other patterns, here:

GPIO[5..9] -> #23

>  > > + 40, 40, 40, 40, 40, 40, /* GPIO[10..15] */
>  >
>  > I'm sorry because I missed that earlier, and I'm surprised
>  > you aren't chasing weird bugs. Due to how QEMU IRQs are
>  > implemented, we can not wire multiple input lines to the same
>  > output without using an intermediate "OR gate". We model it
>  > as TYPE_OR_IRQ. See the comment in "hw/qdev-core.h" added in
>  > commit cd07d7f9f5 ("qdev: Document GPIO related functions"):
> Better fixing it now than later :)
> I must admit I didn't pay attention to the particularity of EXTI5 to 15.
> Current exti tests don't even use these lines, a testcase will have
> to be added. Otherwise we mostly ran executables using GPIOs as output,
> so no weird bugs encountered.
> Thank you for noticing !
> Ines
>  >
>  > * It is not valid to try to connect one outbound GPIO to multiple
>  > * qemu_irqs at once, or to connect multiple outbound GPIOs to the
>  > * same qemu_irq. (Warning: there is no assertion or other guard to
>  > * catch this error: the model will just not do the right thing.)
>  > * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
>  > * a device's outbound GPIO to the splitter's input, and connect each
>  > * of the splitter's outputs to a different device. For fan-in you
>  > * can use the TYPE_OR_IRQ device, which is a model of a logical OR
>  > * gate with multiple inputs and one output.
>  >
>  > So for example for the GPIO[10..15] you need to create a 6-line
>  > OR gate as (totally untested):
>  >
>  > /* 6-line OR IRQ gate */
>  > Object *orgate40 = object_new(TYPE_OR_IRQ);
>  > object_property_set_int(orgate40, "num-lines", 6, &error_fatal);
>  > qdev_realize(DEVICE(orgate), NULL, &error_fatal);
>  >
>  > /* OR gate -> IRQ #40 */
>  > qdev_connect_gpio_out(DEVICE(orgate40), 0,
>  > qdev_get_gpio_in(armv7m, 40));
>  >
>  > /* EXTI GPIO[10..15] -> OR gate */
>  > for (unsigned i = 0; i < 6; i++) {
>  > sysbus_connect_irq(SYS_BUS_DEVICE(&s->exti), 10 + i,
>  > qdev_get_gpio_in(DEVICE(orgate40), i));
>  > }
>  >
>  > > + 1, /* PVD */

PVD, PVM[1-4] -> #1

>  > > + 67, /* OTG_FS_WKUP, Direct */
>  > > + 41, /* RTC_ALARM */
>  > > + 2, /* RTC_TAMP_STAMP2/CSS_LSE */
>  > > + 3, /* RTC wakeup timer */
>  > > + 63, /* COMP1 */
>  > > + 63, /* COMP2 */

COMP[1-2] -> #63

>  > > + 31, /* I2C1 wakeup, Direct */
>  > > + 33, /* I2C2 wakeup, Direct */
>  > > + 72, /* I2C3 wakeup, Direct */
>  > > + 37, /* USART1 wakeup, Direct */
>  > > + 38, /* USART2 wakeup, Direct */
>  > > + 39, /* USART3 wakeup, Direct */
>  > > + 52, /* UART4 wakeup, Direct */
>  > > + 53, /* UART4 wakeup, Direct */
>  > > + 70, /* LPUART1 wakeup, Direct */
>  > > + 65, /* LPTIM1, Direct */
>  > > + 66, /* LPTIM2, Direct */
>  > > + 76, /* SWPMI1 wakeup, Direct */
>  > > + 1, /* PVM1 wakeup */
>  > > + 1, /* PVM2 wakeup */
>  > > + 1, /* PVM3 wakeup */
>  > > + 1, /* PVM4 wakeup */
>  > > + 78 /* LCD wakeup, Direct */
>  > > +};
>  >
>  > > + busdev = SYS_BUS_DEVICE(&s->exti);
>  > > + if (!sysbus_realize(busdev, errp)) {
>  > > + return;
>  > > + }
>  > > + sysbus_mmio_map(busdev, 0, EXTI_ADDR);
>  > > + for (unsigned i = 0; i < NUM_EXTI_IRQ; i++) {
>  > > + sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, exti_irq[i]));
>  >
>  > ^^^^^^^^^^
>  > > + }
>  > Regards,
>  >
>  > Phil.

