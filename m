Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2645131njj;
        Mon, 5 May 2025 11:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4fycRIHvNMgGAAc+GIXTNXnEXgMouCY3UWuz1oGpeXVppWgG9q4eSt2/RZj/GMuma+3d+FTA22QTqKQ==@linaro.org
X-Received: by 2002:a17:903:32c9:b0:211:e812:3948 with SMTP id d9443c01a7336-22e1e6f03bfmr116644525ad.0.1746470381624;
        Mon, 05 May 2025 11:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470381; cv=none;
        d=google.com; s=arc-20240605;
        b=Yxh8uepIUPUeM9ig7kfuE6tboXmxKd4UNToADWOMpy3QNAYJIw9srqGNUyw+D0XA0y
         Ic6g66vlLgy62KC7II+RJjG2OfwkWGg+VzVCAEZrdavg1NyW/1LJw12Hqe7fcrgpPwd4
         dbwTXHCjmOmF8zL9fPkHBuczsMzqG5gp2+UEp+Fsnts0jM+2b173ekTrvImNVUiyoekr
         q5ApIZk73r6aS/pqxIbFeUlAUmwG36/vNFIC7jWoiD2KWHaQpB6FqwQYpL9VYEGeBs7G
         FiM5ui5vH7XTjvpwy16qRDVkfMKyL7AnHSp9FtRCtr3Jzu8lYhJogBHnLugE/l2XgbBs
         5QyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wjp7WHX6S8/97RAjKa96LznAbJzgoQ0PQ76T4W+qSTM=;
        fh=MZ4xR4hI9l9Pd/IyfQSf6UHv9PuJ6S2+PiDOBsR1h0k=;
        b=BoZ93ZaH4qCV2JN77jOCr3bOzb9iRPUm/f5NBgzXSRYwP85yyzVyA8UuAucX101LxK
         Oum7sNEDwRLJxjwaU7KVrtMs2zkwZKyGZpxy3VzXpeSsiqDR1snetVprefVIPFVVrXZH
         tKHCMOoF/xi+qVNHZJXJcJaPyq7QRxPsiOYmu8WOQts4gIXgO4oaSH1VFPtAfL3nocwh
         QuWWVJwLJIOpNArp0JYM8rnONrl5AL2pfuU0wg502DWmg7LFLYQmMUk0R12TFH1MNS1e
         c1wy/rIbH2J9ehODcAyTaiQPh39luybTXEBfO3Q63n/7jg5Zjd6KYPMt91+EQDrAulbp
         CYFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hN/3FIYh";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a249sor4524766b3a.9.2025.05.05.11.39.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hN/3FIYh";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470381; x=1747075181; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjp7WHX6S8/97RAjKa96LznAbJzgoQ0PQ76T4W+qSTM=;
        b=hN/3FIYhZEiKUAmXSNfc8pJ/L8G0MYlUOpI2jIWwukUSSFEhzJ00Y6VCRxVunCCpdV
         fEpuqRP75dkP2rIr5YEAxmEULNDhiDnztXdAYjwpWAManDSOgUt1Jira0wgB4quUClBI
         D8bI2RSkEDzHJI6fXZdC49G62Wjqg2NhMcij35WJSZetm9zBDlfJebPnG6XLjbKUcMUB
         +KYVUe0ME1Tjd/nm4248bwqBuunmJJ1Yti74YO4ti0QZJnRMuZpnwtQJraSzh4nh/Jav
         bRodTT38e7pM5H10P9zAJeIyayo6v4zLPdyujY1iO24mkQJ3V32rcSTqYmtHtj6OOSmg
         q71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470381; x=1747075181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjp7WHX6S8/97RAjKa96LznAbJzgoQ0PQ76T4W+qSTM=;
        b=RlA9Ljo6BuWNhEmT2W0pn1Dg1j+SPCL7PYIvHqCzQV6pOe3I5nAKGyqjFOYAaBDAtB
         WYVKVYWX/JsUDjCH3qqW3u7GWZkZdIoOxZUCsfZ+bTRNLxqdiD9q/DQhccjPkBW7Nzpq
         dITp+yIPNIPyhrxxz6xc+mumBG7VSTpZcuBuC4M1lQxiat+RyxKGVn8KGOQ4i+Hoaq/w
         uL7sVlVvn2/0Fc2sLWKU7inu+NXsqhX6qTZGHOhe6C/RpI4NjCcGX9clo4YeRwsa3BrU
         jHK/TdjUImMcxp8LreBTK0LZM9zVpesHrtcJYax/9UXJQs53N90vFKd06z3V90nnQwV3
         yccg==
X-Forwarded-Encrypted: i=1; AJvYcCWtKrO4yU94YfaYCYSq79ikljh7NMisoLMLCtBILIFIeyoZACVSBxR6Q1/7hJwVsRL4wxg9pOnLJPUIJw==@linaro.org
X-Gm-Message-State: AOJu0YwNUEzrR6wkEf7TOvR/40x4z/DL7q0DQ0f7VEcQy6BPfol9eTG2
	R/8BGVATtdJEj1r42+qWvX1xlZ7PwD0NtBMa7X4g+lwRuPfkjUIFLRHGzzQtCFlzHQ==
X-Gm-Gg: ASbGnctik8ADwT0tcuWPsNChgliVw6Sj/SHS3lhPo9sTId7bfeItSPKOg4wZFXuCUrW
	N42N2RWjSP7+NbAW3oFyyruZ83rI/SUS2YJIML6Zn3DpDcQSayDi3wy4pMDwC6lnmwuatX4Gn7L
	FNgUrlFgUmuMlq07HLHVXf+wWw4dCFwY+Dh9EX3rC2rFsKTJ9XPR0nT5boyNqEnO7ge+P0cPojy
	NQK3zAlvEozH1qWyQVv3L8Y88NxayHtBHejaoQ96YALhu/bty3OnsscU7BQg1iBuXCaDnOhdtWQ
	hVVam7TfG1r2PkWw2+3yB0XFqUAGrTh1IWYK0I42pKSD7TvKG8JFzwoP4iv1i6qB
X-Google-Smtp-Source: AGHT+IHIyGDEwNeuR+yUkZvgvcAQgfoZ8WOvYMCeAlTVmL+ZY9t98NrBZlqA2uVThyjTLh1YetB/tQ==
X-Received: by 2002:a05:6a00:2a08:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-7406f179679mr10222756b3a.17.1746470381196;
        Mon, 05 May 2025 11:39:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df43c8sm7188761b3a.84.2025.05.05.11.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:39:40 -0700 (PDT)
Message-ID: <a365d727-8bdd-4b27-a763-08c5b3384040@linaro.org>
Date: Mon, 5 May 2025 11:39:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/48] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-2-pierrick.bouvier@linaro.org>
 <dc27e3f6-ceac-4e05-9652-28634d4fe73c@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <dc27e3f6-ceac-4e05-9652-28634d4fe73c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: M7m4764oiXdj

On 5/5/25 3:44 AM, Philippe Mathieu-Daudé wrote:
> On 5/5/25 03:51, Pierrick Bouvier wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> CPUARMState::pc is of type uint64_t.
> 
> Richard made a comment on this description:
> https://lore.kernel.org/qemu-devel/655c920b-8204-456f-91a3-85129c5e3b06@linaro.org/
> 

Thanks!
Once your updated commit is upstream, I can rebase the series on top of it.

>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/internals.h   | 6 +++---
>>    target/arm/hyp_gdbstub.c | 6 +++---
>>    2 files changed, 6 insertions(+), 6 deletions(-)
> 
