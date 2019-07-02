Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3598443wru;
        Tue, 2 Jul 2019 02:37:09 -0700 (PDT)
X-Received: by 2002:a1c:7a01:: with SMTP id v1mr2925601wmc.10.1562060229085;
        Tue, 02 Jul 2019 02:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562060229; cv=none;
        d=google.com; s=arc-20160816;
        b=eE13HlA6vYb7K5DFILUR8b1b6zRHwTOkeMWURbgl9pte0zBsUQLr/GYk2K3hj9+oPu
         dBaRB/eP9W+tnKUnO6Zprd0R4C5EFCN3b4gweN/WMl7OAWg/OGA1ut7KHftUBeHain9t
         qLver+j09IPLRFqejLU/SJHLVMPSZzIK5bjXH0++dAjLH9nfYg0H1XUc1vTV8i9Zog53
         BAhvnU5bxtANAJtkrhxMwLeujUKZZQBbfynao8j2FWwpFaNG4mbQNFpxAZCD/Z63YBdM
         KjlWzqg8mEsVIaUqyhhPCDlklJBcWFci6BN95J8JX4PVg7OlOQo/oJJ4nJWOoyR7daYb
         Tn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=/Q8RWJYyCw3CbRKDqKY7Vc9QfleR2sokn3SYWdrd5hk=;
        b=RUKS8fSaNALXLNdj30PqnBFN2hhZ+kaENLLdc7w1iswzhb3cZx5tmj+VpnPvqBFrAT
         Fb9cySJP6sNMl0XyNbl88orthEzV678iZ4X+upCxvE7obnOUamCE+h72ogoEQMNBUFcG
         rUH5Z8GpR1YJkzkJb/PTBW7rd3uYYr41/WKv4Jas41LsRBHg7CFlKEkO/wF6W9xikICD
         f3cxKLT9KgiF9mlhZpO5Zpjj1fDoQ3PPXc9lOBiiUX+rugFVOkSnm+G4NviWDLRZPvFG
         euDVX2dv78SZL3Hr9UHM9zbTq/o80n2lnJTpJp0LQnOscqfjTGj7J6cu1XFuxatxGndA
         9XFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f17sor9949859wrv.33.2019.07.02.02.37.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 02:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Q8RWJYyCw3CbRKDqKY7Vc9QfleR2sokn3SYWdrd5hk=;
        b=KZEYP7xHaPoepi4Fm+3mLxSVl1bPlff6lWAkcqL5RaWEXH9ZcTDL6/K1aU5cfcXVqK
         4kjyJCfaS4mVcPDuiXTNRdTVY3Bg906nIUTrXidAxjSFSH5ZJ2477ywARrMVBSICnsr6
         HY8VsUCJqY1AagXr1ql2dqb+JWd2uzOxVj3sTip/bHGdU+U0mjSzgoJd3UGR8hHY1wj7
         +WOwPFZlX/kKrW3wznVT0b6MxHHFJJ3DYS9KHfANAx2jMELoOzfjjjWrKLS8WehHhyCt
         /GO1qVVa0OteDsagtcZ02JO2TnOoTw9m2fa4B3oK5s+32+5mv3pBFbObrhSGvulP8Oi9
         xTFQ==
X-Gm-Message-State: APjAAAWeWwLvss3Y/UaZJdOMDuwdo5XR4SGlA+0h/u54PFnZeQNWAdqb
	5WPnoxRS9Hud0laFY6E2p7k5wQ==
X-Google-Smtp-Source: APXvYqyU+yRZgB24icv2aoJHZDnYxuWzzFwkyoaGCc8B4ml2tRj8SLH8vGpniPKDdKrMO82kg6jcTw==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr2848183wrw.113.1562060228839;
        Tue, 02 Jul 2019 02:37:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id j16sm2781671wrt.88.2019.07.02.02.37.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 02:37:08 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] hw/block/pflash_cfi01: Add the DeviceReset()
 handler
To: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc <qemu-ppc@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <633b88d8-88d0-3fa0-ff25-63935d8806fe@redhat.com>
Date: Tue, 2 Jul 2019 11:37:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_n3BpZuBPFS8y90XaOwzAo-tuKpO24_apz+9yzpxUxHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: GeIQP0hAop0X

On 7/2/19 11:23 AM, Peter Maydell wrote:
> On Tue, 2 Jul 2019 at 04:16, John Snow <jsnow@redhat.com> wrote:
>> Does reset always get called as part of realize, really?
>>
>> Or are we just trusting that the device is probably going to get reset
>> by the guest during bringup?
> 
> Reset is not called "as part of realize", but it is guaranteed
> to be called after realize and before we try to run the guest,
> as long as the device is in the qbus tree. Things are in the
> qbus tree if either:
>  * they're plugged into something already in the tree (eg
>    pci devices, scsi disks)
>  * they're a sysbus device (which is automatically plugged into
>    the 'main system bus' which is effectively the root of the
>    qbus tree)
> 
> In this case TYPE_PFLASH_CFI01 is a subclass of TYPE_SYS_BUS_DEVICE,
> so it will always be reset as part of system reset.
> 
> (the main things which don't get automatically reset are direct
> subclasses of TYPE_DEVICE, notably CPU objects.)

Thanks for the clarification!

I will update the commit description paraphrasing Peter:

  The TYPE_DEVICE interface provides a DeviceReset handler.
  This pflash device is a subclass of TYPE_SYS_BUS_DEVICE (which
  is a subclass of TYPE_DEVICE).
  SYS_BUS devices are automatically plugged into the 'main system
  bus', which is the root of the qbus tree.
  Devices in the qbus tree are guaranteed to have their reset()
  handler called after realize() and before we try to run the guest.

  To avoid incoherent states when the machine resets (see but report
  below), factor out the reset code into pflash_cfi01_system_reset,
  and register the method as a device reset callback.

John, Laszlo, is that OK with you?

Thanks,

Phil.
