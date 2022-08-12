Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1050037ejf;
        Fri, 12 Aug 2022 03:31:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7l0OH4vG1OAJ2arVuvmTHES9VS1mHX4vYkMRgAEbl0TXkl4Cxk2oWN7/LebfrT3cKUhnJq
X-Received: by 2002:ac8:5b53:0:b0:340:19e6:38eb with SMTP id n19-20020ac85b53000000b0034019e638ebmr2884700qtw.1.1660300316175;
        Fri, 12 Aug 2022 03:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660300316; cv=none;
        d=google.com; s=arc-20160816;
        b=WkbTviXlK4vHM0i4rTnGD72fG40uqUbu04pOaAVZ+67lEc4obpuv4XYm7jl+wVnL9D
         dMJwXQgXZZ7wiz9D12G/hvouo1lEkhTbqgKRgzWKt7+WVZqRejfsffnZhTW3vVJsp61e
         zRtjZAY3WohKBMjthN/QpvSht4pIMqpxv047AgPKl5FBP6L90+LR4DRrlhFr+PYcmGoR
         CXaUH7sbT8lx3i7ggcOSkSZciJV8eqmR+knm/5MwSbVT9ckMcCBviiuq3nOBvnBDCF1L
         NfZgAjfio0I10ooKF9dLGv3EuYi9b0yr2l8Kh7B9hkqXpABP5SndDIW2N4AtDcr7hIsa
         ndDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
        b=ZFOMBFVetmW8p1F/B0z7rD0F+GVyyrJDRpVrnWhGzegXIlQsFA7yna1Fp6cJuFHBdj
         MqBj3Ua85gJty4La4LHgl+WFQtlglFrrOCZc0qb9aMYH0fPK/SA51wNNikG+o7sT37A2
         DiEccxJP0PqU7JdWOxu9rlRwOMmafLU2UcHqH6CHaBOaywohi6RfdiezvdejoBKFijL+
         uim0MmHRgPprAjszA/8cY8Q6/sCnV7AdBDfI6Fei3LMy9F56/lbYBUqd8BBSaS00NjLl
         uHEVjj9o7IfTh75ZX/X2kK4FqU+1Fxn9R0l8A+/1LegtiGb2FqgENyjl3j2DK59DQrJp
         m5Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=razmEO2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a0562140da600b004773d7c107esi1003183qvh.145.2022.08.12.03.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 03:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=razmEO2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMRxL-0006mJ-FY
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 06:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwc-0006jf-E3
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 06:31:10 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwa-0007F8-ME
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 06:31:10 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-328a1cff250so5865957b3.6
 for <qemu-arm@nongnu.org>; Fri, 12 Aug 2022 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=razmEO2wGp6IpnOsJ4GgLYlvFOOVvyDghrnq4wDjSV6yqwup2EX4wnPMaKxNOkHJPj
 tD+WK+JSNp0dldg3PHpm2U8/dwDZKS7ApQJGs0yAJyhI97pa4+Nfvc7SUPyFCrN/+q/7
 z4myMa1PP/D0Aeyzt5yh6c7GBIdCIwn7+/ErjC7z0Jr1jExQ26SnBThJHXJs3Q/rDl8K
 NJR3d/r+/IEP8UfSMACljr94p/HNTzQrgFmBj8KNQxi3ASBDkehvatAigu+0wO7DP2sf
 D4V4+hS88j2+axvL5eIgBe7aaJpNwquphcbQPHUXq3lI3cDypXNBOOHVWzRShi16spfq
 9MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=kKaqAKyUyo8AOo1+M10bh2kSHWaJBxeadeF1yrPjB6PtyL3491H+v2t4XC9HzGSCwQ
 7e0T/Asx64wtK+bZEcvo/4qh8ONDlCW6NEDQ/CuFq1VoIBZ38/53aeYx8WhMd/TAgsd8
 VsnVLS9P2mKUU0njl8g5HNriF1bvO+uvS2FVWe5HjpAHPg51HAjXFa/W01ypI5fSX2jT
 Bv7SsBPqheaKt/U1vRlaqfkHKG2Qr8tDJ6/jxyfkUL6LQsTp5qzk5sPUSEoYhShS6pO5
 IxPsI+1H1zlapyyw495JgnT3C9zil+e6E7OOMZemEYn6hrE+biQngxIxzjsox/0MtXiA
 fYdg==
X-Gm-Message-State: ACgBeo0eWkRgOb/aWB/xtQoHoylAtEE6QaAm594sVm3rUs4yCaAGpS08
 Txc7h6fFYOcmwmm+bWpE5wop/ySGLm7lK12CszbL8/uCd+w=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr3294063ywf.455.1660300267482; Fri, 12
 Aug 2022 03:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:30:56 +0100
Message-ID: <CAFEAcA-yFBJOTRrVdCM+YESKxmsPHGJA58mjcREt4erRKv=3vQ@mail.gmail.com>
Subject: Re: add qemu_fdt_setprop_strings() and use it in most places
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ujZ+Fqs7SMlA

On Tue, 9 Aug 2022 at 19:57, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a helper for qemu_fdt_setprop_strings() to take a set of strings
> to put into a device-tree, which removes several open-coded methods
> such as setting an char arr[] = {..} or setting char val[] = "str\0str2";
>
> This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
> is not fully tested over all of those, I may not have caught all places
> this is to be replaced.

Hi; just as a minor process thing for next time you send a
patchset: the usual convention is that the 'cover letter'
email has a subject starting with a tag like "[PATCH v4 0/6]".
This makes it easier to pick the cover letter out when eyeballing
a set of subject lines, and also helps some of the automated
tooling (eg I think this is why https://patchew.org/QEMU/ didn't
notice this series). Usually 'git format-patch --cover-letter'
will get this right automatically for you.

thanks
-- PMM
