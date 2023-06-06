Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3735145ejb;
        Tue, 6 Jun 2023 13:35:08 -0700 (PDT)
X-Received: by 2002:a05:6808:b04:b0:39a:bc5c:3975 with SMTP id s4-20020a0568080b0400b0039abc5c3975mr2877721oij.17.1686083708536;
        Tue, 06 Jun 2023 13:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686083708; cv=none;
        d=google.com; s=arc-20160816;
        b=o37GkW5/t+UELk2FsVsKcPyF3v1WYM5SfxhO0Ufb6HbPnuq6EmSbzLdMzXHD7obVzr
         m6XfFp/TiTnKkwSiXxe23zCG7CkevORvbFz0HRnZApVR+nkCpKoR+ecrz98ZPAkP7SXS
         NK1qSxbVgnsGXZtrbX6fbjlukJn6iG5eTMshDVu1sqk+ikzxVVfGGFldalPi8Qfdm7AI
         16tkzLxoRhEeGLG1yYRNcIqwx7hNuNw54fTjLdBSTVIOtsWAOTGQBW4R10E4Gzral1Pp
         Efp5yROWCPuq2qQ2ZaX1v0TxX/cjqGNbzcRgdH4Xp5msI+lDqXR+CYU1iu9EotbSA3q1
         ZFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0JBotc/qIEtK+5N2qBf6KHpPBVmCH9Jae5s8Nn7fNcA=;
        b=OKuB4RMT062gY9pQfVu5H7NQBe0HHU8Q0nMPTYf3kN9wYALf8UUxMyle/KHZTNP/Wv
         8Vg/5/z35F5FGqlZ65T5uJhnQmiivZJ06VOb/3+F20UqGgp31lKD+BLxPB5XR3RUU3mr
         iWMfeE7JSCthxlGzYEuTnaOeRcwR3AR3/Dvg8mnM4LmBI0ev8EMEUX7DU4lthaOSqX9k
         yOWlVFRPsAk297+Pjaq2NgGDhrQUMeZmkh8dhEs/lRH3qiCwiXZFPKsoMwadcL6H6yb3
         3vPLFTGsZfptsf4BfnQypR5yCw1UCTXNCClYIWTXQKz/uLifYD+1janRGuRK1ZjpwQF0
         +dzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4g697jy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w124-20020acadf82000000b0038c658cfde9sor4109996oig.8.2023.06.06.13.35.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 13:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T4g697jy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686083708; x=1688675708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JBotc/qIEtK+5N2qBf6KHpPBVmCH9Jae5s8Nn7fNcA=;
        b=T4g697jyUs5bOxQF/NRjXCs1NQXMlAysB9l+qvPTmTgEnfcb8gWi7x5MglOJRGEwJm
         csc1Dvl0vFoowiSshu0OxYsEl4no61gdpkhoKsNi2JU3D+MT0eMymdvEXAQb/fuES8Fl
         lbABdOBJVPAvn31MMGq0uLbtg5qDVLgBYu8CKXa0eY8nlk4DWJKg+BOJ9aE/C0XnEOjQ
         2neKh8/4GgGl3Ayf+hXg0LO9VQ8HpDAX8UTrssmgGK7oT3aQhhIBUhQQWhL7DhGultTb
         iXbjLkaECHfKienmYxrW1Xnj2haRftCgATGd0G10FAj+H2JuZAQ5NnQ7iZWnqNFMVFSG
         BMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686083708; x=1688675708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JBotc/qIEtK+5N2qBf6KHpPBVmCH9Jae5s8Nn7fNcA=;
        b=D78BbcT5Z1WqftimpcdtmDJZidv1yH0L8Fhy63Lj3Y3BIxhjOf8t74EXYfZPqhv7Gy
         ukgG5TdzXfrmbqibkmMMzup9bOgxeCGIBWJnqngJppf5a8lPeIf+hLv0IISKvbT7K64n
         x6+YEh9Wu2X3u0QbysL31mgoBvku/ZnEAQBqqxNcoVEM9f82izSdU5/1b+OUE6NCYwDk
         gTz8Jd01zvZTFlem1M5aze8OrMqm8DUYz1uvuRGJnSkEi9AHyXbqWkzsRzg7ByXL4IzP
         jrIe1QX7vMC3mDVxM7CGJZVXf/EHDjC6ej2BN5Rj28Zy1ggUvqMM0EPW8WoqH3wJ0KRw
         gCXA==
X-Gm-Message-State: AC+VfDyOGS5aUMweAZy2GsYyn3CSrns3A8lkJGvFTfkvmlbtKCewImkd
	qP927HzGhwDr32xwA8++aH3IlRkU
X-Google-Smtp-Source: ACHHUZ7h8cByxn2DsjX6R4chZAfxaLW42HX09YlN1im6nCnvXhftA/NsEkHAATzBVIkeSCAEdBEx9g==
X-Received: by 2002:a54:4588:0:b0:39c:4553:9644 with SMTP id z8-20020a544588000000b0039c45539644mr3016392oib.42.1686083708137;
        Tue, 06 Jun 2023 13:35:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a? ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902aa9200b001b20dc1b3c9sm4441343plr.200.2023.06.06.13.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 13:35:07 -0700 (PDT)
Message-ID: <dbeb72bd-ea92-a68b-e663-fe2b41525957@linaro.org>
Date: Tue, 6 Jun 2023 13:35:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/8] linux-user: Add "safe" parameter to
 do_guest_openat()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-3-iii@linux.ibm.com>
 <ad49111a-5dd9-671b-f18f-009a7eae73b0@linaro.org>
 <3c3df53d22f6f122cd389a9ed748c1655f8d77a6.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3c3df53d22f6f122cd389a9ed748c1655f8d77a6.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hafw5dGIgsv4

On 6/6/23 12:29, Ilya Leoshkevich wrote:
>> The only concrete objection I have is the change of API, which could
>> be fixed with return
>> get_errno(openat(...)).
> 
> I believe both openat() and safe_openat() return -1 on error and set
> errno, or am I missing something?
Oops, no, bad memory on my part -- I thought safe_foo returned -errno.


r~
