Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp407441njb;
        Tue, 13 May 2025 03:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSBz6h2eJ8BeoZRJXIh/Nr+cTtXbZtvRpiXaoah/+C1QdHajMfBaBFSBzcYgcjyLOA7w5PF+QRNTP8uw==@linaro.org
X-Received: by 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442d6ddec16mr136244445e9.29.1747130878465;
        Tue, 13 May 2025 03:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130878; cv=none;
        d=google.com; s=arc-20240605;
        b=lRdIOhUkWBDchevlheFgACzOAztaZPOpfN+kENVzfdU1YtNDO6AW8mXrT/3bUr98MR
         E6PG4zYX53G0wx3VMLCHa8BQ+X8abVFRJ0RQrkmlbtMUdsC8iuZNtGAqVOg+Qvm8ezoV
         5vqYtADqId5mQNb1n/WEw5pGroycULrgiBYiNDr+vhjLmxgLG4nlvSaL0tClmLUNULXA
         NUpzzSgIq2LosAvN5Vxq+Ijjy/gV/AkolhR5vloyxzbkryD0qjYUvQuygQdoSwGF1ZWp
         MvXA1YaV2XHUFjeLs3crUXCthmgZtE0xNmPUNrmlotaxhAwALZRLeHrRzl6cyjs+UrZq
         n04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        fh=JH2v4zF78uw97ED3Ohs/lcqJxbEfRbUdWtCGSiFNc/Q=;
        b=EnaPPrcqShcJ7oUlO9GhmaKmTb5JAtPqFkZddIJkXehzVacYHCPfkleWTbIfMW+bdT
         qwhOtluc0QKVmZTr1+om0rI6wfhJJRBP3JIk8tfId3vCwnjGspJfF0ZAG9oJd7Mt/3TC
         NrozTOJ+RKOMiyUkCuQ1aMXZDmbaVetbUhPKP3k4k5nSFvMv5stokFaQvju+X6Dbhyul
         BE3voV8ZJj9zBtAIgBEvApP+vRMzTCHyPbsQGNLBTNcYeNCo8zv8gLCANB5TIrI2jgnC
         PcSNhVZNwqvK6rubyXBYWtG+mTPyQ0O5ZlozL1jnAXvar93PaM7bmq5r7mI9kE95YQ+f
         rH+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8AAhSbm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d6882187sor27977095e9.11.2025.05.13.03.07.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8AAhSbm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130878; x=1747735678; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=X8AAhSbmXIkivO4jYTY3Kzxdkea+DqjkXSass9Dr+NXURGZJ+BuxYwPGB6jmy2/G4f
         bZ5MJPhu50hWOtNTjKZ5GuBWCDPBJL28iAxT6W29lZC6nrhw6YA0APc2IfHrWDklKLjW
         tV9sUOInt9bJelz4Zt0DHnNYIlktvYNHfnXJymNJEnlFDq5LueFY1NcYyzhHCd7Nz+G6
         tzQWCKj4EAfmfdFdHdDVUnGOttTIQIGp5RY9q7O8vZhGa+KB37tb4Zjr0lzb6HhX4CLQ
         eiovtreSnn/M/MywQ66UvPwvINTVph5myvLDNyw0UCINUG6nBAHW6oLgfXK/VKnFBH4L
         onQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130878; x=1747735678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=iBU1E5Xl7htx9eGoz8UR6rCtbG5Si1V9ptQMmMyKR57wPpXTNc4PAdJLYieWXw5Pcq
         zLZApLnxoeziHejvYVWv5uislDIy2T3QBP853zmWpYJPSc2cFqSk2CBEKx6Zk5ncIj/O
         oLhyUMe9phDszBvpnUjJV3+D6t4HgJSY4LGFTKSKXHDBMCPAPPhYyBxhTHf+/nReeq2X
         gDpSmtiJ5Hf0jrM7yKGMlTehL0lGHacYfcI3bXIuYhAC2qZ4F+rZJIb7t+6C20cnOqRm
         VOv5iRlXkqdFTjTTGX0RrtbjR4/xRJMcEYZIEc13VWPq5wIWuLhztHObRW26MIeCZsOo
         eZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe5eVjKBhF9Bu9syZ1hNJN/sAs32qCGj4VW41LbT1QLq0aleI/eRU6vui74IQF+OwdcH2lBljY18oWkg==@linaro.org
X-Gm-Message-State: AOJu0YySPfaWRJ17cjx/jGTvD6Zb1idOvFvYXCp1nzp6gXAzD3aVOpFv
	77XmZysdDXzF2kxZnej2RLOsul8LBDwmJPDfMveLMVaIBDmyfvoPWoZ96Q4MRGnx+Q==
X-Gm-Gg: ASbGncuV4B0cm2xL3VCPAlWe2G3gGGeKhLRjuyQ0VFXB8Jm+Io5Sd4JTIeIRJT9V7M/
	f4AzTnJbjDiYLyKg57lzmHLxf48zlGVZHjbwlqTSC8HztpX7dQS6pahCMkoA1R2oCvOLCqWd2oF
	VyAIR/g8RKFgG22qrk8DBPnul080Lw8I34C+Cy03Pbjwu4xn1NzXt44nxMaRTCJBrUq6brJAiX+
	bk9yKff8WAAzEcLsQNeZfT20PfYBc7IzTKWkrfNr+Ay4zg/vk2QrnmxoxYhUCh/8qmFfi+PF/gx
	WkrlgnUHg5BlTynmZhnnE+jUYT0LeqDnx3WaPw+btwR3FhqqPr7YCdX2bvJIdUB0gOV/FWVm1ln
	SSt7A/0QFqm/VLWy/Tef99lulILyP
X-Google-Smtp-Source: AGHT+IGVl3rC7KK+BwwSzbsyoT3gT98jHfPfE5lBvTNtcTCODedbnoCbc3sTwSrgs84c28D80Z+Seg==
X-Received: by 2002:a05:600c:608b:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-442d6d6ab7cmr158700585e9.16.1747130877943;
        Tue, 13 May 2025 03:07:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm209323035e9.2.2025.05.13.03.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:07:57 -0700 (PDT)
Message-ID: <09194fbf-a2a3-4166-8f28-9a43f02b0df8@linaro.org>
Date: Tue, 13 May 2025 11:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 27/48] target/arm/arm-powerctl: compile file once
 (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-28-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-28-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qdhd2dYnTmLw

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
