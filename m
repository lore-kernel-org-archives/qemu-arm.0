Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp307237njb;
        Wed, 21 Aug 2024 08:15:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiMHcRE3BvkWpEzZt2IeDyczqolBFD9bOAv38sbtZ2p1MvRpkc9NAxo01iVBRT2TahrrhhOoH5nxCzZA==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ+qUiEOI2xwJ2zPWELPPJH0sCYyrCNLAmvE/OjXnpTLvUvVgEi9LFF2RUgjV5DjCKPjnv
X-Received: by 2002:a05:6358:3b96:b0:1b5:a139:ec6b with SMTP id e5c5f4694b2df-1b5a139efc3mr298835355d.11.1724253332976;
        Wed, 21 Aug 2024 08:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724253332; cv=none;
        d=google.com; s=arc-20160816;
        b=wpclnfxGIxqiViUlOwQYiaRLDje+L7t++TyumhtcFc7vJy75xe9+aK9SPd+Kr3lguh
         ZvCrKUx/ebwlH6DldOaowfoGAiHd50Pt3+r2hOT8kGZ5DNQFuo164mAMUjP7d13tOEC+
         JPJzAdlqvWzBwXoQPGzGFXwb4vP1nYZ0pgwFfuWXtBbHSi6fhCWTvxyHpbe1Shej5y4k
         u6jxD/18qc1FzM2zqJ8Ko+lQFhRGbFgMuAES9HlkOxYuWHOYbdEhAPiA9gGM57lWfmRz
         hCPIhqlCFsVQ4+6AHmBtN2K6QT4+1G8qoshARNirI9Rv3UfeTKf6au1fgHRIatdJzwEF
         K6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=RHNmWJnZ+OqIUYOaW6bqKHEHDgywKUvlEFFZxaajiMA=;
        fh=nT3oHG24tP1/blTLdt46Tlu/aVe3+A/WVY0mPe2mJMY=;
        b=My3/apF57UCJpwmK9vXh7qroKHHYZ6ql+kWJSlBU9E7qC8mzK79QY1IF6vTXShzjmp
         trs63PeiPIJa1HMueIfqMDBN7FFGKiDqNbE7SwiXiclSuOw553XacxuncLaDMhzjk1Kb
         86+oJCJjbeO/yHL5MOhRgwyaL/4Bfp7JgLhl+b2aNCZmo1h4fir8ffqmdicgeVLQrwU7
         ahytosyqGZIHPYXs42V2p8tnVSt9mNtEREvMLACm6ATcz4Zmb95xC1syLA3cZJ/ZDr7i
         yvgnt/ys0/f9wYq9JXnU2E4b4Zx+k7DOcTWod9yHLVdNnq9yNLKxn+aFdN+YUSEy20jd
         igFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jo1ybN84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498cd4c7e39si647414137.497.2024.08.21.08.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2024 08:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jo1ybN84;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sgn3U-0005fS-Nq; Wed, 21 Aug 2024 11:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sgn3S-0005cY-7H
 for qemu-arm@nongnu.org; Wed, 21 Aug 2024 11:15:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sgn3C-00038F-Nk
 for qemu-arm@nongnu.org; Wed, 21 Aug 2024 11:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724253305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RHNmWJnZ+OqIUYOaW6bqKHEHDgywKUvlEFFZxaajiMA=;
 b=Jo1ybN84fvGQf8B5MG09wEu9gcGMjT6MlcoTmBMjMfmjpiehreh1Sqf0dgADj2pvkXi6t5
 EZD1ueK2wfrROQjNXXf/vv7o/epDH91L/DZUI31RqCnPT8D1Z/cbEYZxXFT5Xkb9g2NRyR
 06iYeouVwn2Z3tMiPjndSFOzdWCiHiA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-MqbhOwFYNN6Jk45K7_VBgw-1; Wed, 21 Aug 2024 11:15:03 -0400
X-MC-Unique: MqbhOwFYNN6Jk45K7_VBgw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a86860c87a8so13436166b.3
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2024 08:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724253302; x=1724858102;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHNmWJnZ+OqIUYOaW6bqKHEHDgywKUvlEFFZxaajiMA=;
 b=qe3Yj59wtj9uwrJhdecW3fDdgI6gKOVekKSHt3oA0UvUQNhHwuZiuszF7D5KTmC4M5
 jmQtdd8yZyQLdIHxAOTRoZQjjY/PZnvBFJYuqV0A8H1TGlSh72mUoG+A2zveyGlnmRLn
 rGm/AUfD4bwC6/ejIMASbMFRfbTIo3dhrDyXl0sMR1diXDi7SQwRjDT1EjnRMEMt2Fkf
 gVbtcNCr2rn1+MbL4gh2XsByqUmyE75FPUyQT9Q6SxPYjDCH6yjXvcupJ59H4hTUXoNA
 SGlPAvz2PpUdOj9Ki7F7yDqRkAZw85ovEtAwTHk1J0EvQogizqAPhj8Y2us+DhZ/nQCb
 9iFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBLxquCcmqavY+nUpOrz67r1QWIcSSykdek6EgcG0M0DYn63gVAHpJsL/v9hKnFDMIuIiBmWKzg==@nongnu.org
X-Gm-Message-State: AOJu0Ywl2axgrtuKSt1zVuGv4lyyx/kCsz24CJDcgdv/9lFA+1jRz2iC
 TCjbOkCh7tGtEmFTKFFCJOJ7OdKU8xUkEy785VBS84dfnzz4S1khfdp69hK9oXggBRhU5Fv+pt0
 k1l6jwwi+FLLH52q4BPBIDPSUjjukNaLZfv4Ur22vJON20ZhNtg==
X-Received: by 2002:a17:907:724d:b0:a86:87dc:89b0 with SMTP id
 a640c23a62f3a-a8687dc8cd0mr25700566b.52.1724253302001; 
 Wed, 21 Aug 2024 08:15:02 -0700 (PDT)
X-Received: by 2002:a17:907:724d:b0:a86:87dc:89b0 with SMTP id
 a640c23a62f3a-a8687dc8cd0mr25698466b.52.1724253301476; 
 Wed, 21 Aug 2024 08:15:01 -0700 (PDT)
Received: from [10.33.192.191] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86829ccb6bsm40774666b.144.2024.08.21.08.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 08:15:01 -0700 (PDT)
Message-ID: <16c8e2b1-e9ae-44fe-ac97-adcce3a2900d@redhat.com>
Date: Wed, 21 Aug 2024 17:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Move LinuxTest related code into a
 separate file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org
References: <20240719095031.32814-1-thuth@redhat.com>
 <3e530db3-99e2-4878-a927-e6eebc0f92fe@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <3e530db3-99e2-4878-a927-e6eebc0f92fe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.138,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i641p+LqjEPl

On 21/08/2024 17.11, Philippe Mathieu-Daudé wrote:
> On 19/7/24 11:50, Thomas Huth wrote:
>> Only some few tests are using the LinuxTest class. Move the related
>> code into a separate file so that this does not pollute the main
>> namespace.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/avocado/avocado_qemu/__init__.py  | 239 +---------------------
>>   tests/avocado/avocado_qemu/linuxtest.py | 253 ++++++++++++++++++++++++
>>   tests/avocado/boot_linux.py             |   3 +-
>>   tests/avocado/hotplug_blk.py            |   2 +-
>>   tests/avocado/hotplug_cpu.py            |   2 +-
>>   tests/avocado/intel_iommu.py            |   2 +-
>>   tests/avocado/replay_linux.py           |   2 +-
>>   tests/avocado/smmu.py                   |   3 +-
>>   8 files changed, 262 insertions(+), 244 deletions(-)
>>   create mode 100644 tests/avocado/avocado_qemu/linuxtest.py
>>
>> diff --git a/tests/avocado/avocado_qemu/__init__.py 
>> b/tests/avocado/avocado_qemu/__init__.py
>> index 304c428168..a3da2a96bb 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -10,7 +10,6 @@
>>   import logging
>>   import os
>> -import shutil
>>   import subprocess
>>   import sys
>>   import tempfile
>> @@ -18,7 +17,7 @@
>>   import uuid
>>   import avocado
>> -from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
>> +from avocado.utils import ssh
> 
> Unfortunately we don't run the user mode tests on CI and missed
> 'process' is used by the QemuUserTest class.

Oh, sorry ... apparently I'm not running these locally on my machine either 
... could you send a patch to fix it, or want me to do it?

  Thomas

