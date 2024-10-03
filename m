Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1530667njl;
        Thu, 3 Oct 2024 08:54:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW04/NE/Xt40Nfqk2/9mb0x/uM8IOfvNHN8LgYySsrG+BLP4SdT3xND5YfxoBxCdYJDMeMlLsxunDTlzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGIY9vH2vIRaFytPAr2Oyxh/UFrUyOb8vWi360br/pNyeEZcgpu8xCDP9fBmmIPNcR6qNu9
X-Received: by 2002:a05:620a:28d6:b0:7a9:b55c:ceed with SMTP id af79cd13be357-7ae626b461emr1101577185a.12.1727970889290;
        Thu, 03 Oct 2024 08:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727970889; cv=none;
        d=google.com; s=arc-20240605;
        b=ceMPPOyS+FJj3FWry4iIMyJWQG8/f2t3Sh43Jm/jfFh4HGSJ6FfLjKOGM2Yb0cSmhf
         LUotbQxSBIdM33t8jMp5+W5aMozn4miIdBWB9Ec+dNqF9Qmolo1eeFP+ilmKChq2+MFT
         fgga/jyptesQMUcwJ1uCHDK6cbWWGMa0XCCB4xGZziWaQqL2fHKCnxm6tVILHQlO8/y7
         huG8+Wr3NaawbC4JPKoF4KGcvWY6EhE90w0FM//zQpGJm7l308IIC3Z39d7r1Z88lVbV
         KmfpMCRzVW9rvp20hNMUDsuWmTr9IwSVqRjQqUsoocex6AqqYjYJh4I/3ZTnZvqS88Vp
         9DYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=APlSNHRKvXFou5Ts1BnGZEWqHMevuN/wl68E4bPbLxg=;
        fh=9h9d42od5qNc1/2GfZBFuj52v2PCZsH7ZnoZwrvB3w8=;
        b=lxW/MBHSg55bcQlovuZcREHSNaYGsRxiG1zC2ts8Tic38EaD3qRiOJcIo0gXjJA32e
         jLT9+FI3T8n0Vzsv3fB5GtKtSgfDGMchs0EplUllll2HCyI3cP0TagM9a/5uvVl9x2Vm
         oI3EBM/V2owxJVQ6G5+/o/iOf0+xmR/QUML+ATpu23i11ydrXwxR+iTK3ffIr8UuPIpZ
         yWJvpHTQPOAuD6S+L4gYAmjQO2T+UHT35tVgAtzYXvUO1fh0D5uz6Gqk6Uve/TPeX/RA
         Q0ncaFnVcjertdmNyREP+sTsR4RaS5Z6OqKRNn4OqVHnJhL6KhuIkG/Do0yT3G47HMiq
         BcrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b7kXIzPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b747493si121970285a.137.2024.10.03.08.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 08:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b7kXIzPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swO9R-0006OL-Kh; Thu, 03 Oct 2024 11:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9P-0006Nb-Rz
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:53:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9O-0003Ka-DT
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:53:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so10516875e9.1
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727970837; x=1728575637; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APlSNHRKvXFou5Ts1BnGZEWqHMevuN/wl68E4bPbLxg=;
 b=b7kXIzPdvh25Y+UlcBJYNlfbjSMjEoccoTICB8cuSgbr73XWpmMcpWeA+nAI74VZj0
 Y4dyXch31+INx56Lkjee4Z8S6+hlQ2c+lgiaYPLXTiIIX7Z9FLi+8LwDYu3jkv9/CrPv
 +awMQIuWTt1Qlro7lYFX50mWQ98S5aLGSewLbq1SlTQ6YDQG1mnZLel+UNlIZgMTNPKz
 bKl5fsab+AAfAYqEs36Rq6D9DKvXplKLDiar2nCkrjw54nzLIKztHNs5JCbpLzDL7plh
 OWJDHRaVR987csa1quRkQ/Wk/jJ/To62je9ZhbEzQikG8Urgzlm8QMzFa5ITS9pMY9fb
 dG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970837; x=1728575637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APlSNHRKvXFou5Ts1BnGZEWqHMevuN/wl68E4bPbLxg=;
 b=sZwtayECoPMuYcibxou7EEVeH4FtXb5nnzHvcn6L/EXG+/TvQmJf43A4Yn1mvqy9SM
 aUqX0fHA1g8tKQzfM3qhykXFH5KvYZa+AVx6TV8gLfwO6dxTcQBkFQPWlQ9wdhRq399I
 RgTJYOFzRIvRGmqiO4U/YEXqWXPgfPYLbMFJnAIvNAkFTM0zVqoAFmsNwuceVNr/doWn
 l1sZ+SnI003wWeJwyi12+LTgqznI2+z9qHuT7L0gpmDiIfZ7PUyIKeQ7dEJ2ZEX5VfQ7
 UhNumNs9G1/xBf+h8AYMVqQQOXmjuTuYcWPwbP3wfELm+VKf6thaFcxC50eauHu7MlwP
 T6gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Zhn4YkroGsEZkhjNCBwPTkP/M1xMzpN4FsPZPoEQuOFcGIC5Xjj5Jl8blRmv51m+DTmT5+BdZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzqE4fDeQnLaYeYfht39+gNlK+L/lpmqV2UN3B9yhE9iDdfK9OI
 4ErqhZuGaK5mvbk6zM3HXWrq3QZdrcmnXHGOdTE6TsVM9K23nlboi+eLr+sprHI=
X-Received: by 2002:a5d:5341:0:b0:37c:cd59:5a6b with SMTP id
 ffacd0b85a97d-37cfb8cb7b9mr4845866f8f.27.1727970836707; 
 Thu, 03 Oct 2024 08:53:56 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082425f5sm1544489f8f.50.2024.10.03.08.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:53:56 -0700 (PDT)
Message-ID: <eaebae31-7e4d-478a-a064-dbbeb7943355@linaro.org>
Date: Thu, 3 Oct 2024 17:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hw/gpio: Remove MAX7310 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
 <20241003140010.1653808-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241003140010.1653808-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: EiNEydcpPy/W

On 3/10/24 16:00, Peter Maydell wrote:
> The MAX7310 GPIO controller was used only by the XScale-based Zaurus
> machine types.  Now they have been removed we can remove this device
> model as well.
> 
> Because this device is an I2C device, in theory it could be created
> by users on the command line for boards with a different I2c
> controller, but we don't believe users are doing this -- it would be
> impossible on the command line to connect up the GPIO inputs/outputs.
> The only example a web search produces for "device max7310" is a user
> trying to create this because they didn't realize that there was no
> way to manipulate the GPIO lines.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/gpio/max7310.c   | 217 --------------------------------------------
>   hw/gpio/Kconfig     |   4 -
>   hw/gpio/meson.build |   1 -
>   3 files changed, 222 deletions(-)
>   delete mode 100644 hw/gpio/max7310.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

