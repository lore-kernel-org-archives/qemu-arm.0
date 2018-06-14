Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2487345wrq;
        Thu, 14 Jun 2018 13:23:07 -0700 (PDT)
X-Received: by 2002:a63:6ac5:: with SMTP id f188-v6mr3508718pgc.195.1529007786952;
        Thu, 14 Jun 2018 13:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529007786; cv=none;
        d=google.com; s=arc-20160816;
        b=kWhM2LOs+VyXGBBuwzWAye2HQieRJYPxYfm2ewgJ1AnzTdbFckptqCzX1yDj2H7+lS
         rO2prGq4blKprs5Yywk8AfinUTdyNDDfHpO5XYETV6gixL4NipFWewOs6P5+1n4WqEUD
         ALok/YeKZu/YqnQCfv4sjsE/h/T7bxitZqatj/O4u+3DhjXwf0Ois5x+wDr0GBULuDjs
         QJBo/sOk5utvvGx7QKe5CCM4svFkOiTRCx2ODjtu1N5x0oCa9Dwdc0+jfnwFWbOAKPet
         eE3ps3rpxe4Z8AZTiyTQDI1auBDXrXzKrjhnDhP3fbtqR68aEfNn4DmE6OZ4cNrZImog
         AIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=/YB6whVrDpWpDyRaitnZF9W6bkHKqwWFip4ZJDCMk+I=;
        b=Vgu8Wc3ekMj7sW8I1l+GweHsTYqCdOSPLLAnFISY77CUl6qmf/g0QumUO+GFkV1Wa1
         u8FqdfQabimjB0pc5b97nYLMqGR8OkDHlsg1luykZsJiK38TFtZNMvpicJuOgvAEzMih
         awxCQeRIwnFe/5qhz7pFmJjQBsKwo0LxGxlP4d9oZ1vWBMGa8Us669JtRhit7P9pwh0t
         z7Iqhp+evUUAQ2CDfJIhYxdsGrM0R+zl1B/1ksd74fNHQAgF2tuyxyvAJuAQZ7A0satm
         gGqmrXXG0tltqekC3vgEFbEv8Y/v+AeRlHWyP9BxaRG64LaFPtCbTz6KXtFX3UTexhE2
         Hl2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PpAaKi1l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s2-v6sor1365042pgf.426.2018.06.14.13.23.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PpAaKi1l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/YB6whVrDpWpDyRaitnZF9W6bkHKqwWFip4ZJDCMk+I=;
        b=PpAaKi1lApdYQ2XWKrRa+3kAsFQB5SfrKHybgouF1KD3SO7H+uXUO5raKAPVJqwk+z
         0XWy6Puo25LWRpLcYmMmwfOiD9H+8PjkMyUaZH6wcK5q6KJeGMFTopfQEc/v5uLSVfo+
         4UZ1LGAJPikCmQcTofV5QrAs8TmYOSQBlBsJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/YB6whVrDpWpDyRaitnZF9W6bkHKqwWFip4ZJDCMk+I=;
        b=TZywFzdweRWy3vtOtCiu6qOdSlz9lWYuQhjb92mZ7nXmsv58Fohuupi+wwKZyeUJNZ
         wODpAzZS9ggIbXp5DCoun2qHDZNTemWRC5DsiVgRIKeXoPmnrm89PxNYE69k3KHUm1/U
         UPHs3MD8jvjtpsp1i/Jfc/puUfIXQmiU+D2p9DpgXqHV62ORPqcqZ/jBT9aBwM0ZtAiH
         iVs9GWZoVCNSNilTdZ+Ympjg5e0aeWHhOHZqPvv3O78HS04ghWwf8qpoooDseFBfV290
         AcTlHntUcCspfjT2A6k2eE6gl0IAvA0+oahdkzFUo3GwqurzYL5fx9ro3qa4HfUs+k5J
         E8lA==
X-Gm-Message-State: APt69E2piaew5kedQA57l+0+tCJbAeJu94zLmh+NU1nS5MfFw4PTfYdm
	U9tzsOA/8s9DYuHHgAYJP62lKcUc
X-Google-Smtp-Source: ADUXVKKcskMjIifJ3z30EAJwctkk/XEvGutnyg/W0nnEJ8eaPSPuzEADUmitN5IQq11ryfUCtp9bGQ==
X-Received: by 2002:a65:5c89:: with SMTP id a9-v6mr3492022pgt.51.1529007786553;
        Thu, 14 Jun 2018 13:23:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id m12-v6sm7439334pgp.88.2018.06.14.13.23.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:23:05 -0700 (PDT)
Subject: Re: [RISU PATCH v3 15/22] risu_reginfo_aarch64: drop stray ;
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <66a8689c-5822-3eb2-9798-33a6baa4a2b6@linaro.org>
Date: Thu, 14 Jun 2018 10:23:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9aMHScFTxVjz

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
