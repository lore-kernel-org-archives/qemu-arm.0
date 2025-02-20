Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp380224njk;
        Thu, 20 Feb 2025 14:23:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUN4SnA8Svme+1+ycJiSiK6M8fVF8bu/+rKObgntcCTugpBgrf1Eai7ziQYOHJ7Z7Ixr1h3OHHSupSuDA==@linaro.org
X-Google-Smtp-Source: AGHT+IF7IcdkXGVQp45MNAiA09kXUaTIz3+jnRuC8sxtDh9liSmBkZzFAeXPb2cUZ/O5CttBgINg
X-Received: by 2002:ac8:5f14:0:b0:471:80ef:35e7 with SMTP id d75a77b69052e-47214ffad1amr66827871cf.4.1740090238280;
        Thu, 20 Feb 2025 14:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740090238; cv=none;
        d=google.com; s=arc-20240605;
        b=ilVOXeBy/uCfGEhHct6OAIaRlWS7tIrrsEQLsuey0JMHg2iAdLq0EmDpPnpL34AwOw
         x3tKCAljfBdfBM92a0erp2Mk4qfNEkO5wox3WOQq0gveXYnE5T5N7l05/AiLRRD7mrl1
         78Y4xfxIYmP2eQjGsYwwXIvyJryMIpI30HsFQgJDyd1TP00/jpalSdyRDUTCS8MqhE+i
         Xu8dOeBVh9ORNs6TtKSdrlRmno52U6MElOrE3C6BouEz9ICWlYCUoW3aTpdcNc3buosy
         IdPGfv18dkUC03JqJE7MWTNwsx/J3GjPEc6NminHRTDUVBkIawbDB8pSO/tz+De7OwqM
         bGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xfmW+7Rd75vtwonljeaStfGCcd+krv7ye+cqnLwDETI=;
        fh=e7wK2SF2YtemLv+KDhpwrwsNSE6YnLNZyzV+3Pe+nPY=;
        b=egkfa9GFLvY7tkCpskxfIxZmM8+aYqsWUDHPe5hetMbZEy0AddaY7jgu9gQEsqavnL
         CM2tNqm8plssW50rxxuW1RwJzqSAYO6f4UTi+bPqgr4Bzs0NgjlnYMLgm336Rte1hlIF
         Zxa18KWGMXFIxF2uy+9yq/29xeLRWBAooxj0/WnxtHn7LEJS7jJey5r4mAigMXA88VYM
         1mmWXLPqjQpq5ViLb959ZZ03qCtR49Dv6g0JaJiadbOPvshG9pJ1WeNUf0YnXNPHkYcr
         +xDMKB+xKfO9FCshpba1t23t14HoUpDt/LdPMqUrJwinw0kwtqiW6dlXoYiQ13v2Ue+h
         EwpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZsbvutSv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-472189dbb90si17103631cf.473.2025.02.20.14.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 14:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZsbvutSv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tlExI-0004bn-CR; Thu, 20 Feb 2025 17:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlExF-0004bI-T9
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 17:23:38 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlExC-0004ZN-4V
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 17:23:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so12795495e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2025 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740090211; x=1740695011; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfmW+7Rd75vtwonljeaStfGCcd+krv7ye+cqnLwDETI=;
 b=ZsbvutSvqLWsx6tCXPgQje2uwt2z5fGSm2F8o8mKepevCz9Tf0xnOa21u+ick3YvA+
 5KALAqvlZSwjxTwQJ2FKQafGANcRU9wNuJVt3Z5Q6M+dMlS3AhC0MxBlzrODwepCYqnp
 x1y2iIMFdzZunstienEss7CyeNaxbRbEo+aFwvJ6BXsWrABNsAEeB9t+HGBFikS4i25t
 nrvtClPZQ12v7uFiN2FwDR5nHB5x2lOcFE2J4o/LpbmGwfDj02fHKiSysOIV9BmwS5A+
 BTsMcfmPD5T1hdn20sKjpVahAkNHAEvTxO1gBsK0324M1v3hCJkS6ZCxvLY0O+Ctxc/t
 q5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740090211; x=1740695011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfmW+7Rd75vtwonljeaStfGCcd+krv7ye+cqnLwDETI=;
 b=ej0M7M8Q+iinC6oqNq5OmwZLknFdT3BZJNieXcFHz4wE88x3vB31SFTG24ll/MrPgI
 YuPNvxWSwMf2YAoBSK0VuEko8aQ/FHjRmgIpaCv5l/CzfcNyb+zUGagb/1ncx6Q04LPh
 4zNQd50Idb7S/C5fyVt90n5BAAiV8zcJGpKXmwLXDmvUrkoVjEICPF/giuYfsadJh8Mu
 EMZfutF+Ondsrvpwu9uE/CMUwVLH8r8C6B6B9O51O0lUvKvJUNDMeL84Ah1Z0Ijp1Mzq
 tOrnBpF2mjU7zyYA4ZBQ6ATso3SDNSMP0Sx5XLGDO4LXVEgXpgOj5d/MBVV2d1a7qILf
 heXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3CQQh1J0qxXUxIlZwS2ybC7WtRT2hdx3ca2rEcha1IDkL+0DQhLX8XhAfXI5FZi7agADRpwxBVs72@nongnu.org
X-Gm-Message-State: AOJu0Yy/7lCMuYc7ilaCh4ttowwy7c6R5DWuXR9XPJjmemajgiR6EMgk
 0ocj+MkBz0KKWQaQ2I7+IswMlfeJoJQr1NrjAjx/Tsy5EIwlExMKKgN6iRjVjtU=
X-Gm-Gg: ASbGncuhRIGiNPjk0qrAJay3MPYka1NBo+HzFDI4LuQ2r8iy7sLfRJnaBOS7MLMaFie
 CqSDqQsOU0/8CZhwzwH5MyZoeUMA6BQYgE2atFbKMdPEcVxIZ3i7d4+4BSzSxy90qXEgdfExua4
 SAxUMXXOO8fxXjLVxCr/RmOmNHq9+/XqNRGfX/qXqocI5YS8nuGBk6YaxPzpuWtDboOEEvpDdN4
 l14+ano8hcfpQDCt4uwqCx1ijZ2AHcfx/h0nP1X+yGvyr3260b5aBS2GlFAljxUOXgSBAUp/quo
 2gPo+UstDI3KS8foMmUhYw+VyDhHKvXajAngP3kW7NDJRGyEMSSdNs3MID0=
X-Received: by 2002:a05:600c:1991:b0:439:6dba:adf2 with SMTP id
 5b1f17b1804b1-439ae1f1986mr7420095e9.15.1740090210974; 
 Thu, 20 Feb 2025 14:23:30 -0800 (PST)
Received: from [192.168.69.157] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399c41022csm58495935e9.40.2025.02.20.14.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 14:23:30 -0800 (PST)
Message-ID: <3637c187-0bea-4eac-9b45-c5f7cdb3e05c@linaro.org>
Date: Thu, 20 Feb 2025 23:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20250209103604.29545-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250209103604.29545-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6EtpBZCdLHeh

On 9/2/25 11:36, Bernhard Beschow wrote:
> TYPE_CHIPIDEA models an IP block which is also used in TYPE_ZYNQ_MACHINE which
> itself is not an IMX device. CONFIG_ZYNQ selects CONFIG_USB_EHCI_SYSBUS while
> TYPE_CHIPIDEA is a separate compilation unit, so only works by accident if
> CONFIG_IMX is given. Fix that by extracting CONFIG_USB_CHIPIDEA from CONFIG_IMX.
> 
> Fixes: 616ec12d0fcc "hw/arm/xilinx_zynq: Fix USB port instantiation"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> cc: qemu-stable
> ---
>   hw/arm/Kconfig     | 6 +++++-
>   hw/usb/Kconfig     | 4 ++++
>   hw/usb/meson.build | 2 +-
>   3 files changed, 10 insertions(+), 2 deletions(-)

Maybe "hw/usb/Kconfig: " prefix in patch subject, otherwise thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

