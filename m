Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2621456lfo;
        Sun, 31 Jan 2021 04:31:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5xLWvI9Q2XYHa/ThC7ch4M62QUSpg7Nnw07s5pR6i1uiljYCX+IJgQPfKpJ2ypXXe8Gdi
X-Received: by 2002:a25:40c:: with SMTP id 12mr5286132ybe.255.1612096297271;
        Sun, 31 Jan 2021 04:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612096297; cv=none;
        d=google.com; s=arc-20160816;
        b=CrLw+VWmCgjIxITAWiOkoYSBhFU3/ms1LmakS1BphWCbpDpraAfP75QOlt3UcRgW38
         XTalI6ht91wQDVPpQrdrgRBK9VRPeft4a5+qDX7ZZ7ELvIPlOfafrU1IpBHbcHGfrwie
         XkG3PQA5llOVPRvRVsIjG9RUNMTehB4x5jk9UkDNwHzGMvW0X709chlHzrLGnEC2X99J
         HaaKDJvxey9JFd8cPVsIPbVBARsrcfBhF4MqLomJaq19UoaLNcCJulyiuKR9PVPJIb2+
         i8HseXWhXHcBp0IM19+gbxxM7U9A7JB7sr9pflwYKuhqcqpv2tzS08aeNqx4mUwHxoal
         HZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ArDxDd++XiL9ldRFmwikYY0GhMalIcaTHNsk/ofhIwM=;
        b=sStWyFNPCPL8sF/vkLMtxNmm9w++GUUj/T9GW5xOvWOjch66K8Klg2LrLZfRGAghRh
         4iBBLsLh4LF9R/lF6IOlcBKUrzoprPBI/cd33QfUyRP5rQutgGMgnQCTOdflY1Dvz6C1
         eJqLz+0VUKLWAg9Z6WTuxuAcZbLv8EElaob5xo1EmhmMZzBfAFKvyQNz5AW1piL44Egw
         EC2uJ+o+ReWjuIH3D1Fm8KdVElu6ZrTOHntu0hesqv8VpdCnxi1GMBFv95z+uKRTKQnn
         tFM6tSBA986Bf01S1nGPI7E2KmSa2/dLZDC438ILsoJoqFs+d2a/K7VCa/f/oisoFh/p
         Z03g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hK3zHJiQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si14944674ybt.319.2021.01.31.04.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 04:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hK3zHJiQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6BtA-0004zg-KP
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 07:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Bsr-0004zT-Oq; Sun, 31 Jan 2021 07:31:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Bsp-0005J4-Ib; Sun, 31 Jan 2021 07:31:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so13585381wry.2;
 Sun, 31 Jan 2021 04:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ArDxDd++XiL9ldRFmwikYY0GhMalIcaTHNsk/ofhIwM=;
 b=hK3zHJiQXtURacBXGDySP+Z3SC/dAu9hf/955L2cPsAbu1YXQsxqYQG4djm3dkhBpC
 HB06dFCsASoClqwQnLryiiOrJ6e5HF2g/7K1GSBSY/3Hxkpk0/pWjQLKTih82B0an3Y9
 7sXwUcENXuFJg/p/h5VCkZgJr2duuo7cM7vL71GEh9rIqDIOJfyXOUnU9dc3XD0/IDZB
 /j7MeaZ5c/+r4K8hvT6A0DfwofBNdevrLPCsYGegEj2VhtN8a8+KZpQsKeFWXosG2Skw
 noo92Kq2qSFEAHZHerrW+5OxxxM3TynUat+nnALhMCyxTd4iL9Cz5nFvxV5as9cRvEke
 oZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ArDxDd++XiL9ldRFmwikYY0GhMalIcaTHNsk/ofhIwM=;
 b=WyrIemGdQ26w6xbBCVv3JoT4Y81Idei7Pa5xm2X/SuTo00deIql9nxJu5X2F9djruZ
 yTEMIr/GP5vXeLi3aTJZT0zZFJI0nxhHa03+bNqrQUEZmS3cePYiwouLjrIOC+bQixvA
 s0MRvjQQKWIMfcGFEmSwiu5f/w0vPbv6/2HkVXzxBGAamk3TTa9Bpc4sXI4XbmPdxx7r
 yXgC1EmrxjNwRDwj0ke2IK9AuzeuQW9gDc7W2ipO1hljnw0Dksks6lhJeLo/MTNguw+A
 8zLsujBil/E77jfey2Nis1G/wO4UAyZg0MZaNGpzx0s3dWW2ZCP+h65xR/CtB9o5wwuW
 PExg==
X-Gm-Message-State: AOAM531RKq1H6Gmyj4OaiNUZtRuR/ULH5mCx4dpq4birCObHNDpj+Ta7
 HYS8DQq9/y8CHxwwNI7/GB8=
X-Received: by 2002:adf:f749:: with SMTP id z9mr13137870wrp.327.1612096272524; 
 Sun, 31 Jan 2021 04:31:12 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u206sm7468795wme.12.2021.01.31.04.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:31:11 -0800 (PST)
Subject: Re: [PATCH v2 5/7] hw/arm/sbsa-ref: Restrict SBSA-ref board to 64-bit
 build
To: qemu-devel@nongnu.org
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a741601e-8ad5-99ad-decf-14dc007900b8@amsat.org>
Date: Sun, 31 Jan 2021 13:31:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131105918.228787-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l3hSrVVEs7J2

On 1/31/21 11:59 AM, Philippe Mathieu-Daudé wrote:
> The SBSA-ref board only use CPUs available in the 64-bit build,
> it is pointless to have it available in the 32-bit build.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Radoslaw Biernacki <rad@semihalf.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/arm/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index be39117b9b6..059ff7382f2 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -22,7 +22,7 @@
>  arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
>  arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
>  arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
> -arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
> +arm_ss.add(when: ['CONFIG_SBSA_REF', 'TARGET_AARCH64'], if_true: files('sbsa-ref.c'))

Please disregard this patch, it shows that my other patch
"meson: Introduce target-specific Kconfig" is incorrect:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07989.html
Probably because per docs/devel/kconfig.rst "devices are usually
``default y`` if and only if they have at least one ``depends on``".

I'll try another approach such:

-- >8 --
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -227,6 +227,8 @@ config REALVIEW

 config SBSA_REF
     bool
+    default y
+    depends on AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
---
