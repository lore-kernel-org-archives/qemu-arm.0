Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2076130lfg;
        Mon, 23 Aug 2021 10:45:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYXu0kmdQP/Dh/u6nU1DXp2B8c7gaStnbgjK4xNsytXeexyb62q57dLb09juVe4FZ3tCgl
X-Received: by 2002:a92:d211:: with SMTP id y17mr24014492ily.93.1629740702615;
        Mon, 23 Aug 2021 10:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629740702; cv=none;
        d=google.com; s=arc-20160816;
        b=SxI6ANq7n+BD1XzAbX7PURz0HN5JlXQn1EEkF2cIAjEq7EOhIXCxNfNyT4AiV30eec
         +q7e4xgOuz7kR9uOMv7WdaP5EzxcB0YxplS4gtknOtFoTnq5Qc+W2ox3eaJijKpaIewI
         Ykxu1WzIa5lZXiBOWvEu5jh2vDtQEVbTWwnwzQQyYp2IzSVXcvLEgHz/1XJyvEfvstIy
         tb8wjRM7qY7FHHnZ35YmaCMOh54dufuxDjkrHZ8+j6QfiYhdY276887Tlej8X8CZn577
         4t8OQotTLLwWQkHqPuKP+RdJFS97UXdDv+43vsoqfhaMLvGAsTi/Pd7PwRAvjh2EZlAV
         9Epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wTPS8DSspcMf+qN4Gh7JdUXnOvM7wY3EIUg9Sp8iZOg=;
        b=o6Z8nu/WlSBoy7AH9XUk3VOPjNpoMBb8gUaAXr2L2yJNzEsmB6Z57dvuWzdfFX0Ss8
         8VqeqbdEMlcCwMu94yi7/Z5m2gEf1qwdAsHnwNU01zvZPqq9cEHoEMGie0xo5XIDVUjw
         s0Lsr9oRwtHFTR9xgaeEeTSMSE7a7NxyyvSYDXHW19gwkbdYGs9kUpqmKiDB/xyz//MF
         LTOxuwGwBF3uOF2WXc4aWG55VxtgzBqTECtWwNKVGTtvSKSmqhH4oty/Iv34de/a3v+U
         Hh1jPzS/6Wpg6NIvDjqO/1JPUGNKm0VJ39QfLSIyEbP1QRRHGqtZS37IpKYlJCpNu9SL
         XH1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w7amlBW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si6403214iow.31.2021.08.23.10.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w7amlBW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIE0L-0006tj-TT
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDyh-0004sq-UD
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:43:19 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDyf-0005Ol-Al
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:43:19 -0400
Received: by mail-pg1-x529.google.com with SMTP id q68so237104pga.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wTPS8DSspcMf+qN4Gh7JdUXnOvM7wY3EIUg9Sp8iZOg=;
 b=w7amlBW8ApVVA2g+WLPgRsnQXu8jYnlpFE6b1u0Udy6GVdU3kgBCA8xr7q395EOBlV
 7IHMlAwBaQQmLyWYji64jwslZ+oGasdAqbbxLsjscUPFBPZtk636XUhtioZCdziUxyaA
 pk+HlzCxWUqJAt5Oj5p799saNTXJCOiVvzhxytNhfWAczIxd5MyW1Q8irvto2lPiP3uR
 Wto3Cco2RjY7dU9bDFVouCbDDIyTfRKAU1ADEJdvS0NAq4Ly24+aP4dsVhAZUQ8Mpfpn
 nuXHNhm+L8duuNoPWZgfwfv10NBk7baB9T0dve1S5SoPQQzWkOfZ8c1Vdado0IMkAfeP
 mvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wTPS8DSspcMf+qN4Gh7JdUXnOvM7wY3EIUg9Sp8iZOg=;
 b=IOfpCtLGi43WOBfRQ3AwtUV3V/Dnsp7J2xMfLyeTQxmHfxi5K9Xg+fYpbG6ac83ApQ
 dcoRvOdq2DwWWyKTxIyAnZllhHCbQFs69viAtYiXW2HsJoTldwrPVADxOlRy452SJBf9
 8NcRj9cYAFubfj1PV4Z0/AKFGnsO5/jNW5M4cboJICeeMjpN2zXh+KpMnqoBhmu5Ki45
 gklRc2CzBtQfHP8vUDl6wy0EMPTODeGgSX7WpD5Ws27NeuV0cnxhZClZwWhPEKX8RNbU
 ve4cS9brg5SIuv0uy0WUznQTGcTq68HwQ61No2BCGZYHT0xm1CvxNMTN678dhnnj4qwu
 bJJg==
X-Gm-Message-State: AOAM533A4gCSHMcVVi6qKfvtwbXMmON3ywxQsfzi2UJyuDTtHZ1SCxu2
 o6XVsUWfy//3OzNnaLj9Z8bfvw==
X-Received: by 2002:a62:4e09:0:b0:3e3:47d4:ed69 with SMTP id
 c9-20020a624e09000000b003e347d4ed69mr21867853pfb.6.1629740595792; 
 Mon, 23 Aug 2021 10:43:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm15172502pjh.30.2021.08.23.10.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:43:15 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] target/arm/cpu: Introduce sve_vq_supported bitmap
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-2-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df8ef777-83e6-df8b-21ae-08c37eec0585@linaro.org>
Date: Mon, 23 Aug 2021 10:43:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-2-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hihMqex+F0Ii

On 8/23/21 9:06 AM, Andrew Jones wrote:
> Allow CPUs that support SVE to specify which SVE vector lengths they
> support by setting them in this bitmap. Currently only the 'max' and
> 'host' CPU types supports SVE and 'host' requires KVM which obtains
> its supported bitmap from the host. So, we only need to initialize the
> bitmap for 'max' with TCG. And, since 'max' should support all SVE
> vector lengths we simply fill the bitmap. Future CPU types may have
> less trivial maps though.
> 
> Signed-off-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   target/arm/cpu.h   | 4 ++++
>   target/arm/cpu64.c | 2 ++
>   2 files changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
