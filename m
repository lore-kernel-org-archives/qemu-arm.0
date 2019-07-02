Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3820424wru;
        Tue, 2 Jul 2019 06:41:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUAuq6oXhoha5q+FfAn1m3G2qtyeQDLtOsinq17FU8RwbVykL1leVuDE1RkMA5o/Vc8Z7E
X-Received: by 2002:a37:c248:: with SMTP id j8mr15579681qkm.494.1562074916579;
        Tue, 02 Jul 2019 06:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562074916; cv=none;
        d=google.com; s=arc-20160816;
        b=QMjNyNgD1tw1rAJFHgmujfbW/+JCf4xn3bbLuKVoK5clkCU2f+NxviB4Sf26RMbkPF
         NBDBoWlncyMoS+hE+kh/2TAwOJA/071W1B/2iBPrfHz95RNt4M3Ohbqct1M1GlFYTJA8
         gE6Sho3x8SqYi7eUo4irkM/IkvD6hfgvrQmjclupwdf1ZgunsYvBhKf4XOaynLZ31f0E
         fw/wApxYtlylxNH/1ykayfaqVSE9x1AiNOuJYMnWHJP1t0OHCgu1WFnMNge2pTNVOto9
         8PYmO0LdJX+49EqzElHAlmCeBEgoMLau/yTHtVMGUvuharxvtGcti/nCQxaNnh+1hPk2
         qYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=YUcO/0iiJH7znPu/ijy+5biH2mfFFrPuDtTa2oSnbi4=;
        b=xi8qJQtg6ZAws9y+mbzq1Or7ys4bwErF8NJAGE5qkFxnUqaZM+BxJggCsPJFXS7WiJ
         adBRBpkQNOfPUVIx1mQWkJA/Xu5AqzltciCuO4GUghv8r+xZ0Dv7YHvCDYiXgK8pX0B1
         pKfLo+O7s0ka4448YJ/WfkMqKo3B5eM4LNJRY0D92oR07F5cUrP5Y4m8YfTRFto59LLq
         I5mufNwJsr1g3ZVTXGS8fkKWTKrr+URTT0xycuffNzfrnJGttfJdQNe6BIVfdBKNvK5D
         jwLplYXe2oO6pOxN4S9Hwg+BmaeyCZ41ufyegnuCDtb/r4vkV4mFgWrN1UKhYEe1C/Bv
         JIAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g53si9235057qtb.179.2019.07.02.06.41.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 06:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BDEC85545;
	Tue,  2 Jul 2019 13:41:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB1D60C43;
	Tue,  2 Jul 2019 13:41:26 +0000 (UTC)
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
Message-ID: <38dd2737-4cd8-1145-1a57-aacf04f74dfc@redhat.com>
Date: Tue, 2 Jul 2019 15:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0f46b807-1fcc-d5d6-9d62-601cc8dfa692@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 02 Jul 2019 13:41:55 +0000 (UTC)
X-TUID: +VPsXlffjm5w

On 07/02/19 13:52, Laszlo Ersek wrote:
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
> 
> I don't think I can usefully review the patches without getting lost in
> the related spec(s), and I don't have capacity for that.
> 
> Until I have regression test results, one question: are the changes to
> the device model transparent with regard to migration? (You are not
> introducing any compat properties.)

I didn't test migration.

With OVMF, I performed my usual Linux guest tests (partly described at
<https://github.com/tianocore/tianocore.github.io/wiki/Testing-SMM-with-QEMU,-KVM-and-libvirt#tests-to-perform-in-the-installed-guest-fedora-26-guest>).
I found no problems / discrepancies, in either guest behavior or
firmware logs.

With ArmVirtQemu, I meant to test on KVM (pflash used to be really
sensitive to KVM<->TCG differences), but my aarch64 hardware is
apparently dying, and I wouldn't like to spend a day just to provision a
remote aarch64 box. So, no test results on aarch64.

With those caveats:

Regression-tested-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo
