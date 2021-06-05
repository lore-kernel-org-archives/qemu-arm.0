Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2119526lfa;
        Sat, 5 Jun 2021 09:13:36 -0700 (PDT)
X-Received: by 2002:a17:90a:dac1:: with SMTP id g1mr22829147pjx.199.1622909616445;
        Sat, 05 Jun 2021 09:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622909616; cv=none;
        d=google.com; s=arc-20160816;
        b=D8vK/38elHvF/X5aK30wJ2xwzdV54H6YcyKpZ88ocKccQtCkO8rq+VeqD6uHuQ8mY9
         ABhCj2Z2KrdN/7HMoyoWdbf4mGbfaZjOOa1FIWFSt1Qqqpxsh7ymUfn6Z+5/itBB2pJX
         Ue8qVYsRVIaqPthFioB2yQlZ9Zn9jEh6OIJCpK2W6QhQH3L0VGdf4knZczXDPkRYeyBL
         fDaaa3ixsTYtZhRZIBIIS/KL+EyAUqJGdSJ5Hhg5EDRmz5+EIJ1sc71VyRKH+6AS9j98
         5fEEWK6Hj/nIBqZK/NNoxmsuuGJE6rqXS2UEtk3aep1nC1tICHYpfErMoF9vCM9fdUq/
         YyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=h+szCBhzMiCn6CJHS2uBIvx4TkM83BKnUPeiPrnLMAw=;
        b=tqossAskLzJl3Vs+/ONNoqv5ZiYy3H2yLAuB7pkGeSLBlEEih2MBtnreExHYEVaBkl
         WnEk0uWb5UoYhOGNvMsKkDW/+bfgt95hwWB7c8VSde/QORzilZXDTyVOrggAUz9zuPrJ
         60YGcZt05yB324Rp+DXyKjScd9SZ3jcS8zbzu/MEyRrB4556BHLgWQ72rM3HOt5LpFLR
         rH2V32KmUjjSwQQWAC3pxqjcJABSS+rWgxt/jxF/oS+SEfPN4ugfKmcM/2tfkhOZ8nFb
         k9a7BH7pGRYbBd3a+k7qSae03yG3t94suJoiCWu323O1id14LSOklRUmfx5Vh28s2iBV
         7HVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qm/zQ+vT";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gq11sor3441479pjb.4.2021.06.05.09.13.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qm/zQ+vT";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h+szCBhzMiCn6CJHS2uBIvx4TkM83BKnUPeiPrnLMAw=;
        b=qm/zQ+vTdxK8QV3DOYgiDFHz97cPFA4v1fwK8uEtka/fPIoU3MWhGJymtiaPOq0T2f
         iETZMd2f45w65hsHQAXXukxXFx/nWWAp3WB0lnYqo+qRNWvLpQrrbHPi+x7dRcwSAxiE
         uRr/2xiBntJx7RiU69IVVZZQI2Zd0KPiamUbMHLDW1GH08VVH7OqIEwRZgByJ8VrR8wX
         2AdAQ3w0Gd4meUmGa6Wh94KCKqb2x71HvwdEMpEK5xm9L18SwIozyZobF+fztKJzFTyA
         SXzviayeqXDeBplO1gAKs5HBVwuuTcTPSFdWu8wOVCY9DBTiWOa946pJPnp6Tr6o3qkk
         0/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h+szCBhzMiCn6CJHS2uBIvx4TkM83BKnUPeiPrnLMAw=;
        b=OQQ32YTLDJL2aCu7h2HAwTtCrOOKE/oJOvsCUpp8qmH0hXSfcbR3U7lR2L6BCf3AvP
         am2Dm6A9b22q6zdDXadNF9hoiT8nMH23nvn3jTKz6lcHvxvM0U99TXXDod1eBQK1e3B7
         nm0cU2ScpWpeJm2WXvQAksSKJ/9hYb1u9G1jQ+FhmsQSfXF5aUuPunk/OwMrjOJCPQur
         UJU3pd8pzjm/fHTdhVevQXeDNXi0eqlZ2jrtPfikVoxClbA7/tPQaIrbYkMZPtqAkVzk
         kddnSCWvn+wmt7PLYA4aZlTawd5elBbirstlDH7aE1O3z4zAT1dd2P9eDAVetJ47v3Dq
         CV0w==
X-Gm-Message-State: AOAM532qMj9ayHE5aQD49a3TZbYT8eaTCfLhBVHPtDpZ2eAoTNCZzhqs
	T+ErUTS87mjIoVBY3H3DAqOEpvxe
X-Google-Smtp-Source: ABdhPJxcvssoLJv8srXzRFxKY7hjDXCygZ9k6Fv8QgnWPaHX2oOF/Z085wSpjMutdiY7Siij1fzILw==
X-Received: by 2002:a17:90a:5b0c:: with SMTP id o12mr23323380pji.108.1622909615869;
        Sat, 05 Jun 2021 09:13:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id q91sm7848589pja.50.2021.06.05.09.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:13:35 -0700 (PDT)
Subject: Re: [PATCH v16 61/99] target/arm: remove broad "else" statements when
 checking accels
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, Olaf Hering <OHering@suse.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-62-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <563f5b9e-fd9c-e8b0-e395-24fb166670d3@linaro.org>
Date: Sat, 5 Jun 2021 09:13:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-62-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ojsFQ+fbbD4j

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> There might be more than just KVM and TCG in the future,
> so where appropriate, replace broad "else" statements
> with the appropriate if (accel_enabled()) check.
> 
> Also invert some checks for !kvm_enabled() or !tcg_enabled()
> where it seems appropriate to do so.
> 
> Note that to make qtest happy we need to perform gpio
> initialization in the qtest_enabled() case as well.
> 
> Hopefully we do not break any Xen stuff.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Julien Grall<jgrall@amazon.com>
> Cc: Stefano Stabellini<sstabellini@kernel.org>
> Cc: Olaf Hering<OHering@suse.com>
> Cc: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu.c     |  9 +++++----
>   target/arm/cpu64.c   |  9 +++++----
>   target/arm/machine.c | 18 ++++++------------
>   3 files changed, 16 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
