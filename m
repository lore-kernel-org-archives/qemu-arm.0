Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp700926ejc;
        Fri, 13 Jan 2023 13:49:04 -0800 (PST)
X-Received: by 2002:a17:90b:3718:b0:229:2a91:c8b4 with SMTP id mg24-20020a17090b371800b002292a91c8b4mr3115423pjb.37.1673646543865;
        Fri, 13 Jan 2023 13:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673646543; cv=none;
        d=google.com; s=arc-20160816;
        b=L4IYivI3exTS/oSl0G71tg6o37qJD7gVUK2xHWyZF6mNU6KbvC32ctEfOTfRKCm0af
         qpSgdm7Fp/fii3aIpSc7ZfPsmh2XgHg8+1u0q7Uva8g331kJHUfqe2R46KLZ4WxyRQMz
         opGLmbDqiuszgek29kpqGbv6hT3C6G17f+wYRCNiV8oDvKIoutsSMPwCj7KkdLpCw7Ep
         ZfpImniAmlycityW7n2rNz4+BqO4ZDnUAEs9GuYZ5FfeaTpo4G3u3Lfh4R/JepyfT2jt
         2zzvErVVvxHP4ztFSfbONAZJwHymfvKnDYwc/d2/B74sVhxPoTzjW01m+rG8mIi60PQ8
         /chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mk0ZfECJfbnCTsf2tCogm22kYy70CHHuS4Z4oKQDJn0=;
        b=iJhV5JJCL4MDUsFc1UFVAGcSvp4bmTibBFjzVBT2w7NrAM6afR3+hYJzg0UHuNPZur
         cXfDAVXysHLGNpgh95AiK/XjmDv+yHKmKGGIDmbScMCqDotuWLNThkAmkOj2/PVhe+aE
         bXrxxrAYemikG9wPY8/23LR3oLgykDfdNHS4EOMIcmoq2vb4qKDtYfgYKY9JUuhNd6h9
         Zx2zATvRStG9OhaYr8CbnilTYDcvJYUxxse3n96TWrnI1VxcaC0UyLk3clkmh8N2w+/N
         9Yzlp46EnUTLNXxPMpzWYHHpbqsInKekqE0dw3OILXnGgHCK3CCsH4yb/RpYrM+ebOVk
         28tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhXURGGw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x2-20020a17090a46c200b002191a9dbf98sor12016671pjg.36.2023.01.13.13.49.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 13:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhXURGGw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mk0ZfECJfbnCTsf2tCogm22kYy70CHHuS4Z4oKQDJn0=;
        b=fhXURGGwDlkeW2VI60b686Mz6kuxjTS24codg61tDFYn+ojt7AArnvO8LjeC25F7TJ
         7xEMIaMC377L+uppmw+yxEz9XYXn4Kp4V+8Cnr8qVJy76Q27NNuksyd6ys/LM7uzwYHr
         y9R4KNBV10wJbjyoVvMrXeZVweA77L5pmmXrqVzBKmVnQdJri2prcYXJMko1RvTVUBPh
         EHnhLH/hesrpbxZJX89HU292arHJwqNXo1Ss6/KHUmvWMtaTT6qnj5s2/ou28gZysViw
         duQtH9LN3O9S69kfoILiVJfqRICQpoJPnL3lRLyClLvxD2obroDM9obbU9A4js5jtGPv
         tN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mk0ZfECJfbnCTsf2tCogm22kYy70CHHuS4Z4oKQDJn0=;
        b=zYqFlsyy4kK4d0QkZawSMVXlBqUJsEFsUwlZgvldLjiG2VYTRrQ2mYuR0MLSMzlMxS
         rgYknAC11fSFuU/o6VekHBCzlhdfXxfav7VeVGhJFFGGShNMznxPYz+JA6eun8PvDEIR
         /5Uem04TUTuHAcN27OhAaPWUR/p6NX/FELW7wGJmvm+qr8ClA0z23wwkponXG5pZ+PeC
         6NVDx6Ajr+N/gY66LpbTw/CCQrrh50ryS5vax4fsdeRfH3VCMsWZVuia5mllrx6Ey7u3
         7ksompqZcR8C4MeisEk4IR+WlD5WtW7F8mOGStbyiPh80u53HtRNfYHD53vsI6r22OiQ
         9waQ==
X-Gm-Message-State: AFqh2ko4AN4hjYvK0ZNEnBOqwoVWACvGo5B1i41fZzYgzsXG73u7cH6Q
	4dyb0VTrMRQ4ZIFBksjYYVaGVRnW
X-Google-Smtp-Source: AMrXdXs/xuvotcaA/Qa5i2yctMBXbrLfNyLf/Rnv8fkdDv+tCmTEW6NP6jh6fYNnAMh1hm7K9Vxyvg==
X-Received: by 2002:a17:90a:b110:b0:223:4308:1ab4 with SMTP id z16-20020a17090ab11000b0022343081ab4mr84887435pjq.46.1673646543427;
        Fri, 13 Jan 2023 13:49:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a5a4200b00219220edf0dsm12860376pji.48.2023.01.13.13.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 13:49:02 -0800 (PST)
Message-ID: <8e316d5b-1b4f-56d6-3ad5-cc4d0a200fcf@linaro.org>
Date: Fri, 13 Jan 2023 11:48:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 05/28] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: N9/41gqPepHX

On 1/13/23 06:03, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
