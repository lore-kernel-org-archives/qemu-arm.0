Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2309186lfa;
        Sat, 5 Jun 2021 15:47:49 -0700 (PDT)
X-Received: by 2002:a17:90a:3f8a:: with SMTP id m10mr23576276pjc.77.1622933269292;
        Sat, 05 Jun 2021 15:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622933269; cv=none;
        d=google.com; s=arc-20160816;
        b=P2aeJqv+8GM5gajqAW800rh726hIc9u8nNw39vj50Klnc1fprGE1+Gw1bCMifNkgDI
         LKQT2EDWradJzcUSjk2zhmaaPQ2+fwWwO1xKmEKgLf0k2bu4mb7TrZAoQHowCfHRBtgD
         8qs/fi8maMRxFjb62Mping3zSPHKupWhHax+JrugDl/X8qWZ0Dfj1Hqkuj+SFCX65hnZ
         sYNN/FbBs3dMTrE8yy+XG+5QyDTtIfjjr3aWOUPRaaR/A/nwmOUTsK8ruuOg1AlF+ai5
         UN8LAO5EvRbIpIs9WD7ZSNhX1M76humQBcwz1ZbgJcXnVIQ+d2q3+i6NPT2kh+axV2nL
         a/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=r6VP0pXIEj88RVIUu2JrN1BVS4aVkNElXgnqgzu4/4M=;
        b=FEElVrXVxptqPfhyryK46m4+nIJFU3CehvrKW4Vc/nKkoSqjtD1aZ+gPvVybQMS9Vu
         sdx2RH3UDBcCod0xI8SynR1leiIoS9vd9M/9gvNtWP3GQqY+do8Bzrqa7aTPr9JCTE3A
         DyjPfT3aVd+sT4hOT9krIfRN1TiY0t0hCghRWfVDFgWFaJvDSsjDOSx4x563keTdQMA8
         L8citmEpQ6hBAMsoQO9ezyWwm6Wx0GfjqTMoaBb7HOC08Ri0ea9HEJMVGbKl5gj0nzAa
         Ajqk2shvNUlvoK65XSa7uu2W7XtvNiVmzVmPJsHxrw5hVay3dtrGS9VFyemq53b1kOh8
         6Haw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n4IW5WFo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u3sor3089539pfu.85.2021.06.05.15.47.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n4IW5WFo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r6VP0pXIEj88RVIUu2JrN1BVS4aVkNElXgnqgzu4/4M=;
        b=n4IW5WFoEj+FqkKdlPDp9gLzTQyzGwfVRMIwj2K6OVh5DvBla/0C5/x2xcJhECHcVK
         Cz1lgrGiqtqf5qe2f183ynSib7o1wKWoEgQh2qJbWcb2K5MBnEkLDRbXlTWAaiTRUWuC
         fQYM5DfvDNyzdMOPHmH/1PrbfR817rlqKMQ53hsc+AHC1j5+vjuDCu+u8PIhCYtq+oSo
         yLtwUo8egftZ4gJHh5OHcYZCUX1HPQ/xJ2Jf6oDLK8iJbaEUnbAMArWHLvdWma5ydDwQ
         bL8xOwYpLmI3sTV41uFlVrtSlLJzkEGNiUpa6fvEYznOgs2qwvs4RHkH+PFYYlWLr7dQ
         PuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r6VP0pXIEj88RVIUu2JrN1BVS4aVkNElXgnqgzu4/4M=;
        b=j0dR5wWRT1SkBQqig+xPw2ucsKyg7Qz4zFbUmDLVmInYo/1us42zr0a1Vw5asqnbQD
         CtfVarG8RA9cWLkvaGkK+zVUgqH2+aRdSNs7xPh8PR3ktXKvyTlSqpJV4Y81cYjtxwI0
         /wbesQOKExt5/9r9gHJ9jbt8qxU6oVFva2W0g3JMFQtd86vElkZLkrqKvlQHgnhjFht6
         0Dx/lXhI5zpdLMHqk6pd9v/3MGM39V+LhbFUF656VUGAWXqP6cMiZVVlfeW8AZ1rEAk9
         1nH+IXzrI0cB5+MnTuPCl8KjKMhP1lOC+tVtCrNUB2ri8vfyFtCvszOS6fb3MqfC1UMV
         DcOA==
X-Gm-Message-State: AOAM531BmQgRMVoJ49ArNTZqwEjexl3BwHTxPjfGTdBQCdjtn+5/wh1v
	3k2MwaPsgu+TlzjSdnxpkn8WfSHASPc6Be1w
X-Google-Smtp-Source: ABdhPJxt7XuMc3vDEswXNsPuY51lf96dhruj0fOOgYcDiZm91AI4f2XdRVKXvU1lbK8rkS4mJ053Cw==
X-Received: by 2002:a63:f306:: with SMTP id l6mr11557464pgh.46.1622933268401;
        Sat, 05 Jun 2021 15:47:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id i21sm4664892pfd.219.2021.06.05.15.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:47:47 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
Date: Sat, 5 Jun 2021 15:47:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-97-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: m9UVqo1BMQVx

On 6/4/21 8:53 AM, Alex Bennée wrote:
> The assumption that the qemu-system-aarch64 image can run all 32 bit
> machines is about to be broken...

Um, what?


r~



  and besides it's not likely this is
> improving out coverage by much. Test the "virt" machine for both arm
> and aarch64 as it can be used by either architecture.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/cdrom-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb..1e74354624 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>               "magnum", "malta", "pica61", NULL
>           };
>           add_cdrom_param_tests(mips64machines);
> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
> +    } else if (g_str_equal(arch, "arm")) {
>           const char *armmachines[] = {
>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>               "vexpress-a9", "virt", NULL
>           };
>           add_cdrom_param_tests(armmachines);
> +    } else if (g_str_equal(arch, "aarch64")) {
> +        const char *aarch64machines[] = { "virt", NULL };
> +        add_cdrom_param_tests(aarch64machines);
>       } else {
>           const char *nonemachine[] = { "none", NULL };
>           add_cdrom_param_tests(nonemachine);
> 
