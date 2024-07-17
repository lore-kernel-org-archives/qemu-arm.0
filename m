Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp822933njk;
        Wed, 17 Jul 2024 06:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW8SasQSFrln1MjYCXU3NpPvzzuiW3xfCU0G2sCtSLpWdQpg6LbESdvCJUBmYv0tzeu9PwblftRwizpqU7NfOFx3jVnoma
X-Google-Smtp-Source: AGHT+IGWZwirg0za5EeVNJwRu0/XIISGdAAO+aj/Lo4QRoBOCbVpcrk/H6qcuLCN/ecoz9/+e9WB
X-Received: by 2002:ac8:5f91:0:b0:447:f445:9291 with SMTP id d75a77b69052e-44f86a3e9e8mr19610281cf.59.1721224189350;
        Wed, 17 Jul 2024 06:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721224189; cv=none;
        d=google.com; s=arc-20160816;
        b=vD4f0m/A6Mv5BXVuYlzZIjOvgrgrsymo5YX974HsyB7IZSelR/EcGSqQxKvwuIijly
         a1O3QQAD3svtx+yJV4ipEuBwj65tSYCCROqgrOvXPExmH4Q+hZ9AyYW10XITv3h8Z260
         +p2Jyd7jip5VHesaUGXpFNjBCu1nab/OR4Rn5hH8sDb1t8YVoUybGhk8GmPKN5ULy1pw
         HXKhjkKdJvutXfHTGIFhWDSqj2GzJDn1PbyEC1TWuCIs/Pny04g4X8hozrLL3EuCYLQk
         lvvpEH2EHzrCcVZF3HauuyH5RIjpDr6W9N8+XCJmi5acGEdaJ7u04f+2phK+iL5gtTJ8
         1ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Sw7omQ2ctiNpNvargBrwJtkHN7AaLbnQMl4SA52N+40=;
        fh=MCYpE9bZA8JxkNby3mb9pkdQKT5bdyEPqdyfNxJVZwQ=;
        b=V9Y7At+iqCaQ0X/vSXx2vAbCGFr62nAwOVKMjGpXOrZVT79L5gb1Ex12qDCyzdpBrV
         nBXhPgujw+vsgmpGCaL/810fQF9NsTc468ZQT7q2edI6RtMXs6lP0ywsXelPoIfS9w6x
         YFjw6u23XJhCfklgSeOig8jRXVDVx3LDKmq9AoKRjWdh27jEMQex2wY+zjLMjMrguX8d
         qj6jHSS7blcSVfmN21CjjG0NZvaqdjdxzL+qYdqsW40O6/Y8LOmxYhBK5l8OoxupKIf6
         wFzIXuB03G+OY0Nlb/KeF6Mb7gyJe45ouwY749ixHh20qN6mVwmPd3ajf4LBO1Y+uOO0
         QmPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e3/Iy4YZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b78010csi101753361cf.34.2024.07.17.06.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 06:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e3/Iy4YZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU52M-0007uE-Jf; Wed, 17 Jul 2024 09:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU52L-0007oW-Ai
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:49:41 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU52J-0001Tn-DV
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:49:41 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e05d48cf642so2290491276.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 06:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224178; x=1721828978; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sw7omQ2ctiNpNvargBrwJtkHN7AaLbnQMl4SA52N+40=;
 b=e3/Iy4YZmgDQx9boX66Ojf++9bJcGgvGPVqXoDVUm6xifrldW3tjVR0ZXWWtpfD6T5
 GH/6mvgC42d/HPL0MCY9/cYtmKHpaNEeztB1Vfwnmtkha0ZayagVezFdF6cWoXmV6jfq
 o5U3k1pdcutvtylmRl1XXhtVZyP4BGGUwBV8yckVZs36iyodms+bySOIzhEhNNvJOHY6
 S2jU9U9LCxmXBoByZ1rnD+lUlZoDaZaZGG+g3CeCnXpULRt7JcSipWXXQpKoqTjbHCEq
 H8VhwlbOVzQfrOM/U87fArs5vBkJ7kpMlXHBTh8qA91R6VsrdlvYKzbe2rtVsW5xCBd3
 0hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224178; x=1721828978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sw7omQ2ctiNpNvargBrwJtkHN7AaLbnQMl4SA52N+40=;
 b=HV0TLBNiZZ68xPzQOC45t+4RyyscJdO4Za0hjXriC0ThDi7jU0jUivKHIjmqZZdr6q
 s6cHR+gh2p+BJ0I7X9IEbSvwfWSS1K5wnt/J19zxU9CkACS0VT6LzjxJrfhY7h/i0DXo
 Z/SgMnb3GjTJTCJB5beG3loS8kpm1RDsqIo//ZDsOP9refNGPPT1R7NCDoYX4bKgSpNN
 50wbYDBEk02dQHlOAbCAqZSSW/erESFFxqzETdjfhpNv9vqAl4QtsHKHuWewvmKaQItt
 CJ6kW/gvQC6pk8EK2ltVF8wSBA4U04dFape228Mwbodmsm8e5UTlNhsJb0TCsF8AiCHB
 ic6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV29iFIRP//HdCs4tZD4jTYeRoR85yxQwdaVDEJzn6P3iZUQT3hlfup7jPPRnoSuGlqBxACB/k2DuXNVtAY+ZAjTL8
X-Gm-Message-State: AOJu0Yzsdqj4gtRbZv3ix/qtoPwH9CIPY9V65fkfPnRriy307tEVWT9s
 p3RvsJJ1udRK87iV8ArUMu8UBzQzwiBjeT7sMKt4kKwvpRPyTOJ7pf9bT+bOuXs=
X-Received: by 2002:a05:6902:120a:b0:e03:6020:4708 with SMTP id
 3f1490d57ef6-e05ed538db4mr1953520276.0.1721224178240; 
 Wed, 17 Jul 2024 06:49:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e05bb2fc696sm1127377276.31.2024.07.17.06.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 06:49:37 -0700 (PDT)
Message-ID: <e29093fb-d36f-4d77-ba1c-e277f2441d09@linaro.org>
Date: Wed, 17 Jul 2024 15:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Add eMMC boot tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240717130657.648701-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717130657.648701-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=philmd@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: Zzt5CS5jE9B2

On 17/7/24 15:06, Cédric Le Goater wrote:
> The image was built using the process described in commit c8cb19876d3e
> ("hw/sd/sdcard: Support boot area in emmc image") with artefacts from
> the latest successful build of the IBM P10 BMC platform available on:
> 
>    https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/avocado/machine_aspeed.py | 38 +++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index f66ad38d3503..1deb8472818f 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -439,3 +439,41 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
>           self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
>           self.ssh_connect('root', '0penBmc', False)
>   
> +class AST2x00MachineMMC(QemuSystemTest):
> +
> +    timeout = 240
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)
> +
> +    def test_arm_aspeed_emmc_boot(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:rainier-bmc

           :avocado: tags=device:emmc

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        """

$ make check-avocado AVOCADO_TAGS=machine:rainier-bmc
Fetching asset from 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian
Fetching asset from 
tests/avocado/machine_aspeed.py:AST2x00MachineMMC.test_arm_aspeed_emmc_boot
JOB ID     : ed89ecf5e166e7f636cc731c0242ba6e714fea39
JOB LOG    : build/tests/results/job-2024-07-17T14.45-ed89ecf/job.log
  (1/2) 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian: 
PASS (21.55 s)
  (2/2) 
tests/avocado/machine_aspeed.py:AST2x00MachineMMC.test_arm_aspeed_emmc_boot: 
PASS (43.71 s)
RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 174.68 s

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

