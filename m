Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp574610lft;
        Mon, 20 Jun 2022 10:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1ePIDH789wNUyv80t3nxQaE53Rk4LKlQ2QQctO8agXvYmYHjjVpUMgPQFzHIf/6S+QGy+
X-Received: by 2002:a05:6214:5705:b0:470:44ef:822a with SMTP id lt5-20020a056214570500b0047044ef822amr4562941qvb.89.1655744965884;
        Mon, 20 Jun 2022 10:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655744965; cv=none;
        d=google.com; s=arc-20160816;
        b=DAosERMheldBUGdHcE4Tkzf9h1JvyjXWIVnOtduAwIbUkqeoN2ze10FLLiO93TAW3F
         YgxwXRsqOgR8gMe2/8cMsC5qYmP1DqGQ7s5sRiufGRgIYjtE6yjkjcMjLs1vXGr9walE
         MxHwHy1iNCnmTrqjir40fb6WlNrqMMnfBKAmQVZ4jyZW4gCUa2WN1xCv2/bveoMlAOpY
         qoyvTRT2rllG06cvTYrsxiC57A//f0sSUFM1k1vEQDPow3u5s3z0W2dr75FZ2uGOPjTF
         VDCymjQsyCOJ7FkgVusFui+wSlS2YgfUVsGNyU9fo0OBKnJxI5Zj3zn42wW/uMnoTS9r
         hQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sIgIaBMmTDZ1A5XjkXM+UibhDNB7KUfn9ji4IqYCG7k=;
        b=KCNEBgV0jqKvnT8qtQYguGvYzENauMMyMYgcZTh0aJ222a/mw8oYLxW9lNyaStxaUL
         VMGNIKQxwTxYuxCn/a8v1wBnpW7XXhleU9/YKoGemXZguuHm0k9Ee/67QfUo8f+KoAUD
         MNUscp1I+/sC4VDANH0S4E2dfyHcHKrA6/iFX3wYFTLkSBWPrgLTyKZLSyuMb+xxjmbI
         kRx0FSxRxeHkCgpRy6pzgVW/6KX+CqAxfSmdcBMm2W3LuXDs26z5App4tFiCsTPgGRnA
         E6ORqcA+WDDco1Yklpf9qycV98FCJWvBAl7SjeaDdlrTn0qJWPBJWi45TAS5spvTUVDy
         lyBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohNgiGwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020a05622a059200b00304ecfa400fsi8172954qtb.366.2022.06.20.10.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohNgiGwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ktx-0002Sz-Bj
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Ktk-0002SU-92
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:09:12 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Kti-0003LU-LF
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:09:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id i64so10772456pfc.8
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sIgIaBMmTDZ1A5XjkXM+UibhDNB7KUfn9ji4IqYCG7k=;
 b=ohNgiGwICYRFS9ezx+7yeSc7MpIcTdTu2V2SL47dzvZosh87fBWbru5l606M/iRTgV
 hijPUXeKw2H8x+/5lYd7BnRNCQPXzVrPyxFDsbhSE4AdjU+vJV7Na2VUHN3pf1qhlijQ
 Gks+9xsE4SfGPJxfLQRv3Y9YkiQIrUZ0uEGsBT0wK4E1uM4IOg0uovFLZKTLUM1dDqAP
 7EzxhI3+EOm/4bZSDDana/rOoyZMdoOgDXRL//aaJr+cKoN+AiwiXelwSgbM3qOypoNy
 BZ78r3x+S0FAuScTvbfVQpGAfJR0d8zJX3WpTQzHnzVV3CiwoLq2kUNpPqjxkUtGUHoO
 iM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sIgIaBMmTDZ1A5XjkXM+UibhDNB7KUfn9ji4IqYCG7k=;
 b=V5pQKdss346TXorcilwcU5wCoVIhSrCc2cPu3dUOl6IQ+G5KwcAInNcG8i16oWODmW
 rTHLPQJ6DlxqTVdCQ0TZDT5sa5gc1HwU/qakvd5IFam94G/swsvO3fpN79bja4GQ7V/s
 da7gQvYnLWdTV66hoDPm2xI7c67gNv3zPFKsoMplROFX3bTz2KR3yj8ufkVIVNcU4NUC
 c8eNYPTy3a2KpwqFhJXjx5IA0Fnsm7RwMNQWOwcjDxoKU9I+7C1wLiJHu25ldqmCKkSt
 M90iY+XWMZb2x3RiH7UUHHyxuv+NHRCQrlFbNzAsBnzlRPhhSheXPqOBoaHcKgzArmRc
 EV2g==
X-Gm-Message-State: AJIora9Elf2xVgBIE6+lXBCMi+Nz7aMBA18Zi6Z0ugvfWSZvDnWyrfB2
 9H+q9KzArs5LRpriqaf1t5hwZA==
X-Received: by 2002:a63:5b42:0:b0:408:8710:13b0 with SMTP id
 l2-20020a635b42000000b00408871013b0mr22867807pgm.584.1655744948895; 
 Mon, 20 Jun 2022 10:09:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170903120400b001638a171558sm8995795plh.202.2022.06.20.10.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 10:09:08 -0700 (PDT)
Message-ID: <1fefcdec-8707-6352-0300-89c0fbd02352@linaro.org>
Date: Mon, 20 Jun 2022 10:09:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Catch invalid kvm state also for hvf
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620160819.65191-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620160819.65191-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ze9gs+MtH+xS

On 6/20/22 09:08, Alexander Graf wrote:
> -    if (kvm_enabled()) {
> +    if (kvm_enabled() || hvf_enabled()) {

I think this should be !tcg_enabled().  No hw virtualization can use EL3 (or M-profile), 
only full emulation from TCG.  There is such a thing as ARM on Windows, so I can imagine 
that WHPX may make a future appearance here.

(MTE may eventually be supported by virtualization, but it's not there yet.)


>          if (arm_feature(env, ARM_FEATURE_M)) {
>              error_setg(errp,
> -                       "Cannot enable KVM when using an M-profile guest CPU");
> +                       "Cannot enable KVM or HVF when using an M-profile guest CPU");
>              return;
>          }

You can get the accelerator name from

     AccelClass *ac = ACCEL_GET_CLASS(current_accel());
     const char *name = ac->name;


r~
