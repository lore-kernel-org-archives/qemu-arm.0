Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp858909ejj;
        Mon, 25 Mar 2024 10:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPCOCVbuS9od7shOmy2iZA7KLLSdLsnhxJ9vpjZd0TKzd+kG9bOFIcehE8lJ6d2k24dGXzwlv1WHKXZL3jlFQ0Jwx1TvOe
X-Received: by 2002:a17:906:66c9:b0:a47:20c3:7c51 with SMTP id k9-20020a17090666c900b00a4720c37c51mr4560894ejp.71.1711389010820;
        Mon, 25 Mar 2024 10:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711389010; cv=none;
        d=google.com; s=arc-20160816;
        b=D2A3TWUhJY0Fz/G80AWDzX5OkcgoSJ/4WqMYPjF/3xvjpSngGcWt8wc12BNgO8/olr
         C2NXBASLH1bWOFwTLUVDdCT1Gd+Fm5uny4Q+ONu5WctWaWf/XUvh0BS1jSi+W1U0AuR/
         XHmv7Ht7czrXRsLrk9RlqaSER74vgnLavv5EZ+XltUuQu10GRCw9raxuI/6eMHnj3/rF
         Lrheu/KAwiOuneRhB124c/QILNmtXixW3GRdvhSY8qSgUO3r1GD1DcWGYu8TPoFeeG6w
         dwwkheXEUsY/g0jqJ/eSDFiEDM2NRTO6iLl/YxK9+TWHhNVUxMZLjX4494ZDwOqpJtVs
         sdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mUMnly82MrVRd1t3jtzRsWysxbErpHMd2zSWX9TbrpE=;
        fh=5yhS7cSYmFLswu2lHg3CHPZALZz7HuQifAh4Iww4CSc=;
        b=BIBqN5dOUCj8GutuJX1X16oixFSCDcJP2RImEWDqcysVXcpN2PMsWGhirNEfPoA9xp
         v6JKGXVJPkgf1aTmycX19ziJFhUBCtEgWGh1GenH69ltf/GJpWMTZeHtcvzNRcZftUmQ
         koVoik+QL6rep6CFxlGH4xUKDuCo1BvwGAVVURbID51Hk/kZdWWfp5M/pNCntaMbd2oB
         dnyZ17kxxijw/X0xGnPFvUcgoI7hkHU2ZNE8lMHvz5p22sHJwc2iBQbJCQ9P5F8+HIeu
         CKIDSj73juoZCg/RzrqbuGhvWNSen5nq26ye3pRNa/Z5WOy1nNkOQUtLCP/afMDFqaXZ
         uXAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzYKG1xP;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x2-20020a1709064bc200b00a46c4f3cba4sor1380136ejv.5.2024.03.25.10.50.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 10:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzYKG1xP;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711389010; x=1711993810; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mUMnly82MrVRd1t3jtzRsWysxbErpHMd2zSWX9TbrpE=;
        b=RzYKG1xPj9fjRuorNdvt2+5wYyBIs02Ek1AVaPX2T6oOgBBzMOay67YpCZRnERrrgW
         1VPpqXM6eb8uxz2+2S6C0yoJF9TVoUsBNcstcaMiUFmkagubiqWdC7D+2VOW9/ZrrLVv
         /8Uc7YUqN6iLkG9JKT6/ewRJzCfx10eEulJNrfECRUyjBFB18rRaNVogC/AH599052b+
         VWqh2yLm3tOPURh2rcWoMP3g0iPEBXgepEelYAsF1FgM4DILG6DKs1lSltW0GF9/GZuu
         6eMBz55xAjeW3+WBGFX5hrlyWx7YvJWbjs6e2lHaHn/Gf2tcjEiV5R5RaxwiD6Rk5uID
         rcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389010; x=1711993810;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUMnly82MrVRd1t3jtzRsWysxbErpHMd2zSWX9TbrpE=;
        b=iabTG+da8LwSch7tcuTYQ2k3D4wWETW3Zuk0r5mWpOKqrhrAkINsLpw1r2kPsQ0zaq
         oCmrSlLlmKFpEAPvAVOYAPxoqpLBYeIKqORYM3RcOrL6gZmWmav3qafoSsbZO0Kxmovp
         dQ4SAr8ODw0dqU3CeuADj8DFg+Sptfq2jPBPvskClTNmho8EcjamR6PLE+PocpbY6hEM
         FXlc4tg6AgrfkKUuk65x3Wi4WM+C4DFzySYQBudUn9r8DosQrba0uCvXwxCHSJT7qlLc
         5HtUwDEh0y5IglDRZJGAoDhVuvWYoWAJtexO2npJ8jOscwUMtc9YkYP+f8vAwfHRMyyc
         Nehg==
X-Forwarded-Encrypted: i=1; AJvYcCWeOFsShrxtQjgN/vRPv/AR2+ZkrWcMtDL1DR8J3tMASdbePKqtcXE/n+NP8XVPqTmBtMChQzePyq3tgWOZH5zKLY3WKhzP
X-Gm-Message-State: AOJu0YyvB5oDD58VX3+iNg06zcFb5rhnAGP1+U4EtXWdaiLAMhBMoeaZ
	CUxtX3HcH+RMeuOMkGPWS5N2TZvp8I1j/UeLGRes9ye5nbbq3GdyAMLSwMKVvSysNg==
X-Google-Smtp-Source: AGHT+IF9udHzvbJVSqAYQXN+uLBup7ZHa+5JPcBkF9jLPPNm6XmT+QlVnXw38vw3w3FBbUkFf0jBpg==
X-Received: by 2002:a17:906:3888:b0:a47:325e:f88f with SMTP id q8-20020a170906388800b00a47325ef88fmr5479300ejd.61.1711389010266;
        Mon, 25 Mar 2024 10:50:10 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl. [83.11.22.169])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906388500b00a473362062fsm3272439ejd.220.2024.03.25.10.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:50:09 -0700 (PDT)
Message-ID: <f74aa60b-74ac-4bca-a253-c398e06d1ce0@linaro.org>
Date: Mon, 25 Mar 2024 18:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] SMMUv3 nested translation support
Content-Language: pl-PL, en-GB, en-HK
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 eric.auger@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org,
 Leif Lindholm <leif-linkedin@smurfnet.nu>
References: <20240325101442.1306300-1-smostafa@google.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yiu8NZHfbtsu

W dniu 25.03.2024 o 11:13, Mostafa Saleh pisze:
> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> but not nested instances.
> This patch series adds support for nested translation in SMMUv3,
> this is controlled by property “arm-smmuv3.stage=nested”, and
> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)

 From pure curiosity I applied the series, enabled 'nested' one in
sbsa-ref and ran (S)BSA ACS tests.

Two more tests passed. Ones which check does SMMU supports both stage1 
and stage2 at same time.

The fun part? Those tests only check SMMU registers.
