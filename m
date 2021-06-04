Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1504308lfa;
        Fri, 4 Jun 2021 14:23:55 -0700 (PDT)
X-Received: by 2002:a17:90a:5282:: with SMTP id w2mr7058174pjh.145.1622841835757;
        Fri, 04 Jun 2021 14:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622841835; cv=none;
        d=google.com; s=arc-20160816;
        b=OWtJNdcguP8nsRNDoXZWNq2Aba9LdTJPf4IgeyKEiDMg/NvLxpZuyOPaJMmtihuhfo
         oq61Sup6M00yDSiToJ46pSpehOw2LK+ljksh9WwjgsZh52OJ8DmSPFGD6o2zk5IADpkQ
         eAtb3kV2+E9JeWP5EH7286+XQyZZCGZDf3AILcCpCvcD6+Q4SmC6TO9TfWeeV4wmnqZm
         32zZFU5RCw5bUSd3Mc/F56LtcZso/zCQvtfsmudahPY4JdkIcPXpZ5sJRNHWPv8dIuDt
         FN8hU974KXQKsTkdcYmB29oNOhI+Vzus0k0jwqhfyJSVGzvGLkc46vW66TcLKGkj2Wqj
         /PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9cuhrvDS6Oe5GMt/RbqcFA1uOEgOG8TedSRL9cEKj0s=;
        b=UcG+nDhwB46esAs3iihFwBkIFbu+s0iiFpERYywEZiNyVxSXQBwtVwx6cH9VAtmZ2L
         S/f/U5E/EG7a4E6fP1Qzvj6hPHF7xcfpY0swtriJ+4BiIRHi1TwF00qTuvJ38/2f74lT
         CjRIL1YMFm0abvYkQC8WcYO49ljOf5sbWgz7FFcJvhQuLijGIdh7tb7OeU4ZUA2H/iUU
         gLgHpqUUvtM9aZRhpL8/qZ26+ZVovKVwYbCIPGclYuMJcTXU1Jypz7rWjdYCRlQQfcsX
         kep1nFdRwVE9K/LQc0n7qLsZGqEplDH8qqM3iZPy3DMqMo3MLgCJOHdyYxGkZbanTvmV
         W0ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYHKemfT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9sor1789989pgp.77.2021.06.04.14.23.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYHKemfT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9cuhrvDS6Oe5GMt/RbqcFA1uOEgOG8TedSRL9cEKj0s=;
        b=KYHKemfT5uXSGq2Bs5e0FsKHXbXy0Zi6BFBz/9YFv8qQzhc+quflSUgmlandV8qRGO
         v+x1WBCiYAMGZRdHleNn17i+JRspq4DAfXcJTlYsXnmtT8SBbbaycT+ZJfOJrvUACti0
         pNzB1/mrMsfrNFtw7zl63/bDz+P68RKFV97mAfTyK8XUvBuOOYxxjU5AyJf6YzOR7iEK
         EPZYrdFKSIUQWTK/vrQrvBpFMnMdZbgMP3n5gGKd+qyGkboUoIJElyVYqez660LG7Wei
         5o/JhKZIadSRrVNCzD/L0EtpaKNTMKdGYLGQr+Ny3pI+2RecR/YKPpGdQD0FwcRaiKI8
         nJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9cuhrvDS6Oe5GMt/RbqcFA1uOEgOG8TedSRL9cEKj0s=;
        b=RfR0MSxagLnmiqi03h/lXdQUDmecbz28w93CLPrjfNbII0onbwlNrYl3pJ6IgT1XyO
         1pSFyWvAIro+U53Sqxq7pS+cZoxje9Aab/n1T19e1g5i+QawPOlT4JrTDH83ijHkqKL6
         +uwkcdZMtq3vemxEtFdz98jY/tyQxWOIsCB2WvxcAS7rvyI/laUoQjDCIa5ZzHnrcCau
         /XEQkF6ePoVTdr0FaKvRsJBmNJHUCYJLC8xFRZV7AUBFPWMagNTFFJ+DBy+Ey/EkS27/
         Le3bLTWeOrLCNEjlHuZXVit5B6gv1pmmMGXKKTUkBBhcUAGQm69ZcFZ2cZqyNsnd2wYi
         frGg==
X-Gm-Message-State: AOAM531e1OGG/BqnWBnRwKLB/2iRtKt4wZG2tS56pi0OSeZcwK6vMgYp
	gdL09eYQ82jjEtEQbbL5Cgr5W0nS
X-Google-Smtp-Source: ABdhPJw81vFVqevyqxlInxIsaWlqOCpKcznYnzdut0ki8lpzpvUPoqMu5anyNtvxgRr+gUB8TEzg0A==
X-Received: by 2002:a65:4948:: with SMTP id q8mr6843725pgs.375.1622841835185;
        Fri, 04 Jun 2021 14:23:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id n23sm2696786pgv.76.2021.06.04.14.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:23:54 -0700 (PDT)
Subject: Re: [PATCH v16 14/99] accel: add cpu_reset
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "open list:X86 KVM CPUs" <kvm@vger.kernel.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dfdf0a7-8113-3162-fe00-f497f1191d48@linaro.org>
Date: Fri, 4 Jun 2021 14:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Zn+OTonNz1St

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> in cpu_reset(), implemented in the common cpu.c,
> add a call to a new accel_cpu_reset(), which ensures that the CPU accel
> interface is also reset when the CPU is reset.
> 
> Use this first for x86/kvm, simply moving the kvm_arch_reset_vcpu() call.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/accel-cpu.h | 2 ++
>   include/qemu/accel.h        | 6 ++++++
>   accel/accel-common.c        | 9 +++++++++
>   hw/core/cpu-common.c        | 3 ++-
>   target/i386/cpu.c           | 4 ----
>   target/i386/kvm/kvm-cpu.c   | 6 ++++++
>   6 files changed, 25 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
