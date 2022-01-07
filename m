Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp161573lfb;
        Fri, 7 Jan 2022 06:49:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf5/YpO8hVV1Ymx0q21gmBadrtWFLrFt44nbW9QhvLM+CW1pvx846fT+owt14XOxtgcE98
X-Received: by 2002:a25:c8c3:: with SMTP id y186mr81412824ybf.20.1641566979665;
        Fri, 07 Jan 2022 06:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641566979; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIu/D6pkQ8ZqGjwuviQDw2/szVYhY2eMT0/tdGNcjP3APCy+LGL6AfdPghNuSC/RCm
         AaYzzjXwkOHGJ4z1FMncPBLcdRmj1HZGMuKCxrAI2zZvGygzSkaJdnc6uIpM1CjMqsNq
         c213HiWnnsURTfhQFOs4WAByZT/ko6y6OvZV4x61hb5oF8KrXIrj4G6k4svZfPxOuM97
         q3A2CIp4rL2Lf5LCl3PN6BsvtX+jashs527BC3pQbaLzf+6Q2ZGIYApkmmOxMf1+ReOl
         xIQ3DjrZnrSiNEZb2FZbUxT3QQaCotY5Q9tigsuc/Fpkee2/t8WWsfMyRsBAJDX7TGAd
         UB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=B8voNgHLfBlJOloYtpD+IIa4G0w5fpKJakrc84phf2M=;
        b=tFfPrxL9T9DTG+97jRXgAMw35t7HDFL6H6ambRVHURrccPk3NoYsAL3x+lBx7L/gbS
         FaSJmPbBGpWafUMT73/0mlvFoRFyPG2NaMmU/9S8z4Xp5PSXsqfp4G8wcakjotf2kwv3
         8hp1m3kT9fx+4uGoeOSZvaXM6V408V0LUtWfBBROtKFRZnb015vDQQu0ubq9pC23WlXl
         brKAZUkiWwiMatO7MrozEZ/GHDPyLX7SytWy4Big/9aQPEDempD/MV5r57ZS3hzBSowe
         olQGr334CWmEqPhKX0/VqPUWD1COoPrrAm9AqeY5mD/ROVHwRjNSM6aSE+7mZCV74b3B
         r43g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="S/jCdkQ5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b188si4109285ybg.61.2022.01.07.06.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 06:49:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="S/jCdkQ5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5qYl-0001rS-3V
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 09:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qRf-0001g4-Nh; Fri, 07 Jan 2022 09:42:19 -0500
Received: from [2a00:1450:4864:20::335] (port=36811
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qRe-00014u-9q; Fri, 07 Jan 2022 09:42:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so5552794wmk.1; 
 Fri, 07 Jan 2022 06:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B8voNgHLfBlJOloYtpD+IIa4G0w5fpKJakrc84phf2M=;
 b=S/jCdkQ5s2QFORuAdlrUAd+/VpnXgYlL296h5drTDKRvQmpokXYzx/hOFH9TuwRpJK
 6Ms2sIBdTowB8UpETWri3HCMvJZZXSeeUFlvyAb01xpwE8x/GiVgnhyMQ/Hxweg++JsW
 eZm6qdz50OISF/2p9JwJtUu7Nw6azy0voYp8ILgYYCTe1RG+1ibFcHhLxeHgHBgzH8CL
 T4lMxVKhIOF4Z9ZnYcyPsIlB26R3qZ3UXmxX0bASfLYkLTth0Wu3phR6el/7LMNJ4RUd
 uwktFF3qt0h4MNgFOfbe+whrK7V7KYorTRODXZEPRnwiedznKJxN6yG8HconceR0BtYm
 6bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B8voNgHLfBlJOloYtpD+IIa4G0w5fpKJakrc84phf2M=;
 b=oFf0Zf6QMlyHBM7hwlFGr53uU/S9crqesFVd3CGl+oGuDKr36gsLDM4hW1JYgeJ8QN
 j7Krb0QQXolLhEc/kENcNxAWV8kdGUpcEHwO5YXeHw6rhvZRaiYoAlYaLxb+UKNF0utk
 QOf9FGDfYy52yeFfGk7mexlk7BpG2Z1dCSv734oDk0mXx95BjlVnGYwJsvxtvJVs3L8g
 VWM5pN/ZthWExFzLlCxOH4hqw2R6MMBbKxc8cMPIOxMra9E6/pWHTjLktOpuhAkLsZ7X
 CdO4X7Hm+xCSVcCw/7WZaQxDHZeksMQrrI6do083EiEZz6TjUtWOMF9/AI4LnFsAdJay
 ZqpQ==
X-Gm-Message-State: AOAM533NfVD7dVO8MhqCvSs8NZFtv3Fem3CQuKbB9EBJQZhaFJqfAewO
 oQXYtPXXMNrrYY+vt+Ekap0=
X-Received: by 2002:a1c:f316:: with SMTP id q22mr11334552wmq.33.1641566536701; 
 Fri, 07 Jan 2022 06:42:16 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id a71sm1981169wme.39.2022.01.07.06.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:42:16 -0800 (PST)
Message-ID: <c25a5642-28f4-99c5-3f4f-e31845b422a2@amsat.org>
Date: Fri, 7 Jan 2022 15:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 2/5] hw/i2c: Added linear mode translation for pmbus
 devices
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-3-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106230936.417020-3-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
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
Cc: venture@google.com, Shengtan Mao <stmao@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bu3M8+mlcGRt

On 7/1/22 00:09, Titus Rwantare wrote:
> From: Shengtan Mao <stmao@google.com>
> 
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
>   include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
>   2 files changed, 37 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
