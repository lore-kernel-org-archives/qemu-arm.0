Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2041777lfq;
        Fri, 25 Feb 2022 12:26:03 -0800 (PST)
X-Received: by 2002:a63:4e14:0:b0:374:4a37:4966 with SMTP id c20-20020a634e14000000b003744a374966mr7541797pgb.118.1645820762836;
        Fri, 25 Feb 2022 12:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645820762; cv=none;
        d=google.com; s=arc-20160816;
        b=MVdCnM6dM+7Cv7sVAP0JtK6LmtvZ33NwsvtJXF9Su/H4oc9OpfFTVavRxvHhS3ztT8
         EUTTHnKlVqPKrZenEn//9gOKpzwvLbxYPa+EGGMzNiUa48CEz/WX2WlOj+EXUiRg1xpS
         5jz3z8q1AUYBiqRCthPT3vsTftJjrjbLeMQtpX0dcaC+sX/ODOXlN2wpIfAjOFhYH3nB
         nJsTf227JdrjZtxFyYHImM/yYZnN13XJqeJ9JSqBhXIpn2VLxp1HJKpuTZpG/t0+ykcI
         MYQeAoQWGybGnQLiwmv1vl6Jm0ow5xEnxgX/WaA3myphWhKJlvIusGPw/xlwz3Z0JuWP
         jW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k98AsEPV/ivVoIvbylNpjeLEa0XyMim+clW4kmDPBqI=;
        b=wsvc18UjhtMkfSCW8SZH/OfjsrKtOCPJwxOI2oLyeaDDdPfDFLCsIPWFk7H0g3MaRJ
         NnzECRV5e6EhwrGJahYdfc7fYc8MAUChM7A4O6A7jLfpcfRGuQOwfOpz0u87eNfG3t93
         7/fjuXWUJTez6b4/mvgggXl22h9cxAvjdDXBJzyw5xVQD2dPKHJED0I53zTKFfC110wt
         H0C6izX7Sf/k3XF+xD964p+b5mhDxc6ULwbixEV2JReZRPIFytiSkkJu9y6AB7u+0lyC
         s7oY60bcIzDbROYcTteI1o/whCb8JFnQRJaKeZVcavCEUj/tkBxykIlbt8JLt0skQi63
         MAog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+nYpLE8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18-20020a170902b71200b0014fe928998fsor2532996pls.63.2022.02.25.12.26.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Feb 2022 12:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+nYpLE8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k98AsEPV/ivVoIvbylNpjeLEa0XyMim+clW4kmDPBqI=;
        b=d+nYpLE84VtNyn3TzhJ56hS8ZJjJjiZqTAtkiU5RFxrjKLnP4PKqRoJbG8+s4IBzr3
         4iYSk9tsUe5dtVjY3ottfWZcXrIGkjJtCAdCm1w9cgVN6jDQJlBEkiGLFf3aocI+/x7O
         SMGNNnePFdngmEhvyCH2pgtVvIMMusyMJFesB9jHne7aLR5nX3VOXsS2+QaoFGwDfnpG
         cyP7dC+oh58wyekS4ddzMsS16scQkdygnHxA9XHX/VUWsAQddbRcdjLV1/blffJUK40f
         juP9MxdXP/ydEs9s3wMW6FXwjFf+jeuB6i//opRRfmMIe19FBx9v/v6qqkq45vXa0Gjl
         0nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k98AsEPV/ivVoIvbylNpjeLEa0XyMim+clW4kmDPBqI=;
        b=A8/kR+Hac2pwLnpfglS5+lpZst+JgvUQslwPKvadQ2LgdET/HlTc5M6Q9r/xMmZL2J
         Xa1xI8ovvlRvuYSVBjIOBtHMXvsC52kFOgrhKfn2vh0fWFxSKe8owyhVOokX8SwNBZUQ
         ZQq0GNyCkDgdbaIzcrOV2bLA9QXvKQom3ScQ5YNG26qp53bVvHj37KSj/BQK/xxreCp1
         Uo4ccnc+4TEjGOGuXcS8kEFkyqNupFLRz4FvBSABFBrRjL/JtjJYf+ZjHeLBVe/6QbJf
         n+DyIHUTPnaQXF4NfdnLLvMnb20nXyyxbStpBZ8KdUocbjn7wFJ6iU9HEtF4APs37dqV
         kdtQ==
X-Gm-Message-State: AOAM5316BLkpdJNLNlG/XhFp3LT4RaME67qH4JiHCVdcmlu37pbBl6km
	zt3mmdjLQFRun/9MvKLcrl+7pJs5Fe/70l33
X-Google-Smtp-Source: ABdhPJyTda4iGtdnimeKspMsF8tOEajfqPdMBgRkKI4JARI6h8c7fzrJx9hx0LVJng1SCshg+cZVfQ==
X-Received: by 2002:a17:902:aa8a:b0:14f:460d:bf2e with SMTP id d10-20020a170902aa8a00b0014f460dbf2emr9129105plr.144.1645820762290;
        Fri, 25 Feb 2022 12:26:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id s33-20020a056a0017a100b004bf85a94ef2sm4431536pfg.183.2022.02.25.12.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 12:26:01 -0800 (PST)
Message-ID: <69321870-5536-f5cb-b2e3-27ae82e376ed@linaro.org>
Date: Fri, 25 Feb 2022 10:25:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/18] gitlab: add a new aarch32 custom runner
 definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, sw@weilnetz.de,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: K06xwvB9RP66

On 2/25/22 07:20, Alex Bennée wrote:
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
> @@ -0,0 +1,23 @@
> +# All ubuntu-20.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +
> +ubuntu-20.04-aarch32-all:
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch32
> + rules:
> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> +   allow_failure: true

Why only manually run?

We do this for some, but not all, of the aarch64 jobs, to cut down on the runner load. 
However this is the only job defined for aarch32.


r~
