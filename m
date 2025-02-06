Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1595324njb;
        Thu, 6 Feb 2025 07:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKfIhamzEXbeEtcoEL/AB1OF2Gm5RNTrPhpIRucNTor4yyGcreygmobyZsYw9t3miAjmM5iONO8j7kdA==@linaro.org
X-Received: by 2002:a05:600c:3152:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-4390d43de55mr63299335e9.18.1738854262883;
        Thu, 06 Feb 2025 07:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738854262; cv=none;
        d=google.com; s=arc-20240605;
        b=Fl7eiC+dncBIu7PqCzDbAGU9NnTu6qwdLmTa3jJjQqg5BDHpvHG45vdSr7IZYTJkPa
         flQQ45Zdsw2F0oWQQXwkVDEiffrUltD7guqnE8RY0L6OxTOMgp5udSyQbaF4ajm0WaeS
         MReUNZej9c3QAqjcfT7s9pkOwmbcZGW2BnXYIScuf2ptq+H+v2DALJydFqr39ICWK0A5
         oazT5vzIRFaIh5vF1Q6V6koGZ1Q0E9/Miyq5pQqrIIw66APEI+3zr+u1gE/ghXFVxZKj
         +PB5kUsYYcrTIxL9IQqILJmwpmqwqEDBiFeP721Nlw6jZB+2LC9ihY7hBiO5KnL3XcO0
         Xr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=km8wfH1YKDGjHtyfe844rEvoeDz+boWvButHiUcY8IM=;
        fh=fBM6ftd+S8+6jwaZsp1h+f+XBDBo1OFTLEMaejnzq+Q=;
        b=AmUp98o387vsE/98Y2melwlo+/plHXGh4p3sN7uViGtbRL1ll/+KvDL5QSiKIKxY97
         Ha+9g1GWHvx5Poq84QYvy0xGOAtnqITXMEw6KmteI0j2uPXCwLgx1LBh282ODpafscLz
         NP55iYcmJqDL2NyhZX/F7YOZZDvhBb9haG1waK6jnKEW8gq3T/ikcmMZNEPdK5GBsK3Y
         aCtL1xdzwMsm3gRKRBcFzXnSkjUkyOd+BZCiYXP0cGWO6sUSdSl8CrfK9NsYUmbRYeMB
         SJkTuQapP0CUOqUALhdadFCN7d/X8/DKkXJu1PFkNlDKlzpaOA26SaY6RJ0I14ACRbaH
         ZrJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPjdH9Hb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391daac8b3sor6732625e9.2.2025.02.06.07.04.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 07:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPjdH9Hb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738854262; x=1739459062; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=km8wfH1YKDGjHtyfe844rEvoeDz+boWvButHiUcY8IM=;
        b=QPjdH9HbCpgGT9DOi/NWoXW3CeCkUebyIRSGKCt0Hz9zQI5v+zVFMV2IsbhSJ4KvDB
         4dilmn2abFb0bIjK67Rr/mxpYOsWf5MPSu+JaVd7ko04eXp/mR8/yDaCWpXl8gTo6SPQ
         gOIYI5RRn2/6U0T/7VmylyhmFlEKDQCAbDY2MSlufYghe8SdcaI9y0FUlSL9ThXJMxbh
         UjXEqeSM+dLVUftnIDa4oXXo8Bbp0odS/xj0kKVt88D1+6ItiDgRh8bHSmV1mgKuwCT1
         n8Qf4NI/sEIpz0joiqnki6T/axAI+jrrnjt9/WBMKssVcbszvsm7WrjJY8t+xEO3IeZT
         TAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854262; x=1739459062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=km8wfH1YKDGjHtyfe844rEvoeDz+boWvButHiUcY8IM=;
        b=MXpbWngTuxtTXtacG2AYyQSV9YAOQx+XATfqzX60TRcQ2fIGwlCw1wArObEheptOFf
         v4wYpC3pPjdXHffk2jDAMObIzVFMuuk9qhSPTM46dRxwNXetExp3LlwPkvYypiOnaHIa
         r81Ru+R6Wew5ynunwb0BC4kRk6wLkeKKMA7pe7hFzP6V6fGzCEWfQmuyQKMDcEzP2AOX
         nys+ZX1ZSWCwDEf/6fJaMm8tPR4TtqxJ9L6X52aun2MIwegVFwPiW3WqO4dGeqYCCnwt
         F7FjquDJyHx/orKVTks21MKSv/o/zDFiSpwEgkv+ROHUdUKec0V/FVMKB69gTmFrs5wH
         g4wg==
X-Forwarded-Encrypted: i=1; AJvYcCWko5v1JiQDRlR+6f3ghhsLX65gI4jkM+fW+rx0NRf0rTyY5oHclmlFUk8o5iVvLa/1Nm9W3EEjustx4Q==@linaro.org
X-Gm-Message-State: AOJu0YwgZRkkSqyge0vpLwqoijhXo0SemyXG1zsLyH7tL7eFk4FhrHvD
	8ZvUi2nT8nmWS2q4+RiG0iP/LH1Uz12JOVi3cBUTfuFtKvDsFYZW5hJi9EOcS8iMIw==
X-Gm-Gg: ASbGnct9u6H5VnZ2MZCUWOVHbkq0bp28PcnwsVZRpfp37rArtwAKJ9K2vjFnPc9EaKp
	hIw1h6VDRQeY/7mQih360UJTttBU+kRR/zeEWAuCxJRdjJpl6+nCeizp2MS1+Sd9xrH2e06JU5w
	fvcvQqEknw7l7ilwfOM/oZ3DgZxyrqYt1DGGWg/eP9GmwtwScHtHM7lByRnzomuSYsa6SQNdNgw
	Q8Wgn3W4EmEqHQ5cxGhAsfJkmu9ufwX/vmpu+GbNhC1U/CT4F/Y81L2Mb0Y3yFIKME6gNVepwFH
	W1zlODfgDl1S686Kx7UeiYRhUwAAghdnw87/Cjp2o4k3NA2hBOJndBoUTTs=
X-Google-Smtp-Source: AGHT+IHUetmvOAjyxDOEknvKxGKDD1pjI4/z+TXs5R19Q+StoQ/DaECimwilp7pdm9UPWZDsweO8ig==
X-Received: by 2002:a5d:6d8e:0:b0:385:faf5:eba6 with SMTP id ffacd0b85a97d-38db48b42c0mr4890013f8f.1.1738854262183;
        Thu, 06 Feb 2025 07:04:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd368bdsm2000130f8f.33.2025.02.06.07.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 07:04:21 -0800 (PST)
Message-ID: <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
Date: Thu, 6 Feb 2025 16:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6THtfjL6UVhBiW7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: weSOyA5y+Dvg

On 6/2/25 15:31, Daniel P. Berrangé wrote:
> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Introduce an abstract machine parent class which defines
>>>> the 'little_endian' property. Duplicate the current machine,
>>>> which endian is tied to the binary endianness, to one big
>>>> endian and a little endian machine; updating the machine
>>>> description. Keep the current default machine for each binary.
>>>>
>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>
>>> Does it makes sense to expose these as different machine types ?
>>>
>>> If all the HW is identical in both cases, it feels like the
>>> endianness could just be a bool property of the machine type,
>>> rather than a new machine type.
>>
>> Our test suites expect "qemu-system-foo -M bar" to work out of
>> the box, we can not have non-default properties.
>>
>> (This is related to the raspberry pi discussion in
>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
>>
>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>> remove it we can merge both qemu-system-microblaze and
>> qemu-system-microblazeel into a single binary.
>>
>> If you don't want to add more machines, what should be the
>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>> with no particular endianness? Either we add for explicit
>> endianness (fixing test suites) or we add one machine for
>> each endianness; I fail to see other options not too
>> confusing for our users.
> 
> We would pick an arbitrary endianness of our choosing
> I guess. How does this work in physical machines ? Is
> the choice of endianess a firmware setting, or a choice
> by the vendor when manufacturing in some way ?

Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
(wired to a CPU pin which is sampled once at cold reset).

> Picking an arbitrary endianess is compatible with our
> test suite, it just has the implication that we would
> only end up testing the machine in a single endianness
> configuration.
> 
> If we wanted to test both endianness options, the test
> would need amending to know to try both values of the
> endian property on the machine.
> 
>> This approach is the same I took to merge MIPS*, SH4* and
>> Xtensa* machines in endianness-agnostic binaries.
> 
> If we have prior art like this, then remaining consistentv is
> desirable and thus my comments are too late.

My worry is about how to not break what distros currently ship.

> 
>> Also the same I'm using to merge 32/64-bit targets into the
>> same binaries.
>> Assuming we have a qemu-system-x86 binary able to run i386 and
>> x86_64 machines, what do you expect when starting '-M pc'? How
>> to not confuse users wanting to run FreeDOS in 32-bit mode?
>>
>> Again, IMO having '-M pc,mode=32' is simpler, but that breaks
>> the test suites assumptions than machines can start with no
>> default values (see QOM introspection tests for example).
> 
> With x86 there's no need for mode=32. Whether the machine
> supports 64-bit or not is a property of the CPU model
> chosen. eg  "qemu -M pc -cpu Nehalem" would be 64-bit and
> "qemu -M pc -cpu pentium" would be 32-bit.
> 
> The qemu-system-i386 binary is pretty much pointless as a
> separate thing. Libvirt will happily use qemu-system-x86_64
> to run 32-bit guests, by just specifying a 32-bit CPU
> model

IIRC Thomas tried to convert TARGET_X86_64 to a runtime check
but it wasn't that easy:

https://lore.kernel.org/qemu-devel/20230425133851.489283-1-thuth@redhat.com/
