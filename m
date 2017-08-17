Received: by 10.223.183.22 with SMTP id l22csp2594480wre;
        Thu, 17 Aug 2017 13:07:44 -0700 (PDT)
X-Received: by 10.84.192.131 with SMTP id c3mr7194120pld.9.1503000464134;
        Thu, 17 Aug 2017 13:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503000464; cv=none;
        d=google.com; s=arc-20160816;
        b=nHt5JNkRaDd2vntsCoj+7teU+x52yZ9TlXWJl4KYqLxCWoMbh0AGjv3RbC1gUpAuJD
         tmLW56vlMp/Zn1Yd7EbGkcgSliVN8SRgo5xx0sDQvS4NA6davoIQCu5N3CbIbIxhAF43
         NiePmFKcglzkpLlLyybWYOTqJeevW7qBr9wjL+nm0Hw6gtoFq68Wru8CPPcXOX71tZ39
         nYC38AcXDQO3wVn7ti1XLmZU0mLrkL2N+Lxg+QSyHdDIjamzqvpyv8W+M9XoYn0NrKMz
         EavlGTrqxgaNbGrJJz6EluV2z+xfNZfqk9hjHBM7Fo7SyExQi2dj+QHgWoJz7blVuLmT
         zNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=rI1er1wOi3h+tnssASY7Sv9sDPJKfx3oeIr8lG/TGCE=;
        b=xrnZQRpFzmg58oxfdCuCKx0SxgRt6mgmyt7oURCbc1TjRKZxl0PHM3NuKaOW7YQYrR
         qEhhHBiknIi7CySJa4Jz2GlyroJVN7pBitwwjZy68LTeI83ywk7P50hl+EZf/86LaLEc
         ueXt30d7WQG5wPvHwmqDZXeHCllVNXHGlA8QMhxzbj74+MhI/KeejfG2qC9Fz0iGGUeX
         Tc0/1DzTMPyy5/n7bgCD3XJ/Lsy0G0ZRM2Wdrp2lSkDRQ5nRRbkT9pm5fIYNg7FYNzSi
         LC5V0xW/LfRF5uGtGY3wwNmD8cmiokTF2A5Klkc5dUgUcPjY9Q5WzjdtQpjhTbFxM6yw
         4RLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G3wtbjQ6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22d as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com. [2607:f8b0:400e:c05::22d])
        by mx.google.com with ESMTPS id u47si2438493pgn.515.2017.08.17.13.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22d as permitted sender) client-ip=2607:f8b0:400e:c05::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G3wtbjQ6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22d as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22d.google.com with SMTP id v189so49477340pgd.2
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rI1er1wOi3h+tnssASY7Sv9sDPJKfx3oeIr8lG/TGCE=;
        b=G3wtbjQ6jAQ3kTGO9QI2SiGf2yUV42zor064D36qTZso/6x5FEodT5kXk2YbbBq4Vf
         q2qRqYTubCe1q6ffRfkHTcnOnHh0EQ4Z20KZZL7b58vjb8/plZ3rEEUAMdmGMPJUtPzH
         qjbFWWbYprWO/ERbmpfromh7ZlJV6Q33mUEtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rI1er1wOi3h+tnssASY7Sv9sDPJKfx3oeIr8lG/TGCE=;
        b=ia+qESimKwKBhpHsEw5I9URLynjF5y9ksr+AB8Hdtu4YnrtsoIk5Sj2Z1FMtsnL7W9
         Rgf9Bjg+d2gLg8ScLGsLdJJbwK3zMnr5fxOqhX/VvLB/d/1gvmO3mBNHHbLNxtjSJM1b
         5S8R9Z5XoqXydZZlZetohVEFYlQJsWqYpMNFiM0tOpW7CDpkWX4nJ+zJUOGZIei2ydqG
         W0D2fGbZ03/cf3zQf4BhJ55e5GPIO/nXZVlXuwIgoV5ktGL4QwzfL0wICjIQPBYkmXK7
         QkveR9j3J8l82KCBVptfqET4AOoUGI//5d6v8Ha8eYN1V5rDLur2xhIERkIFEdUvAbW2
         Gb7A==
X-Gm-Message-State: AHYfb5gctuCBvsa9hgPBTHhnMZTxLtARQzHQOeQ65wZMzfLrV+JvGKjw
	ohXA620/uCtAjSNimjc=
X-Received: by 10.84.132.44 with SMTP id 41mr7002148ple.194.1503000463638;
        Thu, 17 Aug 2017 13:07:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id r5sm7722628pgn.45.2017.08.17.13.07.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:07:42 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 2/9] tcg: introduce the concepts of a
 TCGv_vec register type
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e2fa1a2-d5e7-e6fb-3b88-6b9f1f9f76d9@linaro.org>
Date: Thu, 17 Aug 2017 13:07:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mJcauSoJhkSG

On 08/17/2017 11:03 AM, Alex Bennée wrote:
> Currently it only makes sense for globals - i.e. registers directly
> mapped to CPUEnv.
> ---
>  tcg/README |  1 +
>  tcg/tcg.h  | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)

I'm not keen on this.  I know it makes for nicer intermediate dumps, but I'd
rather expose the pointer addition directly (or not, and fold it into a memory
offset).


r~
