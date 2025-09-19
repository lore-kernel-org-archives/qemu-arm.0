Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5724ECAC59A
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Sep 2025 08:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzW7w-0004xi-3a; Fri, 19 Sep 2025 04:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzW7t-0004vd-LH
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uzW7r-0006o6-E2
 for qemu-arm@nongnu.org; Fri, 19 Sep 2025 04:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758269149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FbSXNfwjeJK59L1O0kxY34YbvRazp9gayZSbxh5qKww=;
 b=TZCVe44yO6i7RlXHO1aR7pfujWJboZ7eZ+xQ7vhU5oVK9FWv2LxHdV/LjdQ2XqfaUZYtSz
 5IrLHM1oCjwJz/Tnn+VDYMsYBx8OK2nK4uJkI0wxJaBQzIcl8A0DB/Hu1cBvm+VSu4am6W
 oFMo4DDy391gbf9PdFzTibiTNcBJmKA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Jn5cHwjhMA6Q6rkxH-7RuA-1; Fri, 19 Sep 2025 04:05:47 -0400
X-MC-Unique: Jn5cHwjhMA6Q6rkxH-7RuA-1
X-Mimecast-MFC-AGG-ID: Jn5cHwjhMA6Q6rkxH-7RuA_1758269147
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3e8c4aa37bbso594448f8f.3
 for <qemu-arm@nongnu.org>; Fri, 19 Sep 2025 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758269146; x=1758873946;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FbSXNfwjeJK59L1O0kxY34YbvRazp9gayZSbxh5qKww=;
 b=GxScn0niKT2Hj0jwAl5PM+Yk/LeQTtwOJLKowPFP7evWjneGbk01Q1/F0fBhOA+kOr
 n7q8PkdRsABriFpvuLu8V6l2bFs327cd88kJNWxDDBXqPU9dxuxnyabtyn0BSCSl6/c8
 01ZSGxQRYV4qb5fll+iS7JzWXonRNBYgZsmdacZ0LMpQ94REW4NVKyENaswR0YwwUu8d
 sRBN3p+ErY07AruaiAYsaAtPxJGn8QDmMTBRfSV2sWOp4/GpTFQYBOtCf6sj5BWOMv7X
 E+37l3w3Ip8Ki2NVdq93AbXR5VBHEHy1FORQa8XZ6lGEPYQ2NH9frRJden2T3rW0TvWj
 M63Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCViNQ0ZGRisd3MHAG8tlSyuoEj/YxEX+Y9T/++C8uOrO23ajWiwIDdMS4cH3+XobHMNDiHDc0DSGg==@nongnu.org
X-Gm-Message-State: AOJu0Yza+30XxsJ5ovnofAvc7RFEz+aK7UqMCz/6nvEW/UkrBM0KJJci
 aq1efVE3tGldD/TRW36lHkYyRvCuoOlBLQuPiuqmy66Zpe31gFU8fQgKy1ji12Qj9kPhf8qcjyl
 Ocg0RfIYd4lmR4SSSL9buylMyljNcRkclxLZfTatX9F/ZPIu44iFWwA==
X-Gm-Gg: ASbGncv1hRfgNqT4Zgb14et2Q+ntvBlZO7YGY1B2Xe72BQsXSkEzR0ZYA5GO+tHRCfe
 jDSLgBBSSJEuLP8CGxJ7ORmSXfu5NMLEyFi1HyFZUYWnXZjM5Vsnr6wafthIGXlEY5N/RrGGHjx
 /6EK0npyhshS22KiIwPgT1s/xjg5ZXDpXz72Oahy8VeRRWQ1AWgLOcsFZrcnzahULvpSJmxIwHd
 UqBp2r53t6HtylYXbplowh32B3pjoViMqIEeN4698HaCOq0WhxrKecNbseOG/XPfGrAxtA3pVDI
 Z623qoEqddI9QLTvofDO1lW2PQmsmUWM9iz4V0X8FerFR8hb21NQFbKP3TPIgbGK8XO0HziocPK
 qxWs=
X-Received: by 2002:a05:6000:1a86:b0:3e8:f67:894a with SMTP id
 ffacd0b85a97d-3ee7c552a12mr1907878f8f.5.1758269146491; 
 Fri, 19 Sep 2025 01:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEabPYeM68K8ROwhOqzy0C4NhV47TDIPpOpIxeDeB5BouB3JP5ahSv08F7e5GxuPwmDD9V7tA==
X-Received: by 2002:a05:6000:1a86:b0:3e8:f67:894a with SMTP id
 ffacd0b85a97d-3ee7c552a12mr1907840f8f.5.1758269145993; 
 Fri, 19 Sep 2025 01:05:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7284sm6790274f8f.33.2025.09.19.01.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:05:45 -0700 (PDT)
Message-ID: <c282f3a5-11a6-4890-8d8e-1ce283d12ebd@redhat.com>
Date: Fri, 19 Sep 2025 10:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v4 13/14] tests/functional/arm/test_aspeed_ast2600:
 Add PCIe and network test
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com, wuhaotsh@google.com,
 titusr@google.com
References: <20250919032431.3316764-1-jamin_lin@aspeedtech.com>
 <20250919032431.3316764-14-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250919032431.3316764-14-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dv7tiviK8JVjWdGIEJcCoJnbJCtR7R-d_DodxdMBvH8_1758269147
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/19/25 05:24, Jamin Lin wrote:
> Extend the AST2600 functional tests with PCIe and network checks.
> 
> This patch introduces a new helper "do_ast2600_pcie_test()" that runs "lspci"
> on the emulated system and verifies the presence of the expected PCIe devices:
> 
> - 80:00.0 Host bridge: ASPEED Technology, Inc. Device 2600
> - 80:08.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge
> - 81:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection
> 
> To exercise the PCIe network device, the test adds:
> 
>    -device e1000e,netdev=net1,bus=pcie.0
>    -netdev user,id=net1
> 
> and assigns an IP address to the interface, verifying it with `ip addr`.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   tests/functional/arm/test_aspeed_ast2600.py | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/functional/arm/test_aspeed_ast2600.py b/tests/functional/arm/test_aspeed_ast2600.py
> index 87e3595584..49ffe89d91 100755
> --- a/tests/functional/arm/test_aspeed_ast2600.py
> +++ b/tests/functional/arm/test_aspeed_ast2600.py
> @@ -101,8 +101,26 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
>           'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.07/ast2600-default-obmc.tar.gz',
>           'cb6c08595bcbba1672ce716b068ba4e48eda1ed9abe78a07b30392ba2278feba')
>   
> +    def do_ast2600_pcie_test(self):
> +        exec_command_and_wait_for_pattern(self,
> +            'lspci -s 80:00.0',
> +            '80:00.0 Host bridge: '
> +            'ASPEED Technology, Inc. Device 2600')
> +        exec_command_and_wait_for_pattern(self,
> +            'lspci -s 80:08.0',
> +            '80:08.0 PCI bridge: '
> +            'ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge')
> +        exec_command_and_wait_for_pattern(self,
> +            'lspci -s 81:00.0',
> +            '81:00.0 Ethernet controller: '
> +            'Intel Corporation 82574L Gigabit Network Connection')
> +        exec_command_and_wait_for_pattern(self,
> +            'ip addr show dev eth4',
> +            'inet 10.0.2.15/24')
> +
>       def test_arm_ast2600_evb_sdk(self):
>           self.set_machine('ast2600-evb')
> +        self.require_netdev('user')
>   
>           self.archive_extract(self.ASSET_SDK_V907_AST2600)
>   
> @@ -110,6 +128,8 @@ def test_arm_ast2600_evb_sdk(self):
>               'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test')
>           self.vm.add_args('-device',
>               'ds1338,bus=aspeed.i2c.bus.5,address=0x32')
> +        self.vm.add_args('-device', 'e1000e,netdev=net1,bus=pcie.0')
> +        self.vm.add_args('-netdev', 'user,id=net1')
>           self.do_test_arm_aspeed_sdk_start(
>               self.scratch_file("ast2600-default", "image-bmc"))
>   
> @@ -135,6 +155,7 @@ def test_arm_ast2600_evb_sdk(self):
>           year = time.strftime("%Y")
>           exec_command_and_wait_for_pattern(self,
>                '/sbin/hwclock -f /dev/rtc1', year)
> +        self.do_ast2600_pcie_test()
>   
>       def test_arm_ast2600_otp_blockdev_device(self):
>           self.vm.set_machine("ast2600-evb")


