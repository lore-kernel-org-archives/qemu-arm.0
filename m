Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp471804njb;
        Fri, 11 Oct 2024 08:22:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcVNIEvmZ8XQJugeDpryULP0hVitmFaUY8EjzCi1a3RH8m0ryqkiDN7G8659GFtnIQam1XDzoAB3TCtA==@linaro.org
X-Received: by 2002:a17:902:d48a:b0:20b:5aeb:9b8 with SMTP id d9443c01a7336-20ca03d67eamr48023175ad.24.1728660174964;
        Fri, 11 Oct 2024 08:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728660174; cv=none;
        d=google.com; s=arc-20160816;
        b=WtJj0yXt9T30TSCcIJW6caVKKyBTAO9Xc5AXpL5vwgpzRJFToo3kMuv1wy4Kohu/4Q
         xq7RnecoOGLP3eMFBe8AjqMKZRIbHCGLBbhXJnqJi7Cqs/RIn1ty42T8nLnCgoxhsAgH
         RIJuE2BnSHtRNlygectwGf7Og+U8yoUeewBpXudsjRdWO7GmZcVJbCp67te6Puzhuin0
         uii/kx74/amBlC/b/Oe/JVeXNRmV3Vh10d3snVC/xrwgrW7LDhMwbrKyNf7WJUb3V58L
         xTsk7wXr9vf0r6ceDqYEUP7OKUtMg3myIrNQ8mcBsqmE7AkCycon/SwCieosFTcBGtMw
         /zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1CogMR7I7WuqqzE6cNx48xEoXofErOXlHnvljTI0ZmU=;
        fh=q7l2kWaHlHLQ9fyjTMDURiLNkBKaJ+5DcmhkhX5vNTI=;
        b=C51qwLN7eZ8o7Gf3kRukB9c4o5EwnWb2cNeFRV5LjA6+QofEOr0fKBJPJ06/vR7Zad
         7Opd60BuKJPrHvQwYBrEwOobaXYv0EjAK/id5IzgPOt8U4SVyd/DVIBV3mL3yIOdgUPs
         uOtKu/EpX/CbNuuQZzaO1KG1hqzuBKYDUay9TlhzaDNS7H8PR+sx1n1xxMFgGM7qe1do
         jrd95vKoH90BaRmHeJbmBiMzsAxSEL8QuZDIi5ycPIKCCjrXxaQqNFLNZ3NEa7Rp9hHA
         fMBucjeqNtG2yNKubG9kP+V73s5jWOI0+d3v9s7UfZx5IDuz7FoDIVrMUBRxzmLPEpFO
         ONNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sCuzJuv/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c64f97aaesor38843805ad.3.2024.10.11.08.22.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Oct 2024 08:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sCuzJuv/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660174; x=1729264974; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CogMR7I7WuqqzE6cNx48xEoXofErOXlHnvljTI0ZmU=;
        b=sCuzJuv/xuljKTin0gfFxit9TUxUsZUBnCaH4Deyib/3+KKy95xt/rke3aD+awNxBu
         c4sYEZ9SUiDSh0cAoIJooDjB9/tslt177ktsYRxJki4MkCyUwlbQnJMVvYsd8Q/SkHpY
         D68G+TikTOSayXEx/vmUa4+emtWPyFO2j44WyWD5l5E8pmRDhJbM1/wvHWFFQ3WhNtbL
         uv/bvposWjBE2e8GQQXkSwXOINZSQklc+Kb2v2zt3t9tQ7qj0Kl2/l737uG2f8C3ioCn
         DU3jZreeQhZv31QMHzzJMPaQANmtriGhpAczldbq8vtBEdAiC8ZygufCy1uQwxzlAPBR
         CsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660174; x=1729264974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CogMR7I7WuqqzE6cNx48xEoXofErOXlHnvljTI0ZmU=;
        b=tbNnvjmkyebn2Xxvp1AsSpMDjfrHLOGllPPSwMva0HpFnWNaIAMZbtWlmU9mk5xQNf
         sFC7FHo4f3UPJjQ3jc1my44nPsXMo9w3kVL5B+wY43IRuI5NrTaSD5baTF2ZK0ctUP3a
         jttie4fapisGN8k2T/Oe3UI4+ql3JDRhkcqqD4mVf41fYTXxcvqxh2m6aqDb6y7BVT/Q
         or0TsgMlXQP9wU9XcMTdaGPU5JQnRMJPl21HrlX8cdkdG3VwrGPtN0b+5K6QdAt1E0OX
         r+YsV1f5xU1hkpXLLX8ZpRD2dm2L59bfO9W+pMpqdq5wARYvNx5NNe9jLiaOpgCbWhf/
         OwfA==
X-Forwarded-Encrypted: i=1; AJvYcCVVArNoriwy6N6YBL2xS2QZ48MW0nce71juE/hcK75Hp2Xo2Vg+lgN671AZyc7FPgTCmg9UXEvtx40W2A==@linaro.org
X-Gm-Message-State: AOJu0YzBYL6mNhPkn1kfl3qi8QWNAlW4MhGfpF/AALRyYS6bRIB7iK6i
	NcM5SVZZ+N5q98M5ipRBvIMPPr5SdZj/L6rjxDTDBWl8yrjg9H/zv8i3bY3z1g4QwA==
X-Google-Smtp-Source: AGHT+IGtuBfJ5Y8/O99TVzmcr+ylQwPmRJHu4yyYUgnd8FAVtIUhSM+5WEIdXBhH7Jp50Bxnudz0dA==
X-Received: by 2002:a17:902:e88a:b0:20b:5e34:1842 with SMTP id d9443c01a7336-20ca03ff886mr53673925ad.25.1728660174181;
        Fri, 11 Oct 2024 08:22:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c348986sm24499055ad.258.2024.10.11.08.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:22:53 -0700 (PDT)
Message-ID: <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
Date: Fri, 11 Oct 2024 08:22:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in
 tlb_fill_align
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-7-richard.henderson@linaro.org>
 <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: qdRjt+q+rROn

On 10/10/24 03:44, Peter Maydell wrote:
> On Wed, 9 Oct 2024 at 01:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> When we have a tlb miss, defer the alignment check to
>> the new tlb_fill_align hook.  Move the existing alignment
>> check so that we only perform it with a tlb hit.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>>            * Lookup both pages, recognizing exceptions from either.  If the
>>            * second lookup potentially resized, refresh first CPUTLBEntryFull.
>>            */
>> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
>> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
>> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
>> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
> 
> Is 0 the right thing here ? Given that alignment-requirements can
> differ per-page, what happens for the case of an unaligned access
> that crosses a page boundary where the first page is "memory that
> doesn't care about alignment" and the second page is "memory that
> does enforce alignment" ?

I can't think of anything else that makes sense.  The access to the second page is 
"aligned" in the sense that it begins at offset 0.

Anyway, alignment as a page property is unique to Arm and...


> For Arm this is moot, because an access that crosses a page
> boundary into something with different memory attributes is
> CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
> maybe other architectures are less flexible.

... as you say.

> Also, the comment does say "recognizing exceptions from either",
> and we aren't going to do that for alignment issues in page 2,
> so if we're OK with ignoring this we should update the comment.

The second page can still raise page faults.  How would you re-word this?


r~
