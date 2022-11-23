Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4416471ejx;
        Wed, 23 Nov 2022 10:13:12 -0800 (PST)
X-Received: by 2002:a5d:6752:0:b0:235:771:8488 with SMTP id l18-20020a5d6752000000b0023507718488mr17680475wrw.640.1669227192465;
        Wed, 23 Nov 2022 10:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669227192; cv=none;
        d=google.com; s=arc-20160816;
        b=wboWOAl84/BiRzAcC3lS8gMLCoY/tUaYIth74XC3oaKp3i3ZUGmvQvVBUGjRlk7E95
         EdngIQHNRFlC6o4wGbHJZNEuRVliBZyeQNyBqvXIxcztm5N/pYCaxExYySCxQpF01jfR
         VrE+4QJPRJMBwmzz7nTMDQSdakIKdRoZdGD39NserrSbdLn+YolCRxqY8tus6DXriISH
         5hPOlZSE6AKwCeJqiZK+FUYLSKYWSXla5XsgLoJ01xZkLRmN0FT7qEN91bYMhlSCbzEk
         FZZS5PCTaIAtlusgZ9cXtvO03A3sPFvlUc4hbvR1DFMZ9aBQl7W/OcVnmB/4P4lbzWs1
         zqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x3zkJffOPNDUREeCIEZzVEPBL95z9W8u0pCwZnwMLf0=;
        b=nzDE7omJvto7EpFBvQIcNZPKVm69xC6Ezro8+raart27tzhNSTwwdXU7akq+9B1fqM
         LW8tBZy1PZ5jdT4h/MJtziimse/aLYqAdsT+NXuvFJqdnRGQU9qiozSX+l9b9UblkCZt
         zYhu6B0cfdQpifySvtc5HxjucOg6Li9w68sGTBhja7f5v0j2MdVBu5LQHQJfrXAmH+x6
         90L6AX09rE6/J3Kib/u/Ix1X/I7FiEL3WaXSEj97x22Nhkd28AKRk6gSec/ne+aacPpo
         ZH0D7M00Ef3rp5z+4vQZcRY0SshyazijzsME+OKwDwClelgpQFAvSBoAHPrn5A/otJVk
         JZfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mltUwNhX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020a1c4604000000b003b4f9f58f77sor881672wma.45.2022.11.23.10.13.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Nov 2022 10:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mltUwNhX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3zkJffOPNDUREeCIEZzVEPBL95z9W8u0pCwZnwMLf0=;
        b=mltUwNhXTiVNLyFs9dMP4pQYxmJDVURN3iA8AezYblVgwSo3Q6xa1qd83JiaFlGNRo
         5rfiIm8MntVXOXyflKYLjL+TfjvzRXypuVclAZC999cOMAWguXGwN0KUJI6YEoRa8pbN
         b9x23cSwppdQc30oVUUifPM37ygk1FVBXATfetEnB/AubjO9+77KWlUsPh2B/5SU5Bgi
         QWhVLx8FAF/maJ+LHsVxEchOhnLpLVa0z/60zUM7/1DOYdl4B/hEkehSjt4WIolfKFn0
         nJl0tOjm89qDIWGZwr5kYoQ891nrmy6vNk65lj1cbqLQMiRPDoR2x++NxcBJ66IgP8SU
         olfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3zkJffOPNDUREeCIEZzVEPBL95z9W8u0pCwZnwMLf0=;
        b=YninTdy1sovvDWYCFEWh/gh+MsSc9xnB+JBXmKmk/t+sxMOFNr9GYnl5mLnA5iKyIW
         Lpu83GW/qmSZ4L4uGdvQk7W4J0D2sUsyQJN5JcKdHtEEGciVb7lX1j1yGm6ng2UwEBAC
         w9cSZH2wjYPlcF2Sj0VN+mfN+W8V9e6Kru3XvFcuhJKJ4g3sVuJmfFOlDH/5gORS0bk5
         frXl4aYMjkrFmdRrZg/pBmbVLfaEBu4Oq95c7BCIdsu7/MjXOlDgAnrfelHEHPxHhr0j
         3Fzcp5FKz/Pfb7o/Z4mIc22V86M4uZW/7j1lZcaSrbg/4vHiTBlkGAo8tCo+4X3NDO2x
         5I3w==
X-Gm-Message-State: ANoB5plTMYOiRTmExvOEKrIpRBRUYqzAih470XmuaUJQWEuXeTyHoaUN
	9ZFhJpB9u2++IBPdGN4S9Rap8oLVOUVKje1n
X-Google-Smtp-Source: AA0mqf4TbeLbMOBb/wsOHiH80j21YCnNpgvFrZYbp2NRzOlfycFNPs6ovy73O6evwEX2+zAnoMr+PQ==
X-Received: by 2002:a1c:7219:0:b0:3cf:77b7:61e6 with SMTP id n25-20020a1c7219000000b003cf77b761e6mr9867309wmc.162.1669227191766;
        Wed, 23 Nov 2022 10:13:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b00235da296623sm17273348wrt.31.2022.11.23.10.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 10:13:11 -0800 (PST)
Message-ID: <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
Date: Wed, 23 Nov 2022 19:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa
 <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com> <87fse9bvmf.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87fse9bvmf.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: booMCaNLqwjf

On 23/11/22 15:12, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
>> On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
>>> On 18/11/22 12:33, Alex Bennée wrote:
>>>> The old URL wasn't stable. I suspect the current URL will only be
>>>> stable for a few months so maybe we need another strategy for hosting
>>>> rootfs snapshots?
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    tests/avocado/boot_linux_console.py | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/avocado/boot_linux_console.py
>>>> b/tests/avocado/boot_linux_console.py
>>>> index 4c9d551f47..5a2923c423 100644
>>>> --- a/tests/avocado/boot_linux_console.py
>>>> +++ b/tests/avocado/boot_linux_console.py
>>>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>>>            dtb_path =
>>>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>>            dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>>            rootfs_url =
>>>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>>>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>>>> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>>>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
>>> If Avocado doesn't find an artifact in its local cache, it will fetch it
>>> from the URL.
>>> The cache might be populated with artifacts previously downloaded, but
>>> their URL is not valid anymore (my case for many tests).
>>> We can also add artifacts manually, see [1].
>>> I'd rather keep pre-existing tests if possible, to test older
>>> (kernel / user-space) images. We don't need to run all the tests all
>>> the time:
>>> tests can be filtered by tags (see [2]).
>>> My preference here is to refactor this test, adding the
>>> "kci-2019.02"
>>> and "baseline-20221116.0" releases. I can prepare the patch if you /
>>> Thomas don't object.
>>
>> IMHO we shouldn't keep tests in the upstream git repository where the
>> binaries are not available in public anymore. They won't get run by
>> new contributors anymore, and also could vanish from the disks of the
>> people who previously downloaded it, once they wipe their cache or
>> upgrade to a new installation, so the test code will sooner or later
>> be bitrotting. But if you want to keep the tests around on your hard
>> disk, you could also stick the test in a local branch on your hard
>> disk instead.
> 
> CI/Workstation splits aside I tend to agree with Thomas here that having
> tests no one else can run will lead to an accretion of broken tests.

Following this idea, should we remove all boards for which no open
source & GPL software is available? I.e:

40p                  IBM RS/6000 7020 (40p)
akita                Sharp SL-C1000 (Akita) PDA (PXA270)
midway               Calxeda Midway (ECX-2000)
terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)

> Given the tests themselves are standalone couldn't the prospective test
> hoarder keep their own personal repository to be run with the rest of the
> in-tree code, something like:
> 
>    cd my/test/zoo/repo
>    $(QEMU_BUILD)/tests/venv/bin/avocado run my_test_zoo.py
> 
> for convenience we could maybe support an env variable so the existing
> test selection tags would work:
> 
>    set -x QEMU_AVOCADO_EXTRA_TESTS /my/test/zoo/repo
>    ./tests/venv/bin/avocado list
>    ...
>    <list all tests in qemu src tree and extra>
>    ...
> 
> ?

Yes, this is what we use to test the Fuloong2E:

$ git grep RESCUE_YL_PATH tests/avocado/
tests/avocado/machine_mips_fuloong2e.py:21: 
@skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
tests/avocado/machine_mips_fuloong2e.py:34:        kernel_path = 
self.fetch_asset('file://' + os.getenv('RESCUE_YL_PATH'),

The firmware is not open source / GPL but if you have a Fuloong2E board
you can dump it from the flash, then use it to test QEMU from hard reset
up to userland. Otherwise you are forced to use the -kernel argument.

>> The other possibility is to upload the binaries to a new public
>> location in the web ... but for software that contains GPLed software,
>> you should then also make sure to provide the source code to comply
>> with the license.
> 
> This is the traditional reason we've lent so hard on external hosting
> for binaries because the upstream doesn't want the hassle of maintaining
> that sort of zoo of binaries. That said we have tests where binaries are
> served from fileserver.linaro.org but its then only my problem to deal
> with GPL requirements and not the upstream.

Maybe we are discussing 2 different topics. I am in possession of
old Solaris installation CDROMs and could boot some of them with
qemu-system-sparc. I want to automatize my testing, and wrote Avocado
scripts doing that. I suppose other QEMU users have similar CDROMs.
If I contribute my tests, they can run them. Isn't it in the interest
of the community to have such examples and tests available?

Regards,

Phil.
