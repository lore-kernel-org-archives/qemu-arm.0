Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3322301njb;
        Tue, 9 Jul 2024 07:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPlfmmSnjT3F6Zon40Zyl1ypJmu0e4R3NmUlZPdODXJkAzYXTKoeHybLNUDvMhl2TKDnFPasgTV9vnVW9HDDvMhmYHe92Q
X-Google-Smtp-Source: AGHT+IEuomrZxBGTcRmgIQwycXf1A9ugUWckmllwauPwy3HGCAQrIjsvD7q8+dXmR/q/Pu9WJxzp
X-Received: by 2002:a05:620a:1123:b0:79f:16df:a69f with SMTP id af79cd13be357-79f19a51dd6mr315726785a.2.1720534886350;
        Tue, 09 Jul 2024 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534886; cv=none;
        d=google.com; s=arc-20160816;
        b=sVOelFipjvba/bEVv4rhpLf1UdxDADQV8teG+tjFXSeJxbVlUKnZaTB/UZ8gsYYL5j
         SQq4q2Cfm0Zwx7iH1wUqGYmdSinXx+TeygF/72XY2yvBsqLOQtfjHal6w6cKN0573Z7T
         u7O+PZc2Sj8AU8fbRleL7n4vWyDBcDMvEjUEcQK5sRevRcAD5sf7GiXQicSiGZbCoJX3
         0zUteSZAN8fGLwq7HmPVWStvVnWxcQNCpw+rTnUm6+n/JMR22mgpIJdYPshrBfm3ynUf
         VAtgXuXF3Bq03KjcZEDQiYJ5tgab6iY2XhTzEGxLTHsh1T0Of5jBQE2ZzN5WD2N5h2WZ
         dueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8nvEN43i8s8OHgYCcHuQ5agVs7nVCZH4nZVhTyQm1lk=;
        fh=9yLtqrJ/OI/58fMgBwxpDlXa/WK8GeQWtUbhQXTyJjo=;
        b=HUxlVvIt1yyCYugy5jaK6VdFLrqL0vdz9+GoVTkUJKKWPXDP8j1P9MVQuUTzg5Du9U
         Lx2tquwqEkEk3XleZ4hEmBME0n5oSK3Zvfw9uioPfAycO7yxHPlAtk1qYyjFTL51mQ3p
         dDlQhxUwYtPxi6mVkxO+R1rDts8TmbVWoMUyhAW5XY90eB8kZjX8Zm6jO+kBodCWZvRH
         hTaiakPEUBHvQ8c5NqIPTILaUlH4MpBPOtr34EI7teKlCHTjiy961+dOLWfA4jCNZz2N
         BIrwdwrGEHdVQSb806ay6PMC9NfqiDXelX8qwjJddTiEFXXG9WEweVpG41MzgiKnDGXw
         7klg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYpMHgkk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d74ffsi218723785a.603.2024.07.09.07.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYpMHgkk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBiJ-0007ZS-1A; Tue, 09 Jul 2024 10:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBiH-0007WU-R2
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBiG-0001j6-9I
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa6b3so2819377a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534858; x=1721139658; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8nvEN43i8s8OHgYCcHuQ5agVs7nVCZH4nZVhTyQm1lk=;
 b=uYpMHgkkZ3v/m/C/9vl2FTr9xROPRrhFNvTkWqGo06m/yqkKnMr+gzaRVTZZ9+HDXe
 cc7kAm+acWHGEbIUsj88DhQJDBqgiHjlDrlCwsv1tiDsOGg/jOWk62paLGyukfpyYNk8
 ljDBV7KUm9VJteaC3GjwtuYORjONloII0VzxjpsHfBMbQfnqOLMtYzr9IlzKe9lAiW/+
 6a3J74JDAETUyWcFSSrym83F6Y86N5EHOcIFzzVDRfasBHHECcIDoQiTpYhyExPBvQ2z
 Ajp/S4UhHLiGqx6FHdoVdlp/7jowlQzHmWzZ52ElPhnLaBjyN3/uhm4OALsB+VuavYkI
 sjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534858; x=1721139658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nvEN43i8s8OHgYCcHuQ5agVs7nVCZH4nZVhTyQm1lk=;
 b=vfwt1FUnWDEQJFNTJOl7B5HlZktAAhIJopzQRk34dE77OI1u5+El3iFdSM6/tUd76w
 aaCMURpxkPp1CVgC8qwJDTmxcj+vYp/sFy5L03jEfgGmuqAEslrr56wKdwWRLcVvyG/g
 ZtvYAdNeo69m14pYd66fhL8DxAunQx1uh39xBd5eVIfeEhJrkqRgqjBAyPp5WyWofEG0
 EBBLZpXoPFTpkmiIrtgcG15psVXp2LOKvrbBPRpJIfveo0//SFuwrSf1sivEdOzuikS1
 mrdIjJBQw/ZBykVNmATGUqGxectg1cEmiRfUQztIRwVAPk2IiigUVWA+TYyilDzc/6cB
 Q8Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/QSOIi3rTfMhwcM259i1xPfCGgCFjpCW2phuT708zarTXlU7t9AwCsjcfbizm+CgXRgQqjzDkvMK0CXHk/OO805Wv
X-Gm-Message-State: AOJu0YzeqfsFGgxBux3zyQJCizNiPR5sYlO/MYhtykVLtsjxJTtPGmkW
 IZ/XXhdublEVsuN948J84RP8dBnvmJP088X/AeR9sMHWm8wmGV75F8ruvjIRRTMmlr4vKzeGvzL
 pnKw56QXxthe/zTPfQT4akvD52aFISROVvmCcuw==
X-Received: by 2002:a05:6402:510c:b0:58c:15a5:3e12 with SMTP id
 4fb4d7f45d1cf-594bcba84c9mr2474401a12.38.1720534858581; Tue, 09 Jul 2024
 07:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-2-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:20:47 +0100
Message-ID: <CAFEAcA-6C4uykQM6J+rXTAqfhTCYGZBKR75k3ZNcVPFq_BwBkw@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Convert SMULL, UMULL, SMLAL, UMLAL,
 SMLSL, UMLSL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: K+gbfFPWVKU0

On Tue, 9 Jul 2024 at 01:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 184 ++++++++++++++++++++++++---------
>  target/arm/tcg/a64.decode      |  22 ++++
>  2 files changed, 156 insertions(+), 50 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
