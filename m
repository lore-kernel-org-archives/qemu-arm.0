Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1569088lfr;
        Tue, 6 Apr 2021 08:22:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkd2MnuYOvp8rRl42ONnjlYJLWBKuxZAYL3Ep5tZJAFVbjeC5cXjt9QZauPUVj2m3Tx601
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr38602026edd.283.1617722533026;
        Tue, 06 Apr 2021 08:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617722533; cv=none;
        d=google.com; s=arc-20160816;
        b=CxW4I480Hczd03XWtR5UwUsJ+rITxN22uVd9nqYFlNQK1tfu02/wxmFEmXyFsS9o2q
         /xJSyXnAGqA2TavRVEAtLkg17r3rp1yBrj7znkU2EKqRSkNqD1RMlM5YvrLYTkRkb/tZ
         ZXn7XPt9dl/DkFSZmt04/qJW9qz1zlVB7R+MTru0COohURY/UfRF9roW4H7Gk4YF/mDS
         UPgMPC6xe+Vtd/px1LWSjg8o8KO+jkIdlFc5tL+ANkjYfpzob1EY6wxB9B8cMfHKprsA
         q74AYURGbs/PdrOv3+sjItJvwJazJtxr18JHjQLqOPhczVyUjnkDpyKQeFlb+PFegN5X
         VfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IbfXLqtOBQg7xDbuPYV9p74an8hsFJgTN2FmRjxjqbY=;
        b=NJzQ527AKDm4Xg2SfRGgac9D6W+OLj0a4nbog9h3zwGMi8KkdufNM5QNPEcqFqE1SQ
         arpUngbxAI/YljNX0+iKMp1MqRd2tDxzUIjEGkiM3mKrLm3GSXgjdxh10uf0ZeW5hBO7
         RC2GQlhSMmVQZxKBmE/JmS5xPRWtISf/9ZVSqFKg+fC0YzNobsl/6y7RBAdqk78YI/y+
         zh07S85m7BcAK05kREMX0MlFjOf+C1mOc5yb8asJQJhgYGM2sJJ1XN92zuOFhQ5UlgFU
         QPjI05PZ3T3KN2ZDDJ+fd4XcGsGX8/oDw5SOlJUZfGJ8RRYuzhK8zRr9Vkr33xYcJ2qP
         OWnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSLQyBx8;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id r18si5928625ejs.434.2021.04.06.08.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 08:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSLQyBx8;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617722531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbfXLqtOBQg7xDbuPYV9p74an8hsFJgTN2FmRjxjqbY=;
	b=FSLQyBx8kFgWVchANWqLCEtEkaY2qvQguHCe5xGs14RUq5CLM8yNxlTHVXJq+bmadZo4uS
	k4Xr6kBMrIOjFc5h2nKAiWBlyn3H1vmwc8TBF0NmBhd6rAAey/NfJXoxoay382S+uCt9k2
	g2wxok2eFOCPokayZk37N3+7k4G50CM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-kFaKWAcHOyuxj6KD6hXsyA-1; Tue, 06 Apr 2021 11:22:10 -0400
X-MC-Unique: kFaKWAcHOyuxj6KD6hXsyA-1
Received: by mail-ej1-f72.google.com with SMTP id d6so5601265ejd.15
        for <alex.bennee@linaro.org>; Tue, 06 Apr 2021 08:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IbfXLqtOBQg7xDbuPYV9p74an8hsFJgTN2FmRjxjqbY=;
        b=AEaKhE36sMXzDC/KCmvXb0BODc152J0FAR0eV/5BOznhuHpKneTH9wwjw/Cz3WWC+J
         3/p/tm+pT6F4cJuqy20dhN4rIBrAU/m6vixj8hw2NFf3fDSbQQYzO0hvzT6ZbYX8Z8ig
         +SBaHOdJsrwdYiJ/ZcKqNxdSYByprZLd3jBrd/344Dz3f/I3oU7kmy/COxjK6Rpviclz
         gr4Nx7+lmD63G3DVBZkgSqeTN0Oz1K6E39VAAfsKuVLoGI0fcDKNYtlx7LRMfltzszAx
         PwGEhG3JjhTGfNatBU94l9dO5bCx28hZwjOj9X1YzpbgIcGmRNS510TIs0zjJp/TJOvi
         KaYg==
X-Gm-Message-State: AOAM531+gYGa70YHMTLMQvNRfGJffzrLvxuvvqgK0wmvPPeNws2NOBo6
	UfNvxO+W3GNM4v6LHyK0eZpUNsqs93Pp8p4VTFj5um4O5JhyJO7Hh3pKZ1IKZRp+rVBuctLBDrH
	Q46mcPkFafsMbpyuR
X-Received: by 2002:a17:907:2bf6:: with SMTP id gv54mr35202186ejc.514.1617722528050;
        Tue, 06 Apr 2021 08:22:08 -0700 (PDT)
X-Received: by 2002:a17:907:2bf6:: with SMTP id gv54mr35202165ejc.514.1617722527893;
        Tue, 06 Apr 2021 08:22:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id yk8sm11331074ejb.123.2021.04.06.08.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 08:22:06 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
Date: Tue, 6 Apr 2021 17:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eefvnx3s.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3ssKMkPiJEpX

On 3/31/21 5:45 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> The current 'virt_kvm' test is restricted to GICv2, but can also
>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>> tested on some hardware.
>>
>> Noticed while running:
>>
>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>  ...
>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>
>> The job.log content is:
>>
>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>
>> With this patch:
>>
>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>  (1/1)
>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>  PASS (55.10 s)
> 
> On the new aarch64 machine which is GICv3 I get the following:
> 
>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
> 
> which it shouldn't have run. However:
> 
>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
> 
> Is this something that has regressed or am I doing it wrong?

Typo in the tag: "device:gic3" -> "device:gicv3"

>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
>> index 0055dc7cee..c743e231f4 100644
>> --- a/tests/acceptance/boot_linux.py
>> +++ b/tests/acceptance/boot_linux.py
>> @@ -182,10 +182,11 @@ def test_virt_tcg(self):
>>          self.add_common_args()
>>          self.launch_and_wait()
>>  
>> -    def test_virt_kvm(self):
>> +    def test_virt_kvm_gicv2(self):
>>          """
>>          :avocado: tags=accel:kvm
>>          :avocado: tags=cpu:host
>> +        :avocado: tags=device:gicv2
>>          """
>>          if not kvm_available(self.arch, self.qemu_bin):
>>              self.cancel(KVM_NOT_AVAILABLE)
>> @@ -195,6 +196,20 @@ def test_virt_kvm(self):
>>          self.add_common_args()
>>          self.launch_and_wait()
>>  
>> +    def test_virt_kvm_gicv3(self):
>> +        """
>> +        :avocado: tags=accel:kvm
>> +        :avocado: tags=cpu:host
>> +        :avocado: tags=device:gicv3
>> +        """
>> +        if not kvm_available(self.arch, self.qemu_bin):
>> +            self.cancel(KVM_NOT_AVAILABLE)
>> +        self.vm.add_args("-accel", "kvm")
>> +        self.vm.add_args("-cpu", "host")
>> +        self.vm.add_args("-machine", "virt,gic-version=3")
>> +        self.add_common_args()
>> +        self.launch_and_wait()
>> +
>>  
>>  class BootLinuxPPC64(BootLinux):
>>      """
> 
> 
