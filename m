Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp15431njb;
        Thu, 17 Oct 2024 00:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgF2H92D+kuqZpqRcj+uYPvJfFDtY67OkONcDF5UJQgmXNLmaxdNHXsTKK7wAncbm65YNzpBbym1nNMw==@linaro.org
X-Google-Smtp-Source: AGHT+IFOWrHeJhuNWdGZ3zsS/HkiQM8k5A5wZAqVVfXaT8kDXLNoePJdkI/1ahNTdoUvlU8Ixn8i
X-Received: by 2002:a05:620a:28d4:b0:7ae:6e87:df6c with SMTP id af79cd13be357-7b12101b3d7mr2670648185a.64.1729149686974;
        Thu, 17 Oct 2024 00:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729149686; cv=none;
        d=google.com; s=arc-20240605;
        b=bAer+QGDsunHRBDAl2UQvkwNwcGIHFiCHE+mAirGIZrSWjnAIvc0sP4ZMa2hnwZE2b
         A2WlyBmxaeYT24Uhkt0U5fEcQFz21JQDM4LDuUOO2Oc15RaOEUReAmPQivvChl+fqbDL
         MmylYu2L0nCviJxXG1HmDPUB/ZQlzHoQmeKajdJW2Rum6zXckB/sfx1xZLZRGe5ds2gC
         iSKr2reA78ZaXET41/ryJa/LQihkoc9FUfXgKOqOyToz5gRk4AsB3hp9QsbFZCymF+wK
         CgDhXdwaJLe6jK3ppqUZDVdmcybTqk/xTkJJHRLDjZFPVPAggqLFcuMwEhOT/VX84zCz
         sMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZIc0iOxnhMih4kvkpMb6CYHszdxcf8n9pESsJHDOUMc=;
        fh=PNTeTke4BY+8E12LXFD40dvlywStMYBsGAg8SXvYjg0=;
        b=IRVSy1bu7sIXAjlnBGq5L3qeQeJfcAYMJIfRRIuTikL9Qfw0Mcqm2dymGXrgQNh7Z1
         B3NQgs0b23iUDM2u1ycf3QwHS0GHddvHxd3XyQ2MinyNiQP02d0Ixr+Mrw3hFJv5WgdR
         i90YHLakftZWK61wwtQISlOXLCm1ONPtbsziaT9X+uFXGNKRtz3qOum38xBcOH4bWkgz
         a0Q5DIfEShMhxk2kQR0mHz9EpyNh2FubzbgIuhn2TZGEX+68+9cNdFRb4EegUC42G2tc
         lXbpxJQYg5Rx5fWYJOkTfqmH03l8oKIcI92EwbsD96BozXZ/GmmkdNEnKS4pfrkJX2c9
         v2aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MGI9pW+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363e4505si568378885a.496.2024.10.17.00.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 00:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MGI9pW+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1KoZ-0005aS-O3; Thu, 17 Oct 2024 03:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t1KoY-0005a5-3G
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 03:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t1KoW-0001en-6o
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 03:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729149651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZIc0iOxnhMih4kvkpMb6CYHszdxcf8n9pESsJHDOUMc=;
 b=MGI9pW+FrP0E/iWSU6t8y/1yIfulpEA/Qwje3bPPJ/1/AZb0HfE1PMD9fCWLDQ/vWOirJz
 DoYmC2v3iJ8reBBJ7RrZRy3vHV4QoHiC79RGaQPaGKjt9XQOdz69uRJBPQYHiWe706VFF6
 ioyjxIUipHWhVdrDoaDxeEl2hItDsu8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-Zni5WmF_NMyOlWsO-VpKAQ-1; Thu, 17 Oct 2024 03:20:49 -0400
X-MC-Unique: Zni5WmF_NMyOlWsO-VpKAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4315cefda02so1287805e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 00:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729149648; x=1729754448;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIc0iOxnhMih4kvkpMb6CYHszdxcf8n9pESsJHDOUMc=;
 b=NzumQBjpxFKUYYWqrZjnGtmJHx/TsaO2eOa2t5XcWN6MALZuT5IrCTQ3V12v1JRhVo
 EG2rU+PsZxzNY6K7XjTaj7EBX8YbY5lUixZN+/NL+2fOLwSBhSMppdO19P4ldArAW1O1
 n2jt38uWrpfSJP1Tz5pD8B+xuckvD+n6i6Kd1IQsXPzW8OLMwPQKoBXxZ9U76X+liPco
 Vx5WFLpd7HwLvLKGGAG8oREJfE8vtv88sAlyuERHvTBp95o0HkMwhAiG3YWgQSsJj6th
 81Yw41LXFf0qGOCffbOz8yAHC0TmF0iC4N54ws9GVHXkysfbNpvYwtPTv5rRDIWIAhoW
 13wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnZgJdAdjN2uLkYQBoCwTR8ozxUFT55XElGSKbpnFn7H1sLpcRYPRqNLd+Nw/gi5Pmid7FxOIaQQ==@nongnu.org
X-Gm-Message-State: AOJu0YyT3Ptbb+8n7d7/EocrwCLxqm3US/psZ4crpodLfM3K9qBz5tpV
 eQsuAcTm6pQ3n3xYJlB8TTvXDBRVdADOr6EkMuZqU0KTLafk8N+lPzQhMmUa5xMVfqhehM67xrH
 OESMRBfAUXScqUSC6k52QqxTxKsiZQ4mXnIR/bNRVHeFxIJplBw==
X-Received: by 2002:a05:600c:1f8c:b0:42c:b220:4778 with SMTP id
 5b1f17b1804b1-4311df5c639mr186810755e9.33.1729149648066; 
 Thu, 17 Oct 2024 00:20:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1f8c:b0:42c:b220:4778 with SMTP id
 5b1f17b1804b1-4311df5c639mr186810435e9.33.1729149647575; 
 Thu, 17 Oct 2024 00:20:47 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c35c74sm16603175e9.3.2024.10.17.00.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 00:20:47 -0700 (PDT)
Message-ID: <7e849dbe-6ffa-44f3-8a9e-ab91c234c9b5@redhat.com>
Date: Thu, 17 Oct 2024 09:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert most Aspeed machine tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 berrange@redhat.com
References: <20241016203835.2222792-1-clg@redhat.com>
 <8b228e20-619f-4c52-a9bc-3a878a9ab34a@redhat.com>
 <c7b4442c-5356-4000-bda3-e7239c3eddde@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <c7b4442c-5356-4000-bda3-e7239c3eddde@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.038,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: SbcQwPDQylee

On 17/10/2024 09.09, Cédric Le Goater wrote:
> On 10/17/24 08:06, Thomas Huth wrote:
>> On 16/10/2024 22.38, Cédric Le Goater wrote:
>>> This is a simple conversion of the tests with some cleanups and
>>> adjustments to match the new test framework. Replace the zephyr image
>>> MD5 hashes with SHA256 hashes while at it.
>>>
>>> The SDK tests depend on a ssh class from avocado.utils which is
>>> difficult to replace. To be addressed separately.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
...
>>> -    @skipUnless(*has_cmd('swtpm'))
>>> -    def test_arm_ast2600_evb_buildroot_tpm(self):
>>> -        """
>>> -        :avocado: tags=arch:arm
>>> -        :avocado: tags=machine:ast2600-evb
>>> -        """
>>> -
>>> -        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/ 
>>> master/'
>>> -                     'images/ast2600-evb/buildroot-2023.02-tpm/flash.img')
>>> -        image_hash = 
>>> ('a46009ae8a5403a0826d607215e731a8c68d27c14c41e55331706b8f9c7bd997')
>>> -        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>>> -                                      algorithm='sha256')
>>> -
>>> -        # force creation of VM object, which also defines self._sd
>>> -        vm = self.vm
>>> -
>>> -        socket = os.path.join(self._sd.name, 'swtpm-socket')
>>> -
>>> -        subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
>>> -                        '--tpmstate', f'dir={self.vm.temp_dir}',
>>> -                        '--ctrl', f'type=unixio,path={socket}'])
>>> -
>>> -        self.vm.add_args('-chardev', f'socket,id=chrtpm,path={socket}')
>>> -        self.vm.add_args('-tpmdev', 'emulator,id=tpm0,chardev=chrtpm')
>>> -        self.vm.add_args('-device',
>>> -                         'tpm-tis- 
>>> i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e')
>>> -        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 
>>> 'Aspeed AST2600 EVB')
>>> -
>>> -        exec_command_and_wait_for_pattern(self,
>>> -            'echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/ 
>>> new_device',
>>> -            'tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)');
>>> -        exec_command_and_wait_for_pattern(self,
>>> -            'cat /sys/class/tpm/tpm0/pcr-sha256/0',
>>> -            
>>> 'B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0');
>>> -
>>> -        self.do_test_arm_aspeed_buildroot_poweroff()
>>>   class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
>>
>> You also copied AST2x00MachineMMC but you didn't remove it from the 
>> avocado test yet, so there is a hunk missing here, I think?
> 
> oh. yes, I should remove it from the avocado test.
> 
> I was initially hesitating on having multiple test_arm_aspeed.py files:
> one per machine or one per fw image type. This to set the timeout more
> precisely in the meson.build file, since the SDK FW takes longer to
> boot, and also to handle more complex test scenarios, like the SDK.
> 
> What would be your recommandation ?

If the tests do not share anything at all (neither common python code, nor 
the same firmware binary asset), I think it's maybe better to put them into 
separate files, indeed. That way we can also run the tests in parallel when 
you add "-j$(nproc)" to your "make check-functional" line.

> Btw, I have been trying to rewrite the LinuxSSHMixIn class with a
> minimal ssh Session class. It is not trivial :/

:-(

Did you peek at tests/vm/basevm.py ? I was hoping we could lent some code 
there...

...
>>> +    def test_ast1030_zephyros_1_04(self):
>>> +        kernel_name = "ast1030-evb-demo/zephyr.elf"
>>> +        zip_file = self.ASSET_ZEPHYR_1_04.fetch()
>>> +        with ZipFile(zip_file, 'r') as zf:
>>> +                     zf.extract(kernel_name, path=self.workdir)
>>> +        kernel_file = os.path.join(self.workdir, kernel_name)
>>> +
>>> +        self.set_machine('ast1030-evb')
>>
>> It's slightly better to do the set_machine() at the very top of the 
>> function. set_machine() can cancel the test in case the machine is not 
>> available in the QEMU binary, so this should best be done before fetching 
>> and extracting any assets.
> 
> Should set_machine() be the first call of a test function ?

Yes, either set_machine() or require_netdev() should be at the very top, 
since they could cancel the test.

  Thomas

