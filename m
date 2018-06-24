Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3179424wrq;
        Sun, 24 Jun 2018 15:49:41 -0700 (PDT)
X-Received: by 2002:a17:902:4c88:: with SMTP id b8-v6mr9676968ple.285.1529880581686;
        Sun, 24 Jun 2018 15:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529880581; cv=none;
        d=google.com; s=arc-20160816;
        b=UKyYqLtQQu5kzpRyOKY4q6tsbQnF2/Y7Ih1mMjvjdUplMj2dbHYAIFKVZBNIGcEaCx
         wW/4E6uueVd1pTlNAFvh2CRIzse4CQwxjLnOR6UwdtLHlZMrGHQAgFSdltj3IKihnVDL
         HuXLfPt/DHR5RsLDd3TqVtwZ1ufbIaZkARAyWdVibyjtpqSpL3ZWtkyWrPlRZXmG22WZ
         B90aFf3BQNsK44vT+LMQsASHBWoT8IoHLfSYMTXaR18c6FF4utroklqwMDr7AcnPSVjD
         lyC3WeHip8aslPRElO//OWq8wtUoyP4HO0v9GnDMr7JnBrczXt5kibaTP+OeTHjrxxtx
         xq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=vKaiYHS05nMSzw0zkXEeGDGhZaQtUeHwkxFBRGWuUig=;
        b=yJuAAbJtCddOrLIWnduBG28rd4drMewA4FlyFMa5D0LrlxUnlKMwbwmXLEByfCBHPH
         LnmOG9aaHgwKpJLzgJ0P1XrzohzzIQN7/zwaLiWdijNLMlKLk3VoAsFrbZXFwD3ObpMa
         0Hv7qE5Ca4+eYyVAX3kxvq5bY/uppYfhzff22TMR+0ETFMEm15KgfPNQp9nhfU1hk8sz
         h3h7igHbql+3Qk0YnvISFzchRygL9MkbUsuC5zrlPSZxY6++giaOiJByUYTaI8pdNQcJ
         ZeOzXohGzXp5eQzf6pG9QyAOqgK2F5fSdI1UsRklJfB1jjULnLQaAVBmC4suelpEEOot
         j3aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MofyWsJe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f4-v6sor2542369pgc.425.2018.06.24.15.49.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 15:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MofyWsJe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vKaiYHS05nMSzw0zkXEeGDGhZaQtUeHwkxFBRGWuUig=;
        b=MofyWsJeCCfqpnMuRe6kDfjpx3CQOFtfxr8jEJxVgu+835l5mK+7CXnsQmQz9wHmTC
         uDAtkMRsmnNnu557ITgcMcTqLsunmNwBm+Rw4Eq30WZM61TbSMjmA3bVxFSMee7ZSnQg
         GGfmsWHC0ptTz1iRHxFNGrbNHd6xDQuGK1vZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vKaiYHS05nMSzw0zkXEeGDGhZaQtUeHwkxFBRGWuUig=;
        b=OI4234+iKzYyq3hxNvmtk41AgCDA7eV4I4yHgXnPylMi/s418EBLNr9HxcJDItbDap
         BDfRjKwPigpqgzLcOwsot54fZlaESL7bWvpVffxJNo/3Tk1D/grR8OkCXElRfIUpOtib
         BG6KD0xVhWQ2/TvTx81499uCTx8YIiJTIlMkNLEritVOLjWN9nqsvhg1txgh2cJ7DHAI
         l+ItoCidYKoXjsu9+E2cBNZKwtj4cnDAxu5Zie1fZhtH95yUcx8qmnIfXj8GkhVhg52W
         uciqAV5VuxGrtuiKfJ0mXc3rGK3RMWNjQVR+76zwyCMEvXpwXyvKccaMtbhDqmSCwnX4
         mDww==
X-Gm-Message-State: APt69E3x+UG+yBGfgI7S/ZPUKdUiLxtHlTjR75gvyExM+hr+8RmyJl1n
	2GTpL5Lf4cQ9A6qhDU3H/an3uAgD4P4Ojw==
X-Google-Smtp-Source: ADUXVKLUx7fQpz7qjBb4iy2/LqJZQOBo06y5TLK2ZaYhJavSAMpYoGExI8O13fCKcJNWWCjcwcqSPg==
X-Received: by 2002:a63:a44a:: with SMTP id c10-v6mr8455010pgp.198.1529880581292;
        Sun, 24 Jun 2018 15:49:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id q86-v6sm8195022pfa.157.2018.06.24.15.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 15:49:40 -0700 (PDT)
Subject: Re: [RISU PATCH v4 10/22] risugen: add reg_plus_imm_pl and
 reg_plus_imm_vl address helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c0f433b6-b3ac-7554-2497-0ceb305b9eed@linaro.org>
Date: Sun, 24 Jun 2018 15:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0XR9WwC+diry

On 06/22/2018 07:11 AM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risugen_arm.pm | 126 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


r~
