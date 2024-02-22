Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp254775eja;
        Thu, 22 Feb 2024 05:59:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtRicg9ymqA6GORUbFx+sYwFxCNzFAw42vwmpUoB1yJyaA85lVAyXQZsDJm1L1cspn6qJL1aFbzCq4Vho1oVcjQm7/3JIh
X-Google-Smtp-Source: AGHT+IGcISZJadhh89Jdt8gwftGPd/Ck7ishIbmKncevbv5VL1HK6Aw/y7ioOJqmJ0S2DFEd9AXs
X-Received: by 2002:a05:620a:1a23:b0:787:8aea:512d with SMTP id bk35-20020a05620a1a2300b007878aea512dmr5570287qkb.78.1708610350750;
        Thu, 22 Feb 2024 05:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708610350; cv=none;
        d=google.com; s=arc-20160816;
        b=r4PvEbGf8Eg7QxZmOKtygvj15JK/8oyPZVLTb1FIDVNYUAET295pxIsUh6z9CU5D5+
         SktzDxFIesSgIvzOLmwYbStM4MFRoVG+t1h1hjdkaNVsEG3wl9k6aK6lkLoexL/J08Vt
         JCwQ+9J2zFkWh+lIUmEHFhvMH9YbTuUmZKk9ESmIAPbcytnZio37EltEx3ngaDkAZmTb
         convxwzu+jDxE1yeiE5/90d/JNOaRpkiuFcHi78H7c9c/pS4ExIrtLYWwreEH9E6rtNL
         lIQTOlXSiybeS8LbHEtsGhjBU41sRQZbAV4fI54lDRfh5vbfS+bC4JN5vrRwl6t1DwR4
         99Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=f4A5QTEiDWI+EfdbbvxQ+LWL8OIiOi+Y61Valh+/N3Q=;
        fh=wxzeESFP/cptHoyIb0uKR5nhxyWK8wRHxu7nE7/TY1E=;
        b=sB2TklL0qZeQgm0+BcNu8OAivuS7u11hHalQLLAYcWLVXojSciG+VHOyh2GFWRp37r
         EQc/qhCFPAutlOZxoLJowvV+5TMLeNZh4fIaIS6ELDdqLo0Z5e4VcMQ3v6VnJ+IhmXfL
         GCa8a/6zCaSt5CyTxAGuaHQST3QBFxpc0L+iHnM32MgMUR4L/foNlpJUnd/GIravw/SS
         v9femIEeFdWU/y4FHcBi8lLRU6uHBqZ9+9ANlCua9XQXVKhIgx/wkAbZTdxyZ6RCOnwM
         /ZNhYRCwbJUqHIeAJcvZ8qEqNPcSTWaSyKK+zFM2Tgk4WzI4Epq1+4s0Dtwxpfdhr7gZ
         ShcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGaSoyKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19-20020ae9e213000000b007876a58f82bsi8274619qkc.270.2024.02.22.05.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 05:59:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UGaSoyKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd9bA-00010R-0E; Thu, 22 Feb 2024 08:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9b8-0000vB-2k
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 08:58:50 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9b6-0000Op-KS
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 08:58:49 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso10135505a12.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708610326; x=1709215126; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f4A5QTEiDWI+EfdbbvxQ+LWL8OIiOi+Y61Valh+/N3Q=;
 b=UGaSoyKhP4K89t3GwugN4+FezHSrvof1uLCwjf/dfPsjgQDLJt+HqxMpVmc3yi7ruV
 dIRTIVBS8iLGotSZRaErEgGXKFfPIRE55Bx0RXAm0TO7Qz80yq3dXluXUh9gipzCWGCz
 OUh2COq3H5kpnkT29wxumEByRLIoBHU2PyOQDVFiV1vsQdOnGxzA78IHQT2Mo1cqU1PE
 q0bEQrbTzt1/NkUPT+sEtTgleGmJKSlQy71/idqW9DK+gHnh8ipWswa5v1hWKRhvhrsL
 1yiud0jt2x5ytxyWG065AWBsiTLdJ3ryqUpiZ6nFOpqYIIob1D+igbiYzpBJudypx7c3
 xxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708610326; x=1709215126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4A5QTEiDWI+EfdbbvxQ+LWL8OIiOi+Y61Valh+/N3Q=;
 b=EkjMHBo5+O682Ae3kKi3+7oBfGanE1c78gCaC4qOEMW4D0K2CAixiO7gWY8dzR7pEF
 DHjUmsEU6ZeWk3gEKnXQdtLMF5Ez7PJMY6t6h0DGmPpmsWzRnAV023JYTQvVl0/EWw2x
 igOsXhbl10AmKkcOxN6Ek6tSNMgOWd/yAxSpq7UjzbTSWQ759b5eP9KONNoMSA9jce70
 0tapXgIm0A/j+qVRq77EcSYdl4g2F40es4fcIhkzUSorCI68WhzPlrvF5sVvUZBgqXYN
 qaX26vMsuHCG/npo1PZAdSQSOVqOVZPWardwvxAzjm9pytFVAqyC+aBmf92aBqT7D4Pv
 o3iA==
X-Gm-Message-State: AOJu0YwBGe8AYs82E1ZpWTK5isw6Qhhdo4i3MGLBQmXYfy5g6h9uqJ29
 /orY5GMqxZa/8qE0pUhewGuh0Yt2ipAUOQibS1MtTI1dfQbbwnk16mOwiQ+BvKk+DBEnBBMHe1p
 DUuz4r9/XmBDkbRRvTPJaEAv1XzQBYEmkmiKw9A==
X-Received: by 2002:aa7:cfda:0:b0:564:f9f3:801c with SMTP id
 r26-20020aa7cfda000000b00564f9f3801cmr2928331edy.33.1708610326159; Thu, 22
 Feb 2024 05:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20240215160202.2803452-1-ardb+git@google.com>
In-Reply-To: <20240215160202.2803452-1-ardb+git@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 13:58:35 +0000
Message-ID: <CAFEAcA8z-xqsBt4rFOkY0Rqj+7wJs+KLsCC9VFogxFthi=iKyQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Advertise Cortex-A53 erratum #843419 fix via
 REVIDR
To: Ard Biesheuvel <ardb+git@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 richard.henderson@linaro.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: dB7Z/PHKZhxy

On Thu, 15 Feb 2024 at 16:02, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The Cortex-A53 r0p4 revision that QEMU emulates is affected by a CatA
> erratum #843419 (i.e., the most severe), which requires workarounds in
> the toolchain as well as the OS.
>
> Since the emulation is obviously not affected in the same way, we can
> indicate this via REVIDR bit #8, which on r0p4 has the meaning that no
> workarounds for erratum #843419 are needed.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>



Applied to target-arm.next, thanks.

-- PMM
