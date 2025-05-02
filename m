Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp815516njj;
        Fri, 2 May 2025 05:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGr2q3T8q4jMmABlWALoNDjyXTBvFhwn5eSJ3mDZ8EiBnxu7aNkUEcL/RJxRHj9ZqERL3XVwqs6bT8XA==@linaro.org
X-Google-Smtp-Source: AGHT+IH773jAtX4AGhqHcx6nhzg0D8GENr17dZvSC6iK2XmO8tI2sZP2/jhWl3/isc2cSN4fOWjv
X-Received: by 2002:a05:622a:2485:b0:476:7bd1:68dd with SMTP id d75a77b69052e-48c32fc13abmr54981331cf.50.1746189728235;
        Fri, 02 May 2025 05:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746189728; cv=none;
        d=google.com; s=arc-20240605;
        b=MRXRxXpVSec79R7Ykke7ibMUXsVUiEQvoBQ9iD///dziWNH824yeHDPMo7UWmbHelD
         byxTTs3OFpJwnMzVEFDIOlN3rqv2YiL1/UL1WTrRijj4hFC+CnSzrS2QVtobKU7yHCgj
         GCLV7hbb0zVLWEqDkNbSh6nuka97sMB9NAYiLLUluDrBw0E6TWyXNrFXqhNH3LmWzMvf
         iZAgnxooegmqDetamZC9VWlwjfSr2A9QsH9SuPGUtrT3IZnKvd0qpxp0XFG9ElcxR+HS
         0sUhOJCYUlZNEEK0pOYV6s2qpj0Zm8asvlYZNlkMIwUM/LOfKUG9z3jJPcFagTm/sLLg
         NHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IgowHAI3/kZtlh/kj+syzyZsBmIkO2bSa3hEw3inqXk=;
        fh=ug+7/NmebTTvCwKj8a7b06niopmYXVXk1a6JbT1Xa1Q=;
        b=hkWKXH9H+x+ZCmGfig2NkaakjbwjyBxTF05TvqakG/ewR+MXfSncfK4Krq+dmkTqdU
         y4u3AcdahT8r2SNR0W2BcIkQ0kxDV49WDBSJPM5NM3eK1w3PCB4jAxMG6YvAvHYGTc7G
         G1SNA/152L8MpRe5e+Evhu4ASxkpm4zNT77KYShr6mNqYA7JceR4ifi1MYqeprmf4cdE
         sb+C6ii1WGHjruyidhyyaNADzD2fWYDc1X3tiPBHwOsfGHzfKdp7f718NYA2xSMGe19o
         6geuNXcn347ygTXaHAojS6E/k+PYS+H8ZF3izbRrN8IB5OLzPVKaDFuIK+N9RZxCriTf
         e4Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9UWGB2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b966cdc51si27732831cf.178.2025.05.02.05.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 05:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H9UWGB2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uApi9-0004xd-LQ; Fri, 02 May 2025 08:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApi8-0004xF-Qm
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:41:48 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uApi5-00068M-Mb
 for qemu-arm@nongnu.org; Fri, 02 May 2025 08:41:48 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-708b9b5299eso13723007b3.3
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746189704; x=1746794504; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IgowHAI3/kZtlh/kj+syzyZsBmIkO2bSa3hEw3inqXk=;
 b=H9UWGB2oeMZOjCSIiyjDGNtLm0+b8FDy07PiCDFBiwaziAr1/XAYZRiSdfuh2RcOJt
 XJXVGczIoIR8E99ZsJv1HECmefHvf1IUS6zmp5ZvW6/WuIXepdb/RLt42hZ/dK/G2r1D
 s5aVHW3bYCatYEY2mFKjo/FAFGwrh2vzX6Y0eZSiso97qip0ErD5tsd0Iof52GJjhpFZ
 oIl2VFPnQSX5xSBIE2FA2hXY9NLbPIA4NMxhowNqjVmQbTzEoiaRu1+25QxO4VkCjo5L
 xzZ2pS5ydnEHvdQo+tl/M7IiW43WbHTCKW5vzuO4EiN3FB97lVx8/rHU7Cq2nhJqawhc
 y45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746189704; x=1746794504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgowHAI3/kZtlh/kj+syzyZsBmIkO2bSa3hEw3inqXk=;
 b=AEYzqdgANWO1dX6IShXUDZbN523F1JHPjLkQIuc3X3P9frm83oD9L7UHwOIzpSbEf7
 5/XnH5v0LJqVSPeRdRhw7S0twnQYIa4I+HRQuDU1utNWPOb5/7A2oEKD3zeJNB3LAE2Y
 nbyASTdpPLsm14j/eyXo1/QfIMWSadgviHCKWm5ZsjAwg7mwMGanN75mqIvwBxYE/Dos
 mv6qUvx17IyiL2vqxoGJIwpx6S7djtB0AEP1dOS6cfr+CIza9uMZgC1Lq4VoIgYndd46
 yXf0OiGjZ3HMKFJx4qGH4jkg+cW/coeTqEVeDrCgL6mz4I0S4eg1YxW85+20C/m027t8
 b4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6k4il7S0pd9nNZEcYIOeWlK+8m4LfKm9ar4mRD4JeqXMvRR9WYOSO80GNE8N6FmKqKvSsz4lrNg==@nongnu.org
X-Gm-Message-State: AOJu0Yx29tvU3lqRTv6rI0iZfJfQWRmh6/NVeqc7mIN7SGP5RI0sZXdr
 uM2YKixhe7exosoGsfXGqmZDKu5OXGqEstMUfAF+dGsKPsOkJ3VaUgpnsa9BG+QE1YAnNRRDrKx
 z0S1F2C3e5HYI+xwx5dAsl1SZHlmU59sIww0IQg==
X-Gm-Gg: ASbGncsQ3BKqzTjq0nDMwyu95i94VBhErxqyXGDJT5TZS27MqSVQpnpd8fonGDb8i1n
 nb6530aPkIhsbdBMgPnXGchq809XUlmp6YNimFOCcBH4WCNnNEUUp5tSjzWM3LDMFPddL/CvK0b
 F/JkXYtPdTijoFxTV9L8oFhIE=
X-Received: by 2002:a05:690c:4b8d:b0:6fe:b701:6403 with SMTP id
 00721157ae682-708ced445c2mr44890507b3.11.1746189704329; Fri, 02 May 2025
 05:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250418091208.1888768-1-timlee660101@gmail.com>
In-Reply-To: <20250418091208.1888768-1-timlee660101@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 13:41:32 +0100
X-Gm-Features: ATxdqUGhnxgOsRlTbHGr9cPTmOtw3x2WbbH84nU1oA4t5stwvVsAq6HPFK5Y8OA
Message-ID: <CAFEAcA_d4iBF54_3jcr2c7Ts=aLmdTb+Qu-iZZJ3Bgt9v4-q4Q@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>
Cc: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: zgy/v2cPE3ze

On Fri, 18 Apr 2025 at 10:12, Tim Lee <timlee660101@gmail.com> wrote:
>
> - Created qtest to check initialization of registers in PSPI Module
> - Implemented test into Build File
>
> Tested:
> ./build/tests/qtest/npcm8xx-pspi_test

Hi -- I'm picking this patch as a random npcm one
to suggest that people in the Nuvoton MAINTAINERS file
should be doing code review on patches to the boards.
I can collect them up to go in to the tree, and I will do
review-of-last-resort, but these boards should not be "we
send the code upstream but we otherwise don't have any
interaction or do anything", please...

If people with an interest in the Nuvoton boards don't
collectively review each others' patches, this is likely
to mean that fixes get upstream rather slower than they
would otherwise do.

Other relevant recent patches:

https://patchew.org/QEMU/20250418091208.1888768-1-timlee660101@gmail.com/
https://patchew.org/QEMU/20250414020629.1867106-1-timlee660101@gmail.com/
https://patchew.org/QEMU/20250315142050.3642741-1-linux@roeck-us.net/
https://patchew.org/QEMU/20250401085903.224787-1-timlee660101@gmail.com/

thanks
-- PMM
