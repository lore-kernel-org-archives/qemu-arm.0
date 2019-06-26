Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp358651wru;
        Wed, 26 Jun 2019 11:29:13 -0700 (PDT)
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr256992wme.31.1561573752954;
        Wed, 26 Jun 2019 11:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561573752; cv=none;
        d=google.com; s=arc-20160816;
        b=lifeXy4VgkX4PiMm4RVlZ4u/RSINKWqTIqBDzFYYKuyAaiPqeeMheYW5aZ8488Fzig
         5m6DJGHRWD7N1zZQP1Niwxxnba37k2x9SX5lbM4PrWzyGCY0jHAJal5V2qk4zOePdM1K
         flMTTb36ezFTP55yDGwdm9Ig5Wc5tC6tFQojcjWq+nQtnXPIj4ymdG9seIzRXZgfubbG
         xxeRoFWy0ZV/MGmos4DHedanIVyeNxi8PLLll2J7SyinDcVdActUk5QKFMpV89SefxgH
         pNx2uOZ2vyYIkq8krCEyiUlBXraW2T3zAPrW+Wu9/DI3SGFmAhhv1+a9fsZMG/NWmX9E
         AjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=TlinqMiI0XnNpF5PDe6h/VtVQZwjyIh7N8OSWH29deA=;
        b=lfPFhW7Xmg2uJSaRV9K6S3dXwTDlaqCXwbKWNQ1kCjxyZQBKRFYIvXLQ+AJverE/Rs
         B/Oth5o3KstJb+wsf9ozI1l0K28m6kqv8W3tXsevhLPMZn4h78noUsOOwUNahHjwwNuw
         RT9mlCqS8rh7bGRDiS9AlZ57nMYxF4QF/BRrDmS4RFcecZ2Y4+UrL1TmiX/KMU/f1NFV
         LH8tF2p6xd1Dd4gHiJt5uv/tSClOTiAV/iCq8EvWoj6ORJg8YccynUrBnINg2QrcDayi
         s3yP9QpN1gt+HMxtwhEj3dUlGtttJm5ENxG60O/6eP0h61gTAJ/QwZ6+j+ZjOaPkAo7N
         Ksew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2LJfQNp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y132sor1679433wmd.19.2019.06.26.11.29.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 11:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o2LJfQNp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TlinqMiI0XnNpF5PDe6h/VtVQZwjyIh7N8OSWH29deA=;
        b=o2LJfQNp32F+LBPbs5mKuIFvKfPbjGDX2iCoxCi3E3aLoRi31GAgZhJn5AWfpQ7MMM
         Rwx+nyG23C+NrWJiMTsA7d9rY5rD8E01c8Ht5rS+faHD06V9YR1yCjcUwDC2TOggoqya
         ku28IAve7BPCqoXs6q43kPuPWeSXcWsHMPdUcVzBf3J3VRpIm8uyA8Xo3xTmGCZW2brB
         isW74UvNqDzUwQd1BmNXWbjjkWISXx9kg5G1l66yZsmC84YPYZ5P1nHmyxEsQieA/h85
         kPm9OJSEFXj9hhs8SnA6eZ5o6vJ47CXXOS5zICRF8dfaslBU+crgxZhk6cDTyEy6XoI+
         wtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TlinqMiI0XnNpF5PDe6h/VtVQZwjyIh7N8OSWH29deA=;
        b=DmQBVShcm3jWREu11O3mAOAVryDFeArjSUCBVQj+gvfrU/A8PrVmSuEMDkmD0gSr9s
         9atwQYdTUoTzhmwTGJecMZoArwlCpRLo/75HpcDqW73AnyjuaTMDIAiVnqsU0R0LztV3
         Qs5asFLeFr869VBiepbm72dBnVUAEXftKAUVbd0oRw/c51Q5BGjOgY9MPZbugN0iF63w
         kDL+KjwRMIzry4c0z1pU5zU6tIyVr4TPZKHnw2pAkUyWkGzKnLf4gxiQld7ZI4r4Pi1L
         laZWyrXp9OqOG+Kq8J7mbnUxC0MlOsPfcBc39OKT6iLEuy12NBZ0TrCX7lNC1AX+OAnG
         Zx1w==
X-Gm-Message-State: APjAAAV4ClFr5Z/8MQ7Ya8/xbciVJwegZvSAN6lEs55IsrL9CyBY6bHZ
	+9/RipgmqQgmLSgNT/e8A9q85n7U
X-Google-Smtp-Source: APXvYqz3IgYAemkF6MzC5BiDq72EvLPgrxuftT+0RpZNi6zva8cr6fvkyS+Iw0JTkPOKUxMLoP7mRw==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr254634wmm.62.1561573752606;
        Wed, 26 Jun 2019 11:29:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id o2sm17267186wrq.56.2019.06.26.11.29.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:29:11 -0700 (PDT)
Subject: Re: [PATCH v2 12/14] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-13-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9fa08d2a-eecd-e7ee-9f7c-abc763ab417c@linaro.org>
Date: Wed, 26 Jun 2019 13:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-13-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: lS6itn9Wz5cF

On 6/21/19 6:34 PM, Andrew Jones wrote:
> kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
> parameter. Rather than just using it as an output parameter to
> pass back the preferred target, use it also as an input parameter,
> allowing a caller to pass a selected target if they wish and to
> also pass cpu features. If the caller doesn't want to select a
> target they can pass -1 for the target which indicates they want
> to use the preferred target and have it passed back like before.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm.c   | 20 +++++++++++++++-----
>  target/arm/kvm32.c |  6 +++++-
>  target/arm/kvm64.c |  6 +++++-
>  3 files changed, 25 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
