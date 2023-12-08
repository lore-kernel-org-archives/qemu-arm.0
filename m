Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2563111ejb;
        Fri, 8 Dec 2023 12:03:22 -0800 (PST)
X-Received: by 2002:a2e:8051:0:b0:2ca:1e6a:923c with SMTP id p17-20020a2e8051000000b002ca1e6a923cmr282949ljg.36.1702065802729;
        Fri, 08 Dec 2023 12:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702065802; cv=none;
        d=google.com; s=arc-20160816;
        b=akYaKj7UlT2lf6txhSS89eEr6mcT0D+nY0iAO0gQWx/DtqYWU5fqUPOrdVnM3u+w4h
         G6tp/xl/l3fn86Y/c4YVh30MgUYV36UCm5QDT49lzmG5ciPvizygTzmFWQFXCHK1BGhF
         6RsEyuiFz6XAXlSymgwhgw9fb5xzx2THII6OliM9SPoMGWILGW4D4kvIem1ZNfvqlHB3
         fFdJGaHNKahgxH/EZ2sg1h1INq1sLBwwPUKK1GBkBrR21rJNWp4g6P0FTJpiqmyMPqhh
         lRS7SmKZ6v5DcheRkhbXVXuBqpP+GmGrbesCcylmw3T4012FvvHQh588Dpe7sqnd5nQ9
         zigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=YwnbFYwpV3LUVIj6IokP8OukY70Ms4xhebL0+HoyxDw=;
        fh=nxE0RK3x2aguq44EriJCQ4LaWSNQ7u5kHZRdr2i7QEY=;
        b=AvMOgtjizsmwwU/sNlcaPp8eZ/4p0MXb3qqDz7QPKpuFj3sI4RjMQE/eZZpouixQ/M
         UGz6K7Upic+VrA5ybxQEhgSwbJKFJSyLhhU2BCDLavTTcv3JjJb8aL3sSsbKcGs9pZDU
         sTYl10jNVc1M9q31ksz8Lemhg3hH9WoJoal3tnbD/t/Y53zs4WJGPMbYWSb2rfh63O7P
         96OgtL3Lgws3nX0taWbVfrcPoHHj5Hoap0KIQb7Vsv+3RSS6V5z2eklNaV9rKm53b+sn
         4hyVzlFKEDBEoyHOz5uhFYmmaofkkps4Fc9kDkcqStVPLd+y7yfjrsB3P0mYIQsp0dgw
         yswg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flLp4PCm;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id br26-20020a170906d15a00b00a1cdf8b4535sor717383ejb.18.2023.12.08.12.03.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Dec 2023 12:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flLp4PCm;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702065802; x=1702670602; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YwnbFYwpV3LUVIj6IokP8OukY70Ms4xhebL0+HoyxDw=;
        b=flLp4PCm8KitZV9zcGHubHg0k00AM1QQONFBPiSiG2JY2kl3X1Ry/KIVzUQaYxWwNK
         CLE/SacwcgPjgNVZek15u4r2GCeuIVwPSxJgKmnzav4FKTl2fznBFIasxThYpP2/C2ou
         442vNbEvkH0CAo6EdjBOP9LHSa/ryvzG0LtjQbH3bcJqHT+We7TKRnjrtCme4hfTtvwn
         riMHHuyvvpa4+EisHPBWSqcBgTmAHCVET8qE1Ghb1Rf7SSc4ZtMHh7nRJm1LlRFBIIAo
         neqxuY/zFgx9/24FC8ywM9QxSxbGEM+SJD97bZ085IxkjRLCEnXwwL3KYs/nZVBzQILt
         kY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702065802; x=1702670602;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwnbFYwpV3LUVIj6IokP8OukY70Ms4xhebL0+HoyxDw=;
        b=GMosqbIK4f9mmCeHGLGclsOPz5KFGOLL9Hs4y2sDqQncfTnOgMaHvYHX8IcZ/k6GBH
         /3I//l/uA0d2Wj5zjQCM2RgEaWPJPRyJwtDFc31xZaWYv4+AbJr1AIjJVtjeNZSAs2Cq
         vKV7EOn9XtHuWQGorIog0zDD1FKK4Oa58Hi5oOacYyfvxE0WItmCdgFk78Ko617yNLHC
         dQF3BrP7qvb8QE8mwcoru56/y/KcPKF90FSNH6ooGuahfJ4iLuSILpzqbwaz3/BUKqop
         JpLPHbkksbN7Ko0ZnTI6R2IRHlTmMoze6bx12A6zNBn1RWXYpeaQZqG3g9FTQHXngl/F
         zc2g==
X-Gm-Message-State: AOJu0YyAk14wjy+SlqcaX1jPROm/KSJNmbEePT0FlbdYNPxDc7ts4ifE
	VzeYY79jVbF8I1roRK9siZMNSnBd
X-Google-Smtp-Source: AGHT+IHiBMv5Qcs8uwg/olNKskwGDaAfdVabppOUwYMzz64eFH3pWfXjLgRZqoQpcDstHTtDsCpEAg==
X-Received: by 2002:a05:6402:2313:b0:54c:4837:a640 with SMTP id l19-20020a056402231300b0054c4837a640mr416396eda.45.1702065802371;
        Fri, 08 Dec 2023 12:03:22 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.206] (83.21.112.88.ipv4.supernova.orange.pl. [83.21.112.88])
        by smtp.gmail.com with ESMTPSA id a4-20020a509e84000000b0054ccc3b2109sm1087187edf.57.2023.12.08.12.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 12:03:21 -0800 (PST)
Message-ID: <2972842d-e4bf-49eb-9d72-01b8049f18bf@linaro.org>
Date: Fri, 8 Dec 2023 21:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] tests/avocado: machine aarch64: standardize
 location and RO/RW access
Content-Language: pl-PL, en-GB, en-HK
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-5-crosa@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231208190911.102879-5-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6XY6d7dLYW/Z

W dniu 8.12.2023 o 20:09, Cleber Rosa pisze:
> The tests under machine_aarch64_virt.py do not need read-write access
> to the ISOs.  The ones under machine_aarch64_sbsaref.py, on the other
> hand, will need read-write access, so let's give each test an unique
> file.
> 
> And while at it, let's use a single code style and hash for the ISO
> url.
> 
> Signed-off-by: Cleber Rosa<crosa@redhat.com>

It is ISO file, so sbsa-ref tests should be fine with readonly as well.

Nothing gets installed so nothing is written. We only test does boot works.
