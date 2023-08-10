Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp703670ejc;
        Thu, 10 Aug 2023 07:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUjocBN25ICCi1ETM/DXnWeH6RbPKtv5nj6VxxegozUcO8BG7Cj1ol+No+D35sq7k1RAow
X-Received: by 2002:a0c:aa0a:0:b0:63d:e3:414a with SMTP id d10-20020a0caa0a000000b0063d00e3414amr2284105qvb.25.1691676820994;
        Thu, 10 Aug 2023 07:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691676820; cv=none;
        d=google.com; s=arc-20160816;
        b=KGBq7LYxnsnZAw1x400x4qi6Vv1g4LstFwgwz1O/EPhfoDjtuSwitqRsbwSHHLYtzI
         pJbqwk9ODAHFqAKLf69wwBOWLQqokHOMCRWN5pM4G+VbdxE+/SuqgkARKL5RooefB5yc
         ibmBf0tWli4lIvgelp2WHQX25FMDHtCdD4v/0B+G+6Yc4jNIC7CivyzKe6nIlVu5vGUy
         HVPXDT/W8xGADzXourpfqFYpFjfPLlSEgAyQRW923UzB57UXEPsBMrt3hc4gsLt99cUc
         kUkIgid6O+ZU/T65644dyI24EWHbtKYrfFPKD8fw6cyuH1IU6a5B0ayc/ej83q7WHoDM
         i4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bpsGhHIebT3uDW2J9NegMXt5fhq0bVbral1fmGDwzlo=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=QJQDP9unLhV5d78di7OLJD/kjAkM9pEYbxN2Xn7Z7b+0qskJZKF/vei3JAKP3QWyNA
         ezBhn9n0GWM+o7opnz9z20D4aQ1q0ozWdBdrSIGUh/RFoy0ER/LlKKw/rS7tyGS6UxkN
         2u0v6MZuhWZ5kOOLKanWOX1acw5Tw8X1SQYhUeRKbic+49rwKIGT3fUerUZZR+Am95CU
         WN1y8SaEvS5qnO9thDqjVfym0GC58Cm7oy/B5hqNNKhDjIKC076pXrH21t/L2OgTWRSW
         gBwInx5zAlR5f4z9AE1X3PMztiOLC/DIalHv1Qm/FkJCOCV270l+3zsh2qSFX2VZvOAi
         S7tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HE8LqcQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a0ce08f000000b0062ddce6bf96si885882qvk.220.2023.08.10.07.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 07:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HE8LqcQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU6Pp-0006EA-3E; Thu, 10 Aug 2023 10:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU6Po-0006Cg-FA
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 10:13:28 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU6Pm-000480-F2
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 10:13:28 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe82ac3ab4so1382752e87.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691676804; x=1692281604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpsGhHIebT3uDW2J9NegMXt5fhq0bVbral1fmGDwzlo=;
 b=HE8LqcQ75MMHWmm4AVKZWkow8vMV25DRx8H0su44OnVDJjb8p2W2H8X8Qo/tKOXHv/
 B1E//s/WDGvmQIm4a6zopEJXV242kXGckDiDCDZnvE76AK6+uOE7KZNqirRDG/1K6jce
 X/+bldiQQBj0W/nZO1m0uXhOtuT1OyHA1k0zPFIpbKr091G29TDu5DJlZ5iszp1WQdSV
 vrmSlt7umHNoH1ekQXDjyUk7GuDeNnqhxQYRNy59FkgaGKi5WtFNWFFon9QllaVUylDh
 lhYCmCla7FILevQUv/JjIv7gIyTTwAvbcj+DERx4JznRBE5duqHWkkF8WSHAPGEPQ5R9
 1UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691676804; x=1692281604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpsGhHIebT3uDW2J9NegMXt5fhq0bVbral1fmGDwzlo=;
 b=dVjPzv+vT2apdv68Z3l+LqjTk+tQt95E5BFvOWQn40DJLmbUif5gZo4iErTznPSk1H
 on/DYYRkWNnA1J88qE4RtYZRaiz1cPTgHmev9rx1+GvtuFvpRXatjO2UcJME0K/ONcCn
 CBLIjELLrcNMK4hguSdU8Ds9iusBau+VmraWesJ/9fY70qfsvAxvaLaMoHCd45y3lw3z
 G8Gn58MuU2fNLjZ8izYYn8pjSk83VoyHaR8zvDS6P7inwFJk6plIY9nhx+s0UU16mQgC
 NwvkB/KLf2NWjjN16JOrKuBWCmLZvv3QFDstaFCLGrO3zN7sFCQMO5MKCcib9erq4Ecb
 rcww==
X-Gm-Message-State: AOJu0YzTti/CKnYIotpYMOsIVRpo4PQtOfbYs87YNtPOdDPMNV9oGzCq
 40ihqvDqKrXeoyNmNMKXfEvQSALLEwWZzsuWUyrkwg==
X-Received: by 2002:a05:6512:3456:b0:4fe:cca:c6f7 with SMTP id
 j22-20020a056512345600b004fe0ccac6f7mr1576692lfr.48.1691676804391; Thu, 10
 Aug 2023 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-4-richard.henderson@linaro.org>
In-Reply-To: <20230810023548.412310-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 15:13:13 +0100
Message-ID: <CAFEAcA_ezGixc++DuUC9ZGsikP3=gPHoYtLP1m=SyUnnBz6wVQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: Allow cpu to configure GM blocksize
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: A9HqXTjCFpzw

On Thu, 10 Aug 2023 at 03:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Previously we hard-coded the blocksize with GMID_EL1_BS.
> But the value we choose for -cpu max does not match the
> value that cortex-a710 uses.
>
> Mirror the way we handle dcz_blocksize.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
