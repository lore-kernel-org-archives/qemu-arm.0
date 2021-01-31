Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2721301lfo;
        Sun, 31 Jan 2021 07:31:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwe3e+uMHYqo7kGzv7/LoxE7925vfot5aVpqCVApX86MmqBJHrmOfzKou4ahB9/jsx2bXUM
X-Received: by 2002:a25:cb08:: with SMTP id b8mr13825484ybg.415.1612107086186;
        Sun, 31 Jan 2021 07:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612107086; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIJ6pgdJsvGmElt6XNJJuNHF0271iZ7MKTETNsnYv3z+P7ve5iHMr0/HsTCkZ2G1zv
         qGJi84A0linvLwc5ig691j3zKRVtuetp3mGK9mNReKwxGFN4oFNabkgwVYGsEzYQtPhz
         MYyGC7kXNkQekZ5zCdPSpVoBErLMYZqWZ5ALpoWlEvu+19PEXXKNiyphzFDG6sbnvxlY
         YLXSNiR2wvmwaM2HvVQTz58U3unH1Lj3OP8OlV+Zjfgxvkhehfmh2Bep06fpIhxdFRS7
         W9hUzR3AbNGgJ9zTGJJmW9zoYaDqttObe67r07SRNk17UWXSjmjJ9JW94TQ05KmxDGt9
         whFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=WbS215fq3M5FNOsNXG+850EpFpOkfDvezmq6L7LpRAY=;
        b=EYxW20C7Ba+hvKptqB7qgyoejGTN7Hodv6JufnRJ952LxaW9GW3f7YiSEkmzCscurP
         bu78LsZDzMWFxM0/397lL4Ybdn97PVFlg0aozF72DS59x/1c7Fxdn5t1b5eiFGh0/9D2
         reGcIDnZHg2Nkeju3NlkWRS/Q1/nMOADO67Iy/8QVoUI9u7JI/sxfpDpTHGLV33xZzWs
         CnWUgRmcUyHwjJcW2uscAfrf6EWv5EAnWQpok8pCbC3p5b3JzV9/76Y/lPkk0a+THqXt
         OV7agpgpBHcWRA22caBkeU7knSFPy4tQm8efi/5JdL0Hmt8g6TiyJBm8wQI4kOWEVvBW
         lxHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YAUM4UZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b34si16527248ybi.324.2021.01.31.07.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 07:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YAUM4UZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6EhB-0008GC-IJ
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 10:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Eh0-0008Ed-GO; Sun, 31 Jan 2021 10:31:14 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Egy-0006Tr-Pt; Sun, 31 Jan 2021 10:31:14 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u14so11054985wmq.4;
 Sun, 31 Jan 2021 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WbS215fq3M5FNOsNXG+850EpFpOkfDvezmq6L7LpRAY=;
 b=YAUM4UZmFHtZGRDkP+q2Z0Bps/Jf6VhDAJBusGF1hc9ZFxKz+qx0wJCjFVzYUpV2DG
 VtsdZXPxLYCkJixB5L9DTTeT7h6RgyqOG1zrjUxprI86StmpprKiD6MWY0m+oBxbu2iU
 vW2uBw4LADj2COpb7IUeZ6Mf5x20BoKCyt/gXyC9u644oXsEp+wB6e2aDtwC2hB9lan8
 FVSRp8LFJwG21o/XH7jYg9q2cYNf5npGMmcY4r8o5gz7LYD/nHXnDq3QKJsNwv1kcoNG
 0jDz9E+JM06AdqaMqwcNg22dcWNWXlhNSX6/0LvwHoZnda/qpqbE3vQb483lVwfrpUWH
 dYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WbS215fq3M5FNOsNXG+850EpFpOkfDvezmq6L7LpRAY=;
 b=GbvI6NcQ8mADs7oXrPFjUUQraqw2qLLQbsjn7nb9p3t+LsfUJGtrkXw3Ab/pMtIBts
 8k0tGtE1S4onTVLMr5zRDIqRGAGa++9lb8FbiJ2EUPwQldzobz+MT7mgvRnojB7GYSDT
 LsaFlxeZYhDvS8Tb5map2uJZ8V/u0//GFP2zetHQqLMNN5PMvepHFhyDWNmYHgGAX5vz
 evvja3tBjibNRNDS/fRszele5dvzFN7CQ1A3EZtpntUoPQFHAcjZ+mDwmkfvCR/cDZ1o
 VDedZaKMFeGdrBck9ZtNXrJCAMcINsPpy1q5iRYvw7mdcUhjYMjguo11j3Q/C3PrxzUL
 2VNA==
X-Gm-Message-State: AOAM531liwiOixFNcQDuRr6ARO5BevmuaNLT4fXMnhSrPLor1bjMH8tQ
 mgK/SSHg9Tu55+fwTCp5vCw=
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr11393681wml.157.1612107070657; 
 Sun, 31 Jan 2021 07:31:10 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r15sm23820444wrq.1.2021.01.31.07.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:31:10 -0800 (PST)
Subject: Re: [PATCH v2 5/7] hw/arm/sbsa-ref: Restrict SBSA-ref board to 64-bit
 build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-6-f4bug@amsat.org>
 <a741601e-8ad5-99ad-decf-14dc007900b8@amsat.org>
Message-ID: <6a392fbc-edac-5cf6-0a26-c8df2e8c4469@amsat.org>
Date: Sun, 31 Jan 2021 16:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a741601e-8ad5-99ad-decf-14dc007900b8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
 Radoslaw Biernacki <rad@semihalf.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MSJ8fwspTebY

On 1/31/21 1:31 PM, Philippe Mathieu-Daudé wrote:
> On 1/31/21 11:59 AM, Philippe Mathieu-Daudé wrote:
>> The SBSA-ref board only use CPUs available in the 64-bit build,
>> it is pointless to have it available in the 32-bit build.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Radoslaw Biernacki <rad@semihalf.com>
>> Cc: Leif Lindholm <leif@nuviainc.com>
>> ---
>>  hw/arm/meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index be39117b9b6..059ff7382f2 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -22,7 +22,7 @@
>>  arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
>>  arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
>>  arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
>> -arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
>> +arm_ss.add(when: ['CONFIG_SBSA_REF', 'TARGET_AARCH64'], if_true: files('sbsa-ref.c'))
> 
> Please disregard this patch, it shows that my other patch
> "meson: Introduce target-specific Kconfig" is incorrect:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07989.html
> Probably because per docs/devel/kconfig.rst "devices are usually
> ``default y`` if and only if they have at least one ``depends on``".

The problem is the XLNX_ZYNQMP_ARM was incorrectly selected,
enabling AARCH64, pulling in CONFIG_SBSA_REF on 32-bit.
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08014.html

With this change there is no problem (and this patch is not necessary):

 config XLNX_ZYNQMP_ARM
     bool
-    default y if TCG && ARM
+    default y if TCG && AARCH64

Regards,

Phil.
