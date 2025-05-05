Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2630145njj;
        Mon, 5 May 2025 11:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFG3qAT/c7E70GiSTrHQPpfwygUrY2ef0zmuiHRpGR3Vt73/fazbYU+LSrNHZEEF15HG4ENyjaT824ZA==@linaro.org
X-Received: by 2002:a17:903:f8e:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22e103ab5famr233949715ad.53.1746468935313;
        Mon, 05 May 2025 11:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746468935; cv=none;
        d=google.com; s=arc-20240605;
        b=QK8sFeUJATTi5Pq6YzUgnVLvOJJKF3Aa4N5CJz1DA2YKhv5dHb47rXvfyXBwEM4rcD
         hMSWtiq0TbNjmy5Qf4Ox4Fz2sjmDrW2V7ufNDyN+BW1/7JGjaHXIKhMcvlELeNx/Gk9N
         +UyQ2OU0sl/v7K0v9vOOMYYtTHNhtZdWz4bt0PxN43fH+EzgI2qWjFHkJxXlmHDdzOck
         FqIa5ThYcAwCMmwY79CFtO7w6Zc6+f+PIiHLsllXa/nz/NUG/M2kkiiKWLnG1A5lkMsG
         tSfO3R7O8YwvbctpFnhpSNbm4AFHvkBvIfRdzHKiH/4mo9GwYWhL1WA21Gqe5x+hVkL6
         MLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Kd6gV1USLNd4p4PNo72gWbrU36bQLzdDoB4a27U1rFM=;
        fh=VNaCftM8iTDTKKkrhmbhnJkbjq1pQ92CclDYMIKGeio=;
        b=kwUKkoLzFh1LVfV/saBvlg5PUqU5OXhDzS7gtzAfqRzCEHZ0NWw9PvEV2KYUTWv/nv
         Tc5c20RVT2Kq+YfJTon7pibJyXzJSFNZFgK8dCLamqPpFa3LYZQB+zyplfg7K8psMLpi
         T9Uvc8NzY10+xia5LWRjmKpfHJM4GtDmWsdy2dxuyJzR4NABEIU6zolgBhC2vaW6Gvkv
         XCWtm1XSesLqAAO0UJ9VCd12IWtKvw2hLLA32jl2Y/HKN3LAEU/zfU4M55yHjEANRbu8
         Zd+vaY9UOvlfmUS7Hxmypg6mEH/WjeJAUzgUkbrkjQEIeT93/hpXx/OzETCs3yGg08Kj
         BLng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qv0JuED/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7ade0sor59946115ad.16.2025.05.05.11.15.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qv0JuED/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746468935; x=1747073735; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kd6gV1USLNd4p4PNo72gWbrU36bQLzdDoB4a27U1rFM=;
        b=Qv0JuED/fgrvgPQUGiN0FlhruBpRsklRhp15XySb5YVSmlsKIdOiXWFsgIrPz1fQSt
         oPGYnWs4qsuUt5tLmHUC3tjKc2c9eGofxnzzGCoOFtFiDCnOK91DKJxFOvCSV6+YYR5b
         oyReTQQ/412KSYNyN8LVkAhxHb2GMipR6Fbg+94/aVov76KEU34HHUmWrWK1/Dp9W3lb
         lqanpDBdBCL5Dr6jIdM14g5+8YM7myfMG/TfLjJuLxI1guaF5bIiDqieIMWJtG1d2p4y
         T0W0NNeXioiROp1KEiM3K9KpjPRohC+3/MKldzsUWlk3Ixu6L29HP3SNl+78TQhfQ130
         NtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468935; x=1747073735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd6gV1USLNd4p4PNo72gWbrU36bQLzdDoB4a27U1rFM=;
        b=Ld7SQIbOmW2IRLaLB790S/Pj6whVgcZqK/r8UxuXF0pU9xq1c9RRcNjxXL2OAhzref
         PTzyELHV7D4GnchtKI7k4Ar4YzwNNczqLD8OkVJHsdRVnzPAP515BGh0r0wT+cvigJ+L
         w97CUOC3qc9bm/WuE9REVMDhRavtJG94d56sSiwOK+EjNrC1ZRmUToj4AQi2skt+ucQg
         0SjS1R8H6ROmdObA4aHhRf67VFj/sBlxmNlyeahhcz2h2pIRl3hol6JQ4wyQr+avdY8v
         uFCQvB7AM4ia9uDhGQPu2Py1l6oXk5mIQGvPc7u4sT4E1mtns0Xkege0ngkJOkwKRIjj
         IiIg==
X-Forwarded-Encrypted: i=1; AJvYcCVci5rMUtxbV9jeN8SX7GRY8MrxsPEvQV6Y1d1Lj6pwOSi4F27CqhyNgq3GL3gdTqA6UQrjijkbOqdZow==@linaro.org
X-Gm-Message-State: AOJu0YyERDS+4PcgJiqmiMjxL1XAxdjG2fcR4MEKo+JvCFZ5qZT7ZXEy
	YeH7Fysc8ZhU8S/BzsDnh/AL7MXsR+Vnfnboefns8NRfHwHQE4ZuIh8+V08qNkFqCQ==
X-Gm-Gg: ASbGncsyLCh6F8aB+UPAeAD/ICtizP9VVP7/NkrZN/P6nuFKzFmvbt1lpUq249WZlzk
	54TWvcX1CYgATsEE65w1QmcBy5lRSoJwcHBAgJ7Y9yNsaJbwux+AymwFzq8wAA0DOqScN4MYh9l
	SmStjWW958cFOwRQeQbxmYHDljZFFLBhpjm0Jp2XyWhCKbMgJsVYQoOjC0HN3vU0PyLyjudXY6l
	9iS3Y8prwlW3QO9iXsxJLG8oHM6Ky2b3miVWZNviiyMKahNMfnsyZU8qO+J9n4As1c9WNoOr6st
	DOJVyl0lY5+b4fZecITJiavdPVCD1H+5yONtarlWn9TqZsIWczwkQx7jqnF/GFQZ7gnRFZ+SLdO
	WWcu87Hg=
X-Google-Smtp-Source: AGHT+IF+qPu0gNAX9hw7En2FMcjF10KlwzTyrbe0+ojnqQ3d4oNSY3U0Ki9IYrYge5zoB6d1Kdp4xg==
X-Received: by 2002:a17:902:e84b:b0:224:18b0:86a0 with SMTP id d9443c01a7336-22e10355d3amr212805815ad.37.1746468934882;
        Mon, 05 May 2025 11:15:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae07sm58227335ad.8.2025.05.05.11.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:15:34 -0700 (PDT)
Message-ID: <87cb4a90-25d4-40c5-b8ae-ca8cf9080d5e@linaro.org>
Date: Mon, 5 May 2025 11:15:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/48] tcg: add vaddr type for helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sQzLRJtO0AjP

On 5/4/25 18:51, Pierrick Bouvier wrote:
> Defined as an alias of i32/i64 depending on host pointer size.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/tcg/tcg-op-common.h    |  1 +
>   include/tcg/tcg.h              | 14 ++++++++++++++
>   include/exec/helper-head.h.inc | 11 +++++++++++
>   tcg/tcg.c                      |  5 +++++
>   4 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
