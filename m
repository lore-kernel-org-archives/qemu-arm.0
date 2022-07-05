Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3921940lft;
        Tue, 5 Jul 2022 05:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLJLWgldmnnju7nOTt1W/P+rlunj/+0MGCcekMoVFwyzvwpvfuBB4yuRX/EUVNuKG25Zvt
X-Received: by 2002:ad4:5c65:0:b0:470:b1fc:4f3f with SMTP id i5-20020ad45c65000000b00470b1fc4f3fmr31642249qvh.102.1657025318414;
        Tue, 05 Jul 2022 05:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657025318; cv=none;
        d=google.com; s=arc-20160816;
        b=wGMa06gfvcQS7zTwP/dnzCLbczxvLSXoLIxxLlC4XM3TPT5jdPncB0cETqCeBezHtc
         1o5f2fE6RxqBPxtYdEN8WpCy2NJ/r/mh7yqX2V+UvTEAXoR3ClR67tYzFUmwXPKkTFNi
         rQZXYBbGMHkRnMZXQg1rMOhPr9qmCfxAEjjDakq0gwW2c0tjGlFsSel+hTNPOjbfJBXq
         vYa9Wli0iNQ2Yaot78Lli+1CWRLimLr6YJNHcrU18bP4T/xwAru2jTHm5ZCZtAWwxCz5
         n9mT7ZDM33qT/8uHPFCLT8QhJRbneKmKjCEhExDexiATgE0h6kPN7WKORW4NUz/mAVc6
         tzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G1jdsHaorJ47REhue68WT3lR7jtxuvIdxETmaX7/WBI=;
        b=sFHbIs9MRQHCEYpvYsePaL2zCV0OS5oFHq2If4IF0TfZ6K2WUgI59qBXz/gV64bEMT
         1O0+nt7A9airXGA7v7iYFBmCMACVy0IuEO2Ivi/MLap5nyhu9ShfMpAYIsnq5bVl1fhI
         OezGsFJbileJnvZpTaT8qbC0CHaqUiqsL7ydcMvNpsMxxbbJAgk1NxswSMEBkhPlX+p/
         fn+v/G/oMDhIuf5Oyg4p4z8OUYEsSAtJccsoZpqa4JDCQ8a/1qENDqvdd0iqDI6jw2Qt
         Hd0MAqLwRBN3XX+vTH9PpiQa99lV5Cuo6GjJ8LZjA8U9G0ONPOIO/qkK5inIPuaxN4n5
         wQLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XsPhtamO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a0562140ac300b00472ff2cf1cesi2650193qvi.433.2022.07.05.05.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 05:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XsPhtamO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8hyn-0003XT-Sb
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 08:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hyH-0003UG-Av
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:48:06 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:43644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hyE-0003z8-KU
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:48:04 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3137316bb69so107299717b3.10
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1jdsHaorJ47REhue68WT3lR7jtxuvIdxETmaX7/WBI=;
 b=XsPhtamOcxpStr2A/iS+rBeB/TZoVStf6oec0mIrN/hoxJhZjlFAoyiRO66b3oECJ9
 ghkAKsIrXc3MrwG6FkmNPcx/I1N6qdLq8Tkql/2L46J8Aycq8veP0hCv5h8wnbIerxPw
 c/N9fEeyxXe2pgHDFmgitpnyEf/MbM2ak6Yg6JiizXBqQsTC8P55VjWzmo9ktraYgPm9
 xLfV6CCy0wkn6H4BM1M3tNq2ph9HTen8BD2S9O3R1hZAhqsTBcxcf9rm0bPkUm+KwbQB
 LRnDhG24OqHYEdLVYSTdsGJNOr5YTFI+fQK2pLjckCM7EX71q7aWR+8I/gDt7Lg2UJwZ
 d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1jdsHaorJ47REhue68WT3lR7jtxuvIdxETmaX7/WBI=;
 b=Z0fXwId2D97nviXqU7gy4oRn1lWuG07HeUWT6CaaRxkFh3VG7A9XJWiN1FpNre05ai
 gI1H2dRCNN4/t5XgrGHsDG9U4u5j+6ZD5C/u5etkt7z+62bLLBONQQkcrMMkYyIG1xe3
 +pFAjAYigKf0eYY58n85h7F0Iq9RByrXmj/9WnJJi8m2/ctkJzOgGiSVZdXKWVuTRTsv
 l2EDRQrtI4HI5+Db73qvLL3+y5jI2UFrIbJDpuLprvNrGv++dzeGHnf9m6cOF/pbfRKf
 e0+jLtj+/1tLnoFyGaRbZzFT0i+0EgWBMama0wATNQwr55qvXhDcHXM38o2Q1pkukeK/
 jndQ==
X-Gm-Message-State: AJIora8hIwSd0byARP5QdrzEAU3388stKve9h4NgllcsjMJ1UELd71PC
 z9FGV/pHEzJ5Rj5kTqS35tHtSHZmreCFjk2ltkZ3AuLMhmc=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr5967754ywp.347.1657025281257; Tue, 05
 Jul 2022 05:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-6-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:47:50 +0100
Message-ID: <CAFEAcA-N1odQdvRRjHP=BOG3Rr1WkfX8pDfEmfHDyrq7+9MOMA@mail.gmail.com>
Subject: Re: [PATCH 05/62] target/arm: Use PageEntryExtra for MTE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQjFlLHIXrn8

On Sun, 3 Jul 2022 at 09:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Tagged pages are indicated by the page attributes, so we
> don't need to use a separate bit in MemTxAttrs.  Further,
> we store the PA, so we don't need to recover it by walking
> the tree of memory regions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Getting rid of the messing about with the iotlbentry and
the memory regions makes this PageEntryExtra work seem
worthwhile on its own, I think...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
