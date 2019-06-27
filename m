Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1475084wru;
        Thu, 27 Jun 2019 09:20:00 -0700 (PDT)
X-Received: by 2002:a1c:107:: with SMTP id 7mr3852893wmb.84.1561652400765;
        Thu, 27 Jun 2019 09:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561652400; cv=none;
        d=google.com; s=arc-20160816;
        b=ecQiDj8gn7fR/72D8714bWv9hZ4KVCW+mOiGDqfOsCOtE+ZG/YlvwIH72mQjdEahUs
         Io7SMbQh4U74QQzE0Dr/E89fJqTItWtBwQteNEuFGit4vfoN8kexsePos1n3fHaJxDJL
         EtfremtGV6agg+I5xMnDiNhj7oVF/xOcjbwl5unZoJsHJhK4eeY3d3UlqMQnzg+Z9GoQ
         jBzjgW498JKu6klX/EeUzMOCwCBf/fMCnU9OxiMk3QpK2VkEA+zZ0hox3tQqWMuwrobu
         r4N2Gm0oGERI2jE0Cz4rbTnzLNAgE5QP1Me0IZtDbGYANvQ+TUlKFAfAwDh6uyzrEakp
         Kzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=FAwBUk3G5Bj2CQarLPtJt2WX0hbF8QWcnx2JtkNbuJw=;
        b=Dkdk0ei+K6vCTym3gwtULIYc8kn7F2dgjzcngf0wlQo0KQ48BE25Hgm3LzpFnz/NB0
         aiJ2pJMLi4lDM7bbpECYr8aEUKjez8H1647ddf8B5Z29PEJu79iGdpF17UusjgAvLX3B
         DS/GW9YdC0aO62aCa2Nt3O8Fh3u39CAWLo9s4rX63dyCQZkDdX6yCl08R5nI7LoViocp
         qxydkN6mjdnkq/2qrUtU4UaweG1GIoTqpOF28iArGUxcs9I41wsf/69V4WjYAKoN4StS
         iytExU1BLU14ekSMVhnJfd7qdsIyiglqcevgthJIm8Glmx2iKbq2oB42nfZ8TwyWmxhE
         CDRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vf9qtRCh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g13sor2267313wrx.24.2019.06.27.09.20.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2019 09:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vf9qtRCh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FAwBUk3G5Bj2CQarLPtJt2WX0hbF8QWcnx2JtkNbuJw=;
        b=vf9qtRChBWvudlQuif0zapRi6RV5OpzO+5w5V4NPZgvOb4ArNBOedHwGhWCQqE0szu
         2SOb9sMaG6xrMEGie7ZnQXXmGwduu87J1b0nEyJASl/b08F79EEhHncJp81U9W4C0EG4
         r9DbVdK9xLHUVAhLLdrEPoYxTrZNF/VL/dDbwuIuL1mGFWES6Pz7V/mXg6B5mKPlr+T1
         H6mDhuepd0rM1s9Iuzng8qbeuLG1LlNBYRbwnXt5nWg8cOgIU8+mLelUy0x1KG2/jNt8
         LGB1EB/fFFN18snvi5moF2h52npxGTu1uFoAKDRh3Jh6yigG5He6ZfOYYPsPLFhXIbUe
         +NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FAwBUk3G5Bj2CQarLPtJt2WX0hbF8QWcnx2JtkNbuJw=;
        b=Q8/rgKE5kEEtdNsZtDJjVdzKlETzEZQkx9FiqEAhkchsA8mCvS/O09bZc5fDrl4KJj
         KvijBH5IzWL1e9kCQ2MyRa5SFU7c87mowqdZEYl/anGx1bD2W7Q0KT3ZuzlRPpZ9PGYc
         AtObK0XVKDBMU11WlRgmBa9t952fi+JygMIMxbubsBaqR4W4CacjG4yAex9Z7VriEiq/
         reDaiiP9KuC6v3r6OIu4yDo6v8KJGpFhpHj675bgIwZchDEqLrnFoLnyRUrlDahLumEt
         IvB5qrWwQDAZWmXG3JGEYkwLz4Xv6FAIjHiZF+WTYL+bhunTHltDaIIzUndSci6ge2B2
         fDrg==
X-Gm-Message-State: APjAAAU2NdTrLi0cv6QF8TyXEa7HH0bMUwjE8nROvlCbtqjKlHrJmuGE
	XwdAQS5dlLhQAzfHvwDPRMgRLtZUdo8bUee+
X-Google-Smtp-Source: APXvYqzRvmfcuD/TooS0//8nWZLBxVvzdp9XwvwyUlcH49bPmOKokAlqMl6xofm8+uW6Dag5Wc2Ztw==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr4080077wre.294.1561652400048;
        Thu, 27 Jun 2019 09:20:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id l8sm5098420wrg.40.2019.06.27.09.19.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 09:19:59 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
To: Dave Martin <Dave.Martin@arm.com>, Andrew Jones <drjones@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
 <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
 <ae98bf94-6826-1f2b-2f2e-a11a3f75cb92@redhat.com>
 <20190627114701.n7tjgmljeribk7to@kamzik.brq.redhat.com>
 <20190627151628.GI2790@e103592.cambridge.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d0f5ee56-1e10-6c27-40f1-69b87a43fdca@linaro.org>
Date: Thu, 27 Jun 2019 18:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627151628.GI2790@e103592.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 5+O/e5ZwoJNV

On 6/27/19 5:16 PM, Dave Martin wrote:
> The architecture says:
> 
> "For all purposes other than returning the result of a direct read of
> ZCR_EL1 then this field behaves as if it is set to the minimum of the
> stored value and the constrained length inherited from more privileged
> Exception levels in the current Security state, rounded down to the
> nearest implemented vector length."
> 
> I think the behaviour of a direct read is implied: the LEN bits yielded
> by an MRS should contain exactly what was last written to them via MSR.

I agree.

Moreover, the value written to ZCR_ELx.LEN should not be directly adjusted
because the effective value also depends on ZCR_EL(x+1).LEN, and if the
higher-level EL register changes, the lower-level EL must see the effect.

The function that should be modified instead is sve_zcr_len_for_el().


r~
