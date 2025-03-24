Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2170143njc;
        Mon, 24 Mar 2025 12:11:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4c07:b0:2ff:4bac:6fbf with SMTP id 98e67ed59e1d1-3030fe56aa9mr21489086a91.7.1742843466853;
        Mon, 24 Mar 2025 12:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843466; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3Oa4kJ8zeOAkog/4Duur/Oz7/eAI7ZXK2oQHHX8mqnhtZ+y7p9BBqpdkSpa0BVyFK
         4rDCr80GC8lt+QGWW29e7AYccoutCeQzr77Eb4p5PhQnJYjqVCAU1LVJUqDFjZsZ0BdC
         REUALRIXMVdNbgMPMi6ldUdAnn+BD73ozqz5DSFyeW2zZuFanpEMxdxNulxOl74Zsz+v
         8H6DnEYf4W+Pn6UPZEr64nE8mR1SaMbK8YeGVHw0V7Ufz7ZGJACMq7roze4LtHzcRsJ4
         SpVEf/CVGS4WmA0Zs1ZyeZbAMZBrdctKs3u6b29heNInERLSkwz9fSjGgvE1/sPHl5n0
         8A5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2xVmnCxZJP4ygbC4A2PJ1N+7INPfeCLpfcW+TcE8zr0=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=T1vFc87o9g+M8hbmUylPxihZHu23KvrdOeFwCxcexPBy2H5ASDGOXm/K8GyHdV8992
         8+8DI7G0g4LlZQA5O7Jr9fRcPIls+b29kuFB4ii6JQXOMFdtnc0VpPz7cgw32/zznj0o
         /SlL88PsMbZr7hkttrLs87cYdBMmBkfFecgUfx9TfSIWij19O0xSLt6emBQkn5lPDMbO
         LIvJQFWIy0zDn+sTIb2rvtAinnnpI7wsS2lR1vIk9HNp5J7Nzt3Y+gKFun2AcsZB0Ni7
         RZBeUNETYxodoiOglQcgxvN0XePOpLhIXm73gmYnDmEskqvijeSZF3gyv92z2bwsklO+
         WywA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Umd8UfU7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f77fb04sor6460475a91.5.2025.03.24.12.11.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Umd8UfU7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843466; x=1743448266; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xVmnCxZJP4ygbC4A2PJ1N+7INPfeCLpfcW+TcE8zr0=;
        b=Umd8UfU7jadNsec9LYU6mgNOyd44UL3ThOBMt+Lv7m2pV/QzsidnzvGnGTHIMbhpqK
         NV/axyMmBYrmpqUVpI1pBLyOgKMRF4xPdXvrKotRXnAdU4Z5cYvQKRA2CR6tpvBRGjd4
         r+1+Idq+PuRsUE2sQPI+ma7RFWX9Ix2ieLl0vtajTB07WD6USK8xg8T7hQVbj1ovftoy
         eBPF1g5w1o94ECPYh1WX2UNVJNVTEcV1S5NbNOwrno1bDP/wk3yDPRVOinggwoHiDela
         7lANx67urBWPdS9aCW/haSWKo1OoygjDxB/oPLAYLKN7yJTt/kU9v/hJz7eMLpeUKKfO
         +4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843466; x=1743448266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xVmnCxZJP4ygbC4A2PJ1N+7INPfeCLpfcW+TcE8zr0=;
        b=p7L7vlqThTKSGUBe8cLJsL3/2stdFH9BZxB8vfJPhQvLvZfk+UfDHdHaE/0cZj1+PV
         PQGuIfLAxtAaH0Akf4JPC+fLp6Hn4RS2WsndFlQ4V5LPCuH1ab8pGBdJWZXImNXrEJnR
         a9EGy/XrLLRzSOUki9IdswwF8VV7/h1YW6waYRDfVoTqRWxABuVA44aAHYKYekEab5dR
         hlbf9Ek6edkDC8WhMWZO8WqGhM3ebfX/SkAJ66qD1B6OYFvKx65241v/YzzdYUrG5tKl
         /LrKu72aG5Vs8jFVPGe0DQYiPlwjxC9V8dN0hj5A4vclwrD4YRKgI711ub2cEZYQJAIB
         Fcww==
X-Gm-Message-State: AOJu0Yz8DNQdfnNa8VURjj3/7D9g5I9Dt3J/nSX/7eYJdKgk7ujo7Bv8
	HMSkplsOuPeuU9FKFfkPypy5QA/tzCMDcePy1V2OD4yUxDZeGSc+9yvcQ72h5zAW8WWM8RpcbVQ
	rePncHQ==
X-Gm-Gg: ASbGncuXss1l3x6tVTrilqKAv8xzj1XQ65gUCnUCP/dqNocfGHQk/DShUJuJVYbxqOu
	eaCuhneO8bpE9qsiOb2nFv4a2XKPYJUhAeBJgtK/OQC6GYoEW7kCM9tpKZqRioC9W1f9CNtmC3a
	Fweb+pwDq76buAPm+EB3OwIChUygMDSfRNWkaCrvLkeIAG/4JNVk6oseyTXy7TEHH0Xs45xCCs0
	SBC8k4p0rDEYAWAnklRRQVpuBCdpEgmCnSAN1kZDkquZBXdEjdwkoFQjcCj9gsITbUXQ9+96TZE
	rOlfOWfuGTj/TB4Gfem6qwk6HeQryiPZdUX3bwOYKXdswUqBQA84bVbm8w==
X-Google-Smtp-Source: AGHT+IHhPWLdYfjAxijNWXaYSdLRs8IHHkcTrZU0+P39u2W4KQV+NC9aL99hESpTQ0VimI57MJWSEg==
X-Received: by 2002:a17:90b:1f86:b0:2fe:baa3:b8b9 with SMTP id 98e67ed59e1d1-3030fe552b6mr20409869a91.4.1742843466281;
        Mon, 24 Mar 2025 12:11:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d4e46sm8612035a91.14.2025.03.24.12.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:11:05 -0700 (PDT)
Message-ID: <5ac2becc-a8eb-4b88-aad1-47937cd9b953@linaro.org>
Date: Mon, 24 Mar 2025 12:11:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] include/gdbstub: fix include guard in commands.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: WK9wn5cRX+x8

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBSZXZpZXdlZC1ieTog
UGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPiBSZXZp
ZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
DQo+IC0tLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9jb21tYW5kcy5oIHwgMiArLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZ2Ric3R1Yi9jb21tYW5kcy5oIGIvaW5jbHVkZS9nZGJzdHVi
L2NvbW1hbmRzLmgNCj4gaW5kZXggNDBmMDUxNGZlOS4uYmZmMzY3NDg3MiAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9nZGJzdHViL2NvbW1hbmRzLmgNCj4gKysrIGIvaW5jbHVkZS9nZGJz
dHViL2NvbW1hbmRzLmgNCj4gQEAgLTEsNSArMSw1IEBADQo+ICAgI2lmbmRlZiBHREJTVFVC
X0NPTU1BTkRTX0gNCj4gLSNkZWZpbmUgR0RCU1RVQg0KPiArI2RlZmluZSBHREJTVFVCX0NP
TU1BTkRTX0gNCj4gICANCj4gICB0eXBlZGVmIHZvaWQgKCpHZGJDbWRIYW5kbGVyKShHQXJy
YXkgKnBhcmFtcywgdm9pZCAqdXNlcl9jdHgpOw0KPiAgIA0KDQpSZXZpZXdlZC1ieTogUGll
cnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
