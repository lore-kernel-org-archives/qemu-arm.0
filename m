Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2264771njc;
        Mon, 4 Nov 2024 09:09:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZpnhQkw+B5i9rkG4RM4gDu0pgvTJRwWLGSdP1rgSOGLkpTZbpD1qduWAmVCILgnoAz3joWBBKc+snHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFyRJ3tZUxi0tkXLV+I9AnmadjiI7+wN3Tr7Huod11ODiyKwL1GWom1bnmFTGRY3EcbEZQd
X-Received: by 2002:a05:6214:598b:b0:6d3:526c:ba9e with SMTP id 6a1803df08f44-6d3526cbb65mr248748526d6.34.1730740199063;
        Mon, 04 Nov 2024 09:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730740199; cv=none;
        d=google.com; s=arc-20240605;
        b=dH7gdp6MJAptrIqVEM+bdclNksPH5sbcRtxNqZTX7MfGVs8LkkioBUDVbgjAX+AUPx
         QVF4iZ8qzHK2La6cCYIeWx/aJSBurVHTlwQCB8SToCDBzVFNawNTFYQNTjLRE0hhsE5m
         Re4r8wUWd4UkFSAqCAZiIXG4/bAbsXTLTGX3fStrxx4pYc9Hcp6Iku6dxM836W6Rzgm4
         oJ09D2VlvCk437HiXODOcRPdm0KBH4yOIqv3p7m1zxyJI8RFeFhNeJmekTgYlxpBwMk6
         PR1l5KPw115sVRpicYrUEx312XxWk8SegJXnbF6l7fVkLLDLvjeacYDgnMY0tuqPr5/g
         mpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=KFeisZyKjab9DBMxlw5RHMVKj7JFUpwBhmXREaCFMWw=;
        fh=mP4w8vPeUAfc9OjB8+LlTeEmNwP6n1u1zGcqjexhN7A=;
        b=cOImfP39pRAKP33Ix7jgug619PMraXaG+q+DrUc8pbI6+k28IvTgHknZODnczxEC2G
         l2QvBoclcVFF1xEfsDxm09/85BRtQlX4ryxgBqkSE+IzQVrGrgUNmL0QwfAko/1drXQ7
         6i2HVaGZ/fhWiVftBt0h7wUM3jmGQjr7Ux2qYNgtaUEOpF+b/tIXzxkTFP1H6AkmKxT3
         jCkgOrV+HJS9KQYcOx3S/0KIU/ijW8KKvGzGnuSGik3B5pXcQbMU/mQhUUx/8wK7x0fX
         YGdqiAvrrfzzd8qbNNbZSclpL/iJ3BF1/N2V8dOwUl8K/DNEcjaozQp80sCi5zKpSKcE
         h6nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fPp3d9X/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-855dad8e3a0si2235964241.91.2024.11.04.09.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fPp3d9X/";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730740198;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFeisZyKjab9DBMxlw5RHMVKj7JFUpwBhmXREaCFMWw=;
	b=fPp3d9X/OzmMTIdiXU5FD5eUpkONuv/hxMD9V/s/EgiGM3EDrUue0Yn2qMAyXQtSkjx3yr
	Fk1Cg5VmFvnAyjV8k2x/ErwUugZTHD1XmME6afmUK+nPj84DDfQZ6tErQ+d0uonvCz+BAX
	nq36FZVKU45pG4Xdpn+5m6R4Dzw7A08=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-gxgMPPuJMI2pA7TgrU0PQQ-1; Mon, 04 Nov 2024 12:09:57 -0500
X-MC-Unique: gxgMPPuJMI2pA7TgrU0PQQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-539ed93e08aso2744215e87.3
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 09:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740196; x=1731344996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFeisZyKjab9DBMxlw5RHMVKj7JFUpwBhmXREaCFMWw=;
        b=bHag7arMit7wbAhFZUL7iygNn7I/aYI9GCefJjQo9k8z9OLbD63Z17/watW1pO8r1I
         EGlfUnJ02JO+PPlJ8K4qB2vJAlkiv9NvZRfAHLmrDPaSsY6cGUKnAOSi2cv/8/+lz1zx
         Uhv27jbVDUnH3UwPxLYQOSBMw6o+OsUYhmMIu9WXVDIai228tVLZoM9LRFCgvLuPMpsN
         Ru4nYBqnYUBzkhmyDS+eEAHdWz0hnRI1pFlqTUkSVGB1x2Y2wCObdK4xM9C3DteZXqM/
         QGamXtOqIf3q5a/0/AaNc28Bi4AfsmaQlSoV5HPLVS1Nv8O/ug9H98cM0fXh1zBxpkYm
         GjCg==
X-Forwarded-Encrypted: i=1; AJvYcCWIU9Lx4mEb1J0Lczstr2Ack2AwHwkl6ONqMBy2EAQscdZ3XNT+/AOAEAXoT87NpvVttZFUK74MMwrVdQ==@linaro.org
X-Gm-Message-State: AOJu0Yz16FP7mvf2NGFFQSrEKbiVhRHSjL1GXIDpqKsdg9PW1nTw3ksb
	9iqnxMl//oMAFS/Rq+yzq011purEW9W8ldW/ee5xWr6rhQR7A5GUT679UgyCSFKQNnDP94gIakD
	44ycbcPa/XOHgcnzw1Eoi36AEm5HfG2BHZoVhDS8duS3nMGv68Fowyg==
X-Received: by 2002:a05:6512:1597:b0:536:54d6:e6d6 with SMTP id 2adb3069b0e04-53b7ecdece7mr10191498e87.17.1730740195805;
        Mon, 04 Nov 2024 09:09:55 -0800 (PST)
X-Received: by 2002:a05:6512:1597:b0:536:54d6:e6d6 with SMTP id 2adb3069b0e04-53b7ecdece7mr10191473e87.17.1730740195319;
        Mon, 04 Nov 2024 09:09:55 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9a53sm188454675e9.30.2024.11.04.09.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 09:09:54 -0800 (PST)
Message-ID: <6c05fc4e-ce14-4000-bb2a-63496bce9e98@redhat.com>
Date: Mon, 4 Nov 2024 18:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: Oliver Upton <oliver.upton@linux.dev>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_CU9eeQByANMRW@linux.dev>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zx_CU9eeQByANMRW@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R5E4lEa+2nZj

Hi Oliver,

On 10/28/24 17:56, Oliver Upton wrote:
> On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
>> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
>>>> On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>> On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
>>>>>> On 10/25/24 15:06, Daniel P. Berrangé wrote:
>>>>>>> Also, is this naming convention really the same one that users
>>>>>>> will see when they look at /proc/cpuinfo to view features ? It
>>>>>> No it is not. I do agree that the custom cpu model is very low level. It
>>>>>> is very well suited to test all series turning ID regs as writable but
>>>>>> this would require an extra layer that adapts /proc/cpuinfo feature
>>>>>> level to this regid/field abstraction.
>>>>>>
>>>>>> In /cpu/proc you will see somethink like:
>>>>>>  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
>>>>>> asimdhp cpuid asimdrdm lrcpc dcpop asimddp
>>>>> Right, IMHO, this is the terminology that QEMU must use in user
>>>>> facing APIs.
>>>> /proc/cpuinfo's naming is rather weird for historical
>>>> reasons (for instance there is only one FEAT_FP16 feature
>>>> but cpuinfo lists "fphp" and "asimdhp" separately).
>>> There's plenty of wierd history in x86 too. In this
>>> case I might suggest just picking one of the two
>>> common names, and ignoring the other.
>>>
>>> If we really wanted to, we could alias the 2nd name
>>> to the first, but its likely not worth the bother.
>> Or we could use the standard set of architectural
>> feature names, and not have the problem at all, and not
>> have to document what we mean by our nonstandard names.
> +1
>
> There's existing documentation [*] for the standard feature names, which
> provides:
>
>  - A short description of what the feature does
>  - Any dependencies a particular feature has (e.g.FEAT_VHE implies
>    FEAT_LSE, FEAT_Debugv8p1, and FEAT_AA64EL2)
>  - The register fields/values that are used to discover the feature.
>
> This seems like the most user-friendly option...
>
> [*]: https://developer.arm.com/documentation/109697/2024_09

Was just wondering if all the writable ID reg fields were associated to
an official FEAT_ listed in this feature list.
Let's take for instance CTR_EL0.DIC. Is it associated to a given
extension or is it just implementation defined?

Thanks

Eric
>
