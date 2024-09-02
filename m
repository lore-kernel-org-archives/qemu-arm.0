Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1106751njf;
        Mon, 2 Sep 2024 06:41:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaNQusDPjijIjL/26z1daoBof1OTvC+e35jogMol5QRo6ToWXRjF2/7KoQjL+gl2BBxhUn1VIsn47EwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGgkK1cUlWTCeDJj2DUCa/QOZZlES0lso2ejCMC1GAGK3SeAIa9HrM7n9r6J1T/HElKKVDu
X-Received: by 2002:a05:6214:3f89:b0:6c3:53a9:d610 with SMTP id 6a1803df08f44-6c355438021mr110758306d6.38.1725284519095;
        Mon, 02 Sep 2024 06:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725284519; cv=none;
        d=google.com; s=arc-20160816;
        b=bflUW9LJEPe+cd7atcq1abs2ncYMjeZwIdL/uOGi//zF50QXA9MLKs6tkBJnlc6Q9a
         sEcj/g9AOHDg5vUADpegXfnSEO/4Q2NM1NxYkdzeX6RgAPa507aZOF2dw9lI+iYTmZjK
         JSpM1BtBZKbPmjGk6UDEvcJ3Y5sgpe3h0Fh+QgJ6wpkyHZhqiJRjYH+AfqtlDoxEKhi4
         t1qZ9eDVhzhXAiLzIXXQsxLZZfJFT1jOSFuGZMnAxAcgzD6d5Zlx18/UmVKCsoIcK6fl
         lo6giJIqKpsCD3VtEYlVtOU+6bZ9xQCUPXwLn5wHIXndcEM6tIMRDrzQ9imZBrS3JW5M
         UyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=knTnmfpxZMFgKMk4omFigEjPXy4QMtOao0p+y+aR5jc=;
        fh=P9eF86Qai1jM7EkBuFwf50J/wVjW4uTYQ/nRQ7unStY=;
        b=o4nC+MMA51XCzjxnPIPbFoii3GhZIMYPyZ2sXa3mfA2n95npY7je/M1eFREVxh/oqp
         QtFW9bq5/eY8BbUqaTx9797i6lanUkfA/BxEe/bN2Hqeeonpq1Pkil3T17nU6T9B4lo2
         ALgqTPbVNl8dbHwWhiRgAmG3F1Pm+cUhTdfXZ4HUvR5PO9rmCJaGAqLTfhfCVMsnj8aI
         XFgi318K8vKKBmFQOItxXGr1v3EG5zB5fDg5hcCG58ijLSUClXmX3Ga23GsZMaC1JeqG
         yluxcIutZpfqXeG1ZU4uAkzgE5/WbyqAM/Vt+ahLYZA8Nquj6VM0lLMYGQPQd1b54nKf
         joFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35b9fe313si48513816d6.33.2024.09.02.06.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 06:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl7JT-0000ri-RD; Mon, 02 Sep 2024 09:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl7JP-0000qC-6c; Mon, 02 Sep 2024 09:41:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl7JN-0000Vc-1H; Mon, 02 Sep 2024 09:41:42 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Wy8zx5cNrz4x9F;
 Mon,  2 Sep 2024 23:41:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wy8zr6QK1z4w2Q;
 Mon,  2 Sep 2024 23:41:28 +1000 (AEST)
Message-ID: <19eabec2-0ba9-476b-9a84-59f64e855ea2@kaod.org>
Date: Mon, 2 Sep 2024 15:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] machine_aspeed.py: update to test I2C for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
 <20240808024916.1262715-12-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240808024916.1262715-12-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=3a9v=QA=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8kthjiKB0kbF

On 8/8/24 04:49, Jamin Lin wrote:
> Update test case to test lm75 temperature sensor.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/avocado/machine_aspeed.py | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index f8e263d37e..6935f5f57c 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -435,9 +435,25 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
>                                f'loader,addr=0x430000000,cpu-num={i}')
>   
>           self.vm.add_args('-smp', str(num_cpu))
> +        self.vm.add_args('-device',
> +                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
>           self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
>           self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
> +
>           self.ssh_connect('root', '0penBmc', False)
> +        self.ssh_command('dmesg -c > /dev/null')
> +
> +        self.ssh_command_output_contains(
> +            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device '
> +            '&& dmesg -c',
> +            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
> +
> +        self.ssh_command_output_contains(
> +            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
> +        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
> +                    property='temperature', value=18000)
> +        self.ssh_command_output_contains(
> +            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
>   
>   class AST2x00MachineMMC(QemuSystemTest):
>   

