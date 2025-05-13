Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp407093njb;
        Tue, 13 May 2025 03:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU79pi+wV2Nwyf/HbttGVn7xqpWKB4mDpTCgAVB1tYIXPDxM/M2CF2WXQ57bM9D7sMnTEqd3JwvH8Hrbg==@linaro.org
X-Received: by 2002:a05:6000:4020:b0:3a1:2df6:822c with SMTP id ffacd0b85a97d-3a1f64898dbmr14088095f8f.31.1747130846290;
        Tue, 13 May 2025 03:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130846; cv=none;
        d=google.com; s=arc-20240605;
        b=Rzb1Ufw/s+vTyqTP7wscM/RwRsXmIGl3nae493lHrIeXQIekHCKMgG4Kixatkd5GLY
         5mTCyaL4Cmx3AxBklig0B9YmNWJwZln/fqVzXWZLosIeyDIQZGvMeZRp5YiIpeQxqohx
         MwFHPtxrQi3exkvB898eUXxul4mhVD+OLvDGi6B296RUWs3FgMPe9b/prSs1lnkdrjxc
         RJyxMPSKFuNsw+oDNyxCW80tiZu7THPYLd5gwxt2MlnYyinoHdLaPtPW1zx4i/lDTkUA
         /EGe7CAqjWlRU80+4kmhNN4VGN63sLB7QpnXH36Rt2Z5/s6OrF5cnR2voXwyZgVyvxoZ
         rHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T5vSQjcPExIVnRx8sVx5D2ET1Pw3X75NisVy3+k6Mfg=;
        fh=hWMJoCYfxt9dzQp4vkPf2xAilrBaNVG5/A282bmt+H8=;
        b=D52YB0PeDZv2GnO2uzTair/B6V33NUcHTO8Dn1KnoxEa25SFIJEZWJ3trEG+che5vb
         Qrcvj9JsUqQSdA+tDtz57rO4jGFUP18KbaDQvA16O69OPxzGUkT0Wq5IeAeGPkGRtlCf
         7jGrQg/vg2iImiU0kCjO/cTMpi64FgqyjTajLwHx/oEy3Ygd0n59tz4TvVicmq5RzLF2
         x3lCOf6B8NCiw5b6QHFcD+fo7IFM3RZKKsXLOL80PWSYrwiBQy5yqBc6vAyDRKbK9WPe
         8p54c4C8rd8+w6NbQGEsygq2iPaNhqLqRBZslqu+kDKL8RTgfLZCMyr3V+6ZmTnCG+As
         5mpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdEpYnzF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f57ef865sor3425064f8f.2.2025.05.13.03.07.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdEpYnzF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130846; x=1747735646; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5vSQjcPExIVnRx8sVx5D2ET1Pw3X75NisVy3+k6Mfg=;
        b=QdEpYnzFScxTFOnSuPIXLRqXSONC69bPVm8cQBsQTASfIcEfAxg5BRbsFTqz1woB0O
         KowNnpftmX417IltWMUzaBzNgGxile2/QGI5zuDVZSkj/im/4aau67FNfDF/l75fYQYq
         dusvvSdQGAJb33mUM5YbzFF1akjnVF7DsE4iK3DOT1EQedNMQZI4fMTiVcN5QMV7PNSw
         yur9GAY32Z7NfzPwr5n7eeN9z7C6Nj6q4xbF2pVuNUNaBIn6RzAXnhaxd1QE6SSdN4ye
         h1n1+/qiDJ3EUhB9NvRjTvrqn4H82w46VwS5erhOqaCGsJBPckLvqnpZfBf3fgZy87+R
         /W4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130846; x=1747735646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5vSQjcPExIVnRx8sVx5D2ET1Pw3X75NisVy3+k6Mfg=;
        b=CK65szAd6ATlgAyEwsiybiqAgMh/CnVzQBu5DSLoxtO7H5kjJxss1wUaOZZQSaolJi
         mmOHlGbdxyAxYELBVayyvNT3A9KTxZJVRCIgRV2GjUFcBHGef+qHs48EzWkjj+8+lzvI
         jIwwRVYwXqkRZ8YMghGsknz5WXApRf2XvOuGa6YFc1V1ZIH+eeAYbLV3e9Dki/zcquWP
         x2E4RLiT9uzb1H81XFnOtSoF5RFb1vlrj9leB+huxYzqrQOUhsPoUXFJpJ0inXGZUyrf
         KlFCeZo0GrZRSVxAYoa/AySJBgbqwOOo5kjXpBvcG+Zu37JC/urou8nINFYaFQ29enAD
         yeSA==
X-Forwarded-Encrypted: i=1; AJvYcCWgfFtN62oJB3Tl1aMPhGygvsRA+rnuBYQcw1QXQkKL2/I+mbfVFI3dVOlNXr/vqHHcmfFdRJo5tlAs3Q==@linaro.org
X-Gm-Message-State: AOJu0YzRl7WsAEhzB1AtXGW212tAp1td30LsM58UMahZiMXYTDWTLOGw
	oUkf3fVWYKsMHcGQQM3RbbR3ict2pYA8cusm8PJP5UqgslP2Eby7Itnd3OTN5Q9Ktg==
X-Gm-Gg: ASbGncshECi5LaABF7TZjRXZgSJdcCEIIa9ZWkSQJ+b5DpqCXz17VdXXtCM9oR/lQ5m
	fQLwpTb2tmc9xD2oNWCyIjI0Y6KNJsfZlqmppYY1+/exgEQDNFJz6yLYrEmNIhM2MO6iDKi67Sz
	fefa0gR8TiYpJXxGWtIrEwox0igPV40gpT8mA+NlF0LwUJ8Gt8V/Fbh2u3QZIX2HmJqo6NauQW3
	VyF4Y1Jc0BPhnk7PJobKA4TxCLT3tjP+/ey04IogJASVOILHFwXWHBUMPujOvyp83XxGCgMVjRO
	kU1iQoSMkccbyAvsCSOEWPq5wMYimPIsdhOlvce8/D3tNkO6deh7R6LtVoI8SC7fHrSeoOgEhA6
	RdtYp168FCoXNxQ+TYw==
X-Google-Smtp-Source: AGHT+IGR+hSqCpg5XZTqgxaXNn0FphVU6ZKFnDYfOWg97FAe0KPokbedUpX2+fZVdhEHBwHFkB+7zQ==
X-Received: by 2002:adf:a304:0:b0:3a0:bcb0:f69c with SMTP id ffacd0b85a97d-3a1f646d9f7mr10195760f8f.3.1747130845709;
        Tue, 13 May 2025 03:07:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2ffsm15808904f8f.66.2025.05.13.03.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:07:25 -0700 (PDT)
Message-ID: <4a2fd091-fe87-47ad-a5f9-cd47076cdabf@linaro.org>
Date: Tue, 13 May 2025 11:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 24/48] target/arm/vfp_fpscr: compile file twice (user,
 system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-25-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-25-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eLRQLyNgsyWT

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
