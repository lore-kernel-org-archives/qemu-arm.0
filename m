Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2098373njk;
        Sun, 26 Jan 2025 13:37:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhtJdow03f9tirtL55Vv1D6tu8zx5VOFpcPs4LKMacdhlbpSBWpwnW/iFcm2geBP36+ANGHY3Dsr3DDw==@linaro.org
X-Received: by 2002:a17:902:f70a:b0:215:a7e4:8475 with SMTP id d9443c01a7336-21c35557a0bmr666988225ad.24.1737927447852;
        Sun, 26 Jan 2025 13:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737927447; cv=none;
        d=google.com; s=arc-20240605;
        b=baaeuZ5oADpZjTGsP49/EZ8Qvk1Ej1lPTY4PC0C2o/IL8nVerSlRvB50fjw4DeXP5Q
         juA1svLmwCG2W0pyk+zhB44PuwBLUKbKw3SBeKy42LB8lRH47SRzrSf24DJ7T7472di8
         yDENUyDJd4zkwySB/8m+6Wp4OTmO2oO07JVfVlOPgI76hoMAs3KHvNbVbohdRjGbz91w
         uqd1gWl/8glWRmIn1a5GeBB8V8xJgujHSHU9yabbiInMkeOwr71IACSmmv2SfD4QmutR
         +ntl8O3hv34OCwnIW0T+kRlKkRyxedFvZLT5b6bNjL3hSU99IqJXoKA4aQDtU9CzaXIY
         R7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
        fh=yCVvFriSVQdpXFLtQPSDiBh3/HA3hsJ5nmRAgBhAgBc=;
        b=cGKYLeG3aXc8lYXc3Xy5Yb1o5t6ZxzkOZpgZNpSHX5cxs2xY6mRDcO1uPpezPhnF89
         34Ge6vWaYNB87T2hFx6o2YaW+pX3QYxAnXlrTivb8oHlMJYyqUizj1eBx5RUShFqodpE
         jTR/sbDEL6BA6PuN4OuddaBhwidVDJOmi+27KLzET0tREsQ2tHDSJ7hdljlkihlWDgqo
         0dHTeD/8f1Xx7/8ENLYauB4ctZgI/tz50P67+kyo1KDhDRNffmUFCP5YaRm1WR3vf1ze
         h2d6+QekBkaIJGwJPvX4MaAoZ/GxwWN8rJkT7avifTJ7R3r4WQiH/PX1uSiXBp9Ecz1U
         +sGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VsXdTIE2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3da444csor37963555ad.1.2025.01.26.13.37.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VsXdTIE2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737927447; x=1738532247; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
        b=VsXdTIE25VqsYq5ujA0SCl+xnMr2PnneipTPcJpNA044yMeAZ34sleervax+cZAd8q
         UdJl3K8lqCoqB2pzUOF095PK53qCIolNSGkf2Cl4FAFFzfLExJ7VwXg9avPRiZ7R59TT
         nWK5HoDuhhakcbXkSV5htTEN4hAFjdtPXQOHIOd4OB40E1ezOlXfjShwL8ZmhD57qijV
         G1ckIMXi5J2diMnb5+KXMo+USnBn9efnnvO2jJTuvF5EJ2iL+QnG06fdgpcejPmELgMB
         LaAQDg3so2EOlSmK5vL7k4Zy8pmVAlwkk5v5WyW/ITjwN5JyYAz2RPco8lqezxanHABV
         WLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737927447; x=1738532247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
        b=R4FwAjIGj5TcfBjdnqViGR50S8yVbjPs5UNF+CVsCNz+irfo8g999Kcud43xHkU8O8
         U9sgHhww+rarbYaRsw41vdovwFt2EAgaA0/YExUWfsPZvE9Z/vJaBfBIDB91H96ZjUYv
         uTbjN+6C43upHZGM0m4RaFCHV9nBVppuHLC/w/DAX9vUdYCNOQLhv6S4qjH+d4MzQn8Q
         OUVyAx6zeo73A6EMuOUtragU3slQ/kzqX6XqHxkQ+B/CsBsduGiukN2L9Uj4v01g1ES5
         JwkmxsdDY7xhFc9Moh13so/t4nIbCeuuo9K+tMTWqOAbcbAV+hOX2wrxDO6FgjL56CM8
         3biA==
X-Forwarded-Encrypted: i=1; AJvYcCW7yDSYoyy0D8bu0ZOUU49ihX24cKwVyz945JSE9EcZvVl4d7Q8dRlI6ikF3/43Vd9oUlcwKF8GtG9ktw==@linaro.org
X-Gm-Message-State: AOJu0YzTKr5F8ClzILPnERlzfBTK/wqbwtQFNMDnO+Xcdq2c1LMIxJjw
	/R+QgelSktwjQqIR/Nv5FrFQASx9kgN6OZ/RTIGdIdg7IqDXqSs4Aj5hiJ8+ycN+mg==
X-Gm-Gg: ASbGncvzXzFFFNuEdCwCbqXMUcLYkdWXSERh0p4mRlhKrjoWd8jZLUdPutHHHXatF9U
	204tW5qSt7U/kiDUw3QECpLqaamJz+sAe/gLo4AVeqkpY/2V2mocPvF1IqBAftjsunxrr/gtl4P
	/dHizVzzXWTF7dlduCt5owlMgo+//uVOCtZ7A5BxjpU1+lqeYtZvpI6678djuAwJV14pA6m1yov
	bapITRby2LXHfbSVbsnvowZbp3pir/spbKhTeBV3k3ovKonfYAwu4BHEexiA4sJbEOr+GuCTu1O
	/OJAwglElSS4TePrWiwyT8HHgkLAYZgkEF5dyGBUn+1+Y2Q=
X-Google-Smtp-Source: AGHT+IFiuSNxM6E2NLFZz0UKT8aL9HnJkIEUZ+PxBPmebPJCN8+PDu1ajnV9q5XziLSw+N+w1RiQzQ==
X-Received: by 2002:a17:90a:c888:b0:2ee:f687:6ad5 with SMTP id 98e67ed59e1d1-2f782c5174emr59291165a91.2.1737927447421;
        Sun, 26 Jan 2025 13:37:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf896csm5651556a91.34.2025.01.26.13.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:37:26 -0800 (PST)
Message-ID: <46ab28c5-d417-4b83-97d2-b2ba49f7abfa@linaro.org>
Date: Sun, 26 Jan 2025 13:37:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: a1JYiNfkxRp9

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
> methods don't use any target specific definition anymore,
> we can move them to cpu-common.c to be able to build them
> once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Eventually they'll be absorbed within cpu_common_[un]realizefn().
> ---
>   cpu-target.c         | 30 ------------------------------
>   hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
