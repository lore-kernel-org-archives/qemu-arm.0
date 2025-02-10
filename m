Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2116118njb;
        Mon, 10 Feb 2025 10:02:27 -0800 (PST)
X-Received: by 2002:a17:903:2309:b0:21a:8382:fcbb with SMTP id d9443c01a7336-21f4e700f9bmr244176825ad.25.1739210547125;
        Mon, 10 Feb 2025 10:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739210547; cv=none;
        d=google.com; s=arc-20240605;
        b=Yv48Et6E/mfwnDD178XbVdz6MYDQ4Wlt3G/ldeh8uxTYMJvEVeHEfIjDhJJNYG7U0j
         08v36i5aGjJKomFaK2K7mzcZ0YTBMW+tAJWzks1fzFQiiAA4qtivwNsFXAfAFTZctYCs
         YwhYHaPZzwEwziKrqQl2BPzQiuFjpAsNVt7j8ckqKtvX5qn5UgYmdkQqMrg6dUc9muIr
         3QqeFCNmtX9zOPIfSsUTiWD9WGdmf3kviuBXbyisLEZS6n6riKChPVU5lkuKCXMvU00J
         kIQhDdpk1x7hh+Fz05HqN9fLNkKBKgzP1Mw/WsnBqYmShAfH4dbEA1hJLuYLZVercUPQ
         o2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GXLzL+fxgCYHVIBiRMynIEKruG/VmjYHXCYabfpGc00=;
        fh=fv+ROE4HiGsWsBqO3fqtt2wBIXtZNI5tJgr+jSCB8AE=;
        b=be83GYLk3WxZmKuNOBKl0WQnf7gGHGL6sJgc0Be850ci5OuyFwirJ6ajPWV8xZsvPw
         2uC35v5/i0FAbRFxbUYEQX8RK2RKTzlrlxmwLru9dQ3boquiMseQyNCzzguDiafg2yC2
         wJ59p3RfCNdXZ4h34rW+zgVkGEfPZXOkkpqbfQ5sqiOfcS1seWb8vmAlgPKXIcCHj0mp
         a/cb1p++AJyzNDAtSsKPrN9oVBMqPXQrZQRR6b+C3lhNqPddcxsvZVnP0gJjo0mGVzPL
         IL0JiMJnITWHXrryvL80usHTTiHOVW1KOsvS8MG3MzbU/BbsTEw6vXCIGCBimJoe7FSB
         a3aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPrcVu+e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21fa8d59080sor10632995ad.17.2025.02.10.10.02.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 10:02:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPrcVu+e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739210546; x=1739815346; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXLzL+fxgCYHVIBiRMynIEKruG/VmjYHXCYabfpGc00=;
        b=OPrcVu+eiUFGT1Suv+DudD7Q6FSCItcXbhuWEKQROTwBYHvvzJL+G9dcMsKOVzRUYn
         fJg7oITFu3n1jFXLHhy9MHt+ceVsZ2wEJdF++DX87EX2eJW79p8KLf1I+rfUXZd6S7np
         w6/pBqOKfGG8YY+5qgnhiQAx4ZbZfyEJGumqsxd0gWhsewla69zOKC/6JC8HO3YI7gdW
         fG462nVgmDH4wGPHywGchH4D2LGGmvEOAwvE+XnbXelWOZkgXxms7lZ6QPXVBcE8tlSs
         dwvrY0EhYXsZrYjA6IApQU+BitOpvhrO4yJObsD/CWwdqBlfaJJ7X+t2dm4mDOgr73Lp
         BQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210546; x=1739815346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLzL+fxgCYHVIBiRMynIEKruG/VmjYHXCYabfpGc00=;
        b=vtOLoxNDCvkaFco2Py0/A0i4OKpqJU3+vVgUnRUTRSCRRuvm5NpDf57h8kqpkKHu77
         0b/+UcMf1FvR9EgkXtoyZLlpSr5223JRgidZ+6UdFkhVcdKM6gD7ChOYBoWRnc0ajK35
         9hBnFZu+jjR44f/NHWWxswaXCyMXDkEqrPfGmsBcGh60f9irHRoLlvm2UGavTA/jF/0i
         4ojup+buTILP201sQoIy3xydaBECIXNNs8UZ0ja8sviWftsQDYl1B3+j5A7H4iV70zWx
         oQ9y3jxEAkPwSOrGUcPQB1m5UWXLbzWIak2DqOmbpz4kTVA7nqfFSGUzehwqDa9hNedN
         aBRQ==
X-Gm-Message-State: AOJu0YzxnAJ1EzNJSvUfwme7v1smwL9p7rZ2fOAFKhJYKnWkH7ddIiUF
	3yNVt7SF2P7kC/tdVMT5S6hZmFcusY3jq74Su6NGFM6VXLes+VkDX1gmAyhPncCoPQ==
X-Gm-Gg: ASbGnct4/Iy4FCrzZoWH0kZrLtMV69icqJ5bagYDLyHuU5fg56SLVLZVRN7v0WztroI
	8fRoEp7ruk5OUhAaNe6Y9G6styO1ncnbVQH/oazGeWb/xsNGV4isEpus+xQv9KgpuiXLUyZnHS5
	czF50QwAr+8cwOtNhNEQ4fh1k5xrJg5Vc+1VJL2rdMErQYTeQlJhkCLEb6A1EWSkHMXDQaaaHcR
	r6LS5JKI5bZgb8zicabYCLuTnA5BOKb6PjEEIqyCQSKApYK7vDWH4wzGdwOB6fnDrm6+gelT1fe
	4ulGq3+VZrO4W1aX9dGBdQlp8j2tzewjuLJxoAjTZRKY/CNnnWHL5bI=
X-Google-Smtp-Source: AGHT+IEd2NFCN5lxQ1Ydu2zrNS1t9mrOr0B7GW1RNTOlqmArWB4iZmXspJXFR+qCbaew3lRBfbAs2w==
X-Received: by 2002:a17:902:db0b:b0:216:7d22:f69 with SMTP id d9443c01a7336-21f4e7799abmr248557505ad.50.1739210545155;
        Mon, 10 Feb 2025 10:02:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6b5sm82210785ad.46.2025.02.10.10.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:02:24 -0800 (PST)
Message-ID: <5a6db5e2-d551-4f83-a181-d900b68e4f6f@linaro.org>
Date: Mon, 10 Feb 2025 10:02:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from
 timerlist_rearm()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
 <CAFEAcA97TpSfRVpNOg025GMw3pduR+73gr2LDmncoCpTDfV3jg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA97TpSfRVpNOg025GMw3pduR+73gr2LDmncoCpTDfV3jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8Q0rcBi8jffv

On 2/10/25 06:08, Peter Maydell wrote:
> On Mon, 10 Feb 2025 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Currently we call icount_start_warp_timer() from timerlist_rearm().
>> This produces incorrect behaviour, because timerlist_rearm() is
>> called, for instance, when a timer callback modifies its timer.  We
>> cannot decide here to warp the timer forwards to the next timer
>> deadline merely because all_cpu_threads_idle() is true, because the
>> timer callback we were called from (or some other callback later in
>> the list of callbacks being invoked) may be about to raise a CPU
>> interrupt and move a CPU from idle to ready.5A
> 
> (oops, stray editor damage "5A" at end of line)
> 
>>
>> The only valid place to choose to warp the timer forward is from the
>> main loop, when we know we have no outstanding IO or timer callbacks
>> that might be about to wake up a CPU.
> 
> This raises actually another question: should the call to
> icount_start_warp_timer() in main_loop_wait() maybe go after
> qemu_clock_run_all_timers() rather than before? (Haven't tested
> whether that breaks anything ;-))

It seems likely.  :-)


r~
