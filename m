Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3848129wrm;
        Mon, 7 Oct 2019 07:12:23 -0700 (PDT)
X-Received: by 2002:a25:bd4a:: with SMTP id p10mr7112460ybm.362.1570457543197;
        Mon, 07 Oct 2019 07:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457543; cv=none;
        d=google.com; s=arc-20160816;
        b=fX8ps+PZ/3jHQpuNf9nI70TbPoBnzV8aqVBaFUNJw9H1QNtygtoYFir7s4MIhoQBeA
         CXOfYhr3Ee+yStFr3EmDUDZgvuQJUrhK/EP5FUb3B1jHkY9OvcMIhCSc89M/kqGT45t0
         OySLxxdCllND2KFb0xJq53KLbJ5XzncNlnETIQZDPMnFpjiEl721tyNB4xe0j5vMs14x
         d65JbYXWqIVddms1vvWijzb2F6mfx4gZ6wWLH2zxSpnlZvO0WvHTEACYyQAeJsk1+Gjz
         bfnvhymGzWrAx3rLK37e1FnDp/nUweUW1Qcs+J5JGwH7eh5E2x5IdcfOKfR2hglUryph
         NCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9O7QyR4sroz5pD6I+kX3EyvJIXvX9Ibf1lzBnsgKDlE=;
        b=lVvsWkuMGf9EvgWcRg82W7ge7weCRPiD3ZC3qpRdQnnS6iNKNG+Sny+s7sZuuAUVk0
         9UINk9gYZaej97cgeZC8Iaml5zJ/0Amr73RCekYPTQnSvrn7kX7D/WBDI2LjNoYKRhx5
         NLZwHN55WduGq2sEKEiJtCucJpw8WurP6Pc4u2qtAalzFgQS8xzulELVCxATqjkmt3KP
         hbrfFt3O/lnZs9puh+FjUXafCnW7jKAKnG2ukGrLMbP/acYSpDKDAMXaTN9XwO1Es4R6
         yjzE8Wr7SYnDERqnR9g2lkgahm/Kj2U8YxBkGEUrbMirSZGI0bHvExpFx6Xda7N9q0Ly
         J8YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adsrto1c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y187sor7873757yby.178.2019.10.07.07.12.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adsrto1c;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9O7QyR4sroz5pD6I+kX3EyvJIXvX9Ibf1lzBnsgKDlE=;
        b=adsrto1cvTaMOiitHUl+ZwAdwSFhlxiAf8QMxRkDFKF+i7IQGPrZD3zTj2te5mTMJG
         Ad1JL+O7fWo98OEd+71lWibyaME0DNs7lExsI17Tc/Sj23V4YLrwy51dFbFd8mX7h94+
         qob6ltwPB/mXi5xFULah8xwMcFC/U2K1tL7Belj6e9BxC562Y8sKAOKGBpcch9H0QWmy
         6oPSkeAbZexRWnxJPLmXZIlSekLw9TkPToAGR+f4YlkckahsNcCDJkNBo3LOtYHbMjlV
         ZNdrWgkXANeuQhhjEEI9PevhL601Fxd9YLiN6CDNRtRcPzo+fgVH+UqtsrRU6S/uueaP
         tYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9O7QyR4sroz5pD6I+kX3EyvJIXvX9Ibf1lzBnsgKDlE=;
        b=Yg3v0zoNyZfrWIBnd3cOfcn7xBZcbsYLIqfaK50hdFDbPjEDRYuH/5o5utkJeodQMA
         SzDgL0GahTehBrAaIOmxc/3KFkQ+hLrHbEAHgkvCeF+DVjBPn+WkR13Gd5J1VHdUGG/R
         i19105j3ez5y0wjttcY5JzPeI8/Ek4P1DlpvSCX0VQbwTTktr16fy6Zah2j+0oJu7m62
         v9SG5B0/O2MwpjSyqdKgrx1OWIg3T22Zag36vHFm2kaLeW7b2ybj+5sTIEu7vZkJcLPy
         70ZNs0jHRoQ62XSTAdwvlAGXOjcBscp9NmP+nZofj+mUhDP0Z4u40LNlcgDrpi2wUcqo
         KJlg==
X-Gm-Message-State: APjAAAX4LyouZ/msipZyPVsHCLHfSmCkhpOLWuOFZWkl1NvmwhBWGaXt
	R7CdfrDiFA4Y4SKpWtp5+GWGkgtN1OTTyg==
X-Google-Smtp-Source: APXvYqzHyt/lzZ7DHGZYr6Z0bAPIgo67Tae487Sc8Er8gDosr1Uo3s6KmdJImFaY196u5qJKZUoPRQ==
X-Received: by 2002:a25:3046:: with SMTP id w67mr10914412ybw.4.1570457542289;
        Mon, 07 Oct 2019 07:12:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id 207sm3905897ywu.106.2019.10.07.07.12.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:12:21 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 05/15] target/arm/arm-semi: Restrict use
 of TaskState*
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <70f8f360-def7-5216-32dd-310a48ff1456@linaro.org>
Date: Mon, 7 Oct 2019 10:12:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Keo57FoxRB6H

On 9/16/19 7:15 AM, Peter Maydell wrote:
> The semihosting code needs accuss to the linux-user only
> TaskState pointer so it can set the semihosting errno per-thread
> for linux-user mode. At the moment we do this by having some
> ifdefs so that we define a 'ts' local in do_arm_semihosting()
> which is either a real TaskState * or just a CPUARMState *,
> depending on which mode we're compiling for.
> 
> This is awkward if we want to refactor do_arm_semihosting()
> into other functions which might need to be passed the TaskState.
> Restrict usage of the TaskState local by:
>  * making set_swi_errno() always take the CPUARMState pointer
>    and (for the linux-user version) get TaskState from that
>  * creating a new get_swi_errno() which reads the errno
>  * having the two semihosting calls which need the TaskState
>    for other purposes (SYS_GET_CMDLINE and SYS_HEAPINFO)
>    define a variable with scope restricted to just that code
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We use 'CPUARMState *', aka 'env', rather than the other
> options of passing the ARMCPU* or the CPUState *, purely
> because it means that the later refactoring of each SYS_*
> can pass just the CPUARMState * and incidentally avoid
> an ugly ifdef caused by the implicit use of env in the
> softmmu lock_user().
> ---
>  target/arm/arm-semi.c | 111 ++++++++++++++++++++++++------------------
>  1 file changed, 63 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
