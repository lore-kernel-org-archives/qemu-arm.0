Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp592990wrs;
        Fri, 16 Aug 2019 02:58:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwM2qfAwRaW1Qh8uLSwIH7LWbdTA+T+NPMnhypMOQc5GtQ+vYjsNbmZDfpAfXyEDLsAhMjJ
X-Received: by 2002:a37:9c94:: with SMTP id f142mr7061255qke.427.1565949505228;
        Fri, 16 Aug 2019 02:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565949505; cv=none;
        d=google.com; s=arc-20160816;
        b=miEq0cSbaMIX/z4IXNGmssds+wKFUL2e13jtvGE0pH5Js+PpmBvzoAAv5wOjZH03E2
         p4tx8c7Etv6qmfvSA93E7IFQnc3BinX/cJKDLhMm8opcbyrRVtDgEeXJx/za8YxZMsfi
         syQ7pWmMcyW0SYGqToIYS/HKV/VIYvH7TqpJQpBcVZZwqzLNgr+PPIL/PF4/Chc56IGQ
         MVQbbCo803tRSCQRUOK33YPQViRGaVkT/XQe4+WEiJNrN4nlpRlaVmCICaOZMo+jCzDa
         xhkWcAJ4mFLL+miWXl/uMGZokhV4QRykUjKfKPNNXD/QZhHgOBG+G5h6dVL76o+t9b3c
         ogoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Foo7mqc4L4owvltcL+chmVAdJxdrnYoZDMnBcLnmc5c=;
        b=QO5LhZJtUSgnEtcRMkJQGtX3NMpPuG5ysVdXSUYu5A0F8Ht5shW2vrs8t+d3Pq0G8X
         8JqyAN1hy0HuOWYCuuixqg67vUWmuZmTMOKvRlbPnAyOfPUNu6skSDPbxaQZnTbFITpy
         h4euf8ZsrHqA0X0obIbBQ/w2BZ/Yu3QWFYxThtDIH/uj+/S0mmB8QA+/LZn9LMnb/k1+
         dh9kfLChlRtW+zWGERDk9B0rkig4LhYT3FHcCXQgrF+A7u444PZPW7Yw20/P6l0waDH8
         wT9wbTuKVKs7DRZLtuMUpdfmWNkoQM5JIKR2OHUZ87q56gceRhW4JQhLBcHMJZf2R2h1
         M5nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r34si3081567qtj.143.2019.08.16.02.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 02:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyZ04-0002Nu-BJ
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 05:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyYzs-0002HN-2e
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 05:58:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyYzq-0006TV-WB
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 05:58:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46243)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyYzq-0006SJ-Ph
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 05:58:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so964538wru.13
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 02:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Foo7mqc4L4owvltcL+chmVAdJxdrnYoZDMnBcLnmc5c=;
 b=j9/ZU6RcDQiwUpSSm3o/9UYHNs0eO2zIlsCgBjFqMqr6Z/yXoBkdsUkFUl0IBJhUrm
 ukX36doFXEDg/OQT/Sq1QbAZIeYuechXsYV0IhvlLwWhrZOlsx0ROhkFPBQj0J+/ayqn
 TjWfbMYQj6hLToaXslrlRMiukhrO4yW+FORdNF7ccpYcSqNjkDCGJ/jlMlNWb/b7WQkp
 56+j0tBt1lMX9rPxtT+EpyM5XfgrJqgE7cgU2HuYqKpAqPr9MKg3ALIYOM812gIOh8Qt
 ZKxobhF+8m7KQQG+zLmElQqtUvr77FA4CHqcasaXtfm45KE6p80P47uDU7bJN+aTZk26
 VMzA==
X-Gm-Message-State: APjAAAXNLAJ8jBPEvJsEnc7vm1cZGyX0obh06RH5FiiNmlz5JaDKAUlR
 W8xLcDvE+jTopq51+tlWH4Vv9A==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr9141289wrc.85.1565949489545;
 Fri, 16 Aug 2019 02:58:09 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id z1sm5419150wrp.51.2019.08.16.02.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 02:58:08 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Date: Fri, 16 Aug 2019 11:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, lersek@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7kR7ZzDE0sMx

Hi Tony,

On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
> 
> v7:
[...]
> - Re-declared many native endian devices as little or big endian. This is why
>   v7 has +16 patches.

Why are you doing that? What is the rational?

Anyhow if this not required by your series, you should split it out of
it, and send it on your principal changes are merged.
I'm worried because this these new patches involve many subsystems (thus
maintainers) and reviewing them will now take a fair amount of time.

> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
>
> If the set of targets are all little or all big endian, re-declare
> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> respectively.

If only little endian targets use a device, that doesn't mean the device
is designed in little endian...

Then if a big endian target plan to use this device, it will require
more work and you might have introduced regressions...

I'm not sure this is a safe move.

> This *naive* deduction may result in genuinely native endian devices
> being incorrectly declared as little or big endian, but should not
> introduce regressions for current targets.

Regards,

Phil.
