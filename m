Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2865454njd;
        Wed, 23 Apr 2025 00:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3s+588azkiBgTkobgZJG1KiYTV3/No0UATPX2odG1JtLg6PASjXFIey1MOb3cLToiFOz2MB/zP0xirw==@linaro.org
X-Google-Smtp-Source: AGHT+IGuxzv18ZgXSsQ+rINtij7XtM74frzr5baFaFOTe+6ZWW6pcG0zmf90bAH12RZYx+rymNVE
X-Received: by 2002:a05:622a:1101:b0:476:afd2:5b46 with SMTP id d75a77b69052e-47aec3e2b56mr234884351cf.25.1745394062963;
        Wed, 23 Apr 2025 00:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745394062; cv=none;
        d=google.com; s=arc-20240605;
        b=jt6qCFwRnjNH6TMmOdY/jO9EyyFiD6rCuVmOA7PopbS6hLBU0I4jo6ZUa7Mo2yBUeM
         3EAbsRS6NxCZbLiyURvnrUBKVbrybbMJ3xbLEM3WP9ON5CICQ0J4HLsikSTEO5tCW1W6
         RPwLIYNV5uMQ/LxU2j6xTvL7QS0Ns9WXStU4iSqKrasZpiyxX1lyrpDviKm7Zw/7PJZo
         aT0gJyFuLC+ciwmxbU9q4q6XaPDScRFXZsebZ9mJm0qVUA4zIq7HHiTuDuwch7UQtbSN
         RuSG6mnQZd+dSylc2TQD3ATQGoPThqrNXXwhtUd86MMR/KWbEyVJDF836DtO5Z3eX9pR
         ceRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=A4N85fjK7NUngDJaSaJ7V0FRpW4jpsMpAn0v38gY6n4=;
        fh=aTXBRWvcUi1tLADA5DrDnV7F47mfdIt5smkQi/SmRpk=;
        b=joQcG1Kx8pmWJcxdpeBxqck6mAIrLMAe5vXweGKZ/ej2ktx4qiOkQxTFUOR7vYqaSl
         X4F39cJi9HPdx9xI8Ffky8k1/dO93X52tjHz4/qIsvEYBa9mv4vxH+wkZVwRQPKDRoLS
         MJLr71j/QKJbXFIonzhIqD0n0tOCUQfSrr/lQVLkDIQXmR90U+6izY8BC+vkrPKFgJ5a
         wp9AiVAb8S2FwcOXRSmmtPwNhrsMZl3YtpWz4d/sdbwgGkXvPkLjYGNQXjw5W7LsXF1T
         AxGE7Yf2/fhcQRaDhseO3yUscO3acKj76nE5pdcH8Slni7PAw2jckJeAh1wJP7uvDj33
         1IZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cb83dcsi128029251cf.445.2025.04.23.00.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7Uj1-0005mY-8K; Wed, 23 Apr 2025 03:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org>)
 id 1u7Uin-0005KL-Ud; Wed, 23 Apr 2025 03:40:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org>)
 id 1u7Uil-0003hF-KI; Wed, 23 Apr 2025 03:40:41 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Zj9xs5dFDz4xN1;
 Wed, 23 Apr 2025 17:40:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zj9xp22gwz4xM2;
 Wed, 23 Apr 2025 17:40:29 +1000 (AEST)
Message-ID: <f1098e34-cb4a-47d1-8791-0395bd98a0b9@kaod.org>
Date: Wed, 23 Apr 2025 09:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] tests/functional/aspeed: extract boot and login
 sequence into helper function
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
 <20250423072350.541742-10-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250423072350.541742-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fuiiCdr8Glyk

On 4/23/25 09:23, Jamin Lin wrote:
> Extracted repeated boot and login steps into a new helper function.
> No change in functional behavior.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/functional/test_aarch64_aspeed.py | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
> index 337d701917..2f04655b60 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -25,10 +25,15 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>   
>           self.vm.launch()
>   
> +    def verify_openbmc_boot_and_login(self, name):
>           wait_for_console_pattern(self, 'U-Boot 2023.10')
>           wait_for_console_pattern(self, '## Loading kernel from FIT Image')
>           wait_for_console_pattern(self, 'Starting kernel ...')
>   
> +        wait_for_console_pattern(self, f'{name} login:')
> +        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> +        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
> +
>       ASSET_SDK_V906_AST2700 = Asset(
>               'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-a0-default-obmc.tar.gz',
>               '7247b6f19dbfb700686f8d9f723ac23f3eb229226c0589cb9b06b80d1b61f3cb')
> @@ -89,16 +94,12 @@ def start_ast2700_test(self, name):
>           self.do_test_aarch64_aspeed_sdk_start(
>               self.scratch_file(name, 'image-bmc'))
>   
> -        wait_for_console_pattern(self, f'{name} login:')
> -
> -        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> -        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
> -
>       def test_aarch64_ast2700_evb_sdk_v09_06(self):
>           self.set_machine('ast2700-evb')
>   
>           self.archive_extract(self.ASSET_SDK_V906_AST2700)
>           self.start_ast2700_test('ast2700-a0-default')
> +        self.verify_openbmc_boot_and_login('ast2700-a0-default')
>           self.do_ast2700_i2c_test()
>   
>       def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
> @@ -106,6 +107,7 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
>   
>           self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
>           self.start_ast2700_test('ast2700-default')
> +        self.verify_openbmc_boot_and_login('ast2700-default')
>           self.do_ast2700_i2c_test()
>   
>   if __name__ == '__main__':

