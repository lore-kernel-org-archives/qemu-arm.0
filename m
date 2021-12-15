Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp231287lfj;
        Wed, 15 Dec 2021 14:21:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRj91vU8FT+XtqDgjGQ+CglhgYGqRotBrEQYADSNruDn6QBMsqsgSaQxTsOix4zx92v6dU
X-Received: by 2002:a05:6e02:20ca:: with SMTP id 10mr7968195ilq.246.1639606879841;
        Wed, 15 Dec 2021 14:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639606879; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLpUrXqgod5+N4uiTcel+BkoPwI7v/z4QaGNeWTeAHO5DrjaAKe+9ruVDUD/Dop8oL
         VKop/cBfkzhs7dfAwbPOUi++oEXqJv6FpYd0iS/8OkLVw/E6kEgX71RClEubmktHyjsf
         2hU41a2K+T0WHJt6dgi9Ce2Wtrb01RC400cwVuCriXeOWvI013RWW62aFe2BLyOtZU/S
         jor1oIDHw0PY/O3v0RqCWoiUVJLny2UeyIITPMQu+AUJBUGlYiYN1/RuglDpQFhOw+wY
         13a0sm7FsVocL5wx7b41hCqw0ehElAKzzEw/BOIGxoeduOWpqyTeDVDUv3h/zhQuLnNU
         AROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+GlEXhXwiWFXbTE6WjQ9EKW1zI78ROMgwUVYsGvObe0=;
        b=JXMvYvn35CgUzQ4zna2TnKxTqMj97iX3GXUpT5SUD9q1oQ5czD/PG+h0hFi+r7R1Mj
         SVfZgKCK5bxwBo4cqaU4uFGVIO8jBc3jQ11LvzkgqQEOhhthNOWyx1rIExzQYjLrpOnj
         rV+F1pXSPrdZ8S3sO4QERa1GDic0m8vb5E6iTSLiKuTIGzHli6SkqWrE5LeLRfIsbtPC
         cKhirJj0HVx4z/Tuh6ITfXcTIF471BmVZr8tN7WBF0PTSx1/M6sWJrc3RLvBRA+ya+Yt
         StoI282H54Ml/xOBex+1ytxj+aG39i1FQn+MQ0FHPsLtAsQ8iLoi2V3k+LVTyl0BRDPU
         eIwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KG0Ss9eL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2552610ild.84.2021.12.15.14.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 14:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KG0Ss9eL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxceF-0001N2-9r
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 17:21:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxcdw-0001Mb-9i; Wed, 15 Dec 2021 17:21:00 -0500
Received: from [2a00:1450:4864:20::32f] (port=34737
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxcdn-0004Fu-Mz; Wed, 15 Dec 2021 17:20:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so535337wmb.1; 
 Wed, 15 Dec 2021 14:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+GlEXhXwiWFXbTE6WjQ9EKW1zI78ROMgwUVYsGvObe0=;
 b=KG0Ss9eLFW7xNsrd3W5zmqGoQ1AjXRY1cKVu85rugCfGu6KYVzqLvsh4dEKKIDvIi2
 oMX3/ENtCle0IGAuH5q7xldYv0iGCBigsqGtSz684RVaeEc0jiZsjQhg81rN/DbGeGaB
 tEbTzFUrs3t+oCzh9yZ4RNhEwBmgn2md2cjANY2iNe6sGgxUbUwvVFyekm/06kKAtNdH
 l0sHnqcv0Pi1PunZZkCfr47zRCxt7SEFSr+EvrZ0zWGoo3sWwZKu9k50h6viSYnV7cGW
 phz/Vc1G5Wq5JXKzGQE/9pvE3pOPHTl7mm9BjBUXBVpNYS0LsnzpxiDZYKskMCPBeyIM
 gN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+GlEXhXwiWFXbTE6WjQ9EKW1zI78ROMgwUVYsGvObe0=;
 b=cscj7XBG7d1nurR4Nift7VvwQHY1JeYqXCpjZ3yK8qGxWHau3ObyRy8YfQeVxwA595
 XYeTdg5KLQy0QTEdFekpwTaPggyTCsmkKqUjIHvxuL2mrTKZjH0476+fuDuI/dTUTB/S
 oTBtUj6GaRVv39+To0Ir7JmxkZKbljT/JmrCWJCu8keMdymnBz92+GeLc6c3U1VkzjYD
 PuC8Z5A4fMzeZdUk0jhpIMQLgCvjW2NzBiSZNJmE3XB1mY9mWcxnXgDsetLJovLarr7c
 GMOvfzS3JEbK/gyaWvQM9+qrBa+qkC9+rqhoBrBapQng3HXiHkzLnVmTe9zm2jN72AYa
 B8mg==
X-Gm-Message-State: AOAM531dTMfyxLpoHtXzOJEv5oXbfAt8MpEBB8AIlJ+LT2TujpqrKfci
 vEWbfu3dh0N3zlm46GeEvDs=
X-Received: by 2002:a05:600c:3b27:: with SMTP id
 m39mr2217085wms.132.1639606846039; 
 Wed, 15 Dec 2021 14:20:46 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o4sm695313wry.80.2021.12.15.14.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 14:20:45 -0800 (PST)
Message-ID: <a451141e-e5b6-6dce-270c-458bd3a32cbc@amsat.org>
Date: Wed, 15 Dec 2021 23:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Ast2600 emulation
Content-Language: en-US
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
References: <CAP4GjT1kgpr+EoecEVdXuX+sPL-27PKPm-9J-E3_DwaHwe12GA@mail.gmail.com>
 <c239b30e-fb83-25d1-2649-a5285f97f9ad@amsat.org>
 <CAP4GjT2wU_-N5jTwNWdmOL_5gVOwXh9sFK-=J=JR2xEYVmK6=w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAP4GjT2wU_-N5jTwNWdmOL_5gVOwXh9sFK-=J=JR2xEYVmK6=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZUORMl31bNM

On 12/15/21 23:10, abhijeet inamdar wrote:
> Thanks, I'll check it out. 
> 
> Can we do full system mode or qemu-sytem-arm ?

You should be able to do full system emulation (qemu-system-arm)
with 2 Cortex-A7 cores and 1 Cortex-M3 core.

> 
> BR.
> Abhijeet
> 
> On Wed, 15 Dec, 2021, 22:38 Philippe Mathieu-Daudé, <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 12/15/21 22:24, abhijeet inamdar wrote:
>     > Hi,
>     >
>     > I was going through the aspeed ast2600(not evb) it has Dual-core
>     Arm A7
>     > and embedded M3. How can extend it/implementation in the existing one.
>     > 1) Is it possible ?
> 
>     Yes.
> 
>     > 2) How can I do it?
> 
>     Look at the Xilinx ZynqMP ZCU102 board (4xA53s and 2xR5Fs):
>     hw/arm/xlnx-zcu102.c
> 
