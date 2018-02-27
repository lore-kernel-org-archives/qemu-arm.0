Received: by 10.28.71.27 with SMTP id u27csp5151893wma;
        Tue, 27 Feb 2018 10:57:20 -0800 (PST)
X-Received: by 10.98.174.16 with SMTP id q16mr14895049pff.92.1519757839910;
        Tue, 27 Feb 2018 10:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519757839; cv=none;
        d=google.com; s=arc-20160816;
        b=hqqt5ST+g/Hd3CU8gaP/+C5cBwJWdkJg69CGDFcAGFVO/9vW+CZVbOIw2kq2MuU/E9
         QQ4DEdpIgeupZlRtqDbqaDZZky06bP1t8MyjbcBQJZAGAUQlxgnxp80lqnk7NnPFTrcR
         j3QwCLgtQhzzwT3NHkF9nCWP7xlPXXQMn0p0eP1m+2n9sCMRjHgbWoi5t+9kp59oUmbW
         VnFaydqNg6gtvWfblVpEuUIC0DEHl/apHvazKVT4rfsNer35V22G8wFJ9PCBTHDXrz98
         A/oZcHW9qtd6XY66CHWbln8hkJL4/1hLdjGVubYDp92lDF6H98JGlHHYFnPGRYc8q/uH
         1Yyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=R4QPCTvXAjxofmGMWUe4c7oXp04FNzeAbemOgkwiMAs=;
        b=yXrr8OB5pkRS6e3H6ImIuW0NhB8cFtmw+/1C9/18QBxLFXaMMJpjhfIauKoOlLM778
         Qe8r3NPO9tYC5P/7Qp30guVcBWj70g3B18vy2oFTBTHDOS60MidGOD2bZ2wII1nDJvzQ
         G9zAYGIWB3cOpbjRVN7Q1k4pneWXLGIrSnWzRvLc4U03NOHQZx6I6PpCZckgDzb0OTUF
         C8edAbvBMmmKWeOL1ptVq64DtQITIzqA7nUCu8Ije6XraYAJxBGz+Pr1RKaPwz+bJURv
         RkPUoVAJySk5ABcJHMcZfte3ltoJlmNasN4IpkDdTmI4PJtFznH9c274C6A7l/LAO2nc
         1exw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VBvbGaBp;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w31-v6sor3804111pla.50.2018.02.27.10.57.19
        (Google Transport Security);
        Tue, 27 Feb 2018 10:57:19 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VBvbGaBp;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R4QPCTvXAjxofmGMWUe4c7oXp04FNzeAbemOgkwiMAs=;
        b=VBvbGaBpEo4eEkzdV2eSUm9p8nKlbIq/z77eK09PhP7Ih/4YpptWJX7PydZjrbCIQw
         ZUkwkKUwh7VbKJFV1lqxubmihbRYyAYxFvJv5xbOvd1nnRJCpUABen1hzVWm7emIfvIT
         OD09fizjgV62pIwKyiJ4m+hUuo1Zvsrc3icosNg38EWxqRikYJIdciS0blzYJxhwM20u
         /GaCKCOojP4qKK/NBpWQ4kBVaKNauIsRg4qbOIQM2sKeTwxUfWe1gc2zFf/0Zsdk3hqD
         4Ls9fCyV1vrxdkiwxhnEQEFhxEXTXa5XTvQy7dfc6jVzWbWmsEUqH3BMnuMebqj3e0Xd
         3ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R4QPCTvXAjxofmGMWUe4c7oXp04FNzeAbemOgkwiMAs=;
        b=MCT9Lec+cVRcEK8OR4b0oq3DQqFOsMhvb4UPpzGKyyMdli03FIVG5phVmf15tD0NPO
         ssqKrAmwLErOpD5JyB8Oi3UbwJ7wfuWQhjUL+jVS13BMk4pWDC3VTnPliIMBIIJS/kEO
         TlVXAeqaWvEVCjHbTDs2/jiQ0gbzJkQaLkkuS7T+OiHqmxF/d7+zzLxAGZhOjkQYtHva
         1h6/Oq86tU5RN3UicMd/V/Ji9hNd5xC2pXbq6+6jbtXDHTYQnekNHCTJ2kZEkQf6i0Zk
         LAcn4lgzF5B4rjlvghzsWjfSKYSm0Bz7AWp0Zbd/pCgk4lKk6Tg+UhnDOmqnXHwST5rx
         /pxg==
X-Gm-Message-State: APf1xPDH/f0F/jTDLPjuX3ODWm0Xvdx7G9XKp0IvmDB2VkSn83EJcxJl
	yzt4o4eUSq3uHvHQJ9954Hozx5fw
X-Google-Smtp-Source: AG47ELvUhrCSMHuzm+g6mlz+2rbD3gmechP+SBsBDQmyMBkIV6jlOUcPeWY6samnfthVRLfu7U+gWA==
X-Received: by 2002:a17:902:76cb:: with SMTP id j11-v6mr10507065plt.431.1519757838652;
        Tue, 27 Feb 2018 10:57:18 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.googlemail.com with ESMTPSA id e82sm14341165pfh.89.2018.02.27.10.57.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 10:57:17 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] linux-user: Report AArch64 FP16 support via hwcap bits
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180227183958.15167-1-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <376a816f-780e-18da-f7e2-4efa2e25b06b@twiddle.net>
Date: Tue, 27 Feb 2018 10:57:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227183958.15167-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: RFvzmlvyFk6/

On 02/27/2018 10:39 AM, Peter Maydell wrote:
> Set the appropriate Linux hwcap bits to tell the guest binary if we
> have implemented half-precision floating point support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is intended to go after Alex's FP16 stuff since it
> uses the ARM_FEATURE_V8_FP16 bit that defines.
> There is as yet no kernel definition of an AArch32 hwcap
> bit to report FP16.
> 
> Based-on: <20180227143852.11175-1-alex.bennee@linaro.org>
> 
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
