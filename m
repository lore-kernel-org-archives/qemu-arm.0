Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3251213njb;
        Tue, 18 Mar 2025 15:35:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWPBxPQrRYevWUwiA4QxTmSl4Ro02mMKXu0Vm8Avct9GaONKs3IGutjNsvQTFSh+rb7y71Zmdph31/GQ==@linaro.org
X-Received: by 2002:a17:902:c948:b0:216:3466:7414 with SMTP id d9443c01a7336-22649c8cc79mr5156485ad.44.1742337345839;
        Tue, 18 Mar 2025 15:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742337345; cv=none;
        d=google.com; s=arc-20240605;
        b=hPKAvSILgM25PwkIyRptDNY3a5UNOKIgbiaNYwbXMZFiMt0ehpJKm8crEDH13nEDxA
         VS9893LF0UKuJzxc6shd4/jeiOEIxTzhef+M+YXF0q1N+u2j85sUcOtmR2F/o0HpPYA6
         PyU60wkUDCxOzjaKDKn+60kQvKv0+vBkzWDkH7oBxqd3yAb9ddyT3bPwqe4iG1jjVAOD
         kXZnT/bOgqv/rlk8pQdvphHeA8OCXFABHP+wou4xKOSAW7y5edS97vdgA1Pqmpgb/lwj
         sZbV4SIjv88saHIipI5pJdjZ2bITSKlmSKmKMkmtm88TV3+pnoK3DmLsREXzuFP2pUHy
         lDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OcpXmFjMO3sTuEr069JPwJK2tK4LKUaxYfppJkr+u58=;
        fh=2oPRhx/t5f38Cnp1nfD/fw4FY1dWSrV95zD7C+ARR00=;
        b=Yt4H6h2rcfGoc4hUiChfTvN28legIvpy3cM5cSXtsj4qM+wNcmtuNkxgmtJF0Tsazr
         aVFDaEo+XP8Xwo8lThKh0+QozBDXyQhSyWZB0amtRnI5VhyCl9fdTxukGo3oZ9SlBTPz
         10TNGrpOhkddB6joxPPYy54U9nVNJEnq+rmEXMqkRnQZ1fYoWcgdlsg7U1sLig/NMCz5
         14ROHxxyDK2iiXUX5aQMYH6K6a+ag3u3xBOwUnW6qh1qQBjBb5qeQVp/Wtumsx9Ov+LG
         T27ZwfeW1yvgosC1Jo33ByPLFat3J2cIsDWuPF2ptl5ZA+yiCG4GZU/1qUT0NPW/icZ5
         z+Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onb3T0jb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30153607dc7sor6954678a91.5.2025.03.18.15.35.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onb3T0jb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742337345; x=1742942145; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcpXmFjMO3sTuEr069JPwJK2tK4LKUaxYfppJkr+u58=;
        b=onb3T0jbIrAFv/AwHHLkG6CO96mooX9HJ8d9sb2ncopV2pdO6F5AHm5uhXAjdxlbHq
         OfZUhnm9mm8IYMUphjP1CWcZXgOGxVtChtcxrZ4d8VvYSlSCH8MGU4oPuwBj++v3gi5/
         rDo7CknSmUhA+sX4N96i2ZMc+vTHfq436uURzcL3GezLafkSVrBln2sELwGEe/2kge/o
         TvqBWIXoNWxXcW+Tpv7NacoHceeSrHnt9tHMUGSznaVA92ZYkVOQp5zP6CDWOb4I2ep+
         pi8xLN8bk2saMg03cf3htfNi45GyEOCYTxBn3yVpoRxJwAlCJKbMRiMKqaYmjmJ4I+oV
         gpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742337345; x=1742942145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcpXmFjMO3sTuEr069JPwJK2tK4LKUaxYfppJkr+u58=;
        b=WO6grQ0av7s2OMFxyz4oA3FfN2IXo60BQIMHOaASMJ2pNcu1xnDa2NhNOK948JV4t4
         Kh5QhPBdilvk6uacCDfxH5VWVeFsOv2WNi+OKLFleYusJyZLlfk3GX2sBkBrYRAeL6CJ
         AHXFkYiVuwp1uu9HtD0MNcn6zyOnbdrNGpKlMZtExQgFvM2OcfwN5/j097ZZmS3Nl4jQ
         QUa1fjs4TLMYw6505tL8mVmZikoF7yF4caUZEydd0tBJfmCk6jEAyETPIYFWWRDCL+TA
         ZMs6k+lh/aliGDFCKBiVeB6c5InhaW6G8B6ekhk2ePQDNqUkpyY0yMdrrViWbi6rP1Tm
         y5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWMt+ba/tdjoXIBhfalkHAfMumqtTD+ml19XkGxfDDhybdICsWfE5m7MMIEkUN4eAM4zGMUjilocFzlfg==@linaro.org
X-Gm-Message-State: AOJu0Yzbf13S8kVEdnbWMyw4OEevJMeAhmyKprcUDGmLyANYrOlKZ9yq
	K7C7minyozYpkWSOqk/n3wbzL5xLpalE6phN34i5W8ahffDMdscje0bYjs/IUN/3ug==
X-Gm-Gg: ASbGncvrTZZFP+vNP0Gg/druyGeLjJtQIJ7dsgNQ8xGsiviAc/wGp/5IHdqb18ooUOM
	CkFwnk5Ly36ZPp1LtHuyZAbsOHj1kfFRspJmkl42gUlsBEg9WiGgvoj1Dfs2K/3l7XkQr2Agy7O
	5rxDDVfA7dskXbcyp5Tuc5RFPHt20fQLDPUUPgj9Mi7l30uPc0KrtOfeJEScktqOu8ChIj6hwON
	fA/q6T990AUwr9sKUdvAQ96LZxPefQQpL7sNPQQcdU8inwJCURKVYfXRfyuUyHrvdZhYeY2DUZ6
	xLdAiwzUF4nErsy3kiV1hA6e6fU6rRnENVO01CC5StZ4ll2XF+e+BDwa2Q==
X-Google-Smtp-Source: AGHT+IEt60b/xkcu869FuAeLSGYbURqATeqh+waGHDsaBv/jurzyPKhT+Oye2N3wcUB3foD5o0iT/g==
X-Received: by 2002:a17:90a:e70f:b0:2ff:6ac2:c5a6 with SMTP id 98e67ed59e1d1-301be205cd8mr503863a91.31.1742337345425;
        Tue, 18 Mar 2025 15:35:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6a08sm100286865ad.154.2025.03.18.15.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:35:45 -0700 (PDT)
Message-ID: <30e72d8d-a4cb-45af-b57e-a0910bbe06a5@linaro.org>
Date: Tue, 18 Mar 2025 15:35:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] exec/cpu-all: restrict BSWAP_NEEDED to target
 specific code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-2-pierrick.bouvier@linaro.org>
 <2766725c-9287-4ba6-9e14-e84616d5fd17@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2766725c-9287-4ba6-9e14-e84616d5fd17@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: M5S+r1/Fu/HO

On 3/18/25 14:41, Richard Henderson wrote:
> On 3/17/25 21:51, Pierrick Bouvier wrote:
>> This identifier is already poisoned, so it can't be used from common
>> code anyway.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/exec/cpu-all.h | 6 ++++--
>>    1 file changed, 4 insertions(+), 2 deletions(-)
> 
> I'll give you a
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> because it's quick and correct.  However, there are only 8 actual uses within the entire
> tree (discounting comments), and all could be replaced by
> 

I hesitated to do it and get rid of BSWAP_NEEDED completely, so I'll do 
the replace.

>> +# if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
> 
> 
> r~
