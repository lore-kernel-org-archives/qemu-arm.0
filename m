Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp344005njb;
        Fri, 13 Dec 2024 02:48:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrupynbqpSeo8X0hM28KpmoQBb6p+h+R3AkYOuss91dHzK532zyByBkQF8JBknTp1DYACf/d1Bur7ofg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIqDBOkWbByahnmiixPNEjbCc0OHK79BSN20XKmqjTc0wCwv1prrZQ7To09Ahdae7TYMSG
X-Received: by 2002:ac8:588a:0:b0:467:62aa:c6d2 with SMTP id d75a77b69052e-467a57194a0mr39326731cf.9.1734086907077;
        Fri, 13 Dec 2024 02:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734086907; cv=none;
        d=google.com; s=arc-20240605;
        b=BIQ2TnQdwj8Ezua88mGcZoysMimDdZMmPUUaeDRkC5M5gRsOGVpTgZ9p+ysof8aHPG
         t0CW3oiXxbI479R8Abwx30ajxA3N6EThGIaj3fKWWxqQFrZx86FOHwFbUGACoV7iBvXX
         nQyub0iZzGIa2PqXEgpC0rwMSZNZ8WKBrLTQfEJLJ2UqL8ICd2tQ2RHrMztcFxN36AtO
         hVg8aNnlUz56qMtwjw9sddWHkAS7QJbkWqIBDs+47lKpWjZol21tQer05WbhU9UIGpEw
         MKbjXSmu1rT/yqs+N3evoRZrfI7fRnVHD+knRwmCSq7ZQqRz9n7TjR6ESKbR2SNL5Boj
         amPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=/JefsvfRniig805HHtKLlZLl3HsaAO+tCqBK6w1+UPQ=;
        fh=edIr4+c200ZDHfjcAGkqUVvsDcG8sPXvoWrxaeDB2RQ=;
        b=Y3+hJ4DFs81aLubdav8BsX5oku6mnygEEy2LHcxeYGzYy7RuTZTa0mTzS2SUkwRCSF
         cA0uGmWSo9bbQOrUUbr8JvX5BMkCGNMtctOlFfkVmdX88rLcnIumJlgynyq/m7+s5jwg
         QcYSeljTb/ytg2g8FAwralKZabgR302xlohWPjXq7OK5cMOemStV7Ox13YN65TeNNNfG
         ygvES/2oDJ+reD96nPUYcqS3Z35d/BfUhNxxdPwoHIKiwzh+dEL99aFHqsgwc2DZtF3k
         HBv7+Zy72W8slYvIY+wAeA04zwLSKFc73yeExxcm3z6iOlmZg164bi/z3oolxylyOmF+
         rtUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46780685958si81856961cf.196.2024.12.13.02.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 02:48:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM3D3-0001cA-0j; Fri, 13 Dec 2024 05:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ldnL=TG=kaod.org=clg@ozlabs.org>)
 id 1tM3D0-0001bs-Hn; Fri, 13 Dec 2024 05:47:46 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ldnL=TG=kaod.org=clg@ozlabs.org>)
 id 1tM3Cx-000261-Uy; Fri, 13 Dec 2024 05:47:46 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Y8mJ45zwbz4wb1;
 Fri, 13 Dec 2024 21:47:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y8mJ20Shhz4wbp;
 Fri, 13 Dec 2024 21:47:29 +1100 (AEDT)
Message-ID: <45e14814-4394-40e9-ab5e-3cd1ef51bde1@kaod.org>
Date: Fri, 13 Dec 2024 11:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/aspeed: fix connect_serial_hds_to_uarts
To: =?UTF-8?B?S2VubmV0aCBKaWEo6LS+57qq5LicX+WNjuehleS4iua1tyk=?=
 <kenneth_jia@asus.com>, "'qemu-arm@nongnu.org'" <qemu-arm@nongnu.org>
Cc: =?UTF-8?Q?=27C=C3=A9dric_Le_Goater=27?= <clg@redhat.com>,
 =?UTF-8?Q?=27Philippe_Mathieu-Daud=C3=A9=27?= <philmd@linaro.org>,
 'Jamin Lin' <jamin_lin@aspeedtech.com>,
 'Andrew Jeffery' <andrew@codeconstruct.com.au>,
 'Gavin Shan' <gshan@redhat.com>,
 "'open list:All patches CC here'" <qemu-devel@nongnu.org>
References: <5f9b0c53f1644922ba85522046e92f4c@asus.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <5f9b0c53f1644922ba85522046e92f4c@asus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ldnL=TG=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pp6ytsvMErTU

On 12/12/24 14:31, Kenneth Jia(贾纪东_华硕上海) wrote:
>  From 24d3badbbb9dcc0d220609a7dd30f8da5002cba7 Mon Sep 17 00:00:00 2001
> 
> From: Kenneth Jia <kenneth_jia@asus.com>
> 
> Date: Thu, 12 Dec 2024 20:42:04 +0800
> 
> Subject: [PATCH]    hw/arm/aspeed: fix connect_serial_hds_to_uarts
> 
>     In the loop, we need ignore the index increase when uart == uart_chosen
> 
>     We should increase the index only after we allocate a serial.
> 
> Signed-off-by: Kenneth Jia <kenneth_jia@asus.com>
> 

Applied to aspeed-next.

Thanks,

C.


