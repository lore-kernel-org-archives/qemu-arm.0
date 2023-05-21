Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp624314ejb;
        Sun, 21 May 2023 04:28:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rFk4Fbtg9Jm16iTxb2uYIVvBAAoqW3L951FMXUbc5a/dx2IpLcnxrkrmsfc049+6IyKqA
X-Received: by 2002:ac8:7f4c:0:b0:3ef:3349:99cc with SMTP id g12-20020ac87f4c000000b003ef334999ccmr15118683qtk.5.1684668526637;
        Sun, 21 May 2023 04:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684668526; cv=none;
        d=google.com; s=arc-20160816;
        b=HxTxWyHnrdlHt6uvvYs5UtQlcfPgKi9fG/Bc5QGm8ub6Uhepc6MKjKtKHM/cKMS5uE
         9sfRrel0cz0TkFAY1Ho1oT93coGNgr8z2QjzMEG9vtF4drTGlfly32vUT6yXNfdht8VT
         5RKuXpatXVeo0E5ZtfC8Fo2Xh3cd/qmOvzTv98Ac/zU6n4Kztb95wu4TE3+jjCVwBVHe
         +bd7768oPnZsuZXAWSGVPc/WRXarMIzI1x1o72YKNSj5TlL76xYnsrVKO8xXiOElSro2
         f10Yh6wQRY5H3Mcjlp9Zg1IDhMhpfLVfRT685dyBk2IdBrpTEhDNBcYbCFDNv8Fn17QL
         2jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DeJ12vt/u8SonFoAcwj8dAeS0KwWMz1XvHMrYeLsLbg=;
        b=zi2ZyZhV9bbCzQ+mqtJgjxN5o0uAmf4ubyrxKTLPpX2Eghb572Ou3PU7SD7gtOPfxp
         T49utgcjoLfdnhB40PJ9fq/3cOFgviTaaOrS5R/r+JmyXU1DCgqFqkFVXWieKDXX3spO
         PHFS81392zwq32vo76VhxMZx40Wps6qoF23gQGgy44/Kcxo1FAEGsdewCWb+NF7VYO+1
         vG4F/ys1MwTMduC5B54PuBMkd0ofimXpDO1lGEtzxm94weqMS7J5yyfa1XnRx30b1Lrl
         +V19qDSIUosH3iK9xvBkrRfg2EHnnQzlTY6EO1BQIH13rRFoinmKBtDstDB+iNafaenX
         8Ozw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gs0y2NR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a121100b003f53c682d27si2289552qtx.775.2023.05.21.04.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 04:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gs0y2NR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0hEl-0000b2-Dj; Sun, 21 May 2023 07:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0hEk-0000ad-6C
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:28:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0hEi-0007Lt-LE
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:28:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso3090662f8f.0
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684668505; x=1687260505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DeJ12vt/u8SonFoAcwj8dAeS0KwWMz1XvHMrYeLsLbg=;
 b=Gs0y2NR/yhCPkQ/VfkAA6hxs/cXPGPkIQG2sM8+kRAJMxhZFjK98z4LQnLGYzhtmvn
 W66DwkN+F6HmWy4DAQNmya7ett0g+7wLjZRDfpSDI8XlTpMpvxaGaoqzReU8cztn2jlH
 qgLeq7s0uJ2ohB+BD4ci9vg2++Qzi/UPYCgwpPObBuzbpdn/TNPFRDMeQ5V96GFpk0x1
 YQjEJKqbW33PiKfI/yVy2kgPd61UAkvigbazvD2QzGyCO/wi81tzkyIjWrRP7nV+wyfN
 qULp+kSELNIIOOrnORIihK8UBVbRgimewKcSTI1x/LQbB3FMRcp79jBzQaOxEk9cx4fZ
 0jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684668505; x=1687260505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DeJ12vt/u8SonFoAcwj8dAeS0KwWMz1XvHMrYeLsLbg=;
 b=XmLePTLVWqm2HNIMwKLicV9fzF1Ke++16iqtwVhK0RaNUn6/paTusJZNH4bN5cez8d
 uiGDq36/Ji+NjIl2Wpr673XwGIw/2/rZEeLp+SJyK28OkMu/0tavG99PaiQT5y8HD7Mw
 OVWFAeRarWGT/p97X52zaxLwAMvTezItcwb1DI1KvtjgSeXCq6ckl0XRKv5ikb71I8h9
 UApJSvqpu6jwheFcB6aN3X0NgqPjT79ObbWKxuo2qqwd3w3gkt24S59jtvelChh0JWJn
 szSQG1PBZ5SCodG/CR6jCln1rMUX7CAH2UdKVPXuRtV8vUBZEtCo0gostJoJr9k+VkeR
 PGbg==
X-Gm-Message-State: AC+VfDxUSPEQLcjJnTmSy4tfRUcINCO1ffmSY3TMKP4p0cM9SuN8LUsX
 +raBU0shzUgUeVoa86h7BxSujA==
X-Received: by 2002:a5d:514f:0:b0:307:41a1:a125 with SMTP id
 u15-20020a5d514f000000b0030741a1a125mr5865864wrt.12.1684668504972; 
 Sun, 21 May 2023 04:28:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a1c7403000000b003f42d3111b8sm4937511wmc.30.2023.05.21.04.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 04:28:24 -0700 (PDT)
Message-ID: <b51a6df0-b53b-c6dc-b496-0c320aad463d@linaro.org>
Date: Sun, 21 May 2023 13:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 02/27] util: Add cpuinfo-i386.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: vJIigocfnUAq

On 20/5/23 18:26, Richard Henderson wrote:
> Add cpuinfo.h for i386 and x86_64, and the initialization
> for that in util/.  Populate that with a slightly altered
> copy of the tcg host probing code.  Other uses of cpuid.h
> will be adjusted one patch at a time.
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/i386/host/cpuinfo.h   | 38 ++++++++++++
>   host/include/x86_64/host/cpuinfo.h |  1 +
>   util/cpuinfo-i386.c                | 97 ++++++++++++++++++++++++++++++
>   util/meson.build                   |  4 ++
>   4 files changed, 140 insertions(+)
>   create mode 100644 host/include/i386/host/cpuinfo.h
>   create mode 100644 host/include/x86_64/host/cpuinfo.h
>   create mode 100644 util/cpuinfo-i386.c

Missing F: entry in MAINTAINERS file. We probably need new sections.
