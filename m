Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2201131njb;
        Mon, 7 Oct 2024 14:22:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrgp8l+HNp5Vy5zpv/ENubAfDmkh8YE4cwcqwmWYWyf7RpbynmsmLMvq4TgGaYoNxnioXpGBapg/UK8Q==@linaro.org
X-Received: by 2002:a05:6a20:c916:b0:1d3:2922:2cad with SMTP id adf61e73a8af0-1d6dfac54f2mr19124755637.34.1728336133967;
        Mon, 07 Oct 2024 14:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336133; cv=none;
        d=google.com; s=arc-20240605;
        b=O7YDRVn8pK9AKXy6L9KoK5mGuQD7LkJmUlg59R9CMui6FTINY/sgOM+S4fvfM0UWoz
         KJCy/KmagXD6rAIl6XU/c7tFECiMsuX5DFbo+P9ishMs31syiwsf2BnZbAfA6Gc7ueb8
         ZFPmHctn88Nj9Bn/BCgax3H7vcRodZYYiHF6SFGLxxfborhcoxUFtA60zM3TcSyFJd/X
         bTlf91h2gueKC1MXiuwA5WN7RRgtyHxUnapyNx31JkncjAWc0c+NgFv9g+UJFVCyHfOC
         zGgdW457qL7MRohlQIUwnfg3lFByF5/RWtxUk66NUC9hjdg6s3ocPlZF9VXCBS7byNQ2
         n66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QbC6iSFiT+vyi7lenYJBdeaISTUeTzDuIpwS6XLTde0=;
        fh=EQiD48FsUk/KgeYqbxBRByHw8I+dA2ajsXuXIdLvh0U=;
        b=CBg58hHhJqH7wi6hBgBscHJilTn1oqGFpcpUN805Ia9scOxQ6bUc5BSProJxYgNOox
         aWotdwdCybwFxBPgdHiQ0FL0+AlAkZGxltY9CqZH37TaZxOW4eNXu1COvChx3Qy16a0S
         9DHGmYe8o3m+tBhAFRci3BdJgagZFlsgJARfIrRq9EO4q+D6LQrqzstmbEIg6ImvYiVG
         tO15Ja8oI0AnlWKUMOSfwKQ6OwYQkfPSE5c/8+1UCZ5z//p2+EDL1wNy1GuaKUOC+AIJ
         6ezugduxGHbf2CDXtMWNbyYKxEAdD5SiqY463YO9TbE9c1X2RzN3cQemsZ4eSWSAo7mv
         HeXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JizXDqdk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71df0d6167bsor4186240b3a.7.2024.10.07.14.22.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JizXDqdk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336133; x=1728940933; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbC6iSFiT+vyi7lenYJBdeaISTUeTzDuIpwS6XLTde0=;
        b=JizXDqdkUM9xjp/R29Z3aiCNHxV2ZnuzLJXw7AIOX3mIUCp2om/MLGcFBPs5DHKNr+
         CJZXNz9u4b3UprFmY9FXnDgMcPb+a2cv2VFgKcy8GqlSPrHbkFLSVt6PWs5J3NMZ+mT2
         GBESFtorZcV/Ate9gfs3RRL+G1Uo8JY9Ic58oelcz9lHfATk/+OJnts5ckFhJPYDQMr2
         Fmz4/R26UAad+e5FJoT2XjsoLUR1IxYGC5z4FTnRb7gVXeN4ghBq81A6rbAX/1gkBd7K
         sh/sgKRG2WtquxBxp5ja07pNZyJ/madnuduv2OvQEOegDGwBD/gH7WTNmPzC/606R/+e
         wiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336133; x=1728940933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbC6iSFiT+vyi7lenYJBdeaISTUeTzDuIpwS6XLTde0=;
        b=tqMJ5zyRbEivBJbrj0/by/Rw53XJ4URL3UYNap7LnMmXccsAqtgoLOpI+WwQ9Ceab+
         fn/YJbbZO6MXmHwAcNNpYn69QXjR2/ZvzP4FqVtLtRMOHoa2hX4iremGAjzG9YGCnhRY
         QNplnH2xjC/NWVwioa91c4mJxqHJW4hVXyo9hUVySF2aLqKTSyN0JcS0gbmF1ivkoZEm
         TRIWb330vQNcCf37GPyMq9tiyelbXA2fd4AiBgqQHvkLYS/FWZZL18szag4tEI5hdTwr
         nvVa/sxULCysQu5E8EWZyAvK1zwLBcw285pHMlb/R+IKGuInuf5YhUtkENYfoYJuMpQ+
         zgHg==
X-Forwarded-Encrypted: i=1; AJvYcCUvLdHJa/cXioxFs4MJmGhxwboDOjMOwuyRirja/OPg5gwuiM9Oztx5HgvHfqax2l3ZmEpvBADEUyBEeA==@linaro.org
X-Gm-Message-State: AOJu0Yylkm+exWMlkkP6ePkwxcmb6Z0Ne5UYYmBvHV020BgqoK2IJMp0
	kzHFhNThO3lViZmk/UNPEodrvfqgdtUiT3ep8i544mk0JKcVU4j2MJ83stiTTP5hMw==
X-Google-Smtp-Source: AGHT+IHcMgpcblQ88BmMDtyLEo+3l2e90THqkCBjAA7AYZv3VuMXhqSdmGZ+MOg9Fynw2K+IOkN6/g==
X-Received: by 2002:a05:6a00:2d98:b0:71e:cb:e7bc with SMTP id d2e1a72fcca58-71e00cbe88bmr8548269b3a.22.1728336128601;
        Mon, 07 Oct 2024 14:22:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd0610sm4883622b3a.69.2024.10.07.14.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:22:08 -0700 (PDT)
Message-ID: <3d52273d-d97c-4aa0-99fa-fa672330b8c5@linaro.org>
Date: Mon, 7 Oct 2024 18:22:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-17-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1SjFbFlrV59U

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
