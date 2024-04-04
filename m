Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp289956eju;
        Thu, 4 Apr 2024 07:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZBxJkW62OkL6I1CciOQ6pszL2PtWfjZaFSt4TXcE6EVX77azY6VFTetRSI/QPQ6e/0icUU51oACm78wzsyImAX43hBabN
X-Google-Smtp-Source: AGHT+IFdDFf/V3o5gOjaD5PDZ41vt8V/DHNHYuuHkV1MfAzOTu285/wQoxT8UZ8ejBf/Jz/VQDtY
X-Received: by 2002:ae9:c20a:0:b0:788:31c7:e09a with SMTP id j10-20020ae9c20a000000b0078831c7e09amr2261106qkg.27.1712240333278;
        Thu, 04 Apr 2024 07:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240333; cv=none;
        d=google.com; s=arc-20160816;
        b=UIfC2wI3iGc7CTAwAzfdVH8OKcNHI5LdtWMKZ0NL+xSWrNglzlIQ+rU8ER7o/ik79l
         Td4nIHlqf71X4Pi/30C2aTpFNOz25IsneFxZwocnSqXHKiTCyv1YSzfr8o9r7DfSqgT1
         s0czraw+FYxt79JlRczjBA/8JlG2kkHDIB1pBrRD5pT1KIwIBLWz64ryXLHpWVo4ID64
         C9X8BIyk6quT0MyyG9QHYKuqRBpuW9q2zcl5d60TGsJNCg1gPAH4bF9KNNNX1MVMEOT+
         SVb+c1cLbtIpbUDyuMIIaRzgxOZzhExJfwmN8gdWK/1guvq81g3IYCds/Bf+3AOLWOYU
         JuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CBfrbWGzHNlTS4XQeBG+TQjAbkM8kCVd3lntc5GmhkU=;
        fh=AHOh7CqAWpqMgMhMDr/U8Pe7KYI6Br+JOxmAJuSGWXw=;
        b=GXZGVM8fS483f1E5yeBa364tNqc94Uu0Lp+J8Le+euuqRTGPcnjoKf1I+9sZVNzRL2
         tONJqf3ykY36AI7H5Uf7sfwleGHI9kNlNGYHeou3DP3S5rZWcyigB+6fglyKkgvaUF67
         PaCOpjKf3elGsDKeE2MMtmMBVYRcYvBn0QO0naF9TzdMRjQzDfep4/BkFZsV16MXs2wp
         Oluy9j0pzy/Dnf9fyE2YpqkRPsuKAV5DBxMMb9DyinGCAEAiXaIwEM0q2HeDp/tj+ugL
         gjdifU4ObuwC0zSrCVpCeXMpLAEzRcRjOx5FbvnQloXM7OTJM203eBIMQQmJoEoDKIFE
         Vggg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JETv1ABE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05620a125100b0078d3de5b96esi2152505qkl.58.2024.04.04.07.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JETv1ABE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsNvN-0000Ft-KP; Thu, 04 Apr 2024 10:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNvM-0000Fg-Ju
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:18:40 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNvL-0000CI-5J
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 10:18:40 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso13300891fa.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240317; x=1712845117; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CBfrbWGzHNlTS4XQeBG+TQjAbkM8kCVd3lntc5GmhkU=;
 b=JETv1ABEcpasW/A2n/Y8fNKqFljKodGP1SJf43tEPvKiXSyUQz4QvlQwotNhmqddDc
 i8VoLb2EwJjzdxNjhvC8l7IKc1u3gW1Go+K2CoPUyk1QaW3zi8UfHPJd3yzuZ3Px+cHf
 /aQKhpAipA6VF31T37SsunT9iG6P6vaKGD5TptKQB7H21+x8eGS9+7uewjaQYIsvWoea
 HYbjnHOqz3l0tayCnY58oufymPjpkesYrUWag9nnt0+DnZ0RQr7ZdxZVRLEX++0csIQ9
 V+5gKyca7djLQSIF0M+jbcAmE/kEYrnIBgLONxBcmzHh3FwZzQfTxX8HPCZ4pBydlq+B
 Yl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240317; x=1712845117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CBfrbWGzHNlTS4XQeBG+TQjAbkM8kCVd3lntc5GmhkU=;
 b=KI8rnb29adlZM0zwf6RydpTupnw4n57mH1o5i4/YMcLDohH2vdiTWdP43QjPrLQURy
 +65rhwWi6EvKslnS6nEdygFbT0lBGIxwipVYTREBaeXXS1ULhsw3AH9BvjFNkjnGXOY0
 zA3O/8OAKqzwZS+lmPaMN7bjURPrhpk296bXyVNn2MDm0Gd9c02ePR/R97HgscDuhNFm
 XIRiRIQTuaDM1PmYEDu1AZM4pt566E+dp67NU3mQljgM+Vvu3V9fubO/iHHhS9OPL0T4
 fVgwYpURA7EeHTxr1owCLMiN3A0U66EVHhl99DXDDEuQd7LFYh9hpqhph2akrYCYHChl
 /YBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPByepFIHMqDJzO2SJHyMOeDi4qe3KSJjB0WlhNZUI7luOWyVOag437l0uRwm/L+JSkVwhULLRPHNsfMLksoubXn+Z
X-Gm-Message-State: AOJu0YzkedzjGZT9pQoek5GIgTy/KdQyAsNbU6n2eZrLI1hj6f/srjTF
 kNHZjvRFwWRjFT26Tr6RxqoPf+HlM6eppmdtS41XYtSwvf8rG4Uoy0f/RwFjd0ORSusrlVgV7YI
 H9QfiaZkqVdgJSs+z3Vu4VGWSVkELASXILD46Vg==
X-Received: by 2002:a05:651c:91:b0:2d4:7455:89f4 with SMTP id
 17-20020a05651c009100b002d4745589f4mr1746810ljq.2.1712240317430; Thu, 04 Apr
 2024 07:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-10-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-10-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:18:26 +0100
Message-ID: <CAFEAcA8tGY8hD1y7Ygi+1EB_ZuxiPyC4S2frHFb2XBsugFiq-g@mail.gmail.com>
Subject: Re: [PATCH v12 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: PGeDNRvOiABU

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
> SCTLR_ELx.SPINTMASK bit.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
