Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3713922ejd;
        Sun, 21 Apr 2024 09:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCUW9hE5xaRdI45VDYxt5OTfUUeO8TUEQVpvCm2D87Z6bmlq/A5KgGKrxbBLRoQj8Xg69Wnq1in8S01/q/j4aiBUjSHoBC
X-Received: by 2002:aa7:9a0e:0:b0:6f0:c79f:c844 with SMTP id w14-20020aa79a0e000000b006f0c79fc844mr9448210pfj.0.1713717300260;
        Sun, 21 Apr 2024 09:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717300; cv=none;
        d=google.com; s=arc-20160816;
        b=W+6GCiU6RN2f9FhDWzZScFgooKGey7NNpRcVAh7Zd0XZwh0SXheL0fpBg1AGxr+cj/
         32yh40VUa/9GGWoCLkkQI6xZIun1ccIXM+Qjhqx05Vy8Epbljc9SaAVs6HXs495/ODhi
         v2LknbfrULvbEOLVSfsmQT52nFbJGS81PAMFZ4z4JwLsYCVie8isxyj8oZmcnfDdVajS
         NJJ3OHgWbTJC7hFbXFdNRuH60LXOvlQo0UDaYWfWCoqTMMwmi6E2zg71l1cm5Vci8BOq
         gH8JMwFS7akH2AnwahlIewY0uxKgG6z4S7vpFUp1t8OaHwLy+EP1Q3xTQKN6VwmWZP+0
         iKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q6t9EefEmzisuG1L2p4hGtTQ70qJuaPEx74sbOjwAts=;
        fh=AwxSJwldoeud9ZMrehEcYlmhClJ1lFgdo88iC5KCte8=;
        b=K2+ks/T6bIXGkI5j/HabdMsu3gjFh2LHKZ2xqOFyLZXFZNyBRbXyR3TVMGJSnhdJXB
         eZzIYxlgXUHceuFxs9CJRe752AUru+lYCG3H3VaBgUUf3zoSDkLLafiyUwUlsyyTCmyy
         Y7Mr2L2fB5ugNXEWmCC/5AsVbM8zH7KZO/wzs+uY6PX4C+HXGbacRqTTq4AqX9bgfeZZ
         6fDSqMpvJ5MDpmON//pfBlwIb3J8yZp030cwpzlsneSoY10GmLueycuSVLE5BFjqK/uJ
         U2wgFdu2rujPFb0pohF99O+K66DP9uolLiKrDnW7NW/4tnIqIS9ygsCGq8pYn1+cCkYL
         68Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6C7UIxk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e16-20020aa798d0000000b006e9f3c5683esor9694648pfm.4.2024.04.21.09.35.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6C7UIxk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717300; x=1714322100; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6t9EefEmzisuG1L2p4hGtTQ70qJuaPEx74sbOjwAts=;
        b=W6C7UIxkNV13ub/zLSuICWiYKtTkFSHhEO//fAcEovqn82Dtbqt1TpWzBqiIjnUpWa
         oKT/JAJtgWqb4eS60F4kG3XXHI+73WEjCV19FsHSdvAu2u/1eBs/wemLRScNShqkHiPx
         SBeZ2pUFkBoXKzEihXrFimvA8Luh9KVmZjr5rArhVINrY50q0pP+DDDAIzj3b0PwaXPV
         NP9L1YhxZLCLege6PbEEXKipur43ed7XdXANA9sbXI5u78bBl622e3/R4GXVt3FhMPGz
         Puj8PHwmH0w01C4UI74IeP+fuBAT4EV4MSSHMcTbAky+glbKIzLfd+1kAafFGVtnYzdF
         6Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717300; x=1714322100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6t9EefEmzisuG1L2p4hGtTQ70qJuaPEx74sbOjwAts=;
        b=Efaav/QxwMBapvYmfpFJJeHH8+hzq51NKsPsDfDR2QM/Eb9iwGRaUCKYR+I9FmvNii
         vwRU2cM40a5yBtJcOysJbEcV3kkUj7V0h+n3fBq0UlXIaMi06V55E0M8G4MCpxCwyRGa
         hW/5FU8NOAZBA4GJzsmJAb70YKASwYIht7SX9C3zrwHoCcIZWq3ULZZFyl1LT/vr0ldf
         4Sn6L0dtf14hF+6iUcfOCuGd/AvGtlRSXr/afFsMdWT8N6EibWdrnDUonI093uVTd0It
         L/e2OeR7cEkTLIuT2PQGTE6lHZg934VPC/xphPiw0ZizjUIlwmBinQMElpmhIiE0bCux
         ThWw==
X-Forwarded-Encrypted: i=1; AJvYcCXJBkdMgOWufQf+2j/pxk0JT79kS43pKu7xWyeuJ90oYXhanarBjKHt1vVF4qamefu5Qbad7y1sXYzCtRwyo21+kwMM6PJD
X-Gm-Message-State: AOJu0YwCEZRUYlcbgF+ublx/gt8EjKIYh2Vi4E/qyyUBwp7RdKfiNUQ2
	D+230rUeol6DPsvxERoncu6CbPZpvl730ThoC+s54RzPGylL7ZMvbGXy0rKvwDK78A==
X-Google-Smtp-Source: AGHT+IH7YQdim60+w8EMS96zvtkJSJdEYf34/+Dc/fkRjZYLoIdv2EQ1QOt2nfLrRO4M/uy7oPdm7A==
X-Received: by 2002:a05:6a00:1910:b0:6e7:4abe:85a0 with SMTP id y16-20020a056a00191000b006e74abe85a0mr10548531pfi.14.1713717299699;
        Sun, 21 Apr 2024 09:34:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id k17-20020aa79d11000000b006ea858e6e78sm6313352pfp.45.2024.04.21.09.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:34:59 -0700 (PDT)
Message-ID: <d69a848b-0450-4058-8167-bdca2998d924@linaro.org>
Date: Sun, 21 Apr 2024 09:34:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] physmem: Move TCG CPU IOTLB methods around
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Peter Xu <peterx@redhat.com>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OMNqdOIIxp0I

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> The next commit will restrict TCG specific code in physmem.c
> using some #ifdef'ry. In order to keep it simple, move
> iotlb_to_section() and memory_region_section_get_iotlb()
> around close together.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   system/physmem.c | 50 ++++++++++++++++++++++++------------------------
>   1 file changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
