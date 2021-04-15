Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp823669lfr;
        Thu, 15 Apr 2021 12:35:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz30YV6V4HkZUX/b8up8C1JKMeOS4CWzmwQFUMbuwJlZ6MdO+R3T7Xm5O+4/Kr5Af7zWfOz
X-Received: by 2002:a92:1e12:: with SMTP id e18mr4009621ile.47.1618515335182;
        Thu, 15 Apr 2021 12:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618515335; cv=none;
        d=google.com; s=arc-20160816;
        b=nKEHJYknkqMDNTV+CAgIU1hNcodJQ2SNSiEhxhi6CEFZROvxcxkkw6YRkfHxWqnnZU
         Gf1zh6DqyGYw2hzBoKrWxeFhwbHFUfEvSFpW7EqEUxSbfS4AToheWUYqeZZAkCH5fkiN
         2LHUvqDw0ckhbDNhLIVTadETfrub3AzFjSRbuGZS+Us9w+S0cPAAKvzXjvW9KMnCd15j
         vt5K4H7Nma3VjvcjPv4K/zZewDVQVk4avTx2iJHddA4wIysAx7dLYU57Z1mpN89tgMqB
         1ggSbUWkjhgS0YN++ss8tKg+A0Ve5gRczicz1BuwD3wYHbQHmMk5qugqkjbTGryrsEDY
         eygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=M3MKlLcEsvYf4uap3GYeh560AAgLl5GspYlcYBxrfME=;
        b=KReoeKhyv3A1CrlO/A6IahMpTW56oxW69nXXB56EygqdDc3nv5FWA5jF8KuducPmSf
         Oilg3cR6ScHvvo4O050Ub3zr0qe0sVz1eEUffC+4SqaZ2WzlwaL8moAXKfDC5SclSqNE
         ap8UuHLf0JClELZVRhe06pxKlOlswF59XR0dgg+Cth50kgNGLN0YZTthiijx5VL6d57u
         WcVmFbaoaMKFsY+9Hulc9tFzPWF6TkJLuNOIQCWsecWap+XmRi5t7XtwOgKg48z/rSMV
         5g/p6lEJgbev53VfMfIBTZtjNg9mvv9EMG7dxe99GauhKCN97kvEPnYMZ9js45jN2bem
         8KjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r1uid3NV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si3839045ios.68.2021.04.15.12.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 12:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r1uid3NV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX7m2-0007gj-Fd
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 15:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lX7lV-0007fr-Nn; Thu, 15 Apr 2021 15:35:03 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lX7lT-0007ju-3k; Thu, 15 Apr 2021 15:35:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id e7so15451290wrs.11;
 Thu, 15 Apr 2021 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M3MKlLcEsvYf4uap3GYeh560AAgLl5GspYlcYBxrfME=;
 b=r1uid3NVjNRxzNRe5r+bIjtfdk6USxoqU9kZgXaVRhj/5l5+9OqHBxRFR3Qk+ElDEj
 GBqy0+vaU/sjylQTMIkq2pQZ5G151i4O390GnPH44mztz+Ja++JngPiNDBSsUJMkzvz2
 rvqKWyBMo0Efuz/fpze4j3+A44YzYIDjjJJViT16TbZzjHnBr/+MRbNvqJM8X/3nuAjf
 IuwwEgjGeSXd1WsBmD5K+Ydez2hzfvOjBkTjQY+TH/zKYeaE6SUni25nrkwvEdz++aCz
 xBOVk/VPQ996zi7iweWZJM4c7re/CVwLmsK0/WcvJSPIwJxcVD0w3KIhBCfxZRVjqByW
 vNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M3MKlLcEsvYf4uap3GYeh560AAgLl5GspYlcYBxrfME=;
 b=VcEx1RMivQM+Fps9tQ7TqzmyiiZQiaShmEn+7LPikXh5M9t36DVAvQNKgHmmwfimjt
 aH7FFuqIOxfrbFdKo9QgqfkNfLKNbDhKqjTMvOzxp3yUh2tx4PvFYaVFpD4nA5pkLig5
 lcDAOfLap6dxf4m5phhKcyem5RgAZIa9Xz/ucN9SbAY7trElAZ7f4DJquVqa/bKVkara
 +mvopcEBoCKjqOWYnBB2dA2qCRecirB9yGvGd8zIbkche7ndbiSX6Xtc45Ux+BdWIl3S
 8AjMoRtmbEjkpXVpXSrWC6iuDyWAQhYVg2xWg1r/+4XnydeeiwyqhN2AR91Ji5JsK9l1
 n3mA==
X-Gm-Message-State: AOAM531Bd7cF9hgFZ7BOFgL6Wrqjz1Ayo8icNd0SmyPu4IWD9ixluMbm
 83pZhhriaIBK4FCh6WJHjNumv/fcNrM=
X-Received: by 2002:adf:9c82:: with SMTP id d2mr5246922wre.170.1618515296798; 
 Thu, 15 Apr 2021 12:34:56 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g9sm4522642wmh.21.2021.04.15.12.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 12:34:56 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property
 array
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210415182353.8173-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4e0cad66-ee3e-dbe8-182f-26c8fed6c84d@amsat.org>
Date: Thu, 15 Apr 2021 21:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415182353.8173-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K8nVdqZSY9OZ

On 4/15/21 8:23 PM, Peter Maydell wrote:
> SSE-300 currently shares the SSE-200 Property array. This is
> bad principally because the default values of the CPU0_FPU
> and CPU0_DSP properties disable the FPU and DSP on the CPU.
> That is correct for the SSE-300 but not the SSE-200.
> Give the SSE-300 its own Property array with the correct
> SSE-300 specific settings:
>  * SSE-300 has only one CPU, so no CPU1* properties
>  * SSE-300 CPU has FPU and DSP
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a simple and pretty safe fix, but I don't think it quite
> merits doing an rc4 by itself. I think if we do an rc4 for some
> other reason it ought to go in, though.

Sounds good.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
