Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1197345ejc;
        Wed, 27 Dec 2023 14:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdYanAcw0Aiul1fIwKK/1wSoV6jYtGzoW1dSahtgRs1OmeMJwz65tMSbLHeRbq8sAdtTYW
X-Received: by 2002:a05:622a:202:b0:425:78fc:446d with SMTP id b2-20020a05622a020200b0042578fc446dmr13682013qtx.29.1703715828816;
        Wed, 27 Dec 2023 14:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703715828; cv=none;
        d=google.com; s=arc-20160816;
        b=a4o04voKXRdm7XIZvsJlqR6Y0TN+Ich58VufpnF6Px7w1fyF5OPxVp48cx+b2hpuBl
         mmdplRpaRqSq569FfhSQx/qGl6RuiYrljkh2fRASf99BHNLmF16eS+nfP6KXueN4Vuuq
         tmsaFJ501T/UUFjPdf82Po3MbwFGQwx6/EEc3TEmqrbu1VZ6fv/ieJqwFEbzwWkCOTzj
         2pYIGAuQT13Md1NgaJFAcDYntonYnrRw3tf26I88k/TLLlhpa943fRwUU7k37AQtAd9x
         nD0ac+4jvrnafhRyzrxRMSdZcxiI6m5a4YsKOKLF6yg0ussWosswLPT/Zt8ux+8PSdGi
         cCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1LTL4evVjSMfpAFEd57iHiBm/03GDdUJCNdVDH+Po9A=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=AFfllJ8/rdUEvD5YCfio3A5/K4X2Y1dN1xFDgny+19uFelSH9i1K3ViVTpfp1Bvx1F
         h5HW9ItMbbkldxH8h7VlJXS4EXcAIXir5j6JU0xXP7k7+sBLDh2e33lJgYpQQLSm6/iJ
         9MtP0XunILGNo7H5hz8Eq9P9J1z34VyJfw3oH2nqoSv1BObrhRqzF26aRmrhrMCDonDT
         qjjFBMXb/FZWLjNa3FwuFnj2Aphg9XiOo0dJGnBGKOxCMGlRlYQAihODVlE2APBI82XJ
         xbX8iDHPKD7YGYNphxSOiilmpKr+UDa98wop0V0Z7TL0m4m2qpREstxdCxgRI/GN+oq8
         hRuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KM/6wBtr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a05622a05cb00b00427e7adb729si3195832qtb.720.2023.12.27.14.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KM/6wBtr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rIcJL-0000X2-9M; Wed, 27 Dec 2023 17:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcJK-0000WZ-Fz
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:23:34 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcJI-0008F6-U3
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:23:34 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6d9aef87d44so761668b3a.0
 for <qemu-devel@nongnu.org>; Wed, 27 Dec 2023 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703715811; x=1704320611; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1LTL4evVjSMfpAFEd57iHiBm/03GDdUJCNdVDH+Po9A=;
 b=KM/6wBtr9w5ZsGBAZ8OvDcVRUVzvIHOoxuYrXV3vrM9bpnBylJYbUi0Mw90pATc+Vm
 USM76hSF1cADTMm8Q5SeqMPO4S9wRlVDjDYu8EPxLMKdXI4vslNgnscMLCiHvnBgA65P
 TU2zetarZIMFW51SIhvg+oTjAaU7tB+19ljbXLeD/xH8PVtp6s0rUcuMdrNqxIgLMLZD
 4o6Tt6p6DLkEucyNoxe5b3aBWqTCAYwQyrgO4Ya7U3Hu/bNxDdlJedsruq1f1Whp2moG
 z7QdP5eQmm/7Pv69oSzy4XwXwnb7hXUnYmIc1S3r3OwasUrY6pVH159l7oisq1vDpBtE
 z00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703715811; x=1704320611;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1LTL4evVjSMfpAFEd57iHiBm/03GDdUJCNdVDH+Po9A=;
 b=ewErFKRGiabNC2NpaTJfJOkWAeejvF370lwDqVgvsQ/+bfpq6q1N//ieI7IY02W6+v
 QBgxWcPgmPiVS6GLbncqbXosugoTIlGyu5M21Q/6NFwyHkixdB/VzxY/FMjKGUHMxYzn
 Vy9tx3GL6ynCnnHis/RcMl7hDP4OqR8cmTBlIYOrEtfOYfJQZ26t4NDZ9aT1qy5ODmGM
 5AqlPnX3PW/yi1gFm2BXG8m3PJYHzc1qRKSGepl5Wvt8Uu94pEd87U81g8YyIkzzGH5q
 zNDvrzkxPfPSp86rWJTCg9015VRtV9O275XhZ7XPXspajq+1lZEOa5WNJ4d9u+ctosmx
 QaFQ==
X-Gm-Message-State: AOJu0YyC0PHKzVQFoSEP+zEUw/wj6M+ZXmimL2RLvUlkkzjm2okoKDyU
 KiTQOALaqYcbf3cymtlkcm9IO4U2Qn+So84SxfTKW81J7QnCUQ==
X-Received: by 2002:a05:6a00:216a:b0:6d9:b385:26f9 with SMTP id
 r10-20020a056a00216a00b006d9b38526f9mr2429177pff.2.1703715811249; 
 Wed, 27 Dec 2023 14:23:31 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 z27-20020aa7991b000000b006da13bc46c0sm493064pff.171.2023.12.27.14.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:23:30 -0800 (PST)
Message-ID: <97e6b2b0-6e6b-43c9-950c-62b4dddcdaa4@linaro.org>
Date: Thu, 28 Dec 2023 09:23:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/35] target/arm: Record correct opcode fields in cpreg
 for E2H aliases
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5Ur29iue5xEG

On 12/18/23 22:32, Peter Maydell wrote:
> For FEAT_VHE, we define a set of register aliases, so that for instance:
>   * the SCTLR_EL1 either accesses the real SCTLR_EL1, or (if E2H is 1)
>     SCTLR_EL2
>   * a new SCTLR_EL12 register accesses SCTLR_EL1 if E2H is 1
> 
> However when we create the 'new_reg' cpreg struct for the SCTLR_EL12
> register, we duplicate the information in the SCTLR_EL1 cpreg, which
> means the opcode fields are those of SCTLR_EL1, not SCTLR_EL12.  This
> is a problem for code which looks at the cpreg opcode fields to
> determine behaviour (e.g.  in access_check_cp_reg()). In practice
> the current checks we do there don't intersect with the *_EL12
> registers, but for FEAT_NV this will become a problem.
> 
> Write the correct values from the encoding into the new_reg struct.
> This restores the invariant that the cpreg that you get back
> from the hashtable has opcode fields that match the key you used
> to retrieve it.
> 
> When we call the readfn or writefn for the target register, we
> pass it the cpreg struct for that target register, not the one
> for the alias, in case the readfn/writefn want to look at the
> opcode fields to determine behaviour. This means we need to
> interpose custom read/writefns for the e12 aliases.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
