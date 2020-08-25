Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3312284lfy;
        Tue, 25 Aug 2020 03:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymSYiWcbb5JHkQTNsEFvhZNoxyrSbJtjhyYFuCRENJtV7uFrVf7aZ9dvvB/jwJhycjgriM
X-Received: by 2002:a25:ae24:: with SMTP id a36mr13646300ybj.439.1598351640483;
        Tue, 25 Aug 2020 03:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598351640; cv=none;
        d=google.com; s=arc-20160816;
        b=x0lpZBaxnFD0AsEOpli43csZ/58UjFh9qxbn9pjjmC4hXciiwHd5OzcC4QnFPZipk/
         s1N1wlURdYBXKiUOyaWU7Vae/LGuaCUymiydblzsmivAWXV7bnEXV2AY9FclmjqFHRIG
         9r/9fxKFeMfRBjp8OopxAD4lKcrmABrh3xiArl+Kq1EBHwDe1mVTH9AsDEixFHSFpwsi
         5hGnQmSgNumttGSyi9efbfO2cBxBmuXrRA6BbZOWPmsb5bmQd2JzvxXZT0oDYJkCZF9n
         OjQLiJkGj9CBeC2VU2+g1ihZVeFm61+fBmc10E+waXq39wP/JzVuvzKCVOCt3Lt24kZh
         NaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/H4UAsoboTbt0kuCesmRN4mvJj9vK//j9IhLDKcpFQ=;
        b=yuxNGqTLp5qelWghMrf63mCbVvaFgIg3mQauwtnSVMcxCi0pZ6fcHRkBbHZ5QD2jDS
         mX4W1kL59ndQfGdgJa+QBHcU2c5G3O+G1WjyFy5cgy5sXU2Yvk3e9Y7cnPC13WA3W8Nj
         9kXIWW62L+YJWKKvRXxA41FnhgQ9xQhP66i2O1dDDhTKr0YDXJb2d9jPZ6LHGGqq1v0t
         zshl31PNgNiEKtH1KGmmnrYyDDRqu1cCvI4ftciKlKHjSqwwTdektxGYNmkzvRIAb98V
         tKOp+qAC77WVIDszL4kIv9w83ON1RyQy9c/StwHIKjGWMUSrm4/znsjR1kW6Arz5xLI1
         1KaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMGQv9sx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si14450808ybk.108.2020.08.25.03.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 03:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMGQv9sx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAWH9-0007gT-SQ
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 06:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAWH2-0007g1-Ij
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:33:52 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAWH0-0006bp-Un
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:33:52 -0400
Received: by mail-ej1-x641.google.com with SMTP id m22so15828908eje.10
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P/H4UAsoboTbt0kuCesmRN4mvJj9vK//j9IhLDKcpFQ=;
 b=oMGQv9sxppoctYlqe6rus8+0zEcV0KroOZ+PmJy+p5kg9GH3S+sYH9kYID4pGloAMO
 B6Mkrc1A4TK+XgPnicoq62Hk6lsF+j/96dYKUvVPwRyzHGnziRWwkqfboJ/XlSNOno+8
 ufW4vHoASZ6PxiDGumD0G/WaB6QLocC/mBE46ejdGe8zC0XIWJfTQdGe+hI08lic61lQ
 tnxzpOQML0R+wvpTI/Hirr7Eemnbop5OsavewBq0z/tkSaY5ofY+expSNySfsuEOCh/C
 wJWD+X5Uu3iy+yncaxxfh9h1NTBtlCg1pCtW27/HJDgS2b/R5ju9h7jbYlU4iOFzwWzh
 JB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/H4UAsoboTbt0kuCesmRN4mvJj9vK//j9IhLDKcpFQ=;
 b=byoLG/rV2Sxnb22DAzGA/GSDBm8ChVueaUWawNtjQ0oewV/WlMOm+LZiqObPLuyoHp
 mm7Z/Q9jC6gMiyc1ooEOPIGlvizfjdOtkBDus1391XL3pp6qmlklD4lLut+9LgxM1d68
 6JGJNXcNHOLyB7odfkbZvKUfDSXYrRed6f0Ei9Eo3FJmQ2e0ngmttpxP0xkE1jy4zOou
 Z9BjohpnHZFDZqTDghR4XdlLaLd5SCDo7nfF0zhye7I/ozpvGTcW0MM/2z2LdP3o4pXa
 OiK8x6v95LI5i0Tlpa7f0HSbg4f/vlKrS36L1lQFgQJvd8jSLA7P03i2t+A6uyhQ5WXp
 9b5A==
X-Gm-Message-State: AOAM533lA0Op9QuBY1QvCyUk9fLvAx6R+kNz7ivKgl4S4RYXqabYkmaN
 SQD8j2T5kO0BV2bJ+D0sP/MiMOvz3QqN9uumy8Z/4g==
X-Received: by 2002:a17:907:2066:: with SMTP id
 qp6mr759376ejb.85.1598351629374; 
 Tue, 25 Aug 2020 03:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200820133201.80577-1-graeme@nuviainc.com>
 <CAFEAcA_9WRk0Dr97wpDHacsjy2qpmBBq=kp6hOQTvUOvpWF0zw@mail.gmail.com>
 <20200825100757.r54ba26kmavntqrb@xora-monster>
In-Reply-To: <20200825100757.r54ba26kmavntqrb@xora-monster>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 11:33:38 +0100
Message-ID: <CAFEAcA9XqFeMYJ=8-9usxO-Wje4PFUnKPCHHecq7Ds2ZOdY_fw@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH] hw/arm/sbsa-ref.c : Add a fake embedded
 controller
To: Graeme Gregory <graeme@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7mJE2BmkJvt

On Tue, 25 Aug 2020 at 11:08, Graeme Gregory <graeme@nuviainc.com> wrote:
>
> On Mon, Aug 24, 2020 at 03:59:38PM +0100, Peter Maydell wrote:
> > > +enum sbsa_secure_ec_powerstates {
> > > +    SBSA_SECURE_EC_CMD_NULL,
> > > +    SBSA_SECURE_EC_CMD_POWEROFF,
> > > +    SBSA_SECURE_EC_CMD_REBOOT,
> >
> > The last two are clear enough, but what's a null power state for?
> >
> My personal dislike of sending 0 to hardware as its harder to spot
> when using scopes/logic analyzers. I can remove it if you wish and
> explicitly number the states.

Yeah, just number the states 1 and 2 rather than having an
unused 0 named state, I think.

PS: when you respin make sure you're on top-of-git -- we just
landed the meson build system conversion, so the way you add
new source files is different (no more Makefile.objs, it goes
in the meson.build file in the relevant directory instead).

thanks
-- PMM
