Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3193197njj;
        Tue, 6 May 2025 08:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkGApSPmKbbrcBRMcPqowvNUUsGb0RjpVvMumyYfGP7TZq69airfw45XOitwoyf7tkT8SPilTF0yNEZw==@linaro.org
X-Received: by 2002:a05:6a21:6f01:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-21180f58276mr4287386637.16.1746544695746;
        Tue, 06 May 2025 08:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746544695; cv=none;
        d=google.com; s=arc-20240605;
        b=cjpMoPfTl6gtKZ9T7jS7I++ZkrUGcP0vZSKiV6YkdSF+o/HdKqVjyVK+UqK/xMJj2/
         P81rmuUQG2JtQey5+3mwTkq7pJuqFHtOv0ojR3FsqGBphhjW9Dceh9EGX5J48ADSK0AF
         gHRTU/yaYtlNws3eSovJg2EZ1TDo9AVCnPBhm5bCa4PG+fkH1LWH6lD9a8Vb5UKv4USL
         njXnYKYmoFwBHRdreVeVQgw252TPVuUn7aablJSs732OvkSUXX8oNUE+xxfdsqsjNiS6
         fyIqce3niTJZ5g+xswpUEAjtNTT1Y7MxasMNwENlPb9t/Pe1DmiQcA868gJwCwPd3q0b
         E+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1qF/4YkbvVkMAeOW3oJDj8///733KHf3pnFEtujLnXQ=;
        fh=Cm/aS/DnIFjL0NYc0ZEyqYwfe1I8c3urwUMn+/EOyNM=;
        b=bd9zhQqM1tg2aitymbdLftA++Quh0ewCZmU1uLwwlSo5vJIw3Qxj1A05uf9XefoNg5
         nvrnDKRGI78TNtR50Nl0BsaTeortlgmNJVYM/am2AuEfkUUhAfvcWUDPg3Dhhr90aqwz
         cjfXIncpqjPpce6Q+3GZDs5LQDSL/vElHK8x1FfZylS4BdME7ykbc4vvfDr9uf337Ieh
         mVMudBJmpe2Bi3+aBXV2fewWEDjNT0OZ8fVbf3roufsdN1NoiIzLY+87o5Sw30E5zpaQ
         6P3KZZqZYcdIIwug5UgoO8Dm0Z55lPUPdUoZMw+oyyWFKn6n4oxeF8uDR6skkHmZNzbk
         Ig3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Js76/K6x";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d692442sor7381779a12.8.2025.05.06.08.18.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 08:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Js76/K6x";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746544695; x=1747149495; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qF/4YkbvVkMAeOW3oJDj8///733KHf3pnFEtujLnXQ=;
        b=Js76/K6xLGEMBpSCibNjgd9XSX+UkHfzFNfBmlQ8bIb/ct6T8hqydbPQbqKUlLkSLf
         5fkPXDrP3lRxz3WKXmtCCWROP5s/EZ7gbu7+LnbYDh+Iq4Nthn2Qpj6+ntayMPpcH5i/
         XmiK1ASiVHCTFYKHMPgURskz4zU5AJkiBcJpDLYewhfpe0ldn9zndNx6VBinqWeqlOCR
         khfLHtWsjkEtHM5bCyVfqti27G5AXlxwEE2RPE7n/Y60x+OKloa44s2akOKI9RVLCVoV
         howr1ExG/0IbR9mU+CHyD2Ze6sBMZxVyanHhCRX9b8WyflY46tECqU9hcrNFeu4kXg4m
         FOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544695; x=1747149495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qF/4YkbvVkMAeOW3oJDj8///733KHf3pnFEtujLnXQ=;
        b=EISgXBK72P2VYVM5QAepWjflo+QAUxulyIwvx+GRSXlp7k3wEH/KPPgx60P2+4Kroe
         m7tBxetUvqiHmCBm4SPDdoSNYigdAu8wSSTvBenTx3J5ruA912ziTTo5h34hYW91EdBu
         UBFXMClEENX18ub+mx/Mc//qDZW4wSo3Bf2isRU8piC5qXAstouODounSKk9qd8AVYsy
         k5YswqwO1BnpEZKs4hyK8BJ3dEAQ6j5dm3x2mylEWxKwZZFKgkxTZQOFkp6iay25g80p
         WQrTq7VEoycG2xNIwZYdKeic45+zIjWjBs+UuPS21ZvaOFLWa+XpYcUR4HL1VOh/kArv
         cvww==
X-Forwarded-Encrypted: i=1; AJvYcCXCPzgJovnV+Nt7At2R6sw6OWw1HipLbrVx3inTKEbIcSz/8TCkVuTNlir2lVXo4ANpWDMEReduRZw62w==@linaro.org
X-Gm-Message-State: AOJu0YxxSfsvCabral3ab1HSeusXGwR7OG34fRI278tAHBIZFWnX8EUx
	Ysk07nRJB1TdUsKPs39BIPWj7jfhbXiQzWIqLDRj9HOuU2sHIHBZ5bWx4mBfAqn1nw==
X-Gm-Gg: ASbGncuwxWxwqpn2RukLdVV2dciOKu5bjjovJXRsfZF3fSC3lHLPkRfYX5qj019HVO9
	GdCTBhK5V2ZjMTHP0v3GDqPKLThzyZKaDwn7GWkVrfMiBuVjr7bxCEdLQAIGroRgYF8UizHgVTi
	xsLGNIXJnHFsw8Esf8iQfSzjdK9Ohwo7MdAx5oUIhfvm/8dZm/3Hb24smm+yPon/MO5pYNZMWrI
	o+gVS/eu0O75QreEIOdIvWEq7OGtE5jQgzoh5QRlWnjsOqBOnQ9t+IpXmsXScrn9FDi10VtKFJo
	si+scka3783LZcZ0iDLYG3Pc/kY3iLMaEAtONxSQ4kmfqgjUrhcfzQ==
X-Google-Smtp-Source: AGHT+IFbZgWlItvlCQJY29igBTXBxQcw6cM2Sh4oq9nefMxNskd0xAMkyiBgfMB7th/i82gB1NzxHQ==
X-Received: by 2002:a17:90b:274e:b0:2ff:6af3:b5fa with SMTP id 98e67ed59e1d1-30a7c0c8b6amr4786488a91.22.1746544695224;
        Tue, 06 May 2025 08:18:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f907sm74943835ad.219.2025.05.06.08.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 08:18:14 -0700 (PDT)
Message-ID: <0c753bdf-996f-4f1d-9fed-cc0ebfc6418b@linaro.org>
Date: Tue, 6 May 2025 08:18:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
Content-Language: en-US
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
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250502132441.64723-1-philmd@linaro.org>
 <aBnCk2WE_SNkRgSH@redhat.com> <20250506040903-mutt-send-email-mst@kernel.org>
 <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: meM9PyrOf7n+

On 5/6/25 1:55 AM, Philippe Mathieu-Daudé wrote:
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
>           ^^^^^^^^^^^^^
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

Virtio devices are not the only one who will need to be extended to 
support such a scenario.
What happens when a disk or network card is added to the machine?
Should it be shared?
Should it be mapped only for one cpu address space?
Should address spaces be mixed or independent?
Per cluster, per cpu, per architure?

Having a concrete prototype will allow us to answer to those questions, 
and many others, and find solutions for the situations we meet.

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
>

An important mantra will be to keep that compatible with existing 
command line (potentially extending it to support those new use cases, 
in both the existing *and* the new binary).

The last thing we want to introduce is "yet another QEMU".

>>> Yes may be more ugly/messy than we would like, but that's par
>>> for the course with QEMU emulating arbitrary device models.
>>> If the new binaries can't cope with messy devices then I think
>>> we are doing something wrong.
> 
>>
>> To be more specific, having a kconfig knob modifying the device
>> without regards for machine types, means it is no longer
>> enough to inspect the command line to figure out the
>> compatiblity. That's a problem.
>>
> 
> OK. I won't pursue in this direction. I apologize for mentioning
> this topic again too early.
> 
> Regards,
> 
> Phil.
