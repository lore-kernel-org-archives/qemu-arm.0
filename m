Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2091949njk;
        Sun, 26 Jan 2025 13:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdDhagNx+HnmY9SZV0UVBXYmiz+eyHkcS9bqxPekjQRQQ3oZbmzDN/oadwnFeYLa1pPs5YdLyziqtFIw==@linaro.org
X-Received: by 2002:a17:902:d4d2:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21c3563c51amr617799735ad.40.1737926085633;
        Sun, 26 Jan 2025 13:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737926085; cv=none;
        d=google.com; s=arc-20240605;
        b=RJ0+5U10QnndnrYB639naJsLIxm1cmQgGS9JlYIV2iy17ga44u1oHPJ0zSnPXRnQHr
         JI+ssTBjiN7P36kCQwR1+XCtv39KBYZcZs+nb6ZvbrBaHTe39JNE3v3D0oYeuDXZ8DGd
         bahZQW2emrSrSK3CQXZW2UoFg5Pqg31AtXdyWRqaDpbQOp2z5t3r1Tz0x7qsowKqpWrD
         iT79ot50TjqOipWWoAn7HkEgPAmJS5tj7EAe1F13HaEM4or5QFbKSLvZq51qnb4b6/BC
         Yx0C1tzEpgrgqKn/kfimLKMnGG+9d689R5fQV22nX93EQRDzJ8krQLMrFOEj6cCROXIy
         iFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
        fh=qB3IYHEdiIQ7O9Dc4HVhD4bNHjEw1OoXp4/gk9SCIB0=;
        b=Ljk6V2qaFnNGZQ8b0N2FAQvaa+OTKaipv8b2QFvWzlbFFrii1DCYfslEhUtXQoY76X
         u8D0YjDkkycULKSCQf+fB+uQEP5s4VciyWdOumrSkOifrtS9llR7y+9IRBjR6fG9F+1i
         WXPieAv2DTemKkF6FaJ56pRB2BWmmR8PtQKpddXK8LWrshdiGuFk4ceW47YzE8/0zcX5
         1PRuP43oKCtuulZTukvG/kbGd/fBcRTocaPm6rZGK/RV0uNthVdDXI2pB9YZe5NBPGIa
         HdSLC/TDpgyp4Y6FDbT663ZTEjGe5Zg/ThwICM2JgtOU8CWhepwXXaNDwRqCWNCXPcju
         WrGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nu1/HsyU";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da424e7d6sor58789905ad.17.2025.01.26.13.14.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 13:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nu1/HsyU";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926085; x=1738530885; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
        b=nu1/HsyUUv5PoNSp6G6nRYRYpfVAm0lfTAiCzl1JTu3Wn5ryy1geTh0R4SnlOaoe/6
         FcPQwJGEh/GcJzgR0h7Rv3POR/QQS2UJglplub+BnU7bKgIJtLPtx7wO5bMA7CidJmwm
         SnryQPIJWN1yphu5KfO2zjMM4f4bB7c4BE4piBOO/v00pBbtn0rs/cZAS5g2/IpwQzR+
         cirQIxqfgrIbRYSjOmMFA14asBTQ4eYOY/LdAdM0qqornHp7+pXXdloDfuny+IhCPoiS
         Kzk3wLxIqB5rqPssqIBt/TiQcLA4dUSU+u/Nbz169nIaE34XAaQz0M9SV4x/idhv+x3Y
         TK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926085; x=1738530885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
        b=dJz3cXMw7hupjksHm9Qbp/mU15GYD7tGDNgzvpESLZgyKhkCChD4VRIftqdg/KjGTX
         LuUspTkyvt0TSeK2DccTC9vbKn3oTCGAEjFFBzbsBPlcvZly/fXYVcfDCg0ZJrs3mU3s
         0DDImMWFyihEnGb9fIO15XW7eUTtJ4YD0TyRDb+eVnzgYX608iFwTOjRzcddBC53HWLo
         t8nF5sKPX04ELZAU0mX2BZP1SZ23kXGa/R9svFtIJ6tROAwZ65BqlkzpUCrHRh6As4zN
         6otzGI4PUo5wOoXpF7gZy4VcSUBMk/riEubyNUt8sePzeaevvHTI5yYjG9E5ZPcJcx1Q
         t57A==
X-Forwarded-Encrypted: i=1; AJvYcCUf+FD4KLyu1dxGhZCqD+JQD5NCe6FviN83IwBIf8vVgprVHKnuTdcfZrwdBdfp1tbwCpeqtHMTJG7+EQ==@linaro.org
X-Gm-Message-State: AOJu0YzBHc63lxK6v5YNTdzl6YLFutjKCxASauq8nERA7fN/Xf/KhC0k
	eKWLet1VT+ROfmcUtiGxU68AsEUWHgAhR0W6gl2U+oOWkPPQCdgPLYtZwzWtyM34Dg==
X-Gm-Gg: ASbGncuB+Ij9P8ggmo51YImbHIb0Go0ldzWSPI/LhgZ2w810zzOyMh5Xqx+5Fu3kMbs
	mKwelFzbb1e1OXjX2jfyDLdsgiMayqPS68pdv8S8+YV70jVwIE4SQUR09j+7nS0Vb9ZiJEizrTb
	R4u317UBVfO9vK9n2PkImNJ2KFrHQole8ql81KglNme7/1IcqBDTSMy6z/TIp6skCmWHv1iQ+M6
	SLzdhCygOGEMKBWrF+bFJUg1U8et62tGTgnvb2Z5dVyQhtdCq+JhgfkH82CH9SHvfQAJcu+nr4M
	K0sWuFKBRc3HytrEkHk+FC7rGkQfj5JippwgdnJZWkfXBX8=
X-Google-Smtp-Source: AGHT+IE1AaZn04VsAmZoovvHskfFwwHs+/I0v2XJVpXr12XD+Jd8EH5sfL0xlHcxmhZL8x5QsccIOQ==
X-Received: by 2002:a17:90b:2f50:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2f782d32c45mr47771107a91.23.1737926085217;
        Sun, 26 Jan 2025 13:14:45 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffb193e1sm5644337a91.42.2025.01.26.13.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 13:14:44 -0800 (PST)
Message-ID: <f7c1590d-5c61-4408-92c9-7241aed2c6be@linaro.org>
Date: Sun, 26 Jan 2025 13:14:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] cpus: Fix style in cpu-target.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yeSghJf4pnbR

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Fix style on code we are going to modify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 6d8b7825746..a2999e7c3c0 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
>   {
>       CPUState *cpu = opaque;
>   
> -    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> -       version_id is increased. */
> +    /*
> +     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> +     * version_id is increased.
> +     */
>       cpu->interrupt_request &= ~0x01;
>       tlb_flush(cpu);
>   
> -    /* loadvm has just updated the content of RAM, bypassing the
> +    /*
> +     * loadvm has just updated the content of RAM, bypassing the
>        * usual mechanisms that ensure we flush TBs for writes to
>        * memory we've translated code from. So we must flush all TBs,
>        * which will now be stale.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
