Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp665764njb;
        Thu, 4 Jul 2024 08:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsPzhGohi/udOtpU2molaX9fnYMwOtOlK9jwUpxewpCW4Sr6dPw/mGKO7Likj+yHnd8TS7XQ600csZR9vJgyGlNvStK0w8
X-Google-Smtp-Source: AGHT+IGAbTyoQFYlklKTSEBNmEP7qMCWzW4yrbkzBFTenrSVGS3lHLwXvd+Q7t2EjtWW7egnDzig
X-Received: by 2002:a25:dccf:0:b0:e02:b1ed:620 with SMTP id 3f1490d57ef6-e03c19a34edmr1939380276.30.1720105315049;
        Thu, 04 Jul 2024 08:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720105315; cv=none;
        d=google.com; s=arc-20160816;
        b=Xa2SOhe6HhOQAR/Uq7rJMvIQEiVmPWCySps3Hdzbl5NEDekfWWfGHJTXOlBIAh8uTY
         xUqRWhSD76a+UZiDyavI+QsVbvfUSLbGBliTBDVIMLOE70wuOqaepClfegg4XuLUPJVs
         nA49ze48DEglMg3AMMcp3A2uorh/MnNcM8EoqAqDrgo/tc2Pkv1VdT+pvS0CkDsCoQ4j
         XfOBxPqxTew+TNMrInsDTWCYq0y2/kV03KLB4BHk6V7kBZCJYrnTYsrPYHLEyK3Ty+Wl
         ZF/c8QshuuzRAz/KwdJB99gxVExvVF7mOxirndx+BpsZXkd+qH0XuYDCZLSp3j5zrKHG
         wzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=z+htez+DmcCiNT11InJtmwIXm25KfRv4bbSjPEjgIHY=;
        fh=xwPCul9d3dYE+V1F42L/lZbwQK7FeGrFglaZ3cPRO0s=;
        b=BrVUzzgtlGnICbht1P9F6mQulI1cjSnD3W75rbYooglbJ/4tP+rj6S6mhx27utZytz
         uitrUjFIetTMYKcQ/kwz3WyBTtdUc86xyXGL3L9/nhxAntOT1CYXFilwfWDFv7LS2h9z
         n13Nxbyr30+wlZfpvI2wK6fDs/8mVXeQrzUOayfEcEDxsJWuIXgz0JoTm+azm1ZmTCWM
         p8znTHrZCyv9j1uDgcLF/TzAMP8XM+V0+3JP8dpTT9IBS8g/9e69W/+UzW3QgpMlCps/
         0l8yHkYzFJsNlCj7D/u5BDQWQ33+rzAPIT1GKE0oHkQagXJjclX8V9QgDhXgHzf5lW71
         KTRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EH7mn24a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e03a42afa68si3190492276.730.2024.07.04.08.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 08:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EH7mn24a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPNxh-0001iY-Un; Thu, 04 Jul 2024 11:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPNxW-0001gb-Jy
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:01:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPNxU-00035m-K0
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:01:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa6c4so424770a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105275; x=1720710075; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+htez+DmcCiNT11InJtmwIXm25KfRv4bbSjPEjgIHY=;
 b=EH7mn24aBBf2P4LNQ4kPa+y5U1GKx8jBLJ9zOKm1T3PG8mC36espKgqxxtEL3uL90h
 t3/tNwsUtAjBLfhaVrxuYaUBjc9w0nBC1WxqttjeU6I1bHiILVFULQ9L/YD0csRLEZZJ
 5KZfhYgr1XmVMiQWuU1KTyGsZ95hrkp9l70tYgNyRBlqi5KGKrMB7gNTN3qHQNKn29Ck
 yuXN75vgpn43k04MnHdRnV0mWNyGc8+kDgRLDobvxyskFpvOObyoCiODAFf8jsXMyQSv
 iLMi4DgCLgiM/asG8AU6KAhmGe2iPrAwQApsRd66iFqIoWxg7AsLl9xbqi/lC53J6HBX
 8bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105275; x=1720710075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+htez+DmcCiNT11InJtmwIXm25KfRv4bbSjPEjgIHY=;
 b=RpHIFjRUdFDacTFm75tEJXMW1+osJjrbSQdSJ7CPd+IDq+tz9NnC1LyjjFwnOSbmYw
 8bBW9636wUShCsfWZ3rtiP/TMBhBfv1/AdqRK1E+J93GsdT60WJZz+D+AfQF4sBzE4Fz
 bM4YTzWIAgQxRR0DmLUQ9F3m18sYQbKqIDWka/3hCtOQ8dhMqACpPQK4/Pmnf6w3XCXt
 wAPuxbSqbLkv31amHjABjHJUoO1IXuVTbpk2Ja53KNyMLkJoY99ltLgd+7At5ce+GhXu
 1Fd8tXKhUxdMxXiFsQH2ioFHqDxZ/h06b4ax140fzzhrFwPjKqZlXl4ov3c1msgyQdtR
 sXiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKiysod9m+oAy8Dk2xf+atbfxj7GQBabkdtPw5MoRDY1/gNRoUs0BPBnaN6VjK/UM1DSSYz/t1e/90qo0yxOxYiaYo
X-Gm-Message-State: AOJu0Ywo453XN8tduZh6xP92/cz4/3X1YqHq71kBJTIN5QhQee1Woiby
 2HUvDiNCj4qrx6x5dG5gEx/w4LlRVnl6YeFi3tyHUrv/sn9Lyh0AfhGFIIKyhCPBBs/wxhAZ2RD
 lVcXSrlgLdyrNJ+um2r6dJgOdORdu4W1IlS7RdA==
X-Received: by 2002:a05:6402:1ec9:b0:584:a6f8:c0c5 with SMTP id
 4fb4d7f45d1cf-58e5629b3f1mr1571313a12.0.1720105274924; Thu, 04 Jul 2024
 08:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240619124903.56898-1-philmd@linaro.org>
 <42de8f25-3624-4e7c-b38c-ad8e3b8e61a4@linaro.org>
 <83667101-daba-43ea-ba33-1df547020cd9@linaro.org>
 <ebfa6ca6-d93e-45b3-8786-cb52505e2d7c@linaro.org>
In-Reply-To: <ebfa6ca6-d93e-45b3-8786-cb52505e2d7c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 16:01:03 +0100
Message-ID: <CAFEAcA9bqgFwxsbvKFLUiGu=ThzF0zAy7-rD+7Yo4yNEoi4Pbg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Always build Aarch64 gdbstub helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FSezmOiO34aY

On Fri, 28 Jun 2024 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/24 09:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 28/6/24 16:31, Richard Henderson wrote:
> >> On 6/19/24 05:49, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Merge gdbstub64.c in gdbstub.c and remove uses of
> >>> target specific TARGET_AARCH64 definition.
> >>> Small step toward single ARM/Aarch64 binary.
> >>>
> >>> Philippe Mathieu-Daud=C3=A9 (2):
> >>>    target/arm: Merge gdbstub64.c within gdbstub.c
> >>>    target/arm: Always build Aarch64 gdbstub helpers
> >>>
> >>>   target/arm/cpu.h       |   8 +-
> >>>   target/arm/internals.h |   2 -
> >>>   target/arm/gdbstub.c   | 363 +++++++++++++++++++++++++++++++++++++-
> >>>   target/arm/gdbstub64.c | 383 --------------------------------------=
---
> >>>   target/arm/meson.build |   1 -
> >>>   5 files changed, 364 insertions(+), 393 deletions(-)
> >>>   delete mode 100644 target/arm/gdbstub64.c
> >>>
> >>
> >> Are we attempting a single binary for user-only as well?
> >
> > No, due to ABI constraints, right? I did a user-emulation
> > smoke build, no failure, did I miss something?
>
> Well, no.  But qemu-arm does not need gdbstub64.c.
> Given TARGET_AARCH64 will be set on a combined build, I'm not sure what i=
s the fix?

Richard: I'm a bit confused about where we are with this
patchset. Do your comments mean:
 * this patchset is OK for system emulation but we
   should (later) think also about user-mode ?
 * this patchset has a problem with user-mode so it
   needs rethinking ?
 * something else ?

thanks
-- PMM
