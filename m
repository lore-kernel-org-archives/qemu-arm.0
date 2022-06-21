Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1369341lft;
        Tue, 21 Jun 2022 10:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUlY3jxXnvXyY7a2MWpj6J8nopmOxtFqb76K9tD+fxtbwDBZuQ4EUmBKfuqvCRmTi+Hc8k
X-Received: by 2002:a05:620a:4016:b0:6a6:bfec:6d6f with SMTP id h22-20020a05620a401600b006a6bfec6d6fmr20755504qko.735.1655832933203;
        Tue, 21 Jun 2022 10:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655832933; cv=none;
        d=google.com; s=arc-20160816;
        b=adD2g5jA/CSjtzOO4K5gWk91IisEzaC900iCpuHKp3saTWspdWCAjhf4rX77MmZIeB
         wwdObmwFmAvyuYctnrHo+ULEpUtjavADoZlC6d5cP8npcnxyVdREk2kjwsmiwAkZOfyz
         /ZXiuspJhW6F/B/RGB6v+jh97XH01bJheyBaNIvTXjoiiAqh9Mufc+CVJRUJ8bvUoBRE
         appQtcLySjmlLXU82V++MlczASke24XuoIlm4lE9ZZhWpVP7SsWm1vqm8qkNdQNp7q+S
         YOvsDzmGAWXhBJuzN2uXv30NIYrevkJsOtcMGN7yiUTp0zg2qfgslJaK39oQ7gnE+KzS
         3YWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d9ZbXmQLFhnX/3ekXkvyrQROH4oz1tGU4TXGUU5TFME=;
        b=ymiljSz3ziK4vvKBTJTvW9eVwdH9n1e7xHf8eSFI814wlspo4nwFgij8ySJFglE0Oi
         lvYccNAiaQFwPkq7XbTBwiqAL7XVKzV+b19K+bJKmSKPSEboWhIMMf8veBfEonSSDfmS
         2RWaPRfd1FMTa43L62Ti/KO3HpnjQsIPOmXglkDAxcsou6OFff4YI3YaqJHx2qX9tSth
         BE/34EOf2t1E91c9w02S4DK6yGizd6Hrgh26dAJrEALRjH581nU75bm+WmN+Ii1no4RE
         ArXuuUS6eQbbyctgHpd5xQcGfHuTcoSWEbRq4Xffeg7YvuRIZ3905GqXvCOPOLL7QGHo
         am6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8GLYDDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf3-20020a0562140e8300b004705e3a98f8si336232qvb.450.2022.06.21.10.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 10:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L8GLYDDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3hmm-0003Q8-Kc
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 13:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hm5-0002rD-6P
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:34:49 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hm2-0002L7-DK
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 13:34:48 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p69so14009294ybc.5
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9ZbXmQLFhnX/3ekXkvyrQROH4oz1tGU4TXGUU5TFME=;
 b=L8GLYDDQTeAHLZCH1u7v6b//rZCow6FkVOijrqtcBBaYwKzmKjDvO9uf/orzUJDYkw
 t2qmgI1hP6B1vtp+CQp9ChhGcH936oDPCrv5/ML18PC5zzy7KzNUGKviPwjJ5P7Rezzq
 HsBOrbER4mY4trGt7mM8zwMhS21a/moazpu0jdA7Nmu1OXW8A7TzaVpwsSXpZqHj4yzM
 OkUyUm9hj/iqS6xOINpOvTDLUA023g2ioXR4D7PA/TUAAl9uNVL4utxQE8P27F12g7RD
 +WRItr6p5SQS2HHK+xiPim+PX7KbtSz3h+j1z7BCdAshzigbZOG47NM7PkgpKWHQapzL
 oMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9ZbXmQLFhnX/3ekXkvyrQROH4oz1tGU4TXGUU5TFME=;
 b=VebBbJRxt+cZgXqYKrsQq768Fm05f7JPN9JWLICeGUy3JHJybTNxU6II8f1c56btWi
 9sBb0SoR0OI193vNW4hUYYcKMa/tZMLjtMbrFBFHjbYhU+kohcFG4ZEpq85rm69bKzMO
 TnKzdcmV8BWEX86uMToHIL8+kEtsRc+lSajAczPWWVO5zTc5chCdOZSgxClMuYSuoFJJ
 6kGBbhPWLWQleOKf4CLD5hUX423sZSraYu39I8Cxh0vO7YXGEMByrdU1ezJ45PcxEWwJ
 q8pt+mm3/yYw5vgVnT60I1bNTtESOFLUK54qVmyGFOhVaXEDYU/5c9GCoqjvm2guJRti
 ic1Q==
X-Gm-Message-State: AJIora87VBOYIqYI3AWVlestH2sMFiZRK+Bb6GYeIMrOZE1C9ppRs+1/
 LJMPHnGzysiGsJHU9OgEEXmNM7DJULR/+g63BD6VaIXhhTo=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr14319015ybr.39.1655832885122; Tue, 21
 Jun 2022 10:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220620192242.70573-1-agraf@csgraf.de>
 <20220620192242.70573-2-agraf@csgraf.de>
 <CAFEAcA8=ThZ_texhcH2vqMicpAxOR9G1jtpCyBDbz9gbk5yg=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8=ThZ_texhcH2vqMicpAxOR9G1jtpCyBDbz9gbk5yg=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:34:07 +0100
Message-ID: <CAFEAcA9kRP+dHj=a2OFnx0k+d9FSnQShjr+5Ff85tLQNZXZoyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: shjlapDh57uf

On Tue, 21 Jun 2022 at 12:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Jun 2022 at 20:22, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > Some features such as running in EL3 or running M profile code are
> > incompatible with virtualization as QEMU implements it today. To prevent
> > users from picking invalid configurations on other virt solutions like
> > Hvf, let's run the same checks there too.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
>
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          }
> >      }
> >
> > -    if (kvm_enabled()) {
> > +    if (!tcg_enabled()) {
>
> I'm a bit surprised we don't need to also have "&& !qtest_enabled()",
> but I guess if "make check" works then we're fine :-)

In fact you do need to handle qtest here too, otherwise
lots of tests in 'make check' barf on the unexpected error...

I'm going to squash the following fix in and take the patchset into
target-arm.next. (PS: you forgot the cover letter, I think ?)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0862dcd63cb..d9c4a9f56d2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "hw/boards.h"
 #endif
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
 #include "disas/capstone.h"
@@ -1490,8 +1491,12 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
         }
     }

-    if (!tcg_enabled()) {
+    if (!tcg_enabled() && !qtest_enabled()) {
         /*
+         * We assume that no accelerator except TCG (and the "not really an
+         * accelerator" qtest) can handle these features, because Arm hardware
+         * virtualization can't virtualize them.
+         *
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
          * cpu_address_space_init()).


thanks
-- PMM
