Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1334634wrh;
        Thu, 9 May 2019 16:01:52 -0700 (PDT)
X-Received: by 2002:a62:86c4:: with SMTP id x187mr9023450pfd.34.1557442912140;
        Thu, 09 May 2019 16:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557442912; cv=none;
        d=google.com; s=arc-20160816;
        b=EdAQgag4SkvILKOkq0jv/XglUdpsXaPYuXFT3YoHPDZJ+gMabkQu8qc7Xy6U3AmIiq
         obi5f9CVxywbX2X3aLaUCn7CXFMx/+0o4GHDljtZB5Ypiex+48MlDygAj7ksAq45zQiH
         UAHPyJmFna6wtOyxTwOBy+yGXwrOPdY8jvBOVwJDV+9RH0108dVpk76ITEocWaqmUFlq
         3mA363QA0psbXPFcj52k310zs48CEvsd4BqGvFdDC+s26PcFpUgS2K0XnXJVJZaDSRsL
         /JcqtlwI2sXK3gu+Y/kUllrHwWr6sP8h+uJUtE06bIVOy4CuxZAhGuMjEANOCih3FWAy
         icsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=fQ0fJ3BpmsoRpSWmJsQf9gAeBoJRo+AWJrSZ1+uijU0=;
        b=0aDvRmWt7PJq5U1pHM1TW/+QL1yhWHvIjJKRFwQlXwAFzjQm7SsglipylLS02w3c3i
         GEBO0w1VvWx7vhbAOuhYyQTiyCcqjMj+Cqd2YPcdmjkPFDdFvCR8seWCmmkXHgpG4wI8
         OZ+ZpQGY44CzotuLcdQX+Nlg2v0FRfzor5y6HIKyKL3qOswv24TImctqCIOfm6Al4thU
         EckUw9cVwhEPJ32NfRDVQJnS2E1YVuNljwsunEQjrf2JpiZ+CixjsOq+/KLOr7Cpyv+o
         NfkJSNVp9nyoI8UjIfw+9tdXLMww/vaDc2f5UV4LpTB9jAk7w1o6UZHLTYyvHOiVOMnE
         8dUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q41kKpB7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k33sor3809254pgl.60.2019.05.09.16.01.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 16:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q41kKpB7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fQ0fJ3BpmsoRpSWmJsQf9gAeBoJRo+AWJrSZ1+uijU0=;
        b=q41kKpB7WSKhgBqgw0V+XBM1C+muG+qpqAxKu6m0YJ/7V2o+xd4Q2rOhW1oiTonJqn
         E1sVb7mIkVHXKT4Yp9MaCgAVfIt44tnAFhwStlbbS+VRMqMJloQt27+vnIQxOdl8777W
         qwi6sYSRiKw2xaojWFQ5H4t7RSw9ypKCj8cD7LEaJd5mrpne2FOqjxwP0/BUJen1h42q
         /+bON9JCa4lDDVH19kZ++/dCuG5YAs7tXd0w07wf2TGxzy2jZI2PMOgmlbjUwh/Nm1ja
         nbQXsp+Sb9eByU//Uwzf9fw2YPVCnJEOFjJlAkTU43IVDxGLlFfGTH8naYUf89GuByN3
         uIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQ0fJ3BpmsoRpSWmJsQf9gAeBoJRo+AWJrSZ1+uijU0=;
        b=LknMxwXVcIkoS2dgN8q6ZsYJB9iQvSLLmcEnY2KK7HPKKFMYaTyyDZjyzr8j8e5/yx
         grznVhveSoGh82nJgXcH9EY1R1G8c+n6Qy5Yn86xiC4Q29TqY4j4S2Z/0f2LHbJ4z4fA
         EFzncgx32F0RKuZ3dRXjSFe4l84zHFowwJgGOSfw0XYMzPaa2yP/AmYdSxvlBT9VzT2B
         MAJVOSWOvYqAgMP9CeubPC1Ef+o1wPtzIp8rasxyFVawv7M1JntDNr1smkwPBK5qm1tS
         /VLxaE5wuSrrlfHup2b86yO/Mu1LAkx3IdlwcRPzN+sUHF0h9BTKjJez+oLY/bmRjuO5
         mvFw==
X-Gm-Message-State: APjAAAV+45KaGbFWZ6qKiSV9OgK6/SMqutjA8a9l4rbjNvwceBcgB5z+
	fuy4tJXErsUgsid1GNUwJjD4/9+Z
X-Google-Smtp-Source: APXvYqx2Kj8DJcctdNuHhQfKLozFXF4VnzfsJtJRMqttzDVpt8SvhXW5PcaCmZZE96UTOudfcq7KnQ==
X-Received: by 2002:a65:44c8:: with SMTP id g8mr9177864pgs.443.1557442911664;
        Thu, 09 May 2019 16:01:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id x19sm3799654pga.4.2019.05.09.16.01.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 16:01:50 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 12/23] .travis.yml: enable aarch64-softmmu
 and alpha-softmmu tcg tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-arm@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c5e5f77c-613d-218c-4d75-2e0b62ca3cf1@linaro.org>
Date: Thu, 9 May 2019 16:01:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mYTXcgmDoHHq

On 5/9/19 9:59 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
