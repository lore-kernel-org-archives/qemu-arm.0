Received: by 10.28.4.212 with SMTP id 203csp911123wme;
        Wed, 2 May 2018 09:26:56 -0700 (PDT)
X-Received: by 2002:a63:ae49:: with SMTP id e9-v6mr16268677pgp.38.1525278416609;
        Wed, 02 May 2018 09:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525278416; cv=none;
        d=google.com; s=arc-20160816;
        b=cupEwtbWi8togiZUo2pSQsxklz+Bwp/FeJAIiGfVLUeqwXezjWFfnT9mzZfNVuEhkR
         bdYn8zAeB8MMF7O7orz3r979VezfNDKmzjEHIEnMTNtoo8X0l1Tg+dqWnWbIneJrQ6hc
         6PXAcCu4A2ufbVYZkoQlOqdZJpYBzPOH5ja6td6GuNDnAAYOwtir3n2s+7p97vAenpJE
         Rh9ejSoe5H/VoL8rjR0sVcJkImnSx9GnKn0cdA15vSaVVPDnwwQjPIqMcYFLpMdrgtba
         3FIdTgEzocK3pmzh+mlekrN4Xe7o9cl+ZL72J+3hhGoR+tmTzRmHc9SSwvVkm/QUepWX
         hguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=k9cgkHcjueNhSznoo3jdWKAuMRM002IqnUvCttQY+3g=;
        b=tEvOiJ0NbA8MMFMh+H4Ap7Z1yqrokGZFyVXBjDrkP/s0+A1m9dLoRhQmN0WewtGQNC
         6HRyniiRHuhhk7Buz7/y/lrKQNkmlfnv6dQG7+jCGyxmTDHSs7kK7Xpg9JRmOsQe5ngw
         JrmVIjiN+FAAF43HPN2QFFBX37K4pX/frvhZJNzEOiNG/nWAJHzOmYj+uHQEaqNFoDZZ
         T1TIDHLdp3tmHxFoQ7bX3lAcaGMbC2E7GlQU1G0uKlAU6Q97JC74Hdg/XreVX4KGR96o
         sFRj6zUA3xyn2NIRuPSDfsCD4Uc9AfvEDMm2GlhOpXqvv2Ie7b5bB8TOFiLX+aHu7tqc
         1dsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abVRMsUy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g9-v6sor2545111pgo.145.2018.05.02.09.26.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 09:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abVRMsUy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k9cgkHcjueNhSznoo3jdWKAuMRM002IqnUvCttQY+3g=;
        b=abVRMsUyALZ0iEmY4qS3pRcVGMYiaAFDr8dfn5Bdb7SfLy4I5ZBaRaYi8PQ+Q37GP2
         RIBj5tyBAfib/9qn8NchmU46Tq4smdZyayCkE5p98TsQXzqxsvxPavVg6p3kxTQMKQx0
         W4c8WhDn+06X/b4jtfNEHPpBQPGmqe++tA290=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k9cgkHcjueNhSznoo3jdWKAuMRM002IqnUvCttQY+3g=;
        b=lgfujwhwRk+mJN9fZAR78YAGHBAmQbCut38W4KRWPYyOE1Wqmf1VjqooKNpswEJq8V
         jy4i99W5bVjWsVQ+j3ahulXVR/iHAMElZvgGYQua8Vz6+dU8B3848RjaoYyaJaD/0eov
         WqHrGnrydpRxxVm6LMnttDGYfCU1/nRbqGSLh2yGBYZbJKCJl0RiJp5DHiseadyFn4yC
         cFA5/KA5ILrpdPB+k7FsFYkmBpNWNEXNqvXXxyNKC91DQgf2/uxWlFQSkw4ZNjl31rBI
         NlNJA2XmmrPmLwn5rSGII5p/NfcIec7fJkLjkd/OM/B1KSqYVAB+satLtaDOc0b3sFHT
         KbCg==
X-Gm-Message-State: ALQs6tCC7WrXVCS+VYJ6L0CBn8NIFVtcH1lvrzd3N8vZ1bGjDoypyAjg
	rt2mRtHsBNNGjNKIiLzJRj15EH8bG75tOQ==
X-Google-Smtp-Source: AB8JxZoThAHLfzKUy2Y8C9621wkpUZOpdVOovb/FSw0q+YHENg3Mkx+vf4Fgam3t2xSj2ZWjdbgcaw==
X-Received: by 2002:a63:6d07:: with SMTP id i7-v6mr16376401pgc.174.1525278416128;
        Wed, 02 May 2018 09:26:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id e6sm15303204pff.185.2018.05.02.09.26.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 May 2018 09:26:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] fpu/softfloat: re-factor float to float
 conversions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20180502154344.10585-1-alex.bennee@linaro.org>
 <20180502154344.10585-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ab75561d-3484-d02d-2733-d0cafd12ecd3@linaro.org>
Date: Wed, 2 May 2018 09:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180502154344.10585-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: z0SINckqPSh6

On 05/02/2018 08:43 AM, Alex Bennée wrote:
> +    if (is_nan(a.cls)) {
> +
> +        if (is_snan(a.cls)) {

Watch your whitespace.


r~
