Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36640njj;
        Mon, 28 Oct 2024 23:10:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4686:b0:431:612f:189b with SMTP id 5b1f17b1804b1-4319aca6616mr81856845e9.12.1730182243304;
        Mon, 28 Oct 2024 23:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182243; cv=none;
        d=google.com; s=arc-20240605;
        b=MnqXnGDjx4iAhotGUebbwuLN5H37VzeYMtqEDdzPwPufvbe33ppOxNf+i5Js4l86Eh
         ZuuNV/aCbuREDQgsXi/x7he2WNXyv4qNu28mAyPZzkICfb+w7OMLyb+I9DGefUQOznGN
         aBK9ep/wBSATI/C38mHs1XB1IhOh+NrG9uEZqKRZAmJ5/uPj2n+emURr8SqgdRQK73/K
         M0QkDQr7CLL729cw29MR1VhBKD/G0diEpjXOkkl6VOBltN0zdU1LVhFKWfmksnn9OP7w
         rWadlRK+vk5NSkQY3Y2dG9jS53MqIE4tmyzSbNEX0O/uNY8kh8zZPu8l8eqr4KhiWFOH
         52fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k8fHzV/f1hnDLxHZZKnInt/EtNNRU39WIf5id+i+9CM=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=Sk9wYlkNUxtxGXUXR86fRIh6TAxlXKI56f6olvE/XuofvVLn9EALj9BWvf1CqjnV4e
         op5O2v2vCoQNGsw0tys/IeB0qWQPw1NRSsAbSywBKzyfz725loxEZAil/tArEd7uyLQK
         nuXyk3U3xqwLSkfoZmk7wFXtkAadDLPCKeagVMJhArvr1I118VApeswbHZFnLLT2PUqc
         vh6MbhxihDKlB3vZUNecyk0vCgosd7N/eb2+u3VX+02GLmad0ujdHUxlfYGestU6DULJ
         Q5acC9UmXSwM41eU+RGeDOoWq5yCo+M0bX/pWNWEVzcLWktj+zkgrexo6a5Cg5bWXi64
         GoEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4nDlNWI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397cb44sor35814595e9.11.2024.10.28.23.10.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4nDlNWI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182243; x=1730787043; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8fHzV/f1hnDLxHZZKnInt/EtNNRU39WIf5id+i+9CM=;
        b=N4nDlNWIP4i/peSGzy201X09cMHDgsssuljQPN9aHixgwqph5e9ljF9QBRhFhVH7sC
         ajUJMQ3kqU4duB3qreKNTsN3kpghQ+qsdEkvk/6gzjM1DPYzvNZk7I6hGOB4ObGtznJJ
         y4mmKQPBa5d4xCN08shXR9C52Kzg/Y5yDFyU0e0xnrVt7FMi8A5sy667bJTYfBuiMxDV
         7vvDBm4xskJ+x9ptON9+dmmoa04uigfwatml90YFlwvE1kHd8vTHfxb4CXKlToTu3UWk
         A9n82HUDUsFZvOAAbIe8RUzYKy+x4CxxODOXqwl4qiFdce0LmnTA1hIWfpeL6Xx8CJTR
         YVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182243; x=1730787043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8fHzV/f1hnDLxHZZKnInt/EtNNRU39WIf5id+i+9CM=;
        b=U/iuzRX2oFZQQkR1v47SjabqlwRvZdm9KFh4U+2lpWDbAoZDDjfVACBkRVGrDQ9Obk
         5piPiNK3+tkDiTOi44OyU2EMzTWwBFPYbTHXjPGsP5uHNqHv7gwjBfCojeajacBjZnDQ
         g6VxZSIJLAO1tbz6KS7qqNDd4Edl9+I2kTWcX34FRPd+p8M07Jk9fi8LLD1grlAUERGm
         mu0RSeJHntwN6SKw649Iuei1B/QPHfofnwEQnLXNOLdPiImljSviULplawmRR600LKRv
         cOSvTo3ue5dQJUgsjrcgNW1fYBiz5jj7GreLer6P8pp6v4VH+fx+P8uxEPuOb+yGX/7o
         kPQA==
X-Gm-Message-State: AOJu0YzxQeMa3g+eiBc2Rgw8YpaWlFKcfF5DSwNl/wHfMm6bpDf8zwxC
	ZheNDUcokuk0YqVMJYnf6lapC3s3iXhp7EhPWrBNOr9Nl+wjJluxjTkJXuZGAftpqg==
X-Google-Smtp-Source: AGHT+IEC7ve4M7PIBcVep8RqsgKORn95Q7oWzbKVPhXEGueQDzHNr/uXBnkdWwabPuAMZNZUQzjmhw==
X-Received: by 2002:a05:600c:350b:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4319acb8a7cmr88621115e9.19.1730182242752;
        Mon, 28 Oct 2024 23:10:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f5e1sm165298915e9.14.2024.10.28.23.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:42 -0700 (PDT)
Message-ID: <9eb4fbf0-b641-4d80-9eae-72ac24e2a8d4@linaro.org>
Date: Mon, 28 Oct 2024 12:16:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] target/ppc: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 <20241025141254.2141506-9-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: uN6fC0iTPN4q

On 10/25/24 15:12, Peter Maydell wrote:
> Set the 2-NaN propagation rule explicitly in env->fp_status
> and env->vec_status.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> ---
> As an aside, it looks a bit suspicious that we set
> tininess_before_rounding on fp_status but not vec_status...

Indeed.


r~
