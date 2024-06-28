Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp210501njm;
        Fri, 28 Jun 2024 09:07:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgJzzD0dQdoMerDDwvRByd9yuP0XBSr7phmpfV3VFIwXP2JGp/9GLVqm91Ky4SPAH8+tDxtD6V6Ey2AZkghE4GjaNjDRyI
X-Google-Smtp-Source: AGHT+IG0CfNrG9hsEVWzvUEZjCb0yQKkbZWlPEIt6ST720+NFFd7rqufF6B0HcrLsVS3XE7DWpg3
X-Received: by 2002:a05:6808:1288:b0:3d6:324b:ddcc with SMTP id 5614622812f47-3d6324bea96mr2160945b6e.14.1719590868703;
        Fri, 28 Jun 2024 09:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719590868; cv=none;
        d=google.com; s=arc-20160816;
        b=Vp+CW1UaBeaDbq2Zsypmn4cXtsB5n1wDd0Wh7DbhZVIqtKbv1sQoN+U8dMvpQio7KD
         4LwfPA8sOzG2rNCunyu2kj/k22AkBpDKhzLHdv51FKdMYX06SY6WQ8FyNEE/lded+iJk
         5R5BBTp4EoKd11RBa3R74eO3QBfC780Gi8eYpnprwerQsAOdHfP9F28f+2I4pM76DbYx
         ExVE9sFz7quiJGknl2iVkt2rNQ693UQRZzniWUt98aQBDxeQYu2e4fJ0GTfuDSfL9DRX
         kWpxmlIlr/iUhj/Rs5pkzWeXbnkguNQ/cfaKXp2IIZ9NwBdsV/oddGCYRBdNeAWj+b89
         RLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ujDxA/RukhAIPc4v54vTeVTjoZ5pFSlafjqAMJ1sNJU=;
        fh=UTAYnh+6j1KhrO5M6ogVN4OJArO8xzZjL3Ht2hzgHDA=;
        b=i1IKsyN+amFTRfKAhTR3/sGk84pRcTfM8QuL7nA1/83d8Ib8ALhfJpfva9P3KJOfF8
         vLX4UN+5qjTIjaZ8lB8NNeKi1ZbsBWoD0lfCVgND+/nPwuQ7dyTz2vxOsuF/0+qenBEU
         oTpaehf/j9OZwAIBdKpVYPXteII0at8kW3Ags+3BCe8BpZf2NTlFSy5zC9F0EWf8iP8v
         Y/WtPz2hvkiPK0MIFx+uS9Wh4hhFkaRpDJII7WSps9V2s5iiriAQrPcEXLbeFhyNaKLM
         ODnp21fn+rG+fK3zaQKTKLzPDZFt40FWCKz1WSRl9nfOk8V+lDX+mLW5PZp3TQ7N3VKW
         V1rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TpLNjU91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f9b29e7d5si371101137.807.2024.06.28.09.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TpLNjU91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNE8H-0001u7-UP; Fri, 28 Jun 2024 12:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE8F-0001qT-GV
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:07:27 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE8D-0007P0-Ae
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:07:26 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7163489149eso577674a12.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719590843; x=1720195643; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ujDxA/RukhAIPc4v54vTeVTjoZ5pFSlafjqAMJ1sNJU=;
 b=TpLNjU91eboBjrLf/lBS6hr/oZhcbkYhfrigsVdq4svomO1SGHdO5Xz9KzpIfHEUZ6
 yXsl5Q53ZERxMXqfI0ly8YEf3Ii0sEPOS3YdNOy7aI1YjNv6wIqdDPqZfrCBWBpOCEfp
 t8pRATDaQXvqgPhXJ3nVTGBfR0DtlB8sGLzc7LlrbzWkGTCyXO377NLSGLMDku9vU6qf
 5VwAxYFor2mRw+6tyDTT7ZX/lWO1bVPNaEUljseKVZPl2QakiL7UEABFRh3U9tr6Px46
 sXyZ+k5xZX9uE9AtS/2c8n9q3c/xy72lLXMJzqc1gewDlA8WoGc6lRVQkPKEPX0Lsc/A
 vBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719590843; x=1720195643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujDxA/RukhAIPc4v54vTeVTjoZ5pFSlafjqAMJ1sNJU=;
 b=OWs9oULgxN+FsGaA7DBmPNDav7Yzg6GXUuReKndqOEcY0y0lWk5GztJpubfEgfHs3N
 MCjztMqJLfDzQgKIcKAe4kumgxmdo4lcjY+N2TITfrbS8Ruol0ZXj2ogfgq+o6j88DfP
 6V75MQ3GdpBqbtc2MXE9k3vlzuM/mHHD2X9ygX/gvP2gZPznoquy/hKGm4Kdf+9hmcCd
 9tAOn3CcVI3G8JX10JjFh9V6pBh/INnpnORAL1smT5Ei8/qAk0jgaTQdtfwX4VJTp0ZN
 5D2+X9unxQdNxLTUcpnP7wXbQ2DbtrCuTX1pj8j3GuZtiF5J3YOfXr1Ol/i1XwWpugWg
 9Ftw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtb60rvhqYcalti1do/DaqMnxVrcd0w7WC3M5X1yuhjG83z9UNYWGJeyr5GXlSIFzpHO0Bf3M+RfjZBEALTcxZbSxc
X-Gm-Message-State: AOJu0Yx9gH0KBdmLzRbonXxGEwA/EcJ2NLzr3+H2f1OMJKwTjMLM67L7
 Cj7pwHbnStQ51FIqSQcVpzIO1CMUSSHcBrUZ2J0qpGx426Xbl4ECAob+B36oawg=
X-Received: by 2002:a05:6a21:3282:b0:1be:d7b1:2869 with SMTP id
 adf61e73a8af0-1bed7b12b8emr5815742637.56.1719590842660; 
 Fri, 28 Jun 2024 09:07:22 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080246a92asm1782563b3a.47.2024.06.28.09.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:07:21 -0700 (PDT)
Message-ID: <3384e8a4-bd60-4d66-9c45-bd04de45af2c@linaro.org>
Date: Fri, 28 Jun 2024 09:07:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] target/arm: Rename FPCR_ QC, NZCV macros to FPSR_
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-8-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: 5ZHdF7vqRUDJ

On 6/28/24 07:23, Peter Maydell wrote:
> The QC, N, Z, C, V bits live in the FPSR, not the FPCR. Rename the
> macros that define these bits accordingly.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h                  | 17 ++++++++++-------
>   target/arm/tcg/mve_helper.c       |  8 ++++----
>   target/arm/tcg/translate-m-nocp.c | 16 ++++++++--------
>   target/arm/tcg/translate-vfp.c    |  2 +-
>   target/arm/vfp_helper.c           |  8 ++++----
>   5 files changed, 27 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
