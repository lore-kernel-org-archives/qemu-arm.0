Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp643131ejs;
        Tue, 9 Jan 2024 13:13:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsNIyexJygc/BCO3cuEVw2v9fZ9JS7A6S7qwgLuLDxxJ7meZQZAZtCL1TXt28cuwC+5wl2
X-Received: by 2002:a05:6214:c26:b0:67f:6296:ad0c with SMTP id a6-20020a0562140c2600b0067f6296ad0cmr109863qvd.55.1704834834741;
        Tue, 09 Jan 2024 13:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704834834; cv=none;
        d=google.com; s=arc-20160816;
        b=nTHu3TpaRL65AFNv4K16qonXUpl3mWOWm4i45f4kzkpdZKsFR0h7WhnoOqz+Ub5AcA
         2sf0UkhmxeCL5Ky3idSInfkLHihnAIVoHGlGeUTYJRJfv/5y0w5qflhmjZF0YL/7aBTd
         Io/KX0vcjZhe676nW2/uXOPDM8c6VQB6MQkw+Pti7JLjb6ZwReMeaEIBe98TgYknTQsw
         kDGN+OuucnnJb2mW3OHs76SwDksD1bmGjcHyhuqtYOHZ9ffQWVsdmzEFlrJjzNa0BfGb
         S09PCAoaTW6JWowdfQGavvaDc/2AO6qxhPekd9EA7PdBQiemZ8FXuqUMLm9Yd9h7cY0z
         yECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k1Bs5wwGu1+Ov97vn4cnlM/nqCj2d8CdRhHsfXNJGNE=;
        fh=d/STXr2TBFjH0WGE3YIyS64pzMDCNbhlap4BAKgtdZQ=;
        b=OuldvAu5MegkUn5KvY4Itm9XwS4d5J8agDTcthR7iWobyHAVK4BhnGsUyFdhR4VNnk
         u6brQdR2CF3twCsjTfC97/3b3TrqteYtfUGIC93uDxSOS9wu6oJAEMCs5YrGdQjJ4LdD
         kIYvpNaHGegpv2h8Gl20KR5jUWWIGukhGSDNeSb6diDf+FzMfmH6hZLiJCPZEwcJpuYc
         LMnwAAzFzF4MHVc/PuXttDU1J5bcLVP8d1luxQWUqJrRn5K7dX6ms8hiidXzDKAhPGAV
         oOI44kWX8Jn48/aSgqWBjBljDS6el7JxkAr0dWfPmbqknKbh88pW56l0biX+364c7cJ1
         Oy8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSbznwIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20-20020a0cb254000000b0067a9a5163f9si3099970qve.461.2024.01.09.13.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 13:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSbznwIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNJPl-0008JO-NL; Tue, 09 Jan 2024 16:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNJPk-0008Iv-Ji
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 16:13:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNJPa-0003iO-Da
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 16:13:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e461c1f44so29156785e9.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jan 2024 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704834802; x=1705439602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k1Bs5wwGu1+Ov97vn4cnlM/nqCj2d8CdRhHsfXNJGNE=;
 b=fSbznwIKdh+BxF1KptqVjFk0ytDX0lX532cSnP/8qcGReDtQvQHLTAETg7r9Bq3xf7
 IfPdrIju3hWJ4nY5B80FjklP5ZhCKKXWjtBSFUJX/5JTPiX3Mgir1VjnLqru+KETSTFv
 SAR39+pCaV1ZXd8KOr1FpoeCAr8Yj0S2EvmcSfqTG2iifkc74F1b8fDTzGstF+8toSft
 4pCuZSP1LSVAdNvAyQQHxp+Wj/kU3Hr+5leX7psCJg5oLsp880JdX3I7c3KoeVuoWN3F
 4fgdNNzGc7U7NEdQ9p2gMRu0/lKK7AsYEfs2bSBwK0J6yjZzAtN0sX8pqCvbd92uJbZ6
 sJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704834802; x=1705439602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1Bs5wwGu1+Ov97vn4cnlM/nqCj2d8CdRhHsfXNJGNE=;
 b=wGA1vdAikHme9lV1JjpIgo67O4Qgn1yyRLvOWy+A60GeiHhnFF0I7Z1tlziFaVI4r/
 aP7zIeZym6lwGgLXPkBdmnw9HAQ0bIFvZO0NNdnVrJToJSMIv5SYMi5cVsFBNybubxzK
 Su2Mjh5e0hhJzV886nrHLgLpHf+jKdGSEvka4N4lWN38T916JVF9OkDsDuUdaoLXXr4w
 jNeE22U63QVqJPwF7GOPZc57JCBLgJ27v3ApJ6kSjMEtvYgPCIPt7DWv7xl8YA/Ho/ZR
 +pVmZ8QHWO99Ehir1CYWNMYpD7Fj5/wkbA6X2rU5nVC/d0/ZF36es+gVyvMpqZhB5iWS
 5IuQ==
X-Gm-Message-State: AOJu0YyUjA8yrU4CbYdR79RwmW1BpDbxS90HRbJRbajexz9LkOmDBh7D
 7ED4TbaeNnfMHQj3Zw1EFP3cqObwBAUHqQ==
X-Received: by 2002:a5d:624e:0:b0:337:20f5:22df with SMTP id
 m14-20020a5d624e000000b0033720f522dfmr921292wrv.110.1704834802387; 
 Tue, 09 Jan 2024 13:13:22 -0800 (PST)
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr.
 [176.184.32.47]) by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b0033776a50472sm2318129wri.10.2024.01.09.13.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 13:13:22 -0800 (PST)
Message-ID: <5317a393-b9ab-4526-8856-7087d915c9db@linaro.org>
Date: Tue, 9 Jan 2024 22:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/timer: fix systick trace message
Content-Language: en-US
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240109184508.3189599-1-sam@rfc1149.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109184508.3189599-1-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: A1GTgRGhp24P

On 9/1/24 19:45, Samuel Tardieu wrote:
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
> ---
>   hw/timer/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

