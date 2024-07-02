Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2435039dlb;
        Tue, 2 Jul 2024 08:52:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHZH/XkZZkeLiQqm3tf9Ufbk8MC6mlVdkyiDNv4cknv1awbzgY0lPhTjqM3SfvlqLy7IjFmnCggXnp/pCtJXc0GulhNYzM
X-Google-Smtp-Source: AGHT+IG6a0QcT/oYPZzNi8a3PZPLbKcEpmBhWj0EpChPB4BNq7xhCrKiy3Xn9uef4nCDXCG9lHkV
X-Received: by 2002:ad4:4ea1:0:b0:6b2:a091:284f with SMTP id 6a1803df08f44-6b5b71d7c78mr138452886d6.65.1719935520664;
        Tue, 02 Jul 2024 08:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719935520; cv=none;
        d=google.com; s=arc-20160816;
        b=cWkNuMb5wAHFtQKT/vHYqbQUofCfwCoVuhpQIlR1gPYiOtUiv23b9sE9alMp96sqwF
         5BLY0/okJr5gOZvXgzEBvTmwN5pwoZpFQ9KVlIecS0xb2O3FpfqJxQ7MWbWZm5flUKmY
         VNlp7sDGzCVvaReTwjqvaxNK/wpzDl02P1OVEsNqbCl160v2zNTFPmoUQDs+kHw/rlwb
         u71q+if4UKX+o2A4lN3C5LkJgGvBdN2D5Z5bleW9lhAL73bad2VP189jcG7uXJHrvCFP
         BbN+Op8c7KOvWgGySW1fmwn5ooKSiQ15pbh6xPXBi9P0gJGuW88UJ6CwPpVqZn9Qmnab
         lFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XGFCpeal+AJeTPFXfvST7Qrayc9pVZjCQTEoFN/8DTg=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=s6CjuynlItXWW1vXZUwZBCw2Lhtk1qMP4T6jAWQYIwSvCdJmi0m8/dsJbIXiGTcHh9
         BWeYhfghEu/YsXUiUcmkV2nkjAa7nlknl8HbTa//Ausqhu5K6fYmJfdLskdvm2rEGRLK
         UtAPaVI7vOHiZM7/8mayEUQ5V7IL7GQZOamVg/Pj5xKKMAdE6Ji7kmZz9XvgRJ8vwWoV
         a1hvPSfnQsEnUyvqrtCIp+NaC4rOwNRs8xO0ZNOEw2y++v3rxMOhb1+/mTY4Y0BluSks
         rPOtIznPV78hp5vRdLMlcac1fLs2NGnA2E1AUwyawY9Q5VXW5A67nyAMtM8Md7NWOaFq
         F3Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="giUFBcE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5f3522si106899706d6.406.2024.07.02.08.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 08:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="giUFBcE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOfnK-0005f9-Gw; Tue, 02 Jul 2024 11:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfnI-0005Yh-F9
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:51:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfnG-0001iK-U7
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:51:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42574064b16so27572725e9.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719935505; x=1720540305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XGFCpeal+AJeTPFXfvST7Qrayc9pVZjCQTEoFN/8DTg=;
 b=giUFBcE/jHu+leoy3Kmj7b1scNa0vnev5EW9+1bpyoZIRCfLFkiex3r7AwTQ++8GCx
 wMt8z/6n0Hm3gTBDFQwJooxqiPozFnSfUwlNULbH3e8MDitGL9muQP04krJPwb9B8973
 ThEKUxY7R2wA/v5pGzVvR3UR3/zGH1Qw/cxgL0bdCM9+LYGbLZg4BIhxBynR7dL/wQdr
 VkkEMVWiUk5EPdpDAHyt2xyiSPjBmlgIBY6JJyEbvwJaN+EnfLG8IO37prZMKrHv3Rry
 i5ovNNr92liatkoZAkMexRMhamHfVSuZtuV/Q9mfSqnyZ0H+ZfE9yQRCveWMYFlruYUX
 tmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719935505; x=1720540305;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGFCpeal+AJeTPFXfvST7Qrayc9pVZjCQTEoFN/8DTg=;
 b=aP0oF4rbMEDiRdkVUQOZd/ThoB6va3pn/vnqJPjhZ6bYIXe6Pg3LQ5ZIqJ/6N2U4Bz
 6wms2CSkLjeW0xnzJcEZ7E2v79dAjY6gAto9Lugn0eV/THUM7tg7V32VxBPiP07TLwY9
 z5UTdThohp7D22DqpDsU0CqLIEWgzeOl1ddI3yP7bX505j9+y/0fbAH0vN5KnQn3T4OC
 XD5VZr5B4vfA+XDhLUhUxXg/wCdhr+ZzkvCmSPn+WTMvMPq+gYLiL54BsGo/zWApsKQX
 PGePDBOgGCyrZj8QshLwl0sTD9RlumjOjXmVCUX1xnpBanGxwL1s/GpoHXNEwy3qagdz
 49Ow==
X-Gm-Message-State: AOJu0Yxetlfp8Abl/3IZUS1OMSwwIyiTg1p+aO5NmaiS4Clul5Vx+XSF
 wOwqJUz9HeBw4iRAv/+H0xk9dAzeQIjQfry1LkH8FVJlPtTmm9OpH3p2lG7pyu0=
X-Received: by 2002:a5d:64e4:0:b0:366:ec2c:8646 with SMTP id
 ffacd0b85a97d-36775724495mr8657476f8f.43.1719935504933; 
 Tue, 02 Jul 2024 08:51:44 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc4c9sm13594444f8f.86.2024.07.02.08.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:51:44 -0700 (PDT)
Message-ID: <6859017a-e2ab-4762-a853-aa52dba7a4ac@linaro.org>
Date: Tue, 2 Jul 2024 17:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Use cpu_env in cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240702154911.1667418-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240702154911.1667418-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Dn9VQypd/jvl

On 2/7/24 17:49, Richard Henderson wrote:
> In a completely artifical memset benchmark object_dynamic_cast_assert
> dominates the profile, even above guest address resolution and
> the underlying host memset.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

