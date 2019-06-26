Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp605867pjq;
        Wed, 26 Jun 2019 03:35:57 -0700 (PDT)
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr2357646wma.120.1561545357052;
        Wed, 26 Jun 2019 03:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561545357; cv=none;
        d=google.com; s=arc-20160816;
        b=W9j6BHdVqlsOqm3Eq3jXMp/+2dBR+7Zie+MqLEsKMcrM2UyR5FFGhdzszTJ627dajY
         Mo0fu5ljkU1mvlJyQSIkLTGmyLtOWBfYZt9zFFSbMWKT8cyp0pZKR38mhO/SkHKvfqTG
         HPFjsCIGcwD5JMWbvw9SWTinBXxBjT2Z7Id4h7Tdxq7oVe5iMKg0DitbnpiEPDrzvQF1
         30r1zcmMHpgy6FkzK3G4x7Oo1z+Cp5fja+Q6jHQDc6oMloowHJ9xwy3bpdYgz0r/+Ns0
         J0tpiyi3OVTWhSQH6un6j/H9xRbtM7F3L4LTS4J8MCAguxzDD0A2zvZOmG9qevizgdZR
         pf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=4AJoC2iAU5fpT9kEEs/GU8jz/nopVcOv/NTMQ5/ecCo=;
        b=TYedhyP4n13o2xSLX0gop+SsGjnCb/ryGoMC9nuslga6f85clROPPAHkY1faeZWYG2
         D6EyVLyqgZkc/A1gfT/CFgb/cx+2fxHkBpoJSr9P9T0YJ0+pcA12/dIHoru3KOjlrR1H
         AcjhvyuRlhPZeujdWdxGW5cYgC/66xKu1J3otJ4zFL6Lrt0Jdd51rWVpiw74poiLOE7t
         dSHV6/og+D8CahbVZqJ5Bv8Aia4pHNITRehp0HkWU9YARrsDpsccXIMb9AcXlF0LSLfZ
         QdOOwQ8kcLdrar2iau4o/qLJm+2BainyNY5woi+L81cGc1ufmtBPMa0X4+n3+JLPmErB
         uuKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZzg11w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q15sor11199854wrj.27.2019.06.26.03.35.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 03:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVZzg11w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4AJoC2iAU5fpT9kEEs/GU8jz/nopVcOv/NTMQ5/ecCo=;
        b=EVZzg11wHRwOlKQUR8d3WVj97IQmuewveXP5thUitcnBotd++2OTD32kV4TPADFadd
         PoreFmGdamwhf1ngPqnu7NVYN6bHaDDkHao7tdm9D6awAkCFrYYq/ufVdhzDuJOu73Y8
         czPZFj8RbtwQgkSp9yFLi9O8WNzksQxcEzp4W3HeY3nESFqu/GXKemrL8Y1lLTkjkXrL
         FZR7mK3m1xpIenVwgLk/FV3bAfnFZoymw+6cCbCGkaMJ2tpvQdLWOh63CjsnxhkAw168
         GwboO/abwWONNwFGCZsba/E3CYn+1ycsY/8uVmn4Esg1+6t7iZJ1mdY6vE9F+LD8Mkbb
         yP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4AJoC2iAU5fpT9kEEs/GU8jz/nopVcOv/NTMQ5/ecCo=;
        b=cwyKzNpnFc7EJGRlI78kTzlr7tLB7LUtYiLjl5X9qdW8hJ/1xf/tuRwmlIM7JadSou
         pwcdgM0FBzbh9SAy+zIINsy3borFyTGOGVWqbY+CqOV/IpeFwhQlw7JwhvdomCXT6+6P
         z/41CWnms0sDLwtgu5HBKTnUngBVHiagqiQW9TtrVS8s7Ta6e5CyBheortlwBeuMN66t
         bGPw4LW+NqGpNo8RqMKQa6A5akvAy/9dKQfvH2W4Ype31Pkl/vFRxy8ojX57q+PljDwr
         eu8H5iPV0SFr0rmGfLXY82le4xEiz8/yg53O05c2VXTp0Ub4ZMRdnqHAC5uJvyh9L0UE
         mMhQ==
X-Gm-Message-State: APjAAAXNcqeuEG38QKvvkeOa+6rJuJyIqYKeFaV+f1YIwFuTy5q3yVTA
	tSXzydHeF0ITm4NhJgMod1o/llJV
X-Google-Smtp-Source: APXvYqzAhm/dHhe3gHlv/GR89WtqA35gmYg5CIM4dYyKYz4GCxG8Yay6+si7pihRtQsI1POGrfBC7A==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr2999826wrq.350.1561545356604;
        Wed, 26 Jun 2019 03:35:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id s63sm1088807wme.17.2019.06.26.03.35.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 03:35:56 -0700 (PDT)
Subject: Re: [PATCH v2 09/14] target/arm/kvm64: Move the get/put of fpsimd
 registers out
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-10-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0915045d-61e2-acc1-39d1-99fe758a7d0d@linaro.org>
Date: Wed, 26 Jun 2019 12:35:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-10-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: of83jWxb8HhB

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Move the getting/putting of the fpsimd registers out of
> kvm_arch_get/put_registers() into their own helper functions
> to prepare for alternatively getting/putting SVE registers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm64.c | 148 +++++++++++++++++++++++++++------------------
>  1 file changed, 88 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
