Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5969792wrh;
        Wed, 1 May 2019 07:49:59 -0700 (PDT)
X-Received: by 2002:a17:902:9b83:: with SMTP id y3mr77598963plp.165.1556722199324;
        Wed, 01 May 2019 07:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556722199; cv=none;
        d=google.com; s=arc-20160816;
        b=gYwlmNfejLYFKJTUBfCQZpAHnqkXl5JKfrqIDDrl9idbjpjft7lMLQemNk2yCnBUN8
         ThW5UzNkbhD2iA6F/EbpxzUJv/I/9Jo4WWwKPFHCAeiyfB/AJKn/MQCxEze0m2AiMoqa
         vRJkT3kkryQdxqQW7U9tYC04pgokJDDyKYci70dFJf86WC+KNNxnGV3ZgGGDwryAH/l/
         U7LX14W9xtlk4lhRTQVpOy8hyon9mIz00wCa5EoKCZ5Q0QnkpLE872zyu5EWPStBRj0X
         I9F++SUywbAeHCqHbFp0hqy7rueOpSlkjJ+1j3RlWn6wgAb2PEsRbMdu9I9mVQXMD3Mc
         98yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=vngxxiBuBCpR8wMkrsvBxUI/lFGOTOf4+7dk9kWqZQc=;
        b=fswUFZlhHsJaoRxHD2NF/sAg9tdZQLv/pdw1xkfB3NT2mHa/xeHIfAkLyUaWmiZ3vl
         ipGvX0eqxjCGVa86CKVymDsaF9lv8XKfnmvP6oaJPSt5D7xnsXNrLywCznwIbeOJ/gC2
         xZaiX03S+cFNmNL+GDx2y/zGbROBgFyJg5ezyCe9q92+4lFVL7LKQTiwJDgWnE8yxLUN
         3/cIKr3ufjaGrj+2Gn4/n6Ywy3nUIq8OQg5t/0SIhDo/ff/BCHzTj82NfoJFO5ol23TS
         acGbBiBaAQONMvJWA6pSERisVlkNihDGpWnPWIxc8wgCDdx6+04eEafFw1YUzHlC0YEi
         FYqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UImnQXBm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l9sor15026922pgq.46.2019.05.01.07.49.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 07:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UImnQXBm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vngxxiBuBCpR8wMkrsvBxUI/lFGOTOf4+7dk9kWqZQc=;
        b=UImnQXBm7N5q7nXsAeg520vVFv+Sk7qSeHxl/g5mjLrrVTbUXpVoCNneipBA0Q4t2g
         KzPOxa/kojbZlSJOOlnd6syoPRMV0DCaRZaIMl7qBQOUS6V4/SPC7XMS4Q5u6SiULLna
         lQBunzBbh3uEmsKE3AGg64yNnGVjE4DThxdjkWVK8ic0nMJGMUp81Jg6IBxC/ehPAGmE
         orRTE9qOKxMMvZt+PVY5I8nfMn4wY8ARMoGL2/9tNcQh9/TNwX8EaPtGRB4zD818aQDA
         CUe6z3m6fzREhPgewUxUIOGqaNBeCvn9GK6Yszp9t/TTVGudvjecLFu2AharKXwt815w
         KlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vngxxiBuBCpR8wMkrsvBxUI/lFGOTOf4+7dk9kWqZQc=;
        b=TpXks7Vnawl+Fw7EamG3hIuuSfeStUE5lSQG4K2lxeloLSVBHyPEDHioEfxuOAc77b
         4o2i0g7rau8MXrjVtMkRDAXgKVSaqiB+03woe6a8X+WkVOvNrPhDa8Oqaqr6F5nv7fzX
         QrmYjAuT3cCIga3K3mc9ym7AF5gRWDyCVF7yjAwXo786RkxSphnDP1EE2aFShBgLPne1
         XogmTLMRpBAM2RNh5FzH7HmVoOGdttxQmb41xlu3nPQvEPeDitafEUADk/JAOnv6E3eK
         QBEYg46DIo+WhEvfaByzdRFnA9ZxuMPz2y5YLh//tZU/nCzyFwW3ol2iKwV/+wt8vFr+
         /rog==
X-Gm-Message-State: APjAAAW1lDbIpgRzBVxnWpuglsIDD8HpN2w6XY03CeognH+WbZkbIl3e
	zyMVFhOUio2HNIrKES6sbrSNjLlkNPbrXw==
X-Google-Smtp-Source: APXvYqwPavvf3K4moSXgWk8WmwNq1WelGFYOmAc9JSaavLw34VhnALfXcLuVk9Q6PsRl7tu7nmbOlQ==
X-Received: by 2002:a63:b507:: with SMTP id y7mr41602648pge.237.1556722198922;
        Wed, 01 May 2019 07:49:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id 10sm52496247pfh.14.2019.05.01.07.49.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 07:49:58 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 14/15] Makefile: include per-target build
 directories in coverage report
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <20190430165234.32272-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6b54a7c9-c455-c1d5-371a-de67ad517c9f@linaro.org>
Date: Wed, 1 May 2019 07:49:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IZD32gdOSOX1

On 4/30/19 9:52 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
