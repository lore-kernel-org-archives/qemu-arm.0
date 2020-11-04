Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5610807lfa;
        Wed, 4 Nov 2020 03:27:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwszqO1y5M9pT6lI7TIctEDL5ve8PFp2L63SR6jv3kyJXpSApQvLDuOrbcc0a+gAANMX6wj
X-Received: by 2002:a02:a619:: with SMTP id c25mr12966273jam.67.1604489247339;
        Wed, 04 Nov 2020 03:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604489247; cv=none;
        d=google.com; s=arc-20160816;
        b=WA3I8uFkNyI0yPHIRtr7htmj24MocseRnoLtJpnwSp4YQGbBGmT/h+n9b/8iKEfN+4
         2O0dvCf6mF4ymDpAv0cKqs0F4hHVviHnVqVWBtfkVqHXqsDGf/WUQPH/dLh6H0Vg9eKT
         X5STWSImIoaZN+LcPB51G7jOC60Tm8hev85kmxI49fBH5MgXcVdToEAH0D+ppwM5/DSJ
         cGR1W3GMkwj8/EUa+2HAgBzPWUh2zCKFiFF7zLSfFEOdfNgeizAXzMTGtuXbEj6eCnRy
         5KitgyqLKycqo91xfABxPEKMoqew7AiiczS2jebjv4F100KMtMntHTm+5JHGSEIU+7ly
         BSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aw06nalMV1DPsFZMBKJv5oT3RYl/z3nb0C71ZaaIdFc=;
        b=AdkokNS/lcu0x7DC5k7wHxovmZ39x2XSQXmpN+pXQhnmkj+bc5G4gJ0qMz1ZXlNds7
         eoOjp+f+HHJoU3jP8CLNHnQJNtua8yI0WWuaI0V9FDZZsVECsEgNkHh/6/nmSfbR9s+F
         FbVvIrLwZUrZE7emMHH2V2GiJY84W3HPnazpyIvRVSMRopbyMkqg2dl430S+QeUPdFnx
         HScbPttqs3EhQaSPU2rGXObZ7L2Ij+iro4wcBfow/FXFDXhKfL6xduvr6NyEaKr3czZv
         VaK+P/teO9iojrALHxK6hl8ZWfyIw41oUbe7i7pMWfMtRZJLRYDPKW6Wke3uwRLFs7hr
         4I0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FzLJ8oGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si955292ioj.82.2020.11.04.03.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 03:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FzLJ8oGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaGwo-0000q7-Gx
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 06:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGwY-0000pH-Gv
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 06:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaGwV-0001iv-Oz
 for qemu-arm@nongnu.org; Wed, 04 Nov 2020 06:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604489226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aw06nalMV1DPsFZMBKJv5oT3RYl/z3nb0C71ZaaIdFc=;
 b=FzLJ8oGxsS8YFpdmooOkWMtCOUx+YHhs73/FtS+J5M1EVvZGraYZJji1g2CI0+PwbXMBl2
 Tuhd9PkZqY1FjOG5RczyyoqjcB4D9ctOGltuoN5Gx80Tl5XLZGLr3KetZCDru6Fgndjs7j
 +/Dq3G/Jac7o5hBcPYYL3xed3S6fCK0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-NA7LZoI4MvGn7OPpIm33Bw-1; Wed, 04 Nov 2020 06:27:04 -0500
X-MC-Unique: NA7LZoI4MvGn7OPpIm33Bw-1
Received: by mail-wr1-f71.google.com with SMTP id q15so9127024wrw.8
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2020 03:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aw06nalMV1DPsFZMBKJv5oT3RYl/z3nb0C71ZaaIdFc=;
 b=eDrJ4B0tUau9CquIkYCm3vyOsjBpjVuElb5BacA4YB7ApifC96wFK6ryVyhgymi1eE
 rO+1MVNcYT0zw4EZiU2Hsh0N7vhOO9g19yQArMkkrL7uV7IRPa+NwCT4tfKDs7OV4Q7E
 X2eAUa39Yh204thCKweaBT12vxnMTWTE/Px7KMgUHIAhU7jkxl1NMPFEAJWmHr9gad0S
 TtASxyzyy/gHPep0kIf2BIFK7b0uvZSTbwN79GXQ3dYvUjL6ScwEuJkGeeEFO7IwDYuy
 obtM/wJNszTwxAtsypa5E9rBZMVbPcSN58QkQYClLYpMVLmd/HG2ZJj/XH+FxckyfpoC
 rsXA==
X-Gm-Message-State: AOAM532+IRisRKzT/AKDKllBWY4KgPwe4i0qvu+CmGMvTjNdZOyxPUud
 6KX1AtnVT9SoKK5t8Ekdsui7HPXsSg4Qyx4qD+s8OqDAhGvmhJ4m235jwzVXWjpBKl6gEm0l1B9
 uXTaUlAHqWAzw
X-Received: by 2002:a1c:2583:: with SMTP id l125mr4015928wml.50.1604489223410; 
 Wed, 04 Nov 2020 03:27:03 -0800 (PST)
X-Received: by 2002:a1c:2583:: with SMTP id l125mr4015901wml.50.1604489223197; 
 Wed, 04 Nov 2020 03:27:03 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h12sm1997498wrw.70.2020.11.04.03.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 03:27:02 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 3/5] tests/acceptance: Skip incomplete
 virtio_version tests using '@skip'
To: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-4-philmd@redhat.com>
 <6fd67527-b887-54c5-8de6-4f54c8d66934@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68b4585b-2cfd-7b24-af63-674d004d8e51@redhat.com>
Date: Wed, 4 Nov 2020 12:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <6fd67527-b887-54c5-8de6-4f54c8d66934@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nrau4Kilv7JE

On 11/4/20 12:13 PM, Thomas Huth wrote:
> On 02/11/2020 15.42, Philippe Mathieu-Daudé wrote:
>> Prefer skipping incomplete tests with the "@skip" keyword,
>> rather than commenting the code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  tests/acceptance/virtio_version.py | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
>> index 33593c29dd0..187bbfa1f42 100644
>> --- a/tests/acceptance/virtio_version.py
>> +++ b/tests/acceptance/virtio_version.py
>> @@ -140,17 +140,20 @@ def check_all_variants(self, qemu_devtype, virtio_devid):
>>          self.assertIn('conventional-pci-device', trans_ifaces)
>>          self.assertNotIn('pci-express-device', trans_ifaces)
>>  
>> +    @skip("virtio-blk requires 'driver' parameter")
> 
> Shouldn't that be 'drive' instead of 'driver' ?

No clue, this is the previous commented line.

> 
>> +    def test_conventional_devs_driver(self):
>> +        self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
>> +
>> +    @skip("virtio-9p requires 'fsdev' parameter")
>> +    def test_conventional_devs_fsdev(self):
>> +        self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
>>  
>>      def test_conventional_devs(self):
>>          self.check_all_variants('virtio-net-pci', VIRTIO_NET)
>> -        # virtio-blk requires 'driver' parameter
>> -        #self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
>>          self.check_all_variants('virtio-serial-pci', VIRTIO_CONSOLE)
>>          self.check_all_variants('virtio-rng-pci', VIRTIO_RNG)
>>          self.check_all_variants('virtio-balloon-pci', VIRTIO_BALLOON)
>>          self.check_all_variants('virtio-scsi-pci', VIRTIO_SCSI)
>> -        # virtio-9p requires 'fsdev' parameter
>> -        #self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
> 
> I think I'd prefer to keep the stuff commented ... otherwise it will show up
> in the logs, giving the impression that you could run the tests somehow if
> you just provided the right environment, which is just not possible right now.

Well, we usually don't commit commented code like that.
If it is committed, it is important, then it has to show up in
the log. If you don't want it logged, why not remove it then?

