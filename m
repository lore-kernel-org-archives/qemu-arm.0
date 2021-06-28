Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4099087lfg;
        Mon, 28 Jun 2021 08:23:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy32nKntJwp8YU8WCCbnxG/UmfxERXgsq9mxv52Ocjdne3rEct4neQlc3c4HFqED2gNsBKM
X-Received: by 2002:a1f:bf4c:: with SMTP id p73mr17054947vkf.13.1624893830756;
        Mon, 28 Jun 2021 08:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624893830; cv=none;
        d=google.com; s=arc-20160816;
        b=BpnD6VC4AiH3jBz6dwXflYNn9VbC46iv5mH/A3tmAoKZmRJ6ptv7XUAr1B0XdiHK7D
         t14zUBHSzbtwo/USTryulTBbZLLcwUj+KfKLSgNuO5c7xpmnnz5rTW81En2dpDXlGGPC
         Yg5W9v/9oWBc9rbsuLKr0XFjXk7IDXWusZFef4PTO0YC25JVSA+8uyuuIKZtZv/92xbt
         aFskCZ1Jcl0nvoIWDF9f3XxuiITdhJ9eH9YkMxiAJ6BfuCtZPosBaa7WT0vkzJPctU2v
         oLjr4/fGdAD7i3Tu835710q3MC9n6mligW+nXBDXfoA3ItCyrjsqURkyI9X5YwgqnOaw
         uquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EM75SH72X6nzVFHlkR2fXFfltgBEftsK66XNTB1+8h0=;
        b=Lmx3pVTkUFbDXwW4X+ZbtbtvxqDOY5SXsqibi5nLTdkfr7W1TDGGYmjfVHUF5zQnPN
         8CpbSCQ4a/c4/cuMMYfeu9x8T7jGV/5AXICpLVV6F3ZAArU2iwJlfYxtqygQf+3GMLuO
         M4jwjBAeNmzbTKI7pJmcDna7QPjfxLw2oBFPOrgO0H17Q4XPfU6YM+RmhKy3Rjo4TN8G
         JAXeU3F57BN5FMHMr3D80XOHrTyd8udFPoLainMgGR+OdzoFIYGTw6qKSaJIBvrZrIRA
         4tTD+X9e/Erjc8zNjn0ooROOFQclXs3KsDxadFLLcKlNxIi6MoGS9BB+hJNCqOq3IGZ9
         0iEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ObcNXqD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g92si8164328uag.141.2021.06.28.08.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ObcNXqD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxt6z-00045c-WB
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt6s-00045C-58
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:23:42 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt6q-00060B-LA
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:23:41 -0400
Received: by mail-pf1-x429.google.com with SMTP id j24so350264pfi.12
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EM75SH72X6nzVFHlkR2fXFfltgBEftsK66XNTB1+8h0=;
 b=ObcNXqD1fNMIyJKxT1JmJv8duHRjnyGkbfGN8Kb01YyfOEJH6UouqVEiTqTtCDs8hB
 0jYdXVfK1K/HbovorrxVloFv9mA2YQ0aUwOoxjntDcyN66RBo/FXFqOc45hURjgs13C3
 Vv6AaCeMj6/5pK09VClR6duaeSS31uIra0z65AwDKr8IOnOs7Ojc47EHo8Yzk5h9i3dH
 IbCzkP/V19P1ubZ64kkL6llRuVJVWyCRWYVUHPX1LgzLplQrYO0ThPBZAeFWFuJN4Cba
 p+DI3Kh9UNZHmyc5HReL+V/mkNGNswaNfiir4Yt2QPVt7LO+8JdZ9HgjKA6u7QVsba7y
 Nqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EM75SH72X6nzVFHlkR2fXFfltgBEftsK66XNTB1+8h0=;
 b=Z9XTfRdjP0JGvV0YuWMsMswYXa9v7z20+SzFm+trHaYFWCSb1AUXW5qq+eU7w6GwYF
 qC90RpUU0Q8eDxp6F1c4Yv6ynYKz4MvJBN8f7OzqVbGP4XNT47IM/CD5PwYNkkKtBpZq
 dMgOykDvTJ8jRvNXgXuBDAxNLhtjkYjV79Ilv+sA3GT8ieWYcEO0L6b6OmAu7vkf8bn1
 rMgjRU0g3OVXe4z/sWRM9Rv/+pol5GRlPbKtiQDfYeINngAXZ9wlAO0AyvaMti12jcdD
 xRW/osSN0CxsO16YvtKK6Vfv+t0MwGh+CPVA7Zn9lIhQI7R97PTIxcMV+MC3qLKclhJn
 FAyw==
X-Gm-Message-State: AOAM530A82CVYaJ7WKDezQEpt2uahtqyXLs2hmaJndLNF0nBO2Q7vKgb
 GsxLUUpKvugNUuQ6Gxt0xkiacw==
X-Received: by 2002:a62:3244:0:b029:308:22b0:52ff with SMTP id
 y65-20020a6232440000b029030822b052ffmr23063528pfy.68.1624893819369; 
 Mon, 28 Jun 2021 08:23:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v11sm26820pjs.13.2021.06.28.08.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:23:39 -0700 (PDT)
Subject: Re: [PATCH 05/18] target/arm: Use dup_const() instead of
 bitfield_replicate()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6518b92-2e56-61f1-0409-7467927a2390@linaro.org>
Date: Mon, 28 Jun 2021 08:23:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWLVLBKrll4a

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Use dup_const() instead of bitfield_replicate() in
> disas_simd_mod_imm().
> 
> (We can't replace the other use of bitfield_replicate() in this file,
> in logic_imm_decode_wmask(), because that location needs to handle 2
> and 4 bit elements, which dup_const() cannot.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
