Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp753509ejc;
        Thu, 23 Feb 2023 06:02:21 -0800 (PST)
X-Received: by 2002:a17:902:c403:b0:19a:880b:bfd1 with SMTP id k3-20020a170902c40300b0019a880bbfd1mr14224319plk.40.1677160941590;
        Thu, 23 Feb 2023 06:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677160941; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCUjeiV5aLitU5h9KYhh+O2fz5JD2G4kDKkS5XAc5rxJB+KVlsODJDAXkNnRMSnou0
         /49rJQdNDJBHgrr+3TaJIklFvBCWc47EQ4DTQ9bu0LA7U70ehjLax/AMXqKig9kwBvKR
         7dOJXWsO1eF8BonCxgbeghoFpxSOnJzMRukzUzes+J4KxVM4dMg6Zx9584yNG4EJ1lGe
         7XRsaz1OPC1CON5apn1aW0TIwlYxa6HzSlFHkvlmyJXqUJC7p5sALsNe8jbzyVUcKErx
         JTG0LwyilFDCz7gxgcNj2ZB2EOuhKm0gtAR1sPoBILF7IRsUeAtonVGet5z4JvzntIas
         ZWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4rLBpaBId70U1KNxGgyttP7w8pr2e6fzXdrSWAqUoas=;
        b=eZ0hD3az+GNoX5hSHaGh+XHJ6Z5q9jV8z+bQik5g9ldSbD54vkD6oZgw+8PTxMA9Wy
         U9BmZDo0CQhIaxve92J10uuxGTOUQV/DkukpDjANc4AY00QLZFVwOG3bzaJ8vWvYv+42
         OVTCWWByhccK5AoDJmtFccaTUQImK2wLptmn3/+0cGGgKtMAl8ffB18CAjuYGkcVnYx7
         m8dCYd5RojtLXaWWdjcH6Fm8zHappeTJsRyq1EXTsEO71Hp13Z+xuZT4lCVrkKarSKiO
         wmO8FI9EwdRJ9TasnRE/GSHmDGZHU0z0krAzocN0Mo/LuWBoLh/0mZN5uyEM6E/PjW4J
         iyKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aTzuvWwy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p5-20020a17090ad30500b00228e5d8a8fdsor2960661pju.15.2023.02.23.06.02.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Feb 2023 06:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aTzuvWwy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4rLBpaBId70U1KNxGgyttP7w8pr2e6fzXdrSWAqUoas=;
        b=aTzuvWwysxT3PqnoUP2CJMXTzHSYNJgBcmzG0JzeweTXHR/nXC7+fTy63vrLzRymUd
         IX9NmF8dY7yipHomWfcH8zAss/K8x2uyqtmiZahk6NVgwuzWaw0EyFXwDYEh7gHMXIAk
         E6gAJu7Nhex3zRnEpGTqLUi2OF7NvMI5lXweUdjfJm91U1lOFnGqHzgb3EMw288+ZxPa
         W8OVfHxy8EiDDYbP3wwBxrxqddfC0Vq7B/n4hEDi3pZhgXiNe0B3nMU9shzxdfH9gmEx
         dmzmU1lkIbvJbm/+pBpRCKur217OIyAlyaWRS0ezXj1T70rCAaXQko27bn040Mt8f/Dx
         H0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rLBpaBId70U1KNxGgyttP7w8pr2e6fzXdrSWAqUoas=;
        b=coAekU9kFcDR2J2Aqv0v5i8sKgIrULFWWs3qlU3asiL2K1hq9sIfY1Na3JSshBxaAi
         x7ZE2uK5k6bIqyAaz3HdrTa7Co4a9NikQ58ETi5FXYcBlpEp2FALGZiYrMbRniLJTKwZ
         2+qiEFaJawLVBxaBCfnAGId5HcuQ6kt7zy+RbIdIAWMpRdxE/5R9FEdQT/1DRu3sT8OG
         rZw3aWf6SjuVcDhxV48cdDTgSqhLpozAG/ctRRhxvl/1IJhVsbMNC1mXErYYu+GCarIK
         ooHe8nKjxokOQk89DA9fX3JWhH6mOeYE9ymx0+OT72gsuzldOoEfRL7zYi7Af17MQSkB
         Fv2g==
X-Gm-Message-State: AO0yUKVf/S3xc4q8mXOjtMsg9summeFbmD5rExJkPeLFRZkxopbosjzg
	jjwy+hLfzwR+frX3VXlLj2GlF+y27rpLRdJSpZq9cB4h
X-Google-Smtp-Source: AK7set9riwq1WEWdxD8If0BjBYSxehbAV6VKwD8PSWbiRW59GK277M/pXpi7iBlTC7OnJbcNK+qPgagJIz0bOekQi14=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1127182pjb.137.1677160940968; Thu, 23
 Feb 2023 06:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-2-aaron@os.amperecomputing.com> <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
In-Reply-To: <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 14:02:09 +0000
Message-ID: <CAFEAcA_aX_rebT5jwiOUAQLTz9u9Ps607twYeeWT13voQswV7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: EHI3Z/3NDOI+

On Wed, 22 Feb 2023 at 20:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
> > +     * psedocode, at least) as not being implemented by larger values of this
> > +     * field. Our usage of '>=' rather than '==' here causes our implementation
> > +     * of PAC logic to diverge slightly from ARM pseudocode.
> > +     */
>
> I find this comment scary -- "diverge slightly"?
>
> All I need is once sentence to indicate how this is mitigated (by testing pauth2 first
> where required?), or "See function_foo" (where there is more commentary), or something.

Yeah, we structure the one place the check is used (patch 4) so that
we only check the pauth_epac feature if we already tested pauth2:

+        if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
+            /* No action required */
+        } else if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
             pac = 0;
         } else {

where the pseudocode currently has:
         if HaveEnhancedPAC() then
             pac = 0;
         elsif !HaveEnhancedPAC2() then
             old stuff;
and is relying on anything with PAuth2 not returning true for HaveEnhancedPAC().

It is of course possible that the pseudocode might be rephrased in future;
I think the way they've done it at the moment is kind of confusing.

thanks
-- PMM
