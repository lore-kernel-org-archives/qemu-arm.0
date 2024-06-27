Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp182122njb;
        Thu, 27 Jun 2024 04:08:36 -0700 (PDT)
X-Received: by 2002:a2e:a442:0:b0:2ec:5019:8fa4 with SMTP id 38308e7fff4ca-2ec7278a341mr44327451fa.49.1719486516242;
        Thu, 27 Jun 2024 04:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719486516; cv=none;
        d=google.com; s=arc-20160816;
        b=YkaoU0MsBYdnR4U4A6CmllSdLN+TDpMgwsdJShuwe6BDm/HJM5MxFY5TRg7dNcmMYb
         0EKAclYCP5w4VQ+Cs3JmUpdUEdlJ4G+btMiFlcwAv/FzMRziy0QacV1O5exSX0RhZUhj
         rQqA3lZcMMYUZ3frIB1JCthK57mMQpDag3xES72gYi6pTJLzSD7o+Etxf3MBYodpD/A+
         njnR3cbYjD/t58qlihc6cKVFZyghS50qT2R8iKza56n4bNp9DN+nqJZ6AK3WlITGQxv9
         bSoqRAQJPimItNIuzm6v/9uGUlr9HCI45GiYN20XnTy8TWgOgUQlWyE+VYQLoffV6swo
         2bBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o2XCYxT40DbL9y2Narcb3mT+cwq7XXW09HIX9xIHGkM=;
        fh=CJZyn28tRklxSuGppnCCvG/9EUyJQSpmR+9DeKrBjrA=;
        b=O7HDtMgJio9ojYjciAQjs9X/1qxTzKeXxWzEq+IZq4nxqLA0y6LVEyGrLZtrRI6mbP
         U+W7IXrYDNdC4Ge5KBfyrOdbb5N1bEiIyK4HCwefI8hR/aualkprgsrByADtzBbdjjL5
         y3RYbN8i3NJPDUBBQ94hRdZI7oFeXCz1R5HkvQ8Wsq8yKm/0WkbSWA4t/yUnAv4y0Pvh
         7DkJM54HuFHEJPgrvWRt7BLeax0YIkzDZGWhOuQAU5zGIcYidbQyQQO8EsWcgBMikRKT
         SJ/j0tgee3JQVlyKk1DNNldH5+4F8sJDLdKF9XfjTLpAKZ39fKLppi8i7qcYBPZSM4pu
         a5iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVrIVskC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee4a4eb86csor2894351fa.12.2024.06.27.04.08.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 04:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVrIVskC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719486515; x=1720091315; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2XCYxT40DbL9y2Narcb3mT+cwq7XXW09HIX9xIHGkM=;
        b=WVrIVskCGt+dGVvjGD/9x3jY1f29GU5XMlIyzHUhGh0m8p0XtQPXVrL/NdTMjVE8JZ
         4XBE8X4ub9Tr3fgiAnzBLDMzunh9IsZ4YMuy3I0ydWPpWSflfLDnhT1MPd9M9LtkRLoS
         r4WTyK2ZWbLPyjjA+k+csGpT2eaJIlEK1rNv+HlY2S6NpFuR1yIRVLe8W3O8WdC2tNMG
         lxl3pvzQXs1fU9NNyFBq9Rf8U+tZC2TjRUND5oZ94zjB71FcVm6goH5yPk+/EiR67ufi
         9lGFiAKMWZUvzRblywUtqDn22fWXtpFQ8czV8uN4Lym8+V6T4n5GEZppFn9eJRt/SGsu
         EuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486515; x=1720091315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2XCYxT40DbL9y2Narcb3mT+cwq7XXW09HIX9xIHGkM=;
        b=kn6j/GxwKtEpY7jfqw3sOErkNXE5v4wVf5/IP0inNBLJQtpSd0FJEWUf7UtubgEiJW
         9wsWekvr020Ua2nVE0Dxrr7NmjJ/JCL9wxataqaRAM4/pgDuLAhbzNKX+SuQlHwjEV/o
         Or7V1Ty8f3DtQCZ5HbkR18srh0gpj6YdhgbJSjDrAqC0lwLpDpmjCsS9MwelZ7PSrthW
         Uz2HFrZlDfuYbVBr+CXIu6n41ZdvXyBjGbIIomgbdd0NPZqJ5cIyASl5Lpv6xxniwm6/
         V+cn5Fy1G5a/7ARTEOv8DSwWHpL2+p5lCEGp1FcEN3BQGSZnKG5t0Kx2jpkj/z4jb0EC
         VTkQ==
X-Gm-Message-State: AOJu0YwefwEe0PV3ZWTdp5yI0GSVb51wFDAnYXyXfB/YJCLC8vWi/wG7
	49q5G1+hdCVE9+1tpNO4Arm1PXl81NekgBm3geeF6AU1P+4fVGzKbsj0CXx8/bsbWKGgLXYx9r/
	8lGQTWA==
X-Google-Smtp-Source: AGHT+IFcbK8snw1UpZCkkK/fbYRXItddDuleNKKncMy49sWuS783EwY8WSMh1pgnqOSBF3yKu88L8A==
X-Received: by 2002:a2e:a442:0:b0:2ec:5019:8fa4 with SMTP id 38308e7fff4ca-2ec7278a341mr44327031fa.49.1719486514989;
        Thu, 27 Jun 2024 04:08:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.236.175] (72.red-95-127-32.staticip.rima-tde.net. [95.127.32.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245da9sm61189205e9.1.2024.06.27.04.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 04:08:34 -0700 (PDT)
Message-ID: <43547a69-1caa-474b-96b9-e76b65100f9b@linaro.org>
Date: Thu, 27 Jun 2024 13:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] sysemu: generalise qtest_warp_clock as
 qemu_clock_advance_virtual_time
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Nicholas Piggin <npiggin@gmail.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-7-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620152220.2192768-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WMKbM6gYFcZ7

On 20/6/24 17:22, Alex Bennée wrote:
> Move the key functionality of moving time forward into the clock
> sub-system itself. This will allow us to plumb in time control into
> plugins.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20240530220610.1245424-4-pierrick.bouvier@linaro.org>
> 
> --

@Pierrick:

Use 3 '-' if you want the changelog to be stripped:

---

> v2
>    - use target_ns in docs and signature
> ---
>   include/qemu/timer.h | 15 +++++++++++++++
>   system/qtest.c       | 25 +++----------------------
>   util/qemu-timer.c    | 26 ++++++++++++++++++++++++++
>   3 files changed, 44 insertions(+), 22 deletions(-)
