Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1898476ejt;
        Tue, 28 Nov 2023 06:00:32 -0800 (PST)
X-Received: by 2002:a05:6871:410b:b0:1fa:1d12:d1df with SMTP id la11-20020a056871410b00b001fa1d12d1dfmr5887470oab.19.1701180032573;
        Tue, 28 Nov 2023 06:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180032; cv=none;
        d=google.com; s=arc-20160816;
        b=v8Qg3QuLqZ5GeR0gDJEz2EsjYMnotJ3lQJDNdc9RLWLwNTMuxtbjHxNw+L5KEKRfvn
         /PZoSkHxl9N6LisWtsEJJhqlXajCAvydRLFE+8wZB54wz4h7OQ2hi8OsXLAM3S1hAze6
         OdCxNyd2Pvs4KoLhuhCMVlxL3/XaSQ/9NF43I8TUoVQEV+oD94EdjuGPVXCH9fRIdZmA
         l69WrNpV17FxeekSyGA/2z/zK01PdNMb4tV9JBu16fN0htRfm6XvcBaxufEx6ymsSkzF
         xafJI//BfUWuaPoGaKVath3YRNlKEMC8Zaql88oZ3qnUhIWKwpgY8hXnFEeCfEK5Zm3s
         tQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NdAXHix7hNPYBXgjxbxBcDX5MGQGoqSrmEIfGMEy6Dk=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=g2tYeUPWnTNzxROCJT02il/gn+Kh1K1k2mHoHiUvumH3cPcJhlaJKrXnp44D3mUTkX
         H/T/di2wLEeTQUiBMRyv42EeJK0FC3zXa7x/geC8Qt4Bhany6qMLVPs8HANg+N8xDeTH
         AKw7/nbw6nL5AgNNOCMqD57l0SpG9DsY3IOwH33HDMybujBtxyZrH+MWnUCPwX7TDFeX
         yBPJkG9kUT3CMT/oe2eZlFPrgNJn+X4Veq6I8bf9bJ8R48GTH86jnHTU2U3rZUubGrvX
         WZvEAwBgE8T3mnXTB6a/cDy9QdO+6ooEyU5Q5PXxF9ZzNXzmlPoeatUsD/HiGijFLfT/
         rCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvuQasfv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x8-20020a9d6288000000b006cd09b59f3csor3285477otk.2.2023.11.28.06.00.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xvuQasfv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180032; x=1701784832; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdAXHix7hNPYBXgjxbxBcDX5MGQGoqSrmEIfGMEy6Dk=;
        b=xvuQasfvIoNoyYgyKcMfUnQJ10XLp8VbYhXso5a134aJVztbaKehmBwISsdky6voc6
         w5nAFRHembQ1eVI8I7/A92H/ZmLgKWRHs0pKgEHzms2sVxN9yfYSAN1nsPXNq1KRieji
         PfSndcCP2IDc3C/r82a99Kc3IWLRRZGgGTMf5xBMu7d9y+NIub/tL84GYGR//fhPzuQs
         y9Df+yLTfp8LDEkkXoxRyaenSbRs37FkxXG/cmQmGzFXgbSb/rpNMblJhpe80z6grE4u
         9QOJEUeN2oS9iH5ArvFxw9i7dPuvgSNqxqhKGHT5Sy+rG5RIYom9qp62fm4VEZX2dnRx
         xOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180032; x=1701784832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdAXHix7hNPYBXgjxbxBcDX5MGQGoqSrmEIfGMEy6Dk=;
        b=WRfp9j2135NOHZEzDIqFasEyv/UZ2rwL+OG/RApvDivF518aV5G0/kVoJdeXvY4eeC
         1uSnaObtA7+9KFF3D/kF78cnqTk9wL/VU08qwoFELyRkX6EecuInUEMoQJ88TFbAepTn
         30oCTWNiK9eDPtiEMdRBv2aFUcXUG3FlNfUW7VkR7zVyHn5D5ANJkUCpxtdia2lEVD72
         456o8oLUzP3lxslX/LghwJVPMokZyH08YrmibZWnv1uIYShyJ030BUdLqLxoW/VAJF40
         TfpXErg+1GSly8JEw7TQ9Avtc5JiUCsPiRzltjBT9/LMnQVw8e0wixwsIZr6GNVgp6P5
         PPKQ==
X-Gm-Message-State: AOJu0Yz4EAxZaRJchJwqa4v8NwGtHZGxjGpdyopwSbTw223pZz1n10pD
	5H8OziqSF0VtOgTXN7u05Daoishf
X-Google-Smtp-Source: AGHT+IG8SVpMS1/gpPC7RPWTPFYdxmAYmy7mWfZnX5dhoOw/XL8j4On3CMQVGnZLKCvNNhUN/uFv9g==
X-Received: by 2002:a9d:7e8d:0:b0:6d3:1f0b:3fc7 with SMTP id m13-20020a9d7e8d000000b006d31f0b3fc7mr7654231otp.7.1701180032126;
        Tue, 28 Nov 2023 06:00:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id h14-20020a056830164e00b006ce2e1a6cb2sm1678579otr.44.2023.11.28.06.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:00:31 -0800 (PST)
Message-ID: <7a313871-8c1d-445e-92c6-5b20918afb89@linaro.org>
Date: Tue, 28 Nov 2023 08:00:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/11] target/arm: Move ARM_CPU_IRQ/FIQ
 definitions to 'cpu-qom.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g18XkjtfUBr0

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> The ARM_CPU_IRQ/FIQ definitions are meant for the ARM CPU
> QOM model. Move them to "cpu-qom.h" so any QOM code can
> use them.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Or do these definitions belong to cpu-defs.h?

I think they belong with the qom bits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
