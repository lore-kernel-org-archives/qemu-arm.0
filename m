Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2112966njc;
        Mon, 24 Mar 2025 10:35:18 -0700 (PDT)
X-Received: by 2002:a17:90b:28c4:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3031002af0fmr22349341a91.31.1742837718461;
        Mon, 24 Mar 2025 10:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742837718; cv=none;
        d=google.com; s=arc-20240605;
        b=d/SSyxKNzbtVIlTfW225+QWfghzi68WW9LYyh006u7EgOBkUH22v8P/IDbkbGNNnUB
         VNqHqxPRQERefnILt+PzgRoT9aoHmvSplOwtdDqP9gRaSgBDPD8xlNcHfcOIShXzmgPr
         MHgyKuKd43alRzXSKya1PckwCT+LtmA9LvZ4hS17i9Joki8FtnjrhRPdk44D7x/oAvIP
         Mfw2cR7qf1RbZLgmiyAqE1UMeoHfYRAoZUpJuB+DRmPZcEkhbQoxtk2yNTWK60J7Eljh
         DIDb0Om2vstnezLqPGmvYR/zxzzgiKF7p0o257hxTH+L58OcSH0snboglZpNEwQVv0yS
         2GIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eoaD8YFe488a4ldBxRoAefiBjbsMm56Uhf96bx3V/qQ=;
        fh=ovdbSbF25NqXHN8+ozjnsnyIjY+LS/trBWPh5LBor84=;
        b=VHDSEZhcsbwz7YnsRdZ6NjmD06xJCauH3jZpmsPQIqHXH9F91zp7gQ/YERNVjPdLV2
         7+g73XGi6OwIkflCAhElVG9nkhNpzzr4258qBvmX5zkDBGtAQk2FuOjbveD3bNz7WD2i
         QO3Yuczhl0o38a/FYNPnrXYjq3oSmVhrFzRQvCYD8crYCxmL2C8/6hOCat9BYWik1/bC
         bxCqTN/DrmtcmZcpS0xebxGsoNW4dIQwtaMG2r8Y2pNjeMgOUMcI9oWZDjFGpYzRBpwF
         snrxzlhdr/tTN0Yk8DKxKqouq7Bm1xYxL4DmCcxAUc0UK2bxTUu6rF3IsoTkXuUE6O7J
         xGmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLx4UOlt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f7741f9sor6736900a91.5.2025.03.24.10.35.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 10:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLx4UOlt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837718; x=1743442518; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eoaD8YFe488a4ldBxRoAefiBjbsMm56Uhf96bx3V/qQ=;
        b=oLx4UOlt9C3555mqJgWoA7VD65wGHgJ+y22+8fd7NQYyBoetUSD2YSTk8os7C4S9yc
         7IvzsX+kUtpZIJt69CbPP+9GOI/zqHlS5wcFUO9E0Pxk7jx+/eWxnjyeOLEnTtkKSW06
         lO4z0oqGrWLK2utpMM7DfkwMFKPR/MOCxwQCtyd9Y3KTmRwBNGPzCzy3HH6l1ePXYneJ
         M6x8Qg466a1MbA0M6GWKsuOHebU1MuICl2J0e0bVKb4CvqN2/9n55pRNtfFXJFM9oLPK
         0BOVsgCvnb1KlCAPOcKaMMVe23tGyJaE97MsgTrv8TfQn50Mz44ZvAM4E/fq08JB1Myx
         keEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837718; x=1743442518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoaD8YFe488a4ldBxRoAefiBjbsMm56Uhf96bx3V/qQ=;
        b=mIiBx6rOXfCGNqco93X0Yyz08VLCg9yFmsACRSKluoIJwrYQGpm2wBVM1wOddTdojY
         SpvN/oF/UBDk+rrsO03zcfM1ZARFBEYa00C5wliOCIYU6JSnQRwKOfzQS5znuquxNBJY
         8scjGZfvJe1YYWSW/nWbCsIjGe8jQi2ujFXa3dnj5YTVr/Qehw7ItrV18UqZ49pyTH13
         UjtafB7d1Ead2kXuSj+gOiif0a4TYcuADYf+7Og3pkn/JtFV6cPgROGtSIae0FcEhylz
         reeRqB1Z9VXT4GYmCKLLe6cw6GC4RnI3TlCueAWblM6aaBrnp6RO4AFWwwFOjf176/lu
         HFTg==
X-Gm-Message-State: AOJu0Yy3BZkMmamhOQ43hnrQbVEvn6qQjPLZhcE+tk67CjssrFAghflj
	ldNYnrGT4YJQosUD9LNbSnmsuZwlZzt6T1yRvlCHQ0CLLgg0ihWZSF6pRWdlrf9OnfaKqSfVt7h
	qcYI=
X-Gm-Gg: ASbGnctMq7XaSDNVBP+WTfLTsadDFDZdNTqnSUA7J1VhWrEmIcHOLfrc9FHBaF+yHLs
	UulLaxV0jea1Mi99E5t3ur4JuTRTGrw6fXWZadV6RnBu51Ehvf/qKfJYCY4GkmojvtZfPDOgvCT
	/YZo8e9GU2tytrCT6CEkOQXyMTw1qFAo6jtC9GZjrmlSYkfLU3yRzrAw+vLCtR5/rs/qoBb/RJ1
	N7KGKacTFoCsLi2wf9Y8PpSExZMO4f6lxv2quKtWgtalEm9W0tpw5QbBaS/ZWTlFUrkEPUjjhNy
	ahJU48CWXAhYRwSoKsHtKmxm6ly3hhSzJWBF/3bmd+Cy4yWOD1B4Uc1i3juYH/JPeA1IUgLcoeI
	iq/UCk7jWLajfEltMR3o=
X-Google-Smtp-Source: AGHT+IG/Snj26w5AJhYoACS79W3jRPimhGijSdgYskip6cg0TmDD85vEZ+PaeNxLRrI8oHbMEKZJxg==
X-Received: by 2002:a17:90b:4c52:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-3030fe8d64cmr20302303a91.1.1742837717730;
        Mon, 24 Mar 2025 10:35:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5b7b23sm8552349a91.9.2025.03.24.10.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:35:17 -0700 (PDT)
Message-ID: <6225af3a-d824-40a3-835c-ce5c90da7a3f@linaro.org>
Date: Mon, 24 Mar 2025 10:35:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] target/ppc: expand comment on FP/VMX/VSX access
 functions
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-8-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250324102142.67022-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EUn6AtuzbmOx

On 3/24/25 03:21, Alex Bennée wrote:
> Mainly as an aid to myself getting confused too many bswaps deep into
> the code.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/ppc/cpu.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
