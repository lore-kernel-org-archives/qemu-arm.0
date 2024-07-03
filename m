Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2465794njm;
        Wed, 3 Jul 2024 02:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN6+j3Y0gLkUent/8UEeCJhdITllI9GXQ6VgqQVTPI4FPkq3DAsNVqy0Py33lNh6O3Rs8a5SE6IMUiIXptz57UKsasc0Wb
X-Google-Smtp-Source: AGHT+IEfOv4yKGE4lDSpo8V/okl3qDCt6RtskfDMmtz4yeV8VHqJ6ufB+g97Z/3OP/Ppe6bWtGlX
X-Received: by 2002:a05:622a:19a4:b0:446:51d0:814 with SMTP id d75a77b69052e-44662e578e2mr150534341cf.57.1719998357179;
        Wed, 03 Jul 2024 02:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719998357; cv=none;
        d=google.com; s=arc-20160816;
        b=iaAdcrXpJS9pLjoM5xu9nTLYjFBVzd5Z+kjTnl8uKUAiDQmGIzoWmEm2HKI+6cFl7m
         SXP6nb/bLYSWeERVTVn8WKAsQBf0KBYaGLLOeC2c11yAaM0wtoSt3l4XRrYiBaU12nW2
         BdYprwi6a0/le9FF5mtkYFp29bIdawkpInogaqKbgRxswWR1G7o2Y7vZiTJeDo0YXi8J
         /5lyjERW1EOh+0h7dGD9hYxIFXmmj9iq/n//1Tunhw1iW9Bc5df+PIWQKyqBe9Rlzywy
         /d/VWOvjW3wwK/p7Wqfs0uTH5KW/YkW+4iT8BF/t6OG79Abgo74cQkYfZb1YfdSXjvf5
         e2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=rYnUz/Mo+SHjrdlmlERkDDvakOCXjb3o6QTb84KbuFI=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=XruyCw1r5Zf+GHYpi+3oykCRTq/9AKK49LthEJV1dmDNxGZcIp+ydOs/fkajcs4cRi
         xoa/cH0M6JGqhVe8t/tcwszfH3+/CzLi4VB65ZB2rp8MsQfZ3FlnZwqPckvwlmqLRW1J
         5wMyjo84gldr2KHT0ketj1h8/Q57j+q8zBN5t7B5RaS+f29oOGg2IJUutS+fMSFEZM5+
         mk5YY6IQ5nbNuHzc/AcfqqYCCdtex2nbWw99Wv0PX3zgAbbG8yUwl3aR2gYDzmiaJpsw
         xS5LmKXtaXN4mOlb2FQAaYhKiAv9YxhSXcC5a296cnaq6zXUUEdNnGdgGqOnB22pTS6o
         13EQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514da64esi121585161cf.706.2024.07.03.02.19.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 02:19:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOw8d-0005R4-BU; Wed, 03 Jul 2024 05:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dfZQ=OD=kaod.org=clg@ozlabs.org>)
 id 1sOw8b-0005QY-Bh; Wed, 03 Jul 2024 05:18:53 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dfZQ=OD=kaod.org=clg@ozlabs.org>)
 id 1sOw8Z-0008US-6Y; Wed, 03 Jul 2024 05:18:53 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WDZ2s1c1mz4x0w;
 Wed,  3 Jul 2024 19:18:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDZ2k5gFzz4wxs;
 Wed,  3 Jul 2024 19:18:19 +1000 (AEST)
Message-ID: <153d7e87-28d6-403c-9d84-786c52cd6acb@kaod.org>
Date: Wed, 3 Jul 2024 11:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] test/avocado/machine_aspeed.py: update to test
 network for AST2700
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
References: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
 <20240703081623.2740862-6-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240703081623.2740862-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=dfZQ=OD=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: JrAwyXNSpWYc

On 7/3/24 10:16 AM, Jamin Lin wrote:
> Update a test case to test network connection via ssh and
> changes to test Aspeed OpenBMC SDK v09.02 for AST2700.
> 
> ASPEED fixed TX mask issue from linux/drivers/ftgmac100.c.
> It is required to use ASPEED SDK image since v09.02
> for AST2700 QEMU network testing.
> 
> A test image is downloaded from the ASPEED Forked OpenBMC GitHub
> release repository :
> https://github.com/AspeedTech-BMC/openbmc/releases/
> 
> Test command:
> ```
> cd build
> pyvenv/bin/avocado run ../qemu/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_aarch64_ast2700_evb_sdk_v09_02
> ```
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Could you please split the patch ? The change of SDK should be
a standalone patch.


Thanks,

C.


> ---
>   tests/avocado/machine_aspeed.py | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 3a20644fb2..855da805ae 100644
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
> @@ -387,15 +387,15 @@ def test_arm_ast2600_evb_sdk(self):
>           year = time.strftime("%Y")
>           self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
>   
> -    def test_aarch64_ast2700_evb_sdk_v09_01(self):
> +    def test_aarch64_ast2700_evb_sdk_v09_02(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:ast2700-evb
>           """
>   
>           image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
> -                     'download/v09.01/ast2700-default-obmc.tar.gz')
> -        image_hash = 'b1cc0fd73c7650d34c9c8459a243f52a91e9e27144b8608b2645ab19461d1e07'
> +                     'download/v09.02/ast2700-default-obmc.tar.gz')
> +        image_hash = 'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7'
>           image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>                                         algorithm='sha256')
>           archive.extract(image_path, self.workdir)
> @@ -436,4 +436,5 @@ def test_aarch64_ast2700_evb_sdk_v09_01(self):
>   
>           self.vm.add_args('-smp', str(num_cpu))
>           self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
> -
> +        self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
> +        self.ssh_connect('root', '0penBmc', False)

