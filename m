Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp506541njc;
        Thu, 14 Nov 2024 11:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtMdhQ9zMeN/x62b2biqnnUy7jfQnPpHFIsqoC7wFSA70MNnAe9SLKKEIAMKjEmsZirrqWuONjKXNPoQ==@linaro.org
X-Received: by 2002:a05:6a21:999e:b0:1db:e3f6:55f with SMTP id adf61e73a8af0-1dc833cb024mr5080906637.18.1731613039993;
        Thu, 14 Nov 2024 11:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731613039; cv=none;
        d=google.com; s=arc-20240605;
        b=MHpOp2j60Y0k2iK6TiBKKPukNLTwYfOoTqDA5D7Oe/GHGx0EoNGYJN2WTrjzOOOy7p
         wEaQPSQqzBIx3jqokMoq0yoJhd/J0Va6mtRUibzLQ/55pRBKsZyrP0fVo+TjmBtQJmLl
         r2fyBMYGGB4SV5p42ve/71Qn7nGG+lk+cDXLwVqv59lMDKa/YWID7WuokM57lOHS8dgU
         AV9wsZX21wxQ7/phRvRMXQOa5RgPklQ5IqgNXNY0BwB3kJqMWyhH7bIdTeAjGW4//bIC
         nDIedwBzVYwk1+JQLrnFDaiuGmGbicW2fpebf5Iewn/gozrsAwtydO/T5pZB+jCSlVJ8
         yXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h9VScUMDwExPnRl1LaPrf3ik6OlripIhAnEXmb6tN0g=;
        fh=xDQUIfuEnJ/cGgl+DY3qi+f7gYN4dWgAt37syOLxAGM=;
        b=HLdTzfL9mZd/tPA4N4awinZdh/yyWS3CIrsz65JmFl/AJv44uGt+RmfmVGCWFkrrPJ
         LOcCxn225xNFVcE96Z+lbUiz+W9g9CYu9e+6V99CzxHi0o0Kgf/DV5xsvakSCcT/2MmF
         Rs65WgdZzxPO7GgVNMdT4pr+B41pn+aySE+DRl3YR3yeh56mYsSBz66zlYKqxu+LQYUw
         K5PPXaZIjzh8qtvi6qxwLpegHeknqyOWwjCmgqeOfkFK2dQiBK53n+BmLYaXim7c+AUa
         7EDUuqAQc/4akZKnL0HSlklVct+Rn+tDHLeyz6SZ4/RZK4Z/scHAgv3PjdkjoW1ki0RB
         4Bkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvAZdD6Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b3574b18sor1104684a12.0.2024.11.14.11.37.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:37:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvAZdD6Q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731613039; x=1732217839; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9VScUMDwExPnRl1LaPrf3ik6OlripIhAnEXmb6tN0g=;
        b=qvAZdD6Qba+IGOnWlYDFVW2finQnQElNyHXXKL1cFhtZF2eet1Pqc+kFsUPrxWTZS2
         zL/GxtjMtgR7gDDiDR0eMz+7Qr5J3SNHylzDy9QRFySWu6LSioKHHf4gA4aghwIYvKuZ
         WP9ruzmn4CritMTPGFbhLr23/F+O6XQvd1xPlWxuAdLgYpy86F490qYLrZDYsd+78osR
         Qeh9sVtDu3w8a4ZfBNCrTspdybhNB7IstpNB+fcbilBzZY/pAZQFt6NGdbgPHcxLZtR8
         RqKDzzD+YiJgaAyuURr/qYldBU+HDVy0S8Vv+ZtH9zEIBDQ5w6qNQZQ6pxo/7906nLUm
         PLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731613039; x=1732217839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9VScUMDwExPnRl1LaPrf3ik6OlripIhAnEXmb6tN0g=;
        b=rECIkQryQ2jTVTqIAr8KuJiu9LmalTXglp3re8m80LQvvSR2F5akADr8v4hqqmxKKC
         4CYIN0z3sAyf9VM49hcfXofMTE7v8BVMTRHQ8YtrN+IfOBJKNQgqo9TL3mXXKHAb5CzW
         41ALR/xlPLBX5r5nF7eQYjkx+7bKBbI3saqqg/MtcJg9GNUwzNKN1tFF/AZWuztpqfXD
         r2L9Y+IeV3eX63T6qT0QByYHp6ts7ywxpWRsd+a3qGW/fRx/cN6KLgNrFkd2i2f3nTlo
         K6UcCYLvDbe9PEcveGrd94FvKqSR5v7Cf0YTT3KKnWX+X9CxThOtAWf1Po1wFA9FdIDk
         DfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtwn2zPus/D+Yf3v1CyWyjFZ5JMxjMPycxhKK7vW9zayhchtTlAJ+L1pf4u3gDxco1DUWrR7wkIdolPA==@linaro.org
X-Gm-Message-State: AOJu0Yz9ta83H7/l5jg6Q5VF3Zp0aIrhKgMjN+zmIpHBDaSnIcWiksGF
	oMsY42gRM2WhWTahLr4WAHHLFCuA+Gwm47mWCZ3HydBuTZzzWFZUdvs5qV0EsWFMzg==
X-Google-Smtp-Source: AGHT+IHP8mXDu/xXn4g3XBqb/mvm+a7Wf+heNGBbYjnFnMF4LSwYHrLw+01UOl5bsXvYz1OjLP9YLw==
X-Received: by 2002:a05:6a20:3d89:b0:1db:e1ce:8eaf with SMTP id adf61e73a8af0-1dc833611b7mr4266453637.6.1731613039479;
        Thu, 14 Nov 2024 11:37:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d064acsm13877105ad.207.2024.11.14.11.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:37:19 -0800 (PST)
Message-ID: <994a6dc1-42e3-4e7a-9d1b-b1c2cbbf9e01@linaro.org>
Date: Thu, 14 Nov 2024 11:37:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] exec: Declare tlb_hit*() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aERFXQV52B+s

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-all.h | 23 -----------------------
>   accel/tcg/cputlb.c     | 23 +++++++++++++++++++++++
>   2 files changed, 23 insertions(+), 23 deletions(-)

These are not actually used outside of accel/tcg/cputlb.c.


r~
