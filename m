Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp698140ejx;
        Fri, 4 Nov 2022 08:10:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ssmV8JSVAkpw5jsPYVh8L8WH8QHxRORPA3Y+Gje9NImZkFI4NpgbBxZXmwZUOKDFdan20
X-Received: by 2002:a5d:64aa:0:b0:236:8dd2:b6ae with SMTP id m10-20020a5d64aa000000b002368dd2b6aemr22657946wrp.420.1667574599831;
        Fri, 04 Nov 2022 08:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667574599; cv=none;
        d=google.com; s=arc-20160816;
        b=F9LzoeXrUZk+hyDb/OWtAygRA/upX4C9x9X1S4b3bbVtrgHLVj33LsNnXgQ7imYZ+6
         rYSyz/EaLF72G6/kquPrPdVpHd2bAr1eAzwOziQOJk8wSG1RGgdHYzY4qbfqB2h8YREA
         QTnIjyav3eX+i3ETKLXpuwq0wBC0qaYucS915NhH7UfwIyUrYLV4lJ6B44qyJYvs7qFI
         P50ANMR7DX+Sc4xx1TZP/5Uql+52jIiVopxT4cXSL1iJoFO5dSeG1sT140BBmMtwSUc6
         Ag729uOX316kDf1qB4+C6nNfXlYMRPXZXr9pVz8+fGqDXRlFNK3Y2gvDJ6t0JHV+DqTp
         ZzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=JVdkKT2O6z1dB4TVjN5mhCjhJ6+xDGtq0druC21I9GA=;
        b=Iuo5RiINyaf0Bto2F84/FCv7iPCP+JHCimgyHO8bpKCtgt/g4A6DI5lSdtqUu66c3G
         kbUY7kc69w0P/WpgdEqE1IumKFomXbu+IdW/DqNjkrQWpvXM/5ok79R09gyz16Nb8iiJ
         LyKuJ9bthRh/e8aBmTORUoieFeiXFRrgEM62LB39vUDRlrizjThz/Ty91CMl01wVidpg
         tf6Kt7TBZmYCi0WPjYg8B5MLRxn0vcaRHNUtLBnvKY4kcqupT875mRmiC9446FTLBy6Y
         YQw8Vxx/FvJzsJC4rY5A0OD/qlLyawvfstg+gUviXs25Bm5dp+muHc3tDLkhmzM5p9Ol
         ulzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.48.137 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 9.mo548.mail-out.ovh.net (9.mo548.mail-out.ovh.net. [46.105.48.137])
        by mx.google.com with ESMTPS id h2-20020adff182000000b00236d8c41efasi3012321wro.709.2022.11.04.08.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.48.137 as permitted sender) client-ip=46.105.48.137;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.48.137 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 41EB422445;
	Fri,  4 Nov 2022 15:09:58 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 16:09:57 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-99G0033bd5bdf7-106c-4f1c-ab7c-c34b264805db,
                    945B05C848FD95514DBD7F319F49D9B690A786E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <846a83c7-45b5-2058-110c-3d8e9c1fa4b5@kaod.org>
Date: Fri, 4 Nov 2022 16:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Reduce noise on the
 console for SDK tests
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>
References: <20221104075347.370503-1-clg@kaod.org>
 <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c96c3fc5-91c4-42b6-96ac-9ae87c76811d
X-Ovh-Tracer-Id: 3118179792421489513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
X-TUID: ULHN2fNc+eKl

On 11/4/22 10:41, Philippe Mathieu-Daudé wrote:
> On 4/11/22 08:53, Cédric Le Goater wrote:
>> The Aspeed SDK images are based on OpenBMC which starts a lot of
>> services. The output noise on the console can break from time to time
>> the test waiting for the logging prompt.
> 
> IIUC OpenBMC uses systemd, so you can mask pointless services from
> the kernel cmdline. See for example test_arm_quanta_gsj():
> 
>   # Disable drivers and services that stall for a long time during boot,
>   # to avoid running past the 90-second timeout. These may be removed
>   # as the corresponding device support is added.
>   kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + (
>           'console=${console} '
>           'mem=${mem} '
>           'initcall_blacklist=npcm_i2c_bus_driver_init '
>           'systemd.mask=systemd-random-seed.service '
>           'systemd.mask=dropbearkey.service '
>   )

Good idea. I will respin with some extra disablement to reduce the
number of services, specially the ones requiring devices without
a backing model in QEMU.
  
> 
>> Change the U-Boot bootargs variable to add "quiet" to the kernel
>> command line and reduce the output volume. This also drops the test on
>> the CPU id which was nice to have but not essential.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
>> index fba6527026..1fc385e1c8 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -12,6 +12,7 @@
>>   from avocado_qemu import wait_for_console_pattern
>>   from avocado_qemu import exec_command
>>   from avocado_qemu import exec_command_and_wait_for_pattern
>> +from avocado_qemu import interrupt_interactive_console_until_pattern
>>   from avocado.utils import archive
>>   from avocado import skipIf
>> @@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
>>   class AST2x00MachineSDK(QemuSystemTest):
>> +    EXTRA_BOOTARGS = ' quiet'
> 
> Maybe less bug-prone to handle the spaces around EXTRA_BOOTARGS where
> the variable is used.

sure.

Thanks,

C.


> 
>> -    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>> +    def do_test_arm_aspeed_sdk_start(self, image):
>>           self.require_netdev('user')
>>           self.vm.set_console()
>>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> @@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>>           self.vm.launch()
>>           self.wait_for_console_pattern('U-Boot 2019.04')
>> -        self.wait_for_console_pattern('## Loading kernel from FIT Image')
>> +        interrupt_interactive_console_until_pattern(
>> +            self, 'Hit any key to stop autoboot:', 'ast#')
>> +        exec_command_and_wait_for_pattern(
>> +            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
>> +        exec_command_and_wait_for_pattern(
>> +            self, 'boot', '## Loading kernel from FIT Image')
>>           self.wait_for_console_pattern('Starting kernel ...')
>> -        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
> 
