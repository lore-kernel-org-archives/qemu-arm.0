Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7523259wrm;
        Wed, 16 Oct 2019 11:47:14 -0700 (PDT)
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr42568583plr.308.1571251634734;
        Wed, 16 Oct 2019 11:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571251634; cv=none;
        d=google.com; s=arc-20160816;
        b=G4UIiPzLOUFTVmCoT1HG9Sxutg145BQ/EGhoqhDpNGeaILdweFg/m/m7bRE0Ngp4FE
         UMdAvvxDBcOFUTwJV3zxNnbvFg8jPIi840m0FUqqpYf5RKcXqDWLiN7Y8J+3j7G125E1
         BhQJtvo2GVtN7DXupvREm3WcPers8onfnPzXzcx3CkkzuJ7OQ0twBZ4NwXEvXTKm91M0
         1sf7Yb1swDDumSoRfGMzy11rGLoWxRblTOPIHKE7z+8zKMT9vmmAViQQGyN5784RcN1I
         cKAqnnYDuf+p2vxlKfI1Q43xLxc/roaY1QW+WS/lqTv+JwhAO41oRbN8veW1tlD01ke9
         +6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=oT2+I5qdl/QLcnFXPgrdDc5+Ul9qm1xEOgzalw/cvs0=;
        b=IToyxNefeR84j7CoD5k/EsoD+YIFU0wbRnGDN8xRtnAymgJRdKgu+2ydnIxpt2d0MC
         bLo81hY6kVv2Qmj1bdwuIqDG4HaE8LxByfpwy+ytp1gCVB4jaWta6Q1V6QrHE12DQ9i6
         Jxu2QYmJwncCkcRymDq8Ck9Tols7hBm17rfPnuCF8iukwuid/iW1wM/yb6gnUdLJp4E2
         66jAItUvovUf0gv1Kc37kvNhA2WgugnYj7e0zDZilHQEiRsIciMFLpELtIdigcz/4FJx
         BcTBw9Fv4SbMXuHNS5VHdHcyg88dzXeCnsbNKukwVv+Uc4BgOvptQcVbEWFoxWD8rWRV
         41tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLnD2Dre;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p2sor32807047plr.25.2019.10.16.11.47.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Oct 2019 11:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zLnD2Dre;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oT2+I5qdl/QLcnFXPgrdDc5+Ul9qm1xEOgzalw/cvs0=;
        b=zLnD2DrepxfTHtTcvXdKGcyHKW+ovg0E0vsRVCgRPXcrVCzAl7i5DGZ7JnpNm8EjRQ
         FsdsVUyxdXzFo+Nc6M2kvi9DamhCzOEgd8KIXuy0MxCvzGtaui8XOe3eUegrFm/tMCLr
         X8hSPzLgrGdH4miEdndq0XXXrGkzW3nJVbufsXjIgjcIvJGy+wd3IvvQ4rfybIriw44T
         EupJyO+M4sServ4Ip8EN0avK1JUzvi4DKygHjfAa4gtIiDCV3RiHZH1/VcZxmjkMvvvF
         0vhQh/qeOYpt99xJHmS2T/Bodu9yaHu/SqO+68l8ZsbZtRG0LVI/vOaOchqxfWEWy84z
         HBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oT2+I5qdl/QLcnFXPgrdDc5+Ul9qm1xEOgzalw/cvs0=;
        b=tEq9FZ8h9ocYQkEnM1OQx1g7Yt7f87dI5yqR5ZG6tokcAe0CKCsGVIXWDCVYtq5Wuw
         r+UpXh7zTQX7vbSYDQuqoSQFf2QgEH5J1MsoUeRDHF2SX45BGz+4KZXXzOfTNaaj6NaP
         vObHmANmnUtSOnQAsFUDbbS0Fk5F3h/M5NrsQdXavb7dJmAKvyoO18vitxCX9IPIps2b
         y8bXA8u2c9dy8S6JRIfKEnBrXrsIj7GV5f9/xYMsATR60Epm8a8/+AE/Lvse4CxR7tou
         7jdjynQKF0y21E1KCVhHPNxnNHo0a/GcUr1oSlV1nGwxKKGVCL5VkVJ6ZrGMG8JNNRZb
         +spg==
X-Gm-Message-State: APjAAAXSCGl3n3Kfxj9TG13XgCczyE8zUWgTwp068wnU8uvZAbUNzOpl
	qBK65Mjod/yiTGkwbQIMMdABSd8E
X-Google-Smtp-Source: APXvYqy3ewcJzxaD6WF1L4Bxpuw6Unn/9Q6FZ9gWUlfhwFZ24tHiqQpHLpdfEQrKMIcpt3+cvKdyXw==
X-Received: by 2002:a17:902:d698:: with SMTP id v24mr42533639ply.89.1571251634179;
        Wed, 16 Oct 2019 11:47:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id z20sm28312087pfj.156.2019.10.16.11.47.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 11:47:13 -0700 (PDT)
Subject: Re: [PATCH v3] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, Dave.Martin@arm.com,
 eric.auger@redhat.com
References: <20191016163750.11751-1-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <13c4d99b-2e63-af31-1ce3-5f733c957d11@linaro.org>
Date: Wed, 16 Oct 2019 11:47:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016163750.11751-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: vxI11nSiT0bU

On 10/16/19 9:37 AM, Andrew Jones wrote:
> When dumping a guest with dump-guest-memory also dump the SVE
> registers if they are in use.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
> v3:
>   - Pulled sve_bswap64 out of kvm64.c and reused it here
>   - Changed fpsr_offset and sve_size to only align to a
>     16 byte boundary from the note payload offset, not
>     from the note head. Doing this makes it consistent
>     with the documentation and what gcore does. Testing
>     shows that the elf headers and gdb are still happy.
>   - Added blank lines between functions
> 
> 
>  include/elf.h          |   2 +
>  target/arm/arch_dump.c | 124 ++++++++++++++++++++++++++++++++++++++++-
>  target/arm/cpu.h       |  25 +++++++++
>  target/arm/kvm64.c     |  24 --------
>  4 files changed, 149 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
