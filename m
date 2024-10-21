Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2215524njb;
        Mon, 21 Oct 2024 01:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIDMNzKa/IPtSR5xNnPt2hTKHlP3k7aAe5CeBLu5MCaDnC0UR/rfaEbdtgXEH6b+GE6x5Xs4Ukar/7Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IEqquMwQQ/K4MykCFeeW5p60kD+YS1zLLSCAqZ6LBB599xZNEZeNYUUY/BWSlvCqEx24BcO
X-Received: by 2002:a05:6214:568b:b0:6cb:83a7:68db with SMTP id 6a1803df08f44-6cde14b80c1mr140054946d6.6.1729497748292;
        Mon, 21 Oct 2024 01:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729497748; cv=none;
        d=google.com; s=arc-20240605;
        b=Mg71y/UGs3NuJWHZ8Eldg1oczdU4PaaEs9mscY6HxK0gtnSccEjcKYLT7C061qr5EE
         XyPcWlyJO4BVJB0P6nk3eWYguEKC0w9JV07jzhNugecRXqpTAfj0nR2iTWGnc1IVqjC1
         etG9fuMN9IOg0gKvD7igxWoBuxVf7Ue5hrxQcgi63V9R1zmSStBER7u3P+NddecXOj7E
         JU+K8zVNOFVpSMYqgB8zImUpVBGyS8VWYel60Hs6E83IMLsrxXkgL1qXwuBt5VGP9TM6
         Z04zzaMqSd8z3LNxpG7jxvQN3cOSNKiyZ9YkvDN0Puzjw8eVfvRG4H+0rGb/KhA5tFw7
         r93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=iJFCpZvs0RBeuj4QDsPcmz8viM5V0rNnMSN2QZKot8Y=;
        fh=urbx0NThOYwCaUvfWK5kLjYoSa7TXvXqFp+JbYn0z4Q=;
        b=TaUWpoMFHRbcEB1Y9dJlWsTAIAUeGDrS+RQhqtMI+hCxds1i2MfgT2QTHVKHujT1Mt
         cv36igbUAidChrFqM2rZYOvzqYG12V7hUbxRLNKzwoDJpGDf8792xmNAuSHEOY68kwmk
         lYdDg36Z0t+ClmKgsHzNe8fYWnAadbTTV10vOTz+Tx4/XCr5vwxAjCIFvTQNfmtg1uHi
         meSPNjXpYAddAU98j0BU7V5ImTP0cQz4t17pEhT7mWNBNzJscb0p7HQ7sQgNw0UYotMs
         XT0vYu5QtO1YBuyscgi9QUH+/9bhRCimjIlAZVyJGMcNj3wS/Ki0z/zVEtnG7sQkcDPy
         qg7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMqjUJI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009fdfe6si34759246d6.436.2024.10.21.01.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 01:02:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMqjUJI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2nMa-0001Z4-3n; Mon, 21 Oct 2024 04:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2nMQ-0001Qi-0f
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 04:01:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2nMO-00014X-50
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 04:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729497710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iJFCpZvs0RBeuj4QDsPcmz8viM5V0rNnMSN2QZKot8Y=;
 b=BMqjUJI5DSWB7T96DmFjm3UJFACkvXtGdABzqvybQz2VHkuzAO5MzIbIRz+uOngvCY1uIM
 FhRRsw1OQ94+UVpb9UDFo8nBCV7tSHRN/AUtyQM7cUCllPNMWeUJVzgCELJlLQjdi/cYEd
 a4aHJpF4sCWPIxhf1wj/4qpeVGIUiPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-3ePJ4ps-MduSlmSzqKbodw-1; Mon, 21 Oct 2024 04:01:47 -0400
X-MC-Unique: 3ePJ4ps-MduSlmSzqKbodw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4315af466d9so28150715e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 01:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729497706; x=1730102506;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJFCpZvs0RBeuj4QDsPcmz8viM5V0rNnMSN2QZKot8Y=;
 b=pN46kvvIZ+q1pWCbUZ1qsmzEM/FhUIy4MBfFXTCve71YE4FvGmfheV0Ef5iSbKe/gU
 sZgMWZlOb5utbi3t2so0/eLl6GIWaEo/BBy40dcSXFVfWigzhsMFqaI7RI0HTck2bczd
 4Ebnir6/ZlIt0jsN6epXIjFRnOv0e9i7IQFI878+Zpc2beuLflm0FVBNymztzJeVI/Xo
 MAT3RKYbKARQqsHhK3xhbDRh3EIg4W6DfVGcJtGtrroKIQav9wXcGgmqtD48Vx7rb1Z7
 qKuEsV4wENDnfYC0uiZy8Fsh8MIumvvQT2rb8xwytxY/lSwCaRXyUxEJV/LK3TkAzOAn
 PycQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyvIIjv2MPqMRacugLz3n7MR3fhQUbU1ZzqmnfZ2agicZreuPy5qfVqAHvwHN4YubhXO4pwMOZIw==@nongnu.org
X-Gm-Message-State: AOJu0YwJBgf/Bz4LyHpZ04O9uyRD2mWLIlDbWMkJ3LVnfzzOzKt6uS2a
 QWpH9HiGJf8Lg4CR/3RwV1DJGyHyDpJUgoU/WKYzrg+xJtqBKB5v+d8m9UYYhLP9gsA84/77r2X
 tzJxIljccYDMnXgebtGs54KSdK4axVQ6ljZj92KAzOdHr/HaDyQ==
X-Received: by 2002:a5d:6a8e:0:b0:37d:4e80:516 with SMTP id
 ffacd0b85a97d-37ea21a215dmr6423699f8f.34.1729497706438; 
 Mon, 21 Oct 2024 01:01:46 -0700 (PDT)
X-Received: by 2002:a5d:6a8e:0:b0:37d:4e80:516 with SMTP id
 ffacd0b85a97d-37ea21a215dmr6423685f8f.34.1729497706073; 
 Mon, 21 Oct 2024 01:01:46 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9cd48sm3625881f8f.111.2024.10.21.01.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 01:01:45 -0700 (PDT)
Message-ID: <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
Date: Mon, 21 Oct 2024 10:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.527,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: SnEJoaKX+IHU

On 21/10/2024 09.15, Thomas Huth wrote:
> On 17/10/2024 18.32, Peter Maydell wrote:
>> This patchset adds new functional tests for the collie and sx1
>> boards, which are the only remaining ones that survived the
>> culling of the OMAP/PXA2xx/strongarm machines.
>>
>> For these tests I'm indebted to Guenter Roeck, who has kindly
>> built and made available the kernel images, rootfs, etc and
>> documented the commands needed to boot them. All I've done
>> here is wrap those up into test cases in our testcase
>> framework by cribbing from some of our existing test code.
>>
>> Based-on: 20241017162755.710698-1-peter.maydell@linaro.org
>> ("hw/sd/omap_mmc: Don't use sd_cmd_type_t")
>>   -- the sd card test for the sx1 board will not pass without
>>      that bugfix
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (2):
>>    tests/functional: Add a functional test for the collie board
>>    tests/functional: Add a functional test for the sx1 board
>>
>>   MAINTAINERS                         |  1 +
>>   tests/functional/meson.build        |  3 ++
>>   tests/functional/test_arm_collie.py | 31 +++++++++++++
>>   tests/functional/test_arm_sx1.py    | 72 +++++++++++++++++++++++++++++
>>   4 files changed, 107 insertions(+)
>>   create mode 100755 tests/functional/test_arm_collie.py
>>   create mode 100755 tests/functional/test_arm_sx1.py
> 
> Thanks, I'll queue the patches [...]

Unfortunately, the test_arm_sx1.SX1Test.test_arm_sx1_sd test is not working 
for me, it seems to fail the shutdown of the QEMU binary:

ok 1 test_arm_sx1.SX1Test.test_arm_sx1_flash
ok 2 test_arm_sx1.SX1Test.test_arm_sx1_initrd
qemu received signal 9; command: "/home/thuth/tmp/qemu-build/qemu-system-arm 
-display none -vga none -chardev socket,id=mon,fd=5 -mon 
chardev=mon,mode=control -machine sx1 -chardev socket,id=console,fd=10 
-serial chardev:console -append kunit.enable=0 root=/dev/mmcblk0 rootwait 
console=ttyS0,115200 earlycon=uart8250,mmio32,0xfffb0000,115200n8 -no-reboot 
-snapshot -drive 
format=raw,if=sd,file=/home/thuth/.cache/qemu/download/c1db7f43ef92469ebc8605013728c8950e7608439f01d13678994f0ce101c3a8 
-kernel 
/home/thuth/.cache/qemu/download/a0271899a8dc2165f9e0adb2d0a57fc839ae3a469722ffc56c77e108a8887615"
Traceback (most recent call last):
   File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 611, 
in _do_shutdown
     self._soft_shutdown(timeout)
   File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 596, 
in _soft_shutdown
     self._subp.wait(timeout=timeout)
   File "/usr/lib64/python3.12/subprocess.py", line 1264, in wait
     return self._wait(timeout=timeout)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File "/usr/lib64/python3.12/subprocess.py", line 2045, in _wait
     raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 
'('/home/thuth/tmp/qemu-build/qemu-system-arm', '-display', 'none', '-vga', 
'none', '-chardev', 'socket,id=mon,fd=5', '-mon', 
'chardev=mon,mode=control', '-machine', 'sx1', '-chardev', 
'socket,id=console,fd=10', '-serial', 'chardev:console', '-append', 
'kunit.enable=0 root=/dev/mmcblk0 rootwait console=ttyS0,115200 
earlycon=uart8250,mmio32,0xfffb0000,115200n8', '-no-reboot', '-snapshot', 
'-drive', 
'format=raw,if=sd,file=/home/thuth/.cache/qemu/download/c1db7f43ef92469ebc8605013728c8950e7608439f01d13678994f0ce101c3a8', 
'-kernel', 
'/home/thuth/.cache/qemu/download/a0271899a8dc2165f9e0adb2d0a57fc839ae3a469722ffc56c77e108a8887615')' 
timed out after 30 seconds

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
   File "/home/thuth/devel/qemu/tests/functional/test_arm_sx1.py", line 58, 
in test_arm_sx1_sd
     self.vm.wait()
   File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 666, 
in wait
     self.shutdown(timeout=timeout)
   File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 648, 
in shutdown
     self._do_shutdown(timeout)
   File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 618, 
in _do_shutdown
     raise AbnormalShutdown("Could not perform graceful shutdown") \
qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown

not ok 3 test_arm_sx1.SX1Test.test_arm_sx1_sd

Could you please have a look?

  Thomas

