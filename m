Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3041811ejc;
        Mon, 28 Aug 2023 07:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMJrrNmMTEv5ytQg8Nc8JS1dsxnxBQ7SHEN5wMiPT+FqNBczp2kGf9S8+iLYRf+ZSc6Jwm
X-Received: by 2002:a67:cd04:0:b0:44e:9dd2:4dab with SMTP id u4-20020a67cd04000000b0044e9dd24dabmr9221595vsl.16.1693233213718;
        Mon, 28 Aug 2023 07:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693233213; cv=none;
        d=google.com; s=arc-20160816;
        b=NEhGMx5Evgy+SFq1iD9dNMTZNeuamMel6qGmIdBoUqdb0rD9x9c9Y4a4IUGfgXuGjf
         RU3VedQ4bOuWfFFXASqCHGNP7I3vfDs11xrBl27IN70P1Bf8+JyytD2KoKxhuG1SWnFh
         YEyGn6QN6AT52QnYRUdxriRgC1Fz/7d1wuaQJwtxC4+st562iVm6wKREjGxtRhPL6+ku
         1+evlZlcHmt40C+E86HO6NBikis57EixbxdknXs76E0XYg3Sik0dHMDBnmopEzgqcn3q
         m2dzLkuu6gZ01a76PS1jw/ZSxi9IQfNb2vUYpvRIcPs2ilMn5YZzwJEaDQlMN8lptGHg
         v9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=1tkvq2ZT4yHiHl98a1u1YZcY2mobYb8h5KCmHs3pH0s=;
        fh=5zkn8Ocs0EOIixunaXokMyeRJ4vvr5nZHaoXqhNtN8M=;
        b=pqLXaZAeEVNSHsf6qy5ihQFOzgCgSdMUtqgEMwlU9Hbm6zrLCV0OVfWd17Nstp6F9q
         wqhJ2T/BNeTnKdC+c5zI0Qmzu5wqwbg3kaTtKAznH3h8G1JBj+KDkZltGS0cQ0TL3mNm
         USHRIcp4KBlantAKmAhpjCTEU8n0Am/f9rDNvs0cd8s9F0VQix9PMMJ7sVbuxn1hw/sS
         V+kiXGyXPcmEPG26tbG0PuovL+Q1UMpjYys9fZImtel/pSEIiHFxugDe9d9B9HEAPf94
         U+lWHrWojM/BmsiRYjEMqpGdOEZLg/pD/L0uJXqLy0GAH/83pabr8Hjs7m/0DO4DsqQ5
         81/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a67d304000000b0044d486da238si704080vsj.216.2023.08.28.07.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadIw-00046B-S4; Mon, 28 Aug 2023 10:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qadIw-00045v-C5; Mon, 28 Aug 2023 10:33:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org>)
 id 1qadIt-0004ad-60; Mon, 28 Aug 2023 10:33:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RZChn2sZJz4wy0;
 Tue, 29 Aug 2023 00:33:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RZChj1bLDz4wxx;
 Tue, 29 Aug 2023 00:33:08 +1000 (AEST)
Message-ID: <7930d670-8d1d-04a2-d8c8-83fa48b19681@kaod.org>
Date: Mon, 28 Aug 2023 16:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Update SDK images
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230828090101.74357-1-clg@kaod.org>
 <CACPK8XfMn5PJaM9dBkck=jxhLuusJmGnAv_RE3Dp-kdezYM+-A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfMn5PJaM9dBkck=jxhLuusJmGnAv_RE3Dp-kdezYM+-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=DaUQ=EN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.169, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NgvlwR4TeRnw

On 8/28/23 15:54, Joel Stanley wrote:
> On Mon, 28 Aug 2023 at 09:01, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Switch to the latest v8.06 release which introduces interesting
>> changes for the AST2600 I2C and I3C models. Also take the AST2600 A2
>> images instead of the default since QEMU tries to model The AST2600 A3
>> SoC.
> 
> Is there any value in testing both the old and the new images?

For QEMU default tests, I think using the latest version of a test image
is just fine, or we will end up with a very long avocado test run. That
said we could make an exception when a HW feature is only activated in a
specific version.

I run pre-PR tests with more images (buildroot, mainline, sdk, openbmc,
provided by other vendors) but only the SDK v08.X images have decent
results. v07.02 and v04.05 have issues. It could be a software issue.

C.


> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>    Requires patches from Hang Yu [1]
>>
>>    [1] https://lore.kernel.org/qemu-devel/20230812065230.8839-1-francis_yuu@stu.pku.edu.cn/
>>
>>
>>   tests/avocado/machine_aspeed.py | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
>> index 724ee72c0208..90f1b7cb77a1 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -316,8 +316,8 @@ def test_arm_ast2500_evb_sdk(self):
>>           """
>>
>>           image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
>> -                     'download/v08.01/ast2500-default-obmc.tar.gz')
>> -        image_hash = ('5375f82b4c43a79427909342a1e18b4e48bd663e38466862145d27bb358796fd')
>> +                     'download/v08.06/ast2500-default-obmc.tar.gz')
>> +        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
>>           image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>>                                         algorithm='sha256')
>>           archive.extract(image_path, self.workdir)
>> @@ -334,8 +334,8 @@ def test_arm_ast2600_evb_sdk(self):
>>           """
>>
>>           image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
>> -                     'download/v08.01/ast2600-default-obmc.tar.gz')
>> -        image_hash = ('f12ef15e8c1f03a214df3b91c814515c5e2b2f56119021398c1dbdd626817d15')
>> +                     'download/v08.06/ast2600-a2-obmc.tar.gz')
>> +        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
>>           image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>>                                         algorithm='sha256')
>>           archive.extract(image_path, self.workdir)
>> @@ -345,8 +345,8 @@ def test_arm_ast2600_evb_sdk(self):
>>           self.vm.add_args('-device',
>>                            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
>>           self.do_test_arm_aspeed_sdk_start(
>> -            self.workdir + '/ast2600-default/image-bmc')
>> -        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
>> +            self.workdir + '/ast2600-a2/image-bmc')
>> +        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
>>
>>           self.ssh_connect('root', '0penBmc', False)
>>           self.ssh_command('dmesg -c > /dev/null')
>> --
>> 2.41.0
>>

