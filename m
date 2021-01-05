Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp16294134lfq;
        Tue, 5 Jan 2021 02:21:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6kAbWWfWJBf3v5Ad7jcBlGUoYjZHG+3nC6r0aR8Ml82Sn7olUHNu6/X57q2c4UDCpZdqY
X-Received: by 2002:a25:4e8a:: with SMTP id c132mr109363759ybb.235.1609842086912;
        Tue, 05 Jan 2021 02:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609842086; cv=none;
        d=google.com; s=arc-20160816;
        b=OejmBXfXxN7/okRzO0NZS3KXbFCk7f9+EeeUc6gD2J3HC1seSErnRdSnPCobFXlq3V
         o7rc6wDHRrXbA777pxNN/+uZWcMRCSOuMUD6qX48ld6BTx5MeVsQSGG+yFniiL016Q8p
         C4icm88BwmKUPYDmhRbMxQGMZvICCyTLe3eVM3Y/5gNE1TSapnAreelSYj08XFolopfN
         /oLjkB66SVzG8WjHXUjGW41TGk8PWrghjnUxkWDKaGs45M+gh2TfEG/E9X3RDunFc5IZ
         VjtDNwVl2oph6SDnGRt/gOEPSwVbxxwH1v+CK7wlMnREQtHBzh2GipQ8XjLc+IzbDcsn
         geKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wcyrXJyV8vkXYpF1Gj7teAMTTTs3GqXdlTK0DB40QuM=;
        b=zoNVwLzIl20TTbkPmX8lHTs2SoUrr2tyxzrj44sFc6vu2IDKc+BvMLJr21cBtjjYdB
         Z7lIuGsBHzcTqm67xCmEqmtR5hKwzemKMyU/Fh1DsSad2Vzub8IqNrQEpXCEMvkSwZfy
         F/AFdvg5hFenOM5uegIsE1ot0tRflTkFXwqtE6hA/MzKq9P4a62Cpny6dHubrl3EJIRq
         Pop48+DnC9k7l/cbss7QJ5c4saGLpdXZJsUc6310Zrkow9LoKNf39quSue9p3EUinW/6
         Iuhpw3u9+jwCuF1i3H9gU8KFOY/79/MlpUPwbKEHvBzrXyWmVx/seVxbyPUDCwBgMb1X
         u9xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fZAESk28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si19811720ybt.197.2021.01.05.02.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 02:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fZAESk28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwjSw-0006wW-Aa
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 05:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjSd-0006uZ-RG; Tue, 05 Jan 2021 05:21:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjSZ-0006CE-3T; Tue, 05 Jan 2021 05:21:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g185so2517846wmf.3;
 Tue, 05 Jan 2021 02:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wcyrXJyV8vkXYpF1Gj7teAMTTTs3GqXdlTK0DB40QuM=;
 b=fZAESk28FY86MP2pfU2qVWx0kftV3kXrAHiyOj2P0Djgl+uxMpp6FhUQUR20V7A87y
 p/izchjfhwi8wks5lBCNir7O2GBbEblzOxtQ7CiHSij0sGTAvXfEJSPCr833LwGK3ZA8
 Vdy48MZGAZUDY0bBxeaoKF5lB1dSuO0OOPPs2JXSIPJjFKF5TGUY6buSxb2JP/jJUkdA
 FA6KLkIiu67xepzvSidxOBQNe0ZvlcXn2qQ8DBfFF4e7L/uLShvHvV5WNHQZFFBpCYjP
 NEyM+56YrUsrIYsWxaBTPxcu+47Rhg7DBjE7sJ7mlQNi66P59GxqTi2N6XjmluQLlaCx
 wD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wcyrXJyV8vkXYpF1Gj7teAMTTTs3GqXdlTK0DB40QuM=;
 b=Fcn7SIoZhjuIVcc2yRw6l1qRHWlepuubq1M9XPVeMcytz25ZruyO5gqrVqcmGPduBu
 d7bnYYtre6De0Bci/FhRpdx2Fz08Wnr/pGfpfZ/ZnNzPT3gWrnnh23GP1ER2tBKFRkMq
 fk3IzK9QtYjtxAr8aFU1zDKW6w0SuIhU6vYYGiSnxnKZec6IglLCI2PqjSiRRZ/QUHh9
 3q8fR4U2xtJV+cKC4AkH/ZnyPBfo/nU+aQfdCO2YeFXaAOZZyHznwKW3PjKcszl0BfUm
 czoaAA/cZwVmASBHQRUMWogrMLhoNrZLQtz/XTjzHlN1fzsc5U7KhoWPhoZe+7yps7Po
 S3Zw==
X-Gm-Message-State: AOAM53234IzW/31Cz+Zhwv9yF9A6WFKR5DtEUGReNIRmXE5NN00oBo9K
 5HA5mssMaSUWjldT3jayrhw=
X-Received: by 2002:a1c:2785:: with SMTP id n127mr2844010wmn.148.1609842060737; 
 Tue, 05 Jan 2021 02:21:00 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a62sm3599259wmh.40.2021.01.05.02.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:20:59 -0800 (PST)
Subject: Re: [PATCH] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201217135713.9715-1-maxim.uvarov@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72254ba5-368e-e179-cce0-75510ff8028b@amsat.org>
Date: Tue, 5 Jan 2021 11:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201217135713.9715-1-maxim.uvarov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, tf-a@lists.trustedfirmware.org,
 Jose.Marinho@arm.com, francois.ozog@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RSrcI58iYrz

On 12/17/20 2:57 PM, Maxim Uvarov wrote:
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware).
> Use the same gpio 3 and gpio 4 which were used by
> non acpi variant of linux power control gpios.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  This patch works together with ATF patch:
> 	https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f	
> 
>  Previus discussion for reboot issue was here:
> 	https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
> 
>  Regards,
>  Maxim.
> 
> 
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 24 +++++++++++++
>  hw/gpio/Kconfig       |  3 ++
>  hw/gpio/gpio_pwr.c    | 83 +++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build   |  1 +
>  include/hw/arm/virt.h |  1 +
>  6 files changed, 113 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.c
...

> +static void gpio_pwr_set_irq(void *opaque, int irq, int level)
> +{
> +    GPIO_PWR_State *s = (GPIO_PWR_State *)opaque;
> +
> +    qemu_set_irq(s->irq, 1);
> +
> +    if (level) {
> +        return;
> +    }
> +
> +    switch (irq) {
> +    case 3:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        break;
> +    case 4:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        break;
> +    default:
> +        printf("qemu; gpio_pwr: unknown interrupt %d lvl %d\n",
> +               irq, level);

Please use qemu_log_mask(LOG_GUEST_ERROR) (or UNIMP?).

Otherwise patch is good, thanks!

Phil.
