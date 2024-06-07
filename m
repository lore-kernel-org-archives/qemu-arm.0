Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp943893ejf;
        Fri, 7 Jun 2024 06:24:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSMsbswcfi7Ei+5dYOzcc1a+cjNUB2yXO/nCuYTjgCzHOW/8viicKFvm8b4pJ75BF8YXySocpJQKQKPo1SyGk5aVlUqQI6
X-Google-Smtp-Source: AGHT+IESUW3a1y/g6uNJ5rvpGOvC3WPeSnTast7yilHOD9yKq/O3VCwln8Z5kIhz5Ccy0Gwn4B9z
X-Received: by 2002:a05:622a:1441:b0:434:7c49:a94e with SMTP id d75a77b69052e-44041b8bc07mr32130201cf.27.1717766644524;
        Fri, 07 Jun 2024 06:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717766644; cv=none;
        d=google.com; s=arc-20160816;
        b=oYleBPf+NPUcF+YP0N7V2A6rr3N+Kjt2MotidxQ4aJRhiW9tQugTGW39BKBFrFbWUf
         ntVcm+ovwTWK4zSJHwM676z90XKmWyqiVvfC5sX1Sn+0yhoYxIy1F0oqpiErY6Bxs17z
         6le/8srxd5/3rZRiplGIxk5KsACJ2j/mMFnXJvTLA86wjTpMO9RPsrUDQOnRcnuWM6sD
         M0ces0xosI0XYc51aaGHOPgMu8L2Q5LYDW8RxMiWc3z8q1MAglix4OU6rZntH1v/3/D4
         EoFLBJ2Ooww3AgWany9KvLRlmiJJP/RUJ5PcQyus1yNIVICJEFzTZ27+dqyPS7whm4yN
         nlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3OQ/exeS6wnx2UNmvTkCz06ie/Po5AiUQ33NK+Y/kCA=;
        fh=N//8IN980WpiGRPrqbVmAns6T9ptVAw9I5VFo+Fsz08=;
        b=CkU+htJJPaCNTKZ6mPR+CPUQscDaxq6+MH07b3nIiynyukjM6hoR4E9xglgp3tm2Tw
         BIh9j/ngKXes0KFvMIB2BFRBFwbhCIvkEVleqAmVEKzb7tvyt5PUdRwvHwNAzJGXoDQl
         RRTKNRTmi1zqVUXWEx8Uu1Ko9LOrve/1dePuI+5ewpRiOYWJ2Qqeezn7R9YrGUymzjvf
         oDu5ZWV61SvqGgfZzcQkx20/qSFYi6KvojYqls66ABJyYMJbbQ6pgh25bnuDS3fO4p2F
         f92k9SPvXtGG/XqTPzgAi/QXij7pLx2fninrZ87WpYTYPv6ZtRqYYsGExSsQjwOcSx3A
         7ITg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyPWza3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038b3a6d6si39202441cf.410.2024.06.07.06.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 06:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyPWza3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFZZL-0003JO-VY; Fri, 07 Jun 2024 09:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFZZJ-0003Id-Dm
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 09:23:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sFZZH-0000w0-Ny
 for qemu-arm@nongnu.org; Fri, 07 Jun 2024 09:23:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63a96so2675657a12.0
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2024 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766622; x=1718371422; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3OQ/exeS6wnx2UNmvTkCz06ie/Po5AiUQ33NK+Y/kCA=;
 b=fyPWza3vHIeeO4d4NX++3AizskRoAp7nRyxbgl7aBZeKq6HP5o+IFa08b9d+RNekcI
 GLcI8PwYIBI1iPKXFnRr/ernfZUIBtBetP94hxMW42PHJ1IXoSLQ0hC4mff2DlKnliG+
 eileOK6tAjWCg6BTefrEs9vMbvi5aLNTDBVmjIalLufBW8wYEse5/uVAtBkgnKCHaHYb
 mgEJTFDa7gRuPHJdZUqJIoiygjr071g8lqku5m20DOVNQY9bcw8yHSWoLVNlrcu+lWgK
 0SyzKG+gb4T2PZmKcEP3BhhcDHWr4OSANSX1H7jWTQ9iGzd8h/FyRBIPEXKR9a6YvxIg
 +j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766622; x=1718371422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3OQ/exeS6wnx2UNmvTkCz06ie/Po5AiUQ33NK+Y/kCA=;
 b=JKisZL71D43nUqNtguomzrRkdNR6bAeAz2ktadwfi+6uouYEDMbcLcLRj2T/VlwXS+
 xlCNwwFM/JL4r/jHdeUsxpnJ4MraarMPvxq3iYAKN3XZz1Z+uWLZEsFj9bM9ZP0ve0yU
 e5DLnkFpkQuWZLE+dPvd4LAgOC5/k9xoinQmQiTxCVMB4c0NPKnKvWSUkj0buVtracnM
 XsBydLMfKD38KnQ9GaFdUoCTaD4oAMYHVJiMgko6G3jRCcDH8IqmNoILygUfJMhRw+66
 G2Oev1V7YVu5Ex761inhmEMOsKcz+OgPQYpvK0V2si5GXo0boAofElhcV8VkgSBOHntu
 ompQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfPMq2MKTkwDGW5Di4pZuWEyiNBDdSXjzSkKYtZ5UiVaooVvbbmLAWRdLi0yipJlwg3py15tz7UYYSqezH/c1d+wEp
X-Gm-Message-State: AOJu0Yzd/ZhfWSd+hZ8R5ZvaNbw6EHdJIe2CPiG3rYPtvjPX7xHkO+J8
 NMD0e/bcDoHhh7P+i3IvJnFfDbwJKIv9uRWC755KKJuouEiXoPXgFcGrKJkyY/xCIytdTgzeBc5
 t9yZiHDT6CawjeIx0hw/x0uu8lLkxDiaHwtOsiMDZDgJfQ/xq
X-Received: by 2002:a50:9f83:0:b0:57c:600d:5879 with SMTP id
 4fb4d7f45d1cf-57c600d5903mr653890a12.20.1717766622127; Fri, 07 Jun 2024
 06:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240531093729.220758-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240531093729.220758-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2024 14:23:31 +0100
Message-ID: <CAFEAcA9iRmfMyx-mKGgyYRFVWE6F_bAGwCVcnKzcaw_2hcSLYg@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/arm/sbsa-ref: switch to 1GHz timer frequency
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: LA3M+BMW22Eo

On Fri, 31 May 2024 at 10:37, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Trusted Firmware 2.11 got released, EDK2 202405 got released as well.
> Both were built for QEMU CI and proper patch is now in arm.next queue.
>
> So all requirements to move from legacy 62.5MHz to armv8.6-ready 1GHz
> frequency are fulfiled.
>
> Marcin Juszkiewicz (1):
>   hw/arm/sbsa-ref: switch to 1GHz timer frequency
>
>  hw/arm/sbsa-ref.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
