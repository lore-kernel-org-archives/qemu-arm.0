Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1596065wrq;
        Wed, 13 Jun 2018 22:41:41 -0700 (PDT)
X-Received: by 2002:a63:b543:: with SMTP id u3-v6mr1017565pgo.365.1528954901734;
        Wed, 13 Jun 2018 22:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528954901; cv=none;
        d=google.com; s=arc-20160816;
        b=LKLLBQVq8e0itjI2fTTZbr7ABMM/wHC7uHV4ZKLBhW+6mZBpxsTJVIaIqNs1sI0YUF
         TlAu7fCW1tXuj95RkVn67XTv+9nurKrSC6NswP2cMRcpa1lIR8CX86YZw6UOuepuJmAe
         F1EekhunJ7CecMNex9huPbovTImdNpK4EoQNNt0kEWc+f4qLrNOvpOz1HeY32fB0buw3
         bEi5XTGcv7iFuDaTXHvIPAlaja8QPjfCz5zMI3hsKQsL1mYXTzFuNWBsHe7enDu3Yhvk
         ndjbcKHSMwPzwPcmjaIllRUJ7mCCpkJBYTxi0jZvQWQj4r3fRDzk5OMp84bH3y5D21U5
         tfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=ayEcqx6B7iNlXS+5RnLKVmvP0XsRfQLtmjE9D+praHQ=;
        b=wzXLNJcV1AcHeSn0er4waDoILze/tlmTFlyuVB/xVRIpmO4aH7OSbu3jcmog5HdnL7
         4NfFY2nkskco/PbDodVYIC4V7fe4ydXCEmzosqfeE+NIRtbqPqlNBYgF2or4WEuRFAZ3
         FctVkfZ6oDNUIrC1p6mhUHTExA3IM1OodB3Sbtuuu2He6Pcpxk4Eo+5avYZSTiXv/K/D
         NcB1M4VQgNWKD0HRvHJ90DXJJJTn6syml0wjJ7UjAEMbZUQYdK2qpf2lZ81g1okkWywm
         FY/jnUajUBwbQBEAM7EHKkNWko/09bMNrF+JmA46TsXdlmhvNtvcm1tgjYnGfjoQe8HR
         /Eng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6c8bK70;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s65-v6sor1206736pfj.130.2018.06.13.22.41.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6c8bK70;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ayEcqx6B7iNlXS+5RnLKVmvP0XsRfQLtmjE9D+praHQ=;
        b=X6c8bK70ZU/QRVDB1r6lvpn7kE95IdBfNrTSXlmlopJ1hBQNYJ1y3TBkXDJVegK3BF
         kx6uQtC0JHJ9FO+7d5D05t8nQYBbw25A0bQjySTRauJaYftOSoG2/w85fSKbkzvUSHW9
         Obpb2m7CrRCMXwHpmWDdrYj6O1/8wNEyDqaj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ayEcqx6B7iNlXS+5RnLKVmvP0XsRfQLtmjE9D+praHQ=;
        b=kAnwlUmracdQP7UzC3miGj7vuZeiOHMsq5t5BFqMYMgYaBybd1C03v9psFtvT/7SIw
         dUZ+M8ifwXoyecACR0q1A9tOUywArUlvAqCrutxeC/U4sSgOhE0dcncWyj4M+TE3+vcP
         iItsO6dJyIirhe7qlahwUrmoA5Y8HnK3uDX9+r2Q3QR2qOK81vdYR6ONeLyNl1Fu9pOS
         Ixb1xWiqQKnhmWGDHnPexNHoQgV2WTYlnvChvjVgAzNJu1El/e/MD0n7GUSmxoSY4cQR
         4zwVxLc3aE/xxcdQoMqSaf8W7l1VYNsyFrJsfgYUvxrtE8jkIbHhFVCCSK4QncKb4GCK
         lUCg==
X-Gm-Message-State: APt69E34G+0XcstVDIFAF/nhhNdmQzfNaHP5jMyH4J5z+6OSLyPWYxJf
	ovrnWIrJB+X6gqHXGYWopcRtFzWH57BupQ==
X-Google-Smtp-Source: ADUXVKIlM6vZwwvrj01Bsh3Jv0KXs+UrbI/AjpyKha/ibPlwnilcT61VDDxGispeG8jEL0iJ6aXtaA==
X-Received: by 2002:a62:a21b:: with SMTP id m27-v6mr7891045pff.248.1528954901250;
        Wed, 13 Jun 2018 22:41:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id p11-v6sm5050466pgu.16.2018.06.13.22.41.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:41:40 -0700 (PDT)
Subject: Re: [RISU PATCH v3 02/22] comms: include header for writev
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <67b52196-aaeb-8f2b-3cd6-b3996aea4aea@linaro.org>
Date: Wed, 13 Jun 2018 19:41:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: imUP47OCrfVR

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> The compiler complains about implicit declarations otherwise.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  comms.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
