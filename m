Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2261188lfa;
        Sat, 5 Jun 2021 13:50:11 -0700 (PDT)
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id b130-20020a621b880000b02901fbd3d0343amr10331337pfb.76.1622926211732;
        Sat, 05 Jun 2021 13:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622926211; cv=none;
        d=google.com; s=arc-20160816;
        b=Dv96NrDkmqeQnD6xYzM4g37yZGnjx7zJBlicUQGRJ0KM1sdaKoODxM9giyKMXHRo0f
         7r0qZONB8VwOUD49nSTP2skpUpYroeTm0mmDKY75ZWmqtPF/eMXdfeTHS4R3paXCGMgU
         L4mYNDxfiuO0r8tguvvTARlJRkdhPWmussAIVOYbZyv6qJVWCRNFSe0SzJ0SxW+FUknt
         CMWhjMifrW58fJrOQ8GFlgE3RIl3rMhl7r29pRt7pJavMetqJMY2Ew1WSJsN32RLfTJB
         QgmiGweE2pf45MtfPvn1445rgQ4n/305yaolniRNOs8JWfA2XhvAsTp6OVL6BbK6Xli/
         lnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=zUCX+WJiwhqANyN275NwjJ7fZTnAmYv2uUsgNhiGyyg=;
        b=ZZ88zbwg/O5MBYsuwfdy+55P0y+kgngGZs4o4zibFVli2H+OWnJyYeyWxCMPO1Lc+u
         uEA9odFFfGGENSFamz5z+7b+oJGDzTgHbyPYElLjxHi8AKZ4MDl1PkztuFEzy6zy1bN4
         +94Zdnwtzf9CHK3HmzPw5CWxRW3mgc1g4VZwYIjLW1DKcHlXuAw4yDzEofsHBxdEpCI1
         7XaJ4vJE1C9j4eqrVcEesV+1loFf6Eg5lp1TQC+uAmn/Is6SQPA+d0NjbINO0dIznJl5
         NsuSG1v16S40fN5SKEoAIn0nEun+n3HRm0BLHbScY06vEV1MzY2GkyRKwWMFghiM7RYd
         z/kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKIzBS7e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 16sor3100604pgl.4.2021.06.05.13.50.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKIzBS7e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zUCX+WJiwhqANyN275NwjJ7fZTnAmYv2uUsgNhiGyyg=;
        b=rKIzBS7eF8eQdlHc4GU1fvpGuJW4NKEaXwjWNJIOWDipXlbkPM58ihucObeKlxBrf1
         xLF4jUfoDQX4PK1clSJYAFx56+cNn2muGPX9zlsPviIM/V43+hTW2WbUNLWdbIKtZaka
         2zzE01A7gsDUTrosl7DROzxRTmg4MQvOD1290HvksI46rWPRz8W8u2cXd36FhtUb+GrH
         4r7WA82X9tfZ/npW1BV1O3rhbcVuMOBH3iNTEw+YeokVAFyYASielYa/uxM4twDvkdae
         VhFJntX1ysMmKO5785/8rEe9M8Em4Y8Eqz8O5s8Lduz/m58dOP8A4kawIJitOwm2VsJ8
         8w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zUCX+WJiwhqANyN275NwjJ7fZTnAmYv2uUsgNhiGyyg=;
        b=rYROoe7Rckrty/Z/WNvj9kMDkz6Iba9vfWX5WmikGdKb6eEfPWHfyNJ2bV1wwuY4iU
         JtCPLnT9z5tf1fSXoJXRs5khURKR8imJbif1j+7yOinb/x5VMKbPV2m9+rWv0gsURHiw
         vpbJ4hS2CbQQyBt8gFuI5Be8jMXwCb1FlGzRkjao9MSrQ8q8JbhJ6yDj0EvURFw+ztvA
         doKj3FwKWmpe0VmJN4FhVMGd80/kOJVP8ToYtUMQUP2Za0wZQXHlDrUnmtp++drKNFVJ
         3DLXglojuLoNQLreej+xQV6NxoGJU0AODD8S9PWyB/u+L8LzbHvbpqYKp06wpD6kdNB5
         YvZw==
X-Gm-Message-State: AOAM530oUKyoWrNcskE9vIYOOjd44H+xTZSVA807LbxVRkBaffZxoS45
	0c/0HrXi9pbqX4h7I0pQlkP7hJn48w8hYhLg
X-Google-Smtp-Source: ABdhPJyjBpp+tr9GDo1Vf9goHp/YZCkKM+DIAr/88HTUqMhgMPVTdiSuNxM12oWFE61HG9a0ZZ7fKw==
X-Received: by 2002:a65:6103:: with SMTP id z3mr11150619pgu.61.1622926211227;
        Sat, 05 Jun 2021 13:50:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id 11sm4756757pge.57.2021.06.05.13.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:50:10 -0700 (PDT)
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
Date: Sat, 5 Jun 2021 13:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-79-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iyfmAjTZlh36

On 6/4/21 8:52 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu-exceptions-aa64.h b/target/arm/cpu-exceptions-aa64.h
> new file mode 100644
> index 0000000000..64f800a15d
> --- /dev/null
> +++ b/target/arm/cpu-exceptions-aa64.h
> @@ -0,0 +1,28 @@
> +/*
> + * QEMU AArch64 CPU Exceptions Sysemu code
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + *<http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#ifndef CPU_EXCEPTIONS_AA64_H
> +#define CPU_EXCEPTIONS_AA64_H
> +
> +#include "cpu.h"
> +
> +void arm_cpu_do_interrupt_aarch64(CPUState *cs);
> +
> +#endif /* CPU_EXCEPTIONS_AA64_H */

I don't see the point in the excessive replication of header files, for exactly 
one declaration.  This is not the first example.

What's wrong with internal.h?  Or some other header that collects sysemu 
specific declarations?

Also, "cpu.h" is not required by this declaration, as I've pointed out before.


r~
