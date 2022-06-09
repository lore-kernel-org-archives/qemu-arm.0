Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp535041lfb;
        Thu, 9 Jun 2022 08:59:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxPT7dJpjSOZmxNDSdvR6Y34uwPvhmDz/pc6urNJWT2IxbRfaMtlXdz9Jw5qRoa2nVkxWT
X-Received: by 2002:a05:6214:c6c:b0:46b:ab18:bb1a with SMTP id t12-20020a0562140c6c00b0046bab18bb1amr14728415qvj.120.1654790389256;
        Thu, 09 Jun 2022 08:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654790389; cv=none;
        d=google.com; s=arc-20160816;
        b=Vti1ZoymA6CD6u5u9jVHh8wamdXSsZJAuSUt1UKkyfV1g56fVdEaukMx/z/XW2X0xH
         R0dqiVhuVR6dQ3MlHG56P1Vu5oQJ2Dee4phavnolqCNDWzPKleUBRcQXQNiSMnMW2G1r
         AT+bdIesgaUoPX4h5B3iuTcvmPqGYdi20w6aZBG30efYN1YU7IgV4IFvDu3I6ecjr2ME
         G662xZ4mIIVmbamKSXZ7eN9ertJ2WYZ8E6MSZX4K5ZVUy7n0zd7Levu41jR95A8sHneO
         bwaXufCKU1ZZzBOhROvttz1/sHHrimf+6XEv3jkxz1WksJPGT6DLD+5w14C0leWHxQxj
         Hhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bt+k1ppPbC8Q4AzrO/YjEvK0xQZcRDyknrRhMupHik8=;
        b=qT7LBbV22wnCcGlq7OL8sA3LY03pLxNF9kBogSRlaMtUW3hsHqSsQrkmxOPJ2yK/0a
         TG7cWovYO0KXGH63FMABLNVDtTrAxX0ypIiT68cWPYJDVf/ghIyYnIdgyoQmJo00ThsU
         dZLYo9snw60byErKzKpsX39MpkXCtiVGhizKYHRf50s82YoZSAvHckzW6IX8d1+mzT/Z
         6q88oNUTvvFWLPtgey6jyXPLRJohrl6616RKljhV9hWDp1Dm5TbFvdoHZ5tlJNf6F3s4
         r1A/97POFS8Q2Gc2BkrNSjYblba05mmlqFXL1MJNvo8f3PSCRlkvPixnSA8BuE4hKHv7
         KRhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLn3h5qU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a37bd04000000b006a03f5acdc0si12372837qkf.319.2022.06.09.08.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLn3h5qU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKZY-0003kx-Ng
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK2J-0004A3-Jh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:25:31 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK2I-0000HO-4H
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:25:27 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3137eb64b67so43282427b3.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bt+k1ppPbC8Q4AzrO/YjEvK0xQZcRDyknrRhMupHik8=;
 b=TLn3h5qU33xIO8jUiLpxKJUWSwiIhr9ujK8begpLX6qX0FGvDdgFzN2/VAHKcIo+yh
 bdE7iyVM+4vLmdySlJu2OpeDQJ7SJzrnI+lCxje0f6byx/ns38j3XHRrYInz2/QhpIhw
 9ITAikI2CaHqXuQWg+kOHi3uKmyBt5nW24M323ABnIL8BX+HnDDizLuAH4By8RR/kPJ4
 dfasbTHbUjvqjjMkJeYTwP0H/6Mvo47Buq9lx521rUybsPadLS6pPoesXMiyE1Z+9DdF
 vSBC9LcI2GZJxfHIpg/GlIajX0IaJi6253soJ2MKveXZmSJTqAaQW/GxcDgzlJYnQ4r3
 +qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bt+k1ppPbC8Q4AzrO/YjEvK0xQZcRDyknrRhMupHik8=;
 b=22UA/vbpzR72Lw5lG1jWr7gis+eKyxEfaaRalP/+gpvu8h21Rla2g46y2ZVMKsYzkD
 4DTBaCpgbUrgtKg70kYpdw/FU8SbZECDD7gUN6JR9slxEb31iODbjoRLIOq/jIfQGj3I
 shTCsftpxJcb3BCeXpvju+/CrNTf9/0T6doMxrusKOwQZFd28FODzODvepUtuC2Dsh4h
 qSbi70d916dYMOrYnifIBuUGAWayaaykQBxfx233ZxB/mGuRt1et19lxySbvFeqykl9L
 MrYZj2V5JZlFC3zqVJn8OrbUSux0jEPzstZ5Wp+L1OR9DdM24Bxjs9Ee/hmHVCYf4KdN
 bx8A==
X-Gm-Message-State: AOAM530NrDQpj5t/PeHSpayxBtKQwGs+HU4F9vzqxxcM/NhP5KhsKdAE
 633IiENjLnfyQecinSzA8qlN/G9TwMSQMcOuz0tBAA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr43752021ywb.257.1654788323961; Thu, 09
 Jun 2022 08:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-26-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:25:13 +0100
Message-ID: <CAFEAcA-V8xdEJiNR3poaAGXSM9pJkJPtuAzPeAXaSB6C+nkafQ@mail.gmail.com>
Subject: Re: [PATCH v2 25/71] target/arm: Add SVCR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YfvpWgFUsQ9H

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This cpreg is used to access two new bits of PSTATE
> that are not visible via any other mechanism.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
