Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1262387eja;
        Fri, 1 Mar 2024 11:05:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6e7NhsLNJ35Ps2NOfrr3kdPEwMuHBqQXrjM23ZoHET94nE9bwudAFEIS+bXhvM0iuZf8yvfKsvLMbvt4dQiXXm8bL5+If
X-Google-Smtp-Source: AGHT+IHBzzBxxc0BUhL+ibIF/xqd/HUbEL94v3JnyoFz7D1k44uZFCoY91fvMmsa4ib1QoD+105G
X-Received: by 2002:ad4:4e8a:0:b0:690:5e0c:3389 with SMTP id dy10-20020ad44e8a000000b006905e0c3389mr989989qvb.58.1709319920855;
        Fri, 01 Mar 2024 11:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709319920; cv=none;
        d=google.com; s=arc-20160816;
        b=wTThfN5ky0P+6h8X3YiqQlVF+V3J9Uxp/NzJxcew+p7ovkyf8SUZjzFOg9X4djOoUm
         q0Lnh35EYvDVd2kLdVmjOYTANQp8/PmWGrbKaWzcr+EKr3pHANK1G9cGdcOC4h//kYI1
         JBI7jWiWUQcovTTa+Z72uii87W04XzL5KMyBRlz02bNhdN50ucRV6zoBn2gFxc6/3VDJ
         CNlmF3ic8RQqOGep7ghoLRs+1n7R0QwbNAvle0IGPdReYU2tf3G1gDm9WmXTCDCMWBpG
         ng3XXYbgYI7LzLiYGUADqoylkeV9LRa8zIYN6AHQ9bkq4Q7JBbNbVNEzaLAv8p/hWqge
         IHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=A1KumXMvs94AkoZIHrVcipeV0Nv8ZwgZzsg4ytbfNNI=;
        fh=CPl4pWqiNIqM82xr2Ecrk/J9kgthgNCKgdC7Hel7pgs=;
        b=AMFPC3ZEHoS3Vk/dNmoTiaM+bKGmQhDnzhNfVyki6VwGKZhoLTjn0OhwH+hEb8lH+P
         c63kvrxddQJwsgTXlKsc6iowBQWiLMHkQPJmK908/lgzpKFZZTddXPg4ddkMV1vSFhpV
         Zgc1LVABVWlNdwphZQoIIZQrF2BsqHd7ge/iSlfgatdENt8RhQENwDzyZoUdUYfmpSJH
         gszZcS59aEsjpC82SWaJPHitr8VHmIoR2J21TxEysiENaZCv2vvFgmrIi5HiV/zLXplf
         AsdyYNmQeQuv1k8sYfJTvjfj51z/kdzokoBmkFjo7HPPu1J26PHOr0s4x5OrztGhE3xh
         2EdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZKQulce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05621421c800b0068c558d46f1si4227688qvh.435.2024.03.01.11.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 11:05:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZKQulce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg8C2-0005Tz-PD; Fri, 01 Mar 2024 14:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8C1-0005Tj-0m
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:05:13 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8Bz-0005Ii-IJ
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:05:12 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d347ddc37eso7644961fa.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 11:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709319910; x=1709924710; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A1KumXMvs94AkoZIHrVcipeV0Nv8ZwgZzsg4ytbfNNI=;
 b=SZKQulceShgDc9gmLZjkgvxvMEOSPfsdiBVKqIkJDrNX1DOifh/pPaG3rRxp2cXaWr
 hGyvabi7QXWAwLZJ3hptotLN/g5tsNFYOrreliM6xIWijyDIyPryb21jU/Aggj/uAJiA
 5XYzEDl7cYdl63TWZC3ic7Pn4iRaTs17E3zpfH8sV2JTN3WXV+Tz2faQy4l/B25OOngO
 uSH80rLB7N2DDue0BKKrnSROUaMDDMN/rW+ZnFQJ/qKjcbAQO6mc3Z9uAKoneIgEIuW5
 WqpG/FAgktNy86SrKQOp3xKF9MzIbAQwpMADFsdMfix6KnX9VWxtUzJnPFIQ0YCRzPR/
 8Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709319910; x=1709924710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A1KumXMvs94AkoZIHrVcipeV0Nv8ZwgZzsg4ytbfNNI=;
 b=dFfFYeQoefDsUmLOBi5iqkG43cbK3VY//3AogKJNXhdlu2FZUdqKAuSwXX8pYMBdLf
 Xldc6wxGvBAjNcYltz4RtMbHZtXJHjrI5FiqcbleeWnmpqodlO88iRUdWlOkd6AdcHkc
 qvDsmY9Go0Hxr2b0MA8UhiPivqmrqkGVynRT6O5Numy2wDNTj33hAn7hIl/AbRRqw9C5
 3VNEzn32tUtD3p5I8m65oR/AA4cZoqVHDR81bbaBBY+xYIKa39Pyzk230FF2vzDFcAFR
 v6GzB7MDytGzJEiKqpiiRB3BM9L9dXA6PCUm+vFUtO8j5HZRm4xTteF6GFs8Zr9RuXlm
 tJdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/yoYBN3xclZ+ukQOjhVxqkzfUPjA3L7If0bv5se8If+irzhnUpZDs6VIeXcYcbT8BJy3+vTBZSyEK/5QJk94cVit8
X-Gm-Message-State: AOJu0YxkJA/oOkqDG4Np6xhGU41+cR1HjUXkk0oYO3ViSz1oWt7GSM4x
 gLKQJvH8U3qGtKSJz/D+6DIvzsjDmH7IchtImr0OcPezFBQsG1uX5DrG6Obgr1E=
X-Received: by 2002:a05:651c:2dd:b0:2d3:20f2:ff29 with SMTP id
 f29-20020a05651c02dd00b002d320f2ff29mr1695316ljo.36.1709319909674; 
 Fri, 01 Mar 2024 11:05:09 -0800 (PST)
Received: from [192.168.69.100] ([176.187.210.84])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b00412b67388f0sm8572229wmo.6.2024.03.01.11.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 11:05:09 -0800 (PST)
Message-ID: <043b6698-ffe4-42ea-a56e-10b2976a7bd9@linaro.org>
Date: Fri, 1 Mar 2024 20:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] target/arm: Enable FEAT_ECV for 'max' CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240301183219.2424889-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 57Lzqn3Q5/9r

On 1/3/24 19:32, Peter Maydell wrote:
> Enable all FEAT_ECV features on the 'max' CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

