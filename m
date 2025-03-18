Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3251574njb;
        Tue, 18 Mar 2025 15:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2c3h169eGbNPHf9zVlcV3ikqkJvkqei0QAuKnplV+XpTo5VbkeJT2ir/IcMIa1sN+hGdS1Drv5wm0Vg==@linaro.org
X-Received: by 2002:a17:902:f552:b0:223:6180:1bea with SMTP id d9443c01a7336-22649a8198dmr4738135ad.37.1742337397178;
        Tue, 18 Mar 2025 15:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742337397; cv=none;
        d=google.com; s=arc-20240605;
        b=agLvu1nMZ4AHDuaUqMO9a2uNWZE5e5sfTs5m75HkFEyc72V46aaDT4SZQ0JSk3iOwu
         Uw8BcrDDHWPzdwHZc8R0dUASnpAcI5bcO86FYeHCpUaaYo8oGvsJlavNDzkItVilH2tJ
         REFgIBsYh7r2+MrMo4AJMir5y/1Hq8o8VkmLVjsr3q8nYq+swj3GrYY7/tT63+UEVM86
         1r+TLwSOmR428HsrTvSNJ5PrBJcqCVtbQcmTrxtIrTm0uuxa2T7EOBzlSS5qOv0bKgSs
         3aPbVFLkO0S+NajdAzByNEDmNlOCW9Qn//jA51HztK+MMHKLX9nCUotl9HL4l0H1UFMH
         uD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UUhi9h0Ky4Lwg2yhKJLazGJR+aageMiVJ0t5ECQWEPk=;
        fh=z8FCJ+s/NKrsHP9qQ+enWqw/b6hMP2dL4P3kBQchTZs=;
        b=HvIuyTwl/eaH0fCK9f/Yz9Lay2Eyjd0XKbsVgGh1T8CB2HlRfnfPatxKPNEsfjsf1u
         ClCDRGCM7Ld6gmfcHE9Kvi7rS20r4yPHZf3L232I7jbHLHxKSaMbbOaKKwyQZc5eqw7i
         9cg2Pp0XR3KfrZSpZ1ac4FrZMW8ykvKHVmFrR2ks5cuoC3xRlXn6p5jKfpc8purexIHU
         Kb1bvXgEsKxGlLnde78kf9zApmne/xGBQ2ojauCdat9f+Zq+0Fbm0oJJzrZGV0LRCSoz
         bHSN0LdePl2fOwkt4dpvgJhIp3EDnqvl19AtcxW+QsNaBCPz64QxvR4vN4DhenBm+H6w
         Ra8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6uHsvtO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22648ccd1f7sor1911745ad.1.2025.03.18.15.36.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6uHsvtO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742337397; x=1742942197; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUhi9h0Ky4Lwg2yhKJLazGJR+aageMiVJ0t5ECQWEPk=;
        b=E6uHsvtOC91D0rOLSJddnZpuBOqFTo4O2k/NW8fIp/TuxhFlCqInMYcrHrvHy4MMLH
         +BViLaGmEUaxNRAbzu0IOJAuUiNoxXjhXj6R4IRNcDwv0tPe7Sg6zDpxD/+xv3I4OnbJ
         PqpoOK+8IwTP4ql16YgrVn26cUq2neNoHcgZLHdCQYazbAjLhef1UPzaO+yzgtq02sfy
         iR1JTxijXpShbD+z9+uQYMuiqTlYkD+LD/LER45LsrIlHvadxqttV38p4myylBu9Q0O0
         pNFsfhVoGFRwQXTf6DhuDKnhU4857G5AZfpkO4i9qHM1rah/mukEgkTzjj6pPz4x8BLA
         1iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742337397; x=1742942197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUhi9h0Ky4Lwg2yhKJLazGJR+aageMiVJ0t5ECQWEPk=;
        b=fbVfxrX4aOT2nRC1PV7cZ5263MalHJRG0rGw4xwLbuiYahGPUneIZKiuFYYzo2L9T2
         YBvp9WNgqy+Exr9c080Wm2KadU4XELUgPemHFB0PQ2HGvM62PMBNEueP6CqiE28N3aik
         jRFXXK/S8TcQaM0sHh19njKAhx9dKAUTSJ8DRTD95LzMADhHe7fXs4JmkbTjQVz9Obcn
         3q4C9qhRTu21MdSZqou08bmorcFApY0e6H06VLKeAeyB798pdr/abP5n0YnqSp109cA7
         Qenk7HgzKalRDrjCbwDqsQnhTvkfDhn4VxrSWkS8XMGqWF2Cb+C/lXluLSIR7Y7GOXUa
         jiwA==
X-Forwarded-Encrypted: i=1; AJvYcCVkKW9ruTc31uFNOWqWZeYJIXjyyiFB2jCg/BM7RMA9o0+FFjQ5qnn53gxZiNfWuxetkM6Wf5IyhPI1hQ==@linaro.org
X-Gm-Message-State: AOJu0YwV4n1E8FRUgQKhOSAOw2x8vCw2gcFyJARlQ4TKlsqZSDSGlxNN
	xGjC1sXh4jbVI3zAOMEv/rWO8GDEsPFGUjsmcHjrULI1jg3tb/n3yRw+pd8hv8fOVA==
X-Gm-Gg: ASbGncsuPYeonnsbWGeGH1CA78sqUKysQY+7Iy321se3MWAi98Uxe5RcQbWNX1m6GeO
	adTl6v+OIWmzoXqW4D1/AE6vx/9oMsKKY2Z+Nw7190zuJ9r/YvY2FOPAirnKKRicel6pNjGyY3e
	wOLQ3Vp7APEQ7tG5PmrbbcgMaJIf5hMLGH1P+xTY1j2HEi5kFy0VZuPuxyZoGBfaeazZduSgOUY
	4pxefUmzw/m5I6hbq6m5BAWqDNQlSbQvuWRqKJNpDBIV89wjAbtRq6+kWybKsZiGNCXHpjZCTAj
	xjelbc3xx/bKavrrSM5w0Og7qcclkmjsVlJ2AIt3B1ZkQquvkr772Gl1cucwjKSZpuSsNueTMSy
	z6iq6uLTh
X-Google-Smtp-Source: AGHT+IF/EP9tvkxdUM+YtdNjRtxjdctiECzFem2hCJcdLxuxEimfX8lMgON8I3Z9Cbv3sCS9h/91yw==
X-Received: by 2002:a17:90b:4a11:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-301bde51a32mr547250a91.2.1742337396781;
        Tue, 18 Mar 2025 15:36:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589bccsm37460a91.11.2025.03.18.15.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:36:36 -0700 (PDT)
Message-ID: <ac79c5f1-d7ea-4079-b042-3805063fddba@linaro.org>
Date: Tue, 18 Mar 2025 15:36:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
 <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
 <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
 <0c6f23d5-d220-4fa7-957e-8721f1aa732f@linaro.org>
 <172a10d0-f479-4d6c-9555-a9060bdf744e@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <172a10d0-f479-4d6c-9555-a9060bdf744e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zWwen0bd9CjG

On 3/18/25 15:25, Pierrick Bouvier wrote:
> On 3/18/25 15:21, Richard Henderson wrote:
>> On 3/18/25 15:16, Pierrick Bouvier wrote:
>>>> This doesn't make any sense to me.  CPU_INCLUDE is defined within the very file that
>>>> you're trying to include by avoiding "cpu.h".
>>>>
>>>
>>> Every target/X/cpu.h includes cpu-all.h, which includes "cpu.h" itself, relying on per
>>> target include path set by build system.
>>
>> So, another solution would be to fix the silly include loop?
>>
> 
> If you're ok with it, I'm willing to remove cpu-all.h completely (moving tlb flags bits in 
> a new header), and fixing missing includes everywhere.
> 
> I just wanted to make sure it's an acceptable path before spending too much time on it.

I would very much like cpu-all.h to go away.

It looks like we have, on tcg-next:

(1) cpu_copy is linux-user only, and should go in linux-user/qemu.h.

(2) the TLB flags certainly deserve their own header.

(3) The QEMU_BUILD_BUG_ON assertions need not be done in a header,
     so long as there is *some* file that won't build if the assertions fail.
     Perhaps cpu-target.c is as good as any.


r~
