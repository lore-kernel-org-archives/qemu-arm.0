Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2974272njj;
        Tue, 6 May 2025 01:55:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvRcKTcXczuoSgB/v7Y4ndvwWLckA6OytKsxjgJTjh1jVb1LZtCoH/mBcvMq3BQEPcTgBFr6xwNuSSuw==@linaro.org
X-Received: by 2002:a17:907:6d24:b0:ace:6c29:a98c with SMTP id a640c23a62f3a-ad17b83545amr1454534166b.37.1746521739622;
        Tue, 06 May 2025 01:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521739; cv=none;
        d=google.com; s=arc-20240605;
        b=Mek/ZU2knxeAiaYxM63pNTFYyl4VvURIn9+F0iljThuWqykqq4YsdhcjEDBwVRc6G5
         ZusSGjPL+PpOCMVJSlAZyl+6b0wO1n63nXnKWCIAAnfm2y/OIxhfjS7dGUvL3m88MC2e
         LhbTB76PxVRyWV4ukjGBGFyJJjHIXjXepuUE20lB/yaORSYORoGmoKB44DC1GfLMmOmG
         9oOL7VEntOIVxgrrCSvojd2KeKhXh5Hr+zyhnNp2dyJ/dJuSUPoA0+5WfGmaFyI0l958
         nyaq2sL8iDWVkJSSqP0ND2nRQoOBtv0Z7wJUVxTok3+3GNmZ2S8JWKdj3IeatYNRsWtf
         m8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r7WeRI1zx+FoyOA/YldoDkOxqvxpYNFgz6XaGrQKjpI=;
        fh=BD74Y+ftVhxTveEkOTw2XYnciDR+6gKs7UYfO+aFYh8=;
        b=PCZ6dza7G0ROypKAzgQNyn0JZRnZyRef4oKS2oSFGBMiqGNTBk8y49ER2GI8s7GgQH
         jvtlvd5hQenSVIx3EpQLN1wP6AHkova9TN8SsCYlSg87Xbuh3wCE5N+DCfDnEP+LoOJ3
         gLZo3c/rjqLREqwBFgjI7oocIO3e9g0GiBZSQcK7pNo/Ll3iyjbKxDiAaTWrZTUBRBfd
         D4GlEuG1giqww0wsKFTymaMqPZzP/9qcC1j/mADeVSbmoeiF5/6Im2KsCQU6AftuqgO8
         HMNmYD2etso2HSZrSmrtV80nat/o16trbCttQ2oGRFw9x3R5pFx8e4W45z2g5Cs6peq0
         Fp0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ti7SHm4A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-ad0c70c3919sor536977166b.1.2025.05.06.01.55.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 01:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ti7SHm4A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746521739; x=1747126539; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7WeRI1zx+FoyOA/YldoDkOxqvxpYNFgz6XaGrQKjpI=;
        b=Ti7SHm4AawkR1fJeBbO1G1cNOAYScIGI0qt2fY7NrsnfdILZP4Z5MgUsScrCWPbz33
         4ZIgQP0WVjeJYDpIPuaVuhUe9USZaiKAxMuKHDzKPjW/MOc5BKrIwh1rRpB8rk4WrbAo
         mUe48DoppHaTwBQ4jueuMgQZhBwvw0O655SUlMAGmRB4nESZ4iMQGE6nzaBTTVFHJo2I
         oJYU+nrBrYeq54rtCzJpxY+ul1rk1gBPMV4PsICh9fHT7U0jAl/pQ24nW2XQqjcvS9jn
         KS/ude/loQ/s4f8srZ61Us2MrpvT4riJ3Jjdq1keFfDg0GzeuxqiMVH6Uo8eBnWC6U6H
         Pflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521739; x=1747126539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7WeRI1zx+FoyOA/YldoDkOxqvxpYNFgz6XaGrQKjpI=;
        b=O8HixioECZWstBEDtrwpl6d8+wJiI2BfCvNalW2VpdkAxmMHpRpt8ntrygGU/XH/hD
         DL9TXM3+MsNyotg9BswDl3OsW5cIZTDSNFTj5vlPNGutBVQhZD/cNaxxr6Tad4KXlSKY
         IPRGsbzG/VbMtamFspnRZXpiVbj8CJZDXUeYJ4Fg7yJzYM997nTbDrOtRUpDPeiFVolG
         CoPH+NAKSmnFCKdvpl8PQumfDKC7PO1+eFJ0JYnjOuAJa4lxWysi2ufiIvjVrJvJu/+k
         bWLQlHOa8lkb2/wUKJUIgxwvVd4MunftVtFFdgMURMTf5U/fgHtnspur2j87gMXjZxEe
         4oPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuu+PG7StEDPs4B1Yi1AaRjAqsiwpMMtcb1A6rGc9pi8M4dHRALQ6fZOECgWXo4bCV9MSVgZ4cccqYCw==@linaro.org
X-Gm-Message-State: AOJu0YzpQeI9+DiJCM81NuXBzUTjcKf7FkqC2m47B3xBgY/MdgDTV1xQ
	Kntz7uruQX0wgt4sdiV/J9ywHwfrxuSdxq2PTfjjmjzgsB8Ael3wihVKnrSBdGR//A==
X-Gm-Gg: ASbGncvv+BvVoypM565QT+vbclwElqZwm13lMKlAQdRYprTtbSY4Qep4d1gMLJohHxm
	VpCPwoxe1gVXYvskhGSPHC/2kh3uFCCjNrray42R3E0bVVAuXEQ7781ajkX18LNGy9TdyKaUnb2
	C2TtuDmeSomvAvA7ylG8yhUjCdWZC6dLLC+iiDAwzYadm0vbsQIhvTqwGdrSuHNs5T5ItNTEd5N
	wXXOIm0U5sJ2AsY+E9CjJHVGKOJTz3bQcVjDgdX04g7KIRWVyDfMQR6qv3WKjeqdb+RTsnEAsaH
	O0k4V9OrhZYCJetlxIePh7HsD9JoJcltUwag3LITuZrRywiC8DCbo2M1xkOgi1SvwOf+opb1/m/
	jhMe4Q6LlifpT0w==
X-Google-Smtp-Source: AGHT+IHifHRffEq5bdMQfPubSpOyrj3WXjvuBj9ZM/+bmICtF/DDCxyvX+7c81bPwv9FmYrdouWSVA==
X-Received: by 2002:a17:907:3fa4:b0:abf:73ba:fd60 with SMTP id a640c23a62f3a-ad17b5dbc19mr1529984066b.29.1746521738971;
        Tue, 06 May 2025 01:55:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.194.152.213] (238.21.205.77.rev.sfr.net. [77.205.21.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146f61sm661188366b.9.2025.05.06.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:55:37 -0700 (PDT)
Message-ID: <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
Date: Tue, 6 May 2025 10:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
To: "Michael S. Tsirkin" <mst@redhat.com>,
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
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Anton Johansson <anjo@rev.ng>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250502132441.64723-1-philmd@linaro.org>
 <aBnCk2WE_SNkRgSH@redhat.com> <20250506040903-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250506040903-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BjzzodfsDUPt

On 6/5/25 10:12, Michael S. Tsirkin wrote:
> On Tue, May 06, 2025 at 09:04:50AM +0100, Daniel P. Berrangé wrote:
>> On Fri, May 02, 2025 at 03:24:41PM +0200, Philippe Mathieu-Daudé wrote:
>>> Legacy VirtIO devices don't have their endianness clearly defined.
>>> QEMU infers it taking the endianness of the (target) binary, or,
>>> when a target support switching endianness at runtime, taking the
>>> endianness of the vCPU accessing the device.
>>>
>>> Devices modelling shouldn't really change depending on a property
>>> of a CPU accessing it.
>>>
>>> For heterogeneous systems, it is simpler to break such dev <-> cpu

         ^^^^^^^^^^^^^

>>> dependency, only allowing generic device models, with no knowledge
>>> of CPU (or DMA controller) accesses.
>>>
>>> Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
>>> current default (enabled).
>>> New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
>>> the VirtIO version 1 spec.
>>
>> IMHO that isn't acceptable. In order to be able to provide an
>> upgrade path from the old binaries, we need the need the new
>> binaries to be able to serve the same use cases & disabling
>> virtio 0.9 support prevents that.

This isn't for the single binary effort, there we are taking a
lot of care to not introduce any change.

This is for after it; once we have a single binary (one architecture
run by an instance) we can start testing heterogeneous emulation
(different architectures in the same instance).

>> I don't see a compelling
>> technical reason why we can't support virtio 0.9 from this
>> endian point.

VirtIO 0.9 needs knowledge of the vCPU architecture to get its
endianness. So we need to somehow propagate that at creation
time, guarantying which vCPU (or set of vCPUs) will access a
virtio device.

The use case I'd like to figure out is how should we model
plugging a virtio 0.9 device in into a fully emulated
ZynqMP machine, which has little-endian ARM cores and big
endian MicroBlaze cores.

Alex said this is unlikely to happen, and better is to
ignore this case by not allowing virtio pre-1.0 devices in
our future heterogeneous emulator.

In this same thread Pierrick pointed me to the reference in
the spec: '2.4.3 Legacy Interfaces: A Note on Virtqueue Endianness',
"It is assumed that the host is already aware of the guest endian."

I suppose this means a pre-1.0 virtio device expect to be used by
a single guest OS, but it is not clear the guest OS as fixed
endianness, because the code path checks vCPU endianness at
runtime, so passing guest endianness as a property to pre-1.0
devices isn't really an option.

Anyway I think 1/ I posted this too early, "speculating" as Pierrick
noticed, and confuse the community w.r.t. "single binary" and
2/ I don' t understand legacy virtio and its endianness handling
enough to figure a clever idea to keep using it heterogeneous
setup, so I'll let this task to someone more familiar with that tech.

>> Yes may be more ugly/messy than we would like, but that's par
>> for the course with QEMU emulating arbitrary device models.
>> If the new binaries can't cope with messy devices then I think
>> we are doing something wrong.

> 
> To be more specific, having a kconfig knob modifying the device
> without regards for machine types, means it is no longer
> enough to inspect the command line to figure out the
> compatiblity. That's a problem.
> 

OK. I won't pursue in this direction. I apologize for mentioning
this topic again too early.

Regards,

Phil.
