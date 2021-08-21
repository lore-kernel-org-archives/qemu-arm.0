Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp526618lfg;
        Sat, 21 Aug 2021 12:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN2UWFnQQJ2KVvQ1Ekef+zr+MpG0drvA0gbURFE6wyf3aQ7INWArC+ZZIDiUhCE5CxqY9u
X-Received: by 2002:a92:a012:: with SMTP id e18mr17141983ili.271.1629572833510;
        Sat, 21 Aug 2021 12:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629572833; cv=none;
        d=google.com; s=arc-20160816;
        b=aug8YFTG+mLsyMOtcg02siLjP+2FJVa6EuRu/I8QY3DF0IxlvQ5jUOuQO1bZQ3qZyX
         CDv9w1p01Plmjrl8uf5KgYYZIC/5XtIflCLsycC6LMp+8ziQEa1TQrtpHHFLNd+Keowe
         SCvo5ZlUCsSJll0hxJXkJ+4B9Gbw8IjzSUqOOtFdJNSpV8mBddQHPc3f1ojhBBpWccqz
         4a+Z8JRWOqvpNWUJAgVKefxI6Qr90QXyWDsrsg33SyYgR2l5WFOwAY2gikJZxqz6XvPr
         3k5BikjV97klMA+mbA9F0OzeXR67cAoCm9shXiNmdmW/5dmQYbIxi3XLpfbUQZWpEnbz
         W68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ELjMJlR1CJv3rN0TrwyybDjp6WRAdqelPanEcJPtEoI=;
        b=pwjw6xYxzDZeQ3BNoHhelWHlP7R9CKZz4myealveJORSTOHTQ7M2XPxfpd/WFr85/m
         PpXikoRMbaS+C5YezWX3cpL2bWCvMut0+emX6lwgYvF9gcL93qmvdEaV3xO7A6A/0a3S
         mQnov8lcB5KViC6WpRxGRQAnyGn2r8z88WzCpxOhSgkG4d+GZjRl8m3s8WGzzSzAdu2R
         KCfgOuqq+8MMlrLIrVjk8fQQHFlpI2AlaOAg3kauOt6rHrAvXAYPyrrLeLXSfGzlIlBT
         hquXG4UrgrvPkTfmhdivf+9dppd/BB7WxU+4w0OmBCOtyfoX3JEd+7xzm9SEEGg/DFoV
         Dz8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koxpZPui;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si9964766ile.120.2021.08.21.12.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 12:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koxpZPui;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHWKm-0006IP-Sx
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 15:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHWKV-0006Hm-Hx
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 15:06:55 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHWKS-0002oE-Re
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 15:06:55 -0400
Received: by mail-ed1-x529.google.com with SMTP id s25so6454736edw.0
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELjMJlR1CJv3rN0TrwyybDjp6WRAdqelPanEcJPtEoI=;
 b=koxpZPui1jQlOEnLQdmtvpNPMsPhE6Uk9cyNAZrN4E6v1MbbE5G88WVIX1FBrhsYPd
 KClVrRFBBP3/nil5NOxmjlq+2FIr/v+VVMOqABfTJkGxGvuqgEYoM+LemuOHI2TgKEzv
 Hy8tj9IBJSRjIz1fQ7aAd6srlwa2TLfqGBLAbjavu9Erfs9cLNjWNTE09zOFt0a2mafD
 XpF/wTIZFxhckC7Z0dRuoxPrUV+izsDk0g1g6Fs40Ne3qUdmNRFRKU+4bs5reob3gWJ6
 qFYhnE4b699ocHYCfJ6k1A7c/UpHPbKrM+ieRogJVZ2W7zY/1HAlB65jVqG2ze7SH985
 2UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELjMJlR1CJv3rN0TrwyybDjp6WRAdqelPanEcJPtEoI=;
 b=gbPxfK3Hai8NEFlMpqGCDGbcwbGb6JSENrfpBhJoFhHOvf5VT/FDasfY5BMqaAUfm6
 lqnuUaKxHXLXHZgw836BYIhflINzO3umAB6empGaksBlJJWscttjqJWMz0TUQMT9fT4W
 6LH7DPILqGlixSRi/U7gtw+wOaITdwd4DJ/QgsKZ0S8+rdOYPDgiFScmZZ2Vmx2vbjjC
 FTzXJ0wQGasd108nir7ioA03xOIgGWtJp570g5waZbguJs3uKnywJ5mw7+dIFjS4YMwH
 IW8E8Jd22uGeweZoADpRyKdJp91KpC5Q89WMiw8hbsC/QSOIcJlavvxsQhcOWwGFOL6i
 QBrA==
X-Gm-Message-State: AOAM531qzq5EQwDEju3b65GchTLXx0QLcSxA+3Nld97wYrMJMtLKZFiA
 f6CChvDwF265HXkQvaE2I4dE/bGhmNqE8QOy6XkRGA==
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr28826087edc.204.1629572810867; 
 Sat, 21 Aug 2021 12:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210817162118.24319-1-peter.maydell@linaro.org>
 <20210821185912.22401-1-richard.henderson@linaro.org>
In-Reply-To: <20210821185912.22401-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 20:06:04 +0100
Message-ID: <CAFEAcA9DQHYsjcLDEmhGN6Hfsp+i1keU+8SeYEf8ZA5hs_dyFw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4vDtuJsn5sTu

On Sat, 21 Aug 2021 at 19:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> > +static inline uint32_t syn_illegalstate(void)
> > +{
> > +    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
> > +}
>
> I just noticed this should have the IL bit set.

Yep. (I remembered about that for the BXJ trap in the other patch,
but I wrote this one first and didn't remember it then...)

-- PMM
