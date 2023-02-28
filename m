Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5671577ejc;
        Tue, 28 Feb 2023 03:58:58 -0800 (PST)
X-Received: by 2002:a05:600c:35c6:b0:3eb:4501:6c60 with SMTP id r6-20020a05600c35c600b003eb45016c60mr2156639wmq.5.1677585538459;
        Tue, 28 Feb 2023 03:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677585538; cv=none;
        d=google.com; s=arc-20160816;
        b=VvjyNzgbtEIUymp1Su8NVfhAsS4tB1A88MSQswWWramCN3TXgJXdP2j0hz850py8Fk
         54V247PRLULiCrtiMypuGB1bjXJ9u2q9UDtSDMllSOw0XP+tXupY9sEUBOCB6gE7/cCz
         Kk8hLlDzIMuxTif4kaPdeDzdrdn22mvRND8IZQDVrMxtO68DLLCMSabTAPDcTYzdLSdw
         +l/6+Rub8jtjLM/F3rHumabas5BHfKKmL2lzkSrckJbZi0/DPAFPaIZaVeLKV4ga4HtX
         XFOatcAyqHx+gphZyb62YARo/pG3LkMEP6s8WazrG3hmHO66khC2dYvRo1lOPRzuDSqM
         XGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Cu2HY+g3VzeC7uyCoEf0D0JLI5yrMiBoPgvJVLxHObg=;
        b=Wx0XVrPhZZBOe2SVybCL2rlWwecKkbkR62dOolRf4ix1wdEpPpNl5yWtyyS8rjBdoe
         aJWg9V4yndIRSuVWDmE0BkrnxsATUNmL0DhWXm0cVuFkmtEjNS1st1ENFcjClAlTnMSw
         leiHRnB4axb3zPEVINM+SfSL/j/2sFDExg/ryglIdwhLdFKBj2gcXllJvjUEHNDnjqqI
         Sw97fcZpqVVrqVAX9/+XNpzfsrtGf0wOdVL4QrUg328sJfHxMF2KtqpUAoJEzaX2gFYs
         zeOelaTTwstOpr4lskLDnblNKnISaqiGbK3jhCuuL+l41tnt9KvbkdIx2Edz6r/ucF1Q
         JsjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5gTV3+M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bh20-20020a05600c3d1400b003e213413188sor3917655wmb.4.2023.02.28.03.58.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 03:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5gTV3+M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu2HY+g3VzeC7uyCoEf0D0JLI5yrMiBoPgvJVLxHObg=;
        b=h5gTV3+M0jFAcKNrhJwhcVnjKeZcT5o4APilOMlg45MVRZCAeN6VkGYCX6zOtWXcMF
         h2/EvAI/ci4C8TM3/oMobol0t54ZIbQA5KwuoJvki8bbEDlXIca3xv2Tb4KM7yBk3UBH
         +qgj9kPgZfkb+VtKZCEcF+Z3KZfKG+OcnbV/6ZnAwqZrLj08aZGeJDURiKCib7O8c0Wk
         Jjihag3hcqyD6LKBYpUVT9o68ocD2uCs0vA47y6Dy+SecuyIBMSvmSmvk9ADutroK/g2
         TfgyePhQMa4iEoMyNoDGQWg6FJn4eCaIcf3qzf9QWGekyJMJRBE94vMCfizqVpDdFQHK
         AlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu2HY+g3VzeC7uyCoEf0D0JLI5yrMiBoPgvJVLxHObg=;
        b=rameXOIQlkRGNaICvlBNzW+DyotZpJI7RYTe2e2fexRdU48qdKe9EHGyc97QeTzadB
         8gcrmMn8fdhVOWubmyjfL2RWF3YPfqxWjhKt6Pb2cgiH5/NMK1Ohx+EavlQOzjOXUeNz
         fiKdFNmT2L39+3B1jDDSKoxv/ICbA+dI/1neMPbipGlFzyIZEdaMKAAHygH/+tFIzFi6
         ykYxNTfHCqEFtsnJOhXKR9lvj/HH3Vxs3R1c2+kQ3S/KtGC/8sjbrY0brWgRVNJMbCLu
         Qb8glxB2UBEOayIkTkmCmFPBGzuZUFuazkOXMRosPKzzT0ad2R3sQ0GH3UB8zyEDieOi
         6glg==
X-Gm-Message-State: AO0yUKVwXG0Y1SwqDgkn4ncz1sgMcRyi3MuMU7QVY4DmVg1e7GdzAtYG
	dhNQwkG2M+ZLwXlsqgsBJ6yFqVObjyrWjXOwQMs=
X-Google-Smtp-Source: AK7set/San4WGyyTQLKDreCmQvqDw1DBGczJLSFqL3CM8aRwh64BZf+xY8i6kt/18LeFzWd3y6sHow==
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id bi15-20020a05600c3d8f00b003e200d3b2b6mr2064158wmb.14.1677585537952;
        Tue, 28 Feb 2023 03:58:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id r14-20020adff70e000000b002c567881dbcsm9635844wrp.48.2023.02.28.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:58:57 -0800 (PST)
Message-ID: <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
Date: Tue, 28 Feb 2023 12:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /zGId1PXUAmu

On 24/2/23 19:08, Alex Bennée wrote:
> This series attempts to remove our dependence on the docker.py script
> and build things directly with the appropriate tool. I've been
> noodling around with how we build images on gitlab to see if they can
> cache better because the normal case should be we don't need to
> rebuild everything if the upstream distro hasn't updated its package
> list.
> 
> Anyway what do people think?

Removing dind limitation is interesting.

Unrelated, can we tag registry.gitlab.com/qemu-project's
docker images along with releases?
