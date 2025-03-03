Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2740610njb;
        Mon, 3 Mar 2025 08:47:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6bLIqjU5DI7XvO3MNUyAH4PwwmPu5BAnfyjhqnnZC503WSQ2hbhkmnnqZs8HcpkhzFOOCkExSCr1x6w==@linaro.org
X-Google-Smtp-Source: AGHT+IETJ1Dti+hEmo12VUDEgbR0lfkOv9V3wMQF3JfpDa8mwaSU76XldURcGtFO8y35n4RhnkJA
X-Received: by 2002:a05:622a:1988:b0:471:c7d7:ca80 with SMTP id d75a77b69052e-474bc08d18emr231922971cf.31.1741020466172;
        Mon, 03 Mar 2025 08:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741020466; cv=none;
        d=google.com; s=arc-20240605;
        b=eIfwQ1gzMWOkuS4Z8Itm42TRyMTeCFeRu7NQ3HWdLo3sg+CASG9AlWyERJGXDwela6
         G0dAe40l8d+zsfbAATOBy8FDbY1aFbJTnqBwHbRsafsbfrTZF+kcqhmTAYfMuDbHhFrK
         SrXKpoq4V0goldRKyzjJkjMGKbHeYlt20nZLBheBk4MxqLVNVMVp9THtTLxEBdoNhRxs
         iRxMLZR6vqi9DJkmrhIJpex/cHIRzcOomQ5TB7wIrCL+4zrLjV8844FUrpdvMAlZ6laK
         6NxlIRu7atu6E8/OepGQ541oYhzFIM3ZLbDohwNgyIXGOFTtbo2LFMz3syrFqe5kWcBs
         GDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=dtv7iVwgSlfSDoW4RLD4wS3Lr3R3yA/FYRq7OBb2qfE=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=FtHrEFh85ahjTMPeE1+E1U32w5q+c9bWZ3pDF7/hmx1jtgT08wPOcMftJ0R4VG8eMj
         rJdmntywACUr5qzpGIsv9HiiNMNLTmZjz4nTabV1l3uhe4noWJkYTbxxJsCKlOEBHaow
         srAZpfCLG3QAlqn6ejnM2wxPHMH+a8Z4nTQqbBEwyoJGrhV7Y+Nl0bWCko72O0I9+Tcm
         oR6RHuQp94kESY1pPQzJSKCf0KXvSbbB7BYyZ2N1tqVwYS5h7qk8Gbt23l52NUmUNgEI
         Z1FjAFPe2GPYU1JW+8adje/6475FfNH3MtxYMSELWzEWMLtSrnp9qyu2XZiHO4w0KU+L
         fDPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474db85178fsi31470121cf.643.2025.03.03.08.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 08:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp8x3-0003gm-Th; Mon, 03 Mar 2025 11:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp8wv-0003gQ-1W; Mon, 03 Mar 2025 11:47:25 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp8ws-0001xf-6f; Mon, 03 Mar 2025 11:47:24 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z64VC0qNlz4x3d;
 Tue,  4 Mar 2025 03:47:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z64V74kvNz4wcy;
 Tue,  4 Mar 2025 03:47:10 +1100 (AEDT)
Message-ID: <20cb2466-4f61-4544-b8b2-c92c51bcc8a9@kaod.org>
Date: Mon, 3 Mar 2025 17:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/23] tests/functional/aspeed: Introduce
 start_ast2700_test API and update hwmon path
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
 <20250303095457.2337631-21-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250303095457.2337631-21-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Robu=VW=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: IWFGtRjiB4am

On 3/3/25 10:54, Jamin Lin wrote:
> Added a new method "start_ast2700_test" to the "AST2x00MachineSDK" class and
> this method centralizes the logic for starting the AST2700 test, making it
> reusable for different test cases.
> 
> Modified the hwmon path to use a wildcard to handle different SDK versions:
> "cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input".

Please split in two patches.


Thanks,

C.


> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/functional/test_aarch64_aspeed.py | 33 +++++++++++++------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
> index 9595498ace..07b0c7c1fd 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -31,33 +31,29 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>               'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
>               '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
>   
> -    def test_aarch64_ast2700_evb_sdk_v09_03(self):
> -        self.set_machine('ast2700-evb')
> -
> -        self.archive_extract(self.ASSET_SDK_V903_AST2700)
> -
> +    def start_ast2700_test(self, name):
>           num_cpu = 4
> -        uboot_size = os.path.getsize(self.scratch_file('ast2700-default',
> +        uboot_size = os.path.getsize(self.scratch_file(name,
>                                                          'u-boot-nodtb.bin'))
>           uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
>   
>           load_images_list = [
>               {
>                   'addr': '0x400000000',
> -                'file': self.scratch_file('ast2700-default',
> +                'file': self.scratch_file(name,
>                                             'u-boot-nodtb.bin')
>               },
>               {
>                   'addr': str(uboot_dtb_load_addr),
> -                'file': self.scratch_file('ast2700-default', 'u-boot.dtb')
> +                'file': self.scratch_file(name, 'u-boot.dtb')
>               },
>               {
>                   'addr': '0x430000000',
> -                'file': self.scratch_file('ast2700-default', 'bl31.bin')
> +                'file': self.scratch_file(name, 'bl31.bin')
>               },
>               {
>                   'addr': '0x430080000',
> -                'file': self.scratch_file('ast2700-default', 'optee',
> +                'file': self.scratch_file(name, 'optee',
>                                             'tee-raw.bin')
>               }
>           ]
> @@ -76,23 +72,28 @@ def test_aarch64_ast2700_evb_sdk_v09_03(self):
>           self.vm.add_args('-device',
>                            'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
>           self.do_test_aarch64_aspeed_sdk_start(
> -            self.scratch_file('ast2700-default', 'image-bmc'))
> +            self.scratch_file(name, 'image-bmc'))
>   
> -        wait_for_console_pattern(self, 'ast2700-default login:')
> +        wait_for_console_pattern(self, f'{name} login:')
>   
>           exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> -        exec_command_and_wait_for_pattern(self,
> -            '0penBmc', 'root@ast2700-default:~#')
> +        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
>   
>           exec_command_and_wait_for_pattern(self,
>               'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
>               'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
>           exec_command_and_wait_for_pattern(self,
> -            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
> +            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
>           self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
>                       property='temperature', value=18000)
>           exec_command_and_wait_for_pattern(self,
> -            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
> +            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
> +
> +    def test_aarch64_ast2700_evb_sdk_v09_03(self):
> +        self.set_machine('ast2700-evb')
> +
> +        self.archive_extract(self.ASSET_SDK_V903_AST2700)
> +        self.start_ast2700_test('ast2700-default')
>   
>   
>   if __name__ == '__main__':

