Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp825476njk;
        Wed, 17 Jul 2024 06:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS/J0yDz8GGpldl+5xeWVHQELBQfi0MfrGaykYTKdsupewDOIrwQ0v54tVx7XZ5tbXv5FoMQUSwDasmIJm3VXbjkOEa+OJ
X-Google-Smtp-Source: AGHT+IFsmuPpyVfkNSfJFDwJI2uKPtIgl/P4McBJeXtHwvQIIS0RD98Yfs2ee/xA144GynwSAoQR
X-Received: by 2002:a05:6902:1505:b0:e03:a5ab:66a2 with SMTP id 3f1490d57ef6-e05ed6e0e28mr1914128276.19.1721224488044;
        Wed, 17 Jul 2024 06:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721224488; cv=none;
        d=google.com; s=arc-20160816;
        b=MFvI49ld5lO7Y67Qx6xbric3kWtB2f/+QByHsoiRmgJrRsMAmtvJqG6vwhUANKuto5
         yxtV2d3XG3XpjVlJ4bNbBouxXcKRy5WTt/IbjX+p4PnZFEZi8K5OgXKLhXTz8TF6Y2Si
         Fp4Log3ljbCRhpi6YcKd9fn7l7WQJNjzwz2vZINNVro9oEAFhnK/CmaZkJYuVFRkw4Be
         xoWeLUNE2C1FuxEa0zsRt5tvKhdzqkg0/t05DBUAxO3taAH1YnDpdiNJdg3nkUvSIrpB
         uQEBBrGZzY4ZRTgsjW3jOL/j82Xj+EoaWdAkHdIeBiKsV0Z+6x8CZxgZLPr35xP2N1ez
         +OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iJS5fKvJD7ge9tWHf2BAvXO7kx289tm4UKkm0QMu0sI=;
        fh=E0cHbOw+8NFrYyU6CYfCuPBu5XsF5LfsxwJ8qJVxskk=;
        b=d36HV917/KYx9xUnXQ4wQ2ZwY0MnnwiU16TsRRh9Q1kTT4xRrYKlu5IwuecWYc+PgG
         nJ4hF0JaUZejFFHQsx4gjL6nGqg9HscUxKE2UZFMPgpbUm1So2/j/DxvfiqSnsJaxsFW
         yX/Q5W0YPNqWhBkS01JKSHUyMmthqxu96WghMGwNAeaPDnnJi9g+jqM1/yQk6RfpDk2b
         JlyjFZfDkTzbOGjcF6VHcWtQaqEEECKejA8FltErYmrPYDbUIg5oSERqNOIGxwPHkKeH
         WAcnN2JbzZqnevE/vodMlV2t3JsTNlSPfsC9EV1hJh24hv/LAZvufN1FHimiO6N4CDlP
         ANwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YadKX/Dg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a032c5si97916516d6.311.2024.07.17.06.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 06:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YadKX/Dg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU56u-0000th-Jq; Wed, 17 Jul 2024 09:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sU56o-0000mh-L1
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sU56l-0006tp-M7
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721224452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJS5fKvJD7ge9tWHf2BAvXO7kx289tm4UKkm0QMu0sI=;
 b=YadKX/DgdPWszBfX39PxsGwtImnMyuVGHIO+4M2wAz2AwxhIX0iIFmHEWBLUje7bvRk6oK
 GFv2RShkfY1kebjZNe59i/TD716mH7+tCZyncahykKy3BzTXcvlhGa9v0uJJscfXIvNlYF
 HkpFqlxoOFRYwn06FAoxLaUGDZ23uwQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-9FgSyZt1NRmS-KHmHCdeKQ-1; Wed, 17 Jul 2024 09:54:11 -0400
X-MC-Unique: 9FgSyZt1NRmS-KHmHCdeKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-427a7a65e7dso4169635e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 06:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224450; x=1721829250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJS5fKvJD7ge9tWHf2BAvXO7kx289tm4UKkm0QMu0sI=;
 b=b2vXJY8KgPTG/soQJmgi4x12XnSW+dZ8s1KBDXO0QkH2dkPhCZCSAgEYoB4coNMNuL
 cRt0UAC1XYQfBMbZ7EEsa1XAh8/+Nw0LdaQ7E1+BzqXMP8dz7Cf+8CJbQ2kOPfwQEWtW
 6C2yJ1T5tIDcJuxgPABnwZOws2DOJwCUKg60QUX+pzlNPvcQCkzJ6sOBcqKVTPxx8Wl6
 6yOPIk8ns09WcTZuRcyNHrjpgQo2p5ikP9BPj/k+ar8ytRxs2BXLjiSi9cGhkfhk0PF2
 l6C8rMrdnbbyEMN4JNzHeutZWz3H4BeyTJ+wyHX5R3UUWtGmqyCTBRzr2G30DHJt6Z9A
 w9Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAWjjHUyF8XLjI6ay4kcRrUhxzhMOYg10WGnQc85lIiE8qB8eATSerygEnN+95SiHHmrxLrlQ7CKYj9NP5yMaGbdDG
X-Gm-Message-State: AOJu0Yys+JAsk9n+yLUZ3axdPlfljOUbKXBytOtPU8uTEjzemrK2hw2g
 K8wH8Am/gxGNwhnC9O+FEjS8y2/gYAD17nJcV/UqlwT6nR+JsKw0+cAn/qASyErkxSCslTyWBTI
 YF2svo5wWdMHxViFWzfVhcu6VC6g3/r/nolRAU0oyTLcc9W29X2uRbjP0TQ==
X-Received: by 2002:a05:600c:34d0:b0:426:67f9:a7d8 with SMTP id
 5b1f17b1804b1-427c290a187mr14452875e9.9.1721224449935; 
 Wed, 17 Jul 2024 06:54:09 -0700 (PDT)
X-Received: by 2002:a05:600c:34d0:b0:426:67f9:a7d8 with SMTP id
 5b1f17b1804b1-427c290a187mr14452715e9.9.1721224449588; 
 Wed, 17 Jul 2024 06:54:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccbd2sm11787928f8f.49.2024.07.17.06.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 06:54:09 -0700 (PDT)
Message-ID: <9e0e1879-7859-44df-81a2-362323f9df01@redhat.com>
Date: Wed, 17 Jul 2024 15:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Add eMMC boot tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240717130657.648701-1-clg@redhat.com>
 <e29093fb-d36f-4d77-ba1c-e277f2441d09@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <e29093fb-d36f-4d77-ba1c-e277f2441d09@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SbBRgbaazFLx

On 7/17/24 15:49, Philippe Mathieu-Daudé wrote:
> On 17/7/24 15:06, Cédric Le Goater wrote:
>> The image was built using the process described in commit c8cb19876d3e
>> ("hw/sd/sdcard: Support boot area in emmc image") with artefacts from
>> the latest successful build of the IBM P10 BMC platform available on:
>>
>>    https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/avocado/machine_aspeed.py | 38 +++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
>> index f66ad38d3503..1deb8472818f 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -439,3 +439,41 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
>>           self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
>>           self.ssh_connect('root', '0penBmc', False)
>> +class AST2x00MachineMMC(QemuSystemTest):
>> +
>> +    timeout = 240
>> +
>> +    def wait_for_console_pattern(self, success_message, vm=None):
>> +        wait_for_console_pattern(self, success_message,
>> +                                 failure_message='Kernel panic - not syncing',
>> +                                 vm=vm)
>> +
>> +    def test_arm_aspeed_emmc_boot(self):
>> +        """
>> +        :avocado: tags=arch:arm
>> +        :avocado: tags=machine:rainier-bmc
> 
>            :avocado: tags=device:emmc


updated.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> +        """
> 
> $ make check-avocado AVOCADO_TAGS=machine:rainier-bmc
> Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian
> Fetching asset from tests/avocado/machine_aspeed.py:AST2x00MachineMMC.test_arm_aspeed_emmc_boot
> JOB ID     : ed89ecf5e166e7f636cc731c0242ba6e714fea39
> JOB LOG    : build/tests/results/job-2024-07-17T14.45-ed89ecf/job.log
>   (1/2) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian: PASS (21.55 s)
>   (2/2) tests/avocado/machine_aspeed.py:AST2x00MachineMMC.test_arm_aspeed_emmc_boot: PASS (43.71 s)
> RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 174.68 s
> 
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks,

C.

