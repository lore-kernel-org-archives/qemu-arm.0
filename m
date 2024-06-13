Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp179071ejb;
        Thu, 13 Jun 2024 01:57:26 -0700 (PDT)
X-Received: by 2002:a7b:cc89:0:b0:421:494c:9e74 with SMTP id 5b1f17b1804b1-422864af2f9mr28509895e9.23.1718269046329;
        Thu, 13 Jun 2024 01:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718269046; cv=none;
        d=google.com; s=arc-20160816;
        b=A5VAKAGQvHZkWT0XjABl4itZg9y2aFmd15Xkv7xyebOkDEGkGeHaB3+kt/K6wIwpRa
         usfxL065QuGHio+qZEobklNGHUH2UkaoSNcmgQE7vOPKt1/Ov/sLzBVCKdqk9vxBeiTn
         6peJDLT3Lktcola16n8rrFY44+ppzCw+vxT0u7YsitEQ3i1LXgC1muOae4c7qECXu9rR
         8xIzBb40YH23awi+CPfXdi5jzCScrGd9VN2VbkeyJ3xDFLlQ3+jSp3yhpFZBKFNqSvxD
         0eQ0t7WCVDuw6Xr1wnos8HMiaohphvXlPn2dYVUnbjpVg1yca7ka4J6qvLrUlfDwfR9h
         no+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O/Oay0j96x/9xQhPy6qZtNnk5WwDamzkfYnPefMdxU4=;
        fh=FJIkP/+3Ckk1PbB2KCIe+48kzCVs2amv55NIo4A+Jj0=;
        b=y6dhoBHAVhn4UsMLbMsJm9hOASGWhsO6zF5PiVRkl5T9sNQFsVlFHKE1Z7VqZcut4v
         fP9doNQaWjZgaXpiTLU6ayoEIXIVaPS9o+vTU8ehgqV/RAdjgaRwopRt9pNbw3wvshcP
         ashKSxX1kqmaw+Tb94MLrjdcSVeylu1fVTUMNFER+94vpq7p6wr5G2ssOwFdIhBuj/Ng
         +eCc/TH2ochwSWqtD11RQAgEgWn3S+t2+SW+b0VkRQLPsSqYzKsUuekE5M/YtM4kpNaU
         g3awoKmSMN5+myU4w43swQCpClVTN8zfYkbFP9oaSsPF/cyieMCKXTHgdReeNQYEiLSh
         n0fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt4p4+FY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-422f5d33be4sor3205175e9.1.2024.06.13.01.57.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jun 2024 01:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt4p4+FY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718269045; x=1718873845; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/Oay0j96x/9xQhPy6qZtNnk5WwDamzkfYnPefMdxU4=;
        b=Bt4p4+FYx8NlvwGW0up4ZNWHb4jhCII/acmy4e9NQR9UiONRTySGreYQTrPGXRbp3L
         vgbIob6gYtv+6yZRTuClaY+/t2izDbgl1bYxYWynVBhWWkesbAuNM+WsbztZ8eYxwYvB
         yagLNrhy6h6A4ThkFnp3sBYdBPPLpGPM0nl4GYkkaP4uudWUq+ByIKiqUTpHFVRNufmS
         9nb0tN0SY4awO+X8uqaOQwm0UNL+auti7bMY1LqFUp2MZBTId/2vxOZ4f+m22T4b6kQW
         hkazOJ0SXFMHfK4pDsS2NlpKVdqMcITZJW8AB7zmIA5Xqa73RC8bdBRNpcP5IEuUkmB3
         MyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718269045; x=1718873845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/Oay0j96x/9xQhPy6qZtNnk5WwDamzkfYnPefMdxU4=;
        b=hRYsZRoeygxsNmrma3vsDpkjXpDJwHFgqBewjsnNU/DVW1/XawANjOfvEIdXHoK98k
         UWupWS2sbV8ccSICgKCvC/3hnc1IXYsRkT0UmdbdwbVhKH30cZKWO0//MaFDR5WrKyvg
         Xud9hpgq7NWTjH3NZac9FllSTQFRqEp2I6trW9R6TQrfLCqil4OGlkEOGvhAnSjmvwNZ
         Ji50C4JXIw2Qujny/JDk6dwi7TH0OwN2GqkgjxDbrcxjoTLdClyJ8qHDyjAxdSJYKy+n
         ATdqdn5eJ6DdfjH/h4TAkVZmdtnJu8auzrNriuiqOzp/cI+JyRZQMf4Vk5rVP4uXRDLJ
         1eFQ==
X-Gm-Message-State: AOJu0YyI7s6PHIJVbnsUJ/+WNmQ6L57NHObLvkIDH6TmCjn8TtP+uIXP
	wzTHJwrDshx0vAUsXdmBTp4hG8yACdAnjMQnxN8qrVQwtGGNzXIeCe/e3OyScLDKy/92XkE9vUU
	cJ5M=
X-Google-Smtp-Source: AGHT+IHqQKUydYMvnGx+8GuVXjDzbY5BbQSW9D4GkL9kXgAEi3BIQ6dHiOFa9P8ziL+HL52DDW4cpg==
X-Received: by 2002:a05:600c:310a:b0:422:5b78:1c8f with SMTP id 5b1f17b1804b1-422863a8b77mr33946525e9.8.1718269045561;
        Thu, 13 Jun 2024 01:57:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.148.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe8fb8sm53929895e9.11.2024.06.13.01.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 01:57:24 -0700 (PDT)
Message-ID: <c4d36875-c70d-4e2c-b3a8-c50459c9db0f@linaro.org>
Date: Thu, 13 Jun 2024 10:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] plugins: add time control API
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-9-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240612153508.1532940-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jwpj+ngF70Tc

On 12/6/24 17:35, Alex Bennée wrote:
> Expose the ability to control time through the plugin API. Only one
> plugin can control time so it has to request control when loaded.
> There are probably more corner cases to catch here.
> 
> From: Alex Bennée <alex.bennee@linaro.org>

Some of your patches include this dubious From: header, maybe strip?

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> [AJB: tweaked user-mode handling]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20240530220610.1245424-6-pierrick.bouvier@linaro.org>
> 
> ---
> plugins/next
>    - make qemu_plugin_update_ns a NOP in user-mode
> ---
>   include/qemu/qemu-plugin.h   | 25 +++++++++++++++++++++++++
>   plugins/api.c                | 35 +++++++++++++++++++++++++++++++++++
>   plugins/qemu-plugins.symbols |  2 ++
>   3 files changed, 62 insertions(+)
