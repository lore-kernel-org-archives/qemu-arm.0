Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1415339njl;
        Thu, 10 Oct 2024 03:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx8NcOtfx2Rq8dCbO1BJZgCjSYWsROr1IRfonpT1pzPr3FKs2qd+ZLsSCORsOY4kJR7QN9lJ/nrS1Seg==@linaro.org
X-Received: by 2002:a05:6402:268e:b0:5c9:2a70:94d1 with SMTP id 4fb4d7f45d1cf-5c92a709719mr2804029a12.3.1728557084020;
        Thu, 10 Oct 2024 03:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728557084; cv=none;
        d=google.com; s=arc-20240605;
        b=QouoyKRMnnKjcDQrqGTifOC1OrBYOFufcuFeAH/6A2CK2nycnp/vsmHqPsu+d+UNmU
         nYg7sGbAWbUZPePRZNMBNzxDVjr5QG/dQGOv44/ut53KSqC6fBVlu8XNo0iBekDTH9rO
         rsF8jBV2Dmtt4Xf7dBzTkLRLkYN/Pd4ALAh9YFKjI/Bo73wOyumDGMokW0qb0jXz3Xqk
         /L68GUwNrnetFfyVQsmu1yW+d9VorzDvd6vEfzELeqhkuZDMt8NCjLt6fTW9ze5Wrz1A
         CMcgwqHW3wJpIKHiqInIc8o3xmVjQdYTHuVDd6eCfHlTK9qf2+ruR1ZRtrljyeahkwDJ
         79WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BX/60HY1SQilc1djhjB/a1kYJ5/dGdDi3/gVE9ZXjRA=;
        fh=cwz+N5tLVnQzfA5eGmouXDEVnB8LQa9wP6A9a8/1w8M=;
        b=DZPLsiVJAA5ap5ToDIWdo+QdmL2OYA/kpKdMbhdKcxlx3TZQJY6miOFIjI96d0gngJ
         G+CwwbZ4AvaTfZKZzVk4fuBNRJciBMwk6apTFoTMHQOEUBuNxJYlgsJFtMNWdiiu1atn
         HnKroE3BfBuk954JfIYSeRVY1tpI3HD4L3Vy0ttzU1DVhYeT9E3NkGGBBjicjplfKhvR
         fPqWIyCJ9mbHQxd6Lp1VM3iMhUAK4vWo/EIeHaN+gw4eXoHHvCWglCFiDM1Hpjk42Idu
         zjdkv9Wpibi+k/uhklnTUYSWEiVunv/4anloIZn5IQp5M6IkXlvPkWDXOxZke7M1NmNI
         9S8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EBAvnnsR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c93725a2c5sor274627a12.9.2024.10.10.03.44.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Oct 2024 03:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EBAvnnsR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728557083; x=1729161883; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BX/60HY1SQilc1djhjB/a1kYJ5/dGdDi3/gVE9ZXjRA=;
        b=EBAvnnsRD18Jl+raVLQLinpv/vtKTbfCm2wdiLrT2VDDsT6oSWYpjwatq1N6xS8CPi
         yLNErDXiFtMuG46JFP8CXOinFu6H8ivEo+L0w58qF761i8sFacuc/6RLeYV5KHE71O8j
         sKKyUm7stbI7gfQHEACO0pHWqGEQWZwy2buzhqRqOQz+lf8ajo+cG2s/Qqs0S/aAzhcx
         t7zk87sJjqxQ7XbFlgQEfPQjykuTt74+wVKZTG5ZSFAt8KPQj/uAtpLSRMhZeG47bAdP
         CG+hghK7YvUe8nsFHZu7zoOn+r1OrYGMUXH1Ya0J85saMflpRu1t8imiIfS6u+R8eA/c
         AZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557083; x=1729161883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX/60HY1SQilc1djhjB/a1kYJ5/dGdDi3/gVE9ZXjRA=;
        b=rt5wy7n3ChyvJ+ro7ou6mVk+yz6Uwr/jbJFSW/CaSNlXAOhqOvMovfLruUISbWjTZJ
         f3JGHY+wju8JHEz+7Asi866Iktk6ae8dAyU1yfp7eHTxLRsBWSy1wHJpgZ8uRx0M0juq
         en+17bm3j8l4twLvQw2AFESxMY3xsxeb7Cl0y5PyFBqIOKh985mYLhB+embxv0mphmEg
         gL0qaoCBwBx4OFl8QDIIZlvZ6xbAE5ckHoMjcobwF7UeqM6jYPBdqEtQpgqptRuPpZbK
         p18OLV4DnjGvF9KeEIdPGbWf8knWUMbCyF8lrnLvlaSCMYYbidRmTPDcitjN4etLen1L
         d/Og==
X-Forwarded-Encrypted: i=1; AJvYcCXwBiea8oBY1H0bj39lZXe+rJjHZI0Ih4yqTm5Dk01alQ9mKVDA1zB3fwxqxAOJCFXij1Oj8oo7IR9QXQ==@linaro.org
X-Gm-Message-State: AOJu0YxAdXxBx5U7yc5zf6UWE6ooX9P8jJLjiLnr7EWmWluWmfKREX5E
	k6h9NF827ipOgTb6iFX5T8NpZzTzi0QzA5STP4fTU0nDMPm/uHzw/F1lyN5nCkltrE1gZfXonnz
	eIo3WeRWe6Pg6y6v78Ot+4vItsO4UWHiRq0HSacxd
X-Google-Smtp-Source: AGHT+IHZMWiUZgylwth4eNH4y3+UYvrysEu+bCAnCgwYWQMyWAJs0RSCwqbbOpDohzoAn4H+jeuGr31Qt7J4TGKbEx4=
X-Received: by 2002:a05:6402:3512:b0:5c5:c5c0:74ec with SMTP id
 4fb4d7f45d1cf-5c91d675a01mr4875352a12.24.1728557083380; Thu, 10 Oct 2024
 03:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-7-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 11:44:31 +0100
Message-ID: <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5n+Em3xTdLLf

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When we have a tlb miss, defer the alignment check to
> the new tlb_fill_align hook.  Move the existing alignment
> check so that we only perform it with a tlb hit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>           * Lookup both pages, recognizing exceptions from either.  If the
>           * second lookup potentially resized, refresh first CPUTLBEntryFull.
>           */
> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {

Is 0 the right thing here ? Given that alignment-requirements can
differ per-page, what happens for the case of an unaligned access
that crosses a page boundary where the first page is "memory that
doesn't care about alignment" and the second page is "memory that
does enforce alignment" ?

For Arm this is moot, because an access that crosses a page
boundary into something with different memory attributes is
CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
maybe other architectures are less flexible.

Also, the comment does say "recognizing exceptions from either",
and we aren't going to do that for alignment issues in page 2,
so if we're OK with ignoring this we should update the comment.

thanks
-- PMM
