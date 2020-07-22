Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp895497lfm;
        Wed, 22 Jul 2020 10:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEKGLqPJtwJKoveXI5QeiWUMxpT4fqVCWYsBzNn9BNm9nCE1LCVeZsy3eJ50Ya8UADmctK
X-Received: by 2002:a25:31d7:: with SMTP id x206mr494226ybx.511.1595438595623;
        Wed, 22 Jul 2020 10:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595438595; cv=none;
        d=google.com; s=arc-20160816;
        b=GvYnGPsDYXRF3QQF10BBkj/8icRIUypYYnN01g9NaR8WR6XMpOJb/9RbqIFSekV9SF
         dQVwTg6yHxH5JmuVBTkYPRQ5tzl0eL4+w9lJo/8vKhriQQzBPx0g3NMiUuyboUgAiPLT
         P0SYIR74Un7UwpR0CSut3bHkyLs8m2l7DiRMT539Htwt+uzazbQCHDKa8dC3VO7ek7ZH
         t/bla3Uwv42Hoa3mXB9apcLwEjJ83PPTGV2UlbcAf1KE2ijq2AmaBzUUDM+V5ERv9Yni
         KiEeplwf1ymHG4i07nA2PJt/iIkU9+JFb1oZSJqCPjButuc7+xz5fIJF+F6XaE3Xjtoo
         5ITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DuEmvlOWDAVAsYQc5yD3tjnTofa9xCU5lhKJUT3u558=;
        b=H4QweVE44zoVWrJNIkQS6Gezs2qlB/cxoYqP7x2Vg+XuhR6vZzCThifvDiyrWERZRG
         fyjjgf98pGAO58DyIv1tKXiBywtjnwrPBma0dF/JV8NEGRDmzUJYYbUCI5RwsPoRMepV
         jqnTKDgJcUCXIK1uL8hxM32FxXAIdpTNsg82T+aUn/YkgNnc74CNgbHBeCeWjhq7n8pH
         nBMDX/T36/yeM6OmcucRAG4Higdc5BD2PvbwVcrPhEDlUZAn5qCWBOAl4mtT4E6lxy0I
         QwzCVfS2mjmhDWmCWB7rrbU05ygTheAdUESy7/QPXIS2ve/dPHeTKru2ajmH9l+Ac8Jc
         DZxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nv4NhSrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o78si273071yba.97.2020.07.22.10.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 10:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nv4NhSrM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyISY-0007Ak-VB
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 13:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jyISQ-00079k-4k; Wed, 22 Jul 2020 13:23:06 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jyISO-00066M-Jy; Wed, 22 Jul 2020 13:23:05 -0400
Received: by mail-ej1-x641.google.com with SMTP id a21so3044296ejj.10;
 Wed, 22 Jul 2020 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DuEmvlOWDAVAsYQc5yD3tjnTofa9xCU5lhKJUT3u558=;
 b=Nv4NhSrM7B+vcClhBnRfyM0jWYLBBO61upi0DJJBEgFm+Qo1fYtvUuVFZR2i4Ba6bk
 a0VhYx7GlqfRQ/y6QNTzzpe5pvsnKCz5Gd39XFQJ13S9pgtX6j9/Sk3u3YXpBypv0B5V
 7aXW3dM53TFxeMdXjUoVfnZU92r5xsoCuZMkGyb6++qGoVb5GdpphJU6TrMxhXYzFWsP
 GhhuIHzWwgYQ2Mwvgb7nQxqa1exULeTbOmVsjf7/LY8OA49/MKaCJkhvvCNkXKRx9jpc
 L0E5RPxTQr+a0h7U/L9PpAjIZGAx+5Ovbyq6Dbny/7QUDg3mWYlu+6YwlW7g83Rug+XN
 uucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DuEmvlOWDAVAsYQc5yD3tjnTofa9xCU5lhKJUT3u558=;
 b=ig/dMTnDZj3rzT9+cotYpVjWBk7z+msHxkrRM/hp9ukNZspqXNhPczy8IIXlhL0kSL
 X4yUjHA7EiqYDOGgeFSnSGoCbes6yi4l4a/j3G5QC7QDqMm4SW60r3ta9SQxZwvbbBhx
 o0520FbKOIYfGCmh8dQJRHuW0JWOgeesIruWIoUwE7/CsqZoSr4S+PasFiFQjU7fEFfZ
 4qTvTDSL6AdK/rGpNchl/BcBor8DvdektgeuGBqQyykkF/kBaOUMz+74V3RriaSUUQkO
 a0pLSrHemBqQJK297UAwaQ4Lbi2IcUH133KO3DCAS1ZfK2+TF2Xb8hgbTE55dYhIlX/G
 RvYw==
X-Gm-Message-State: AOAM533VKYqiO5OT6cNtnN8u2jACNMDwwIziMT+oPazCru3008X8dNv7
 iWA//VZaIzHQtm1/Hhg206E=
X-Received: by 2002:a17:906:1357:: with SMTP id
 x23mr654769ejb.148.1595438582644; 
 Wed, 22 Jul 2020 10:23:02 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id pw7sm176854ejb.94.2020.07.22.10.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 10:23:01 -0700 (PDT)
Subject: Re: [PATCH for-5.1] hw: Only compile the usb-dwc2 controller if it is
 really needed
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200722154719.10130-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d77052d1-6203-d54a-0c36-edfafaa34922@amsat.org>
Date: Wed, 22 Jul 2020 19:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200722154719.10130-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0VOdbNaCdafk

On 7/22/20 5:47 PM, Thomas Huth wrote:
> The USB_DWC2 switch is currently "default y", so it is included in all
> qemu-system-* builds, even if it is not needed. Even worse, it does a
> "select USB", so USB devices are now showing up as available on targets
> that do not support USB at all. This sysbus device should only be
> included by the boards that need it, i.e. by the Raspi machines.

Paul already sent that patch (your description is better although):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg723681.html

> 
> Fixes: 153ef1662c ("dwc-hsotg (dwc2) USB host controller emulation")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  hw/usb/Kconfig | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4a224a6351..bc3a423940 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -315,6 +315,7 @@ config RASPI
>      select FRAMEBUFFER
>      select PL011 # UART
>      select SDHCI
> +    select USB_DWC2
>  
>  config STM32F205_SOC
>      bool
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index d4d8c37c28..5e63dc75f8 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -48,7 +48,6 @@ config USB_MUSB
>  
>  config USB_DWC2
>      bool
> -    default y
>      select USB
>  
>  config TUSB6010
> 

