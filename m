Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp495272dyc;
        Thu, 3 Jul 2025 05:19:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9GfXREeMVGsZ2ZQBx5i9aC6QUzegQ0WUeOMZ7mnDjb7SCvjml+H+KHD7O+LmeOsh3Lvqv5UIPs7QCVw==@linaro.org
X-Google-Smtp-Source: AGHT+IGTmSJ8KmQvJV1hA6d4mlcXTAfZPmt7VqYZBbwgvLRua/duyLkPCmYnLlvksr8Mvj3nmUcu
X-Received: by 2002:a05:622a:1889:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-4a987a210d2mr57203831cf.34.1751545197398;
        Thu, 03 Jul 2025 05:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545197; cv=none;
        d=google.com; s=arc-20240605;
        b=G90pMkcE94WBmmMsaTZ3ovRWt1r3lQELutJdafKR+agX3g089WRG1+mVTa+aZxUmOj
         7W9h4y2au5qWpk4W3ayFZWQH/wDRRbevpGeyCofqKg9T6CdZtfRHLAUrentbIKqC8rLi
         t1cGIS3vTl0mmU6woDXAPYNJTm5ADQ+eWvT0j0BCHo88WOhFPVJWtKttShqDEc+3KBte
         CEWa9LcqWZwSuiGaZit+2KR/UC1xL+R4JxtfUm8MMUVc+ZuKNukS6T8rmCrzfHVIoiJc
         +y05OEmdr0E9BAPJ3Ky8Xxc1lqyRvr90mQmMrg3qQ3GEVU5DL4L/cvYqf0anZOCsNfsw
         JPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a/4N0GhCEjVj8qg1Epax0AkW7elXGMI9bv2tVBfUC/o=;
        fh=9fm+qPG+NPDcbBLtYNjBO6CdokrnEB8U1S3YNH4Ua5o=;
        b=UMwsg2zWJFSo8y4uw6wQxFzLfn9k/Plm5nXTaqD3eVTXYJ0hjKmPRfKgVHliQacjYq
         LuR6i0t+QcFEG1aJ3DOBCzlpeb3+ytohUkzME9BgpWLYLfUJ/sshdRd+PeDlmbeKduIY
         s/6tEcyD03kOOvTzTOT14f7IFuNHWaIwMiS5fF3d7gG7/9kCc6hPwxoxgoNgY8ADLJNb
         qRL51bMYrGHLZK8dRkuB1ROHJF0oZOeWTjAgYhZ1VgB0UR/XLuDBM8uuRNcIwQwzZvwE
         664l5h+F/eYFHINUP61lYENw0Dc9dwMsGWe98ZKufkho/EMn4CkvKB5hVuzbX8Q6OzmD
         YWVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ww2HYrth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327fb75si1476742785a.487.2025.07.03.05.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ww2HYrth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIuk-0004Fe-Ry; Thu, 03 Jul 2025 08:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIud-0004Eq-Fe
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:19:37 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIuW-0001rU-30
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:19:34 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70e767ce72eso58975127b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545163; x=1752149963; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a/4N0GhCEjVj8qg1Epax0AkW7elXGMI9bv2tVBfUC/o=;
 b=ww2HYrth27AgJTfm2Nj+WydzV31gwMKYzsDU4XudwkTHs6ZBOLnXkVyC7eLpEuiPau
 elNr249cIzsPXF28+sdjpu9Vn9arXAWGXrQSa/L+qmlaybv1zh0+8BSeO2ZdMHKKicHH
 kOEFfC+1fNEYE05r16dGW6hKTYNM+aSZRETa504lf3Mb6HaS2ZF9IPYYEtj9z1uhbfGS
 2Kjoe6ubG5wkKa8VD5amN+EFdtic2mUWpBhcP4NtUZR6n8Bs/JYRjPa6YRf/aoxJiJZK
 dC7Rl4WIBIUREDMh9RcRSjwyo8t+UCchseq7BJ5ZbP/KylhP962VTRA+GEdK/afU2ZlU
 N2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545163; x=1752149963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a/4N0GhCEjVj8qg1Epax0AkW7elXGMI9bv2tVBfUC/o=;
 b=ckE/WlYznhUy1y+36JcCQk1qQKJKsCvcuBvqkvnrONMme/GSERe98lOoUnh0N4KT4t
 jHTyyiddezDippi2I647KotRslTFtd287qsBFLWpE0IkECobXbrcXXvXeafTEqjmJgg0
 mPTOJlTrLkNAR3ASqqAzR4jFyswz55WAc2VtBPEqMhlkTMDGNsdK6sQoZq+a8qjD74ux
 4gZ0y4dHAg+VcpdmcdP4oYhVGrxJl5ydYu2G6A3RDT8e6tMQdFqVshCXOLk3Rms99rl9
 BPywyjd8QVF7k48CfJhskM8+toFMV/WlGYWKQS6nvVrKYclkaj1o0KVgA5ReeymrKWE2
 uilg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzpgtNGrM41E87iT0+NsN/mJFih69Alc3TobqXXzatLvUM6cN1YIfHEyVOWoG/FIkyLyQxm47gsg==@nongnu.org
X-Gm-Message-State: AOJu0YxWFgsnOLMN5kY3IcG4IFZr88jcV6ms/XdVrCDdsdfaG74kFF3l
 bp2iaKJHDNj4oTUqXz7oiNQmP419eduYrhShX15M9ZuFGiPFWm8n/3WeVmGg8CTLUAIn13tpTY4
 +z6hH0K+3Xu85wrsJQ/HeW1R09DGu++RvWJKrTynPug==
X-Gm-Gg: ASbGncss4+WfOqZbzvL8ZO/1SZ86MCGSHpgeA0kUON1JaUUxLXSbvmGInBfxDCSnJ76
 oE0tb74ztM6YMWK+PB5Pwd3E0SynepnpaOY8NaJOOBFDqJlceOhepnzkwQB30DyzvFtEK3dSa23
 32o83dZVtvGu0SGYjI8OFrCWl273+9gbh9fg4ElwN3DePR
X-Received: by 2002:a05:690c:63c7:b0:713:f7dd:5d7c with SMTP id
 00721157ae682-716590c4de8mr50277387b3.19.1751545163422; Thu, 03 Jul 2025
 05:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-72-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-72-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:19:11 +0100
X-Gm-Features: Ac12FXy9_4Kfy9XOlw_bLUvmXojV2lqLTl48VabTeHZH4AKg2_YLpP_MCkWIcOQ
Message-ID: <CAFEAcA_42xRCLC_J8WjMseotN28r7vGh+xvEimkHHSyOUm0d5w@mail.gmail.com>
Subject: Re: [PATCH v3 71/97] target/arm: Implement SVE2p1 PEXT
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LVnJSuQwdnyk

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    |  2 +
>  target/arm/tcg/vec_internal.h  | 74 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve_helper.c    | 27 +++++++++++++
>  target/arm/tcg/translate-sve.c | 36 +++++++++++++++++
>  target/arm/tcg/sve.decode      |  6 +++
>  5 files changed, 145 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
