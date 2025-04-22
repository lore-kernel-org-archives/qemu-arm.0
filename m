Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2294481njd;
        Tue, 22 Apr 2025 04:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8zX3m9PLN3+tYbza2OYvVA6qQa7ZB8OFPBOL7hVZtIFprbPPbV64UUEZ8xvcV+p9nh+HpckSj3NBYHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVOjieHyGdM3q1QiY3VKIryMQ1frWCtbXmqbFlZTUIDhuMuqoAKgyo1QIagHEqSb8IX0Nq
X-Received: by 2002:a05:6214:29ea:b0:6e8:fcc6:35b6 with SMTP id 6a1803df08f44-6f2c450ce61mr260443066d6.2.1745323187349;
        Tue, 22 Apr 2025 04:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745323187; cv=none;
        d=google.com; s=arc-20240605;
        b=DvWc33aar+emUvJUbPaygWvNvBvQD37ZmIw33jyxE1xq6YCVqsBUzyNBJ9vum8cqaq
         F4oDaS+zFdMCLRFMb7vnO8Unm7CJrtNJ2AJJosDvbTFh8kR7JzBaY6g+po5lMvJv8iII
         bON5Awa4pn4vp2kjnO+gZqBlGTT9ncAeePODQfmxejXkctBGo5oQ/Xn/+7DEQmUfSRNt
         lN6vlKJkDhOQIhlDnzO3wDouQe8BQfbpHPzS+p08P3ObUrpLXWF/Z96lz4HLfql3Ud8G
         yYAs2kjYkHs0TTsphstzmsKKMUlYAg8NUyY5G+2u6AREo6O6OmDW97zj/64+027MEAQb
         mvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=krdU8WFR9VhaX5P5ZTkWsaNDvp9OC0lIHlV4lzQNK8c=;
        fh=Z2qDztSV8CWVU0ChRWBZcc7s5uQfKpc4TkuCRqvdIcI=;
        b=VwnpXnwLwAlABxamV1hTEeCVMu1Rbdra21lKFmKJV2G/zbUJJ0ZdJFyRsJt5r2aJ8r
         alQ4OXTwpbWRODxICMoajkpDwwXdZRzW0L10hkk81SK8lMgLDxzd8qkMW0G9oJBbs0va
         sng7KCEg3GqiDIbJBcU/fLTsNDmoqoBPB6SN7pzy8U8RiiOFIu4IM9Q2XTim7pI/YQus
         YjRk70gH/hXDM8bWRqEZA9xue2TBCDtgqTgvxkJgz1cXZ+9WFeWLS0+8DoSHU0Gu0c64
         pb5bAeTU5zueRgMLMFLUYIW8w4TRVLwPV4qgoS3fobHNv84s+yV5MQrBS7fN65Dt57DI
         Q2Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47af8593b12si91205981cf.375.2025.04.22.04.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 04:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7CHO-00047e-IQ; Tue, 22 Apr 2025 07:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=h5bN=XI=kaod.org=clg@ozlabs.org>)
 id 1u7CHH-00045E-SW; Tue, 22 Apr 2025 07:59:03 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=h5bN=XI=kaod.org=clg@ozlabs.org>)
 id 1u7CHF-0001jV-14; Tue, 22 Apr 2025 07:59:03 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZhgkM72Qmz4x04;
 Tue, 22 Apr 2025 21:58:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhgkJ42jGz4wcD;
 Tue, 22 Apr 2025 21:58:45 +1000 (AEST)
Message-ID: <96075887-ed11-4a58-a57c-899646d9ce3f@kaod.org>
Date: Tue, 22 Apr 2025 13:58:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] tests/functional/aspeed: Update test ASPEED SDK
 v03.00 for AST1030
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
 <20250422091504.3666464-4-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250422091504.3666464-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=h5bN=XI=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: Ku3LKAhlMJW2

On 4/22/25 11:15, Jamin Lin wrote:
> Updated test to target SDK version v03.00.
> Removed redundant test case to simplify validation.
> Cleaned up unsupported shell commands.

Were some commands removed from SDK v03.00 ? Testing different
zephyr versions might be interesting in that case, like it would
be for Linux too.

Thanks,

C.




> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/functional/test_arm_aspeed_ast1030.py | 40 ++++-----------------
>   1 file changed, 7 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/functional/test_arm_aspeed_ast1030.py b/tests/functional/test_arm_aspeed_ast1030.py
> index d45d9f7c1c..dafa1d24cb 100755
> --- a/tests/functional/test_arm_aspeed_ast1030.py
> +++ b/tests/functional/test_arm_aspeed_ast1030.py
> @@ -12,36 +12,17 @@
>   
>   class AST1030Machine(LinuxKernelTest):
>   
> -    ASSET_ZEPHYR_1_04 = Asset(
> +    ASSET_ZEPHYR_3_00 = Asset(
>           ('https://github.com/AspeedTech-BMC'
> -         '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip'),
> -        '4ac6210adcbc61294927918707c6762483fd844dde5e07f3ba834ad1f91434d3')
> +         '/zephyr/releases/download/v00.03.00/ast1030-evb-demo.zip'),
> +        '37fe3ecd4a1b9d620971a15b96492a81093435396eeac69b6f3e384262ff555f')
>   
> -    def test_ast1030_zephyros_1_04(self):
> -        self.set_machine('ast1030-evb')
> -
> -        kernel_name = "ast1030-evb-demo/zephyr.elf"
> -        kernel_file = self.archive_extract(
> -            self.ASSET_ZEPHYR_1_04, member=kernel_name)
> -
> -        self.vm.set_console()
> -        self.vm.add_args('-kernel', kernel_file, '-nographic')
> -        self.vm.launch()
> -        self.wait_for_console_pattern("Booting Zephyr OS")
> -        exec_command_and_wait_for_pattern(self, "help",
> -                                          "Available commands")
> -
> -    ASSET_ZEPHYR_1_07 = Asset(
> -        ('https://github.com/AspeedTech-BMC'
> -         '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip'),
> -        'ad52e27959746988afaed8429bf4e12ab988c05c4d07c9d90e13ec6f7be4574c')
> -
> -    def test_ast1030_zephyros_1_07(self):
> +    def test_ast1030_zephyros_3_00(self):
>           self.set_machine('ast1030-evb')
>   
>           kernel_name = "ast1030-evb-demo/zephyr.bin"
>           kernel_file = self.archive_extract(
> -            self.ASSET_ZEPHYR_1_07, member=kernel_name)
> +            self.ASSET_ZEPHYR_3_00, member=kernel_name)
>   
>           self.vm.set_console()
>           self.vm.add_args('-kernel', kernel_file, '-nographic')
> @@ -49,17 +30,10 @@ def test_ast1030_zephyros_1_07(self):
>           self.wait_for_console_pattern("Booting Zephyr OS")
>           for shell_cmd in [
>                   'kernel stacks',
> -                'otp info conf',
> -                'otp info scu',
>                   'hwinfo devid',
>                   'crypto aes256_cbc_vault',
> -                'random get',
> -                'jtag JTAG1 sw_xfer high TMS',
> -                'adc ADC0 resolution 12',
> -                'adc ADC0 read 42',
> -                'adc ADC1 read 69',
> -                'i2c scan I2C_0',
> -                'i3c attach I3C_0',
> +                'jtag jtag@7e6e4100 sw_xfer high TMS',
> +                'iic scan i2c@7e7b0080',
>                   'hash test',
>                   'kernel uptime',
>                   'kernel reboot warm',

