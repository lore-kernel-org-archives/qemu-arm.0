Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2526831ejc;
        Tue, 17 Jan 2023 08:36:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsD1EuCQwNKOMx1cVCxirDyxIDpyzUQKKHsp/Y83oG9GKfZ2DZq//heUCUSW595uACOc1Ar
X-Received: by 2002:ac8:5401:0:b0:39c:da20:616 with SMTP id b1-20020ac85401000000b0039cda200616mr35943527qtq.32.1673973375640;
        Tue, 17 Jan 2023 08:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673973375; cv=none;
        d=google.com; s=arc-20160816;
        b=RwNd/qGdoJl2xG6DXSLWBjIcAcs382t55tQvkTPWgESCUdC/IIWSeOdjb4GL0DhOKK
         ZieGVqDaOEjhqnLvZ69zDhJ7jcF3TVydzz5MOn7FsjYPXIyY5bXOhd/gL+eZ63nkkY3T
         P15hQmSo/wKFQDp3n2Dov0yNJaGsuZv5KkMazgRRsM1OETcTdHwI17NP/8NpOzZzp7tC
         ovKgYyryLEy7PLfwYFlmeWIUmdQAbRoSjyAs0botq5OTnwLi0cMmXxr/3DuOFZ0puL3j
         H4y/5xJqPWj3Hq2sgYKIJRFAer6nRsy0WNrAnfmObWITeTniYkKLbxvda1ydGbBgqdKC
         snhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dS/ggcPZBvQU5dbidRBE62qE4/4oYfJnjx1QRD/AKsw=;
        b=qNj82dfgAs+1bmFZwJDg51deHMS68fFUEyrzLHNE1elOl2Bn+Jjne7FkOmeU7MyHR9
         PBQ5DN1srim2b1pFgnvD4r20cmzJAkdFJFEIZKLIXjqy8QMopjIWu2GVsBcDZm2ZojlD
         oHKOXbJwlbXzyMtEyZSlAJjzaUkjpaLlOXN3NjQrAa+dDi5dF6rWQVZEkDCQY0VSs6iY
         o6JUflVm6Cdro4I77ZwY7hojqYATfwNGvGlG/EoQ8qz6iMBgl/JuPqW/bVOvU74a+eo+
         53G57sO4Jihq+EUigV8mOGK9yWGjIJiQqlOWUvFCqUpund1c6qWt6qnjXwfn+RnK6FS3
         +lnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paSeG8m8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020ac87318000000b003a7eb5d5790si18125017qto.664.2023.01.17.08.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 08:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=paSeG8m8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHowN-00024o-1d; Tue, 17 Jan 2023 11:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHowL-0001yr-Hc
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 11:36:01 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHowJ-0007jq-T8
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 11:36:01 -0500
Received: by mail-pg1-x530.google.com with SMTP id q9so22389019pgq.5
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 08:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dS/ggcPZBvQU5dbidRBE62qE4/4oYfJnjx1QRD/AKsw=;
 b=paSeG8m8smVdyz8rYQVf6ZwgMti2RqOkSWY/kJpb5kG+6s651LT0nJ3M3QGBCLHUT7
 uhTvvDGtMaYpI77huCSVhMNeAR18cw1jnPK2se9fLUDsODeiNycxOW2yzMESpPF+IA+7
 HOByeVoD5VeDVFrgjP37tcbmj1oXug72Uv07M7Cpe9SCM3V7u2ro3YTTaP9azMVSx428
 libdcumOyAvMgIrm2PyUHMip1bROfy0QVdBjEiJ33YjdYKKX5b+RHGLjlWGKMqrFtVkV
 bijlDUDUZLraRJbO/FSuVQkspO5MOAb0L1ro76ejpY3ykzbelw5XYBOZep3WnSjkDnbq
 J8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dS/ggcPZBvQU5dbidRBE62qE4/4oYfJnjx1QRD/AKsw=;
 b=g02D/Y7RFxoxkcL0Ht+X+CjpTVwLCQHRdF2Ou1rzntoBxKKEsNAj0SpJRqhHbvV0Eu
 2I0B7S0e2NvRpn1n8W6SVHv9DeGioElp9mg7ErCl4Cl6SAaFlexvS9RgFzfQp+kbB9TT
 hKVTwqv0B4FqdJQruCwYGcqeU8t+89QASksUwsiPjPcrx/UeaPt4j5Qs1+qWHA0eWFuU
 Rzl9NihPJrLxv8DO8M5h7VbKuv/7mr4S99DxWEaSubWtct3kDoiMHxY26Fhc1hcCJ/1p
 2HLlh6ZRu8p6RALJ3/GqwnYdDDWFZEUYXoowXYlQ54XG3i1Yu76a3fMdOoxTqRtwuQLG
 gdPA==
X-Gm-Message-State: AFqh2kpUItK8rOxCGuPpcmi2+D74C32v8ZpgDWeX70dhOOoIZdV+kuJx
 w2+NZPRKSL1QqO15YgHFnFYhjsCIrErTMgYCbn2pQQ==
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr300768pgb.231.1673973358375; Tue, 17
 Jan 2023 08:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20230114054605.2977022-1-richard.henderson@linaro.org>
In-Reply-To: <20230114054605.2977022-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:35:47 +0000
Message-ID: <CAFEAcA_SfJkVCR2Z2UFE7nW+SAOb-8mTQtnNT44tu-M_ugON_g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix in_debug path in S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, idan.horowitz@gmail.com, qemu-arm@nongnu.org, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: 0EZoN93082Ab

On Sat, 14 Jan 2023 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> During the conversion, the test against get_phys_addr_lpae got inverted,
> meaning that successful translations went to the 'failed' label.
>
> Cc: qemu-stable@nongnu.org
> Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
