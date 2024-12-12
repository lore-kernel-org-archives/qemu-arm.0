Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4829295njb;
        Thu, 12 Dec 2024 06:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLeqs5zksyqtRQgFa3+voyP0MqrQR2vfCuQkNxkUNtDn3zVAwVHn4ElIvuuvpVcM5G0yYT3EaAB6b1kw==@linaro.org
X-Received: by 2002:a05:6808:f8f:b0:3eb:4189:4432 with SMTP id 5614622812f47-3eb94104deamr2159455b6e.36.1734014279394;
        Thu, 12 Dec 2024 06:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734014279; cv=none;
        d=google.com; s=arc-20240605;
        b=g1b88vwYkhkAm9PSTymGxIwRqn7LQxdy3wKmIM6nKcqCm38LeAxNl5B+6vWA9K7ZE3
         ODnxPJoJy/vkZDCTPgyGRu38PSh4+PHu/vewTmHS5uIg0D4FlwIod5ayoAL1fVa4mHxr
         IxSHs+nQDa3TyTdBidKxZOfhmfkJ1I31e7e8SoJvd7fXcPnY2kzn43Q2Kn0UkFRR42ND
         VnTlZ7Nc6rktL5ow60XyHxjCXl3rVLXNaoAOwdHu1QX8i6IjKjeIACjeq9SEPG1tUg5p
         RP3D/ob9lNKKDC7wm3FMf5oPFmzKsm3ifnZrH8qhRXzzapMDzn6Bj7Ukv5zAVWVqvd3B
         WVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WClgGnNKhbkqYl2M5kjAPX27ot9J1JWOs4M4aBmFm9w=;
        fh=c7CG9YSZtaOCUd9SN0cjVqNaKUmbq4y+2FAHkMUcV+s=;
        b=Uf7XPAQTDm7ye2HIH97m1N80/9Xq9g7d5DtzCOfXZ/4jv2RIqKXKThIK+lfgQXode3
         7iMB1wbO2xEURyTOslgX98E1iM5noe9tm86OWrc50FmeL1SwkckshjJ8yCqNb/8IicNv
         aVPm4R9N1Pd5svAYA8YsssAYW0Xtx0bNAmCYjQMiGb0zg4noqzC/iLAuYFYiOEJOeZMT
         uuWnNCuK/60jHuMQ63VvbRvNLGFuliHv0St6w8VY8YhJ0DkE7BPACzrXB1Lp2DBvJKsf
         jJX4uTiUmwQIQ8GGZG1nQb+NQ9iKMPuxpRe/sLCrvvebNt0Hbgx72c0fYIrQS6rssl/C
         AMPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eqqdn9qe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3eba36053easor8461b6e.17.2024.12.12.06.37.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Dec 2024 06:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eqqdn9qe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734014279; x=1734619079; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WClgGnNKhbkqYl2M5kjAPX27ot9J1JWOs4M4aBmFm9w=;
        b=Eqqdn9qem20RwZ/hkvqnBnSjUT3XnmL8Phobs2FNpIRyLCse+t2bn9yl19vOOXHNTI
         5u269fhCmG2iOs0ILO1V+hl4wEkNvbYA5uhfiTPHEPKA8WafNpZiTCvMjSAIlJboiut5
         TZbQbKS3fOzE6IU/FACL0qudOiwy4T0XkgDQPW1y/II26i0r5ErJ7/JUOjrIsaAohcc0
         SiiEYyQWJkCeVniaDcDHbxZce58xg2E3ff+z4g6n6jPh85pUbxRHxYy1qTQHqdSpGqqb
         Z1QStU06HJEt3GHnRTpwgSlR5pDy29ICPexhguzWRPCypiWoyiceS3XoIFghhYStzRxd
         /Nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734014279; x=1734619079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WClgGnNKhbkqYl2M5kjAPX27ot9J1JWOs4M4aBmFm9w=;
        b=QmIbalFI5qT8tHNi7Gt6CWWTe1MijIbvNF9nHFtx9XEw/bP7tMWYnUrR9JbzGss5ya
         K/7cQEnDsUGTe36MkKZLsmzU906M4zTLndtaIjrokXoImw8bpfTiee3kkxS9QDjX2bp/
         Vj8eSPJATlY20AokVCRHMFjkipTpPnsqOfGhY1k9FNm404FLnqdeMaWSs2zf0+75j9B7
         6TNewlVyau0QGBRjFE8g76/boZFVZltO9q611oxI/RvCW/JdbQ6/oHdmayotxCaF8/dM
         OFAo12VFqp/vu1JmI6BX/BN6fFG8FqIPhHcoQ6wAZXh2ug2oRov/l3Oy0ldaA+C4NvtK
         o2uA==
X-Forwarded-Encrypted: i=1; AJvYcCUoekhxK4v/jJvUffP/kaELAczslm2EgLs7W2mWbGoh4YYhuPgmirIf+EEjxDipemOhdmvBqaZV8ovE9w==@linaro.org
X-Gm-Message-State: AOJu0YwIECxd4DwxcIqteSBZh2T/3mHrFiso0o6XxgI+x9sOIWsQpzUL
	QwSa7RpOnNjMMd1Udg3h/Vh7CJbA/OebNyy+Mag8j9yxyWo7gPVfK50H+RIrTn9mbQ==
X-Gm-Gg: ASbGncuecvTUH+Grxa0nhuQZlcIiVz5YlzSgm3TZrTnSfQQi8R3hcAddyT+KmG9E7PZ
	y0U5SNwElxyhOQoStGQFN26px7iY/SkMoNDXYM4ESHHRkjxCl8PQF9C2/fDyzld5v/nlyUQUebf
	BGHyGpn0DbofTS3Zjw5ztp8YcQHZWU62biInMbV7j9Bm0GSDNCWMaqonfgitQmlTezPqsWvghbu
	eP5wCQbz7fPT5ewGipD/Bw0Szxu/XfhcgNZU2Hw6R4silHiQpsIm7/mqw0a6dNFvDFIUo2fg4E+
	MbkucBM9E8DIXUGLPjFyWgZp4sqVG2r036k=
X-Google-Smtp-Source: AGHT+IHzcsNqE4IFEDtNAAVXxkbmviqgknyI1oXeRyYPRBrNN3gZRaB7NkY5HJTFgq2pBMw1QofjPQ==
X-Received: by 2002:a05:6808:1381:b0:3eb:66d7:a33e with SMTP id 5614622812f47-3eb93f95d83mr2328391b6e.5.1734014278863;
        Thu, 12 Dec 2024 06:37:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3eb8d6da3ecsm608895b6e.50.2024.12.12.06.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 06:37:58 -0800 (PST)
Message-ID: <2a83a49b-6863-4fb8-b5de-c3eacf3cdb77@linaro.org>
Date: Thu, 12 Dec 2024 08:37:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 02/20] arm/cpu: Add sysreg definitions in
 cpu-sysregs.h
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, alex.bennee@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <20241206112213.88394-3-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241206112213.88394-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rE7E1KcDzJpD

On 12/6/24 05:21, Cornelia Huck wrote:
> +#define SYS_ID_AA64PFR0_EL1                             sys_reg(3, 0, 0, 4, 0)
...
> +typedef struct ARMSysReg {
> +    int op0;
> +    int op1;
> +    int crn;
> +    int crm;
> +    int op2;
> +} ARMSysReg;
...
> +static inline ARMSysReg sys_reg(int op0, int op1, int crn, int crm, int op2)
> +{
> +        ARMSysReg sr = {op0, op1, crn, crm, op2};
> +
> +        return sr;
> +}

Not a fan.  Why take 20 bytes to represent these?

Our existing ENCODE_CP_REG and ENCODE_AA64_CP_REG macros seem much better, even if the 
argument ordering doesn't match the column ordering in Table D22-2.

> @@ -841,6 +849,51 @@ typedef struct IdRegMap {
>       uint64_t regs[NR_ID_REGS];
>   } IdRegMap;
>   
> +#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
> +        ({                                                              \
> +                __u64 __op1 = (op1) & 3;                                \
> +                __op1 -= (__op1 == 3);                                  \
> +                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
> +        })

Ah, well, this answers my question re patch 1.

It seems a shame to use 128 slots to represent all 9 id registers in the op1={1,3} space.

Do we really need anything beyond the defined registers, or even the defined registers for 
which qemu knows how to do anything?

I'm certainly happy to replace ARMISARegisters fields with an array, but more like

enum ARMIDRegisterIdx {
     ID_AA64ISAR0_IDX,
     etc
     ordering arbitrary, either machine or macro generated,
     but every register has a symbolic index.
     NUM_ID_IDX,
};

enum ARMSysregs {
     SYS_ID_AA64PFR0_EL1 = ENCODE_AA64_CP_REG(...),
     etc
};

const uint32_t id_register_sysreg[NUM_ID_IDX] = {
     [ID_AA64ISAR0_IDX] = SYS_ID_AA64PFR0_EL1,
     etc
};

struct ARMISARegisters {
     uint64_t id[NUM_ID_IDX];
};

This seems trivial to automate, and wastes no space.


r~
