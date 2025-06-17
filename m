Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2480575njc;
        Tue, 17 Jun 2025 05:38:04 -0700 (PDT)
X-Received: by 2002:a17:902:c94a:b0:235:779:edfe with SMTP id d9443c01a7336-2366b3f84ffmr192940235ad.43.1750163884071;
        Tue, 17 Jun 2025 05:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750163884; cv=none;
        d=google.com; s=arc-20240605;
        b=j6Jb+C8doJfPXH4riE46oE0tR81EWPAHEx6vHToaZ4/Oq65g2jgQykPW6iV75HQNAd
         brIu3RXgHaNANtJMrSimTBztY4lAB2pX6zvquz93Be/qSWlhPX1OemPuCUZJ+vG/GxIk
         Zc4Ig/XH9GJw14em7wDmS4fqt9SmlxqeMb8Tn9hJTqnaQpu/6iqHrEdY1xPZFJsUbL59
         9NnVV+FHEZApKB9i+/0FHahw91tTk3GMvop5vayDbzqQ5O+YxT2NmEfj7oJ1+x+hV0C0
         vS7cBi1jQvpHDgOpcsgweIb+vLf+xY1B0fQvE0jl988JJxgBN2lmg6SbJxL+x2dDbrHP
         SYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9uKzW3H/dOr6s+S6VOJ2FYNtxIwtCXlSB+0Kwmd0Wjw=;
        fh=3sDOnQepqc1o4V3gWIZUKw5UQ7JAQPDJdfS/VKBdsdY=;
        b=OeFk1xpi0Lc0Swrknf/3xXZy5UvbcNXDqa5hanaue2dmiYNen30kp5xN+mHnc+noiG
         zg5gqhdcof3oU9wtTFwa+zAFjNaGF/059f+Gx3/rsAxzTqu+FJ5OlDM+4pu8/RcGmLL1
         EBHL4cLbVnxy/gyBnBKloAXllilVx8oOCrZ8cZ2JeTQLCMFtEpOWvb/wv/kTaW6F+019
         dYisJyte5iog7hVJg/h3M5+IOmSLuYLp4mbAHUEza++OB7RXw/aYl9bAjuGLBD/UH3Lp
         LccRAVwYnGlRGaZT1KWEiMi+e27jtR8sTavG4WLKAw7pOv0pX5HmyufmktcsKVHQwtv1
         sPuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZ2OKSAe;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b31bc05d2acsor688276a12.8.2025.06.17.05.38.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jun 2025 05:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZ2OKSAe;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750163883; x=1750768683; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uKzW3H/dOr6s+S6VOJ2FYNtxIwtCXlSB+0Kwmd0Wjw=;
        b=vZ2OKSAeKxahz2dpgquRD1nQRrm8qm8xwwwaQ1sPl/QuI4m5aWf5IhQ6G0d2gDpUp1
         qLHoRo4opHE/ugJggzV93lKrUy84EuN/5cDCjf11Ma2XfAwqLHG9EIInwd6/xkYUy/Lq
         GgKxANTQE9hkNoDbSgjQoXC4Av83+B1jm6F3NkQU7eMqXIxWYoG4T0z9+vArb/k2U4RU
         0MVfjq1YyGE01TtqELoM2tmADO2Ib6XjO5ghxI4loB+0xL5PyeUN7ilkMJWKrX9X6lD+
         N/3usXpS6l159O2AqIWNJvs+igMxLPA/cvdY7bzPg8fQ+s+lrGTGottMoCfvz4EqKsdO
         oc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163883; x=1750768683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uKzW3H/dOr6s+S6VOJ2FYNtxIwtCXlSB+0Kwmd0Wjw=;
        b=fUmRWv0yqGP3gbhs7WwCO1qbsxTs0KXTF9rN/zD16NvWntNmUTOLCw5pplMLnXFYY1
         mx5LPokT+eifE+cEMA8JMkoyKmBjrndjDmSyGuiBModfawnft5fRKXzwbuljhlhPPEJW
         ASmQ/sfJADBawvGF6SGFBW/BBwboC9LjLiLzkrnu21HkHbDeDD0CYZSFnZ7HbCxJ8jPd
         vqfzjpneb/L4l/n/Jhh+vljpAyYRYtGOYi6om+v85waWlRQDg9ZTelf3xc7RDy07B7Nm
         GRLkHQjQJgTh1S1bUXRmvjSdBIbJN5nguSQ/ofU8VlofmeSaXGVXlM3cBEy02lxRq5n6
         OkFQ==
X-Gm-Message-State: AOJu0YyW6XM5EbRFMf/nUtV4FrKE1N6Xr+Z9XMrTT6+cO9LnAn0N/ELf
	0ISxacBTp5Vd3F1OH+wjTDeHUMsAABvQONZtAm+Agu6FFkT6VRaEyAR9hIPqY3LYa6tWVhkeGuL
	zEfTcXHg=
X-Gm-Gg: ASbGncveBQg705VWFCKX7AF25mGwApYnd7/SIU4kO5WDVttv9SOA0dvxkQB2Fwpf/84
	853XovkKGIIN1ppS5ygS5rCFoLZDTzFcnnAWvZ/fVEM9UBOd41++5lURi8JnMXeL6QpDL9Q5OtC
	FY+lWx1YWKyiW6y46cegwryNRNUYGRDzC11w6zBewvK6liEmRp7c+zZPqRQIe91umV2qmk3yuD4
	pLe1z2YvB84SgtswsIUgEvdsj03QwAfJWisDu3w/k0NCmltSm2W9SntsvT9nR27MQfsMhT6Ze0r
	mTqpEKLHyGAmbdEvonl95WOn2DqHI4Ys5keoJHzpPqMI/UT73ti8ph+t0s1L5g7/Ylu22jiaA9U
	VjPOwtXG/
X-Google-Smtp-Source: AGHT+IGC6RdtkCaWoXRvoNEfspcD7NZpIqPCHsc0FaiMQf5DkPfr9+V3eIMMeGn+yh1WyjRj9mKPxw==
X-Received: by 2002:a05:6a21:328c:b0:21f:7430:148a with SMTP id adf61e73a8af0-21fbd57d24amr20201895637.28.1750163883360;
        Tue, 17 Jun 2025 05:38:03 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680408sm8773000a12.39.2025.06.17.05.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:38:02 -0700 (PDT)
Message-ID: <bbffdac9-a957-41d9-b1f8-3824e794831c@linaro.org>
Date: Tue, 17 Jun 2025 09:37:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tests/functional: Add PCI hotplug test for aarch64
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, thuth@redhat.com,
 eric.auger@redhat.com, berrange@redhat.com
References: <20250528203137.1654964-1-gustavo.romero@linaro.org>
 <87msa6vgsu.fsf@draig.linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <87msa6vgsu.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8ixocOaaYvN1

Hi Alex,

On 6/17/25 06:49, Alex Bennée wrote:
> Gustavo Romero <gustavo.romero@linaro.org> writes:
> 
>> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
>> hot-unplug on arm64.
> 
> Queued to testing/next, thanks.

Thanks a lot!


Cheers,
Gustavo
