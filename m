Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp727621wrw;
        Tue, 6 Nov 2018 02:55:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5eaztqFdnTSDUm++PA6B02XUugW2o2zt0Q/gXPFDNwlawZ5KP229EL4sjWfW+wz1m1ICOFc
X-Received: by 2002:a37:aa91:: with SMTP id t139mr23733368qke.139.1541501714606;
        Tue, 06 Nov 2018 02:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541501714; cv=none;
        d=google.com; s=arc-20160816;
        b=c2ydO2yDoSg58vVKImx1Z3B8Xqatf4SltCpodl68kKrlm4xBeQWE8E34PnMVOuLlhf
         IeQIECgYY8bGyKnTkiW20rHG9wG/BmABSkWGmHCKygEj8U2DCHaHGKanqOhQov5yQMDy
         KkA5YP5epB1d7yD+D38/Wv7PbzFvgjq93C25XFbPEcL9mdXgw5cRPZ5HLH89EMk0cnEf
         ZI7PtT0m5l6XrPJjRGvL7OFBJluKrtVRvTHOPU9ieSzMHrGH3TR3jvu8iH+vaMDk7Xth
         EYpTmyQo/9F7MPQLJ4oPCQvmTooPh9zfzTbbf2H3xB6rtViZlufK3RxcCeJmx861tqrN
         XAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=2NhmMgRT5Iv7uRwpmMMDURy+n6tMzEYT0LDfo+Eamdg=;
        b=PFgUHdvdQPsgByPNQo79sORs6mRf0rZo6lFR+Z2Jn+dr2tpoyEKi3In7ISvcQMJC9R
         ATyf8w9zLQz5ZOgHeC6Xi2b9rR1pBle6yukJkakf/c0+ADYwMQpnDn3PmIDcUIQT0qiW
         JXB+vuWtFWqUpNDcRtVgiTTsaq+OVQ48BgmzBUkS4VmsESo1ZtnrzyUVrAkn/lKPyDlP
         qAqtOxtgoWnj3MGQ2oUzmWor0Fps8EY++qwjvr2x6V82xY8iTf/pVIETFG5YSQLLYLgT
         xOiQnwbaZrBEkITQbpDRf9OrjzDHbCBr835pYqDxhUBLaCjOWZFHfzRbGA3MgXtiVgyU
         ITww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l23si4728165qkg.227.2018.11.06.02.55.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 02:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A5B62D7F5;
	Tue,  6 Nov 2018 10:55:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-109.ams2.redhat.com [10.36.117.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF0519751;
	Tue,  6 Nov 2018 10:55:07 +0000 (UTC)
Subject: Re: How to use the 'canon-a1100' machine?
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fam Zheng <famz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1d1c0473-cd71-c7de-9d56-072596501e4c@redhat.com>
 <CAFEAcA-6hMmfQuiA-23fgzYyp7bz0yb+t-rhD0wt_h0UMH=CgQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
 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
Organization: Red Hat
Message-ID: <d21e2c1f-ee7e-0dcc-fb4b-29b78c28b45f@redhat.com>
Date: Tue, 6 Nov 2018 11:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6hMmfQuiA-23fgzYyp7bz0yb+t-rhD0wt_h0UMH=CgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 06 Nov 2018 10:55:13 +0000 (UTC)
X-TUID: r3e5HfusrxB/

On 2018-11-06 11:32, Peter Maydell wrote:
> On 6 November 2018 at 09:40, Thomas Huth <thuth@redhat.com> wrote:
>>
>>  Hi,
>>
>> does anybody know whether the "canon-a1100" machine in QEMU is still
>> usable, or rather how it can be used at all?
>>
>> According to
>> http://lists.infradead.org/pipermail/barebox/2014-July/020327.html there
>> should be support for "-serial stdio" and on
>> https://lists.gnu.org/archive/html/qemu-devel/2013-10/msg02969.html
>> there is a link to a firmware image ... but when I try to use it, there
>> is simply no output on stdio...
>>
>> Is there a way this machine can still be tested in QEMU?
> 
> I have an image in my test set:
> $ ~/test-images/digic/runme ./build/x86/arm-softmmu/qemu-system-arm
> Switch to console [cs0]
> 
> 
> barebox 2013.12.0-00160-g2e82c4a #507 Thu Dec 12 12:42:43 MSK 2013
> 
> 
> Board: Canon PowerShot A1100 IS
> digic-gpio c0220000.gpio: probed gpiochip-1 with base 0
> cfi_flash f8000000.flash: found cfi flash at f8000000, size 4194304
> malloc space: 0x00100000 -> 0x002fffff (size 2 MiB)
> Open /dev/env0 No such file or directory
> no valid environment found on /dev/env0. Using default environment
> running /env/bin/init...
> canon> /
> 
> Command line is:
> 
> ${QEMU} \
>   -M canon-a1100 -serial stdio -display none \
>   --machine firmware="$TESTDIR"/canon-a1100-rom1.bin
> 
> filename suggests that's the same firmware image you link to?
> 
> $ md5sum ~/test-images/digic/canon-a1100-rom1.bin
> 66e76691cbd8b140549c878ae3849147

Thanks for the hint! My image had a different md5sum, so I think
it's just a bad version that I've downloaded. I've finally also
managed to compile barebox on my own with these steps:

tar -xaf barebox-....tar.bz2
cd barebox-...
cp ./arch/arm/configs/canon-a1100_defconfig .config
make CROSS_PREFIX=arm-linux-gnu- ARCH=arm CC=arm-linux-gnu-gcc \
 LD=arm-linux-gnu-ld OBJCOPY=arm-linux-gnu-objcopy olddefconfig
make CROSS_PREFIX=arm-linux-gnu- ARCH=arm CC=arm-linux-gnu-gcc \
 LD=arm-linux-gnu-ld OBJCOPY=arm-linux-gnu-objcopy -j8

And that version indeed prints some output via its emulated serial
console to stdio :-)

CC-ing some "tests/docker" people in case somebody wants to turn
that into a docker-based test, too...

 Thomas
