Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3869152wru;
        Tue, 2 Jul 2019 07:33:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK+ETT0bmkuBFVgafdCLnfr+uWKwj2rozSHv+23KcZ/hRHu6Ade1ekjAQ8VssP0Ccc105e
X-Received: by 2002:a0c:d0b6:: with SMTP id z51mr26838570qvg.3.1562078016884;
        Tue, 02 Jul 2019 07:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078016; cv=none;
        d=google.com; s=arc-20160816;
        b=0kOka1c6zg9C3Klmb4vYyfy7yPspUnhJJxUwcj4B9DkDNgHU2247kC16S7jLJMbLzq
         X9tQxHxCOSkDOUlaE+FlsVtWru2bklJnnbBb5KpX5WraTAzEhde3G3iujH2Q2MzMPbip
         1ic4nqlpBKhgQfNIKC45ZXnbUL8KmLDqR1FtSmoord139iux85jkdiZgXYlWSq821vzU
         aHGCF6fafvry1Ggr5tkCJU4Jwjp6QKUmmwu+CwcxuH8FIlaYZG8/Ndg8C+M6v0xunwml
         u8BTPOijA1zt900oZcTKeIubL/LzmjpP0F+av21Rlm58N0LnM6BJAEh/GYZE3j8J9Lbu
         1Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=xawgHW1MVMAwfV/rQGIof/tyOURw8nC0S2OPSeQKM2w=;
        b=SozH9PJBt9PlX9DtlXoCMjXCABgkqNQNCEFj/VqndbHbf8yCQMLN/kolSGpGlhkTVZ
         VDdF7t+sCiqfGzCUEAvKjVi85iL2fyY6/oQ8TQO6+Ft7p1DZ77mZAhmdCuhcJZdRRG6X
         B0JlplcG41Xf5iTE7lcY71VxeIKAQmyH4Kc3AGAFTBkCZ1WDXysSDAZYsCOs0giUTyx0
         r5GBSvKZRnf94Q0QJybnCAZs+BByDHOjxGVID4lQrvaIHTYX+jy5FvYc4/KTCGOB+n6T
         UosHYPU4zVEsLeYqaNlhKjqJexZCF5+54Q+kktFhxzTlhMDtEK5Yz4kNZyoQw3EGGicK
         T1+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 71si9819747qkd.345.2019.07.02.07.33.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D1D781DFC;
	Tue,  2 Jul 2019 14:33:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3BA01001DD5;
	Tue,  2 Jul 2019 14:32:37 +0000 (UTC)
Subject: Re: [PATCH v2 5/9] hw/block/pflash_cfi01: Add the DeviceReset()
 handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc <qemu-ppc@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>,
 Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-6-philmd@redhat.com>
 <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
 <CAFEAcA_n3BpZuBPFS8y90XaOwzAo-tuKpO24_apz+9yzpxUxHQ@mail.gmail.com>
 <633b88d8-88d0-3fa0-ff25-63935d8806fe@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d70226ca-4c54-f3f7-5284-482f3207d76d@redhat.com>
Date: Tue, 2 Jul 2019 16:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <633b88d8-88d0-3fa0-ff25-63935d8806fe@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 14:33:36 +0000 (UTC)
X-TUID: LiV7cDkAexBU

On 07/02/19 11:37, Philippe Mathieu-Daudé wrote:
> On 7/2/19 11:23 AM, Peter Maydell wrote:
>> On Tue, 2 Jul 2019 at 04:16, John Snow <jsnow@redhat.com> wrote:
>>> Does reset always get called as part of realize, really?
>>>
>>> Or are we just trusting that the device is probably going to get reset
>>> by the guest during bringup?
>>
>> Reset is not called "as part of realize", but it is guaranteed
>> to be called after realize and before we try to run the guest,
>> as long as the device is in the qbus tree. Things are in the
>> qbus tree if either:
>>  * they're plugged into something already in the tree (eg
>>    pci devices, scsi disks)
>>  * they're a sysbus device (which is automatically plugged into
>>    the 'main system bus' which is effectively the root of the
>>    qbus tree)
>>
>> In this case TYPE_PFLASH_CFI01 is a subclass of TYPE_SYS_BUS_DEVICE,
>> so it will always be reset as part of system reset.
>>
>> (the main things which don't get automatically reset are direct
>> subclasses of TYPE_DEVICE, notably CPU objects.)
> 
> Thanks for the clarification!
> 
> I will update the commit description paraphrasing Peter:
> 
>   The TYPE_DEVICE interface provides a DeviceReset handler.
>   This pflash device is a subclass of TYPE_SYS_BUS_DEVICE (which
>   is a subclass of TYPE_DEVICE).
>   SYS_BUS devices are automatically plugged into the 'main system
>   bus', which is the root of the qbus tree.
>   Devices in the qbus tree are guaranteed to have their reset()
>   handler called after realize() and before we try to run the guest.
> 
>   To avoid incoherent states when the machine resets (see but report
>   below), factor out the reset code into pflash_cfi01_system_reset,
>   and register the method as a device reset callback.
> 
> John, Laszlo, is that OK with you?

works for me, sure.

Thanks
Laszlo
