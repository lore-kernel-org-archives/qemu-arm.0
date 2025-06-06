Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp739076njc;
        Fri, 6 Jun 2025 00:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTG3+p+bPjPnOA6cSTCbLvalvAbUKoDAru7NXtLAi9Pg/pEg+6q5fMtJz5Z+Z5t1Hb9C6aRu7YFap7+g==@linaro.org
X-Google-Smtp-Source: AGHT+IGknL3SgN8NYv/2Uk0y/ppaG1Mbt6XPX8PhWaFPgcW9n7Zg+D0WTVy7QcD/WwoRAkobQD4s
X-Received: by 2002:a05:6102:3c84:b0:4e5:ac99:e466 with SMTP id ada2fe7eead31-4e772ab546bmr1808139137.18.1749193267484;
        Fri, 06 Jun 2025 00:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749193267; cv=none;
        d=google.com; s=arc-20240605;
        b=AsQD5rqinWcQDbsmulLuxz2bn4okTvU76oU9fUkQxzL3vp34lG2QUAff3qMpyKlFgj
         tIc7BxTWSa5HGJ+uQ5jrnxoyFpUtsJ5OjYL0yF/ODFwC8TlZgFuZA+LmWjgYJt/mLrg3
         YmokEUygAmyQZOx7djpT9Ktpwl+H7sLBK8HWyEyiCYyLZAcJLq5zqOBTWy4Vrld5Khbm
         hu8zk3FRCe0FuNzSLDIdeUdwK9Yt/voCYovQ6Unx/iPR79M7AmKwmdcJNyw91kYYQOh5
         95B21ccMsrAzMae+ZFXCBno0uNbK4+lLJtJTXPGLex3b91UPLCwgewoheqaTwy4An90p
         pwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mP1DjCo5cPJh6pwSjlKl+FpmXjk6KJM75Yy+iR5Nae4=;
        fh=XNvdUvnS6MdU33OZA/FyW741wCDglV2bVFly+0+uJhk=;
        b=BbCvsAhQfOG6AGyfHt7oY++F343XrOezTYbLE6KB8HSADZ823ziydGi9bkoLyc7GXm
         LzAzn2iFM2kRiN5/BJv2hLSiYj020Rp+e1FTOoohhINwsXrotn4idJRhfKoyhBWH5OJQ
         dGpZJigHo/e2w1DZ09LlkWzhgTQWAjlt4VxmQjUoGch/Etwax3m3+XW2oQ+S32dYaN3R
         5hGU+pcszWd33kcjlF7FRlo7gbakGVhs28R+RSaA+2EYQn+pVQvKWaJwXWD2nitizf+t
         CfjMyEvOknjfA9VfxPJ9+yWKz8Wojktwhm939T2fvWRU8CXHtcCmQ6zRsjOx/bCIhX7Q
         xw9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvGo1V5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e7739d395csi331833137.352.2025.06.06.00.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 00:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvGo1V5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNR4C-0003B8-QV; Fri, 06 Jun 2025 03:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNR49-000393-NO
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 03:00:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNR43-0003aY-36
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 03:00:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cd6b511cso11745105e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 00:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749193228; x=1749798028; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mP1DjCo5cPJh6pwSjlKl+FpmXjk6KJM75Yy+iR5Nae4=;
 b=PvGo1V5jwBCNbd8lc7UpA/mHCtSjMTy2jhRmZkIbGnhcUEYYgnrW3A/maP9c3AzI/0
 R3qzR9lCpGVpmHzYvv1fDXShmF6oGldVSzikxo0kCu/CzKj/UQLDFGSPzcUgd9auNLcf
 x4/cWnyqWlyl3FvdeCzSBe26qhz5Wy5ioPlXDQOT5BrY7FV3OAefp5fMkZZx/P+Ai8oL
 fozA4ld+rD9g9N0b79VjNaiZVRbhbRTofImQsnjnTJexG5UTLYacl4lyCiYQpyJPwxpM
 WjdSWDaTtX15FsrmEQGMrh3ujK6IhLBBgLwSHGUdkj0VIr0KElejnIxfs5i8c/HeUOem
 r9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193228; x=1749798028;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mP1DjCo5cPJh6pwSjlKl+FpmXjk6KJM75Yy+iR5Nae4=;
 b=pcGcPXADGck8qTEWE+PT9bJHLUADVIHYcgnUAchJUraGolLjAERSZkIA8S6mSBZdgU
 xR2nSX1++6gdh4e/PoLXF8beK2alDTLCu0lrCfVNt7YWkqPEIQcLb4eEGbXcLnLMj8Um
 6F3rWvNxGgXXKZQOqq/7FIsqUf5ETGiLRJEbqT/fytKBGZK4RQr/+31Kwo93NGx+x3BJ
 2VyULQ3sdfPMG0RtDrMRyuBrIC59pppWfRQoaTCBhL1wXDrp4UxrZx467KJJ/6wiIG7m
 43lJHSSdwJAMSytR/Y5D0ZrUy3C2xHg3DAE9V+apChbCbnkWJduQS3aq//6Ag86YERC3
 2vnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTvNu7wzHRWsfAyHc9bhRm7b+fxWq55+mpPIDA/VBwrXwZ9wl6y9OWwKjKZToXj6YI/u79LFWH3g==@nongnu.org
X-Gm-Message-State: AOJu0YxTdeeG8OeUTOe5F8ZgNQ8V2DM/Yk4BY1IheMO4kilHKeIgEV+N
 hnVMfzqo0B5Obf+rKLUPUvdhzf5xKdgaJwm+TuAafHMKGwGy4Tx0esTlm3NsN3P5+Gk=
X-Gm-Gg: ASbGncuMJPKhXP9gqDnUUnTuL03dxCu1VXG/9472HkwztHwefOAYtN+TQEPZgCPh84f
 Z3cJi84PM2A5oxqtoaBUaDw0wrNpkuGqbreT5Bu9UE8b87mm/XGnh1bKp5htQv4BKhJ5TNw6QeL
 WnKrgZqzud3ghE4BAyEsFyThivPlZBBmS9jUDmFmDxvF7kcfM97HqK57QUqhTOMuHERiblRVKIW
 IJA4vfG7bWye0t+/5hVX6SrDXpSOdaMXre4CGhuBVbz/uepPlstcq0Fk6j8L4BVC8eqxOX2LgV4
 e27jtpLe/5CxKXpKrtbBDeyKxYqspdmxt/hnFtxleBCYta/lPw/WgWU2zL+iifTGczNJxyzea+G
 m6U/rO+311DIcLMlEbbTeZZ37WKdVkA==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-452fbbf6c36mr1502355e9.23.1749193227894; 
 Fri, 06 Jun 2025 00:00:27 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e0563cesm11774665e9.1.2025.06.06.00.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:00:27 -0700 (PDT)
Message-ID: <012d6175-aa80-4bdf-bb2b-48b4ee424083@linaro.org>
Date: Fri, 6 Jun 2025 09:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-3-philmd@linaro.org>
 <a4ed62b2-4bb3-a78d-c833-a58bedcc95aa@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a4ed62b2-4bb3-a78d-c833-a58bedcc95aa@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: POo6kBE0UdAQ

On 5/6/25 23:23, BALATON Zoltan wrote:
> On Thu, 5 Jun 2025, Philippe Mathieu-Daudé wrote:
>> tpm_emulator_ctrlcmd() is not in hot path.
>> Use the heap instead of the stack, removing
>> the g_alloca() call.
> 
> Typo in subject L -> :

Oops thanks, I hurt my ring finger and have it now tied with the
middle finger; typing like that is slower and makes me do a lot
of typos ;)

