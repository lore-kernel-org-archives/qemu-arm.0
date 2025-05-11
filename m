Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2210167njb;
        Sun, 11 May 2025 06:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWruLuYL20W0EkhdPSipdCU86sd1BjY4a6hxc4vn2U4hFLLnoGExolf2QUUCdmwd97dQASN6qFSgBIuNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvlRwDG9kThmV0o39h7i33i+f9pIWMfWPiSgq7YtvNVS21AkY6wWtgzuTyMp83qx/Q4ZyQ
X-Received: by 2002:a05:620a:261e:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7cd0113dd47mr1395153685a.39.1746971262948;
        Sun, 11 May 2025 06:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746971262; cv=none;
        d=google.com; s=arc-20240605;
        b=b7Dj7d0GotPE4D1JRhnGGOgcybiBORXYUdeqHl9l5kOiiWeJLAt4kpiCGINb0BcM9H
         MZG0VcOuA/GmSWpydYS9UskcASPow3CXFjUJ4XIgUWdmeQbUJPj5L0B1Wp3qbA5IlvZy
         SIp+js/edRiZbeoP1bo/LEbkO9f2fLxkREmw9UkSjv2Ylogr4XitU8zbQ8+cSD4H9J96
         RTRE6jIm4aBCzVl5qyHORe8BTophHMpZftg2tG2NJHZ1bI+hdeEWrU56lUgankCsQV70
         XqRO+/qK6iMqT4wTUJEHK/+a+gxNWrhVlvcYT6Oe0rryAelfkBlRd9z24GyQaEwzRXpT
         gx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=T3gvSZGTVPKwW5jN0awbcE7LspiM6JmUghhSxyn5kAQ=;
        fh=hptE3x5G5A0heHsUyU9dFLVSAVYX7wPMgtjMqJdrXvI=;
        b=b+0+RgGKzD7vduRL9y44COQL7kQFekmMQPCoWw8+HayTsgnYdUwedU3m1vy/E6AQx6
         p59ZcERcP+JBvUBVeE62M1DmI1SMxE0KFXL8rGythTaIqT4YSZIkURorkDtz/aiRr/yh
         2PhcsneqFedGL8qigoTZPpYzFdJ5mJYmVs2/X8Cxy3W5Y9y0Y5SZMb0elPl+7KLoFA9l
         rilCnq2nJJer1tOahIexIdXlMd+UCyUfV/c4dkm2mAMheu1V8RMgn9Vlm0CmPqHlgQj4
         W9wJU4M20PNdWU2TrtQ7ebT2+e62+RNKwQD+NNOEXsoD9mVPrc4l9AFYn1+meJPJjV0I
         0Xnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAHD9eMM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00ff0a45si642910485a.564.2025.05.11.06.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 May 2025 06:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAHD9eMM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uE71p-0004y0-JZ; Sun, 11 May 2025 09:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uE71o-0004xl-23
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:47:40 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uE71m-0002tW-Du
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:47:39 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e7387d4a334so2884385276.2
 for <qemu-arm@nongnu.org>; Sun, 11 May 2025 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746971257; x=1747576057; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T3gvSZGTVPKwW5jN0awbcE7LspiM6JmUghhSxyn5kAQ=;
 b=MAHD9eMMbxt6oFtRCbrjAm24cxZJ2I6j5jJlwtXluHQ5ToYaOOdO2G+NrFT3o6mlb4
 Sv8y/FRVvyb+nqi2IMUv62QqyF5wV7yxU+WXejAlyZpOzc+ngyeXhF3HbZayW0xv29+k
 NSUvAqncz0TD1OmoeZ4551BlBJAaZduRTKOu040VqIhBVOVeBOGPXx7+Z+xFFu4jxbR4
 IeaCqMp5GQLP/7EaJN15R6yNWjyzUdExzmaNnMmJgzBmJ4AlJecN8DqWpXfD0nFZtjZ7
 eXJvmJuiH0CJRRcyngAg8EoHoWbeg9GmhGHzvZqyXVwOtcYJ3AwTynBqAGMpNjISaxFb
 625g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746971257; x=1747576057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3gvSZGTVPKwW5jN0awbcE7LspiM6JmUghhSxyn5kAQ=;
 b=TY5AuhijuTVgVuDtPlxN4clvxY65dMrCjZqE+sI/Y3MpI5vk1i64Bw3JzDoajgKPII
 S1RnQxQswmwrV6XrLsS8tbE7g4HaxVV8Q2Qxex6UeIl77LUk1evcy8A01V09WOHlYm5D
 I8jSMBhcjnqGGwZbLJWLDohY9I5rabDE4AMw7R7F1AC0Wsn8Wu3q9OrXmo+nCEunm9Qc
 GPZEcchkMfOxWaWvQcdg7Vkfh9zHUgVf0jN1hfzfYYQHNWiXrfi8J4J09uQ/Fq5cRKje
 8sqj+B9iXEcmRBFqoKBGrDpHjUiCTtn7w4uUDjEpTn0I8yNQDwrV1t8E7nGtjHh1Arft
 BCUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSkz2yL9dnpXVh/ekvu3PZh/+iLADkxupLdS6UYdypBrH55zQhh6M3j3kbF5hEgX7aqT8gim+y3A==@nongnu.org
X-Gm-Message-State: AOJu0Yz0+Jmi7HzrE9m5vriah/p4jMBR1FTjzQS3IcG4stk9w3oCcV7V
 37qv/x9wXROgzOIb+dxAPz61YxmsgNJ/sRvXy4/B2aQ6KvcG2fIVYRmKpaik4jtQt8pRVirI4D1
 p8ynlDCSrcdkAoik4QrFP6ia6ZrlKC0jGumBahQ==
X-Gm-Gg: ASbGnctWNr3Bqnp1cMO6jPUPaz/uJc+nfCK8PmsXANRl1l7ioVfEC81Int9IVoA5Ult
 /q/ALi7w10sWrsrWOQGh62SF8Qz+j4Ay7Qz3V5DGZf11NQDeAAiAmAlW1mroq9mpS9/POUOWrh+
 VhhNe89VMndGYSgpzCtgKppmBNNotv/WWI6A==
X-Received: by 2002:a05:6902:e0e:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78fdd2dda9mr11898187276.32.1746971257212; Sun, 11 May 2025
 06:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250507091859.2507455-1-timlee660101@gmail.com>
In-Reply-To: <20250507091859.2507455-1-timlee660101@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 May 2025 14:47:26 +0100
X-Gm-Features: AX0GCFvCF5sE70k3F3ionhPDO0KEVLYk2jXjGcgs5eUwySsI75idcZzcapv2UZ8
Message-ID: <CAFEAcA82=0Pp9U=W5EAjcVkR0GL_o1iVPuUPA=w2SFy4mwd_5w@mail.gmail.com>
Subject: Re: [v2] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>
Cc: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: sodEA4/rBz+Y

On Wed, 7 May 2025 at 10:19, Tim Lee <timlee660101@gmail.com> wrote:
>
> - Created qtest to check initialization of registers in PSPI Module
> - Implemented test into Build File
>
> Tested:
> ./build/tests/qtest/npcm8xx-pspi_test
>
> Signed-off-by: Tim Lee <timlee660101@gmail.com>
> ---
> Changes since v1:
> - MAINTAINERS file not need to change
> - Add comment for copyright/license information
> - Correct CTL registers to use 16 bits
> - Remove printf() in test cases



Applied to target-arm.next, thanks.

-- PMM
