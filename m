Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp170167ejh;
        Tue, 2 Jan 2024 14:45:09 -0800 (PST)
X-Received: by 2002:a6b:d816:0:b0:7ba:9550:8b3a with SMTP id y22-20020a6bd816000000b007ba95508b3amr18602616iob.12.1704235509067;
        Tue, 02 Jan 2024 14:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704235509; cv=none;
        d=google.com; s=arc-20160816;
        b=WyeonK2TuI92hFH0DhAGrFC1fWAQdx8YGmFX+sDKOu6t3V4Y1qTG+xJmjikzfC8mfV
         g6cNb2HT4I7Y/qpmCWhL8gKj8oauNglDzVeHYichy1gveJVEEWlQzvU4eTHZayzoaEI1
         75hqHDi70GlC9Ve2vBGN7ls20H0NTk1KqcbYIk0VF1LGgSZx5pOiPARYDuD+4Y37eRbK
         2XIgJw9ftoW6KvfvE1C3BML6uL41/adqsukO3tLD9KfmXQOLGOq515yA7ZwVcONbVW/B
         hMrUk2VV6d+ANfBS9QfaRFghsLFZN6wSisvJ/qUtnzTbo+awadNirN8a6pWI98F8a8ra
         bvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=auuogxhODAyeTAXk1aM8FKif/dnKPBiqqExdH8L+uR4=;
        fh=uXrWjjCRAJhC8aoUp9ENm/TDuRgz6CL3oN4pEQi0TrM=;
        b=iBI6AOhJVbHl/A4KpTHtUOZ8NInZuboJKg8Tu0FJxjQ+kh637lrnK0M3O4WH9vDf+B
         WY/G3ofePh6M11zk/iTZJ6gYuFZHHu/mR2xixGrmhNX7dBcr5N6WhyDV4YF6OytvNnA7
         jGYQbUzEG25Z4o80HilLPHnJAT5cDvd3U4+Giw1iZWVXho45aX7ofiRrzkjXZvbehVjg
         5DoFA0DurY38OYfEE2yAcQnFFPhXxAUgsyBi98gt+PYQ9fQ4igK+gQOiQ6KytEw+zcQH
         adO2rGnHXiLjheFRD8ETHV5CCatzj6+VWWVwtSotJy9GqLWjbRx1QLZ4T7RcLq9KNFCS
         e8Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrNk8yBa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id eh10-20020a056638298a00b00468ad002e81sor7162966jab.9.2024.01.02.14.45.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 14:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrNk8yBa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704235508; x=1704840308; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auuogxhODAyeTAXk1aM8FKif/dnKPBiqqExdH8L+uR4=;
        b=OrNk8yBaEDGngeQwfVzk1t8OKWPjzZzHQuMgNO4m+njL2Qvo63zVBPsRFMFxQs5f7f
         DDofW/xiUI5QqPBrK8d7Wlxw130om0Q6qJR+FgXZzAUeAL3Sva9pVJ+iODIP8eeSM32l
         fzv/XJeTl8IPjdmNZEENSnO2MhSZc9PZ3BCMlkyprwNROLb31rt1Dbc+l/DAEFAn9zen
         GzPzgdRDzvCD/3819Ra/G14eLrVHKjbW1YJuJZ3xq6Xz6OYNu6jMrmAFLcQKzKzNj2JI
         p/JscbJEIPd81iSOOi8e59ftMawqYuk2XPv6BVFyrXMGrBgn7oc0wIxf66OqXuLguLEH
         V7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704235508; x=1704840308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auuogxhODAyeTAXk1aM8FKif/dnKPBiqqExdH8L+uR4=;
        b=BaB64M9rGyvUhlrzFqLI6KPe4MhJAuE/kZ5LOAY0QvmUUo9cjYR5qtI0r9NE8nw93/
         OjiNJTQBbz4iIHdPBP3kuFcQhwvE5Egl+zrvcXzAOJ+ch6BvaNb4uEBnHSwHd7dgne1Q
         H8OyctV9CnniwqnFzk5FI/LTvWZej+LOOj39dX02uSSEuPeE45S0MCWvvNi05U4Mib3B
         gghgiqMH0lgVwWHMUAjWk3wTwFJlBFx8wIqXs3uG/Gglc1xm6Z/+ZUIPl0j31RPaNbtj
         YV5w2Sy79cBJ3EB3qP++D0HDcD4dHmpQmumOwcXnJQLVWIggwp/DFu9IS18D2ueCOKar
         T56g==
X-Gm-Message-State: AOJu0YxutmM9kiuUkeOHZw01LmvSgYsk6iRMFSqmDtUV/Di7aAIZVh/U
	kwSUVMYhrS1gE6FxLkLhI++Jcv3zBU5UUM45
X-Google-Smtp-Source: AGHT+IF9oWP911JrqvLyTxrhm22gQued8ChmVcxb+6K95e/KJX4V7ur6Cvkh2PzFdxsX1FwR5XaEjw==
X-Received: by 2002:a92:c54b:0:b0:360:bfa:4143 with SMTP id a11-20020a92c54b000000b003600bfa4143mr13914540ilj.44.1704235508623;
        Tue, 02 Jan 2024 14:45:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.95] (124-149-254-207.tpgi.com.au. [124.149.254.207])
        by smtp.gmail.com with ESMTPSA id v5-20020a632f05000000b005c259cef481sm21082979pgv.59.2024.01.02.14.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 14:45:08 -0800 (PST)
Message-ID: <c4e0c179-0fe3-4b16-9a7d-1298e018dbb7@linaro.org>
Date: Wed, 3 Jan 2024 09:44:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] qdev-properties: Add OptionalBool QAPI type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, Frederic Konrad <fkonrad@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20240102160455.68612-1-philmd@linaro.org>
 <20240102160455.68612-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240102160455.68612-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VJjeDulo020w

On 1/3/24 03:04, Philippe Mathieu-Daudé wrote:
> To be able to distinct whether a boolean qdev property
> has been set or not, add the DEFINE_PROP_BOOL_NODEFAULT()
> qdev macro based on the tri-state OptionalBool QAPI type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/common.json             | 16 ++++++++++++++++
>   include/hw/qdev-properties.h |  5 +++++
>   hw/core/qdev-properties.c    | 10 ++++++++++
>   3 files changed, 31 insertions(+)

How is this different from OnOffAuto?


r~
