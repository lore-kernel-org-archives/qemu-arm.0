Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp166483njm;
        Fri, 28 Jun 2024 07:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTZ7TGrGiNJolHGlAhjJ7/napD8uVxxAl6NV9EzEoQjRhRDtgtjxo8opXqEZ07YuHWhGej/lHbaFWjKkkOJ3ef7AVJBW0N
X-Google-Smtp-Source: AGHT+IE+b+2wUONGL0O5O280nQ0yYETk6t4JBrqgt2I74A9dROXs3SZoW5omsV6HZBZR7k+YJai/
X-Received: by 2002:a5d:6483:0:b0:366:eedd:afc4 with SMTP id ffacd0b85a97d-366eeddb18emr14003646f8f.12.1719585131128;
        Fri, 28 Jun 2024 07:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719585131; cv=none;
        d=google.com; s=arc-20160816;
        b=O9poJZkXnCOO/Kii5T6IS5BV/4N0KUlMhZ0UACRQ4AazfBtOax5i41IGYDOIHi0dJZ
         06cxjvW2j+WQDFjinaXuRoO8Sx4c20H35nW5aMRRoPw272hMPAU4P5I01ZohCMfjdjyI
         GyzJljyuTUtHMhVM94HWYlD5G9I6RMc3xRFqTYQd8wk2NbZg9e5Xww5J9OruIPKjHIFp
         V2+XhdwoQ16TbkYePoBD4D8OFJv7OFoQVyqxSdQGYdqyRkR47RG0kRArqWmWMos5x3SL
         YThWzsj3p1yoeCYfWA2oxe8zwB+V0l+I2b9mIZdycdjtv4RY5ifaAeMquaK4oMwmTsWQ
         TZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rglGY1YG+gk25H+wVT+J71pIwe8RBjgWCFs3wbXCF8g=;
        fh=ZNeo5tqKxKr5/agxW/lQ5Fpzj+VY0dPzOZa+EqUjfNo=;
        b=pIiKdVPTPeruc2n/V8DevhdDcQoqqcEivnK/FOsynvafjsWeQVmEdnw1/F5y3Fkaan
         oz19HGN2eX49x4ZDrI0nRpA0uraJtqfSweDwIm1UGuJIaYZ3UvyXlV2AWx5rabFB9H5Y
         OxFS2VJJr0G9hizRkYj9AzHNXxx9iThq3lA/xALwJwligVurCeDaYd9sVZ+suOeERgWG
         /szC5iczjx9+FWJN76tbOakKW2gVnnuqXfO4nXgBQYv0Mcuhb53W2ExJoB/92UqIlKTF
         /tr3gD9QOhqJ1DGjHFUsrkmymDiClfENl6d6DxYuI500RBelGRRTVCC+ZRWqZAFc/Of7
         5xyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LxsOXTpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3675a0f15c8si1047403f8f.393.2024.06.28.07.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LxsOXTpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNCdp-0002rM-14; Fri, 28 Jun 2024 10:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNCdl-0002oJ-Ef
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:31:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNCdj-0007Ff-Ry
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:31:53 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1f9b364faddso4519375ad.3
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719585109; x=1720189909; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rglGY1YG+gk25H+wVT+J71pIwe8RBjgWCFs3wbXCF8g=;
 b=LxsOXTpgoTHlrxQ+SEBxL3YNmyyR2ESv3i914mrJOTDZQvOK9YeKj5aC4dr6MAoLPP
 YfPPSvwKoBUPtB4aNwOZfhhnpozLJgu9/kPjEcPsjYT4F3yyGQTuKsS1Kl19yJQyBfwc
 xLsqZJ5wuCA984ZgFOKdcT5H4qV6aJ69+VyP7WtyJg0zdx03zoPOr/RwPNnX84PEJxn8
 zHdzpFFV/wtd7CgeIOhXu8axSl5Er4vhN9e3TR7Ne7jjSDPiZA4JlDCYACRKMkTyHiEJ
 3L4EcLOGEJatvUbq6+ZDwg73Qj4NEG8OMXp3DaEh+FJcXcORyfBzhaRUUrhd31seuS3o
 Juow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719585109; x=1720189909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rglGY1YG+gk25H+wVT+J71pIwe8RBjgWCFs3wbXCF8g=;
 b=tEgGKPOzINxedm9RbsQlfRBQ5G4Rv16AGTNChSG4sJGaGHU3KDzksPkETlVTHhZ7BK
 +a/VCujI+Ob296UFzZUNHhQQmC0WNK47HG312LB2hORaCi3MJdXtHeDJzNo4rtBQIS9s
 TlTZuu9qvMF9YuH1EUMUnhIj1dVI3HgvSfL8ke6hLVSEmzJBQkZnG/PvGqXUrKL4csnZ
 h7g1bOD7XpQChXe1auBSRw98x5iLbQ/nuvZjOn4mOLZwjvq6qh0AmvV8gRv0f4+ZbyJ5
 uc8hJC9Ucc+B6kjQgxmEg+sPmcAaV/K22lsgeXBAUv2TLy7HaTJSioLJdLvNK4UaWx/V
 fWxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8zSPAme/v78Dgpj3F4iW4udYmxHWFkY5xTQ8k1Ec68dni8cv0WoO5dCU1DpGW9t3PaN4XNN1pQFSLWkYAecbgZWk
X-Gm-Message-State: AOJu0Yyb36T1PsSEER8aSTcHhL2Bshdh8sWedowP8Mnb9mlARHCjRAs2
 l5FFoPmJeLb+ZUkQKr5NFQmp2cgE9tNCNMXC4xqo1HoQ5XOLf05p41kKejUvRjQ=
X-Received: by 2002:a17:902:e74d:b0:1f7:124:b820 with SMTP id
 d9443c01a7336-1fa24082256mr158330225ad.50.1719585109409; 
 Fri, 28 Jun 2024 07:31:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535ea5sm15867735ad.147.2024.06.28.07.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 07:31:48 -0700 (PDT)
Message-ID: <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
Date: Fri, 28 Jun 2024 07:31:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>
References: <20240619124903.56898-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240619124903.56898-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: FSS90/dLClh3

On 6/19/24 05:49, Philippe Mathieu-Daudé wrote:
> Merge gdbstub64.c in gdbstub.c and remove uses of
> target specific TARGET_AARCH64 definition.
> Small step toward single ARM/Aarch64 binary.
> 
> Philippe Mathieu-Daudé (2):
>    target/arm: Merge gdbstub64.c within gdbstub.c
>    target/arm: Always build Aarch64 gdbstub helpers
> 
>   target/arm/cpu.h       |   8 +-
>   target/arm/internals.h |   2 -
>   target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
>   target/arm/gdbstub64.c | 383 -----------------------------------------
>   target/arm/meson.build |   1 -
>   5 files changed, 364 insertions(+), 393 deletions(-)
>   delete mode 100644 target/arm/gdbstub64.c
> 

Are we attempting a single binary for user-only as well?


r~
