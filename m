Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp344171lfg;
        Tue, 17 Aug 2021 02:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHsOZWv0wy7IdLGIj50hUuxOgAEQTlGJXbNb786hNH/0iulV9S2onNtyH8Mw0e/KuWiNhf
X-Received: by 2002:ac8:5dd1:: with SMTP id e17mr2185719qtx.270.1629192479925;
        Tue, 17 Aug 2021 02:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629192479; cv=none;
        d=google.com; s=arc-20160816;
        b=WslG2hNBbiMh64B0tD24ro+JlVK6qTAMH2bPWnW+9RUj3QyAruNkVrYi9WnBsX3V7S
         jrnUW32EhA5KyWvcK/bE1xG20VM+iapELNUKWvt25jyK/M6KmOQnDsAbbfsEke2sbKek
         kYAOGxM1AnJOl/b7GGhGM2tdEeyxOD1mJfbckos8pCivvz1V+0LOZrKfMjnJI8X19iBd
         ULkmybiPelhLc8W8d0tq/+c8ygcxfNYadbCSWwOc3FYWHK6qHdtzfpbiC5OfyNUS6qDy
         DaR4VliWqODwJrN+uTIXqEyVEfBbn2m8rAyd2wJET3SNev1gMKkkpufrwRp7DoOu01Up
         B57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VKaDF7u5HHiOZCtyvL2Sz6YSRbQdNiVs0ysFHxjpyes=;
        b=VHMf2h1bddt1n9ykxWvGrwHeNe8hEzX4ztQxlO/JMYYM2QMQXBzqRL/ux29sSbrRi3
         QZ7jfS04z2nQlElxjmhd0kOqF5Bwu9+FH3M2ab+tqA4btkz1x2has68JLbtaTtiY4/ZB
         Gi9arzxdOgzZqlilMy/o8eY16viJC0zaIwToIknRP9gHNW4XdVFqfBevxJOvtJSHw74T
         DdkckaN4UgZipS8CiWNY5wwWUbXQjbSGcLQWJ5BsGuOfkjfe/kgb+PxcWweWzGJP89LB
         6vpseOJbxBkHPAC/hr/iLfpV6/sGZJwdUxKucU894C3WP44XSx69t2OM2F8pd6CF5Ei1
         ikag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=Jysw8AjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si1228634qta.3.2021.08.17.02.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=Jysw8AjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvO3-00040Q-8A
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvNo-0003yY-DQ; Tue, 17 Aug 2021 05:27:44 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:53860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvNm-00065c-Kk; Tue, 17 Aug 2021 05:27:44 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 1B5A1C6019D;
 Tue, 17 Aug 2021 11:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKaDF7u5HHiOZCtyvL2Sz6YSRbQdNiVs0ysFHxjpyes=;
 b=Jysw8AjPcuJ2rBJ1+cRz5/aFheIcvpYW7MbYVev+j/151O7DltfVDFAHBjjA1Fxq8UK2Tm
 70DSwX8/UyjmAXf9bw/PlGfzHGrmEiwnSjuXxyU21BvM61tvZQsaSsSdH5hu+Ht7iuiWW8
 waU+BzLn0237SOuB5rmAUI4C/sLwntEtDm6lkJDme93DMZ+v82smmsSf11Dkwu6BrMHmAU
 RJMZzul9yWW65E5nHNd5gbkb3x1Ui8lXkEZo4czBiYnz60LTszm/Fdb2zdOnM7WFEGGdQ9
 6Jge5WuiJr8zpdlCQNbdL5Qs9eYPNfJdJL6CCMsJDNxoR+rCJZzX1tIA/uuy2Q==
Date: Tue, 17 Aug 2021 11:29:52 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 04/25] hw/timer/armv7m_systick: Add usual QEMU
 interface comment
Message-ID: <20210817092952.pbolh7c6a2724rvw@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +itYs/NvtEag

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Add the usual-style QEMU interface comment documenting what
> properties, etc, this device exposes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/timer/armv7m_systick.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
> index 84496faaf96..685fc5bc0d7 100644
> --- a/include/hw/timer/armv7m_systick.h
> +++ b/include/hw/timer/armv7m_systick.h
> @@ -20,6 +20,13 @@
>  
>  OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
>  
> +/*
> + * QEMU interface:
> + *  + sysbus MMIO region 0 is the register interface (covering
> + *    the registers which are mapped at address 0xE000E010)
> + *  + sysbus IRQ 0 is the interrupt line to the NVIC
> + */
> +
>  struct SysTickState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> -- 
> 2.20.1
> 

-- 
