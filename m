Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp698259njb;
        Fri, 6 Dec 2024 00:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfSEBIpVYXu1u1UI5UmQ8sGcC1rp+wzfjnx/Yp++u5Ujbl8Uw08wIqKp5su9wbHI00BqsPNA1p4N/4yg==@linaro.org
X-Google-Smtp-Source: AGHT+IGHQShrXKg4mu/q2gPDofn3KebLMwiWkT6Oly4mAK53ha2qBWM0gQvJHk/BXietyarUys7k
X-Received: by 2002:a05:622a:15ce:b0:466:a1b5:be5a with SMTP id d75a77b69052e-46734cb5369mr49462371cf.17.1733474372147;
        Fri, 06 Dec 2024 00:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474372; cv=none;
        d=google.com; s=arc-20240605;
        b=ju27eZsG9xdsg3MYy37EVopErblCh9rKDhgSOFwVZxm2NbllReJV3jGjHTOWanzPWx
         dZ7ITP547vE8hPZ8UddcEoZe+BrEiES/RSrplzRi3w/xKXsP/KMGKAU3mUk8Wol1qrQS
         NBH8MXmd7XCBR05E+xp4XyDm0IDH6kLvaFVAk+2Crhl4NfUIAW9m06d4FolzI7vVP9w2
         JkfYo1AxaUTy7f1OuyRGBCRuU1jQXU57Ar/Tu6Ei5edXMjFf8d1ySQ/g8YDE77jG7+sA
         GGwsVtJ41pZyoF/UIOs3zLSJjcxUyeAbgDG0xNQwAjjC5pkISPxonsGF6XKHA+ww9lix
         Xoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=v1xEXKiHA8dY3YNYsbhWgjgOAK8lHDEMFtM4ydnXVsE=;
        fh=5h7hdOngPG3ic2IGSld9H3nq8W7j1dBazCpK5DGPWBs=;
        b=I1F4BY+1LO8Yn308dPHPH2lb0vQd7RObIPnzr6wcMaDNzYhDQV8i9Eo+3RwccWRoXu
         RySgVsrL50sYmcPjOrlotPHFPWI954u2tb7aQnAJZcVo3mdu/HEeEEAloPNMQ4hZgaOs
         KiK2xtMoK3HtnKJI7VSV955GE/6k+TlviLb9BmwI6tlRJpkeIb4oFqRDPCSq8dpoIMEl
         Gq9vkH5GN01O+8DomDxZihr8sT13ESQF2JAkpSJh/6g/30kI1dhQZIroN96uC8piEmUZ
         PR4eM8jv9Iqt4FamaCGbffiw23btMRlLRoBnuLA6NLyw0ercU43EkUc59S3sxtaZYbjm
         +WPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoBN0P3O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729840b05si24485051cf.603.2024.12.06.00.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoBN0P3O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJTru-00051Y-LV; Fri, 06 Dec 2024 03:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTrt-0004yR-ET
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 03:39:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTrr-0000mm-PO
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 03:39:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a752140eso11860705e9.3
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474358; x=1734079158; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1xEXKiHA8dY3YNYsbhWgjgOAK8lHDEMFtM4ydnXVsE=;
 b=UoBN0P3OupwFND21v/6YpvweIN66XHFFHg+EMrMOWvr5LLyOfzpm3t5zNQAkRcgwHK
 8UEwtaopzcFUprqJrWD3LO6vHFI7eD/HXS0/+qgV/ZqxKchZxsPS4eJMCOrPulnU7zRu
 Qnld9UxQVdlN/NFzFsPA1ZDbVH8eCbDLO5v2pRW1AugRfJPxhAcuqsgSvUkLyfx4f+5z
 1GJ0jyum+F3cTPVzNQMo6HngEkTcM/xejhLLMFWceiGix+zSxKAIjKpobid8Wabw39Tf
 KqU0CkEQR3k+1Q0avaVFf0DueIequwObSNoztzTMTeovBgl3auPLHwwVMkR/VYSyC+rU
 d8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474358; x=1734079158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v1xEXKiHA8dY3YNYsbhWgjgOAK8lHDEMFtM4ydnXVsE=;
 b=VhmkZG8h4UAfUxZ8ByeMhUvn75juuld5iEPCcWTK9t5EJst0wxFxegS4C6mcGiIiYG
 gdP38D9YW40P1zEzQ3AcqsDoh0OUUzqBffakRcerrp4+AZRZ+T0xyHrOwDGZ6pkP3yL4
 0tHvFCacdxLmHcV/afMU2b9rswoWnIoqSKvN+P6I+ERDkCMxL/dXNTzmgXV+C/umo0Ic
 yopnmrYx7WzpbJtSUksH12CzyHKwCaa3tyzO9q/9hmu8X1eNq6eRQILl+2YVDQLJ7XNO
 eBPKlSixHMzngJDTbPwU3g8fQwTr+msyAdGXQGNp46sn/eb/yL94xVUXMaCMT3orA6qz
 UJzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo/RzlKM/JW/zGbLX+tsgjz8HIBIwiCTwTHPWbg9ess/S6tA34+trFDLHyT2go3p2vL/G4VsEUfv7H@nongnu.org
X-Gm-Message-State: AOJu0YxQxToUL/5wM+baQDgvpJ8vvpyEYklphv1H22INYkLO7ouFrlQz
 rTCFREgNh5nbZzYBXHhHe64sAW3UujL8/FRsE1WJsVHBa/NWVFXXb7pShqHoZ7fvB7/yaIVS4UL
 o
X-Gm-Gg: ASbGncs4Tq27dZVC8rRP81oiu5z1BjDHhZEGbMCGuR2s0oJLI8X95L09ganKz6hCzGI
 8smtjJWzSLyiTE2ptAm4JU+zjj6rzv5qftjSfgudbDJseitnqNBmw+u9q+dc/lPKLh8SEmiPH6J
 mO1B/xEJc42vix3r3SgDXjwGzzAwfCAg2qE5GHVNdBLOjZ88PylAON6LNYvd8zd5RQGp11baGk3
 DjX8aWlIdyNJ53ax51saN6cu+wiuD9Occ2P8SmCi2zH1fb9+SaZhFySfMDK89SsbcG3SomVu9x2
 Kg6l8Ci4SkYqL0A6kw==
X-Received: by 2002:a5d:5f8c:0:b0:386:1cd3:8a03 with SMTP id
 ffacd0b85a97d-3862b379d16mr1517563f8f.32.1733474358386; 
 Fri, 06 Dec 2024 00:39:18 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862d7158c4sm871665f8f.54.2024.12.06.00.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:39:17 -0800 (PST)
Message-ID: <5b52cf73-fbf1-499a-bb22-ddd742a57512@linaro.org>
Date: Fri, 6 Dec 2024 09:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/arm: Convert vec_helper.c to use env alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-9-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TEJhC+UALDe6

On 6/12/24 04:12, Richard Henderson wrote:
> Allow the helpers to receive CPUARMState* directly
> instead of via void*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h         | 12 ++++++------
>   target/arm/tcg/helper-a64.h |  2 +-
>   target/arm/tcg/vec_helper.c | 21 +++++++--------------
>   3 files changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

