Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3845451eje;
        Fri, 14 Jul 2023 00:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:428e:b0:12e:4174:6a4d with SMTP id o14-20020a056a20428e00b0012e41746a4dmr2725511pzj.10.1689318116097;
        Fri, 14 Jul 2023 00:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689318116; cv=none;
        d=google.com; s=arc-20160816;
        b=nCC9xKfydTncUY6wyhHojd8vFUKvAa8dCHfkTdj9/L9RKWjTmIRK27uqWOAZFSeHXR
         WuL23RnxRg/852a4xh7ZkN44p9vhe2N7W4mIY23ULRO7JWMGoQxD2qbY/pqtYPwUeGm9
         pEFhSwZJp8wSOzo6PmxMcbaUG21uUViGZAo/Tm/C0pBNYg7894z6S+1GXL0cx/lwz6QR
         YTkkYvx6AFMN54f8T6Ufbt+SY51UanK82hNDzUOuJsQXES5msaCTYgh+y4TCUfbT1fsR
         6unZLEM9mQW8IK8QdT71ZXash+oEpLUaSJ637Y8Ad2yOY3nhVXgftpG7L6l4LUSznbCE
         8YrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ho68VsIwtZsMIxXYHYn8lsA1a2VK2kWlvPkM9CTUNZA=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=wwhCk7522b+Lnjn+EearTkkOu95LzOecd4Ti0uYZq1c4VnDxt9A/aChtjtcTWjD9+4
         AXhEjwDh1039Zc5wK4zI7NJracRV8WfQVPAaKpnyzbs2bTYCeJChlZwW1gIChsQoGYhU
         YxSQoZvO9jHV9YUASBKGDOXjEXG2nT19BzmyiivljafR4Pr494wUUkRf1H/w+v/PCcpd
         exlz/VWT5vc1r8dM3Amu5YJ6mqW3fH4E/g51p1svYLWAn5AZ3DBy4Hb9jr4xWRERQJqU
         omIaBt+z/0TQlgt0fqX9RwFU7eDl+MuhBnKDXazgFl/PSTbkuwNpwTaLEzJVjA7ZvZLe
         Mguw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBocyXUk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c7-20020a655a87000000b0053faf462e54sor252339pgt.3.2023.07.14.00.01.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jul 2023 00:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bBocyXUk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318115; x=1691910115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ho68VsIwtZsMIxXYHYn8lsA1a2VK2kWlvPkM9CTUNZA=;
        b=bBocyXUkcFEeB8EKfN0S24JO0xAJBDgjtiOzAg5ivkjKDUVc4q0JVELcFpr+dko6HQ
         gryK9Yk0kNY2Yf9n28R/vJArXVZ+ii6lbE6W2+fesZ9cyMHYgrNkWDZNZStDfJCsU6kk
         AgeyjA9IrM5g5PfzpAh75vej6Q0sM1qenj9Vh+aiTImETRb9ejrWURsp7Zq+hVJ1w5M+
         puTtIbcdVHwLv/fw8C5wKicJ74FTIYnyzP8RJvdqR8OyFW26na4t7gl6UYKohu09IqG/
         eKgfFvW4JuzQCK1GS8PqnRsojiPavWRPDX87X1zXuLm0PLdKph8XsRY6Qzgoh28m/3Kc
         nkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318115; x=1691910115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho68VsIwtZsMIxXYHYn8lsA1a2VK2kWlvPkM9CTUNZA=;
        b=Urw+voNjvUfdWDTDtHkuXJdqUlBDGesBHbC+k7H0Ua+iYmoYip0PtpR7PU+7Oc1mPM
         LavXQa4wpkuBLtANUmk7tOpe7D35M16JSSL2pLUJ1FluHUZAV6UWtgCOEo87tkyDDHAI
         rDXPzFBy/WwO/zrRbToHv2q/rUjZhXraVDB+gwk0PreVNC0pVgR6mY5W8PbOoM4EYeC2
         dYr9xsbLv4Tx37n5HurBPsqbFI86ih8XlFegHb/M7RKHuxX2vcm/brVMYYeVs4oCXHXg
         5Ba6VGmf/zANNYFCyfnJOIhJPLy5z46qgtc0g5a83TRDoIiRNPlwWPBHtztOwVLm9rRK
         o8ww==
X-Gm-Message-State: ABy/qLb+2yBM7FF96bFuoUViQCbzr9Vsuy0iys9+0wvFq/9LZgVCqFWi
	Gb0mCCCoizGLsYZOMcxXKHlnRYA3
X-Google-Smtp-Source: APBJJlGRy9YMW4JuO5DESUHWTNrkmog/kxJ7SGKItfZlNaeGghm+58BpGAEQe4AuebYzzW4gUiOSbQ==
X-Received: by 2002:a17:902:f548:b0:1b7:de50:7d9c with SMTP id h8-20020a170902f54800b001b7de507d9cmr2698487plf.15.1689318115570;
        Fri, 14 Jul 2023 00:01:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id je11-20020a170903264b00b001b85a56597bsm7014340plb.185.2023.07.14.00.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:01:55 -0700 (PDT)
Message-ID: <b40da0c9-a629-136c-fad8-a8e1b082f236@linaro.org>
Date: Fri, 14 Jul 2023 08:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/11] hw/char/pl011: Warn when using disabled
 transmitter
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Gg3Jaz+9nmA0

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> We shouldn't transmit characters when the full UART or its
> transmitter is disabled. However we don't want to break the
> possibly incomplete "my first bare metal assembly program"s,
> so we choose to simply display a warning when this occurs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/char/pl011.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
