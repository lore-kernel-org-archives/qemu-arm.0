Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp323092ejj;
        Thu, 23 Nov 2023 03:43:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6pQvh2Mzyk/lA32QHlo4gmOPn9DmggKG4zeTGMaP/I4I6j5OhnM4+SZeQVrE/Pyj9plEy
X-Received: by 2002:a25:8741:0:b0:da4:3de:dc2c with SMTP id e1-20020a258741000000b00da403dedc2cmr4428462ybn.18.1700739792547;
        Thu, 23 Nov 2023 03:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739792; cv=none;
        d=google.com; s=arc-20160816;
        b=z0Bl+lnVg/JSusGLsC1dRXiTTpyXf6rC7IFludHUCyYwEkwCb04qwydE+mzAccnVZL
         Z5mHLLvXSJeb+Ln+LEAOxYMLkm9vx8bgfbVIBBw9yqpaitTmVyL2RMTRGKj2dyoCeVEM
         k4J686jT2JcdGBlYV+O0CDfgQpz0sMVL8B91WwCYpqMAtSklsV1NfDZCp7IBN9VRKzzQ
         kloeWZfjIfzvLnpFuqrLLOt/uEKg7yTuCDjVRyGydYyL+w1zmf2M+AHPOWRORp+ZYcPb
         Tspi/Mq38AD3flhUEa22711u/Gh1pOnFeXRy9B9bUY0hhQbbP3CW0j1kIDBbITD6pb2T
         HlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TK5gmGcJ/bkpS3b4rH8kMNV0KRS2ibQV+3r0RfiRAtw=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=FS+UtqXaqXrwRH0GBLtJnl784PvDs6WIGfGIybVtAvLBjVUH0wzmysDwX7KVMWgx9O
         Ta17MnvwZj0S+owp1j904s8bTiQx/e9ztelNgNvr+bwvZi8rS7gt2HXOmsFbzQDniprf
         DMiakYqW1hqiL9QZkOQ+lixqYL3ringLuBMlGqftxnZAhuAiiuROFKLQjN/O1OMKLP78
         plUnaT0We7eF0pe4UVtwCm8/L9qDp0PjPw7FRF4WXOcF2Stgn59pnA5Z3dDJzrKaVlvO
         Oh44cgJitUwbaC8uUjDjs0qmzgVoik4R4SX6oBczOu8rei0XQGl91um0bZEHq2oTHRjq
         GJtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orve1dsU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05620a0a9300b0077d6c80a7absi952294qkg.11.2023.11.23.03.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orve1dsU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r686n-0001PL-NY; Thu, 23 Nov 2023 06:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r686m-0001Oa-0r
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:43:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r686j-0004eQ-MW
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:42:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b358f216dso4350215e9.1
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 03:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739776; x=1701344576; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TK5gmGcJ/bkpS3b4rH8kMNV0KRS2ibQV+3r0RfiRAtw=;
 b=orve1dsU2vrmMBevE1VVzbtztLubMPTuife3s0kp4AJ8Zm9ZRHSKt0AMmW6AZbRT1e
 hW8AUoyj6LQ6bDsGR2SD8yQdYVLrQYNlE2bOxWq2gvjxsLadvTvOY2EzkQLnsqK0PRPH
 fewSot9Szov+40IXKW+CCUe90+kQ/zv5nASMqUvCCitozLHu/iUYCcfUQ+dTkkAE17Xf
 Z8IcKvfkzO4blzmPPb5GA0qbwqRFR2MBjnGtQJOX+LPTbtoVlocaNdy12RR2WAlaZMhg
 HYOUIvlxx5Dpo7hrTy+e/nov98KH6Nk1JTnNXXAcWe/wzwmzxSNl/JzktsHiuIMP3Dkg
 ulyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739776; x=1701344576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TK5gmGcJ/bkpS3b4rH8kMNV0KRS2ibQV+3r0RfiRAtw=;
 b=MVhxCwFOJRU95MjSQqiQdSS5bkHrV5vJk9CTk9qXF2ALqIk5jPr6cY5P4sEdpHdqFb
 1kEWJaRgsXnUSjUhymrKtLoh1LPda97DAzuXT++kLXgz/a+E6DTn/QyJ92qM3tSJ7R/x
 Ku91/AxjFCmmq9yqn7P4Rj2i56GbaH4ai8KTkTUW+rOi85eleTEm4ZgnUkZ67NUst1nV
 IRmKkCP1n+2XTebdBlx5DMJfZ/KxEo69jzomL1sU983+n3TaKm8TZ5iu9DYemb5lFJPM
 hXi9neVKms/8s68EMv4anfe42ZjWFCOLuXEjvYgUpyDxFDyQERaXAywIbWQHeMprgsmC
 4F8Q==
X-Gm-Message-State: AOJu0Yya+so+xztydUxYR6QtFVpCDQdO2VJtJh1QtXrJZuJpfoCq1Z4c
 cytJ1cKa/97dsPajIi1JjbUcog==
X-Received: by 2002:a5d:6c6d:0:b0:332:ca1a:a824 with SMTP id
 r13-20020a5d6c6d000000b00332ca1aa824mr5304732wrz.11.1700739775041; 
 Thu, 23 Nov 2023 03:42:55 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm1455905wrb.3.2023.11.23.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:42:54 -0800 (PST)
Message-ID: <b82c568f-1f3a-472d-a3e6-12e5d95015d9@linaro.org>
Date: Thu, 23 Nov 2023 12:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] target/arm/kvm: Use a switch for kvm_arm_cpreg_level
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: nJtVSTXVoMsi

On 23/11/23 05:42, Richard Henderson wrote:
> Use a switch instead of a linear search through data.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm64.c | 32 +++++++++-----------------------
>   1 file changed, 9 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

