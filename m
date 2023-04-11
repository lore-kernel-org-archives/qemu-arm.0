Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp460565ejc;
        Tue, 11 Apr 2023 05:18:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YA+zaI8gBBOl+ZhArlAUH0f4kWbGsCYgySIxAcQMaCLGYnSAeWEVj2YBxy1JwStOtXRNjC
X-Received: by 2002:a05:622a:252:b0:3e4:e46b:b168 with SMTP id c18-20020a05622a025200b003e4e46bb168mr23441238qtx.21.1681215535631;
        Tue, 11 Apr 2023 05:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681215535; cv=none;
        d=google.com; s=arc-20160816;
        b=BL8TRKa0A/XU+6mBrbMTbEljifv0dxKiG0GWX29umt/EtoZDEPQwqy8rdHHXV9zmBy
         1MbjCTIcB5lvM9rcF6OoIim7RgGWhXPCoLGxO5xVeO7IjiKXihtgRK+6dnGRdW/BhMVP
         uVs0d7JNXNU0ppV6vRCzCXMdZtqjLGil6IZqF6decMggF69DTnjXVvE/YgaEUlCHkCEu
         IzjAc6vKCVLEn1IXz1eYa60JtiX8M7NMWd6etaPG346mX0Ap+uQaDSqAyxH3gKOJKehM
         huKUWVi7v8TA4qIisHedYST5J4gdpYcddX4CMJTpgPSeGhPakH/XLlYdZRPF0EKPriSJ
         Qq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HP5MQrecttgo8Q/nCbIrov0Z6wyRxSu3X7zSWdpQ50g=;
        b=Zo2fd6kOoLFPiEAVxl5p9HmuWOpGQ7ZdX9JTIXjMWXRVeaXXqziBKMHSvC8Vh6nJ0Q
         10k0Sg/Bnj6LEcmR1Ye6xKxbg8Cy3v1agdQfFz82pySO0CP/eWRwDhqsQANx+Tm+h7kH
         BuGRIYHm7q9bn193ChC4XjzIfWu3nWVs6hLh7bg3i+t67NKucwx6CsEd6gxLWag91kCg
         CCR/04XdC1oPVMIgmkbhCIdZhUsi+h1kohSdv1uFR3U3doRVpupvY3PW3JxrjMFB9wNl
         f5e7aE+IYJUa8u5xA+Qh+zUX8hA9L6EEdNunMaYmB/htGZW1FTIabt0jrlcNpUGIDnaw
         k2NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C6DM48Xz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020a05622a110600b003dc38b8676fsi9392899qty.168.2023.04.11.05.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C6DM48Xz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmCxM-0001YN-N5; Tue, 11 Apr 2023 08:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCxL-0001XW-Hy
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:18:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCxI-0006MC-Ug
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:18:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id s2so4072325wra.7
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HP5MQrecttgo8Q/nCbIrov0Z6wyRxSu3X7zSWdpQ50g=;
 b=C6DM48Xzo5mlVWgDGLfXEBYqKZbLe1EC7UPJJmkhTUlsRxKa1Y+ubjPPPruFP6/Ieq
 +muThMOIltsEIGkwnYOL4olNM6WqlQAAJSOHzgtZoXct4I9N6G0Im5tnaEVjrPms0psj
 Q2MqaqEyKDiM0Gvqzh9NKBEXzqzo2+yFeuJ6a2R5E+E+XyczkiPRAeRG3ZMOIPsoCIur
 xTOlsNLYqD1JMI1C4tsTSNT8CPic/xpMkispmlKEKP9e2+GLglelrfE/v6obrEQj7fnH
 aJLKchWaDJh2A/7KqUzOL1UHLno0ddavyrUj7CtoKqCa9meI6hW8MN99Nli5cVmALcDl
 vdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HP5MQrecttgo8Q/nCbIrov0Z6wyRxSu3X7zSWdpQ50g=;
 b=NfxPWGvX7F7OTPGq21e5pCUoUwgQX4DPfpMZMfx6b2i57dZUU3+cjuHllepHQwUIxU
 tNkyon5On6J4CNfQV0GSpZFZ9v0bKLzrqzxVZ0x8aBeDH7EqRvrG43GVH6X8ygzXkPK/
 FSe32/MiIOW1gmq/bPnl3Tv7ibc1WKjxGynkvMMTodKWcs1rNlhd1w8w/0W/v8/eNnpH
 88vEVXsGPRPqopiC4qJUiI6VTy40PVhbkdk9mZbgRz0Z4ENeq7MFF3ixWmzf/0YbEVbz
 pHiWN2q12W5w7OCKbOjm8HuhUYz9ehR+2ocgFm2Lo9hg5R394f0kOX49tb1kEtgXNDaj
 HC9A==
X-Gm-Message-State: AAQBX9drHPi31B7igvK2IDOJjxDKPTttXV+RHFecY4fJi9ULhXydZ7uP
 yxoYOd7owrQywcT7Sx7y8hwvfA==
X-Received: by 2002:adf:db06:0:b0:2ef:84c:a4bc with SMTP id
 s6-20020adfdb06000000b002ef084ca4bcmr8803309wri.19.1681215515257; 
 Tue, 11 Apr 2023 05:18:35 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm14467948wrq.39.2023.04.11.05.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:18:34 -0700 (PDT)
Message-ID: <4932113d-b270-4f83-25e6-e08004c37471@linaro.org>
Date: Tue, 11 Apr 2023 14:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 25/42] tcg/ppc: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: KhmnAxa2h9u4

On 8/4/23 04:42, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

