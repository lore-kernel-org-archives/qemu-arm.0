Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2202146ejm;
        Sun, 23 Apr 2023 03:49:35 -0700 (PDT)
X-Received: by 2002:a5d:4742:0:b0:2ce:9d06:58c6 with SMTP id o2-20020a5d4742000000b002ce9d0658c6mr7043660wrs.53.1682246975301;
        Sun, 23 Apr 2023 03:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682246975; cv=none;
        d=google.com; s=arc-20160816;
        b=cJw7ZPJ4HHePUaI6ec2qMJiKhAZ3kjSDTeT8DuN9XyJtvu3YOFK9brGezeauZP3E52
         Nzoh7UUG8hP8ajpGfbCOBLIZ9clBuByUigny0eplv58bG7gQ8+jVAQJtRwiimqRwXAUZ
         yR4wpGFFPRrDDrCwJfie0CqRcaCyJ5Jyr43Qm3nMqHeijjkc7Vh9qMT2M12wtrwV3vD/
         oUqZ1FDJg1kofRSBCBiJ7Rp5gu1TZtaFlSfEMEWfjFazQVmMbJxMXsRhBUGCbQo2ecGp
         z/6VVMgZxbtTk5z1Su74VCObR8eRuATWOw477OKdDPzejHLmLx7oIj6M5Ji+pFoc+Mwq
         QAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mAFdUFz1uLt8+wrzK4MHAZ+dRCZItK5VLk8fdIxT7f8=;
        b=Uk11gf91GyiwmOl/eI6Qi3L0GlmxkT63p81BW4Sm+ltZlOnbxTD0C3FoTm4spcDoAs
         tRars7uVsffBXEc7tnO1BZVDwd4V0/8/4f1RTIjjJimKF+iHa9FbihC2gP5+vwEyNqx0
         yrtf1HsKyaqH58UqwrWLkGKhtHjoem3uBOhR8RS1juewIFs2WS6gb9/tVo7o9HtcgSO4
         I4OyXGMJm4Wq55akQ/AEGAjosdmNa+E4dqAwzxccXvpDlfxsQMgNoDp4hyRrrF4ifk2u
         04nmuX41o63N9gv2Wn50/3p0/X5BaxwDgOCSaOAIjZZXvSmCFYxOrpcjYesYv0RcNPKr
         8qRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RhYuEwA8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f18-20020a5d50d2000000b0030411c924fbsor1703662wrt.43.2023.04.23.03.49.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Apr 2023 03:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RhYuEwA8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682246975; x=1684838975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAFdUFz1uLt8+wrzK4MHAZ+dRCZItK5VLk8fdIxT7f8=;
        b=RhYuEwA8dytffg2w5jOqcRx+/y0sY82+VF9lOoGpMnRt17gYYyrpAGK0ssjlWHrKcp
         DxWO1XVmzwdx/zHbo5vlnvp3tS4uyv1/sAh8bLwdmD5S2JsXGfCeXWwm36UmsP7D2+Cv
         4zyt7nTRwkoApQzH4LHgPihzUVIgO5Eynz3dsir2wjZY2WM0CwQmEYpHxs1coe5K1TUP
         g6Syn+cr3RqjZaDFuKkcvBO53UZRfugNeqUZU7wPXTYBAVkZAGTFNNjFG1ZjFVUq+4eC
         0Bg7ETCYED9W+YIVe/DPkH/vbEUTgm4WQwf6fpyHAie/dRR0LVEEtR6uGjhYkOry1BQa
         KK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682246975; x=1684838975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAFdUFz1uLt8+wrzK4MHAZ+dRCZItK5VLk8fdIxT7f8=;
        b=QzeApHrTQA3FPUU08FXpPfpHO1Ht9jcd77tFMUlYRhtHrW1MqOQfY51IjA7kv2Ydx7
         hwYcFZfGDr0ZUtggpJbuqxb1fFk/Sz0mINTfTSunR4AjM8rJGlS0d//qPODso4Yo/gQO
         mGiOCoP0R7Acx4ApWP4Wz/dOmHirl3JGjK5ea7aGegZNARIR5Ij5ohzytbhmfEmh4YvS
         IkBIMIsWHZ517DY5qnds+4aFwVDprvTNQjgicnxnVn2wpP8dPPmSpPR+qOilHynYQMlR
         2jAvfIzlkdTH1iefhZzLw0G+30NnPFcG+AuI4ccely3I3iweeZ/qzofzLh8r1TscOTR7
         oiUw==
X-Gm-Message-State: AAQBX9cZzc1KE0uEAXzi/yOs4iw1fUugkQSW1vkmL93sAG56tvBQRcUZ
	YtdOSJG2gb+Cgr1PZwEQGYXVqkt9
X-Google-Smtp-Source: AKy350Zldb5iwFGZOfB+QN2Bb2idnwJwse9kj9roK4xX7hi7zvx7HaGtx7kuXPkpyv+QN85NcGsD0Q==
X-Received: by 2002:adf:de10:0:b0:2f6:e580:534c with SMTP id b16-20020adfde10000000b002f6e580534cmr7625869wrm.61.1682246974997;
        Sun, 23 Apr 2023 03:49:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
        by smtp.gmail.com with ESMTPSA id s13-20020adfeb0d000000b002fb6a79dea0sm8505777wrn.7.2023.04.23.03.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 03:49:34 -0700 (PDT)
Message-ID: <8f2d0b21-41c7-1f52-9c53-842320f63148@linaro.org>
Date: Sun, 23 Apr 2023 11:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a
 function
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /oVCqBsn7UM3

On 4/12/23 13:18, Fabiano Rosas wrote:
> Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
> -cpu max configuration. We'll need that to be able to restrict this
> code to a TCG-only config in the next patches.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
