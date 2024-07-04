Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp461347njb;
        Thu, 4 Jul 2024 01:55:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2ANWZqBYMJqcy3WaZi6rmcsDkeQdCyr52hAG5YC0yO0uwmfw3VkxcXENiuRrb4fPmHM3f1bbJ23ltixId25iYVP48LXm7
X-Google-Smtp-Source: AGHT+IH6dOAMeFNaAO49TSM68FnCBqVBcSxE6kkhSG/DWvbcKQFU85JgwzSjuGLTYkaE9qCMHzdn
X-Received: by 2002:a81:830c:0:b0:64b:2cf2:391c with SMTP id 00721157ae682-652d5b0fa55mr10059967b3.18.1720083322979;
        Thu, 04 Jul 2024 01:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720083322; cv=none;
        d=google.com; s=arc-20160816;
        b=iQfuYh3sWGYEcmKtHEaIDQBgXJcAMFlgDz7F+t0vjJMQdL6k+AvwUjS0V83kAbYFbl
         Rs6BW12wdgI1z9EPDWXUwu8vt5wIkT3c+wfyoDnigDALiq1qI1sUruNpOFZl/SI7ByVS
         yBDRyYlnvT5HKWpe2pejX8OhALWy6Oh4WoibnLtLoc6/OQxnGf3GBVO+EaFBbA2KZK94
         /h9fOVHpTSZKvDpyYN5zpQyyqMBptT7SFKgYgxJ+g1m4Bljz3Z2hwcxASQnr3XOXhL6K
         vkzxSClj4n6fDvCcx9EUQTwRPSrDLcaNBxD4OLG1TT0bwTZTPtHjTQ0JQJaLTlWdZd3/
         +wBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=877+EVqWb82jUXrne3Nmurg9JLrt2GzfeRBgLb3CndA=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=rttVOJczuUmyF62B7yZ3l8KnUPgCE14OU5RPySyQMUy5a2Pqqp8ZCxHNjfSB8rpdiz
         fa1fQk8KNb3ZjiB2c72hsZETEF07OwXm+FeqW8OswvbQ9WlFRvRtoLtdFBbisnHdBTvg
         GXplmvC5UXGrLzQG+IMNsZh5lfsVvdFd48SRXqYtCa5XnJNcSN57dP2Mcr5RgkX4U4LG
         uXKj2CVyUjNCB+H+J6eNKcBEMGo7HWuKToUWm+09vuEkXf8izUCkdF/RHMgKSGpYuJna
         Z+PygiP2R/ksoHinhmtNj+x+R4g8+bJZ3M1Kb6IoX7coU1Hpyi6ZRhBi5XGOhm/3IzaB
         zP2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5adf6fsi144909556d6.303.2024.07.04.01.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPIFE-0002Yk-2C; Thu, 04 Jul 2024 04:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIF4-0002Gz-De; Thu, 04 Jul 2024 04:55:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIF1-0003dc-KA; Thu, 04 Jul 2024 04:55:02 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WF9Sv0ST1z4x1V;
 Thu,  4 Jul 2024 18:54:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF9Sm3CFcz4wny;
 Thu,  4 Jul 2024 18:54:48 +1000 (AEST)
Message-ID: <72b8a8bb-3601-4aa5-8115-a450bc31ac95@kaod.org>
Date: Thu, 4 Jul 2024 10:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] machine_aspeed.py: update to test network for
 AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
 <20240704082922.1464317-9-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240704082922.1464317-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=mgHy=OE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: LaPlKeoj/jST

On 7/4/24 10:29 AM, Jamin Lin wrote:
> Update test case to test network connection via SSH.
> 
> Test command:
> ```
> cd build
> pyvenv/bin/avocado run ../qemu/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_aarch64_ast2700_evb_sdk_v09_02
> ```
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/avocado/machine_aspeed.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 13fe128fc9..f66ad38d35 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -313,14 +313,14 @@ def do_test_arm_aspeed_sdk_start(self, image):
>   
>       def do_test_aarch64_aspeed_sdk_start(self, image):
>           self.vm.set_console()
> -        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw')
> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> +                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
>   
>           self.vm.launch()
>   
>           self.wait_for_console_pattern('U-Boot 2023.10')
>           self.wait_for_console_pattern('## Loading kernel from FIT Image')
>           self.wait_for_console_pattern('Starting kernel ...')
> -        self.wait_for_console_pattern("systemd[1]: Hostname set to")
>   
>       @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
>   
> @@ -436,4 +436,6 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
>   
>           self.vm.add_args('-smp', str(num_cpu))
>           self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
> +        self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
> +        self.ssh_connect('root', '0penBmc', False)
>   

