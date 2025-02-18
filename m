Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp712850njb;
        Tue, 18 Feb 2025 06:10:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGvSyajEMM7HoXw81dJYzP76Cx0SmRmL7/Wa95eb+AZUEpq5QG2H/KPjBNL3tp94zSId2mfuZ6HlKcEA==@linaro.org
X-Received: by 2002:a05:600c:348e:b0:439:8544:1903 with SMTP id 5b1f17b1804b1-43985441bcbmr71605245e9.20.1739887847938;
        Tue, 18 Feb 2025 06:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739887847; cv=none;
        d=google.com; s=arc-20240605;
        b=VUn/HbHDhDB0AR+E7wsdI1yGsndhqilIqeRbGJOVFk1PbRvqIvAGo7CDkIZ/M7Sk4R
         x4vHFTKuBrGGLDNPipz2SKAMymuMgZsNTEdPfXJBS4H82rMGKyTS6nHFLdLfjXD3Gqa9
         ARoZsJ2XpbuAJm3QwtLwh5tmrnUAHvMVbtGerfKWhqu5AEE9pzS8mAeHJc2aWEFnv39n
         4rm0x25jKVbanfwPXoOYblxwbJ5li/myC7yULWSxW75/Lp5OaMMb6fXUUfauSTiWZtuY
         M191CHFCHcTS8CqBEYHY/e3m3e+SM3nmhivx/Eew/oirxZctWmJgqL1Jqrz/j+j3Ho/a
         xoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=gnHaycBuKeySQOmT0PTWO7o/+j7+Xf7EAs3n92pGywQ=;
        fh=HjJtw8GLGqZev3UpLysPPyR8tZtQJqjl+DzZs9gasZo=;
        b=aU4v26z8fltUvK9whb6z9c2FKd4OB6Pj21ZSp0RH2knZ2mFDHQlxRowVqKosHtpsBE
         gP/Xz0RL+Vc0c+VPoQ3GfYCs+T9C+t35dZ9mI6i/0GuMQf5ahT+WY1zZ2owlxS6x0jW7
         bBxxpPuiKLRyS1gWHLDNCrR3KtvfmJC5CsvesB8IV+Np4Ya2Ge4TVPGOncyRIK7df+aR
         Nesg9nNeE8tzdTlWZB6CULHV7LhcMlzEGLVVS+Of6s4wGcRmxX2XxGb9U8x+oQufrirh
         6rWV9qyvbmQHuRP1cY2dJII1apYwL7ih4qz9afAcedeUpsD9gAnsZ01z9sy4oLKsXNFx
         /Myw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@citrix.com header.s=google header.b=OodieByi;
       spf=pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=andrew.cooper@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <andrew.cooper@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43961918de3sor57653785e9.11.2025.02.18.06.10.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 06:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@citrix.com header.s=google header.b=OodieByi;
       spf=pass (google.com: domain of andrew.cooper@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=andrew.cooper@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739887847; x=1740492647; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHaycBuKeySQOmT0PTWO7o/+j7+Xf7EAs3n92pGywQ=;
        b=OodieByiCh3ZJG22QYH/WN+jEqlmmlHYZ6tpEz2SRXMR+SMHWYLKLmzOaPgz8La6BL
         5Okct3KvgXwndVhLghz50ByIoT7DPurR2Dv4zDNTF7WT0ZkQq8sWNwM9pfU9lMFVUuzl
         KYbDJWqs36D0lJbx/gDcQ80awmony6+rkCPrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739887847; x=1740492647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnHaycBuKeySQOmT0PTWO7o/+j7+Xf7EAs3n92pGywQ=;
        b=jb/rETNUiDyC2JaqGd3pE6rR2UN3t1XQKivnwsiaUc6+W6/eAab0eamFNuzsXnIZAn
         C80V0T6RaWAj1BLEIuVTzhpCJ6P6nluksGskdHpNuES2pZ380CIiQm/yZbPiee3RVHEf
         Dp2JVD5y4Vnv8bU/pAfi4F6mrSEU8kxpz+mhppv/F343FDGMJkuVfzrUcsJYPECKTIC1
         R2eDjozw38JbjH05e0HAkwZ0UduVoZXtGovNihkPVQqNind9rVs3PX4WPyWrz+9rM/VW
         GUNT6D6ItNqWmh7vtNA8fMnsNoMhU0zbHf5fUYjvv8BgmTo84FvCDo4lLqO7f2nVJdlD
         fhTA==
X-Forwarded-Encrypted: i=1; AJvYcCWdDTMra9TyCjA86SPp2AiE5CqSl2ZTstNYl59RnBBRnHYrOB6TRmBzbKGpgwcaYKiR5xhRd12bmVUn2w==@linaro.org
X-Gm-Message-State: AOJu0Yw8v+MEvzqPd8fgwlbUYQapUeSSWbpR6gHpHOlThqf/ZD7CvTYC
	ZWL017Zh7TzAVTFYWK6x5X44Ck/+U4pnctTmuez8BzRWRlMHRzwOi39UpKL22AE=
X-Gm-Gg: ASbGncv/9cGohyWod86skiXk3DzgL5g3bnxMV0ZHNGTO6qPWxo0PpfvQ4AKaNBvs3mw
	qYJI0Jyg+OKRTav3oXDNY8MjNgiitVSog6B5F0M+56yKaMgU0tgppQ1lvD5Cdwt3Azbf4vDtv1e
	m0l7ejcCrh/0h8B9HnkjAryScdBjb6KVaVWgJApUXshojmlCNtwaL8W092QH8GNeG7cujvuw9fl
	rLW0fN+sBTiqSO5GLwR12kboFqrM6/9h6BT+AQv204jESwuEI9jw1wXWtFktfM2Mh7d4n67qOTE
	j9/4p9w7p9hHf+vgTXX8LvYzoaMU4yo7VKwSxO+5+JO5ypkNh9u6gvc=
X-Google-Smtp-Source: AGHT+IFAYPvX+3iueQGDgOxkfZX7j2AMQ4u7ZI4Ge/r85uKBHCQVQNtFmAxjfXXUQ4j9XaFQfPec3w==
X-Received: by 2002:a05:600c:1c86:b0:439:98ca:e39b with SMTP id 5b1f17b1804b1-43998cae5a5mr8300805e9.29.1739887847372;
        Tue, 18 Feb 2025 06:10:47 -0800 (PST)
Return-Path: <andrew.cooper@cloud.com>
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43993d297e9sm21046705e9.33.2025.02.18.06.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 06:10:47 -0800 (PST)
Message-ID: <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
Date: Tue, 18 Feb 2025 14:10:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E1ASUSlFrJBF

On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
> Hi,
>
> Adding Xen community.
>
> On 8/2/25 21:57, Richard Henderson wrote:
>> Require a 64-bit host binary to spawn a 64-bit guest.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 1af8aeb194..911955cfa8 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -304,9 +304,14 @@ else
>>   endif
>>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>   -if cpu in ['x86', 'x86_64']
>> +if cpu == 'x86'
>> +  xen_targets = ['i386-softmmu']
>> +elif cpu == 'x86_64'
>>     xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>> -elif cpu in ['arm', 'aarch64']
>> +elif cpu == 'arm'
>> +  # i386 emulator provides xenpv machine type for multiple
>> architectures
>> +  xen_targets = ['i386-softmmu']
>
> Is actually someone *testing* this config? I'm having hard time building
> it, so am very suspicious about how it runs, and start to wonder if I'm
> not just wasting my time (as could be our CI).

It was intentional.  I believe it was Stefano (CC'd) who introduced it.

Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
machine types, but I don't know QEMU well enough to be sure.

Another thing that (at least, was) tied to qemu-system-i386 was using
Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
a system emulator, just a paravirtual disk implementation.

This is, AIUI, what ARM wants with the xenpv machine.  If there's a
better way to do this, please do say.


Looking through Xen's CI, I can't see any of the ARM builds building
QEMU at all.  I think it's quite possible it's not tested any more.

~Andrew
