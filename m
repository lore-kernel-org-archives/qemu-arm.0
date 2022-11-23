Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4595428ejx;
        Wed, 23 Nov 2022 15:06:13 -0800 (PST)
X-Received: by 2002:adf:f50f:0:b0:241:b2b2:7fdb with SMTP id q15-20020adff50f000000b00241b2b27fdbmr18602461wro.344.1669244772812;
        Wed, 23 Nov 2022 15:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669244772; cv=none;
        d=google.com; s=arc-20160816;
        b=N5UWTZam4YCC/q1Mt8+BQlPQMCqW17ETZoArOjcZ87RnOEN5unjqS49F5HtUG2bbBe
         uUNDPn6FSVXiMpqYrb2An8rtdg8UjFOZnptHH3b+gk4UEuDz5zsH35f68Qbww/zUh4L4
         bSeJQ3Gj0RmBhQm/LdOFhE5WicMvQHa5l5/l55d2ypT8LXG2bXOBWjy0ugfWDs74UpUv
         JYYLDMB1VHzQ8BFpQOesqPzPOKib/D1TF7nWJbEO6NFg/Lki+xpgP5apGivw4vdRrLz5
         3K0DOSxgK5hKMugPtRpNnVNvwA4SO92ekpXAUkQxvo4S/v8yUq+ox5hqxTLOv9a7dG4V
         pxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=STCh3jnC+3/bKij6RZpVrCTRIxuoUCfsfAHTJ8uIJnA=;
        b=NdWsmLSBTRZkz71b97TTZcgv4Z+vdiD3D5S88HAA1wnAYxWBZ6NzHkw9+grVLHxALU
         KAIrEHd7FcQuHZtV6htSQf4vdyIp5YqjOrCnCxGnah3Pt+cAeBpNuiOpAwMJkOzOUa6m
         hGqhAhAE/c6TXEfF9qWd80v6wew3FIF2xHy+8q6D9sIrMl7ig/VROFx3aoe4nB96TyzV
         YZv2P4rAKxOsD/Sj9Jkb2Eyi9hkIAOmXE/vf6sgNTnppc0xnZb/ujM+GURtGwdHOJace
         pYW4/QHpf4QbUMV+skj5VmiT+2QXbp70henfdSI/BKP5/oYl/Rf9lIhdBqqS+/8j9DkC
         bqrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJX0IyJH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s25-20020adf8919000000b00241d1c808c9sor1349003wrs.41.2022.11.23.15.06.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Nov 2022 15:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJX0IyJH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STCh3jnC+3/bKij6RZpVrCTRIxuoUCfsfAHTJ8uIJnA=;
        b=KJX0IyJH8n6Az/JxwsFKCGSyrwaMVf0YnKSG1BN8BckevXNIA8v4CIOpLjdFyDCfkT
         yqDk3MXUiPCkTWt+oyD+Nx8LiEJX7CFQLiFlaD8APYdHWz/eg3B7QFztDhVeTtj3bBcy
         /3utrsRMzOkaBb+8/xIDdtTQ+ipLm+7FDab5nhZY7pnTB/4PUO+IChCumfCAVyhssNhR
         kTe6oTjXme4EdNgU9MmJZ0oUJW6ziOvSkUeh/pgmTZfzLRSM9wyDIv4khE0+QTMVYoxe
         /LHMcO/TDSHJsBOnDuugyjRCdKa6yERs9yH4EjEUR+Q21UD2Jmdgd4dtAq7Yy8VALAGd
         1BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STCh3jnC+3/bKij6RZpVrCTRIxuoUCfsfAHTJ8uIJnA=;
        b=JEtBO5dP1NUJy99UduZR6NVknThP1XJlRjMLNZfSYC+UNyaO129s/qPAQhuMFa7hEP
         /qQbFKixiSzztNfOYpFD4HQ6fjo21/ZymPCj2qBjZew/k/Luq6XdbRZrnOqODgHEeBzo
         unVfIzfLLzJRB/dPlk4LaVMRXeoUbSjyu6iD+6dw/F193GBY/hb3Gp7NiIZqw4Q5fB6i
         DfvQCI9qzOgNk5vgYhvWOhCw3zJIJouYi6r13BC079ckhP8tUnVXDrYu7Kz7LSiEDUFd
         wt1jSNM9tt+daZbOdoDL/y7b+tgvc6CeOBX9aNNOWHjYkHZqxcirBQxTiZup/82cZwMz
         JTAw==
X-Gm-Message-State: ANoB5pkzDpgPIU4DHiuQ+AmeqM9fRkFEv+TqZJ8Affo+WbeaEhDgy+9E
	pf1pA5hUd5wbNnfuFxGkJwY+730p
X-Google-Smtp-Source: AA0mqf4oWtXAcoo89MUAZDtarNpF6ORsQYVB/25IPFXnrteegZ0r76mnVzsxVbLwAbdNVMAu7VYlMA==
X-Received: by 2002:a05:6000:18f:b0:241:a046:91ff with SMTP id p15-20020a056000018f00b00241a04691ffmr18275513wrx.23.1669244772302;
        Wed, 23 Nov 2022 15:06:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b003b95ed78275sm4103071wmq.20.2022.11.23.15.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 15:06:11 -0800 (PST)
Message-ID: <d43878da-f17c-96ae-a097-7b90f9024a98@linaro.org>
Date: Thu, 24 Nov 2022 00:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa
 <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com> <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
 <f12c4b6f-8125-696c-5699-802ccc7c5f39@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f12c4b6f-8125-696c-5699-802ccc7c5f39@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AdhelorPgpZi

On 23/11/22 19:49, Cédric Le Goater wrote:
> On 11/23/22 19:13, Philippe Mathieu-Daudé wrote:
>> On 23/11/22 15:12, Alex Bennée wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>> On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
>>>>> On 18/11/22 12:33, Alex Bennée wrote:
>>>>>> The old URL wasn't stable. I suspect the current URL will only be
>>>>>> stable for a few months so maybe we need another strategy for hosting
>>>>>> rootfs snapshots?
>>>>>>
>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>> ---
>>>>>>    tests/avocado/boot_linux_console.py | 4 ++--
>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/avocado/boot_linux_console.py
>>>>>> b/tests/avocado/boot_linux_console.py
>>>>>> index 4c9d551f47..5a2923c423 100644
>>>>>> --- a/tests/avocado/boot_linux_console.py
>>>>>> +++ b/tests/avocado/boot_linux_console.py
>>>>>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>>>>>            dtb_path =
>>>>>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>>>>            dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>>>>            rootfs_url =
>>>>>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>>>>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>>>>>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>>>>>> +                      
>>>>>> 'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>>>>>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
>>>>> If Avocado doesn't find an artifact in its local cache, it will 
>>>>> fetch it
>>>>> from the URL.
>>>>> The cache might be populated with artifacts previously downloaded, but
>>>>> their URL is not valid anymore (my case for many tests).
>>>>> We can also add artifacts manually, see [1].
>>>>> I'd rather keep pre-existing tests if possible, to test older
>>>>> (kernel / user-space) images. We don't need to run all the tests all
>>>>> the time:
>>>>> tests can be filtered by tags (see [2]).
>>>>> My preference here is to refactor this test, adding the
>>>>> "kci-2019.02"
>>>>> and "baseline-20221116.0" releases. I can prepare the patch if you /
>>>>> Thomas don't object.
>>>>
>>>> IMHO we shouldn't keep tests in the upstream git repository where the
>>>> binaries are not available in public anymore. They won't get run by
>>>> new contributors anymore, and also could vanish from the disks of the
>>>> people who previously downloaded it, once they wipe their cache or
>>>> upgrade to a new installation, so the test code will sooner or later
>>>> be bitrotting. But if you want to keep the tests around on your hard
>>>> disk, you could also stick the test in a local branch on your hard
>>>> disk instead.
>>>
>>> CI/Workstation splits aside I tend to agree with Thomas here that having
>>> tests no one else can run will lead to an accretion of broken tests.
>>
>> Following this idea, should we remove all boards for which no open
>> source & GPL software is available? I.e:
>>
>> 40p                  IBM RS/6000 7020 (40p)
> 
> This machine can run debian :

IMHO having QEMU able to run anything an architecture can run seems way
more interesting/helpful rather than restricting it to just open source
projects.

>    qemu-system-ppc -M 40p -cpu 604 -nic user -hda ./prep.qcow2 -cdrom 
> ./zImage.hdd -serial mon:stdio -nographic
>    >> =============================================================
>    >> OpenBIOS 1.1 [Mar 7 2022 23:07]
>    >> Configuration device id QEMU version 1 machine id 0
>    >> CPUs: 0
>    >> Memory: 128M
>    >> UUID: 00000000-0000-0000-0000-000000000000
>    >> CPU type PowerPC,604
>    milliseconds isn't unique.
>    Welcome to OpenBIOS v1.1 built on Mar 7 2022 23:07
>    Trying hd:,\\:tbxi...
>    >> Not a bootable ELF image
>    >> switching to new context:
>    loaded at:     04000400 04015218
>    relocated to:  00800000 00814E18
>    board data at: 07C9E870 07CA527C
>    relocated to:  0080B130 00811B3C
>    zimage at:     0400B400 0411DC98
>    avail ram:     00400000 00800000
>    Linux/PPC load: console=/dev/ttyS0,9600 console=tty0 
> ether=5,0x210,eth0 ether=11,0x300,eth1 ramdisk_size=8192 root=/dev/sda3
>    Uncompressing Linux................................................done.
>    Now booting the kernel
>    Debian GNU/Linux 3.0 6015 ttyS0
>    6015 login:
> 
> Please keep it ! :)
> 
> and it also boots AIX 4.4/5.1 (with 2 small patches) but that's clearly
> not open source. It is downloadable from the net though, like many macos
> PPC images.
> 
> That said, we might have been putting too much in avocado and it takes
> ages to run (when it does not hit some random python issue).

w.r.t. "too much in avocado", are you referring to GitLab CI?

I see the following 2 use cases with Avocado:
  1/ Run tests locally
  2/ Run tests on CI
The set of tests used in 1/ and 2/ doesn't have to be the same...

1/ is very helpful for maintainers, to run tests specific to their
subsystems. Also useful during refactor when touching other subsystems,
to run their tests before sending a patch set.

2/ is the "gating" testing. With retrospective, it was a mistake to
start running avocado on CI without any filtering on what tests to run.
Instead of trying to explain my view here, I'd like to go back to Daniel
earlier proposal:
https://lore.kernel.org/qemu-devel/20200427152036.GI1244803@redhat.com/

Per this proposal, we should only run 'Tier 1' on Gitlab CI.
Daniel described "Tier 1" as "[test that] Will always work." I'd like to
amend with "test that run in less than 150 seconds" (or less). If a test
takes more, we can run it on our workstations, but we shouldn't waste
CI cycles with it.

I plan to post a series converting our current Avocado "opt-out" use:

   @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

to and "opt-in" one using the 'gating-ci-tier:1' Avocado tag.

(if curious: https://gitlab.com/philmd/qemu/-/commits/gci_tier1_optin/)

>>> Given the tests themselves are standalone couldn't the prospective test
>>> hoarder keep their own personal repository to be run with the rest of 
>>> the
>>> in-tree code, something like:
>>>
>>>    cd my/test/zoo/repo
>>>    $(QEMU_BUILD)/tests/venv/bin/avocado run my_test_zoo.py
>>>
>>> for convenience we could maybe support an env variable so the existing
>>> test selection tags would work:
>>>
>>>    set -x QEMU_AVOCADO_EXTRA_TESTS /my/test/zoo/repo
>>>    ./tests/venv/bin/avocado list
>>>    ...
>>>    <list all tests in qemu src tree and extra>
>>>    ...
>>>
>>> ?
>>
>> Yes, this is what we use to test the Fuloong2E:
>>
>> $ git grep RESCUE_YL_PATH tests/avocado/
>> tests/avocado/machine_mips_fuloong2e.py:21: 
>> @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
>> tests/avocado/machine_mips_fuloong2e.py:34:        kernel_path = 
>> self.fetch_asset('file://' + os.getenv('RESCUE_YL_PATH'),
>>
>> The firmware is not open source / GPL but if you have a Fuloong2E board
>> you can dump it from the flash, then use it to test QEMU from hard reset
>> up to userland. Otherwise you are forced to use the -kernel argument.
>>
>>>> The other possibility is to upload the binaries to a new public
>>>> location in the web ... but for software that contains GPLed software,
>>>> you should then also make sure to provide the source code to comply
>>>> with the license.
>>>
>>> This is the traditional reason we've lent so hard on external hosting
>>> for binaries because the upstream doesn't want the hassle of maintaining
>>> that sort of zoo of binaries. That said we have tests where binaries are
>>> served from fileserver.linaro.org but its then only my problem to deal
>>> with GPL requirements and not the upstream.
>>
>> Maybe we are discussing 2 different topics. I am in possession of
>> old Solaris installation CDROMs and could boot some of them with
>> qemu-system-sparc. I want to automatize my testing, and wrote Avocado
>> scripts doing that. I suppose other QEMU users have similar CDROMs.
>> If I contribute my tests, they can run them. Isn't it in the interest
>> of the community to have such examples and tests available?
> 
> I think so.
> 
> Is it time to move some of the tests (and images) in an external tree ?
> That would be one way to keep them available for all. I like qemu-zoo.
> 
> It would certainly require some legal advice.
> 
> 
> C.
> 
> 
>>
>> Regards,
>>
>> Phil.
>>
> 
