Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1273337njc;
        Mon, 30 Sep 2024 07:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIgreztQy2aBJatY0AN4VTSL0IgYqE6XxwZ1+9BPEyyXK0asVxCCJQSGlN5YiVg2pn0acIKwmwFY/GwA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/3Lk4Hj+1UYv55hGRvoN792j8Wx1T/65ck9g9GrS/DlqgFt4EmtQsT85hD/GNRK1N4d6X
X-Received: by 2002:a25:86d0:0:b0:e26:b79:87c with SMTP id 3f1490d57ef6-e260b79096cmr5662774276.50.1727706527882;
        Mon, 30 Sep 2024 07:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727706527; cv=none;
        d=google.com; s=arc-20240605;
        b=KNzGuowVuaUCvWbEioHIV/qP/me+REfpV2epWbf6u0y2U4iHayeaCXAjdwrZjKetFs
         pyIjfW5bA1P1eiBEax+2X08SDOMx9H1RG5b1quYq3CzZBUG7a/pjMZJpUsleXNOziMQR
         gH4m30BIstaPBogB7YkrRbRzHoGtq4/41wcIVOYTBLUmOK0HOcpD/YJFFnEdFgVKiW28
         1YNC7ZX5q5lsZFqY7OAshuW6U4nnSjNPtchmAS+fq1biP0wqK60WMgU7ns5jAQXqcT3I
         dqJUGUnqQE6i/cLMMzjaKWm70iFxqh2KS1cCa0AST/BdD0qDt13b+3l2pZy3ebwkqHJl
         b3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=uKCv+X8hPvYdRL8L3yV9tY6ssaG3u+jqmqCtsE4SEQc=;
        fh=usTRMAIT4aBv8um2mKuOlvp42fv6eOOkXF3dOqbVrZg=;
        b=A5jo59Wp07NfgQScPvh/FaQSu7lbSBcw1civL5m5le/52/xndERKhpTbrb2ia6/zi3
         kg/PxuuyMsSTA3y6R2f6CxRBaScqB97fdEH+3crS5oHIjrU71l3kf1751GTfF6DES6oS
         6AedECqnVKI6bzEZrBA0ycsgCmGp4QVgIK3w34P8MyHVxasb8R/11zViDuEhXxamw15x
         jRXQ3o30hF1TwTzy1mYZCI+hW1vEmOQT2EEPlHx2lCOytgGaY+4k3NDJIqtYIIu8txbJ
         PhF3Lt9VjlLzNmjRsn4kuKO7tJ/j2IlVakNgbHMNNRq2XrVm8WmcdB9meTaISBsWC1VL
         w23w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pbohz6vX;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e25e6e30640si5394010276.370.2024.09.30.07.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pbohz6vX;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727706527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uKCv+X8hPvYdRL8L3yV9tY6ssaG3u+jqmqCtsE4SEQc=;
	b=Pbohz6vXDzcYDFTbTK39P1V4ZYRVqmlBfMKbBwiZbYs4CVtk0sIV4ey8L9Ez5HJnf4lq6N
	WwTIcyclro07Y6HJJJC5bwubEyGuISgkmU01+Gwopqwutp3U6Zwmddi8yBmxnhqPWw7ls2
	8D25qfE63TRuaqS+lNR9woG+CkPJm1Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421--ti75i_NNKSNrktGps5A4g-1; Mon, 30 Sep 2024 10:28:44 -0400
X-MC-Unique: -ti75i_NNKSNrktGps5A4g-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37cd18bd0d6so1317564f8f.0
        for <alex.bennee@linaro.org>; Mon, 30 Sep 2024 07:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706523; x=1728311323;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKCv+X8hPvYdRL8L3yV9tY6ssaG3u+jqmqCtsE4SEQc=;
        b=wBppRUN2VfVBDo1zjIZGN8bixZbJb8OrGl1QPMpDU1+oHQLpok9oJR3n8HRhSReRlH
         IGHmUD7nPaJ0pyxKXULo9f3Ds/oJIlYK3dIUCdCOMUKka9WWa2IvKSTaqjStouBmWTUm
         MIugZXjJhu879A8FXCGsOW0wG5CmC7d8RiSrYapADkQWCRiUxH+a+BWJ7BcXMVx0GNCo
         VBIaYuTOD3dOk/UEUGQvVBkux/SaeeO1zmLDIbrz6Wr+9ypNHXY7Vr4z9Se1S2g4npQU
         6QH4x1gpiDQpS+SqE0blLShuAdMPoe3NyNmqR/JDyanyTrEgj3sL6fpvaJ3aUCns5/QD
         Cpnw==
X-Forwarded-Encrypted: i=1; AJvYcCXUf58O/dcIz4X1R2IaLAsV5AjW/lpTG+69OeOJMTHqMxvjIXK1DRUvXrCWkTGLbjPpVRcmvmuMsRkblw==@linaro.org
X-Gm-Message-State: AOJu0YwlxC3bZIjjfI5XwyUrspVHz16fLvmT0phFs9PKQue4kssm61I0
	zSKc7iZTK4jZ4TLqORVqAUGjJtAKZ/OdYfcIUgj6M00jdBqVS1L3eM/y4Xg216mNGI3wGgwu/Ic
	XtWbEokVWMEbl1uwQjeYl1kCphB+r5lr8m8FRH+cfHD/ZBZq5yOwyrQ==
X-Received: by 2002:adf:e885:0:b0:37c:c5c4:627 with SMTP id ffacd0b85a97d-37cd5a692ecmr7056668f8f.5.1727706522927;
        Mon, 30 Sep 2024 07:28:42 -0700 (PDT)
X-Received: by 2002:adf:e885:0:b0:37c:c5c4:627 with SMTP id ffacd0b85a97d-37cd5a692ecmr7056644f8f.5.1727706522460;
        Mon, 30 Sep 2024 07:28:42 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-176.web.vodafone.de. [109.42.48.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fa48sm9128437f8f.66.2024.09.30.07.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:28:42 -0700 (PDT)
Message-ID: <dd2bc14f-c690-4c82-a915-6b39ed4c5b40@redhat.com>
Date: Mon, 30 Sep 2024 16:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] hw/xtensa/xtfpga: Remove TARGET_BIG_ENDIAN
 #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-8-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240930073450.33195-8-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wU2zQOxhVEpx

On 30/09/2024 09.34, Philippe Mathieu-Daudé wrote:
> Move code evaluation from preprocessor to compiler so
> both if() ladders are processed. Mostly style change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xtensa/xtfpga.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
