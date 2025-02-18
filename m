Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp763905njb;
        Tue, 18 Feb 2025 07:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQupsycLuXAFsIJS0228wf7Oat5YL/RKy+s0u4UA+u8EfMbSc2Ym2uBrpgJyOVCvJbwQTPiq1Du+kRyA==@linaro.org
X-Received: by 2002:a5d:6481:0:b0:38f:31fe:6d23 with SMTP id ffacd0b85a97d-38f33f2e91cmr12964843f8f.23.1739892357491;
        Tue, 18 Feb 2025 07:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739892357; cv=none;
        d=google.com; s=arc-20240605;
        b=FEHj58FNvnn7HoLBOrmQ8SGNWL8yuQsi1kb8tLRh7nGQ5FTJhUlR29dEYTdFZhy7UI
         JSTFIAnm5dT5MXqjkmklXdkRexgTYH0hezqcL5TvqVqg94xHpf+KpP+HPfEuxal6G39q
         pYXrldOA4neQ+RZnzvJhH3Msdwt1oJ7L3gN1zMnWnGy8Zsd/I8kxJnVz9yQn6rXaIjR4
         pbwF7uFibQDeZ0al8yMn18qhmmEcNKbP+X9cgaH0avcK6Zsau14BQqy63mkSNl62/25q
         wzBmQWTDihr16E+HTNH7SoDkuQPc6CulCydDlxywe4rS+oMLJBj9+yyPx7tBewrAyUqm
         z82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kO8ZjQjaFKbnEHTOpCzz+11SR4934oDmM1CC/TSqYe0=;
        fh=9XC3Zt4UqcLypf+xjVNv8nQQG4HiLz3lt62LdnPmem8=;
        b=Q7NoygE83aZa6kiGAWpvz70Xj0HuSMTgjx0Py4pNfG7Ybeo3Hn757fCp9m44rW/Rdl
         fXBg/JuOPUzpcF7IWVZhwwVM0bORGtpvNIvSzqvP2Fdu0dHZ90ren8WLaXHlCwNH0Fhw
         OXS7gpUE3LS0YR7kBCaIwRMiw50s28blIpVPz1tuPYoGuNpjG/1G+f5zbDU3iTPvH+cv
         FrdIFsX3DDIvG1Trxw3+bKNl0GE7E7I6Am9j/ym/6kitFU2K1m7ReVr6NUZHDY54onQR
         glNF2rptHakMqQorn4sY787T9VXvZlHc79V4Jdr8AI4Xm8rKkH50osnA+b53BEbStZ7m
         SX3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF7rIYyI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43991800019sor8950585e9.1.2025.02.18.07.25.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 07:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF7rIYyI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739892357; x=1740497157; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kO8ZjQjaFKbnEHTOpCzz+11SR4934oDmM1CC/TSqYe0=;
        b=sF7rIYyImco0rK3B1iDTEKxfuO/m/COFiE3hL9WHE8H0kRNlu9vjJ47YGCFHqPR+gB
         lIle2GPes79lNIrrv6ofxZ6AoTYuTn8BnqHRZMtyfNURmctmUy5hSftIEnVWNUbINtVE
         YLkWsthBT+uUYWuAxkcnWBhy8HFsBCK1a86xMyKtdVRbI7XYiYYyZ+B6IG8c/YW6f/1z
         YrMv44Jr06zjr8aPpSnKp84Q+matQPg5fe8JUtf+4/AZauLu4aKkVTKv4VRlC8hoRI2I
         BRkzbXfSl8MFsl6RMQxOER/pXNyB6AYgy93qfkirxRzvyI0jK7QyhkCQn7ljpJTQ9bpe
         QFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892357; x=1740497157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kO8ZjQjaFKbnEHTOpCzz+11SR4934oDmM1CC/TSqYe0=;
        b=SzEFDKKc5axhulkc/f/R0GgirAb7qPQ3PkNPQ8XTloxgMkASlyIiSRJ89GKiwIeskK
         j9chWLkB9l9pDV1NPsjelv2c4CEE2aiWZ2U0yfiWMjdjqSgtN8gpG6u7dtv0ZSpceKo0
         CirOPYAbn0adpb3vXU+a+SjOZGZz19VFWXAHh+mwykIzZU8vLom8xPk4qzL8mcGxTRm/
         akRvuY2H5rPN4iE5DUvcyISJyI+Xfj60Q3tOZVUpZvm+9PVDzi52tUXtpz9tBIW+OK/a
         9PLlzJObEeZkExInIrQ8+tjpRhO+XfcRhJMyRx/AspYW/VAKAxAWAbuDb8ZHKnR2RVp+
         XnVw==
X-Forwarded-Encrypted: i=1; AJvYcCV7SGYrwVeCs3EUdcdABAGQnybTB6+FxLUtdB8W4vuWWevd1A2vmY1Fac70dD7xekFfxtRfPxGYA8bTOg==@linaro.org
X-Gm-Message-State: AOJu0YyQN24d3+CzvBpTibgyQqaZdsD59XewcgwIA0QG4nLFN2u9oBZB
	LwFOlCCkWwk4XtUy2Z18tBD/t0zaClfQX6knbBNnqivw/34YFk8LGxB4QlfJblAZxA==
X-Gm-Gg: ASbGncvqkx1KrSzJLQK1aolcdEX/G2lYJcGTWRifdKHiFjJSn1h6jGyw2DG98eEFz/Y
	k355XGgfgAqXVUP9nRSL0+R34T6uJ3z0WgK07sHujNFGJ1fV92uk3JBFEoxwODPP+zm7HERFtB7
	luZGCITSZbtENUE9VqH4Z/GqfZNoVSMNjF95DUfijRJerOP4QT49E7rel9TXaTG+UBWnEzu7KrN
	dxnuYBmT5EuBI8Htzh6pW6mahU4jDfjzzuvOzpos/wTRTsCt0YkJUH8Q4xySRPrhjg/RuRRnZfz
	vREeE6XJUoYNONaJL/7+7uoMOGn2cuDbZqpgI/yxHGQAvLg+elw+3l5+xRI=
X-Google-Smtp-Source: AGHT+IEfQkZCEMZr8K3W+1iS/umucsBFRf5X6CifaRXiFtiDEf5G7/tN5hMhY5suxFVLoEfx6kpx6w==
X-Received: by 2002:a05:600c:1552:b0:439:90f5:3942 with SMTP id 5b1f17b1804b1-43990f53d17mr32639405e9.25.1739892356885;
        Tue, 18 Feb 2025 07:25:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43996aa820dsm16090465e9.5.2025.02.18.07.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:25:56 -0800 (PST)
Message-ID: <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Date: Tue, 18 Feb 2025 16:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>, qemu-devel@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
 <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dEbMOPdsO2Jb

+Vikram

On 18/2/25 15:10, Andrew Cooper wrote:
> On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Adding Xen community.
>>
>> On 8/2/25 21:57, Richard Henderson wrote:
>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    meson.build | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 1af8aeb194..911955cfa8 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -304,9 +304,14 @@ else
>>>    endif
>>>    accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>>    -if cpu in ['x86', 'x86_64']
>>> +if cpu == 'x86'
>>> +  xen_targets = ['i386-softmmu']
>>> +elif cpu == 'x86_64'
>>>      xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>> -elif cpu in ['arm', 'aarch64']
>>> +elif cpu == 'arm'
>>> +  # i386 emulator provides xenpv machine type for multiple
>>> architectures
>>> +  xen_targets = ['i386-softmmu']
>>
>> Is actually someone *testing* this config? I'm having hard time building
>> it, so am very suspicious about how it runs, and start to wonder if I'm
>> not just wasting my time (as could be our CI).
> 
> It was intentional.  I believe it was Stefano (CC'd) who introduced it.

In the introduction commit, "ARM targets" is used, so apparently both
32/64bit were picked deliberately:

---
commit aaea616d54317b8a0154adf52303a51da2d8d56f
Author: Vikram Garhwal <vikram.garhwal@amd.com>
Date:   Wed Jun 14 17:03:38 2023 -0700

     meson.build: enable xenpv machine build for ARM

     Add CONFIG_XEN for aarch64 device to support build for ARM targets.

     Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
     Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
     Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 481865bfa97..cfa98e9e25f 100644
--- a/meson.build
+++ b/meson.build
@@ -136,7 +136,7 @@ endif
  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
    # i386 emulator provides xenpv machine type for multiple architectures
    accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
    }
  endif
  if cpu in ['x86', 'x86_64']
---

> Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
> make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
> machine types, but I don't know QEMU well enough to be sure.
> 
> Another thing that (at least, was) tied to qemu-system-i386 was using
> Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
> a system emulator, just a paravirtual disk implementation.
> 
> This is, AIUI, what ARM wants with the xenpv machine.  If there's a
> better way to do this, please do say.

No, I concur.

> Looking through Xen's CI, I can't see any of the ARM builds building
> QEMU at all.  I think it's quite possible it's not tested any more.

We only cross-build, see our cross-arm64-xen-only job:
https://gitlab.com/qemu-project/qemu/-/jobs/9165958873

Note, if it is not clear, the problem I have is to test Xen on
32-bit ARM hosts; I don't have any problem with 64-bit ones.

Regards,

Phil.
