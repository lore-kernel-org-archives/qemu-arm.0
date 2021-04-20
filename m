Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2073419lfb;
        Tue, 20 Apr 2021 05:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye90GeiR51uV+rYmyrCA+z312jyiohfOF3ODQ/OV6mO6yXZV8Ahy0FxV8AtQ3B1xxREadk
X-Received: by 2002:a1f:9f52:: with SMTP id i79mr20310162vke.4.1618922028343;
        Tue, 20 Apr 2021 05:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618922028; cv=none;
        d=google.com; s=arc-20160816;
        b=LHheUKn0U1h8o2OqBk3fxZVgb5zQ0YuH3wTmWt2hWuMPtwOonwO48nEMpmygj81eRp
         qN+laIOWHJ9cwjLmNF5n4i8O0EXOZOUWQs0VjbaPe2Lq3zXoxDW7KmP+b8YLi1GH4/Q+
         idRRoKe2o/MGoHpTvLTMj7Ps7qMJ244dgymZ8SvJWyvoNujBb+puk925vag+sIZ15tbe
         7AmREL+zR1NX7OBiRKK49/72oABrfwTyVi5f+tbxbVltnVIzHeXTYdSuwVek9xPTUPBX
         +pi4tCEvrQaBb8K9d9J5pQSr6icWAlLGoaIAEgrrMfg7xG2xP/j7q4fhts5Sibqb0/ci
         NdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RqJVR5+rIPOod+Xo/PUuTHSPfdvDM4/KfxB399n8ExQ=;
        b=ggMEmyjZlCaDeiutxrg8bZThO/v8cCC4ThAW0rmersaq4EWes2Q4Jq5XgmwB3GZty1
         QqcUHaCWBKc6ITy9MmjYSb0fXSYLZNbmqwinnh7FiTMd71uPDLByochfGFHURrWCNvwr
         jDBiZdGdsITgqWN9X/lRjZrl1cmnq2DEO8B1+Wg1gqtCM/1ReAIs1kJdjlZQ+1mWWJtu
         j5+xS0xp1pFlsxjWanHaMhGoV7L0oDnnm03rFH7CT0uGg8pAJHsJNezB93cwPzouMyai
         DPGbugDCxqL/5Aflnn1sMGEoEwmlkcK13AEH3xpXmInKoOkxcJKRtvKd+bmBTpYZL1oi
         kAjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w4/KXM3R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25si4792418uan.96.2021.04.20.05.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w4/KXM3R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpZb-0001dr-Iy
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpZQ-0001ao-U5
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:33:36 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpZN-0004HB-VL
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:33:36 -0400
Received: by mail-ej1-x62e.google.com with SMTP id r12so58032052ejr.5
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqJVR5+rIPOod+Xo/PUuTHSPfdvDM4/KfxB399n8ExQ=;
 b=w4/KXM3RZjMEJ43zlW/401cWA/jt8c5hKjYrL4+DcfnRt5QhUavjL9qQcx2asxpWca
 tW24IDQA4UJ/DqxE4FBNj+AEK+l3uW5ttH0QeXNQNRarSb0rvm0JQI/jB1PmefYMvWaQ
 z+gElfOXEio9YTMi+7QrzpOGQvtRdzZNTS8F244hOcI9m3P3aLlmjCAqy+Kg/pAW3Ne1
 0YxnJLXBqS8aM6a51GFSMxM4BnoUR94Xt5ppcpYOARdePDhp+3dw1/e1kEr5d3P5n/1E
 nNIigRmwVrtZq7JHDUFUnzITNc4u30A5fPOqdjyweH6hVaNGcGk5UqsdqOBbrup3te63
 XcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqJVR5+rIPOod+Xo/PUuTHSPfdvDM4/KfxB399n8ExQ=;
 b=jdJKgJIMyCnESd4OkicMJydI0oqhV2NvJBQlrrdu8f1uzxXEaiwpJgm8hwBURvSOYI
 H5XZ14ECJS8eRjOMhjMOSxKp9JcD9Nxx68HiEWxSD+faN+2gwdhurjV71b6gSg8JFlST
 4wK0mVVfuORjnspHbKLgUdUFx/0+a9vSoR0iSPgVjgaNuEh7q6tixs7P/Y+9q6UifRD6
 cnHSADGlcJ9H+rdB3aaMxPxfUEdGDLsSXkjAkjt0IK8oo3rdlnTsJkiYEw7yEtGgBMmB
 6gu2KeUpXOE9/ZI18IWncFy+2kqtRx+XKUzlVSQiJd4hysL9ZVe/kVhE9thl9dvhTR9q
 E/Kg==
X-Gm-Message-State: AOAM53142ssM3rGTnFYXTJzCX5aMiGDR4wkRi8cz/pRYHqrNAr4ZLR2e
 Nr2jzCVyHsmqyupNPhLgzXlkAg3JKaZBZPXHe8nFWl8M0P6W+A==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr27294940ejh.4.1618922011212; 
 Tue, 20 Apr 2021 05:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210420123106.10861-1-peter.maydell@linaro.org>
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:32:39 +0100
Message-ID: <CAFEAcA-q2paH4Cf6SbvMTN6TvQGEK5UPSZ5tYoPgPneYH-3z=Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2z5F/+Ah5G1

On Tue, 20 Apr 2021 at 13:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In tlbi_aa64_vae2is_write() the calculation
>   bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                             pageaddr)
>
> has the two arms of the ?: expression reversed. Fix the bug.
>
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

3 seconds after sending this I realized that the subject isn't right:
we flush the correct TLBs, but we might consider the wrong number of
bits in the page address to be significant if the TBI enable/disable
state is different for SEL2 and NSEL2. Better subject:

target/arm: Fix tlbbits calculation in tlbi_aa64_vae2is_write()

thanks
-- PMM
