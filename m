Received: by 10.223.188.70 with SMTP id a6csp4802357wrh;
        Mon, 28 Aug 2017 10:57:31 -0700 (PDT)
X-Received: by 10.202.44.84 with SMTP id s81mr1433589ois.192.1503943051793;
        Mon, 28 Aug 2017 10:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503943051; cv=none;
        d=google.com; s=arc-20160816;
        b=pBM4HEziJK8jiHN0jsZ5r4JEeavbnHM026eXgynkLAUOAh6KSAcGSY6lrnb2FjgLNv
         hsJODdfjaDrFYYhBjPoVrWAjFK0I01my06+aKoir+s8cJqZ85B4ejdi5SHZDM98CvlRD
         pt3VhxlRsnlVYZwCzqvPPAWeNu4KA6Z6RxvqO7jEF0dhFaT7DRCr11zhA30A8EYFD4Ba
         BYQKDlqomKjqirK9Nd6bkAGsqjSeBzlYj9IMZj7BhxmNXwccudpHvaQmsZ+pIzZryb70
         6d+nrBZL8qghSdVZoOg68BZSOrmr5ixDuNmEFxwltdzgvnYs0szqCgaMH7FCy7YK7WSF
         I+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=qfUUuZ85ZNgir7XkdARO4NCsxrdRBfR315bqf96jk8A=;
        b=fticdgmsxzAZMHusVu3jV/CgEZwv/QweLnjY8QR1mUeGo7LIEfeVeDQj7dYrWdhB3Z
         0GYdG+66evVVmj4EypobwkBoLLvHkrUW2HCOvuZbSn2cgzTUQky7cA54XFakKxlymSS4
         k3N/Oki2XYCn4LozPFnQsABubW5uyUxvHweFY28mghrrJ4a5tXoX+Qbe7fcvBLN7nb0x
         TJyrXmmVs0xjDuFTUVMWJVgyaopjn3VQPqqBtJ0Y6daP1i5UO/m9DZ56atXvhItaM2A8
         FMgEyXSl2gW4xm81RGnUl2P1q4btKTJv2KdaAJ6SoKfV8OgfSm9DSCBmIXbgFmbNC1Sy
         zDnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mfzj584A;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4001:c06::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com. [2607:f8b0:4001:c06::243])
        by mx.google.com with ESMTPS id l185si697398oif.257.2017.08.28.10.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 10:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4001:c06::243 as permitted sender) client-ip=2607:f8b0:4001:c06::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mfzj584A;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4001:c06::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-io0-x243.google.com with SMTP id d81so162592ioj.1
        for <alex.bennee@linaro.org>; Mon, 28 Aug 2017 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qfUUuZ85ZNgir7XkdARO4NCsxrdRBfR315bqf96jk8A=;
        b=Mfzj584AeJ9+xxw2St/xQs+LRmxfAEUQzmBIVRkoi+/WwLA0Ur0O619/cjmyIwfOhz
         oRXIRHq5dOtM37WbP8WOlYlHFeOmnpq29nIAh2zAcKKz3juh8CtZfUY2F9TyCSZjlFAl
         wvURsxD2/p5etQ7xt+MT1qOfo8fZkutcqvxpN/2pbqoQf7mX6HS/IZ0LVCXqmWVyRv6G
         YUMy9jc/n+qrfkb58sihYqrih9kDiK5FHO0GHUyEYOX1uDnitU8xRrlVcd9i7FAi4OQ6
         UkVbbR2qr+z09yuk90ALO9nff0D0he104CE0JD0wuhXPf+wtuUX6WFtSdx3wpm7Dl86U
         U2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qfUUuZ85ZNgir7XkdARO4NCsxrdRBfR315bqf96jk8A=;
        b=W2UaqnkuuH2viGn775YeK/HAbOIuzego9IIypT92lnuqngQbPsStiCorXBhlTyEpAm
         364VDSzDs12wr4iZ+I5oY4yDUHqRwwWEiH/JP30NTHe+VIwPGGfNh8Z0K9mqJWPkdrU6
         PjtFEOsR7lbqrP8laddytL+8vBlyKIQio6Xc7PvXKFhPg+zQAA/zGCRlxdhWs+hYXkHZ
         uLTF8JkfNqgjTvH6ZcN/JMd2nQFnhVEilqBvvFMY4CYFA09EfJp5SZ5PPWjuHCCF90DL
         Gyp1YwTKdNGM3PmK0PSwV1pEHAcwombKMTWC3NTeE3KXOkVSFxLA2G301OXfLBSPgdla
         BppQ==
X-Gm-Message-State: AHYfb5jSGD9PBz/pZEC2V9LQsWqjFHju0NJNkW4ydleqi/rJIlvyknAD
	5i2RAg8ZyZxmGA==
X-Received: by 10.36.51.72 with SMTP id k69mr1434146itk.145.1503943051291;
        Mon, 28 Aug 2017 10:57:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([172.56.42.6])
        by smtp.googlemail.com with ESMTPSA id g20sm243312itb.21.2017.08.28.10.57.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 10:57:29 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH 3/3] mttcg: Implement implicit ordering semantics
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "open list:AArch64 target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: pbonzini@redhat.com
References: <20170828035327.17146-1-bobby.prani@gmail.com>
 <20170828035327.17146-3-bobby.prani@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <03c05a60-d697-500b-c2fc-d99b24f3f64c@twiddle.net>
Date: Mon, 28 Aug 2017 10:57:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170828035327.17146-3-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: cJj5aLsv8Tln

On 08/27/2017 08:53 PM, Pranith Kumar wrote:
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 55a46ac825..b41a248bee 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -117,4 +117,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>      __builtin___clear_cache((char *)start, (char *)stop);
>  }
>  
> +#define TCG_TARGET_DEFAULT_MO (0)
> +
>  #endif /* AARCH64_TCG_TARGET_H */

Please add all of these in one patch, separate from the tcg-op.c changes.
We should also just make this mandatory and remove any related #ifdefs.

> +void tcg_gen_req_mo(TCGBar type)

static, until we find that we need it somewhere else.

> +#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
> +    TCGBar order_mismatch = type & (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO);
> +    if (order_mismatch) {
> +        tcg_gen_mb(order_mismatch | TCG_BAR_SC);
> +    }
> +#else
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> +#endif

Hmm.  How about

static void tcg_gen_reg_mo(TCGBar type)
{
#ifdef TCG_GUEST_DEFAULT_MO
    type &= TCG_GUEST_DEFAULT_MO;
#endif
#ifdef TCG_TARGET_DEFAULT_MO
    type &= ~TCG_TARGET_DEFAULT_MO;
#endif
    if (type) {
        tcg_gen_mb(type | TCG_BAR_SC);
    }
}

Just because one of those is undefined doesn't mean we can't infer tighter
barriers from the others, including the initial value of TYPE.

>  void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
>  {
> +    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_LD_ST);
>      memop = tcg_canonicalize_memop(memop, 0, 0);

You're putting the barrier before the load, so that should be

  TCG_MO_LD_LD | TCG_MO_ST_LD

i.e.  TCG_MO_<any>_<current op>

If you were putting the barrier afterward (an equally reasonable option), you'd
reverse that and use what you have above.


r~
