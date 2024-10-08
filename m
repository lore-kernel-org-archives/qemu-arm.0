Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp362993njl;
        Tue, 8 Oct 2024 10:51:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrS3ZZERP1GhdO1SbXtU4AMOgGoBSqcjMWt5jxVvjEqEKRjXwd/XTv0KnjTc1cK7i8EEYgsKbNJq896Q==@linaro.org
X-Received: by 2002:a17:902:ce88:b0:206:a913:96a7 with SMTP id d9443c01a7336-20bff04acb3mr219826755ad.44.1728409861710;
        Tue, 08 Oct 2024 10:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728409861; cv=none;
        d=google.com; s=arc-20240605;
        b=lX4amWcLsy5xKHFri2CxrSNWg+LNb4t4/+NsD0BoireJGv6XgQ6AoVEY5sIJRqCSR4
         xS8kMXExjlIWin36uXYtIqEwPaci1B89XE1Qq7s5ueTqH70Tsdi4YLJhUPEHa0okJLne
         baV4RUBdWwEd6IMSlSg9jG+yYHe0f9TysD9xwikp4CVMpF7llaiVbqDkU+KOCanV8UCS
         e/VipVXdeBKHgBqxG/iZRIjw7XpLdJFIaGJZHDuH24By6LWrpxM4fvmkApKHSBZ7L3JH
         w1SdMeGfyiAyYmhxR6BJCxQ3OPk1CghOiE14IzUghpJeQEkhMP2lw2y/jfxheV1xqvXZ
         bCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u61rbn9oStn0Woo0fYr3gUc00N9GLwZAKPF4sc2tom4=;
        fh=ubnqHwaGF+3WMJzTuPcz3r4Zr/44StXlirBUYggS4M4=;
        b=EsVeONcjElIGB452dTEZGWLtDyMLovzr8n1uPOayCAtGmdH3+YK8Pd6thMNXV0Xa8s
         QJ7s/ftCdvkYoeos5u89ApRiJ97zwrMNVSV0oH8FUKbZua5vgdQsmXiqWCTJZuGwkvUF
         47Bk0uAC93392oMQ+hveY9bgiLBUgkiH75nOjA0yrii//deTCVEkR7w8GX+kZr9fN2ea
         bgQ97HqAAv+xRJp48bpAPBfl4awvV405qTISLmZSqyAwJpvbH7QxPrwEenykteUeLXX9
         iiNertsR7q+AJuHLxQ9fZOYKV7/U0+Adp+y14IiHYTfnXaNUzodMo/hOOmv7kkXRQFgh
         J0IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNOHH32n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d508asor43998505ad.5.2024.10.08.10.51.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 10:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNOHH32n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728409861; x=1729014661; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u61rbn9oStn0Woo0fYr3gUc00N9GLwZAKPF4sc2tom4=;
        b=TNOHH32n5a90Iqvyq2fXanpLcf+zY3pQIfTys3t0A2y6pvcNME1A8J4rYTHgYUIE2b
         7sO1gl79/B/CYZYxboLo8v/0MmBAitIqdZ3XvAm5MUHkQ38GY3zxnrKA9E0/C92iQsl+
         GYcplXh9hldv9WCayWLsXm/Skvld4Z1OsDoqZAyWznAkCns+Pw4fT8j7qHEsAJF01x1c
         K2BqtQaPeY0WA4VBLb/SBHivbyGM8VX0Yf3tBkf3jc4ip5IwgPIm2LP+SmyKYyCW4yNG
         OmvNeIiiwK9PfIeoIjfVzFUlWSs/f9Ys2V0jkbXSJDOW0VnK8Ji/J004XwD+cfVpdSg7
         ntLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728409861; x=1729014661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u61rbn9oStn0Woo0fYr3gUc00N9GLwZAKPF4sc2tom4=;
        b=Wn6MgMBbImV4LgVjeDHS/yKSp0sJ+eKrPxjuxScLNHpS9x8rDB+CUzrPP6op1DuwY7
         2ioiYjW3sDu3cR5Jtw49xipu3f6GgbNof6Jvc7DP1ZhjZcUnRN04pAv7c9FV/Y7eZJ3v
         QCN4v62bkZanmCzJ054gwWIATT0rboy1WjXtjWkU2RTW/JJcCES4eIobB4ihOmqWprVk
         W17nCB79s5kt/CM1bLKc1Yj4kVtdfh1pAUjnu7m+LDXbvu4FnamkIRUaZ3r4isrBQZOS
         1dfEfWkMPLIGePna7X6VcGjmGmhrJGjtujq67Yes5JuUYVOHGmscJU9bebKA9C63yZve
         68kw==
X-Forwarded-Encrypted: i=1; AJvYcCUYSNNtLN2AUFsLXVhP3gLp1itflWvHGDlg+XUE63+kQvXb8xYaJOAhlA1NxKX/C7ECcDbL3kNUlOi/7g==@linaro.org
X-Gm-Message-State: AOJu0YyRa8zGVd+xZomsGuSgnOolA2JYHBv+A9D1S5FjWNsxyvdtGplK
	4UsWQBB6cYsklTkkTrczdancp5a5LV8K6puPTKBSMFywo5xqauLD6296JQPJmThaxQ==
X-Google-Smtp-Source: AGHT+IH/gmp29kQkCW1MHpP2Fw7IWUdIixZZ3svn3bgb1FIgQf5uLSMcvXEpVcoiw4XJJPN6VTBMxQ==
X-Received: by 2002:a17:903:1c2:b0:20b:51c2:d789 with SMTP id d9443c01a7336-20bfdfef83emr245455255ad.16.1728409861117;
        Tue, 08 Oct 2024 10:51:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbf62sm58642245ad.89.2024.10.08.10.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 10:51:00 -0700 (PDT)
Message-ID: <fc414fcd-3e83-4cbb-ab81-77922b4d3c64@linaro.org>
Date: Tue, 8 Oct 2024 10:50:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] target/arm: Pass MemOp to
 get_phys_addr_with_space_nogpc
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-15-richard.henderson@linaro.org>
 <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VBAHPpDuL7HL

On 10/8/24 07:35, Peter Maydell wrote:
>> -    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
>> -                                         &res, &fi);
>> +    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
>> +                                         mmu_idx, ss, &res, &fi);
> 
> 0 is the correct thing here, because AT operations are effectively
> assuming an aligned address (cf AArch64.AT() setting "aligned = true"
> in the Arm ARM pseudocode).
> 
> Is there a way to write this as something other than "0" as
> an indication of "we've definitely thought about this callsite
> and it's not just 0 for back-compat behaviour" ? Otherwise we
> could add a brief comment.

Nothing other than 0 is leaping to mind.
The documentation for @memop includes "... or 0 for none".

Perhaps

   /* This is a translation not a memory reference, so "memop = none = 0". */


r~
