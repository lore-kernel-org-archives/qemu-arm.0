Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1313514lfp;
        Thu, 6 Feb 2020 03:20:08 -0800 (PST)
X-Received: by 2002:a7b:c651:: with SMTP id q17mr4214467wmk.5.1580988008255;
        Thu, 06 Feb 2020 03:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580988008; cv=none;
        d=google.com; s=arc-20160816;
        b=TmMUV8OKXINBSqX2mvdm3LsjtZFTf45jXuYtjvac+n+oD95zbm56f+hdZO12c4G5Pu
         8lYJAtglDaYenMmDOgrvmjV64MDPXaTpChD5me3QjrmahkaSqFGY+YyA1bqpoluFxsqj
         SVq72DM4DDh3tZnu8l+u9A4ll+oE7xkvFwcdrJsZE/uymZHYjsz+0exWQ+1db8WtRvV4
         RpA0b3gHrZ4vH5w4BVzg+XlgQfYxnW5oGmE8syqGh6jUzVea3TF/gk3eabvi4of9OrWO
         6lnISO+ZEin9jI2JDzqUPNnsgM0Kqe0QaXepTmHSS9/uTPIhupcoPsamYYutqsvKR2xO
         G1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=o4IyrtBSf1wjpQa0Yxf2YW6iXyU0Bii0YrCwN+cD1zI=;
        b=WGrEfIrjMw2EwkgssGZSPqTnrj+uVIXSmYc01pb2xlcBu4+kEk50zvqtLmE2j7tfVA
         GFDJbvw900pOUz4Xvaz1uxC8ORTAqt+ydnWWKXvKSU5UQed5VI8BDNTGqa7gpVxWrKMf
         t77nQMZxVMOaqjwDslhl/L1b2rtOHljmmCmu0xVkVeD4TcywPoLKzFAW/Gl0AK2Ltxve
         Ze15nYLB+Z4mbp5x8oc7gkL3AwGST5xAnaCKCRR8YiO1bhSMpqpS0quxHChFcqelwWxU
         g9/AFWbZZVlH+QW/yU3kPQJBYUCvDdMbAd0YHqFt8R66JX/9t8eH1MlufxSiXARXJ6xD
         qXKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eD7tObuN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g12sor1836505wrm.43.2020.02.06.03.20.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 03:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eD7tObuN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o4IyrtBSf1wjpQa0Yxf2YW6iXyU0Bii0YrCwN+cD1zI=;
        b=eD7tObuNr144XAhRh1AtdhGNvTiHNcRgq0A+HoYDs0QgOJimYO1hPKsTfTMug7ogtG
         H7n+BK2hHgJQD0/J3hrLpRMuUXTYVPhKq+19FfYhcdKHumi5UYJz5I/XjzIC1ez8DIKv
         OpagPfI5IsJ4EkbFu2G/2tIEzBhRZXKdxVJ5l10iIOtLdK+DQzBb5dqi5Fv5ssXytOx1
         lV4N5SJ8UBtX/fawL1JxfIT4Hlss1Houj3MMG1KeYKeex/MdwBlidX/7MxkDFfbmrPWq
         c3MUSvwuQnMYg1neoMGsMP/EdkA0L1yblYDwgB6WnNVMgteuabam3hhtJjX1GhxZY+uY
         dS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o4IyrtBSf1wjpQa0Yxf2YW6iXyU0Bii0YrCwN+cD1zI=;
        b=s7wzaQipY/3405AZW4H+T5tY62amW7Qdb+4RoAIVVHGWxSZlxerLTfrSikUiX6xdzJ
         bMmPBX03X1XyovpqIHQt1nPI+A+9atRDhFZiDkhL6/XFJk82KAeOnPMqJfsk8Si3qojy
         3YS/acB9matC/9uHx8gAhFl0/iUlWKYuCh6DTQSS47lNAHfI2fyVBluuSKoaF7pBop5s
         r7BNoCP65V0P4gUwn/zotw3lXrUWvt34CvfQORqoRQ5P4ZfJW6hD0z2gCI6iu7zfl6Sa
         gSN9YRwKzkBV6SlFZ8nRxOkz3ue9Q+IP2NiPo4P83/hxSKFO81x9BJPk4/ICmhOeF9IJ
         ti3Q==
X-Gm-Message-State: APjAAAXZKYdlyJnT3atMBTeZYoFCZtoSt/ABtXc/oswV/zPhwwFa0sTo
	BuNM1B71yseSylrlEbCsnYwHZlbzd8F55iSb
X-Google-Smtp-Source: APXvYqwAWz/+DLQ1aOaPKoFO5EdE77y3xHxWZgC6qgXHfvIGG0hkoZq1rmUCzc/zihCVwGwlBIZKsQ==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr3548793wrr.172.1580988007975;
        Thu, 06 Feb 2020 03:20:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.13.93] ([135.196.99.211])
        by smtp.gmail.com with ESMTPSA id 5sm3905227wrc.75.2020.02.06.03.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 03:20:07 -0800 (PST)
Subject: Re: [PATCH v6 13/22] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20200205171031.22582-1-alex.bennee@linaro.org>
 <20200205171031.22582-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3edd3b91-2713-a0d8-303d-055656aad584@linaro.org>
Date: Thu, 6 Feb 2020 11:20:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205171031.22582-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Q9slqf+wjQ7Z

On 2/5/20 5:10 PM, Alex Bennée wrote:
> @@ -7143,6 +7255,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
>      gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
>                               arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
>                               "system-registers.xml", 0);
> +
>  }

Stray whitespace.


r~
