Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4416313ejc;
        Wed, 11 Jan 2023 16:37:13 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:188:d2b3:26c1 with SMTP id z6-20020a170903018600b00188d2b326c1mr97979651plg.10.1673483832864;
        Wed, 11 Jan 2023 16:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673483832; cv=none;
        d=google.com; s=arc-20160816;
        b=SoGi8aJ19NXB7lWV3wQrME8EQh8thN33UmL5dxqFIoTm/pM6cwIQoh44V+/N5TcaDj
         EYd+hiwjBr5Ew+rP26GtkEpBK816zzRCEcO1R9yIgCUXzglXXy7nJowTNsYtlQN+wG2C
         RpXFa5dKhYQAo62Mnz47u1Y3Oahhq6DzpA+pJ1ZdOGlHwCHreB7RJAEGmOawpcdIFAQJ
         FWIXeviD1ukEI4onEceDiSXPvLGSuNpla3hNu5TW8G29gf9VvsmWhYMZl/OWDkCt3fWu
         QXTIsMONxv2f25VkKyGvOnL+mClYa3AOfSOBT+a2wlfoOIZw2CPkmj72i94l3u8CReEI
         U6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P8D66QBPX4fZgqOG7/VW8Yb8evSDFfLLLM0zaFKClFo=;
        b=Xn+vHu/N0WfZQoFE0ziCxOSL5l6r3aUWB3NjWM183Ksmglx6Jo6UzEtNeJ1pk/Os65
         kw0cOFJSr2QR/P6SkSrXGqlYS3a4BSnH1YdmJl3IBc1GGfwzgjtYqSUQSyHkO8yfnV4o
         jRxikXSe4DEyBD8dGrZ3b+EjDTLFxJ5e67a21kQwnoQ7bG6AZ1Cwr3sC9kNTuwf0UWrN
         w1APL55r+Av9/ESBZPvHm1YvOWS5ZzrNxK6Ckt1JI2OnmyR08RmrkmZ4fKyAxo4sO+K8
         ME5dh/Jfh1wqnRGqJiWj+Gox6Xs7F0PSjorExAveYZUdDrlBR6AfAkj2QaWZXK0wgGwB
         ZjOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSbLegtA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay5-20020a1709028b8500b001930b7c53b5sor7787875plb.5.2023.01.11.16.37.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jan 2023 16:37:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSbLegtA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8D66QBPX4fZgqOG7/VW8Yb8evSDFfLLLM0zaFKClFo=;
        b=rSbLegtANOTR2ZB/+rlm7Y1xRLvZck9Hp0mxHk+iVC2f13fHVCvsLap21DtLjzknyk
         yH4SUzmJZmbdxPov4EmpBBnCMmT3pO63eP+cBiSJp3N6eKY/j6Em8c7y/68TPLtuu5C9
         38A5SG9dqZcvcGvNP13BhDHjezlJmfMsf2mF9a+GRKTpe1QiHX2b+g59HMr2HklWiFwA
         ug8uCUL9qhtxmi9rnyu0i5h5dZeHoXrCJOhpcy0EAZ7B0b57X2xERVol3ti8wPANklP/
         GikqN8840KRYpc/1CDDkc345o4NPX3TyurteWVEyw7frDTbTWa8OEROHg8cc05tqqyeM
         PsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8D66QBPX4fZgqOG7/VW8Yb8evSDFfLLLM0zaFKClFo=;
        b=2p5LHOZO3E3WdjosZ1aqKgS2AIC4wyONslOvZxfG66soiaIsKY189YMZRTD5pQa3Ia
         x3lF4x7S3ktzHd8NYeYOUR/APpMBLQDzt3euW6z1MT/CkSGGf3MDVQ0T+ArhJlfCPq35
         65GpIHQppO5zLe+1IfPZOCOdctEI8h0x5UDQilrPSSVD1ZDfnu8TRP6WkaioSvujlejY
         RGrpM6ETv1Gsd19gHfmarjwcuC5FQxgiV6mUEj65Gfgbp2BjBZkVrY2mrREnlKD06ZxU
         ZwH4CqqwAsDlg+ykvsIr/9cDoDdvfpulcL9GEOwHMZ8XdcEXqLy5Qw3x09R1uxkrW3+w
         wOQA==
X-Gm-Message-State: AFqh2kpwq4chS27h1nAwriAC6MQQB6L4bt7UCjpF7+crwNiw0nd3B/cn
	uYueg30J+lNiZt9m7szxbDbcDB4t
X-Google-Smtp-Source: AMrXdXs6ZKDxhmOUPG2eDHzcx776wA93Xks+2RCfGIWf6SLUuncO3Np/hAKVrKsvwKkf/hgns9zsrg==
X-Received: by 2002:a17:902:a402:b0:191:7d3:7fe4 with SMTP id p2-20020a170902a40200b0019107d37fe4mr66366586plq.59.1673483832345;
        Wed, 11 Jan 2023 16:37:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090341cc00b0019327a6b740sm7994562ple.308.2023.01.11.16.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 16:37:11 -0800 (PST)
Message-ID: <b316e3fd-69b1-4be4-a748-53116fa52576@linaro.org>
Date: Wed, 11 Jan 2023 09:58:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/18] hw/arm: Use full "target/arm/cpu.h" path to include
 target's "cpu.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H9rGVPPgh1I4

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> First we want to introduce a new "cpu.h" header in the "hw/arm/"
> namespace;

Do we?  Is that really the best name (not having seen its contents).

> second we would like to get rid of '-I target/$ARCH/'
> in the CPPFLAGS.
> Use the full path to "cpu.h": "target/arm/cpu.h".

That seems a worthy goal for hw/ though.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
