Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp422064lfa;
        Fri, 23 Oct 2020 04:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRYIpXtXDWMNua2ssXjjgxd6eIuF2e/ZcDSdlOmIiKlMZVy7cD8qPhsGHVeBdlUzOEXV8Z
X-Received: by 2002:ac8:1e84:: with SMTP id c4mr1522570qtm.340.1603451612945;
        Fri, 23 Oct 2020 04:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603451612; cv=none;
        d=google.com; s=arc-20160816;
        b=etfHQvWgybP/VPdmEOVK3w/WsoVLImlGEfOHlVdbbUyeXmszVlb2OcIotTUsAoD/Q9
         5c9srh2y3YqvqpZLqdbJH37tPUicaKcpb6M0FHRIzbOmDHoKBilzwO0VpRbnk4o4K+3D
         p6cmRMG5zEC4Lswr7WECDL5v1VFiMDvFFMuSU7G23khgmYKhW2RkYnckCoVkxNI6FUuq
         W0f6b1TCVxB8vctfxfh3xb2u+rPLT8W/lxRSePB/7gTR1kfQ9FzAqGPKXI6g/fWG8Qqy
         UVc/gwLC+lCSTVCZ5hYQ8ukNSCGZdMudeXkbq2usdy71KYVTkGnSM3Uoa9uTG/2Siq0v
         neKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=G9j2r8zy0UQ13szWxG3DfBiItx6wWb/uDGbW1g2pxS8=;
        b=zMEUNvnhlPC8sUlNjKAkrKqCj5RAvKQ0tPlNsCZTNpMDd8/16AvYKWYQSZ45t581ov
         q6lo9X5SdGVJPYPs59iM1H6vPx3ievO6Mnp7+zVtkuqD6FT8csTY0FUObK+pLyiJIWO3
         9ug9//k2C1eIFbkaC7gNK6WXk/flrYOaVILsvXasmVPelfSI9IoObg2ibo5SGS3piJ+g
         i7kyukr0pOpqxUmP08Pc5TymidvMLXKfJuqlCvZHIy/92Nr5OqluMwbzHfNza5MLpdQU
         Hq/FoKpQXWfGcUtwlaR+Ytgv2C8t/PDemEPWt1KljP8fsP2pSzd4VSdYcej3ou25m396
         wyOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=paDgt8MQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si558610qtj.315.2020.10.23.04.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 04:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=paDgt8MQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVv0m-0006Tp-Bv
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 07:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVv0e-0006Te-G4; Fri, 23 Oct 2020 07:13:24 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVv0b-0006ye-Gd; Fri, 23 Oct 2020 07:13:22 -0400
Received: by mail-wr1-x442.google.com with SMTP id n18so1359434wrs.5;
 Fri, 23 Oct 2020 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G9j2r8zy0UQ13szWxG3DfBiItx6wWb/uDGbW1g2pxS8=;
 b=paDgt8MQCO3MjH+AJ1QUsJ5wszb+1wlX49wV+uv55U0hp0OhSR5ZfXJOJvDfFjMVUv
 Xh58ErLeIEX7ymb01hqB2ZMDFbiIWDA6U2s7fXmvCe+i2HMD+8FNqBz+29IxuGV/h4uy
 ZxtrWvk19DfJQri0D+4UM/5S4X7f6L9DxwsB4mK55FLYd9+xzUdxrkB/J7yzJNMk02kT
 OG067TxA5O4t9uuKPWZM/l4gq9dtVGeY+nR4EV08AmlOyZtTYqzdnyRyr6Gqi+Z7G08L
 uKyAcs87EgH8oM4pX8GsPsW7qIfOwWtHxkX+aB4PMu9EyvdWz+vwOf8HWUEnxMisqy6U
 0s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G9j2r8zy0UQ13szWxG3DfBiItx6wWb/uDGbW1g2pxS8=;
 b=IPdLAJ9ux00WZk2hy3lFiBt3RXDwdDErCFRSK8g1SI1oo6lJ+nCTGXipYoGT8uamuI
 ugTJfZddHfYDrXNl1J8GgAK66tC9hDmAABRHg7yQbnR9SH2mK/LGT5uQHbh4//w+IyZh
 xg2mARZw5teuSUA060Ob2f8V5Zws6OSCbvSPzApEiSamwvDhPxUO35wXkMYWUiW3B5cH
 YFZ9rNEzEkIHCQOVYNEQT1t0Iosdte9jIjBkLYqGnYstTXmNKrYb4Jq7eb+5jrhBzhEF
 2Vxcx/sdTmQgVJeeRqKWVjNUvGZhaJqsbZMJruin17zg3TNrJ0meGGBT+oyXTMngnryB
 zIqQ==
X-Gm-Message-State: AOAM531qP+SmSz85aW5wzT6/TioKIpWg063yzrnGjukI79pFuiaDneqr
 0rjV79s3ridIa5phcUmEdFe7tWqBnss=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr1997573wru.28.1603451599000; 
 Fri, 23 Oct 2020 04:13:19 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id w83sm2677129wmg.48.2020.10.23.04.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 04:13:18 -0700 (PDT)
Subject: Re: [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
To: Guenter Roeck <linux@roeck-us.net>, Luc Michel <luc@lmichel.fr>,
 qemu-devel@nongnu.org
References: <20201010135759.437903-1-luc@lmichel.fr>
 <f6c1ad96-ce36-e229-2a9d-d71070b82d82@amsat.org>
 <9a858d15-5335-9036-058c-d752c2689219@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d90cc6f9-992d-dad8-d1cc-bc26d9a874bb@amsat.org>
Date: Fri, 23 Oct 2020 13:13:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9a858d15-5335-9036-058c-d752c2689219@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.108,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WuQWBUW9acmu

On 10/23/20 5:55 AM, Guenter Roeck wrote:
> On 10/22/20 3:06 PM, Philippe Mathieu-Daudé wrote:
>> Cc'ing Guenter who had a similar patch and might be interested
>> to test :)
>>
> I applied the series on top of qemu mainline and ran all my test with it
> (raspi2 with qemu-system-arm as well as qemu-system-aarch64, and raspi3
> in both big endian and little endian mode with qemu-system-aarch64.
> All tests passed without error or kernel warning.

Awesome :) I'm glad we finally get this complex part implemented.

Regards,

Phil.

> 
> For the series:
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
