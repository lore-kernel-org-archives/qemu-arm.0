Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp4223627wru;
        Tue, 2 Jul 2019 14:01:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxrVThN79ZQCqIDzemK4ZO3Mu9LpkztBEHR3dDhihWkAaJAFRtlqqPaJXRtdzoQstvZ4md
X-Received: by 2002:aed:2e64:: with SMTP id j91mr25871991qtd.318.1562101274421;
        Tue, 02 Jul 2019 14:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562101274; cv=none;
        d=google.com; s=arc-20160816;
        b=AydfE0mzCe+4lNBVYsp5nkbdc+qCAuDT1cX1DTXkJ+dThFdS4MZkg1CxiFXvi0Y7/g
         EsLgikhZA5Pr9nbh1U/hdzas7HuPpuO9l1+fF1w/lC9RQPA5ez78OGR9pj5+zr74uGsw
         fszusW2CzQk1ZkKBj2B1YB/TJHhYZmOUd/7ySr2qEmPckfJkLYymBTfvff00ZBTQTsQw
         uILyo3dw47sz/wd9oOd25eByPeY5+qdWhArpI5kVCtsTNpPdapuPsrfN5WoXkw4lYmXK
         zIwbXD2gNNtmeBNspxV/sXHw3UMHxYw+4DEHrALJaDw+ZP1EByxzepQe4uxsOyN6ikj9
         L8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=ncfi2ptER317Rs2c70pV3h0YVZAjvIWIV7Fx0u+hLbc=;
        b=t8xVtsFWXs83LR9kM0o/S30Hyz3kEGQ3O3ZhLJoXY2iS5OFl93VuaUOpoINouwGAel
         IppnO5z6YInYWYDPdjli6QvAl1HjWQGj7oNwYKP1CYy8u9qG3OAkqYCFueAuQ2728Lrr
         Uf87W5CGoAXwytypEQwOwgP46pH2C8ayOZI+XjKK+JQG0ojZNC5NaT1u1yc+h+NvWpCm
         vcWkXKZYztoDiVkh4CB7CTJOFnISdD8xmMCpG1GpN72pLaKWZ5U5rgFK0TaT+nluoKuq
         LIUmoZ4DNkjriN3BW854XcOG67FyjjBiuZl32mqPlVz1GU4WDddSfAzxtQSf+K1fdGPA
         IWCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b2si118909qvj.184.2019.07.02.14.01.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 14:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 128C830BB524;
	Tue,  2 Jul 2019 21:00:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8CB25C231;
	Tue,  2 Jul 2019 21:00:38 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 0/9] hw/block/pflash_cfi01: Add
 DeviceReset() handler
From: Laszlo Ersek <lersek@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
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
 <38dd2737-4cd8-1145-1a57-aacf04f74dfc@redhat.com>
Message-ID: <38281fa7-30f4-60ec-3357-3e1613c44dbe@redhat.com>
Date: Tue, 2 Jul 2019 23:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <38dd2737-4cd8-1145-1a57-aacf04f74dfc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 02 Jul 2019 21:01:08 +0000 (UTC)
X-TUID: Nr6KjOL+RfDh

On 07/02/19 15:41, Laszlo Ersek wrote:
> On 07/02/19 13:52, Laszlo Ersek wrote:
>> Hi Phil,
>>
>> On 07/02/19 02:12, Philippe Mathieu-Daudé wrote:
>>> The pflash device lacks a reset() function.
>>> When a machine is resetted, the flash might be in an
>>> inconsistent state, leading to unexpected behavior:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1678713
>>> Resolve this issue by adding a DeviceReset() handler.
>>>
>>> Fix also two minor issues, and clean a bit the codebase.
>>>
>>> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.html
>>> - addressed Laszlo review comments
>>>
>>> Maintainers spam list from:
>>> ./scripts/get_maintainer.pl -f $(git grep -El '(pflash_cfi01_register|TYPE_PFLASH_CFI01)')
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>> Philippe Mathieu-Daudé (9):
>>>   hw/block/pflash_cfi01: Removed an unused timer
>>>   hw/block/pflash_cfi01: Use the correct READ_ARRAY value
>>>   hw/block/pflash_cfi01: Extract pflash_mode_read_array()
>>>   hw/block/pflash_cfi01: Start state machine as READY to accept commands
>>>   hw/block/pflash_cfi01: Add the DeviceReset() handler
>>>   hw/block/pflash_cfi01: Simplify CFI_QUERY processing
>>>   hw/block/pflash_cfi01: Improve command comments
>>>   hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
>>>   hw/block/pflash_cfi01: Hold the PRI table offset in a variable
>>>
>>>  hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
>>>  hw/block/trace-events   |   1 +
>>>  2 files changed, 74 insertions(+), 67 deletions(-)
>>>
>>
>> I'll do some regression-tests with this, using OVMF and ArmVirtQemu.
>>
>> I don't think I can usefully review the patches without getting lost in
>> the related spec(s), and I don't have capacity for that.
>>
>> Until I have regression test results, one question: are the changes to
>> the device model transparent with regard to migration? (You are not
>> introducing any compat properties.)
> 
> I didn't test migration.
> 
> With OVMF, I performed my usual Linux guest tests (partly described at
> <https://github.com/tianocore/tianocore.github.io/wiki/Testing-SMM-with-QEMU,-KVM-and-libvirt#tests-to-perform-in-the-installed-guest-fedora-26-guest>).
> I found no problems / discrepancies, in either guest behavior or
> firmware logs.
> 
> With ArmVirtQemu, I meant to test on KVM (pflash used to be really
> sensitive to KVM<->TCG differences), but my aarch64 hardware is
> apparently dying, and I wouldn't like to spend a day just to provision a
> remote aarch64 box. So, no test results on aarch64.

Managed to run a light regression-test on aarch64 KVM too, using the
ArmVirtQemu fw and an F28 guest.  (boot+reboot, without the patches and
with the patches; logs compared, behavior compared.) Everything seems fine.

Thanks
Laszlo

> With those caveats:
> 
> Regression-tested-by: Laszlo Ersek <lersek@redhat.com>
> 
> Thanks
> Laszlo
> 
