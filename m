Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5279422ejq;
        Sat, 13 May 2023 00:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MypzeMdnVUaCiVu7CUYbDug+WNwtDIBpC4R/EgiMNI1OfnvRmbV9EhZTyNb9VAGRqmtPK
X-Received: by 2002:a05:622a:1d6:b0:3f4:e7e4:177b with SMTP id t22-20020a05622a01d600b003f4e7e4177bmr14445205qtw.18.1683962943818;
        Sat, 13 May 2023 00:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683962943; cv=none;
        d=google.com; s=arc-20160816;
        b=Dw5b8HcGmI7k9e8MX8YIQgJMx9wVOyJ9onlaCfHp1LNJB9s6VJEhRTDxQowj6BDOla
         /10ye3AHoitjlvRDkVxG9GIw1hLajf858B8wyrP3WiwpcvhTcWEMwepXNLbPg6teqmha
         NxPivpuBUnwHkMTU/KIjgXmPsGByXaeoruSMiVcT/A6yDZqPih77onODfngolOnLkyLe
         3JNwypc8E5RuAAV7szP/kEjL4Lb94tSDh8WLwfcgT/fTuGKp3tVkQTOVMZEoUOpHBQMb
         DFTyymBXCqXOGbKLgIkAYicpyhw4r+F2B7D4qdsU7m88i97JJLJP2+S4uSitwILTgTwM
         KbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zncqbf03MVILwfpp/8NJH1jTZZ3YN60ThRbZBWVmNko=;
        b=qDPeuwfxt2qDSODExNM6e3yaJnBQ6YcamIPAnnKBm+hblRbs1pAYH5EWx9/xnaAdg7
         J4Hr5mwTq/cS0WnxnlTlm0O1BLOvQC5cbAJe5/nk05B3WRBtTG6BP+uWcPoElQgaoEeQ
         bmq/OfJUPuUl2p8h7m7gnevOeU+jKRXW1cU3Ns5XMpeqFhkfcntCPbG19fusTSxBdv9L
         /mMNBcuptV/YOu+iviEa2u43ltrpCnFqNFhlnR90mek2ePmOAmBrHozJ7ebCpkEsF6jv
         nBPMPcFPaS364rviyhMc2iDgEdXj/iGEJ5mXuLAEpwEnr3nGIzXRbrI4N+LwpsUfxZyV
         9SGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iI0ZTlyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020ac85c4c000000b003ef63934b9csi6550110qtj.750.2023.05.13.00.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iI0ZTlyh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxjgY-0001To-SR; Sat, 13 May 2023 03:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjgW-0001SX-S9
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:28:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjgV-00061C-EW
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:28:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so80037565e9.1
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962933; x=1686554933;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zncqbf03MVILwfpp/8NJH1jTZZ3YN60ThRbZBWVmNko=;
 b=iI0ZTlyht5IzIc5HojXFK3RSRSH/OKS7+EUh/FS7klhTT2uaD4/cInLLqQ0WaPlrGG
 yA5j8+S2MQf3SLGbmzboy5w0FmsHMRfK4jUgPjNY6V+n+0qzyq57cTvuAmI2UuEe6hwG
 3T+t9NPYUEv/EKN1CrDxm40JdGCqZB+LoBVDSzpB3yku2EoI0AKaqvZVLXrYgH32Ri4i
 9g+uyX1nJlf33Dsr/aobk62lrelqi6qSlPH28CTmIKFwFxDPknQn63syiTvIUX0Um7cS
 uEYInu6JFA/Jnk5HouN0Wlt0IWVSxzjuiqrbDUSmh/3vTA5SCA8AiA/5Q14jAq+8aUlF
 QTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962933; x=1686554933;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zncqbf03MVILwfpp/8NJH1jTZZ3YN60ThRbZBWVmNko=;
 b=Et0pDk73uoPY2GyWsT5O8It7odxj+5OP9ZloOWy6Kfv3FCUrK7GsF2GSskiOoZdh+V
 Sp6Aqfv+Vf13BbJl8HC8FGYh4zmUkxrS4wc9yMfbgZ+uShhRtFW8hXGr1F51TYCCpVku
 q7Bjz+SqtYYSIjrvDNEkfWBYGwrvkZSKa9UH+kAoR/fMqVjE5DOXfGYvFy9pktC2frxZ
 VtCHvRptakqqR5z+A7onPkAmqJleGsJwgjEtjCuX2j7qM/GfGgl4EzvfANL0Y8IasoIh
 gx7JFtjqvRsE2U/ktUWbl3e9gfu4w8S5uSqZMtprVv4nStZqaaM7I9N3X8AQzfvpLxr+
 n4ww==
X-Gm-Message-State: AC+VfDy2gc5msYyrGFxAenqUy5RsSNAZDhtHI9HMOdKBSWLkVxJNaB81
 IuYbmIR36ZLoO5lbB6ylgcf0OW8FHyYj9FN8VDll7Q==
X-Received: by 2002:a05:600c:214f:b0:3f4:23cd:6dcf with SMTP id
 v15-20020a05600c214f00b003f423cd6dcfmr16319413wml.15.1683962933406; 
 Sat, 13 May 2023 00:28:53 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a1c730a000000b003f325f0e020sm30692144wmb.47.2023.05.13.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:28:53 -0700 (PDT)
Message-ID: <82df8b44-3029-baf1-4b2a-f0522bba1c46@linaro.org>
Date: Sat, 13 May 2023 08:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/20] target/arm: Convert conditional branch insns to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3GzHr2cde1fU

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the immediate conditional branch insn B.cond to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  2 ++
>   target/arm/tcg/translate-a64.c | 30 ++++++------------------------
>   2 files changed, 8 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
