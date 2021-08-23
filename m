Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1987187lfg;
        Mon, 23 Aug 2021 08:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxfai6UkKeOVM+WBDLQx050U4vJP2tPpwkMW0ix9kB7/MEPlyUYaEKNqvLXXOpta4em2FC
X-Received: by 2002:a05:6402:546:: with SMTP id i6mr38731568edx.80.1629733868707;
        Mon, 23 Aug 2021 08:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629733868; cv=none;
        d=google.com; s=arc-20160816;
        b=hd7cEb2jXLDCL0zUuow5VoeYuf29ncmBYhXSn5kO4yfos/t5tbGKogKoNkZSkGvwn3
         +ES4xXWjpcl73Wh8Dt8mEP8I+o0ST55/FUSLNwlE0mdzp6e6iImmMfAHvbVsKaF6jQdv
         sXxmOJkW8tKSK1oCPRTZY+ds4kfQZW7SLMlxcUKqn1o3KNgNZDE/BDo/J9w+/K1VNixw
         rLkQr9z2f5naaiUH5JeZUACmZL1eA2n4DK5Uedm3327uLXw4UsNaTJZmONNk35e6sXlv
         vg3GEQBxlH97Ge8hi0jVI9fIG2QMQ/8M+lsIS5OjY3nGT9vgPIdBuSv2ecqX1KzHryVm
         RgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9k1+eWH0kEJTfXrHrl8p0s7qDWtHOQN5iFONKEi66tE=;
        b=plFZG7R6f1sCGDFWuIYY54cqEdLkmqiAowG6M6JGvm/BTsVj5N3nUnG1zZp1bEYBbA
         xTZScEMqlB/TAl7FvVr9CAcFB1R+k8bypRrEfvSj+DReNxpj/vC87B8F87qj6CIpYEtN
         s5fqG39t6/FxeEdr9nkQQsX29DvjmZG83Akwou9rq3DtTzgY4SpKncYbVrx1QpEsKacI
         q24BD0my+lFW2PjKBCen9tD3uUYyqCOH1RU9hmxUKlKVMb6psMIKGXQg+5/DIYGbdKXe
         mIUzTkqER0orXIKe1kps6vyrlIE3t9IGtSAderPA8QxnJLJqY5m2HFDA+ntmsR5ATvr0
         WNPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XnRgtv75;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id zm17si8157561ejb.712.2021.08.23.08.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XnRgtv75;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629733867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9k1+eWH0kEJTfXrHrl8p0s7qDWtHOQN5iFONKEi66tE=;
	b=XnRgtv75Mu4pQpDxJFyFufs6h1UJLVyqBa5CWZ0TpKDHdvUWXZOV5DwhV+EpmHZ8p4+5ok
	bMgeuwYDlRsQsRK3HLJI5NYoGB5lamIsIncHTLhUuYz5/G2WhqFSHFVCp7xM0pkjlfFAFy
	aIBYcUysGbavLlPH9ApbRcb8ntlE3wo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-WA-eaUyZOIWXHU0q-Kkseg-1; Mon, 23 Aug 2021 11:51:05 -0400
X-MC-Unique: WA-eaUyZOIWXHU0q-Kkseg-1
Received: by mail-wm1-f72.google.com with SMTP id r4-20020a1c4404000000b002e728beb9fbso4440269wma.9
        for <alex.bennee@linaro.org>; Mon, 23 Aug 2021 08:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9k1+eWH0kEJTfXrHrl8p0s7qDWtHOQN5iFONKEi66tE=;
        b=sul86W6pv8gts1SWN8sKWrW9hDi+FkvrZWXTR1PdyGvTamjoFxlwixEUqwocDNNDJo
         Pz162miSI/li4RTFhki+tG+ZHp24ndHBpHKt5ljzvMjEJ1hrNXhBMrAK1jrvtOqLhMq5
         C1i5eHX+Wod5xckoOYItC9O36Lvnwz/X7HCSSnxgXAcZuheRzIZ4KVMev+sDk8C25y+1
         rTlzX2P432icVT4bv9Y/bFhn13B8/q/KF7LCK4SaCCbFY1uS2LWIqrT8CNePMoE5+Uqt
         wrOv/E5z78ruGZGdrCqp7FKdHfed6b12ZhR6f84lqOWWYBqmLWzXjwEqYS2IcgT45G9F
         3v/A==
X-Gm-Message-State: AOAM5308AvFFzcK+mWkCKIpS4udW556+Si7LIZdOhidtCmxdqkiElBso
	+MM4CcisXyKOVP0SYl8bTyajMRUQrQ6lKMhYeFt/DTmc4jnVUg+1R0OBGWf4pkGwtxBkA/94J7a
	q2x/QEnQt6wbdXB4a
X-Received: by 2002:a05:600c:a41:: with SMTP id c1mr16698420wmq.109.1629733864877;
        Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
X-Received: by 2002:a05:600c:a41:: with SMTP id c1mr16698398wmq.109.1629733864705;
        Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id c25sm13628323wmr.15.2021.08.23.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:51:04 -0700 (PDT)
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Changbin Du <changbin.du@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <565f9ab6-7571-3c26-5e57-8b2a49a9e7b1@redhat.com>
Date: Mon, 23 Aug 2021 17:51:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: y7t1xolPJNlq

On 8/23/21 5:30 PM, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 16:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 8/23/21 4:20 PM, Changbin Du wrote:
>>> To resolve the issue to debug switchable targets, this serias introduces
>>> basic infrastructure for gdbstub and enable support for ARM and RISC-V
>>> targets.
>>>
>>> For example, now there is no problem to debug an big-enadian aarch64 target
>>> on x86 host.
>>>
>>>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...
>>
>> I don't understand why you need all that.
>> Maybe you aren't using gdb-multiarch?
>>
>> You can install it or start it via QEMU Debian Docker image:
>>
>> $ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
>>   registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
>>   gdb-multiarch -q \
>>     --ex 'set architecture aarch64' \
>>     --ex 'set endian big'
>> The target architecture is assumed to be aarch64
>> The target is assumed to be big endian
>> (gdb) target remote 172.17.0.1:1234
> 
> I don't think that will help, because an AArch64 CPU (at least
> in the boards we model) will always start up in little-endian,
> and our gdbstub will always transfer register data etc in
> little-endian order, because gdb cannot cope with a target that
> isn't always the same endianness. Fixing this requires gdb
> changes to be more capable of handling dynamic target changes
> (this would also help with eg debugging across 32<->64 bit switches);
> as I understand it that gdb work would be pretty significant,
> and at least for aarch64 pretty much nobody cares about
> big-endian, so nobody's got round to doing it yet.
> 
> Our target/ppc/gdbstub.c code takes a different tack: it
> always sends register data in the same order the CPU is
> currently in, which has a different set of cases when it
> goes wrong.

I remember having tested the 'setend be' instruction (from
https://github.com/pcrost/arm-be-test) 3 years ago using
it. Connected as little endian, set breakpoint, on BP hit
disconnect, set big-endian, reconnect, keep single-stepping
(in the same gdb session).

I doubt anything changed since.
