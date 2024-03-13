Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2725057ejc;
        Wed, 13 Mar 2024 14:09:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2p6CGpO/cUew2XLGUZXdQBPbI5U7dj+XE1tNGmmL8c08iC7brN1F71WwsM+HStFYjZWXvC/IYngnf3jTT1OUTHF88sS6u
X-Google-Smtp-Source: AGHT+IHgaIWUMsVTN8PZGusBl+ToKzltkW8O8Dmt9S2Cuaos/B31WccWm4LNrYGdfSZ+1HHKodGT
X-Received: by 2002:adf:e445:0:b0:33e:7cc6:9936 with SMTP id t5-20020adfe445000000b0033e7cc69936mr2275036wrm.21.1710364144001;
        Wed, 13 Mar 2024 14:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710364143; cv=none;
        d=google.com; s=arc-20160816;
        b=ffGT6dn0IbaNxJXkhBsja6Rh1dsuPXfB9k2yy0Lb4151aQq+aVhfKUIwthYJDuZrHQ
         F2/0pKpE/G1KeQT3g1+oM2r9WtkMEo1kNkmfHXj/r86k5VI5mebNvvl1PqQhye3Vjl2P
         rJyx6Bnw6Pha/2bLCRGHwyDRrrdUkOGnelZ1+Ut3FFlBtHumIHI3stNeLzCV/bjD0WHv
         YkamFWECQELc4bPSPDdE9kWCT7lz0o+faFvgUOxDbLjfNgzOFNzHV8CPingsdb5hCkLe
         6CXLQyVPDtMC+uAC052zgHq6rjhIlpJL4kOgJMC6z+eq3n+TUdVT4iLNmnTxf5ghdpwb
         3TeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y+T1OJ8n2AkxrRONxqmgCn/m1nsvJmxIrQyvQ43FDrw=;
        fh=+4+z4zMwhnNcXU9sTGGbp6QlaRK6JY3Pi8ejPoSqGLY=;
        b=s7ZXQD4b29Ce838a/5g0kIY205gPCOFQCmtxZH1SdAdqlQhhgH2l+OcSE8iwF4QO/Q
         dYLXUi3Vgxn755dc88rWtb16EBU6AYQlYollXW0bnLxX4gQ03KXfBb23eK1Yb8YQ6AJI
         v3tFdXbLbbJx/o2Z5K2VxlbEJ72zIdxgjkIsZi2ZsU7WkuXjl7i0MHJiHvOSj7nmB9G9
         l3eSJ7mKDrKEvaHQRgF8BUrMBg9FxnhM3hxWzdZWLRG2LAPoLmSYvJmFeFhiG5cVSiuo
         2VEAzubMFjN9hH9HXim7IlY1DchztAOtBoa9j90TK+BrYQdQKxJFcyXaqO5pVzH3rQtD
         ERVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6bMwuWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a5d54ce000000b0033e7cfdb353si24913wrv.42.2024.03.13.14.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 14:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6bMwuWg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkVq0-0008DE-B4; Wed, 13 Mar 2024 17:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVpy-0008CE-Qy
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 17:08:34 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVpx-0003D5-Co
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 17:08:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29c75e348afso188345a91.2
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710364112; x=1710968912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y+T1OJ8n2AkxrRONxqmgCn/m1nsvJmxIrQyvQ43FDrw=;
 b=j6bMwuWgGbxWJyZcNDXhCUAW8s3dgPoxwSfZg1GXFhtmT21t5QsrMn7f5AuvHkf8Kg
 iVDBnOMUpRjwmAMcozM9H8oWoJt+3/9D6229Z7XQBp2uOAunZyg7wkeo3KYs3VpPayvy
 Az8BWBcnvOfRmgNL2OXOuKPVtKVXXsPFrqQAplBJJu6QO9u/9pGS28jQzeEL4dFt3jnf
 iPcuREWwgfhjT/faPC38d7gI2Yqw42KSq4XBOdtDrhMoFvKonScRp0tdo1mXhf3kdTuY
 mE4ljLoDu37UICBFJpQ4doTwrqz3GEibAm6ANsuIchQvoaMgEJ7EW7MSBuzcm3ownoMu
 K5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710364112; x=1710968912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+T1OJ8n2AkxrRONxqmgCn/m1nsvJmxIrQyvQ43FDrw=;
 b=UJEgluIEIsj2+2V1H4HAvHy0FcxrelFjwv8z3xuGBkw1q69Q1SW7IOOtXMW6WKBgrQ
 UDhqRAN/roUPgKbxhqzIdT87eitpxwYlSlUO3BzxjM4+T0PSdOaaWBUIIcUa/b0tqCFZ
 gFr71LJheTEQtr2B3bHW4UveI1heIB9/xwSL/veOxz0d/CMAv4QV3w8Z1uF79d1mGNvY
 cpev9tXp+iz+Cdo08E471WEKCTaYvYwYvZe6R5h3Y6OhzRm+Hc9x3On1nOGAdWQFlvSC
 gUlMSJsIpV+lQ/gsmAwsWh39XQquUpufT+VW9VPOe1w9S73SNpH/+l8AwJTIXtiREt2r
 Fmpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqz5v8GaBtxr4+8/YjWyrV0OexE2ZVehNT+2EfQrsAaFbTG/BWDYAmQINg5YCZUgWWWKe9DW96RyoeJGeJMHB5EX1Q
X-Gm-Message-State: AOJu0YyunACDqb1/9EBifPQX7LQ5mSKGwBXgE6tPAMHAIKPKNk7pRGAM
 2L52EcK28JDQKlLvDLV4XPd0t8NJM1ftDJ1RJENnldeR/XmQj9dalapn9ROxzus=
X-Received: by 2002:a17:90a:b305:b0:29b:8821:624d with SMTP id
 d5-20020a17090ab30500b0029b8821624dmr11656430pjr.15.1710364112043; 
 Wed, 13 Mar 2024 14:08:32 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 qc12-20020a17090b288c00b0029bad32fe5csm81470pjb.16.2024.03.13.14.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 14:08:31 -0700 (PDT)
Message-ID: <f6d379cc-3466-4ceb-a42d-a84afe1ec501@linaro.org>
Date: Wed, 13 Mar 2024 11:08:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 2/4] accel/hvf: Un-inline
 hvf_arch_supports_guest_debug()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240313184954.42513-1-philmd@linaro.org>
 <20240313184954.42513-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240313184954.42513-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Kyr0eNBrnJn9

On 3/13/24 08:49, Philippe Mathieu-Daudé wrote:
> See previous commit and commit 9de9fa5cf2 ("Avoid using inlined
> functions with external linkage") for rationale.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c  | 2 +-
>   target/i386/hvf/hvf.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
