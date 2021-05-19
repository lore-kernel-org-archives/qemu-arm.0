Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1787760lfm;
        Wed, 19 May 2021 12:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE+tzxFvUGsr6JkNA+pw2kEFUGmapRiKc8mjqxj6DCZcQI6NXPje4c1jkCEWxyaKr8MybW
X-Received: by 2002:a5e:9907:: with SMTP id t7mr1138499ioj.155.1621452467712;
        Wed, 19 May 2021 12:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621452467; cv=none;
        d=google.com; s=arc-20160816;
        b=eFnHtKRo0JnBpP9y/SNGX+HtV/ua6HtDYYd8zqcteCjJrVtsEMy+ehFnPlqN3oPhII
         atD6xFLpXlx1OAiX7YvG5P7K62wAw6BenR7ACAt6wp0D4vKA/9CJO3KKBM/88cKc6qhG
         uYQeLcSkIgTzNdLaV/C0V9/2mdvSKsATIaux8YjOqY37IHACUN14M+1xTmY99kTHUKKZ
         G6lGksopRKE3hO/goT33ceSOfhuVALdtsgkogVp/3kWOonVEDbNnOwxYnO6d4vkyVwJc
         l4UBK8BWO26RnvPsxswwDkrqUgIZO4jRK4tq+/Ol55XIcEbcgaJNXOuXky2sD9DqYWnw
         Z6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=O6r/FaizYTt5pKLmAwSHTTyKmxIOk51GrZU0CpZ3Cxk=;
        b=KKijZW0aA3WQaxjRtcDawyj8VJN6AGbY0T1azDxijF6grnz0w0t0CenP9FLGl5UhzW
         AUXGYpKgrFm4ytmJqUiW/Fx+3rgVyBi8vTa8ihpO/jD+4+AnBUSpTbZTR7qcpyannkry
         6iJkXzFwZ230WW+MdzYIsM6bbSE+6OHpczOT3d7szZBGwdTdB9SCRX51eWpLFHhbUgPj
         XpbxRIskqqq4iPf1d/eU+GF5A4TFgpx0JaS3BdAzxfI83EpOmpClM2o/0c6YCQD4CBm+
         YAO0hr02Ii44KrjwPdAZH12w53RzN7Z74bUKa3owvxW6ZH0B2wU6RikPtSllILyWNoVx
         U5YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VkgkKbQd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si148612iov.56.2021.05.19.12.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 12:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VkgkKbQd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljRr8-0007Bj-Vg
	for alex.bennee@linaro.org; Wed, 19 May 2021 15:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRR6-0002iw-Io; Wed, 19 May 2021 15:00:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRQx-0005FL-En; Wed, 19 May 2021 15:00:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id b7so7238351wmh.5;
 Wed, 19 May 2021 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O6r/FaizYTt5pKLmAwSHTTyKmxIOk51GrZU0CpZ3Cxk=;
 b=VkgkKbQd3tZM+pf/lzuEy+z4+GtSJxBGWtBHotcBUoFNeYZdac6Zqizwn2hQygIr5Q
 mEoacmfRNNBt+Hl6oIcL8FapNTzlq6ozNv6iI3Twij12tLwSaxC9HoIlEFCUSxTB6SSb
 Sj1IpLl/GBTUpfNUV9yHoN/MxRso7k4jF7UpyrhLMUdJAsH3o8Zq2rh8fMRxD7mA8URN
 xsXVNN7Yxc8QEz58LhXVXHw+W+n9UCXBuZ4bNE8cVkEZ0bEH75mIzx99dux+hqcADBVq
 FjcXwTaY1knoliYhRfqMLQOTA5fRd3Evog1cGuXz2E07K0cK5CgXbZ5PP31gasLJgX/a
 YIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O6r/FaizYTt5pKLmAwSHTTyKmxIOk51GrZU0CpZ3Cxk=;
 b=Dj6DROWuicAbCillWxF/w4ruwg5T7PXOUHXhqUpMNmVGiX7vXisClPYG6bH3uTX77k
 4SO77Az7UJUL/LSkm8DUI/S8ZaCXABzkUtb/BgKbmq6XsgEixEopYPFWaxdNKLhx3ktJ
 Ysmv7U72g1LbD4dg5naPAF/5y9HIsk3RrkqhwVK8N8aNTUZTxTdKOZEwVc1F9oB9PJuJ
 MGFbguUKRWdUeBAHpwEdZfwNweiTRRmsAb/8sNCIwzJHjF3odMSYd4iHBi3of1yrtj5X
 rDB/NrtTfEF8kXAW4WNg6KXOn7onaJVvO2u3zlV0tbD+T/HSHOf+iu5qA55dZh+Fupwh
 kOEA==
X-Gm-Message-State: AOAM5315kiD9oOi4QOIwB/fNHk2k4xVMvKEATce7RS09s1YgwXZgOBTi
 tWpODm6KQ5D6hdnAq06MtzU=
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr260624wme.60.1621450839723; 
 Wed, 19 May 2021 12:00:39 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c14sm226415wrt.77.2021.05.19.12.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:00:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89489dd2-ac9b-0bc0-88a9-a401ff37473f@amsat.org>
Date: Wed, 19 May 2021 21:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20200313014551.12554-2-linux@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: siA3hjYUX5xF

On 3/13/20 2:45 AM, Guenter Roeck wrote:
> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> and i.MX7 SoCs.
> 
> The only support really needed - at least to boot Linux - is support
> for soft reset, which needs to reset various registers to their initial
> value. Otherwise, just record register values.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Added Reviewed-by:;
>     dropped duplicate "the" in comments;
>     added new files to MAINTAINERS
> v2: New patch, replacing dummy STMP register support with basic USB PHY
>     emulation.
> 
>  MAINTAINERS                  |   2 +
>  hw/arm/Kconfig               |   1 +
>  hw/usb/Kconfig               |   5 +
>  hw/usb/Makefile.objs         |   2 +
>  hw/usb/imx-usb-phy.c         | 225 +++++++++++++++++++++++++++++++++++
>  include/hw/usb/imx-usb-phy.h |  53 +++++++++
>  6 files changed, 288 insertions(+)
>  create mode 100644 hw/usb/imx-usb-phy.c
>  create mode 100644 include/hw/usb/imx-usb-phy.h

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index bc54fd61f9..21c627c3b7 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -361,6 +361,7 @@ config FSL_IMX6
>      select IMX
>      select IMX_FEC
>      select IMX_I2C
> +    select IMX_USBPHY
>      select SDHCI

I know it is merged, but FYI this change belongs to patch 5
of this series "hw/arm/fsl-imx6: Wire up USB controllers"
where you add the dependency to the machine.
