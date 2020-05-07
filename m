Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2157162lfb;
        Thu, 7 May 2020 10:16:45 -0700 (PDT)
X-Received: by 2002:aa7:985e:: with SMTP id n30mr14262786pfq.163.1588871805460;
        Thu, 07 May 2020 10:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588871805; cv=none;
        d=google.com; s=arc-20160816;
        b=s5oToZVMM47Jz6bTBH6sA3aDS8+taaDkmfQIBqVHWVuyKfJ+yqrOUNQQvVB6okzGvU
         fMAlOH6iaNSWkTEuQg4IOzKmSe+p7YCIYwiyKSX9oKokuSeP3zKD19ldGPJ0hKdHCDdL
         lQP4JTJ86QtiQZmYRoL5ROYeG2U7a3hSajKajDywIgGWIUFBF+5G7DtrqamJGMlIVTEO
         PPSk+/Zsx7xjzDCnFDh1on0syoCbKr+uxjpXQzBe3e4fGKn5RfL79ucMrUbDa8QXdHf6
         t2B7Yr010BjKTZ9qev2FSh/GdlM3TwqsCAf0hzFxKy3Wv3RDsDPyDKy6wWLTdkygQ6LP
         qQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rekBVtsOQR79ipFPsbbh0+J3cKkjzywQV6MJqtQ7Hm8=;
        b=feND4bMMfHfSRuCg3pzp+YVSmMyqMbvjt406np9LnzqdMLzmEvIEQUhVfI6aQxiIpt
         Pyvmxv04x3NY46dnQx5CwVf8n0uwOHndVOXuE0zW3PUAwBU4Z4K/3et6NNKgp0NIWw7o
         6+SzcyJs12o8+XDpHLHJqUNt4JD8jTg/oh29XW98Gf57q8QdVaTIA7FQMVNthJUR2k4x
         UQoCPYUmBC1OZAklHK/VgZNuNKcy0Jr9QmTpEsa47lWXbwZwcMLgjJOMGllSYVgDM0CK
         FbqI5YsD3NXJzU6yUYIEWGw+prZk1pYQ5TEIZOqoSygohPSkNTyThRsG+gsKhewUaaFR
         cDEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1ukqVH4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p13sor7681553pff.77.2020.05.07.10.16.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 May 2020 10:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1ukqVH4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rekBVtsOQR79ipFPsbbh0+J3cKkjzywQV6MJqtQ7Hm8=;
        b=Q1ukqVH4tyNX0IuUd7NF20JFh7HEFNdVz3fYzb0AJ+2ixJamijq6UJAUWihhZPtTiy
         8nHZ8cKnbv4+SMsJnOxTbgbhUI8etSDe0mKJpWV6MVuslija9ltC2M9jX/aKycJHHeCC
         ST3cja/shnaSChfBOC+8DLZsKGQm8whIQt+EFXdUuC+QMY9NIubZ9dJqk863vVwxFddf
         YK3ToXKRO3QOu6u+oApCDFXWdwZybPshiGsHsF/2w/CumfgLnXPt+tD0/o7jquSu9/Kf
         /AvjBMRkfrpk/1qfJz8T0GqNaIRlSvP65U1P85wJJ59vmyAJXmNObDsoRW4HXMRcHWkn
         diGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rekBVtsOQR79ipFPsbbh0+J3cKkjzywQV6MJqtQ7Hm8=;
        b=ZpYHsSJuRqStiXRbxwIwrgxSeFnOvwgKNqUBtaCr/M78fsCor88r6msWeCikW5CymN
         bHI+8vpf1ZR7YNvk8+YZKxx9KDsUgCHOSZBkCUamBrZzyxLtUOYcZn8bzlitQHekHgWu
         du3x9YgnCL1833UtO1P7kh9EmDdZxc2efwR6pgyjIjRMoTbhXUDeTLj8ipW7Vo6pXmP9
         /0VHzRzQUGDruxYhqIxH6uLBbEt+IGHrXjOGwv5RI+paTwa7g/Q/TZoCer5R6CLLPdgm
         O5wEskEP7Unf1uqrsTan44xebToYhV8pl5QJ7RAc9fMm5SLvDp1uWs6c6E3ZPiA/YuMQ
         LexA==
X-Gm-Message-State: AGi0PuZQyV83Y4lZwL8gUOVcKAL0aV51Qch/441BKsvfYcjABvv0gILL
	TFOR1HPXIdBRMU5kcQKU0bFFsmqVappOqA==
X-Google-Smtp-Source: APiQypKJ4MuX8kqWxIAd2eOlKARMqRm0UazIY5eKgXuw2R6w9hc/FUElNUCtz2gVQphVeE1jQvRLEg==
X-Received: by 2002:a62:3287:: with SMTP id y129mr15413870pfy.167.1588871804498;
        Thu, 07 May 2020 10:16:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
        by smtp.gmail.com with ESMTPSA id b8sm307866pjz.51.2020.05.07.10.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 10:16:43 -0700 (PDT)
Subject: Re: [PULL 04/10] target/arm: Use tcg_gen_gvec_dup_imm
To: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200506183002.3192-1-richard.henderson@linaro.org>
 <20200506183002.3192-5-richard.henderson@linaro.org>
 <CABoDooPCvC4Y+G4CGBUhPT_ce3rY6_ZZvTnvv8M+sXPkpN4raQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e0ec84f-6f25-5e97-a3c5-bb810a347d0f@linaro.org>
Date: Thu, 7 May 2020 10:16:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABoDooPCvC4Y+G4CGBUhPT_ce3rY6_ZZvTnvv8M+sXPkpN4raQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: DJnX5+vJiZrS

On 5/7/20 7:39 AM, Laurent Desnogues wrote:
>> @@ -2044,7 +2044,7 @@ static bool trans_DUP_x(DisasContext *s, arg_DUP_x *a)
>>              unsigned nofs = vec_reg_offset(s, a->rn, index, esz);
>>              tcg_gen_gvec_dup_mem(esz, dofs, nofs, vsz, vsz);
>>          } else {
>> -            tcg_gen_gvec_dup64i(dofs, vsz, vsz, 0);
>> +            tcg_gen_gvec_dup_imm(esz, dofs, vsz, vsz, 0);
> 
> For an indexed DUP, size can be 128-bit so that will fail the first
> assert in tcg-op-gvec.c:do_dup.

Ho hum, quite right.  This has already been merged, so I'll send a follow-up fix.


r~
