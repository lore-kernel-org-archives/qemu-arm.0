Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp299614lfo;
        Wed, 3 Feb 2021 07:05:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxU1j185S4WbJL16LHB9+4JNYj44z3XctNDA/d8m2JdqEqJE5E7v72zPlv03Oyswjms+e84
X-Received: by 2002:ac8:7773:: with SMTP id h19mr2822609qtu.213.1612364730868;
        Wed, 03 Feb 2021 07:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612364730; cv=none;
        d=google.com; s=arc-20160816;
        b=bOk4vZevJmdloZRORd9VyVPsZxpkegVES9aMzj3PLOfOqAw6tqlfGVTqzJ8Gor2yWL
         XuY7ZT/6vNXuYVcZ/PHvmsEJQfo+AK12vFbHCgsuyLhlWwEyW+uPnHxFtWi4FLM+Y3rj
         WuvTZ+fsef1IW4eyZQD6dpjuXckgQjK1DhOmaMcHJRbtNmTkTCOMPeBkgJpAVUnEoutj
         JboCX/9Ut4oqHlgHS7RiSSXec/dhAbXV3Msp09K8zklFFwZVG4LhSNMGX49wG8DF1kD0
         ezg6mjNwQc7CJlhR2OjOFUWJFaA+MiQulLF/2IFBe8htFAFV3uHyKXPYxwlKO1n3TbwH
         7rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sYjK2sNZ7YwEcqxCTbX/55ZyauI7vehyX9IyfM56pok=;
        b=h4ydKZcDjQsw2qjrZ6iqnmFT61MkLIcnwGOz4h+F2r2ySnkI2Akixe+OmrG2gwtrwD
         Jaj6c3YCvmb3CV8DXwz+KX5s44q6q/iqgvzz/iH+WBR8il6YzGENvxUDAfXh25JjXtPq
         KVqwdBLucqbwfPOgcd9McdH82OwujLjjUp9njlz6XUHnXmBgiUJiJjgOV7M4hLVTNzqB
         VZcAwY8wTRrGOXV0WL6owAvj/GnFmrMa5Z3QXlBC1OE460ljJoyAeYzfpdJ3P4GD//k1
         /Yt1BlAgXeJQ84+znuxZm+0Z67t9FyVNekQdXzORw/EL/xXL4S74i6PtLPRrbtfBKmUQ
         KsOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lQDctnkK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x184si254709vsc.335.2021.02.03.07.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 07:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lQDctnkK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Jik-0004r1-5W
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 10:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Jhp-0004nt-G6
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:04:33 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Jhn-0002EI-VZ
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:04:33 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so27271934ede.0
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 07:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYjK2sNZ7YwEcqxCTbX/55ZyauI7vehyX9IyfM56pok=;
 b=lQDctnkKYpcs6fRIoeluFgdBvEvjdYN7OsEwqcXWX7hBif80rBjcrIOlQqy+VjeDf5
 5jEjqNXxa30xkyeU6kYvcTGG4NO/gcrDvnkLfUAO0IpKhB0DxwG15ImFHfbPQoVhAFrb
 mwvdwzVISMgzaNcCY5WgZickxfjF3IX8RdUQsP0M1F81cJDTsZqEB6rOFBXmyrLBvu0R
 NBEa9GhrIKb5Ksl0BEARPMIhZzY+xcfkINExtCRfi7bU/oX/4qYnjMnyuLTH6JiOtNRT
 PgrYhAQetNmgBTrpP3NLuyyVh+LUEIsKMQBFUBDUleht4Cy1zhfnPW4TzSUwow8oSmPO
 TgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYjK2sNZ7YwEcqxCTbX/55ZyauI7vehyX9IyfM56pok=;
 b=OzNdKzqsOu5Vi+MEUCTKBUCFtMT+s1XaUY841YMOf9zdvXCttZNAtUNnySEP7E8rzd
 79gJeqo3lRXDPMXPL10ba50vLmWLLJfRauzXsJ2xKRYBx65hVpBMWzfGYNxxNnWjDdo3
 WkoZYBzu1WhAQGZ2cx112rQ1GHQCIfg9FV/0tDRH10efWAqM0yVfCrtvwotuMWpzSiOn
 jFb+JIW+m18RaB+nky5Gxl0RLfAs4k9s2As1XJID8FWjiOGcdpaHTcMyBtAbvPuJWOop
 OQ6B6rNjrBUkAcSRjK9Hlw9ESngKhHslflXOHNhR6JHk91lJJ6xsip57Z5qomF/kWzBQ
 OTJg==
X-Gm-Message-State: AOAM532Dm7k5SWihdXgz87/D2zr9zrHoNBv6SVsC2WyKNZPWRP2HEmnE
 ufChE4xdEVAjR/2r9Oi8uFsl8Z+R9NVGrpAnKtMotw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr3376206edd.52.1612364670122; 
 Wed, 03 Feb 2021 07:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
 <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
 <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
In-Reply-To: <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 15:04:19 +0000
Message-ID: <CAFEAcA_y2G62w13aK+8tKBGPYUyt8rUFKeXV8reovSaG6JV1TQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Michael Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vU9pLJq/pljF

On Wed, 3 Feb 2021 at 14:50, Michael Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> On 2/2/21 6:29 AM, Peter Maydell wrote:
> I see what you mean. Does QEMU support AArch64-only CPU models, and if
> so, is there a way to determine if the CPU has AArch32?

We don't have any currently, but in theory the support is there
and we'll likely end up adding some in future.

More specifically, in this case what you want to know is "can
the guest ever see the AArch32 view of SCR_EL3", which is
"is there support for AArch32 at EL1 or above"?", which you can
check for in the EL1 field of ID_AA64PFR0.

So you need a function similar to the existing isar_feature_aa64_aa32(),
but which cecks the EL1 field instead of the EL0 field (you could
call it isar_feature_aa64_aa32_el1()). Then you can test it with
 cpu_isar_feature(aa64_aa32_el1, cpu).

NB that you must only call it when you know that the CPU has
AArch64, ie when arm_feature(env, ARM_FEATURE_AARCH64) is true.

thanks
-- PMM
