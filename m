Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2111471njb;
        Mon, 10 Feb 2025 09:55:16 -0800 (PST)
X-Received: by 2002:a05:6a00:999:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-7305d42551emr19492796b3a.5.1739210116310;
        Mon, 10 Feb 2025 09:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739210116; cv=none;
        d=google.com; s=arc-20240605;
        b=bCmIdR61apBcO9UV4Vap5SHdLvbCBzZ5Zg1/8rKhbm0O72i+iMAuM9eWGrJCQn/Gkz
         LLtfKszmYArrLhqlJtFxozW4TNiOrjNg2YfALlN457s3CW8iguVbLVvcxh5taaOlzZUB
         0sM/9qQ8QhqagDEgzqbw0e2S3phuQbT0YkhIRGe0gA+QfV2jftPkq7Xxgw6HfDsWtQ6H
         /iyCkL55Tbrq+woAtjc8nSmSFjZ0I6XoYC4ZgLgh+50gWTuakHsvuctna6A4R6mdgWqd
         l2D00NVr0PtCpjocnlXec/DZrVpRMY5ZM0ZjYUlm/nFPPzYtRhyb6CpTyVIkmdOAWucp
         20DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DkdEH6sUVSYdCOe90izcf7TmjmouF03Sb+YzoMm2llg=;
        fh=fv+ROE4HiGsWsBqO3fqtt2wBIXtZNI5tJgr+jSCB8AE=;
        b=k/uYNPIow49wXAXzrXZgFRZ5IxKUkSW2vahbW5uZa+grbv0xxkJaQ5FR1DyYJvOmeL
         MTwjfQTlBz9JLRgdxbMpPu/243VCm5b4chNgS1wLe1ojrFbVdguQhMpDb7t0fmIfvQAT
         vfvKE81u+RbgugHjzcW6Pi43fbNM/8lb92RaHLfCgbJyYwdr3rchczYCFOMoejdhZe58
         2wt1n8Hh9FoVWRFxtpbbLEiHQPUGx62byl0Un1RpE/S4K+FD3IWa8I4n0EzHQv3hI2Y8
         s+WZaRNxgCvEGStSV7ippaCkK0h5RwZxLXahVTfdWZk0S8B4hxX3G75C/kvgeWodi210
         pHIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWsu+kgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73073f1256fsor2314306b3a.0.2025.02.10.09.55.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 09:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWsu+kgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739210116; x=1739814916; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkdEH6sUVSYdCOe90izcf7TmjmouF03Sb+YzoMm2llg=;
        b=QWsu+kgEa8DWewosqvvKJfpvJcXVMkm1k+hUHkIpo7mVJsq6sgy9Wan1SP8Btg/ePu
         jYEv7wA3m99OwQ1TOjowgsiTIaJESDrItje+w1ik7/F/2fnVxzUxmJlON9ufcf4qxIsZ
         lmG3SzzFI7BdEJ1q4bcT28fkrbctnJqdP7xs9QG2p0dE3umeZ3DtSZBdRq4SLCauifG4
         +mnH/HJ7h17uWB0jmcT9x8mimqVz2iDkWeI1WWInrp5Et1tV5OS1uh4rP/T1ylSCS5jV
         5CA2hZrU1yq7YtLoD5iG22WSfXzPBbYsMkKt58v6wG93+rMSbfJzz6wi3ZFwFYXmmVyf
         0Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210116; x=1739814916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkdEH6sUVSYdCOe90izcf7TmjmouF03Sb+YzoMm2llg=;
        b=cRDs0LsWox2LJc3GulHEzlGE+dn9fvLgZMoEHN7KHk7LR2FQ7JFRDo0cHjF8jrJwjT
         VA1dZQhrnr1s6/kfFa9uCsWrRdZYCxlrPVLXVRnYVN2SwzxBx60BCAglGB9ge8jUpwC9
         +Lx9PzxLsRMzCQQnZbC5FlX8ZAgxXuBZEaFkEIjIevDiAb7mGiIEF919XngxEtaZmrdM
         K8s1ezFsx61DK1RZD71f8UZQMbNBwKw3sWifet0wmGcS8ajiIYw6LCjZN60lZnRbD13/
         N9uo4tW+iV1ab8A3ymkObDebiQbt1Vdmjnw33lF0BCJPVTM/u3+P3ctDVliGODnvoyLC
         YEsw==
X-Gm-Message-State: AOJu0YyrbjCR0pxPQzmN2Ie0HFuLx+G2v0aB/Q4uurh/n6hFi4ROIpAB
	tJOFB/LcUjK8/qvlYYzlWzKrbUK/1Rjbnr79N1Klo94TfWReleS7Eo5bnSeHPp3UtA==
X-Gm-Gg: ASbGnctqyRy2qhiEOCw9mxeYBhCRsXuJcvuUHYMXPF6ROCWB+K7opQ+/AqIqDZhBZHE
	Tyk2fMANWXIz6nMK3yN75yGT7Db+NxKhYBW7U4PMXPY490XYnBzc9Ilj5bsjL5xiafwzpfWMV1w
	WWFocafDcoS1Xo4gBjhhNgvo+uwrh07fTq0NtYcbadpskKDtwIyr+N3Rsr4d5DDTLFUzUvjhuB0
	bxRlQ5+P1lqjelPpk9LsqYzbJvf4L64xIN2S4mT3CL9rXIqLyghSZcL2u6afwYMWH+UPFXjlfxP
	Hz+LkDPHI10xRB+pW8PvKb6TXDrx7yVL6Lp2tAZB+G/rG3AXM3vVuhY=
X-Google-Smtp-Source: AGHT+IF0fPzzW08zdDIHghwC9vu9rTRnSyRwpROktUNftvlnGXsL5Dkh3qDb4iHxy6DqaeoXmSH1jQ==
X-Received: by 2002:a05:6a00:4217:b0:730:8a0a:9ef8 with SMTP id d2e1a72fcca58-7308a0aace1mr8766715b3a.22.1739210115682;
        Mon, 10 Feb 2025 09:55:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73077975f05sm4441135b3a.14.2025.02.10.09.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:55:15 -0800 (PST)
Message-ID: <86b29db8-68fd-4380-915d-e8e70f71909d@linaro.org>
Date: Mon, 10 Feb 2025 09:55:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from
 timerlist_rearm()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250210135804.3526943-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210135804.3526943-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: gCRRT7EXaC9P

On 2/10/25 05:58, Peter Maydell wrote:
> Currently we call icount_start_warp_timer() from timerlist_rearm().
> This produces incorrect behaviour, because timerlist_rearm() is
> called, for instance, when a timer callback modifies its timer.  We
> cannot decide here to warp the timer forwards to the next timer
> deadline merely because all_cpu_threads_idle() is true, because the
> timer callback we were called from (or some other callback later in
> the list of callbacks being invoked) may be about to raise a CPU
> interrupt and move a CPU from idle to ready.5A
> 
> The only valid place to choose to warp the timer forward is from the
> main loop, when we know we have no outstanding IO or timer callbacks
> that might be about to wake up a CPU.
> 
> For Arm guests, this bug was mostly latent until the refactoring
> commit f6fc36deef6abc ("target/arm/helper: Implement
> CNTHCTL_EL2.CNT[VP]MASK"), which exposed it because it refactored a
> timer callback so that it happened to call timer_mod() first and
> raise the interrupt second, when it had previously raised the
> interrupt first and called timer_mod() afterwards.
> 
> This call seems to have originally derived from the
> pre-record-and-replay icount code, which (as of e.g.  commit
> db1a49726c3c in 2010) in this location did a call to
> qemu_notify_event(), necessary to get the icount code in the vCPU
> round-robin thread to stop and recalculate the icount deadline when a
> timer was reprogrammed from the IO thread.  In current QEMU,
> everything is done on the vCPU thread when we are in icount mode, so
> there's no need to try to notify another thread here.
> 
> I suspect that the other reason why this call was doing icount timer
> warping is that it pre-dates commit efab87cf79077a from 2015, which
> added a call to icount_start_warp_timer() to main_loop_wait().  Once
> the call in timerlist_rearm() has been removed, if the timer
> callbacks don't cause any CPU to be woken up then we will end up
> calling icount_start_warp_timer() from main_loop_wait() when the rr
> main loop code calls rr_wait_io_event().
> 
> Remove the incorrect call from timerlist_rearm().
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As far as I can tell, this is the right thing, and it fixes the
> "icount warps the timer when it should not" bug I'm trying to
> address, but I'm not super familiar with the icount subsystem or its
> evolution, so it's possible I've accidentally broken some other setup
> here.  This does pass the tcg, functional and avocado tests,
> including the record-and-replay ones.  I've cc'd it to stable as a
> bugfix, but it definitely merits careful review first.
> ---

I don't completely grok icount either, but this patch at least conforms to my 
expectations.  The fact that it passes record/replay is a really good smoke test.

So fwiw,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
