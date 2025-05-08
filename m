Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp270849njb;
        Thu, 8 May 2025 01:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjMYjf4wcoTmg2acNwoyudrKF+g9ssIKlSzbeRq03All0U5mQoYSqBArn5u5f4AyY3DoP6K0kq2nm2Ew==@linaro.org
X-Received: by 2002:a17:902:e888:b0:22d:b305:e082 with SMTP id d9443c01a7336-22e5ee11ea3mr91804995ad.47.1746693461248;
        Thu, 08 May 2025 01:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746693461; cv=none;
        d=google.com; s=arc-20240605;
        b=MAhWHf/TkWajIDwWGkU/tOLz7lX9kfNSyv+2d7Z9ANb7fi0CQWKvWoyeReiTkxo0wL
         9WRVDaZ0iPDTplfawOZmdZy3fAdGP0onHzjZty5ApC76+qFvu2h351u1rQZ3AN5iiIIO
         MLwQNs0O6BXZRyf/lWEWwCSEzDkdnYoKvXc0i/HIBoe3Q2NbFJTlVBsG7/Cn7uhnt3Tb
         WTghK5mLjsQ6xDAELF7Zg59KL3yCQLo1VFmQDlwv/DhC6//WfIpJqJ20k9rsL2wOrNZq
         ql0fl12wfsXLuCI7bYLxz3fQxsyQo2MpcoIHn1DA0Z+YffQPo10qzpICpR7TX6rygVYO
         K7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KKBjg0KfK1xBsSW92KZcrdd0nJsWQnOMpHvUQnXJW4o=;
        fh=haPUriPCWvB+MZ/bMIGUJIIx0wnA9FnWOquIhRWD4vA=;
        b=jypgW9Yj58dUa/jyHgWCCoxTXP0ZeED5IZFvsIFDC9r//vWg7G1yUB5Y7zZ5875b/J
         8RekU05wey08BLNB7FBmjE2ZEI6BMKtL0QesQmduBu+9+xbnsOzTlJUokqqLDPPEQjv9
         KV5OA3G8GCYt/mbB6a+zMl9rZeYCW+ZRMzY7yLjls1gYjZ/VAGffncA8NtcTAwsOe2im
         AyPUlRiIm1Ovs8RTEWl6jRXyaO/NirL8uIDrCxSXgJpEI6b/Z+wB2+MaIoS2FrMc4vRs
         Ujg/XxpjSwz+YJhzg3Oy1GTVAjqrOnFOy+V2K9dXmddnWRN8ycbP31dOxf2AVua/jmd9
         L2sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=m3lDQ93o;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a494sor53472845ad.1.2025.05.08.01.37.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 01:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=m3lDQ93o;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746693461; x=1747298261; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKBjg0KfK1xBsSW92KZcrdd0nJsWQnOMpHvUQnXJW4o=;
        b=m3lDQ93oVmm6znF1ec94imsfjvvkzEYnYqiqeyEzQM7eZq7xr6/JFRiCN/7htp783m
         NcA3KF5imLVubvICK0hWqOjWQRvR/E1r9vr20i4m/bhX14HtAD7crKAYGJ3BQ9lDL95+
         IpzJ0uqbtdLD/udDxFbpg1z1DUH7nw95PUGioIFM1dIdEZH8PyRBPfQGyUG//2Q/n6tr
         0HRXJFuF9WIEgWb0lERVVruyGtk+hqWbaGzKr8v/820j68hzho3mMBnSPfehaPqUzX33
         XkJ8mvbXKBzbxy6yc5ujBo13lbJEvEzv0lXYQ3jccPdq+Tbj+QY4TLE8dWL4Fs2ugEqv
         O7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693461; x=1747298261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKBjg0KfK1xBsSW92KZcrdd0nJsWQnOMpHvUQnXJW4o=;
        b=rSKnC8glCqOAdFfGzqveJXNV64H1tRNfbGU9xJ8lQughEQL3VtpZXLwElNXQuBOVs7
         FU21kohnvo02ShnzDWjG9U6s9sP8K8cJrqfGgT8+ryMAIcxVQFp4f96mTVNSg4jwg+vq
         sCYEtaqccB9rDlVFi3rKgq5e/fkeDehRAGLdd9m3oAncGZCCC/WBfzjJy4AQ2SNLd2AK
         UT5KnMzSkUwxsRCPne3PnhLlAvZvbOThUNWpBEnv5xVaQj9m6lLJvjtxDuW93NANJHhc
         UFZlzf0Uv+/WTcgEjiDa13u5S36hTO+qo/fb0PDm5d6DIsCQ+awJlUJ7HgwReczyzU1Q
         3LfA==
X-Forwarded-Encrypted: i=1; AJvYcCVca9l7cSKbLOr5aOTGSonTn9ok0UlBGu1bdKo5n3jW5EaQHl+tj2saMAI36XgcU/Uz8Y+wSSxSGQFZzg==@linaro.org
X-Gm-Message-State: AOJu0Yyc+vk3XXgPH15Qbf63/vhi1XbWxgU4GKPoNI7+TTqwiqmTe0ON
	/SGLUrCJg0tkbw4e1zGWGhTLhAu7ReC1kuydKaszZ9zsGvFgzIGyAFf5QS+Fqow=
X-Gm-Gg: ASbGncvTofpi7fPKNCv0iFAItmaVzKw4lAqqiXsTtobXUG4TCB93k41AKMrjOfM9lcI
	Pzw9Xj3XiZlTZhhnVMwRo0ZND0PtdeGnNI3RRfJHRNlqndVkH57QTxalveWKshVVc85Jp7hLBaT
	veCm3BM8tVCUrSV2Z+SeUxONlSiA6qPBg2t1C8szp/C/aNBdA0zY5UiZFTlJGjXeEm/wNNB+fbq
	K6YaIlV24fvMd9RuikU8C2gDHRtWVD3xWrsqdRTWj8OYWhKyYhIvKe1vqW927OudsY5X/GGtkpv
	4wqrGMrrPWjVZ5TA2HCe6aKIza/E465QFaSLEGYyMREXWyIOWso=
X-Google-Smtp-Source: AGHT+IHsDHwVelASjO1XWFYiZGLgmttX06RCgxVCP8Uji4ecUpUhtjUb41ybwOPYhOHZKBaddi2UyA==
X-Received: by 2002:a17:903:46d0:b0:22f:a1b4:b2b6 with SMTP id d9443c01a7336-22fa1b4b588mr27141855ad.52.1746693460783;
        Thu, 08 May 2025 01:37:40 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150ebfa4sm107737995ad.13.2025.05.08.01.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:37:40 -0700 (PDT)
Message-ID: <6af5a9ec-a197-49d8-880f-cdd88621e180@daynix.com>
Date: Thu, 8 May 2025 17:37:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Jonah Palmer <jonah.palmer@oracle.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Anton Johansson <anjo@rev.ng>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250502132441.64723-1-philmd@linaro.org>
 <aBnCk2WE_SNkRgSH@redhat.com> <20250506040903-mutt-send-email-mst@kernel.org>
 <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vDl0ZjOgWR9U

On 2025/05/06 17:55, Philippe Mathieu-Daudé wrote:
> On 6/5/25 10:12, Michael S. Tsirkin wrote:
>> On Tue, May 06, 2025 at 09:04:50AM +0100, Daniel P. Berrangé wrote:
>>> On Fri, May 02, 2025 at 03:24:41PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Legacy VirtIO devices don't have their endianness clearly defined.
>>>> QEMU infers it taking the endianness of the (target) binary, or,
>>>> when a target support switching endianness at runtime, taking the
>>>> endianness of the vCPU accessing the device.
>>>>
>>>> Devices modelling shouldn't really change depending on a property
>>>> of a CPU accessing it.
>>>>
>>>> For heterogeneous systems, it is simpler to break such dev <-> cpu
> 
>          ^^^^^^^^^^^^^
> 
>>>> dependency, only allowing generic device models, with no knowledge
>>>> of CPU (or DMA controller) accesses.
>>>>
>>>> Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
>>>> current default (enabled).
>>>> New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
>>>> the VirtIO version 1 spec.
>>>
>>> IMHO that isn't acceptable. In order to be able to provide an
>>> upgrade path from the old binaries, we need the need the new
>>> binaries to be able to serve the same use cases & disabling
>>> virtio 0.9 support prevents that.
> 
> This isn't for the single binary effort, there we are taking a
> lot of care to not introduce any change.
> 
> This is for after it; once we have a single binary (one architecture
> run by an instance) we can start testing heterogeneous emulation
> (different architectures in the same instance).
> 
>>> I don't see a compelling
>>> technical reason why we can't support virtio 0.9 from this
>>> endian point.
> 
> VirtIO 0.9 needs knowledge of the vCPU architecture to get its
> endianness. So we need to somehow propagate that at creation
> time, guarantying which vCPU (or set of vCPUs) will access a
> virtio device.
> 
> The use case I'd like to figure out is how should we model
> plugging a virtio 0.9 device in into a fully emulated
> ZynqMP machine, which has little-endian ARM cores and big
> endian MicroBlaze cores.
> 
> Alex said this is unlikely to happen, and better is to
> ignore this case by not allowing virtio pre-1.0 devices in
> our future heterogeneous emulator.
> 
> In this same thread Pierrick pointed me to the reference in
> the spec: '2.4.3 Legacy Interfaces: A Note on Virtqueue Endianness',
> "It is assumed that the host is already aware of the guest endian."
> 
> I suppose this means a pre-1.0 virtio device expect to be used by
> a single guest OS, but it is not clear the guest OS as fixed
> endianness, because the code path checks vCPU endianness at
> runtime, so passing guest endianness as a property to pre-1.0
> devices isn't really an option.
> 
> Anyway I think 1/ I posted this too early, "speculating" as Pierrick
> noticed, and confuse the community w.r.t. "single binary" and
> 2/ I don' t understand legacy virtio and its endianness handling
> enough to figure a clever idea to keep using it heterogeneous
> setup, so I'll let this task to someone more familiar with that tech.
It may not be too early as QEMU may already support heterogeneous 
endianness.

An Arm CPU have a register to switch the endianness, which depends on 
the current Exception level, and QEMU already implements it at least 
enough to switch the endianness for virtio if I read the code correctly.

This means QEMU should already be able to handle cases where the 
endianness changes depending on:
- timing (due to writes to SCLR or switches among Exception levels) or
- vCPUs (as each vCPU has its own register instance).

If virtio has a problem with heterogeneous endianness, I'm afraid that 
it matters even now for Arm emulation.

In my understanding, the virtio code is written carefully enough to 
avoid breaking migration and I found no other obvious problems like 
crashes and memory leaks with heterogeneous endianness, so I can 
conclude that the virtio code requires no change.

However, allowing to have legacy devices with heterogeneous endianness 
may still lead to mismatches between QEMU and user's expectations as the 
spec is not clear. Deprecating the combination of legacy devices with 
CPUs that can switch endianness (and other heterogeneous endianness 
scenarios in the future) may be a good idea to avoid that.

Regards,
Akihiko Odaki
