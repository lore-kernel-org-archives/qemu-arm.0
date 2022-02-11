Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2558750lfk;
        Fri, 11 Feb 2022 13:09:55 -0800 (PST)
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr2274005pjb.124.1644613795264;
        Fri, 11 Feb 2022 13:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644613795; cv=none;
        d=google.com; s=arc-20160816;
        b=fH5ze5th967tOvsInGliW8gl06F6By40LCvfaJhvAaS/3Vhums5XnqZ7tnILCUl8+2
         abkdKO1u6pPciluVqIP+L1Dl/86TtQyEAnmMUWHZOjhfRSGH/TFGIUweP0e2xDG+ZIJW
         2blpxwg3bqsHgQ8iVOdvU1QaRaozpqatnTu2LgRycoZJ2Olb5t2fuQyMiVqCrxB5inoF
         EPhv9BanEPczais9SbGC1CFYtCBqUBIHO52i9qGSm9YlF5TDAhi4x6DF+R24/lfS5aV6
         /zx3gkJTqc4NUub9E0KAJWlIHyGr/sjj2hYz3HL0Rx5ptP9y+wFYB952l8p96zBsynqG
         cryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fFo+7znAgpAOvSbkgKf78CkysP09Agcce271x4EvgQI=;
        b=vuoo9ccBqs8gU8eUrOmv0S2EDVBagEcYDzvot0GfBg0SED+f1Vd4QfmBJ6dQnhXOhd
         n+az1QkXJ7lyr54sYjuX/8sCiKMaBng718T7Eccp8+9MK+cku9qQqX3rE5zTsaEwiqJ8
         63Hi9TKsj/GbjXIKVTmQNQ6z+WADblQXzYMK6CfEbqVtBUW6NL/Mw7309nCwrSD8CK0H
         HoY6hmbRH2+fmk1pxwIe3Ss4dkqWtcPx4vGQ2DT4NpsH/QiyccgymuOb9pe4+E+kfExc
         os0ipcahw682UtM+WYKU9Ad7X8Q4NRmIk8JbZABHt8S5/llYoZmUlaYNp7PKlfbE9e8Q
         iO0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF6g7z18;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g11sor39868pjl.31.2022.02.11.13.09.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Feb 2022 13:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF6g7z18;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fFo+7znAgpAOvSbkgKf78CkysP09Agcce271x4EvgQI=;
        b=IF6g7z18lPI8YwUhBPtp1LZmGXtPNTO6Ya+sCbdvsulRf43YnNnxP+Vm+k6ngx0YeE
         l0s1UmNTKLCKx9ekPJDcZhHNlDlwTlec7+e/2x9cjbc5W2tRT9NMUpgCzrydwSrso7F0
         /1TlZmV1x2mMDoq178PmPxEdHfSUlo4LBm7iyO7PdFlq5JE6Tbqs1d3Se8uITlq/cazg
         0ejd0UK1VZV28O/eBSbwFJ4eC3/VNSImN8O1mAAbS4I0zBHsDNTvUIRlcGiufkTP7DSu
         n2hnB0tzbxTdhVTj4ftP1chb0HR+AokTCcJ/TK9+/2yYvJXPQyVy0iLOfKO9kW6FmwUC
         rh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fFo+7znAgpAOvSbkgKf78CkysP09Agcce271x4EvgQI=;
        b=Dq5oR3cC7ootL+KP3d0/ocyYzReuZQq6YQ/G5IOyuI6GYSRCayJx7unxAQkZw9kpqD
         lEZOVXDWMJXG7VTTFB+n7irLjYJAYiWMfSS36/oxM7UkxwroiRyQ8JZODMGX24+IXC4A
         hu+3n3usAbM1CUtVta3pJBC3gTQE3eyEyIyCcs3o645knmqp5ZcRUT9gb+NudfiCZiyh
         3bgAUkC5g3jf5FAmvHOZfThDKwzfd8ofGJFjF+qvUUdpOnbNanXzdxtqFSV/yZTUbz2l
         fBxLvmCQlj0j9enqFHg0SwxKQkgwk28uITvcg2aAgXds/J/jOG7rASTrdJ0XT+9HcBEK
         Ppww==
X-Gm-Message-State: AOAM532J53eXBzXcJMmycObhwzZbN4ufC+bUqlGgFlQqFXz6XSbD9D1t
	hf1iTYVL8LjIxIsIuNTISepEUJtsYYDAs6V8Nws=
X-Google-Smtp-Source: ABdhPJxjP1u+Kx7O8dbsykurpWz5KR2LnBZdfmhQWwlif/S4mvVqElOH6MGiJgp0ClNiZiOCtW68Nw==
X-Received: by 2002:a17:90a:359:: with SMTP id 25mr2239625pjf.93.1644613794766;
        Fri, 11 Feb 2022 13:09:54 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.0.0.163] ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id p17sm28429214pfh.59.2022.02.11.13.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 13:09:54 -0800 (PST)
Message-ID: <40511e37-d277-00d0-704c-401e6c7254d7@linaro.org>
Date: Sat, 12 Feb 2022 08:09:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 05/11] tests/docker: introduce
 debian-riscv64-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cLqhEVqmUe0k

On 2/12/22 03:03, Alex Bennée wrote:
> Cross building QEMU for riscv64 still involves messing about with sid
> and ports. However for building tests we can have a slimmer compiler
> only container which should be more stable.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml                     |  7 +++++++
>   tests/docker/Makefile.include                        |  2 ++
>   .../dockerfiles/debian-riscv64-test-cross.docker     | 12 ++++++++++++
>   tests/tcg/configure.sh                               |  2 +-
>   4 files changed, 22 insertions(+), 1 deletion(-)
>   create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
