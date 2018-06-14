Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2497187wrq;
        Thu, 14 Jun 2018 13:33:22 -0700 (PDT)
X-Received: by 2002:a62:bca:: with SMTP id 71-v6mr10783046pfl.234.1529008401902;
        Thu, 14 Jun 2018 13:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529008401; cv=none;
        d=google.com; s=arc-20160816;
        b=CwOBTppE2dt30ah2U1m6nqx0VDGv8PRIcdxSLThqlBQDJ+ZqLSJ7ZCe2CXJRcKKVCt
         +Z+H6QEVYrEaD6o5xEa0nVReJ6LvwMIeAPrguhntqanOD1TOI4ji9oWtXblAGqTSFVK9
         zwumK006/xHAIoR/bG5h3wuGyNz0eP1IbShicYHBfCAivNXmAnD1INj0fXGeFFIyvvUg
         0x4Dd2oVX3MyZiE4GFF7G2yYdHoG92dvrzgQZOvwVxONUJ8jE/V9JRQG7yGyXrym6vQq
         7Hwl3K5GtPhVVSVtV5Dk6xXA+nNOuDiwXZaCmybHY0kK6aoob+tjTPq97eQPAzcs3qmt
         I5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ikojO7uRvZiv9cFA9uLXNAw7BbHsogyVkNz/Iq6whxs=;
        b=OyOABBRi3/MFj6qlCIqVbdcQjK5ojH+Vi3k99T2G5XptOxKezDjMP5nikSJmJKxU5O
         CzBrkWW8ZLNg77SM6M5rzKrJHuuGThNFkw+RSQYMw8M/YpAApeRTiL1U+SVziP2SMr15
         Z+LITZrXqrB4Tc5Dfj4nDQSeU5jxtRjHJk64DYIVEPEbm0D6f89wmK24AjEXAQ5KTyMd
         pwnIiBA87HMKaBA52x3OZ4qrTfSHrjPXSPj+mH8ZAihEBCKakS1ep8lVoc5VH6aLTqUP
         7BKY7PCy7j+AfKsEDbt0Kptztgt33qcsElyyJPUKVQyjQr/Kx2rnqAdbjoaRDkNGzib6
         JxYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjmrR5NZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a33-v6sor2252050pld.146.2018.06.14.13.33.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjmrR5NZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ikojO7uRvZiv9cFA9uLXNAw7BbHsogyVkNz/Iq6whxs=;
        b=MjmrR5NZx+26HhHfaWoXunW5AljcB28AscvsRDCmrUeG55WMwlo8aXWH/cKFbAZMPT
         c8121I/E7mK1GkUpV5LAb+Ou8j6s7LmQvxP2Nubfu7TkmbHCwYtmsoG93GJYOLYbhrA4
         LqajdIFKsTUwEALJcOk6hHE//azYATqVXctEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ikojO7uRvZiv9cFA9uLXNAw7BbHsogyVkNz/Iq6whxs=;
        b=CVwYTXxicIEM18nat702CUP1zrVIiU4k1F2Rg6Xf9Lkjfb3ylG86DKQUMlTbv2ebMk
         VCX2NzQ9xYfcCAgUkB469gfuVcnIWdvJI45Iioaj5a8hSEO46Jj9RSU4DNY0sspGOkCX
         ALJM5xR9R7AA/4uJqVyA+c1oXRalRk+uW239UtIXvPHfH5/XRpQ+i4ERkr0zBstBe4Ii
         b6hKPkj5hYbK1PXeZf+4hCZxII1tT3B8O530YZJSc//h6fClkwqlYxEopS5ycMURgvUz
         oYORkPrpMhRblLiF2hDPL5rPvdCHbPA01mZoAtkkSCJz1ihcD0IRmjUupv9B/4Ewd5ra
         7TPA==
X-Gm-Message-State: APt69E1Rwx+tpWieIkCfCQbkLG8TO1ji5W7DDpZh3c6pOUfZMkGdjI6/
	WjfiCOZbk+2DCcIY5r7p0z/wVLu+
X-Google-Smtp-Source: ADUXVKIaR4Q+p03e8wZ0r4OiZWUiMtGE4bIOl1LOw+U+/8+w4ESVldViDIDY5CKHk8Za3PG8kzRqYA==
X-Received: by 2002:a17:902:8486:: with SMTP id c6-v6mr4566019plo.283.1529008401495;
        Thu, 14 Jun 2018 13:33:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id n22-v6sm7569885pgv.60.2018.06.14.13.33.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:33:20 -0700 (PDT)
Subject: Re: [RISU PATCH v3 19/22] risu_reginfo_aarch64: add support for
 copying SVE register state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f25a71ad-4ee4-0064-4e27-67e4e7dce7d2@linaro.org>
Date: Thu, 14 Jun 2018 10:33:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ZdekOV2sU41h

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> Add the ability to save SVE registers from the signal context. This is
> controlled with an optional flag --test-sve. The whole thing is
> conditionally compiled when SVE support is in the sigcontext headers.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - support EXTRA_MAGIC contexts
> v3
>   - handle conditional bits
>   - include <signal.h> in reginfo.h
>   - move from helper function to main init function
>   - (void *) cast for memcpy
>   - additional ifdef SVE_MAGIC stuff
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
