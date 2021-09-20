Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2409665lfp;
        Mon, 20 Sep 2021 13:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT13goLC6PT1yXCiGE/YBnEaEgEqdus/4XWgd/BQwahA7mSZYjdGxMjLK4qB+8vlxw/Udy
X-Received: by 2002:a05:622a:182:: with SMTP id s2mr7784064qtw.34.1632169315148;
        Mon, 20 Sep 2021 13:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632169315; cv=none;
        d=google.com; s=arc-20160816;
        b=EfKWfVIWuPXggGsjNmMxuMpHrSRnu90YfgEzyDUaidh/JHgtqrvmIEVLzIS3eCuiJs
         +Pyf2wGsH4mciyQeTZIWL7m/I90xzAJUyi2r7Nc5tRWCUn8wPDZXVdsapmt/zgpXHnxz
         q0gZppNpEEm0mWCRrFOBRl8lImef/S680ybp9SP3HE5VJ8c0pfD895gGt3n2hr7ygA9P
         x+as6wJELa/Swm8mkyHol0bXKdoNpmThcKZg25BQndhmh4MZqW4EM6vBVHzWpaFhDoxc
         12HwkJ4GJW9qNOww1tgjMrot57VWYhvJ1xZOZQnAT2xTSfRW12VadVKgVN54/Z6AcJDZ
         Z0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=G5akJ7XDXriZrxBEYSY60VhkQ0G5FdGdDWR7kpi5w/s=;
        b=FhbGdA4SyRLu0tIPfZ22mmLeU0/mjgDEGRNgyNT78yVOxoDPeC6AJUJlhGBx+ogv9Y
         9eCNj8PQ0MP04+KeoEHflMIuwsYOYIqoodb7b47raLlOF3EdaU+OhPzY6I2RohbrSt3X
         Vm8jq6OsAZhRTYl71k/r+4mjDRr9yeqGW7oiT+i4shPDt3ks0vLomEuc5iPurlWjfkuK
         GkKCpV/433x48UlbSJSljkV3TK3NDZKmun1VfRtbrnDvUW0+TZ7agcRjd7n0hPw0F5to
         zIup2BpBok/T756weHYZdwYSkmbtnoGPEwaW+3hjtgGyD2PGi0iBTl1wsp451DNC8p72
         shfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si6668531qta.79.2021.09.20.13.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 13:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSPnW-00044X-KT
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 16:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSPnI-00044L-4m; Mon, 20 Sep 2021 16:21:40 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53646 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSPnE-00029a-GS; Mon, 20 Sep 2021 16:21:39 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-115-125-107.95.115.pool.telefonica.de [95.115.125.107])
 by csgraf.de (Postfix) with ESMTPSA id 923B56080333;
 Mon, 20 Sep 2021 22:21:28 +0200 (CEST)
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
 <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
Date: Mon, 20 Sep 2021 22:21:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NjmO3pSFtkxE


On 20.09.21 18:17, Philippe Mathieu-Daudé wrote:
> On 9/20/21 15:15, Peter Maydell wrote:
>> On Mon, 20 Sept 2021 at 11:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>>>> Now that Apple Silicon is widely available, people are obviously excited
>>>> to try and run virtualized workloads on them, such as Linux and Windows.
>>>>
>>>> This patch set implements a fully functional version to get the ball
>>>> going on that. With this applied, I can successfully run both Linux and
>>>> Windows as guests. I am not aware of any limitations specific to
>>>> Hypervisor.framework apart from:
>>>>
>>>>   - gdbstub debugging (breakpoints)
>>>>   - missing GICv3 support
>>>>   - Windows will not work due to UDEF SMC implementation
>>>>
>>>> To use hvf support, please make sure to run -M virt,highmem=off to fit
>>>> in M1's physical address space limits and use -cpu host.
>>> Applied to target-arm.next, thanks (with the unnecessary #include
>>> in patch 6 removed).
>> Turns out that the final patch breaks "make check-acceptance".
>> All the orangepi boot tests timeout:
>>
>>  (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '15-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/...
>> (90.24 s)
>>  (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '16-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang...
>> (90.24 s)
>>  (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '17-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes...
>> (90.24 s)
> Works for me on x86_64 Fedora 34 built with
> --enable-trace-backends=log --enable-debug:
>
> $ ./tests/venv/bin/avocado run
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
> Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
> JOB ID     : b19f151f7320def3a432255f3a99c0dde3da95c0
> JOB LOG    :
> /home/phil/avocado/job-results/job-2021-09-20T18.12-b19f151/job.log
>  (1/5)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
> PASS (6.29 s)
>  (2/5)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
> PASS (51.23 s)
>  (3/5)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
> PASS (76.53 s)
>  (4/5)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
> SKIP: storage limited
>  (5/5)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
> SKIP: storage limited
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 135.18 s
>

The OrangePi kernel goes into an endless loop here:

 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/compressed/head.S?h=v5.10#n637

The reason is simple: It tries to install its own HYP code using the old
"install HYP handler, then invoke it" trick based on SPSR's indication
that HYP is available, but fails to do so because HYP calls get handled
by QEMU instead because the PSCI conduit is configured to HVC.

The patch below seems to fix it for me. Please advise how you want to
proceed.


Alex


diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 27f1070145..f9b7ed1871 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev,
Error **errp)

         /* Provide Power State Coordination Interface */
         qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_HVC);
+                            QEMU_PSCI_CONDUIT_SMC);

         /* Disable secondary CPUs */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",

