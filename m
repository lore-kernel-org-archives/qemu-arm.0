Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp568559lfy;
        Wed, 5 Aug 2020 05:22:32 -0700 (PDT)
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3008281wme.174.1596630152772;
        Wed, 05 Aug 2020 05:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596630152; cv=none;
        d=google.com; s=arc-20160816;
        b=tZN3By2X5WEHjB1ooNTMHsDvz5CRNF/qvcGLnEQz1tS0z0RS/O8+Go+VtmE2uVw0vk
         aXfNBfOSXx0+X+0r0mLZYlAaJ4iLIajSnMa87fLHc2bS27GcuWcora2DODq2gkvAeTJ6
         SA78+9ovLEi6a/m1vD7UqSofojDbF5nnFIOcWreZubymoWAuLFRNNIPtFUUAIuAGmAdV
         x9yKOasQrIL5owLDVXeTJSBPPdxVpE5+qCVUoYmqfBc1d004zDNODdfAMgtWNWUJLHp6
         ta2h80MfqJr5cXePeSxUJwNknqfNmPqD5LlG3B16IR8n+oYFr0zO05L9V58hA7AP7b2K
         vEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature;
        bh=0txhT8ZGIBN9huhbO+h6pHwiKOp5Nh4JSK8IhwB4GP0=;
        b=fpfFknesAj2UoZJdVB4rPzuOpXRkOVINqjLPvN+eXcUv5UXF7qVomJGC4M/3ROICQA
         4Gl3Hr+SsOFKn0x5EkBx72QnNwnTdeFZE4uCA2sOL5o7eiRUaja1aLGQnZn1iV9LhZdD
         8y0+JxVDJ1lQXSJ3p4v75veUI9VbHJQfsVzc4dJYVJy2A8Yxe6fLiUi98ibwcO/3D6mU
         0cNRT3P9mvu1FxW80I+vYZaNRXns4AVu41ZKBReK9P96iHwXJwkVsCZbrUIpZuqK/gXf
         CfR67+r23JeloI4nlb2m5kqR6lxLXq6Hsiu3mToq7pNMhRp8C4riH0ghtjGfWJwOHqyJ
         aMwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KXdRcA5Z;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u18sor1170958wmj.16.2020.08.05.05.22.32
        (Google Transport Security);
        Wed, 05 Aug 2020 05:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KXdRcA5Z;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0txhT8ZGIBN9huhbO+h6pHwiKOp5Nh4JSK8IhwB4GP0=;
        b=KXdRcA5Z1tScW/SbiueOGsWVKNS4QGFFgrKvWIxKsn2zlZub5kop3YHkjui82uD7P+
         D0Wt5f7Sn+gCAcVVUgxHp5N7Fk8/7nkUdYK2wK1f6ql9eNnsPURMCPWjgBZnHuRkMUW2
         HZ9CqNFUxerzbmORVVLEzVenfeavxxmiSWRrWVfT6LNu8fnknsm1TI/+Au+//zOFJt94
         OOXieF1fdifjs4I0G5LtnRF2iZg0b/NS7+HK9vSQYOfA0RIVFj8n5TPhXtnOoF42T3sG
         6WsVzUSPdMOXuqNnppulBJaP6tfIfMDxbkSMvi9MgKw8+elICimuJaHbQP1NYnWmOUjx
         8rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0txhT8ZGIBN9huhbO+h6pHwiKOp5Nh4JSK8IhwB4GP0=;
        b=R+fYPQmUUJCoRC3g28S+LqMoNslzQJdlNdvKfgAKEz/zqpQTyXll3WmF0WbRu5orHD
         X9C9zGUlNDP4XhfCuSkr8E3lRIwRFDShJlw0R9atoIi2R523K74tZnj0FYLnAQdoX75g
         pnQgajDYNd/cdkUG/IM16f2a3bFl3Fp7XjMovlEicSzHo8qwAEKiQeAVHhqEwuiazHa7
         qIQwXiO0W6yucJtu3PxKc+cv14DuRNGfNt4CooGgKoAoSFXAGwbT02clTgtjwVmeb7/D
         P+Qk+RQvqE5lJQV0D6S8xDKMsVascLFJ+OZXdiIthicomah/m0Bu9c3Cp3ptmuFHHwbF
         +RXQ==
X-Gm-Message-State: AOAM53146PsI/u5ODDBthzqA9GLVjFNG1+/HbzShjk+rinMfErBQvcBh
	WMrZ7lcIVtMn8igdY39fbeAZraxZ
X-Google-Smtp-Source: ABdhPJx605f9wtjSqQWt3r35rigzQfYmeSC/DdW2LyjvP5GHIIJNhfVIeCw3msKijwOpxD+uYDw8JQ==
X-Received: by 2002:a1c:3886:: with SMTP id f128mr3021448wma.121.1596630152110;
        Wed, 05 Aug 2020 05:22:32 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id o2sm2832799wrh.70.2020.08.05.05.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 05:22:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification
 strategy
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <afeb7479-48b2-3665-2bc5-0f5dae23ea4f@amsat.org>
Date: Wed, 5 Aug 2020 14:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: M2gby0p73VpV

On 8/5/20 1:08 PM, Peter Maydell wrote:
> Mostly recently we've been aiming for QEMU emulation code in
> target/arm to use ID register fields to determine whether a
> feature is present or not (the isar_feature_* functions) rather
> than the old style of defining ARM_FEATURE_* flags. This seems to
> be working out well for A-profile. However, for v8.1M there are
> a small handful of minor behaviour differences which don't have an
> associated ID register field, but which are instead in the spec
> and pseudocode just called out as "if this is a v8.1M CPU".
> (The major v8.1M new features do have ID register fields.)
> 
> I can think of two ways to handle this:
>  (1) define an ARM_FEATURE_V81M flag
>  (2) define an isar_feature_aa32_v81m() function which under the
>      hood is actually testing for a specific feature which happens
>      to be known to be always present in v8.1M, like low-overhead-branches
>      (ie ID_ISAR0.CmpBranch >=3)

FWIW finding myself sometime git-grepping 'isar_feature' I'd rather
choose (2), even if there is no such v8.1M ID register field.
That said, my end-user preference isn't very important compared to
the developer/maintainer one.

> 
> Any preferences ?
> 
> thanks
> -- PMM
> 
