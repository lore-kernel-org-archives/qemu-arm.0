Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp583432lfc;
        Fri, 17 Dec 2021 02:59:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlh600LU2SJuWHqbginqba0ot2UdxDAkD20opeT3d5n1l1Ri1uCJz+qnFvHmYjGXGLoO+c
X-Received: by 2002:a5d:6111:: with SMTP id v17mr1500700wrt.324.1639738779512;
        Fri, 17 Dec 2021 02:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639738779; cv=none;
        d=google.com; s=arc-20160816;
        b=I/elKcpj1naSA6OXB5xKDPYk7u5dw8U2H3sivEIGmynSpqpadhFiVR1g25N1W3v6p3
         95FgDeMT+5smy/ltNxrrkr8fAV33dgBmRnCtJyaYAcTQFyhNHZ+Nf8YVjb8lDptuOs17
         i+kawabZVqcmPQk9EqGy8JVyuPX6zhuVkoq+AioliNlYTR+Ha0zX6vy2ofk5S0+MZ8i8
         STU6jWN9QKCJB4A8/X5sRlbLjtFXD+XNMWi4bTEd+Krwg7xv5ZotgoGX4NjL9wsR0Xio
         e6i/+9gMFFiLTitQ/QFLDHoqp94O4cEGl1UG1rznvffbRBFt7b0t1flWvxUamNVjmPkH
         ojjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=MUwtc4Z56XxOBMoG44Nc/EFVE8T8MQrecjDdseunkzw=;
        b=G0dGXLxpaQbdj+O6U+7rvACVg6F0lq8PZcErUYwbLFtMeHp6AuiV8J1/GaIhtIvX+v
         bOXcSOswCTiuRlmdziOMpkJAq06pUTBhBW5roZi7vktJbAnElNcFhdJJu8uDJvrNyEkL
         KB9MDHQpVYN1sXB1pSPZnodGcCwWqe66RzhY1oIu8p/SWsIF5PZ0Aexq66bHydpxJW7p
         tQdYONpqOS/MlssZKloMQlv6EVXgvlymEzCIU56Eqr/BdH7kxZ9uqHKhiFPy6PpVwChl
         nzi9W54IFMBlXzSrClcXqCQSCiqdcNMnqqAOqngghZwEcMYPaYIHHQCK3MDAtzvA0yRP
         nlgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.75])
        by mx.google.com with ESMTPS id 142si10283096wma.162.2021.12.17.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 02:59:39 -0800 (PST)
Received-SPF: neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.75;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmU9X-1mGYUD0Swb-00iQ9O; Fri, 17 Dec 2021 11:59:36 +0100
Message-ID: <0cc480da-aa6d-d0ab-7c91-f2b6df41ea23@vivier.eu>
Date: Fri, 17 Dec 2021 11:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5XS31+n5lZ7ddrgxHNrvM4qnHivM5umP6pYcBSGt/TheNYM6DQc
 xlKjNMOMKJYbV1wgb0i/MB5URP/fzr5HvCTy9OIRJXwXnoywfwkTpat272v9zTwJltXrF8s
 1lN9Qe0W6mGH2i1RgB97UN2hCKwpDVRN0qb0ZpmhQUi3cnFSkmL7wHv+ItRrSvSBKq8Y1BP
 l2b93x01QKCJhjarD2pHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+qUylvyHy0c=:u0wFTS+mA/IBULKzNfebzN
 0eQHaffALNfpesYKZrPEGSzQEnBFTPb9pxjIsz9KhgB4cxzxvTGlYDgXGb1HnaVlm6Lby6s7g
 tC4u9/kIHsgL8nq7HeaC3rbCvB417mFapANqJP2FRehsKdyWEiA7fWMNd0nrwmW/UTPVrQG3y
 q65InHGoDkXNVf2JNsfssXrCQ+fnh4cdL9xK36hEh35Xv06a2ftzn2mZuqtQ6A9RTNkeCAfz8
 VyedmAg30iD5kThzQOgBltxUzzvH5DLEe+twcLC2/VvPT92vz4zyQecSsSxHMMs/WnNPbI91r
 kv1V93sOTmDGBZqX8gYwpWE81kgnA821Ska2QVq4sS5UaSjCL2bM4KjHjLj/37hwMg3gl0FVx
 LRiQssyjqPAdsbczCdIT7EIaqsD/ArmQIm5kOzWBleguUCKl0JbbG3zcsdhAfwv/pVLY68XMA
 nd8wB+GD2CpetYoo5TDTRn4EAgVreh16PTcnWUsTcSH7GxviIa91wTr5ngr2abJ6nv/oAOPvy
 M2oqkVEEvCdmeeb3yAI8lZGBGnjyM8ZCDxgOsFQWk72HYrh0G7Ov63eQCeyGiIGAZSY+2JbBo
 ZPSsxwBB4GbZHFzQJlicogcJz0kV8IZW9bfbtAvH2yWpbeHZBtgWV7uZ8jBp8mOKXqrzVUikQ
 VEsoe5DRLlSDmtT80VWkfvjCIOZqdJLerTdnK9ZQ/ffpE/hxY2xBlJCv8HKsC6aoJypo=
X-TUID: Rfa7IKc4hbOO

Le 15/12/2021 à 17:54, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> On 9/3/21 19:44, Philippe Mathieu-Daudé wrote:
> 
>> This series provides the safely equivalent g_memdup2() wrapper,
>> and replace all g_memdup() calls by it.
> 
>> Philippe Mathieu-Daudé (28):
>>    hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>>    glib-compat: Introduce g_memdup2() wrapper
>>    qapi: Replace g_memdup() by g_memdup2()
>>    accel/tcg: Replace g_memdup() by g_memdup2()
>>    block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>>    softmmu: Replace g_memdup() by g_memdup2()
>>    hw/9pfs: Replace g_memdup() by g_memdup2()
>>    hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>>    hw/acpi: Replace g_memdup() by g_memdup2()
>>    hw/core/machine: Replace g_memdup() by g_memdup2()
>>    hw/hppa/machine: Replace g_memdup() by g_memdup2()
>>    hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>>    hw/net/eepro100: Replace g_memdup() by g_memdup2()
>>    hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>>    hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>>    hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>>    hw/rdma: Replace g_memdup() by g_memdup2()
>>    hw/vfio/pci: Replace g_memdup() by g_memdup2()
>>    hw/virtio: Replace g_memdup() by g_memdup2()
>>    net/colo: Replace g_memdup() by g_memdup2()
>>    ui/clipboard: Replace g_memdup() by g_memdup2()
>>    linux-user: Replace g_memdup() by g_memdup2()
>>    tests/unit: Replace g_memdup() by g_memdup2()
>>    tests/qtest: Replace g_memdup() by g_memdup2()
>>    target/arm: Replace g_memdup() by g_memdup2()
>>    target/ppc: Replace g_memdup() by g_memdup2()
>>    contrib: Replace g_memdup() by g_memdup2()
>>    checkpatch: Do not allow deprecated g_memdup(
> Is it possible to take the reviewed patches 2, 24 and 28
> via qemu-trivial, so the rest can be merged slowly by
> each submaintainer?
> 
> 

Done for these 3 patches.

Thanks,
Laurent
