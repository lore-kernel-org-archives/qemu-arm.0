Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp59514njf;
        Fri, 25 Oct 2024 12:28:07 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:20c:8cc4:cf25 with SMTP id d9443c01a7336-210c6c2a1d5mr2650645ad.36.1729884486935;
        Fri, 25 Oct 2024 12:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729884486; cv=none;
        d=google.com; s=arc-20240605;
        b=XjfM3cVG6S6XoH2Ul6OTucVTgSzPUuPWJ/+QVmoyB9FuSXhB+BCLEiiD6xDQbZOnDH
         AoozEoHvRkI9n97uP4zLH62ERYrwaR/EO5btkI6RoYJwXIC6PFZC39tAG8NqRz6zLzhm
         GKtcDLjQQz7n38eGGzwpPKV6HeO/uN9sSuKr1VAayiPDJa3ADsBD76B3Ro7DapMWtIsT
         E9gLUZ9XwC8O5AyppjoCw6VeK2Z1hyklA20x1SPsFe2AKYsHySSm56O1PM1DM6Mcu2jw
         7Ko3OYpGSVy3ilHDgSY0neJ/v7Bb1zMLnPO/dUYSIoyFVfadWmeqApnS4wWfUbLn7VzA
         AXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=30f+tu42ZCmJzPXPH3/iD203rT2cgzBRHma0eVrvkvM=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=OBK8RlbtzhxoDTJIP+8tYdsEZxdUx21N22QBXF+qEYLTIXZmM2mv2/+c12M0zDrTRt
         83BDczrqK72N+cpLgC2kf4xv5X+tqjJZX2MaGg2Y8ImN77BcxHNJsInF/grWEJcPQ5cF
         sKMgG2MVzR/9tzP2h9cTbcGP8sfiv+IuPiAFGsqyBpwqQMN3ESbvb6Uc/YpcRwKxh7e4
         43XzqwRYPmwkAgAA43NDzqZaCJX3m0QTOdxkC9nOYKUF44fSo14Axlm4imayVRW6MZtZ
         cjQaj7yOd8as4DlTfOK4/WU1BZAIF7+p9Qcou6Bj7+2i0ileK1QTQfZprNy85IJLnlnZ
         XCHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYo2DevA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbf4aad9sor12334695ad.2.2024.10.25.12.28.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 12:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYo2DevA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729884486; x=1730489286; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30f+tu42ZCmJzPXPH3/iD203rT2cgzBRHma0eVrvkvM=;
        b=dYo2DevAOiQqFYhvU+j3GuXRGp3QUxRiZWDXWFhFaqhTbQCF/Qx4+Ojr0QCmhYCsph
         54hcODqoRZRnmye46tjbpDP8zEe3u0TvB3T5rxBRx0po2GtYTYAgaijNXfe7i2ip6q8A
         ff3gcifUKnaHIVlyttq/fPbwg6MChjPGkkCmsM4n9FOlqR9sIza0Zk6CXtzrrTr1KXno
         JTtGHO2XVVHuxMJ+xgko81GH0SeZU5w+MaAnWyf/hU+B5OLOLKMXbA3GxOGD6QRY3eHR
         vQdki0ePNPj0NqRVegd2CNZJL1sBQpqpx23ivZszmjKvU3WuvFFKtywT+yMbaqU96tnu
         etiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729884486; x=1730489286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30f+tu42ZCmJzPXPH3/iD203rT2cgzBRHma0eVrvkvM=;
        b=rr/gvZe+6vMKqzoVteM6uO9iIQaj2DNMogLWb2TRc0mcebH1yjsI8fjkQzxwigeISK
         aTpAcFqAvg4oXQgB5sZnvX3mJF+59+7cOvLJDyrsHhrzfDkhSLDN8mpHWgWFvRyJpU2F
         vj3RPx/GE9nE6AqRlXKv0602B9xBE/dkgxsNI1tQKkfrt7YyoH6GVfjveVANndzX8zmN
         FDAkrT0vw7cFBs51PE5YqinpEosM5FtyvBnlftqrjzpqEZogOQDR0LQ5t9LmWZrrOTol
         Rtuzxp7DavTdCZ7KkWVdz5EFtpJLHdIrcYGAjP1WCrf680gQ8/8RM/fskgUIo4LM24xR
         D7LQ==
X-Gm-Message-State: AOJu0YyukWhzNmp1FMs8myL59/6a0vEllyJl9+dVf90yHKHHgmWw5XlK
	YXOG6Ltw7+Ash8CXshxWQQtahtHjCaww8vjErwVw+YFQW19+SQpsiNR/2yq+s3k6Rg==
X-Google-Smtp-Source: AGHT+IEeFiIxKjm1wUuW0S1AwvxqxMbO07oPOVaaEmVqkzmguq9gzyjJRfaQMsBnX6Fk4nHQBt/qGg==
X-Received: by 2002:a17:902:f60c:b0:20c:f648:e3a7 with SMTP id d9443c01a7336-210c6c7048cmr2872355ad.50.1729884486478;
        Fri, 25 Oct 2024 12:28:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.2.252] ([201.190.186.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46373sm12828965ad.54.2024.10.25.12.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:28:05 -0700 (PDT)
Message-ID: <889b9edf-16d5-4372-92fd-43190ada1c6e@linaro.org>
Date: Fri, 25 Oct 2024 16:27:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] tests/fp: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7SwqKBwpK8xg

On 25/10/24 11:12, Peter Maydell wrote:
> Explicitly set a 2-NaN propagation rule in the softfloat tests.  In
> meson.build we put -DTARGET_ARM in fpcflags, and so we should select
> here the Arm propagation rule of float_2nan_prop_s_ab.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/fp/fp-bench.c     | 2 ++
>   tests/fp/fp-test-log2.c | 1 +
>   tests/fp/fp-test.c      | 2 ++
>   3 files changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
