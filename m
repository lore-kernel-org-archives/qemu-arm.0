Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5533697lff;
        Tue, 10 Dec 2019 01:03:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpa4GFxLaKIxYrsqx2p1HkqORi1yvN6AWIeSO6UYOK8KQQaIxk8ez8sTTD9sLrQf5/KmlO
X-Received: by 2002:a05:6214:18c:: with SMTP id q12mr27907750qvr.32.1575968580672;
        Tue, 10 Dec 2019 01:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575968580; cv=none;
        d=google.com; s=arc-20160816;
        b=Hf8+XkkYdf6mVTmK9tjCpXJ4Y5ZfxpAHfamOvNUmczsXXJCsMsc1KkCswUlEmeEVze
         9O/TazOzqJRrPyBJUNo7zxB+uNgk7PJ5SgjBUE0tRkaeM5MTvQCdXvJlNAZALTqYdmCI
         otrsys9tOoQhACiHo76jMzmiznMmigEpJydXV4WqdDEDZxf6OPH8we01gm1I2CmcVhcH
         NtYBtaDrdu4335+oT64GlJvv3XV9DhbMuWaVW+eLVwAxfS4PomBUnyc0iYq+W/1fz9Ty
         XdAcxNlu3T8ZZM79H2YsJc0jVEwmK/yitrrBKSC9J25h8rV9t7ZQE0zviAPoWfjsXXyV
         TztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vSMkijIZic98gZLxBN70ZWl3l2+XsDo4BdCYlb0skis=;
        b=cO00e0mgPM6qcu7jXrKjiZA3JyQPfoGc4PwLjDkV6a+G4X3q3uQAGzEwqRE0WUJMt2
         HLV446FcPai5oWH0pLawd1c6riGL1aDmxCGoAdGYWJf6eu6ZvL1843i8G8IMzmK7G4gN
         dKmBIdNxj3iFxeQDVS8jxDUTBEyUTfutgn1UepQAMXeJKeI0ZDQ5xiB3HYiWe+NV+Tro
         0uJO++WmLg0twAoxqaTiomMRkzvCwYAcNtIO89seX+EJwDRCB7hz7SvwvHXu9pEM7a2P
         EAIzAjQTwcQxknf7PAehxmwf+WBQJhZVwGvWm7ETDQJ5wX9Kkz8MlbD2OghAVar54hha
         th1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XP2uL84A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si1538961qtp.238.2019.12.10.01.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 01:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XP2uL84A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iebQ3-00008l-Rb
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 04:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iebPt-00008Z-Kz
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 04:02:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iebPs-0000Db-JJ
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 04:02:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56995
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iebPs-0000DS-Fu
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 04:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575968568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSMkijIZic98gZLxBN70ZWl3l2+XsDo4BdCYlb0skis=;
 b=XP2uL84AqS9+RocFyIY6qSrbz8o27/nnb8ry/xrnRWqaKutANnBw3gxJa0Zs9zCM5rpvP2
 0uqRfRTfGeWzxfIWEN7XcY3Gik5xbEbfa6cpPBnGku1l3kbLFKQ+eygoLgU5eIECCNuCh0
 J43V8sM3D7TlC1SyqRZUxjQYKwyHhb4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-GimWqIpyNw6YrSskq3edFA-1; Tue, 10 Dec 2019 04:02:46 -0500
Received: by mail-lj1-f200.google.com with SMTP id t11so1707771ljo.13
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 01:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vSMkijIZic98gZLxBN70ZWl3l2+XsDo4BdCYlb0skis=;
 b=KE++Jq+ChKc+mltXmhNy6YsFClryowJtz/4CS92jyFqVlCS5VGzPc7f/It/W4dARtV
 avZXLMHeBx5EFhuG2FiRzNC3qnPEMBoozkq7OdpcrRkZLH4NtqzpMshe33znpMXt1/ir
 4tclWfhiKmUBXN3VJCQppa0SMa2dZXIO8UjPl40ElsDdf4HR3YzJj8/tr3VPNGKA6mGx
 qPK3wcihjE/KEgYsXMYvJizY3RWC31aLTIC9PUnWA5BuTG7MIb7JvsY1mZoqSev1g4Ry
 v81ozfus+yjs1HkdrWaKOSNH19yGU1nlY1T+zAybMqnawyp7tDXVI3JDGVvQnam3Qb3y
 uH+g==
X-Gm-Message-State: APjAAAXq/DXqjtTxOWGnCBKPEftbh4IYcH6lv2S3oyauAvxD5GUuZesL
 1fE4VD3T4ikAjm0HWrEAGwoQ7ER1ZW5EUYpyF9OrwbLqgEml30UCVvF6DWDWMl6G2KtSIeNC2Ey
 IiLKIhPq/Gixb
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr1888468wrr.98.1575968563720; 
 Tue, 10 Dec 2019 01:02:43 -0800 (PST)
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr1888444wrr.98.1575968563501; 
 Tue, 10 Dec 2019 01:02:43 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id g2sm2477083wrw.76.2019.12.10.01.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 01:02:43 -0800 (PST)
Subject: Re: [PATCH 01/10] hw: arm: add Allwinner H3 System-on-Chip
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-2-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70e9d4e8-49fb-02f9-23b4-d7cbf6e55eac@redhat.com>
Date: Tue, 10 Dec 2019 10:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202210947.3603-2-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: GimWqIpyNw6YrSskq3edFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9E6ByAOnQqUb

On 12/2/19 10:09 PM, Niek Linnenbank wrote:
> The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> processor cores. Features and specifications include DDR2/DDR3 memory,
> SD/MMC storage cards, 10/100/1000Mbit ethernet, USB 2.0, HDMI and
> various I/O modules. This commit adds support for the Allwinner H3
> System on Chip.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
[...]
> +
> +    /* UART */
> +    if (serial_hd(0)) {

As the uart0 is always mapped in the SoC, don't use 'if serial_hd()', 
instead map it regardless a console is connected.

> +        serial_mm_init(get_system_memory(), AW_H3_UART0_REG_BASE, 2,
> +                       s->irq[AW_H3_GIC_SPI_UART0], 115200, serial_hd(0),
> +                       DEVICE_NATIVE_ENDIAN);
> +    }
> +
> +    /* Unimplemented devices */
> +    create_unimplemented_device("display-engine", AW_H3_DE_BASE, AW_H3_DE_SIZE);
> +    create_unimplemented_device("dma", AW_H3_DMA_BASE, AW_H3_DMA_SIZE);
> +    create_unimplemented_device("lcd0", AW_H3_LCD0_BASE, AW_H3_LCD0_SIZE);
> +    create_unimplemented_device("lcd1", AW_H3_LCD1_BASE, AW_H3_LCD1_SIZE);
> +    create_unimplemented_device("gpu", AW_H3_GPU_BASE, AW_H3_GPU_SIZE);
> +    create_unimplemented_device("hdmi", AW_H3_HDMI_BASE, AW_H3_HDMI_SIZE);
> +    create_unimplemented_device("rtc", AW_H3_RTC_BASE, AW_H3_RTC_SIZE);
> +    create_unimplemented_device("audio-codec", AW_H3_AC_BASE, AW_H3_AC_SIZE);

