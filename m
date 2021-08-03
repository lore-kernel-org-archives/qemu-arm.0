Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2821245lff;
        Tue, 3 Aug 2021 12:29:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbiVVLh7O10fKepX0Cl75VpALsvYMjir5uJIY4fCVuEQa3MDX3LrDd/VWvJkDrFcZTzKqE
X-Received: by 2002:a05:620a:1242:: with SMTP id a2mr21934005qkl.443.1628018964046;
        Tue, 03 Aug 2021 12:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628018964; cv=none;
        d=google.com; s=arc-20160816;
        b=vb/WrNe3bTN5WUbFTu+W1ikIMcylRr+2g8EFur5QMOeszwVEjJLtdegleSScvt53mU
         uBwOYWQ30DNRzUrtwtXzRxcv8lW6nr/nWpYZcQoECy0hbG3QwJWbvy/h0p0HEuzkIjWs
         F+N8qvi07B/3eXgc1pH8yeVofrCf459yx8SORWPWIqPbeJO4mGikqORWMtMdBguZjk3Y
         yO5olk0G2gdNL7hVrZH0K00950I6eHh5sGBN6OQQ2wvKdZGgx5PhZD196iWpM2ACmcP6
         83xd329O+qhVwirueMxVjkdyj2k2dmYzx4kCNgZozWW6LKtQoR3vx9IgwXNHmQXy9xsv
         s3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=hCt/p285GDyqfK5dT3U1VthaMi2qbsLlMqm0Y1PJrcI=;
        b=sn8eGbUuck+CnHK1t7xi8Y4wkD948Ou0r0XFDxTx04JZZ0CIjf9YT8WSn/nlMIsYGi
         G5/Aj7KMXrQVznj1nTD7kTK+92urcUNPRPPJZlLZuAcFpTqebjJFyG0QPCfgMuIm4B1N
         2UuyKSY63bm7C8nn/fY6DH5EOBNbe7iCqjCK0oHPAyazDsLweIbISW/402aldBq2zGxG
         dWLvbM6Dn36Pm/v15ago3kB+WoldKpW5nbyIarAOoN9477mChWKBAdyWi63ko8bw9qkG
         u8mRCbtq4z2lLKK218vqbsBjgWmb2jmNlacy8r2RSQ5Ddfx53lAdSvrxK7MltvUdXxOX
         P9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=cEJ4oov4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si8620898qtt.147.2021.08.03.12.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 12:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=cEJ4oov4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mB06N-0002WE-Cp
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 15:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mB06F-0002Vx-Lb
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 15:29:15 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mB06D-0006cn-Mt
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 15:29:15 -0400
Received: by mail-oi1-x233.google.com with SMTP id t128so58729oig.1
 for <qemu-arm@nongnu.org>; Tue, 03 Aug 2021 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=hCt/p285GDyqfK5dT3U1VthaMi2qbsLlMqm0Y1PJrcI=;
 b=cEJ4oov4U9Jz5w7IVOWEPdRh9d3KgatHiybwLwx+lfy/y4RxplZLTzkdrR8GSaFDJx
 Z36/JohIkQdKjE+nRgbbR7AZnxfwgjWmZC6zrCs3de0Z2eXVlPhUqKcSN/kMe8Wg2BkW
 3NqSPqSLgaBWlxOOg0ZNHhFxH+DcBn6Dhea2IhFwxJJyXVfYsCQZLCy+rOSTm1PvXhL/
 WaRzqKw3JbpB4lYqzrwWXATec8SM2wMc3MsMur8xP/K8G60rl9EepoNqYAl6FgV7Hytn
 NbddbXimRoLAWw6q5iucGfYVExN7/f9XEPdwnkRmXPiAKV8opk1zPHNUWW+NeMpyvZ7S
 tO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=hCt/p285GDyqfK5dT3U1VthaMi2qbsLlMqm0Y1PJrcI=;
 b=PUijedM1rtniCnw38KxPfm4x0z2UXOAIt0fbWuws16SPjF8DEYvePykGo07YqGldR0
 bQbdz3Nh+baBnS2wroF/XGyewPOMMZpnEu14erCQKG7kFD14SqsNOlU1jzL5coZdJrLb
 pTn0r9TgH1luhWpwVJp+/XhMwr9+yKHU6F2TTqs/RiIOEXG0Qxh2fyZk+hDDRx1SxYmE
 giuxWXi5uHWCyzdR2AxCbf9TBTZR2eUZfwaSHdTaJvgNSR78V7qzufOxCzgNB1KDDKQ2
 CjCPobwjlScEoSeHO+748sa0o0Xu2RaKoN2Q3sR/133u2GKsNrIyHRq5groa5BhmmRhV
 F+CQ==
X-Gm-Message-State: AOAM532o25x3/xUS60u9DupciVLR2lYvaGGw58daJfbh5I5nSb8HdchW
 ZbAYizpc6hiOlDu0V8C+y8/wbg==
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr9497839oig.52.1628018950392; 
 Tue, 03 Aug 2021 12:29:10 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:2d69:7978:778e:9e64])
 by smtp.gmail.com with ESMTPSA id j20sm334625oos.13.2021.08.03.12.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:29:09 -0700 (PDT)
Date: Tue, 3 Aug 2021 14:29:08 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Shengtan Mao <stmao@google.com>
Subject: Re: [PATCH v2 0/1] Add remote I2C device to support external I2C
 device
Message-ID: <20210803192908.GU3431@minyard.net>
References: <20210802230323.1164787-1-stmao@google.com>
 <20210802230323.1164787-3-stmao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802230323.1164787-3-stmao@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 qemu-arm@nongnu.org, maoshengtan2011@gmail.com, crauer@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: phEyX60nbIdK

On Mon, Aug 02, 2021 at 11:03:22PM +0000, Shengtan Mao wrote:
> This patch implements the remote I2C device.
> The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
> Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

I apologise, I haven't had time to look at this, and I'm going to be
really busy for a little while.

I looked it over a bit, and is there some description of the protocol?
Could you add a reference to it in the code?

-corey

> 
> Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
> It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
> The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
> Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).
> 
> Shengtan Mao (1):
>   hw/i2c: add remote I2C device
> 
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
> 
> -- 
> 2.32.0.554.ge1b32706d8-goog
> 
