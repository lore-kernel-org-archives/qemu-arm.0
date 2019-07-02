Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3739471wru;
        Tue, 2 Jul 2019 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzo1jt09PtcyaYa+6nbNHyZRJLKltVhgpT1kqWh/aMVBAYBQQty+gz/hQNk25vszdcg1gLC
X-Received: by 2002:ac8:2f1b:: with SMTP id j27mr24173374qta.92.1562069676289;
        Tue, 02 Jul 2019 05:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562069676; cv=none;
        d=google.com; s=arc-20160816;
        b=tuAABlk9i4DE1tRUmFMRPjTT829xXZXsmrL0bD+BfV9WxkLRn7wzdB9oc+CwC6htYZ
         vPha66IaXj4YqI5Cv7vANVDl3RSD6e3xyB+sCNs9Son/1jMcouiYz5ai1zFcG02fCQ8N
         6XMdMO4qjsOlzaAY3tyARptzzrxzLQ3ohKc1Egtv2g+zp0wybfbcdK9qWCVFhxm3pHYn
         OqGCFAEAQqghlCGBYutn5uZ7uJkzo2alfbUDG/d1VNxPgSSEXMFHl27iI24DB296DzMn
         cqzcffr1l99ac2rtYUqRlQRY75NF56UwgwLANc6uu3c5kNtl9ik7r7mpN6gej/p64/3w
         booQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=FczhhQGfbpFEG8C4BfFMset6o8INzajOSM+XO4Po88s=;
        b=DdUWfyT1NWtXUiuhf/zmom1wjiCThgmjy8+Ejw09tf7UJBzZ5DCw4fCyEvMDgZoZKW
         Av8V2/y10N8MwY+uOlWdUXfuAc1C0Ud/8I2B8gznl2Q84NoJFyHmOPf6psaNJ9te/K01
         GqfID+SkI5AAe7wwLqGKLvwWCP4DxIt1KIeWwyh0MyEazIXVwloqwKwn5JcmcYOjNtjo
         jAd59tgeqAw/WI5rP25azZO2xz2DIDAr0MVfUWTh4OoPTTEXSE3TTVRA/J0/avpzr0ci
         6aP8aYteiHspGnKeAAIpgTgYNjOhtVQWTnlTN1lw91/qsXth0f0EVa1Qg8rFBrFz7dp6
         KM3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q52si9344923qte.125.2019.07.02.05.14.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 05:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A5F16749D;
	Tue,  2 Jul 2019 12:14:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51CA360C67;
	Tue,  2 Jul 2019 12:14:06 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 5/9] hw/block/pflash_cfi01: Add the
 DeviceReset() handler
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-6-philmd@redhat.com>
 <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f147ac70-298c-f323-360b-6a48857293d3@redhat.com>
Date: Tue, 2 Jul 2019 14:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 02 Jul 2019 12:14:34 +0000 (UTC)
X-TUID: OiE87CsKWqP6

On 07/02/19 05:16, John Snow wrote:
> 
> 
> On 7/1/19 8:12 PM, Philippe Mathieu-Daudé wrote:
>> A "system reset" sets the device state machine in READ_ARRAY mode
>> and, after some delay, set the SR.7 READY bit.
>>
>> We do not model timings, so we set the SR.7 bit directly.
>>
>> This pflash device is a child of TYPE_DEVICE.
>> The TYPE_DEVICE interface provide a DeviceReset handler which will
>> be called after the device is realized, and each time the machine
>> resets itself.
>>
>> To avoid incoherent states when the machine resets (see but report
>> below), factor out the reset code into pflash_cfi01_system_reset,
>> and register the method as a device reset callback.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1678713
>> Reported-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Does reset always get called as part of realize, really?

I'm not an expert on this, but I believe the following happens.

(1) When a device is hotplugged, the device is reset as part of realize
in the following call stack:

device_set_realized() [hw/core/qdev.c]
  device_reset()      [hw/core/qdev.c]


(2) For when the device is cold-plugged, we have, in main()
[hw/core/qdev.c]:

    /* TODO: once all bus devices are qdevified, this should be done
     * when bus is created by qdev.c */
    qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());

and then a bit later

    qemu_system_reset(SHUTDOWN_CAUSE_NONE);

AIUI it results in a recursive traversal / reset,

qbus_reset_all_fn()      [hw/core/qdev.c]
  qbus_reset_all()       [hw/core/qdev.c]
    qbus_walk_children() [hw/core/bus.c]
      qdev_reset_one()   [hw/core/qdev.c]
        device_reset()   [hw/core/qdev.c]


In other words, I think you have a point about clarifying the commit
message. It's likely not that the device is re-set (a) after it is
realized *and* (b) each time the machine is re-set. Because, pflash is
not hot-plugged, so reset-on-hotplug does not apply, and so case (a)
falls away. Instead, case (b), "each time the machine is re-set",
includes the initial launch of the machine, and that is why pflash is
ultimately re-set at startup. It does happen after realize, but not as
part of it.

Anyway, Phil can verify this easily: just set a breakpoint on
pflash_cfi01_system_reset() in gdb before launching qemu, and get a
backtrace once the breakpoint fires. :)

Thanks
Laszlo

> Or are we just trusting that the device is probably going to get reset
> by the guest during bringup?
> 
>> ---
>>  hw/block/pflash_cfi01.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> index dd1dfd266b..8d632ea941 100644
>> --- a/hw/block/pflash_cfi01.c
>> +++ b/hw/block/pflash_cfi01.c
>> @@ -763,8 +763,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>          pfl->max_device_width = pfl->device_width;
>>      }
>>  
>> -    pflash_mode_read_array(pfl);
>> -    pfl->status = 0x80; /* WSM ready */
>>      /* Hardcoded CFI table */
>>      /* Standard "QRY" string */
>>      pfl->cfi_table[0x10] = 'Q';
>> @@ -852,6 +850,18 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>      pfl->cfi_table[0x3f] = 0x01; /* Number of protection fields */
>>  }
>>  
>> +static void pflash_cfi01_system_reset(DeviceState *dev)
>> +{
>> +    PFlashCFI01 *pfl = PFLASH_CFI01(dev);
>> +
>> +    pflash_mode_read_array(pfl);
>> +    /*
>> +     * The WSM ready timer occurs at most 150ns after system reset.
>> +     * This model deliberately ignores this delay.
>> +     */
>> +    pfl->status = 0x80;
>> +}
>> +
>>  static Property pflash_cfi01_properties[] = {
>>      DEFINE_PROP_DRIVE("drive", PFlashCFI01, blk),
>>      /* num-blocks is the number of blocks actually visible to the guest,
>> @@ -896,6 +906,7 @@ static void pflash_cfi01_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>  
>> +    dc->reset = pflash_cfi01_system_reset;
>>      dc->realize = pflash_cfi01_realize;
>>      dc->props = pflash_cfi01_properties;
>>      dc->vmsd = &vmstate_pflash;
>>
> 
