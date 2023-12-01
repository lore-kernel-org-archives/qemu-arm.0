Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp876158ejb;
        Fri, 1 Dec 2023 02:24:54 -0800 (PST)
X-Received: by 2002:a17:906:b814:b0:a19:a19b:55e1 with SMTP id dv20-20020a170906b81400b00a19a19b55e1mr608165ejb.113.1701426294358;
        Fri, 01 Dec 2023 02:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701426294; cv=none;
        d=google.com; s=arc-20160816;
        b=D7uznE+C1OjonS5rlZXbtEolMlvg2rUriWDSVRMwr87Y64Sjb2i2De6MAfwamkPtSU
         qKzGZcK3zfCrrKfU5eiOOR+KrjEeD0AKE2paF4X1PxqvWRH8qwADI6uhy2CmMI2WnmuF
         HY5BtK8R/0tiht1p0+Uwm+JLKRNm3+UDbGSD4isOI/k0tTMyxUR3TUdioogCTjLl9q4P
         18j0I2i0JvleNqoOP6vFcNqNqMF/PUfi4iQDF2HKSgQNCRMMhEERJxBDSEPD8+LFtKXu
         zHZaK4fyKxcmN4CzxFu3EFDcmkUEcCxBAXEYovYnxhxT1g8YTI+xofwFsDzfUzE0JkXF
         rFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Te4OkgsX35RkcPVDsJvTJwHDR2tUW0LsBAKejqLnb0I=;
        fh=C/d1GziVjP5tVHj9jjg7AvDTPhljk/e5tV4vnHBycxk=;
        b=g2FEigPL9Vm72Undx/KgaQW2AXmimkH5Ka+dP66k7rOy9B2mGj8rK3V+1MAXYl33GI
         QoJUXWqllF5sSVj0kdqHFUXp/zTPOiNXZHgB/g8a7zhilEXKdIq/xPs55cMl8S8r+sm6
         ARwoKDkMGlhuvlJy+wz32f7vuYoiedjcvGaPS04kIlVQf9nOPoqF2WpSZRIGqSeA1/Va
         KQSZxwl9v4D2+QLj2KFElz5bG/zHHFHKzGU7qFZ7uHS78xA+rfPXYNz9PfX78Wkaul5h
         1TLKorozS3PCfojoaJo7oz0Je0DDEfMVRhr30rr9TJpI5bC7cgJUwQX1WB8pVm5DOKYk
         YK0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DL3CEuV9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 26-20020a170906009a00b00a0fe1f47070sor1343094ejc.15.2023.12.01.02.24.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 02:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DL3CEuV9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701426294; x=1702031094; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Te4OkgsX35RkcPVDsJvTJwHDR2tUW0LsBAKejqLnb0I=;
        b=DL3CEuV9RgoDVN2jUqa5GtETFU2w+Tej24/biDvqJowNrGNBMav+gh6HcVY0xvgMgL
         e1JBylZUZ/155be/V0TUhdiI/QARNAXyrTdBnzETazQu+1aiwpZsaZsISvWSwailup8r
         wYk2wj7uWeUM+7oQYHeBiHgaCDpuOfOSSTFWRQ1QU6kHLsm+OCyQZ+VX61RX8Mokh2bP
         89jgs9enkTni4RQX3krDW7bwUfBjxfLGdBzdnhG6dI1jc1VTXtzSmJPYfwR3oxb2Ixj9
         B6vNgpjQDkkSXeatngG6otouanWUjbPmkrwKj6qxmOuFypOa19QCq1WvIXmYC1zKeF9U
         Q1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426294; x=1702031094;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te4OkgsX35RkcPVDsJvTJwHDR2tUW0LsBAKejqLnb0I=;
        b=hO2yzg0uTOw0k9rBGpykfBK/V1u+y8JOLzrEKBoTdzGAkDQFyV6gihifavt/sRUPS6
         oCEt0OI6ouh/xoSug3j7xDcHPr3DtrEZIWPDVQYXHLN1ehpnER6gYGQX0+untxFfOhE6
         GWy2l4DZGKVhf1Hseyxh678uZQhwJ+cTc8R4v4hbNEBN1LJXbkvl6keMGE9jH426f+zJ
         dAsLTS6+IxRQicRfanr5d5jeB5ps4RShvKAFCBjDlA2rE9lvUkr3Fiom0Acp5aZ2LGCR
         0DCsnEyd0Ep/TH96ndHmtAQ7AKp/HnvzZvqiggxhn/vhfzO7iPQX4iBersLaQ8ytEFY9
         cWUA==
X-Gm-Message-State: AOJu0Yw/VHbZa9WVnrh9DogQdBsPPtJ0c11mz0K2OFIWqetOcnaPyvyk
	86mFlKeggSykKyURc0FjezVFqozy/rhfrlCRdQ4+K2Cg
X-Google-Smtp-Source: AGHT+IEgSQnaGf3bWwJk96UEsYp7n+eszhdgKJ/4nE6BfcQ3MyMrhMz8TsuOqStuCKScrU97HoiRUg==
X-Received: by 2002:a17:906:5a93:b0:a19:592a:f55f with SMTP id l19-20020a1709065a9300b00a19592af55fmr599223ejq.50.1701426293876;
        Fri, 01 Dec 2023 02:24:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id h9-20020a1709062dc900b00a19d555755esm632159eji.117.2023.12.01.02.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:24:53 -0800 (PST)
Message-ID: <2a9f829f-185e-4b48-86e9-d7e9d82d176e@linaro.org>
Date: Fri, 1 Dec 2023 11:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] gitlab: build the correct microblaze target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231201093633.2551497-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QIz9l0+QHYIg

On 1/12/23 10:36, Alex Bennée wrote:
> We inadvertently built the LE target for BE tests.
> 
> Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado noise)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Oops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
