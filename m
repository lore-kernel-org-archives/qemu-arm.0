Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1161943njm;
        Wed, 30 Apr 2025 11:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA0+IFVVHlLyArTaeL6dCpR/UN2WX/xr7sMMTMiB499Tr1bqdP1dSF5+XCfPj3wM+k4j6TEOfKSu75yg==@linaro.org
X-Received: by 2002:a05:6a00:6113:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-7404775ccaemr58677b3a.2.1746039039648;
        Wed, 30 Apr 2025 11:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746039039; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0NGIomld0QBdkHbb/3F1IbxPHS2YE8Se7pP9jPlsvr83y4ChiJY4lQjBDkf6L6Y9E
         zL918xg3KKB2QPvRGQJyTjaIMgu2RS8IZq5tVbAMoAtvI3LG6c/c3fBrV3Gfa7YGDyEy
         IhSBvCu0c+Gmx9htmCoiRhuxBgj7YBcpK5NefBhf2X460wwEZdyBTjikdWy8FHo3SgHb
         /WHf2EcD9EyeZqiaNcZLNLD4IGV2WvUN4DOzGcCSjwtrQ2Ln4EIDB6he7TjXY5evFbtC
         NZCoc7SEt6l9TypmQ3izc8HebKNmmr2qclQroKiUbggEZxSe3ehcuCx6WTJSEkG5EO0d
         lnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kxcQui2TsUuv+ajrRAy8NIbvBPz1PBp9QglH+YxsXIk=;
        fh=+gnWXmNfdH+VTlYySKrJ5z9fuT8Kqt5qivDhqZRZqj8=;
        b=kje3whlBzpkG+u90cr1owesA82RCdrM8HTa7oWRkTA2+YG7+UWDQP8tGxGAI6+4sCi
         XAMnSV2UVKkhrQgjet6k9c96hSxviyLqctRU33vRs10v7uXYaWIja0PFdYba9HMMPLL/
         EmteucaDzdEjyuaAzEv5iojG4A0Ma18vDI7PW5tNEqf6Wwz67tt03OuMctaZKu6FcxMv
         Gh65/mhRxemYIf2zygrXlKHTe9VEQMk9Fa0aSR2k4hZpfmED5i9+pRDDS4SWSih08Lqb
         cmsr0wYvIBdwWNMdqq+UuswQGolcak8GA534+SJ94hxRMpsMu+YomoYcA93mBr9xuamJ
         ldLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLMDIkG2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e25a3bba9sor11519221b3a.8.2025.04.30.11.50.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLMDIkG2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746039039; x=1746643839; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxcQui2TsUuv+ajrRAy8NIbvBPz1PBp9QglH+YxsXIk=;
        b=PLMDIkG2+Z7BWRPN9/mkSGDbYmZ56L01u6OTks6CBj6nISmyYuaf9UeyWvfI63JgDb
         24srEyFrp/8WcAKx+tMfXsZpdDxLDU8PkJlbXffcZDrOygCxBvV0pU9JKDnLZm48wmn/
         NWdh8c7qcBgsRbqRfodvYPGOBwZ8L63y3yN2A2O6rhirUN3MisXTOumIZYTkRqUTj4sl
         KsAMefbhuOYaBd8Uk8ertNoHG8Isn6zkwK3XEd+8HzXcoeONAitvXpWkdbpLt0fJcxeL
         o9Hc6/e+RErHsX+/HDhzUzLkxcV8QxP6/uFcZdhV6ljCthMQQ33uv90GxzGxJqzudHZn
         MQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039039; x=1746643839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxcQui2TsUuv+ajrRAy8NIbvBPz1PBp9QglH+YxsXIk=;
        b=XeJm7+R6x0vif5GW3TjY9wDJYBZQHW7ef4kbKkYoANupJPds593I0LQyMOjSfBedwn
         Z5g5TBgXzwMyW9O0LIbzMMpFU9+b2TYb7wi7wU7+RFsD9HrNk5Svc3DgZUtLqA5HICuF
         dtbxwYQLJ0wEsN0whB124sVLVl5hzHZ0fX1FHPEvLsU/SWled67+/M3ZDC2LHaglb7Xg
         hkVKCzAxOGyr4PCEq0ANogKmihW3CTASsn8nxRblLYAweFIEDQvXITLsFgP4hhjrbFzV
         V+oUK1Zso6puXVdsx/HpEuMa+mckTqcUBHz7WwzBpK//VRmvg6lQcY87V3N3iC9nTj7C
         CO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMlvU9diYh8nf1wXjQktZ7T92JWYA4CTkcoB5VsGaA8kBkQ511Jjz/ATGGLxI6UU0kSpbExw5WjPzUSQ==@linaro.org
X-Gm-Message-State: AOJu0YxtLvZFe1EO7+WSlqu7fsZ2YZTx4+VdkWDghRbdK4cn6kzarn03
	dPEsA+86ABxDmmKl3Glmutr95Vr1IjWy4Owg2EGPfKy2fisCF7WITAAUtZVBPN/M6g==
X-Gm-Gg: ASbGncvWxYkF6QEpMge0139qOK1WlHQYMfTmng7uoWwxEomM+hrwoWv/bnPl5+wuUMY
	KsoYMvSEovUOkxpYvmdDT+KGfJIuDKNhe0XpHUESUhomn0thlznMXCSBFV4QRCF8lRa6/MbcLs0
	d0tM4k27GPa1a1OjIgLBLtdV+2W6+Ei6p6pE6P9e3uXKnw0GEMbrYAo+VOikfEjBx1x6FGk8jP7
	x/I/OflHSJp9KyFJ4eid+rYu0vCe8NKZJn1evV5LvcSDHc6iD765ES/7G2GfA00+P18tQJJRoT2
	zmACG2k1tygTF6lx2bFJ4+ebB14M7v6yCg+xBM+7hubHCvfnylax0KLv4JTLiEvxZQ8yJNDgyP9
	Fy8KoxsU=
X-Google-Smtp-Source: AGHT+IHG+YHTZIvzJHIaptMbcm9aiLNqhmOhTm+WK5TjZVos2qoZOf+1YY8G4Z8bsdWit9hM/8svoQ==
X-Received: by 2002:a05:6a00:3a09:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-7404777ecd5mr85495b3a.8.1746039039225;
        Wed, 30 Apr 2025 11:50:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5bde6sm2012103b3a.127.2025.04.30.11.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:50:38 -0700 (PDT)
Message-ID: <e77b5c7d-5f6b-46e8-ad68-207ae87a07dc@linaro.org>
Date: Wed, 30 Apr 2025 11:50:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] target/arm/cpu: compile file twice (user,
 system) only
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: a1cT+RxirQfc

On 4/30/25 07:58, Pierrick Bouvier wrote:
> +arm_common_system_ss.add(files('cpu.c'), capstone)

I wonder if we should inherit these dependencies from common_ss or system_ss?


r~
