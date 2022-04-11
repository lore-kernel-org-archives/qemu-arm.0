Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1623222lfq;
        Mon, 11 Apr 2022 06:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmms1uoxncNCdZCmpPxaw6ZxFYFfH54jqDmk0obvn/l/au1CF0I4dTkYTM9YkiY1Vs+84X
X-Received: by 2002:a81:78d:0:b0:2e5:d440:d921 with SMTP id 135-20020a81078d000000b002e5d440d921mr24088406ywh.251.1649683768313;
        Mon, 11 Apr 2022 06:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649683768; cv=none;
        d=google.com; s=arc-20160816;
        b=O01VZtUGz7abpqglu+c3gOam0Ydpk18ehX/OdY+ueGY0aroLMnwMHKBv376Z4PpuVX
         VfWy60bx7Wt/S8Vkkki7u6W1S3ujC4ihnN6+VOgRdq1JJh5mEUBTYqycRFL+QOkBLT8J
         rBLqFvoKEk20L4WAYJWXEzm8Pzrp31GZTdyo3CEXRJ1HLyRA988HeU1dIjhVWCtpoDas
         VZE+oQLbmsTXaIBlFS2tyMvkzC7IZ7PDsiyo8BECDDNu4Bb73FlIGtduSSCWpgG9jt4o
         WldBXMJIAUYAvzMdSe4fu7Fymn0fbuUGCj8JlgOyLGunylWP6yhEVSRYjp1nvvNSfOL8
         OS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/0JHG7zJt0KLwfokgk8cNu4vbcHqLxDs223B2Lf098=;
        b=eWX5OxaGqVaniQR7C1QDvl7D6Wufo+m+DQsEZSDKPRouKSrj643bLmZj7zv2pSyX5o
         Ah2b/O9n/+eAmleZDaaSdspcFhKjDAZ6VaL21cvyQa9IaLxvEAyx4CVi2woRhPJ608/T
         XzbHs8JrEvXqHBlg3W77Rnz+PXjqWh+XPLSXvz+V1XdyDEihuiBWQIRXyIoNjTsmiAoK
         fiUlBsqeaLIMLJxsDaxRvnrEntvxmb30+nho7I6lUICHbPH7i4uNbIOHot0btiMRIqia
         VkvS1THRI6lfJ3/NPmZraHLW0oB+peGjlk1sPlPCNE6sJ8bGxHWCeGzNr9KEa3BpiEMM
         W9KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BjSaM8Te;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a192-20020a811ac9000000b002ebd4bddb15si3884265ywa.148.2022.04.11.06.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 06:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BjSaM8Te;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndu6h-0003Hh-Kh
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 09:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu6X-0003F7-81
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:29:17 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu6V-0000HG-Ok
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:29:16 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id g34so7540887ybj.1
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/0JHG7zJt0KLwfokgk8cNu4vbcHqLxDs223B2Lf098=;
 b=BjSaM8Tez3KeAPS0aT8ZyGxPsyFaSobVKW5AXZlgpqouogks7GND5Me+viUoKt3yaP
 cl/E0JBuEp/aqq5MuO7gyVqMQY+bkDtqa+4im1hI52vD84kPYbWo1bMZzQt0Rn35L1u6
 eiwtye2k5YmXaH/0//JCOFg2o6gj5v6QPU1u+z2fo9316P5UT0rEMgUS4pfEAUeaKp72
 8PcVzTBpvSV+GHAWGpgICFn/8cGu+lQctmSVUce0cktMTwaBEO768B1GE+frtemDUFXu
 QzUVTpGS3MVgLGKTN3MZ9eZrNdyBY9+SfYBTy6uvzajEi+1+qqDNbKuXSQp8WlWdTUDJ
 QpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/0JHG7zJt0KLwfokgk8cNu4vbcHqLxDs223B2Lf098=;
 b=AObacJErpThXio193gIQqclFYIdj3ZIPD1WJGuCSS0IasDHyQHijkx+9BCuLCDlUW8
 Zupy6GhjCnQczjKoB0l0DBv8qeZ/X3IJiXiMFzVTpsqrafrA1bVB2koJVyp1T68zIzYB
 aJmGH3enm3A53s8/Dt2utHCprsaFfAhN5f2ooOOXgRad1O8GZIOBQU3AosWYBo13GjQx
 zUUaeIeBt9NtF+bkDCiyDleziy5dFhtpl0H9AFMpJSdecSGSSH/bS9APFMJSiFzt8f9v
 A+9jIm0O+p4CwKdWO2BQrmSHMKba9xxqlCqdLQ4qozbfdcvlxoaOcKi8N5CmO+d0bq8Y
 JFxA==
X-Gm-Message-State: AOAM533nXlYHZMzmaemiccmJGJC6KupToTt96dQJCmat1NGgPBtrVvAz
 4PhT70H16mNvhvo2x6mFoGMgdVdGLOZqC395Jihaow==
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr9317304ybf.85.1649683754715; Mon, 11
 Apr 2022 06:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-11-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:29:03 +0100
Message-ID: <CAFEAcA84yWTfd2_81xad8MONQNjw=_fN=1++RLzR2qU3WE7KdA@mail.gmail.com>
Subject: Re: [PATCH 10/16] target/arm: Add isar_feature_{aa64,any}_ras
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lA+o8OALsrAh

On Sat, 9 Apr 2022 at 01:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the aa64 predicate for detecting RAS support from id registers.
> We already have the aa32 version from the M-profile work.
> Add the 'any' predicate for testing both aa64 and aa32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 10 ++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
