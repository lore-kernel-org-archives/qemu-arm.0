Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3921368wru;
        Tue, 2 Jul 2019 08:28:55 -0700 (PDT)
X-Received: by 2002:a5d:5450:: with SMTP id w16mr15041042wrv.128.1562081335750;
        Tue, 02 Jul 2019 08:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562081335; cv=none;
        d=google.com; s=arc-20160816;
        b=jArMJQRz38QBS40vtj8+RW9rn4RMzE4HyO7WhHGS+LhYDOJtkMAoNaQ8boF4KwWflZ
         C7yLIbtbtn/KV0zBB2Mgj26ikmKiCJlIdJ9v/CZEGEuc/3EfjPc5+Iq8bYanwj5Z8WBe
         a/8+0RCJCMi4DKm8/3mo3ZJ6fRRIoPc7S2ATERrt00N446ouSq4EHARCjlypOhL8sBh4
         tn3fg2ZqO3V1+8kSZX4FtoVvaiYhnle6Zfx1ATYG9GnV6LjIJavYZCuV4MzdkJV4lqTg
         V7yyrCqTd4NYBxTRoZIF46yHPtIcZELCbZ1XMmIvhUw5yBfJWJCmiaMB68ZV+t0nx/+p
         EC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=Kpm+FVcVGLC6WQ+TSkb4xsjH/RwO2EJz626KNut6Zfg=;
        b=UB5DjYqnZZlXWbmLBifDUakD1eLSjvoaHDKNcLeYin/illU6Xkp+c0ITajT7qUd05R
         55nzUCjbjkDUb5wCHP5JYTG7nIFyD6WKf1dJudy3LGZG4DHfYEjEsFLzz0UPd6GfHjob
         He/25GJrc4Os1uU5IaA/FZV2083RhYkebbCKtNq/sF2OmS8vWxQKSdymFWyNMYKl7JA/
         V79npW3Xl1vw0EOelEmcRcUcL9QYsdvdRIBUF0Zb3NkzvI5i9+nqyjca190yB6SbItxi
         Xs2hETGH8KVuoMEDU16Dz0NOVmNIshWwuCyZu1kEkqUU+Gf3WyHuBrMQOqgnKUqGUyul
         jebg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r2sor8029198wrl.34.2019.07.02.08.28.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 08:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kpm+FVcVGLC6WQ+TSkb4xsjH/RwO2EJz626KNut6Zfg=;
        b=AILHejKXSJkg0/0dLlOQHI6iUHvbrf+F61gf818Bjt7mDxj9XExZvOFwNnLc8gqAg2
         kxINqLp9ZfSKjJ3/xgC6FNjJjMmeCnH+V1Xq+nmKJ5aATAossAWqasJ6HIla/uJPUEI8
         VCg7ulfqAywWoT49L9l5U5xC/MkT3tYrdRHc3ESaupUi3NoyGHPLdp/5SoZ9b0SNz768
         ZKviSKchNOUMTKMkQm3viu/EVdGQ7HnzdvdVyzAbpTKdkk9+njW4x4A60DmXW8HKlykU
         ZWVxVVH03RlY2G86U+xX+1BK0cIhBWb0+II9OkhUf7mHjXFqRv2EZ0rak8/qFBVX0Py5
         9xMg==
X-Gm-Message-State: APjAAAXE1iUbcU0DFsQF3awpWAYmrbOWt103hekG29s0uKGXhOCbdGzf
	yJx/HByvt1KsU4hu35bpdIYuvA==
X-Google-Smtp-Source: APXvYqxULK7YUIBsuHoqyjaZ74ITUiFetNaDBCMhQ/+J7xZ0dQOTdDTHw83s7qafJED4fD+7a0yj6w==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr10443007wrq.221.1562081335512;
        Tue, 02 Jul 2019 08:28:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id s3sm3593192wmh.27.2019.07.02.08.28.53
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 08:28:54 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 0/9] hw/block/pflash_cfi01: Add
 DeviceReset() handler
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190702001301.4768-1-philmd@redhat.com>
 <0f46b807-1fcc-d5d6-9d62-601cc8dfa692@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e8b87bed-b7eb-d8bf-f011-e573b0737775@redhat.com>
Date: Tue, 2 Jul 2019 17:28:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0f46b807-1fcc-d5d6-9d62-601cc8dfa692@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: q5flmVrDufPZ

On 7/2/19 1:52 PM, Laszlo Ersek wrote:
> Hi Phil,
> 
> On 07/02/19 02:12, Philippe Mathieu-Daudé wrote:
>> The pflash device lacks a reset() function.
>> When a machine is resetted, the flash might be in an
>> inconsistent state, leading to unexpected behavior:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1678713
>> Resolve this issue by adding a DeviceReset() handler.
>>
>> Fix also two minor issues, and clean a bit the codebase.
>>
>> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.html
>> - addressed Laszlo review comments
>>
>> Maintainers spam list from:
>> ./scripts/get_maintainer.pl -f $(git grep -El '(pflash_cfi01_register|TYPE_PFLASH_CFI01)')
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (9):
>>   hw/block/pflash_cfi01: Removed an unused timer
>>   hw/block/pflash_cfi01: Use the correct READ_ARRAY value
>>   hw/block/pflash_cfi01: Extract pflash_mode_read_array()
>>   hw/block/pflash_cfi01: Start state machine as READY to accept commands
>>   hw/block/pflash_cfi01: Add the DeviceReset() handler
>>   hw/block/pflash_cfi01: Simplify CFI_QUERY processing
>>   hw/block/pflash_cfi01: Improve command comments
>>   hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
>>   hw/block/pflash_cfi01: Hold the PRI table offset in a variable
>>
>>  hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
>>  hw/block/trace-events   |   1 +
>>  2 files changed, 74 insertions(+), 67 deletions(-)
>>
> 
> I'll do some regression-tests with this, using OVMF and ArmVirtQemu.

My local tree is larger with many tracing improvments, but I stripped
that part to keep this series short and bugfix oriented.

I used the trace logs to analyse the guest accesses.

My test setup is not yet automatized but I'm working on passing all the
one working with TCG as Avocado tests.

Tests machines (firmwares):

- ARM Verdex with (U-Boot)
- MIPS Malta with (Linux)
- LM32 Milkymist One (RTEMS)
- X86 (EDK2 OVMF)

Each guest has different driver, thus use this device quite differently.

What I want to add to this list is:

- AARCH64 Virt (EDK2 ArmVirtQemu)

Because it uses another driver (not the OVMF one).

> I don't think I can usefully review the patches without getting lost in
> the related spec(s), and I don't have capacity for that.
> 
> Until I have regression test results, one question: are the changes to
> the device model transparent with regard to migration? (You are not
> introducing any compat properties.)

Good point.

Two fields updated are migrated:

static const VMStateDescription vmstate_pflash = {
    .name = "pflash_cfi01",
    .version_id = 1,
    .minimum_version_id = 1,
    .post_load = pflash_post_load,
    .fields = (VMStateField[]) {
        ...
        VMSTATE_UINT8(cmd, PFlashCFI01),
        VMSTATE_UINT8(status, PFlashCFI01),
        ...
        VMSTATE_END_OF_LIST()
    }
};

- status: should not break anything

- cmd:

  If migrated during cmd == READ_ARRAY state:

  Guest is saved with older QEMU having cmd=READ_ARRAY=0x00

  Guest restored to newer QEMU expecting READ_ARRAY=0xff

  - If the guest do a READ access, we are [currently] fine:
  the 0x00 command hits the default case and falls through
  0xff.

    ('currently' because I have a local patch that would
     clean up this impossible case, but I made it possible).

  - If guest does WRITE access, again the 0x00 is processed
  by the default case where we jump to the error_flash label.
  There we log a warning and call pflash_mode_read_array().

  So this is not clean, but safe.

  To be clean I should document 0x00 was previously used and
  even not matching the specs, we have to live with handling
  it forever.



  A cleaner way to keep this safe and the code simple is to
  increment vmstate_pflash.version_id, and add a new case in
  the post_load handler:

static int pflash_post_load(void *opaque, int version_id)
{
    PFlashCFI01 *pfl = opaque;

    ... // current handler code

    if (version_id < 2) {
        /* version_id used 0x00 for READ_ARRAY */
        if (s->cmd == 0x00) {
            s->cmd =  0xff;
        }
    }
    return 0;
}

Since I'm new with migration, I Cc'd Dave to check :)

Thanks!

Phil.
