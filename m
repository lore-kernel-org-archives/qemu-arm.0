Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1514305njc;
        Tue, 10 Jun 2025 06:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1n9+FCnj/ClAIJrvFpMwziN+8UmqhSWqo9S/5FuwCHyIHtBjETB3JfyWvmMyntimpdHpiH2hncKKeHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHjfZpaSgl/xMN4spnenXVITxOYHU5j6TcR5tbCK9HQ+SQ5wkr+Mzig+Z62ksifPmugZzmn
X-Received: by 2002:a05:622a:2305:b0:4a4:4165:ed60 with SMTP id d75a77b69052e-4a5b9a04192mr316274121cf.3.1749563965779;
        Tue, 10 Jun 2025 06:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749563965; cv=none;
        d=google.com; s=arc-20240605;
        b=HckGXRVGATMSkkJXvtcuUoRwXsxQenrP+pLocx9VcBlB+7Tj2U00+lExMEMLV/dogG
         YxxfBB227GGGElVR/uNHRbDwor/cMEjCLfCuEQEIu28cIKSaHgfAY1hlwd3cy0t8MYZ8
         Vw5Tuo40donOHcWJ6WOgHqclm4rDYduaZQIqGog0QH1AxjEx2ft5JXCJf11tz8mdP/O5
         YJ0bnW8w02VGiGO7hNW4Qfmr/cRXLv005pheF83Xs9zwmI0KUyjSec68b+OZUjdDl6UK
         dSVBOFeeo/ASGcUymkj4ngJ0fATa5tB+P5oBAdJPbeiaYj4+jrwsSoNh6K7+Y9CiKcwF
         6J2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Tn5YmeUOssp9njr5/DLp437/HWWmTrAYEkvk2kK3IbY=;
        fh=RZu+sF2nhtSNYXkxbzgRG86XtWKkYdnh2/TrU3i95IU=;
        b=g7AANXN4Smo7QdPwbeuIfDovGfE+YnHwcx0A9lw8GrgXeZB30OksF8m56cVphGU14T
         dBLfSgFkNwGEEgadZWbVbbOp4bxGruX2VMq5tFgWKKpLhpXQKgGvoDSyVOcWXvb0lJqz
         ei0WssDg/tLBovYesANn3aiwFX3bVxoz9jVjZdjiYx/DgDJHZUIJv7eC3Iicwnp8KQmg
         puJ+kmjibN5js23j4M+3yFlVNpJk+WrqJJi2BfckR4LzwUpoCF9KIvQ4NBlQjm860ITt
         IZCsd5HbMD67My8NRODWXEEiGCoL5++ckqdyBtOEf020ciwbRbMzY/KSHiO5EJDmnU7Z
         KU4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m7uWBcTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61116b02asi112494531cf.82.2025.06.10.06.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 06:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m7uWBcTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOzVJ-0002vs-1G; Tue, 10 Jun 2025 09:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOzV2-0002v6-V5
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 09:58:48 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOzV0-0001XI-0R
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 09:58:48 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-70e447507a0so43773917b3.0
 for <qemu-arm@nongnu.org>; Tue, 10 Jun 2025 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749563924; x=1750168724; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tn5YmeUOssp9njr5/DLp437/HWWmTrAYEkvk2kK3IbY=;
 b=m7uWBcTVUZib2i1fALHMDMahRUsZIqyJcf0IFEV1XQmKa181MJRIvPi/nWRHdEPIIi
 NEQ1WW4RVe1I9CFtq+E14KhRQgXBRmKHdzS6iJ49CMmq+kAXxpSut7yyIzO0skbwjno3
 9RNs+R+AsEFDv0dJJAoZjnGkXikOaJs3sletm6psODvMh/HN3+ugyBNomHGrFMTutEuK
 AeiruFmRITmOcbn8MSNxoOSAQKqp7yQn9vw3b5nGK3JCY1s97TTdG4vQQEqjAPRn0clt
 4mHk1SzEe/pSvdnJG27kuoF75E/Hx81zXzFNWS0cAbaaVZothVpihHJMyfOLM+I1jORw
 qOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749563924; x=1750168724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tn5YmeUOssp9njr5/DLp437/HWWmTrAYEkvk2kK3IbY=;
 b=jZYtHrRe/fz5rHtfuu870XT2eAD5eCRc+yyqnxEyRWdfkegjwAUSMnGBICviVd/rr9
 fUkm1jN5bFHEcv7h+WXPzy2sPzJq6MhAo++XQKc2rrjoTUJQVOhe/0CHzCWecBYEGdrN
 1YfRogtMte6MU5HP7158KsPJSMK/wtNBRCCUJcIz26eDVRWBuxskJVgTGniNy8udWxhr
 W616ade3n+1uY+JG8E0jiKdJUaWNzURiwzR6kO2AYK0mP0Ng3drB/PaBYuYEaWvFashP
 JUUXs2kgKPiKjZCVgIpBRZqnyGs98ikRgSWDY0paCPWvqFTJn92wie5Ki6RUJct1E73P
 A3sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgTLRRIxMtc0pNSS4ozVcOvjYsUTwxVlt7rW4ecg8FoC1GfhRZ8+Fi8apcsfxi41kzkPlbHiiB6g==@nongnu.org
X-Gm-Message-State: AOJu0YzZAIeCIyWcE/rIr/JAvp+Eqy85Ce1Nu+/crc+6e8TxD4eWLPdk
 A0T6i5XIcW9hHk42EWRD6IfQKW+uNf6uDmzHotm+EeelMw2IHQQIFa/ScvkiYDDEGGiw+puInG5
 /viKAhasIY5B7VxzHZTWNzD3VN5b7H6hf0q3+ZfeLTQ==
X-Gm-Gg: ASbGnctKYXuSB13B6VTv0iPQ1WbR7+Lj1vswiuSNAuHdkjwcaZfg4kwkgSCcXujcWhi
 py4A4q2fIJilFZxHKpbRqpKgOqXBvAOv8EJCL5DQnZfXI/5AWkSyGyRRCuMxfwHA/aSmvVyoWU6
 ds4zc7ZgSyYW3XagDxXe8zZTD9PpqdXd/hfJ3JJSOyG9Lj
X-Received: by 2002:a05:690c:1c:b0:70f:83af:7dab with SMTP id
 00721157ae682-710f762d432mr220003697b3.4.1749563923702; Tue, 10 Jun 2025
 06:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250610012851.1627715-1-linux@roeck-us.net>
 <CAFEAcA-aznHrcSk9xfmLHkpJTiabjd4oX2KnvC5TXkkLgW6n8A@mail.gmail.com>
 <50464a50-1ddc-410b-bc5b-ec68b895b797@roeck-us.net>
In-Reply-To: <50464a50-1ddc-410b-bc5b-ec68b895b797@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jun 2025 14:58:31 +0100
X-Gm-Features: AX0GCFsUd9430EAQHL8DAZPHE2TpbvRHRYfiYqun59rrgCCqagK1Fn99e1MNJAE
Message-ID: <CAFEAcA9CWeEmrZ5vTr7M-UZfH3cp5Y9EZUeGPfc2s75Tz2-K9g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/npcm7xx_boards: Add support for specifying SPI
 flash model
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Fb8GgexM1KvT

On Tue, 10 Jun 2025 at 14:31, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/10/25 01:42, Peter Maydell wrote:
> > I think the question I would have here is "is this the flash
> > device the hardware actually has?". If QEMU's using the wrong
> > flash type, we should fix that. If QEMU's modelling the right
> > flash type and the kernel doesn't implement it, then that's
> > a kernel bug and the right fix is to get the kernel to
> > handle that flash type.
> >
>
> That isn't the point.

It is the point from my perspective. This board type is
supposed to be modelling real hardware, and therefore in
determining how it should behave we start by saying "so
what does the real hardware do?". Adding extra behaviour
that the real hardware does not have is something that
has a tendency to lead into unspecified, untested and hard
to maintain complexity.

> Yes, one is that qemu's emulation is broken, the other is
> that I wanted to be able to test with other flash types anyway. I understand
> that this 'violates' the idea of exactly emulating some hardware, but I want
> to be able to use qemu beyond that.

Why this machine type in particular, though? You say in the commit
message that aspeed lets you specify the flash type.

> Either case, I did some debugging: For flashes with sfdp data (mx25l25635e),
> qemu returns bad sfdp data (at least with quanta-gsj), causing the kernel
> (as of v6.16-rc1) to bail out. For other flashes (mx66u51235f) it returns
> no sfdp data, but the upstream kernel now depends on it.

That sounds like a bug we should fix. Would one of the Nuvoton
maintainers like to take a look?

thanks
-- PMM
