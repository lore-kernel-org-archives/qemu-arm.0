Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1127780ejm;
        Fri, 21 Apr 2023 06:01:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ym6mlWo9hx0gWlVU81lRP5ZLVGP4lv0HTAUuY0b2pLTJj4nGce2d6Wrzx2JEPg6sZv0jMx
X-Received: by 2002:ac8:7f50:0:b0:3e4:eb8f:8a7b with SMTP id g16-20020ac87f50000000b003e4eb8f8a7bmr10256900qtk.29.1682082097368;
        Fri, 21 Apr 2023 06:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682082097; cv=none;
        d=google.com; s=arc-20160816;
        b=RoxL0dT0DgkNKSxZGPp/jbv54erZlJoP9nyPcvnl+UcMqdJo9q2J/ZP+z6hZTbMKPP
         XEf+M/+juFPdkexiI48wOoK3IA6EYvsLjkMQM3wcprap62FMWAbVWKnPr9YlcCQ8DglN
         3ghgT9RExK83+Gn+DnRMubIo48PYzVyMFkmm8iVaDmgKDcFbtHaFRyUn+y8aIRkBE5ec
         HieA9q5gLb7+/w7tNn9daTLGCV6kyzloU+aLS7bnLaXYgDX9iA2f9KEKPpDJJaHjpgVy
         McPkNj4TEtZoOmgE+cPD1rhUiMfhdtrcyNmbD7e8zQkt4xoMQjG7e9nqnCfyz2DojaLT
         g4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=G2bgz6FOQl+RAG2ciO8BwsgLmFP+1ubCUq0360WSxBU=;
        b=VsEoyC7ddqgXaMDtiBuH1rjsqeoGgFCExJ0D2AwbLAyytnp7oOP3sOgmhe4qNsJpSY
         g2MuYWbF4P4A4iyjdRdd01jfbsCXDvDBqdafEM3lw4wnc4Uo5Rm9Q0hwGlcXsCWPA9yp
         Dzf9GZKUFjAzNm5cIsJSO6VNGjjs94+JIloezGHFp9uVcpjqKp1cFOp92SgJdk7q0mdy
         9D6Yb6btyTCuIg9mJnGZleFYyRyzwgRexq8+YdvfXjqBZFHpv43y3akCLEPe1tl7hxjT
         aM88s+6RwwWk8kQyeire0bnz+DaI9ny9qrVowuD6ABMYS1Y3/JhLx1/McOPBWwZHiaKG
         Y5SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI606u6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de3-20020a05620a370300b0074df3ec8193si2900468qkb.515.2023.04.21.06.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 06:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI606u6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppqO3-0001OU-Gn; Fri, 21 Apr 2023 09:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqNH-0000xk-7Z
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 09:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqNE-0006mo-SL
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 09:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682082023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2bgz6FOQl+RAG2ciO8BwsgLmFP+1ubCUq0360WSxBU=;
 b=hI606u6dQApeo7TSH8zTFnn4njfRhaqncIcuzZ5z5YWvBRNevhKrNcJLPgMgjq7FF5/1VM
 SJPhdGQv/b8MZXoPCl95w6tR4QpGg/eplA+8nHQtjTKmfI7AX4HiEmNFh23dH1pdxhA9Cr
 rzRsKFyNqpsmyCYJtzBHGuRvO8g2P8M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-B0xz7OynPL6aSGIv8YTzMw-1; Fri, 21 Apr 2023 09:00:18 -0400
X-MC-Unique: B0xz7OynPL6aSGIv8YTzMw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f55f0626a6so669375f8f.3
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082016; x=1684674016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2bgz6FOQl+RAG2ciO8BwsgLmFP+1ubCUq0360WSxBU=;
 b=hcdhLuaTEcXGADr47+tFl3a64XpNCE59GW8TRUA4LPbPSrUL0MZBDP3eur8ThNZe4i
 zw4bHK4oBzLVWGhzCkwRHOv6WNzLVYFaX/Z4e62pgY0GY7+PHG8MuMTQ5Ntz+fZ6JBDs
 N4KUyAAAyRB1/5oEF6n6z39BhjmL++Drhxm3EDBq4WK6LTvCFF3nzoYDmL8MXJbDb3aj
 L2f9QV3ow1J5fZq/yLRVuKQTc8ETYiicp1JqAJwZgC9mK8hOlvRfetdoB3/KPKwm3mJY
 frproLmIm3PuPzaRNnf76xkoo2Mj6XZJNj3JVILOdNb8CiNIvOSsShatajpz8w7z6iw7
 Ni4A==
X-Gm-Message-State: AAQBX9dYlyV9cTmOvITcxdT2QHp8XuLuQiX0kUNrcu7novW/8B/oRjfT
 UxZPm1+64noBJUYaOyysfFGWECve8gi06rvaixUr9+dIUYEIbS+XUSFzgvHI0XXoz5Iy0ZqJqmf
 JxS0Nlzsr/j/y
X-Received: by 2002:adf:ee86:0:b0:2f2:7a7e:6ac with SMTP id
 b6-20020adfee86000000b002f27a7e06acmr4280048wro.48.1682082016664; 
 Fri, 21 Apr 2023 06:00:16 -0700 (PDT)
X-Received: by 2002:adf:ee86:0:b0:2f2:7a7e:6ac with SMTP id
 b6-20020adfee86000000b002f27a7e06acmr4280018wro.48.1682082016263; 
 Fri, 21 Apr 2023 06:00:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm4417815wrm.15.2023.04.21.06.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 06:00:15 -0700 (PDT)
Message-ID: <2025fa7c-766e-5a91-0774-740dceadc6e0@redhat.com>
Date: Fri, 21 Apr 2023 15:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-3-thuth@redhat.com>
 <23d8e66e-7306-2e56-7a20-047904ec751a@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <23d8e66e-7306-2e56-7a20-047904ec751a@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: waJjg6fAuWzy

On 21/04/2023 14.54, Cédric Le Goater wrote:
> On 4/21/23 13:03, Thomas Huth wrote:
>> test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
>> failing. The problem is that they are trying to look for the login
>> prompt that does not have a newline at the end - but the logic in
>> _console_interaction() only handles full lines. It used to work by
>> accident in the past since there were sometimes kernel (warning and
>> error) messages popping up that finally provided a newline character
>> in the output, but since the tests have been changed to run with the
>> "quiet" kernel parameter, this is not working anymore.
>>
>> To make this work reliably, we must not look for the "login:" prompt,
>> but have to use some text ending with a newline instead. And in the
>> ast2600 test, switch to ssh instead of trying to log into the serial
>> console - this works much more reliable and also has the benefit of
> 
> Yes. The test ran ~100 times without a failure. The 'dmesg -c' call is
> inelegant but there is not much other solutions.
> 
>> excercising the network interface here a little bit, too.
> 
> exercising
> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> (one little typo below)
> 
> Thanks,
> 
> C.
> 
>> ---
>>   tests/avocado/machine_aspeed.py | 31 ++++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aspeed.py 
>> b/tests/avocado/machine_aspeed.py
>> index d2c57ccb7e..c9515bafa1 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -8,6 +8,7 @@
>>   import time
>>   import os
>> +from avocado_qemu import LinuxSSHMixIn
>>   from avocado_qemu import QemuSystemTest
>>   from avocado_qemu import wait_for_console_pattern
>>   from avocado_qemu import exec_command
>> @@ -230,7 +231,7 @@ def test_arm_ast2600_evb_buildroot(self):
>>           self.do_test_arm_aspeed_buildroot_poweroff()
>> -class AST2x00MachineSDK(QemuSystemTest):
>> +class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
>>       EXTRA_BOOTARGS = (
>>           'quiet '
>> @@ -257,7 +258,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
>>           self.require_netdev('user')
>>           self.vm.set_console()
>>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> -                         '-net', 'nic', '-net', 'user')
>> +                         '-net', 'nic', '-net', 
>> 'user,hostfwd=:127.0.0.1:0-:22')
>>           self.vm.launch()
>>           self.wait_for_console_pattern('U-Boot 2019.04')
>> @@ -285,7 +286,7 @@ def test_arm_ast2500_evb_sdk(self):
>>           self.do_test_arm_aspeed_sdk_start(
>>               self.workdir + '/ast2500-default/image-bmc')
>> -        self.wait_for_console_pattern('ast2500-default login:')
>> +        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
>>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>       def test_arm_ast2600_evb_sdk(self):
>> @@ -305,24 +306,28 @@ def test_arm_ast2600_evb_sdk(self):
>>                            
>> 'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
>>           self.vm.add_args('-device',
>>                            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
>> +        self.log.info('going to starrt *******')
> 
> 's/rr/r'

Drat, that whole line was just a debug print that I wanted to remove before 
sending out the patch ... I'll fix it.

  Thomas


>>           self.do_test_arm_aspeed_sdk_start(
>>               self.workdir + '/ast2600-default/image-bmc')
>> -        self.wait_for_console_pattern('ast2600-default login:')
>> -        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
>> -        exec_command_and_wait_for_pattern(self, '0penBmc', 
>> 'root@ast2600-default:~#')
>> +        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
>> -        exec_command_and_wait_for_pattern(self,
>> -             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
>> +        self.ssh_connect('root', '0penBmc', False)
>> +        self.ssh_command('dmesg -c > /dev/null')
>> +
>> +        self.ssh_command_output_contains(
>> +             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device 
>> ; '
>> +             'dmesg -c',
>>                'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
>> -        exec_command_and_wait_for_pattern(self,
>> +        self.ssh_command_output_contains(
>>                                'cat /sys/class/hwmon/hwmon19/temp1_input', 
>> '0')
>>           self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
>>                           property='temperature', value=18000);
>> -        exec_command_and_wait_for_pattern(self,
>> +        self.ssh_command_output_contains(
>>                                'cat /sys/class/hwmon/hwmon19/temp1_input', 
>> '18000')
>> -        exec_command_and_wait_for_pattern(self,
>> -             'echo ds1307 0x32 > 
>> /sys/class/i2c-dev/i2c-5/device/new_device',
>> +        self.ssh_command_output_contains(
>> +             'echo ds1307 0x32 > 
>> /sys/class/i2c-dev/i2c-5/device/new_device ; '
>> +             'dmesg -c',
>>                'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
>>           year = time.strftime("%Y")
>> -        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', 
>> year);
>> +        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', 
>> year);
> 

