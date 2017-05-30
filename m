Received: by 10.25.0.6 with SMTP id 6csp1831407lfa;
        Tue, 30 May 2017 07:00:39 -0700 (PDT)
X-Received: by 10.28.92.135 with SMTP id q129mr1963468wmb.109.1496152838669;
        Tue, 30 May 2017 07:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496152838; cv=none;
        d=google.com; s=arc-20160816;
        b=g1B1DVaZzIYRDXvKcDX9gm89EjScXU/sk4G+zUImO6Y41L9JVnz8GeAha5Rg0GP187
         Vb0AGyvXBaH8BUKT5Sxi8Iy/H4GaBwCxs+ooAiwElpgbmeAa7IQRWwia8drekdCcZBoQ
         /YfFbdiUqU8P0TG/OajjGp/+k35Fdl43VIWvEJLJNC3phEKoAn0QJlLlGhgsw9VM1z21
         yIeZ1PqutHFsSh1SeuV7RJoWyEYE5neQsytPB/smcW6CHuDhLWS5pKcGWFkZ7bMOn+W4
         DQthkfKiBb0a6TUElTxqsqWIu71fiFKQ2k5IztO9wqtjy/ZJlZxHFKYMe8y53H+nNvMw
         fZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=945HZ8I3w5Ij+CEx0HCyqAaws++RgwCzdqIJzsVKX0E=;
        b=olAS6nu445ztDC8FWqkk0zLMTZyuze5ZZ4cWUyNrd4Lw/DrpDmHXsBJwnVTybVQsDX
         QRcLSaNLKc7PHCBLwukT7rYISxVnVF4Q1KRIZEAq6bKS7iyzuIZCTr93m2EFFfa0lmZI
         Kp7UKjlB/5mRBpi2JmfkAs2eBUdC5RYRLlLXxLWnTR8HKDEQb92bTXr6pREheYkygy6w
         h6QWumskfXbL1qq3E87nnmo3a8BvAxEws4CWeCxNRER5dqnczTrQDUvJj5pXdijP9IZz
         fQfGt+KxbsR12Xg43IN0kj9cexDibNhvTwhQCt6pFTCSqAZM4WOcUegyxOHTVJHOZCfJ
         VN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com. [2a00:1450:400c:c0c::235])
        by mx.google.com with ESMTPS id q184si26563679wmg.165.2017.05.30.07.00.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2017 07:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) client-ip=2a00:1450:400c:c0c::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x235.google.com with SMTP id v104so1189900wrb.0
        for <alex.bennee@linaro.org>; Tue, 30 May 2017 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=945HZ8I3w5Ij+CEx0HCyqAaws++RgwCzdqIJzsVKX0E=;
        b=TsAWML5U2VLeNOAIzbXClDG6R4HF7KjbNqGTDFTyZ0LLzQXDkqasFQM49vmAnR+ccV
         Q+Cs+uRRer/P8HXrb1OB4viayHTS8kT0ABlOWgfj6UXqGfRib8vqxFOKhBtUA0OZ93CQ
         k3m6+6uQyMbsow9xw5hgutDeyt7lNGLa5TuW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=945HZ8I3w5Ij+CEx0HCyqAaws++RgwCzdqIJzsVKX0E=;
        b=V7JOtCRqB/la9EgusVrbJVe+I5P8oW+B8v2GYVDSM74cTC8apLwcZQFy3J5y7azS7O
         Vq4bQ7bGwDcPUYUzW+XJPI9Na31+0oVgLH9yWP4GcV4umOeFhPR6Tf+RIDu74w0qUw64
         D/2A4usk+9u2BHFpmvFtJPGHyX2X5T4Ip8kOHCfodPwYiZydSZw1ufmevdx61tZ1SxN1
         wvOCkmcHq/4Hlm18mQXUwS3zzr9GVUrsiaQCoGGZDLrR2OcbcBjY36mHq6EqJSsZIxuG
         aAR/N1O5RvSvWzyyqwcprPUGC99QPyo+kHW+A8B7TlJNWPrbzaiZ54RVQVQDYZTHw3pt
         Ra4Q==
X-Gm-Message-State: AODbwcB/awzqYO2hPnfwMbmwe3A3RT848MTcqFaV8Um1eq4XXRbmp5bg
	YZw5u30NKZw0CPdR6A8XT6opREm9xhDTOZQ=
X-Received: by 10.223.152.227 with SMTP id w90mr7779715wrb.151.1496152835621;
 Tue, 30 May 2017 07:00:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 07:00:15 -0700 (PDT)
In-Reply-To: <82878b52-ee9d-e427-f1f3-d112c693cc49@amsat.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
 <1493122030-32191-6-git-send-email-peter.maydell@linaro.org> <82878b52-ee9d-e427-f1f3-d112c693cc49@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 15:00:15 +0100
Message-ID: <CAFEAcA94KvkXXzhnnhEKK=YswGc7qa7VGMwHZjuM2hXWAHXxvw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/13] arm: Don't clear ARM_FEATURE_PMSA for
 no-mpu configs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Z+GPwhqALFN0

On 13 May 2017 at 23:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> On 04/25/2017 09:07 AM, Peter Maydell wrote:
>>
>> Fix the handling of QOM properties for PMSA CPUs with no MPU:
>>
>> Allow no-MPU to be specified by either:
>>  * has-mpu =3D false
>>  * pmsav7_dregion =3D 0
>> and make setting one imply the other. Don't clear the PMSA
>> feature bit in this situation.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/cpu.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index f17e279..8e57498 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -757,8 +757,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or
>> **errp)
>>          cpu->id_pfr1 &=3D ~0xf000;
>>      }
>>
>> +    /* MPU can be configured out of a PMSA CPU either by setting has-mp=
u
>> +     * to false or by setting pmsav7-dregion to 0.
>> +     */
>>      if (!cpu->has_mpu) {
>> -        unset_feature(ARM_FEATURE_PMSA);
>
>
> Oh, fixed here.

Ah, yes, I was wondering why I hadn't noticed an obvious
compile error. I'll fix up patch 4 so we don't break bisection.

thanks
-- PMM
