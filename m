Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp584531ejx;
        Thu, 1 Dec 2022 08:46:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Id6qRSwfKQrToECskgnyWvZkyAIxWKg5DkU0ibcevKo/6/DVkBNUcHIEkdCwwYgHeFZJK
X-Received: by 2002:a05:622a:1f0b:b0:3a6:8825:8c7b with SMTP id ca11-20020a05622a1f0b00b003a688258c7bmr10677144qtb.281.1669913207292;
        Thu, 01 Dec 2022 08:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669913207; cv=none;
        d=google.com; s=arc-20160816;
        b=m+toX7cTwOvUZgxR3RYg21/ThQsp50iYZYeNxlVT0QA+DGhBSThNRNbTNwrGMacLEX
         8Xdp98gO93FwctwKAZ9+ilKmHa8mIZhybUxtxAx1+WQIzp17ZH0k20CO/U/LtrJzXS9L
         Xw3w/VMWwr3IX/8zIMrcMgDU7nWdYvenYAE2XFiQrBGXA03xmmQY1pEGOtOcCXKkYtgc
         Jnm0oLFKPfR/88W1DCAZ5YBgpUm1DrPitnFUHJim4PJj+dd3CNK1blzpD+4e5/gWtlFg
         eMHOzuHyD3gGw6V/tYp+VSEidAgWnVqz/RzQGdf04JUkxf0ofmi8PoOSwcj9Z21vEd6o
         PxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KDgaa1VEMSKG1UJpI9DS8/truk/+NTWchC1ocE6yBHE=;
        b=hKkbgm5rnLFc6YqCjmr07QKDODk4eGWTOm9HOhxrfBqZoiVhdhBkji1yqrK7CisugK
         hZR8fimb0SWI31B6cIhJkH540+Qw/6zRyMqOODRX/HPSAe4OnYShLSYCtrvh8zLKd+ST
         qYynQpNujEGIJSf/X4kZ2QtfqyD+Y+VQgp+8R2Ln8HX7E5F8enwhl6soBCyAdboVPDYw
         S6hkSk75ACgvCtWt+f37bKfmw+dAI2OGqcRTDmTWnkoXEeOH0vS3XYs8ReWlBTR5jMoq
         FjZsfu5Zn+5sjKOoOyLupVwwnyfiVzd5wwKTkPm23naYF4u3fS6QZRVAk7bBIHT5Dk7S
         BABA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFaBLdT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020a05620a075600b006fc95f0d1absi2412189qki.262.2022.12.01.08.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 08:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFaBLdT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0mhf-0006Mg-B9; Thu, 01 Dec 2022 11:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0mhc-0006L0-S0
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 11:46:25 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0mhb-0008Rn-BI
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 11:46:24 -0500
Received: by mail-pf1-x435.google.com with SMTP id x66so2406049pfx.3
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KDgaa1VEMSKG1UJpI9DS8/truk/+NTWchC1ocE6yBHE=;
 b=UFaBLdT22520XsGhaET5G/cQR55i/jN0byQTAl4+QhUz51K6Ide+wetINaQfF/6Q1p
 4CFjpgv3CupWzpURwgUKAiGJha7ahCxuD62ySwnnpaTwEaKX/LcaqsYY+i90HomYPC71
 iXYei93GLMqsbRbUPmlqVVxy2fbX4Eo2vTc4Be/+7WxAeuxhKCm4bsUE5iBkUlENGBEe
 9gorS4U1DBSi82ogpxX421ZyQ5AHh5faJVjedi48X/FfW4ehQ/SdpMvSPtHFfdYnaAc0
 VXrIlfpmvBfRliFZxC3FKBO9/WIK4dy97VwrKiDeMYs8gCIB2PKlZYKhy7jatQ5XnfA7
 fXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDgaa1VEMSKG1UJpI9DS8/truk/+NTWchC1ocE6yBHE=;
 b=liu+X67Bt571KbB6bhaBE+uiyLX92BCcWoNAMAyymcXqCVh9e0aM2SaPlfN9/bezc8
 nQPjJnm/ML+uut1egxtRSce9bt0/RPu4YAJGLT/OsrzrrRMH0p5P29Z6UgHWZxhMmfbY
 JmIDFtz4k2nt0fydfCaaVe2VFA+nkLKaIaK7QCkdeYRsuxVIHETDcmdJasB279awrF+v
 UnfIcpChX3YR1GqlzLNYoSNZS9+DS3Dp5XPBphtyZ5Py+gPzTl6xJfJS5LUpwmH3rlb5
 EODHMgoLItbVIsaY25gqL5gt1xhKSzNU/3JKWiB30G1PhvFGf+VKLv1oTJ73r7tXN5Oc
 s2jQ==
X-Gm-Message-State: ANoB5pl7p0PwXF4JC3bsqCvHlFcZi3MJs+vpePpU7TH2rJfAIk1nnO9P
 nZ0NlXi7Y0FVnL+wGoxw5yFKW28PlQXUHtFu0FGRNA==
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr42163913pgl.231.1669913174818; Thu, 01
 Dec 2022 08:46:14 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 16:46:03 +0000
Message-ID: <CAFEAcA_A45cj8RA03U0jOfawZihSp6WgSoaQ7XbGzxs0hAtkOg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N/Ki9DPiHVOr

On Tue, 22 Nov 2022 at 23:25, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what the upstream kernel currently
> exposes.

Thanks; I've applied this to the target-arm-for-8.0 branch that
will become target-arm.next when 7.2 is out.

-- PMM
