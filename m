Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1184301njf;
        Mon, 2 Sep 2024 10:33:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf38jpi2RRGwqkDyDwl1nhUJinreVOXab/7Udcl3MTsw91nCYiSkdApRXQXMrs4MX8HatVvTvt1lL/Rg==@linaro.org
X-Google-Smtp-Source: AGHT+IHHpPq62TjhMzvFfdCiUjS4EjCro3d8+gIxriRf1N0TVFp53VqG01jHANYtI+7oeTzS3qbm
X-Received: by 2002:a05:622a:2306:b0:456:6203:e582 with SMTP id d75a77b69052e-4574e802b00mr93776921cf.14.1725298424865;
        Mon, 02 Sep 2024 10:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725298424; cv=none;
        d=google.com; s=arc-20160816;
        b=XK8GTfLooBIyuBL0tmPqnksfkzQ2nU0TTygX53nUjaotJygBNrCCAkbLDXVG6LyftF
         tZdorxFkt4K09rD82Zh0emHwNv5FzVGXbeXSKFz4cUtIZ5kBqTLeXbUVp+VGM7fl+J56
         uGLmSPEbKVRy4uRx03GMVqnoAV4/K3QNtXWTV2Df+15ZzIkwLfqGTG0/jmxIcRBgK52l
         DYokCHTXFMvbV5RWFK9UDkEYN3cHR4ErojUo+Jv2Jlto1F5SzRWhQihgi59Pw/pBK4bg
         h0gyRaJrlfOq0t43VHaI5pSEqtmiX0Q0QNI4GV2IUWDWVWpQ8KFv+NIZWbQqI8LCUy5y
         MWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q0M7+w+qzUeOEn2KRAMs4FkPRHypJnpwjRKg3XGE8+M=;
        fh=L2JdWrARLE6q6XEzXDIJbyKXwLqHRlp1u2K2tuzJMVw=;
        b=rX3v7r1q1TqGKg6TttBbhji9fuGEqq1pYbSqSrG/8nozsHcdwWa0S62w5Lnvn/AdLn
         XCMHS8gRSWAXrskbCq7ryUIO7AfkZ7GqL096pGeIKQFdPXhHxaIY+d053nsWn2QlTdc3
         Ox3hW+7xkaL9YVSptsrmSlk0naNjZklxji65z2EYnx9rwAhdzvaRqamGrBeyOa5iwxya
         QDpco0NKW4GppIJwEwIc1leKro/UnU9KxD0NUc6YanYywNHvVrCtRZ3ihPBNOLHbCyrD
         YtlPTfHmvY/jzE0Lrk4/A3LLgJijketuyUbdIaeT/7OLsSeT4/Jz/RcKjdTCA6tuitlZ
         qejQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZ4vxUuD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d427c1si110696601cf.291.2024.09.02.10.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 10:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZ4vxUuD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slAvt-0007u5-MA; Mon, 02 Sep 2024 13:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slAvs-0007ss-5Q
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 13:33:40 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slAvq-0008F6-6P
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 13:33:39 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso46980831fa.2
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725298416; x=1725903216; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0M7+w+qzUeOEn2KRAMs4FkPRHypJnpwjRKg3XGE8+M=;
 b=KZ4vxUuDQFFih3PkcfiUV6m9sFeKxExK3fOOO2h9lHqadsGVswG285WmsQsyJmZJD9
 u3TJMk7R22SQJdwmm/iLlf2cveqIq4aLdES7l7zIHUBlroMlSYrsewzQXDnIeOdikvwS
 tihYrUn7HXdegB4Kfmi1g2AbNdGODxPUiBiOQdQYD7nchA6wVrqkQ1yWcQmwWu3xY6NS
 E37fgrslqadkbP2ScZJhJBg1QIEUIMHqQQqJ0GG2C3ks/w0ooMUdHycATEOMskNh5ZVD
 sGgEA9IZ5qyorE50X18X/ChUAyRmFXLuO1F6G4j3NLOhbXAIsN27SA9W3Uf9xyBtJS6G
 zmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725298416; x=1725903216;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q0M7+w+qzUeOEn2KRAMs4FkPRHypJnpwjRKg3XGE8+M=;
 b=bZoWHsTAqjeyipm/eeWs/L049J/gV6jFvSjlHxYyCbe86bhAsAPydDm4O+BqqQdvHR
 ao5igKblL3a4iMEfSGMszn3owRE3UHOj0KNxs+U5PR0XluQm4QJoqO+nrME0vQHUOPDz
 z+FLcb6XrWU2EiAkurPdMIbjU1xjZczh6qk+06OCjPHvq2Gr9aokBaAm5aV/ZgSaYr3I
 Gr996b/pexXFs7Y0Tyb2Leuzp3IMP97cYORMUQv4Br+p80sOFHYGNkCBZFRlM9FiwRLu
 sSfe2nahuFpvqwnsROqdprhR29UBUdX0t/iTRvx49OGVyRetGbh4cqGLpDpDGKYE5e6H
 sgrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8lljy9wgbssNSNXxdEPayZGychf2xuZvIEID0aApcZwh5E7WgrjSZgVxKbPO/8i+uJ2ZWrR9VeA==@nongnu.org
X-Gm-Message-State: AOJu0YwIWK61lKjM8GCfJJsbvGiIzQTyREvKqIhJpVGBQArInGFW8GBh
 00ZBGzeQEmbrYPyRBgRdWTCxLZ49dQWXbfqOanYo2Fcx0SZsXq6hTs41IXpKZn3SyCCEFNErzA2
 ARdYj5JV5v12IuBr/Ytos8Yy1p6GlCnTw5cs0pQ==
X-Received: by 2002:a2e:a590:0:b0:2f3:ef3f:2289 with SMTP id
 38308e7fff4ca-2f6108922c1mr106622901fa.35.1725298415887; Mon, 02 Sep 2024
 10:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
 <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
 <CA+1FSii1WErcfeNqUQMYMYxtChLETXh8SJX7BNkLm=VThd4QSQ@mail.gmail.com>
 <CAFEAcA9iLM2ycyembkDyUn7NfQwPgu1yyuncP0vT39D2jb1jOA@mail.gmail.com>
 <CA+1FSighmvfRH0=S9RGQ576HU8_BMbqEe-a07RYsr4fC7X+SoA@mail.gmail.com>
In-Reply-To: <CA+1FSighmvfRH0=S9RGQ576HU8_BMbqEe-a07RYsr4fC7X+SoA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 18:33:25 +0100
Message-ID: <CAFEAcA-LSV7s5nb-jr64+aTiDGvkOtu5WYfgErmkjUejE7tVsg@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: lPWUF/cOWa9x

On Mon, 2 Sept 2024 at 18:12, Mario Marietto <marietto2008@gmail.com> wrote:
> Well. At the time the only version of qemu which has been able to emulate it has been qemu-system-aarch64 vers. 5.0 dirty.
>
> Can someone tell me where I can get the same version ? What's the meaning of "dirty" ?

"dirty" means "there were some other not-in-git patches
on top of 5.0". In other words, it means that the only way
to get that exact QEMU binary is if you still have the
source directory that it was built from.

If you're lucky the "extra stuff on top of 5.0" wasn't
important and plain 5.0 will work. If you're unlucky then
it was something important...

thanks
-- PMM
