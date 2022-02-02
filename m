Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1104140lfk;
        Wed, 2 Feb 2022 04:40:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlj45R5qNvyvECuP2IKmm+vL8q/8D/0oH+izAx/x1XWPZ1gs9YIbhHgcuFVz5d/20sgNMu
X-Received: by 2002:aa7:d459:: with SMTP id q25mr29471907edr.212.1643805622649;
        Wed, 02 Feb 2022 04:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643805622; cv=none;
        d=google.com; s=arc-20160816;
        b=L3ljQD0+kygMIKvSCLOnoztotZA0r7ylnfyzwtavKsGkTx7WK+BvR2QnArBwteceur
         VxzbflK0cG5pLQY5x7Wk/6KR5pUx0JP9Vh7kf6IKH1uN40ovfG2b6R5BO4kdbI1KxnpR
         o7xiZO1i7Lk5CaCNZvY++V5kxWpiWeTo8srxya0jS1tRiJLsfDQkSJpfqieOwY1qu41F
         +lELG6ICFkaS2okdM+qSi5ZpdO2bhmGhC0fA2atJpdfm0CV/elF/I1qdcXi0IDy2abIV
         Z78jgVAbGF262LJrkG7TR0fFAHXOtIxJ2rvNg07shh3qEd4Q9cNna1iVS0xeKxm6En2k
         j3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=dWYjWpaLphCTZ6dhHNEC2hT5VCO00/XB6QbQd62Uwpk=;
        b=gL2OzemOdFRMA+iMiwv68FHoixTbqVizHZzIWVidDNgEfzIvlYRiRqJn5lGMt/Srwj
         AYDTG7kIS6U4MhNfv0v8SCKuALaMmUFqiBGJl3p4FkeHn6Osd1Q27efK8qYKnGrLUcqu
         cKxX35Fiex1VUJyczia8psS4HPSZJOlCdyskNmxtulev5Rw+ffF1bsrx1H3CRU7OzRJv
         G9o78GQgqaRAANqMBqKXfsdi7QjKCVYAsTfv1En2ulNhbm//Fc9h41eWhtx1aYAtjPkN
         QLC4o1p8aZc6ZVRaLwEe5OpMN+OIu4AbGgf2l6AKJey0ZGoUZON7pRDLGyRdI6IetsSA
         x5Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQ4kC7LW;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i30si12077441eda.530.2022.02.02.04.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Feb 2022 04:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQ4kC7LW;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643805621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWYjWpaLphCTZ6dhHNEC2hT5VCO00/XB6QbQd62Uwpk=;
	b=VQ4kC7LW/skOHNw9Ogar9oNNuRuCmeRYHyhfSyg49sb2+9mcRRJeK4I3fBvMXzSO9HrLPZ
	ZT4cClZOLOIhx++DZwKECqn/rxIgjE9Nxxu9B+CmsAMyb0mCK5Q0iqIK0X1PYxorNTX8Hh
	YD8umOnPFlktlYk/Bb2gpZoWz+32L2M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-AbU6cehDM7O0KUnuKFvHuQ-1; Wed, 02 Feb 2022 07:40:20 -0500
X-MC-Unique: AbU6cehDM7O0KUnuKFvHuQ-1
Received: by mail-wm1-f69.google.com with SMTP id v185-20020a1cacc2000000b0034906580813so3809243wme.1
        for <alex.bennee@linaro.org>; Wed, 02 Feb 2022 04:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dWYjWpaLphCTZ6dhHNEC2hT5VCO00/XB6QbQd62Uwpk=;
        b=ApEqP4+IEm/1KCvhJzjYtTRTWnKiVGk45sTu41fhknTwFS4bX9aeGU0aDX+1pJNZzK
         horOchbsM3+WAsSoy53Pqj1auCqXzYXQnARZuzpcLo6+25jgZEVVLTrnhrEBDcahjzcE
         CSRg/TwmP4h/t9fsn0+o8rTmRtAVthIoKNaJsU4i3UM74ZYg0nyjSN4CTwtYdtlgG2fD
         R2j2JL2NALMfYpWlwZRpo+QV8EUFYR9zGUZ44XIAJt9Yk7RP6KVwRtF/JYxngI0spKh8
         OhG2h2SPdbzyC5KRX/k46e2+wpz0LmkVndM/0fDaItKxLAa4nFqY96XcyMmLiuvFFcte
         2TIw==
X-Gm-Message-State: AOAM530/XvR1HG2A1wvvvbQKC0t53PoUKrpImF7pYVL2y9AWZKMOa/fj
	NkuuA9Qwuqw44WScHaXc1QRXzhD4dosRlrkHzuswG/wUKY9FGcroDijAtkNx7lX7XytmJCPwX5V
	K8/imvXTAvIZSLCc1kMm2VMKhP/25y7t6kqPiWsWfU+oJta8e+3NsrqDmkrBfBeGIBhc=
X-Received: by 2002:a5d:698f:: with SMTP id g15mr24846192wru.273.1643805619468;
        Wed, 02 Feb 2022 04:40:19 -0800 (PST)
X-Received: by 2002:a5d:698f:: with SMTP id g15mr24846171wru.273.1643805619167;
        Wed, 02 Feb 2022 04:40:19 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id c8sm5637359wmq.34.2022.02.02.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:40:18 -0800 (PST)
Date: Wed, 2 Feb 2022 13:40:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Message-ID: <20220202124016.hr5i3m2xxhsacb6p@gator>
References: <20220202122353.457084-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: RG41GwjOuJMq

On Wed, Feb 02, 2022 at 12:23:53PM +0000, Alex Bennée wrote:
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>

s/Cc: Andrew/Reported-by: Andrew/

and now also

Tested-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

> ---
>  target/arm/helper-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index d6a6fd73d9..7cf953b1e6 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
>  {
>      daif_check(env, 0x1e, imm, GETPC());
>      env->daif |= (imm << 6) & PSTATE_DAIF;
> +    arm_rebuild_hflags(env);
>  }
>  
>  void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
>  {
>      daif_check(env, 0x1f, imm, GETPC());
>      env->daif &= ~((imm << 6) & PSTATE_DAIF);
> +    arm_rebuild_hflags(env);
>  }
>  
>  /* Convert a softfloat float_relation_ (as returned by
> -- 
> 2.30.2
> 
