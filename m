Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8316748ejb;
        Wed, 4 Jan 2023 14:22:03 -0800 (PST)
X-Received: by 2002:a05:6402:388e:b0:486:ecd3:15f8 with SMTP id fd14-20020a056402388e00b00486ecd315f8mr24651350edb.6.1672870923652;
        Wed, 04 Jan 2023 14:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672870923; cv=none;
        d=google.com; s=arc-20160816;
        b=kcw1Xax6XLtK7uI+niY8pKtN/llULeeVuPW8C1F2lSwq0wUN5jyslqgM3MUNnBoQae
         R1z66p1kALxf/Knruw8sp5MZjB86GcxkoJqjJQMXJeD7z+kP/dxO7u+R6yBjw2qKFhpd
         S6Gb9Eg4VV44gRtf6NQV1pk6Q8KrhxT3sEONcOLPn5owJYJejBHMBav+lh6uaB86otOz
         ueHlDfBqOkcYoPijlMMqBPVZ0KS1CGx6Pe1tqcIZHyMg1J0C429X2zg19srgRZo41whb
         006ZMPqXgm2RAUxNk9w0XmXjx9YE80rsUgOQWkwqAC9b4LE/YtIexc00U1WPf1TzLF1p
         uo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AC6dQXzHGoywu9nQ2ZSYn9ZLDwjXw+HWiNLFi59X4w8=;
        b=bAk3STnW2JfL4OrZTJevseMfxRidMAhU9v8lZVjdsC76SIyzFxmudLSYq5nvOdssTu
         qogbn7u/gi2Ft/GbLlQQVBcVmkJ1DdHLWxsDRn9vGomyeIttp0RunXxbOinmsJDNbBTC
         bP4e40ljSX63lDERBE6O0UMxsKt0/2xXv0kXeQplW+CdgUVE5e9xM82W3/4wAHB0sEhf
         aKTwQzZv6UAB++dT+nt2j9LS7Bx8km09yGt4htIUrLeZYChfTsvCuvubbDXWR+xWwMuO
         wfVCA3aBHPmSnT+MaxHzgMjf9AcrgTL3i3thFgPrV9MlqNZwm+LJLdgPxtqZdtMbGNIa
         y3sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m33Rbruh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c12-20020a170906528c00b0084ccc6dbdd9sor4129223ejm.18.2023.01.04.14.22.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 14:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m33Rbruh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AC6dQXzHGoywu9nQ2ZSYn9ZLDwjXw+HWiNLFi59X4w8=;
        b=m33RbruhtecMiny0G4SbRkQIgPhnv0amT4CMTnbFUn04V//rBGr5LkrAnuJv6OOubS
         lQc52QLqIhl2eBFRvdg7v+havT8PCuTvGLwQq1Czr88SmuSTs73rMSt5IDkNtzhDplc+
         PTkJMFXM+ngY343Wcg+JqNO+Whdch5OUp87F1S25G/c5oDPyDbxE2aMDQIKvovSwlcXn
         konGIuB6WmXLHwtBWSyeUMhjAl2C4mHPzgHg0yuvarpF75DJqaOUn6E15nym671GJOH3
         lpbpGkdbsQKu7Kj/3qikktsGi6llyEtA/dt5XU6SRr91Gin7NPttizqErnowDVJov2m+
         9CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AC6dQXzHGoywu9nQ2ZSYn9ZLDwjXw+HWiNLFi59X4w8=;
        b=IMpfQZ6wa95bePKbcePnmg6PuvFn0MzsmftmMkwGIFK2l35nrH4g2DRLSLBRfzA0KY
         kkAGMC0jaT0tNhFcBe5+6JnAtn2NVA1GX0RUmlbrcKAZFGG4zmRy3X17ZA38meYCfGf3
         g8EFfxnD38sM935Orr6Z3PcGoBzJlBPXl8PXaC27EkrGEyBLgLOlmWhNhcGqgSasLbrh
         kqg3/ExCNJYIRNLVbqVrCEal/AmObzCaeRY6JNRqXQ9Onj7ZipQw1CbrLS0o+U7CdtVS
         HL5HdvoDmj5nIXmoM8LpHSlHSxjkuwLfYenEWREUrHMYf9PrbplPEhmGDmrzZ5EwS25X
         QWBw==
X-Gm-Message-State: AFqh2kqeGZAe2++wdfWno+yJh9I+iB/pATHmKrOBy9ofHBt/8v/uf6PH
	uP+MiU0lDYvmKuKnOrFnUPGBxteK
X-Google-Smtp-Source: AMrXdXvdqWywV9ns8t66kRya6qZwZ9rxxgacP1bWeb+g7gc2p9iY54QSEAizao1/EDB0eDwP+oWO5Q==
X-Received: by 2002:a17:907:8d16:b0:7c4:fa17:71fe with SMTP id tc22-20020a1709078d1600b007c4fa1771femr45184955ejc.45.1672870923403;
        Wed, 04 Jan 2023 14:22:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id lb13-20020a170907784d00b0084b89c66eb5sm14166754ejc.4.2023.01.04.14.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:22:02 -0800 (PST)
Message-ID: <a159ca9d-0627-11a4-1c99-48a7aca958d8@linaro.org>
Date: Wed, 4 Jan 2023 23:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 07/27] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104215835.24692-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7rwEUJYni6PT

On 4/1/23 22:58, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
