Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1831701ejc;
        Tue, 12 Mar 2024 06:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhbrvecpGdQRZ6vCVAO48gU+w9uChGSwYh2JUvOkjVkdRy99uTQqWb/Uc8seJvJPdh/riHA2nuFg3XUoWJlniukcPqO1a1
X-Google-Smtp-Source: AGHT+IGqFlr7n5H7CS6diXn7TEDWNvK9F9NEqMbVgqOmG/8RcTU23E2Vgv9ZrwiraMp5/D/pRv5O
X-Received: by 2002:a0c:f948:0:b0:690:93ca:5387 with SMTP id i8-20020a0cf948000000b0069093ca5387mr11208121qvo.46.1710251187358;
        Tue, 12 Mar 2024 06:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710251187; cv=none;
        d=google.com; s=arc-20160816;
        b=O8mxyREcPT8o7fLTkbIu0g3KdnfZZLUjDaplKueiNzQJkqeiA8MZm0MUQSrUtMjlV0
         miqVWZfsdVDK6LD15Dg4/HK7I7RE/mDxn/qeL3k1EJc1NQP59i/0y6RPx7tj+QhAJniB
         Lc8+7yyZzHFKn+s9Qs+BD47qhYjdPtbYYGpf27XFnRTP0USarFGMjy3iSjfS7Xxrzfrq
         5lhIxl04OxT6YX4YEWly/RhOeJFfJEXJ6t2A39ham/p0tV7neO2RYVobA7hRAn+xSDpD
         lJ4eVC/iqa7edJMMSjf60ETiZDXf3B3DBy4/iR2reO/OHqIg7+dF0T8/LUyhd4964vXp
         khTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0nuCH0lUKepozMTC55u1rjrwveZBff92fyq6UaK9boI=;
        fh=BS8C7SHxKkPY1XzD/97iRlC+LIRy6ZfPDMNG/snkh4U=;
        b=POmCv9Kss+Hy09dNUg+MaV8BSrEQ4AtvgGbBtXgBmXkHycAjEqOVozAWfTCS46541I
         63VVRWNVaCsoyJ1/nZwndNEoZbX3dyG0Uhv5OP4tYiT05ri48Lknv7sC1BYsmbKD4SZX
         7GuNdr/RW6hF4brgM53h8+WcgURSCejFoGPnTgwBriVYeti2TnoaGeFJTXtBiMddX0Jz
         wi6HyLlTHzbFopgShzqKvURQFsAEpqI8qWJ5UBsWl+dcrk0kySpinizruGu4rJY+EAoR
         +mwAmLvxYaGlj/clGByJ+1x9BRDDP43/dSMzLl4kHnbpCl0LFC/8NSGAak1LnD7LHOJk
         2NOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HDerLNkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020a0562140d8700b00690bf197750si7491139qve.572.2024.03.12.06.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 06:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HDerLNkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rk2SJ-0006q5-C5; Tue, 12 Mar 2024 09:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rk2SE-0006bW-9y
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 09:46:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rk2SC-0004SQ-P0
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 09:46:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56847d9b002so3908706a12.1
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710251163; x=1710855963; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0nuCH0lUKepozMTC55u1rjrwveZBff92fyq6UaK9boI=;
 b=HDerLNkwFaHc+acUY15/Qf/NXBtDuwH+Lh6b4zf0pdccyq3mQwX8krx2iZbdXYTMEy
 7BMBBvP5BaF3Id+U6G2MLqtfcL7VEMi6A7jUAbUi3SrA9NveIqGXoaM/jD6EMp/44k2y
 Uo2APRl4RAg/zaMiHpSEblmoUR/AAEwj4yWpUtQugbMqQbKGPM6rAXN6pQ0P9JJlm7BZ
 /HrDVKi1wUjYmLJEbXy1p9B+7JiaUTgiH5dUGcZVeObvhwpnXNa0D15EjeLngG8HJIw/
 2+Of3gmnB9E9bOyFsjtN1O8WGFhp0NLn/E5pk4LnbKSxtS9BwEzOsRHaPyUJf2Nb0Xl/
 5ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710251163; x=1710855963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0nuCH0lUKepozMTC55u1rjrwveZBff92fyq6UaK9boI=;
 b=WH8OqAFj/DFJlWMljRKftbo1vslftR5Y3a++k+S+e8XjUqSWx7Mwig99l2DeRxvW14
 HK1Doeu3r81Ivxfez5s794RDqeQCaEPvkMxC4sA61C6Pm2iF7iVU12EK/xpsc5bysN6O
 rfof5LjSBf8rXmk6SzW49VdURqGQrjpH1T+TEsMGaigpH+IDwY1c6An1KnBNK5D/rDqR
 /+UUN0LiWhmSVF2LJXUn539qaWzCvBokmJrYhCkmFjzzpvzuGICPwrF17i5D5+LvIze7
 fch+62xJqRtbO127V688BgHwlYpi3rIPXbYZKk2zYTAvXzMvxYYUF2723HR4X6vCqJJ+
 6aUA==
X-Gm-Message-State: AOJu0YymrbCXrK9EXTzwU1SOZ9HANIiCozGOQVEoSuJIEUoPHziTkBsc
 0fZHobgEi5WhG9Rlbk1lHunnO+Th15q5fnWKx9oCv1llLFbwo0X3Lc8ZbVL7eVNmI6YY3BqVtyw
 V/CCVidWq6yJBg458Cq0mZXDH7/92e7qwDldnOQ==
X-Received: by 2002:a05:6402:901:b0:567:17df:6bed with SMTP id
 g1-20020a056402090100b0056717df6bedmr340535edz.25.1710251163042; Tue, 12 Mar
 2024 06:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <1112676651.2089918.1710245177914.ref@mail.yahoo.com>
 <1112676651.2089918.1710245177914@mail.yahoo.com>
In-Reply-To: <1112676651.2089918.1710245177914@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2024 13:45:52 +0000
Message-ID: <CAFEAcA9r_iXsg2jFS04yw2KDoaiA7uQJk_aF4SH5nx7PNd2V2w@mail.gmail.com>
Subject: Re: Machine type to use with cpu type cortex-r52
To: Prasad Patil <patilprasadb@yahoo.co.in>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6lvk/9sy1Xln

On Tue, 12 Mar 2024 at 13:09, Prasad Patil <patilprasadb@yahoo.co.in> wrote:
> When using virt machine type with cortex-r52,  I am getting error CPU
> type cortex-r52-arm-cpu not supported. Can you please tell me which
> machine type to use with cortex-r52?

Yes, the virt machine type is only for A-profile CPUs.
The only board type that works with the cortex-r52 is the
mps3-an536. This board has been added very recently so it's not
in any released QEMU yet; you'll need to build and use a
head-of-git QEMU to get it.

thanks
-- PMM
