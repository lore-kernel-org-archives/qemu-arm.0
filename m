Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp689408wrv;
        Thu, 11 Jul 2019 05:43:40 -0700 (PDT)
X-Received: by 2002:a9d:7248:: with SMTP id a8mr3311749otk.363.1562849020356;
        Thu, 11 Jul 2019 05:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562849020; cv=none;
        d=google.com; s=arc-20160816;
        b=XIRJ+C36yiGeoPjUD1ANzpqtIuSbn226Rp3N/xS4P6g2g+PGYmqxwIrX6tMIzB1P3K
         44vBu+K/O0jYKzXaI61eFq9GvVk0SyU/Ra0z09DYlWaJ6DF2W9+V6qXI+81+aMFOm/4w
         OmtZcRByqdzOd1ZGvJAy1csxpLsN+nhIXIN5CBkCl25jKgZGB41TzUIz2AThhy0+nnr3
         1C6p4iXxgJ7LDIEXqR00MDwHEDOW/+CMwHxidcEnBklAQQHOxrRA/yDvJCAbKf1tPl78
         TEOIgNMvdIjEW5aCYiZIgojgk0MGmRmtIS+ZiXUILTzdaVi4Tf4CjgrzEcuzzRgYjoUy
         wPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ZUHo5N51KdqNy5ukMcABAlH5JkqI72LPh9L730eX+XY=;
        b=HJ+imEp+P9E7dHwiczxfqfOpdVJ01k4y6PJep9n0rv1u++Zg72znDP/X/SuTxtvaXw
         NkaLw07/F3wbsXukJ3TqvcxNm3cuIKbEgEMGSoM1TtTcHvh1j/VsYUSfmrHMpfAXkK9B
         MSicJ0VLV3EbudOZkKhIOzXxhutUyjN4guPyFsyR6UROR7HYmUyFrdn3xXXOx5+GaCBd
         pYNsTj9eViiUa2tlfYTLzKgeS/QukwgBoimbFscaGGueNNdkiPlhA2O50hC4uw3G/p9K
         LbeHzRnJ0O7HRRD2DNHKIohUo+9QMvo4dYZ/0Rg8NFGXiOWo7HdNgirKUVeHnmqcIWul
         HdFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PipvIq/C";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor2773931otj.5.2019.07.11.05.43.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 05:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PipvIq/C";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZUHo5N51KdqNy5ukMcABAlH5JkqI72LPh9L730eX+XY=;
        b=PipvIq/CXIytzDBbqHrOuYDS6WfJakY9xOZl1JgEk14B8Dreu6mUdqW/AMvHU/cj8b
         mLSuZ4dh/+R6R4yfjvo+rvEpQE5Porx5isnhwSart0KfOH6JQNsFdFPnQ17aA8VEWT+g
         0kpSzVKN1uwn9ugIUIw0WndQY4XeWWmDCwdfaD8nS8/TNGoKUieFeZ3on7ttmanYJ0UV
         nWYSTGP8g2jO1wIxq6pvi9+gHgCSfa9XTlq9MlSmkfVSeiVTq6EBD4Gl5Q2rJzYdJ7ta
         nvflHr80Ha4kFjCQATX28vCJBIb9mTekit1Tg3F9aKr+jf9N2f/JF8cC7z/pesNvciZF
         3JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZUHo5N51KdqNy5ukMcABAlH5JkqI72LPh9L730eX+XY=;
        b=KvxswQF/Ke6hL0KSBnFdaYdn+4qVVWpdUn4D1CXbqqIjOFgMZjS/2ZxjLTbDlMMsLf
         lXmz7JTMzlOeIXzDzmIdvSnP+Ksl3zOxtZkEI0Pk1Jf7ZrTHXE54MaTQmPJoRhXIZjoI
         3/61CJEfwR7kziWyIp5CN97o3iSDVm6VRfnB9b/tn+Z4THlkZyG8NDmNTP8AqjmkDs66
         P2xU2e9NHXr4k6Bgf/rW+V3hwRayaS0nRhmbAfkTmy3malz2jl1IcXBV3cs932jF/AhX
         vIRJiij83n+igVgpCqgGDQaF7fuFOgu2vNim+82TCkYvj3h1Hd+c+HfboqjWlL7AyF1+
         e7kQ==
X-Gm-Message-State: APjAAAVjKnIJPw+dApPl8lC33JjAgkq0vPVuQsZHxXnHYNpdNrDdIzYU
	bZbgH4hQSnt18yN0Di1ro2d8DUn9
X-Google-Smtp-Source: APXvYqyEi5mYggz8BKINh53jJUmmIGXfz58mflarfxnaw+/Q63cHyENzkiSQzgHz/jzgXIqvNQQ6Iw==
X-Received: by 2002:a9d:7352:: with SMTP id l18mr3330291otk.292.1562849019954;
        Thu, 11 Jul 2019 05:43:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] ([208.54.86.238])
        by smtp.gmail.com with ESMTPSA id w9sm1801712otk.16.2019.07.11.05.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 05:43:39 -0700 (PDT)
Subject: Re: [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for
 arm926 and arm1026
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Christophe Lyon <christophe.lyon@linaro.org>
References: <20190711121231.3601-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <21ffce4e-72cf-2c5f-71b1-cb53367dccda@linaro.org>
Date: Thu, 11 Jul 2019 14:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190711121231.3601-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: IR3YCf5pSy2i

On 7/11/19 2:12 PM, Peter Maydell wrote:
> The ARMv5 architecture didn't specify detailed per-feature ID
> registers. Now that we're using the MVFR0 register fields to
> gate the existence of VFP instructions, we need to set up
> the correct values in the cpu->isar structure so that we still
> provide an FPU to the guest.
> 
> This fixes a regression in the arm926 and arm1026 CPUs, which
> are the only ones that both have VFP and are ARMv5 or earlier.
> This regression was introduced by the VFP refactoring, and more
> specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
> which accidentally disabled VFP short-vector support and
> double-precision support on these CPUs.
> 
> Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 1120827fa182f0e
> Fixes: 266bd25c485597c
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
> ---
> I've followed the existing approach we used for ISAR1 here
> of just filling in the fields we care about, rather than trying
> to set the entire register value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -1713,6 +1719,12 @@ static void arm1026_initfn(Object *obj)
>          };
>          define_one_arm_cp_reg(cpu, &ifar);
>      }
> +    /*
> +     * Similarly, we need to set MVFR0 fields to enable double precision
> +     * and short vector support even though ARMv5 doesn't have this register.
> +     */
> +    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
>  }

I would have placed this immediately after the Jazelle isar setup, so that the
"Similarly" comment had the proper referent.  But, no biggie.


r~
