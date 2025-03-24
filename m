Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2081356njc;
        Mon, 24 Mar 2025 09:46:34 -0700 (PDT)
X-Received: by 2002:a05:600c:5491:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43d508728eamr110917575e9.0.1742834794676;
        Mon, 24 Mar 2025 09:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742834794; cv=none;
        d=google.com; s=arc-20240605;
        b=XcrLqHo4WTGwl5ktgxmFMukV9De6vhAimBEyNazOH6rIfYDiXXvkQ2NaX5vbDUUM5n
         IvGpe6i4lIZqg0TxXmSlrd3MYMfQfXr15/yVga1malZQEVyDC8bT11OcbnID9TR5XRKL
         trBOo+TomIpywRJsjhOsCDgqVTD8+mCJ+pf9FN8fXuiR6Ut3QKEzuiBgP2ygBhypfgCa
         RkWJTRnqsNFPBFX0wwI+HL5iVD/+WrNOTY2nIm7IgunxuMjrHswGssTLsrxR1dVG5JyD
         0c0RIoj/e4pnyKWWDDy9f+Y6HCnQMiQYEAI1wv1wIFwL8XkX8+30PRP0APFvQFhKoSjG
         ngiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0vAzguKoUlaqukb3a5bBrPgEoer/5AHQ4RTT+MsA2MY=;
        fh=guoHuVftAUdepLYPKBIRGirBuprjhK96IFFUf52AiIM=;
        b=K0PPAxdzrKvsh7XmnX4hPLcQAGfh94+5DjpCV+6R0EqbQ62KqRxTUxUjtNIo6b2/hv
         HTOKCN4BtDV0116GHdmH5xAa2DfhprrNt6n3OB+JMn0mtBsvNd826MCblG++o5jkMh/Q
         7i7YeqzSkAAxt4SaSx6Eq3+tjULNhPsUNiti/nH/aShrTSS2Dt9cCp0d0CpZYRR6UUzU
         sgkSx0Ed1gDiNQUgV/Tf6RDu4Yoi9Q2M89omdGeujwbg/k9ywmMGu2E4btiu56tKPfIn
         yoGqxcjtzBNqtKRhegqn8syM2JceiCa+mlA2kHrCCsG1fwNSo4f1wxJ2qVo/rAP+fVUn
         DKRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oz6Qhp56;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d4fd212ffsor32465625e9.2.2025.03.24.09.46.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 09:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oz6Qhp56;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742834794; x=1743439594; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vAzguKoUlaqukb3a5bBrPgEoer/5AHQ4RTT+MsA2MY=;
        b=Oz6Qhp56530wfur9syzhANc+uzNY+HKy5JbiJMVssB3m8TFhg83Wk7TFQF3psZtsad
         YG66Nf/gDSsbMvXTN+P8TE3FL4bhFGvh0hOMJBQZszGhg1ghypitcyNbXvYdlvNuDYTb
         +vnx3XWKfNTkNj6AvbhZSWGXv8wxIeBXa5eOB8Xn/A3g28eqUZwqUJZYyOScbzOTc9vN
         CK6TgG0DlMHn8YfrcIN6IDOFLk91zcWPHTjPtqrffeCUWLD6SlxOaMQ9VdFAaXf4irCq
         a2UzVgUomg4znlr2OKfwoU3S7SgPe7KMCaTghdmfDupNuAye2Ta18U2NfaAKF4gnHDDv
         GRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834794; x=1743439594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vAzguKoUlaqukb3a5bBrPgEoer/5AHQ4RTT+MsA2MY=;
        b=IQ/NPYM1nqeuy/X82gvuDn5VUz5z70Dpa2xzArdE37FfKkwVR2O0sYPa6txJ++ANYg
         6vsMoX/CqFGwm2MCmB12a693KFnG7+8wDUfdFwp20yjqxtyk8Tiv6/Ytcy5mMm1hYWUT
         lNtFvuMu4Ge5OnfOpPK57TdJuUpTvx4BG6ptwcpOhbSODD3bghy0vRu3yJubSZ88ZXjx
         gx4LwuH1tqfRiuySMObs4/nxB1a8nKiQ4v00qQVR3szuFFGER8XVCVc5rCVep/5S6teQ
         9bjd1GlrOyv9sBBhVBzs6nrNfBKxgUCN51YvJXZ0Fbgmb/npwjduowtuMGAj8AElBv/Q
         cxCQ==
X-Gm-Message-State: AOJu0YzGrU07nGQlkalYrYSDpuQdhhvpfXTn3UUh0Y35H15XKw5jn3cu
	8LmffW/xEIOZRp3gxxEZlnPozRRTctTPVWG2s3YR0As63JU2xPYuzF609mnaUNi5yxD7XsBTjld
	b9p4=
X-Gm-Gg: ASbGnctj4YTEJitOqzeIRil3YFjiKx0/vElwoDIAYCJQKz2wdbjessK7GspJT6goAQi
	nxU2dtEQOxRkCq3cgOPZ7HbGfdfqZ4Pm4RgBiBly7WPcLfYw012JuGVylcEIQE0qzmeYM3MXgwz
	BuVWWNRALXN51Yd4YVSOTsnn6YW7xMnSsoG0EJrchlm8gJIvklZnD32EykrdgtuRCGyEjA2R79C
	J2ULsfTUeYbBHTsaydcNjD1Ss2NAe0cXSxA7qXs00ZCtN04TLa4FSR2v50EeqqWq7DW7h+iRbLQ
	vRMPlXpyRJOVBZattlqHvV2RKqABK11Aqh6826LoYl/eIqffzWfF4YovAG/FoFfTTepQyY39VBe
	FD+YwNRmz6fJgcXhF+Q==
X-Google-Smtp-Source: AGHT+IFa/QvSiWwk60KYmLR44qWmv7WRDWhcq3tOWBTYHwDtIZzipKGkp/SRYYa4Q1nBKb/vX32/hQ==
X-Received: by 2002:a5d:6c64:0:b0:390:f9f9:3e9c with SMTP id ffacd0b85a97d-3997f910184mr12312616f8f.25.1742834793665;
        Mon, 24 Mar 2025 09:46:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f81sm11637654f8f.35.2025.03.24.09.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:46:33 -0700 (PDT)
Message-ID: <729ee2cc-ecaf-41d0-afbd-25f51952dbeb@linaro.org>
Date: Mon, 24 Mar 2025 17:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] include/gdbstub: add note to helpers.h
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-12-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250324102142.67022-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: v3RQhE3lLwXv

On 24/3/25 11:21, Alex Bennée wrote:
> We've not yet deprecated but we should steer users away from these
> helpers if they want to be in a single/heterogeneous binary.

Why not deprecate?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/gdbstub/helpers.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
> index 6f7cc48adc..9b3a535b03 100644
> --- a/include/gdbstub/helpers.h
> +++ b/include/gdbstub/helpers.h
> @@ -2,7 +2,9 @@
>    * gdbstub helpers
>    *
>    * These are all used by the various frontends and have to be host
> - * aware to ensure things are store in target order.
> + * aware to ensure things are store in target order. Consider using
> + * the endian neutral registers.h if you want the architecture to be
> + * included in an eventual single QEMU binary.
>    *
>    * Copyright (c) 2022 Linaro Ltd
>    *
