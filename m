Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp688071ejf;
        Fri, 23 Feb 2024 09:00:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWC7jlxC/JTJ85CKGfZtiRmsjaiz3+8uT1AtuqEJ5NzHImMlBCeBLfsCUDX5WF9gDmZL5TjI1DIaa3kkxQT7Z7dvpVVxPhK
X-Google-Smtp-Source: AGHT+IE89VwDcgmMjVcmFvdVeZTe+peok6zLwwNQm0J805j08QIeW1wl75G8eNnixs0FRJi3TYZc
X-Received: by 2002:a05:6102:5123:b0:471:c49d:1cc3 with SMTP id bm35-20020a056102512300b00471c49d1cc3mr626200vsb.25.1708707647866;
        Fri, 23 Feb 2024 09:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707647; cv=none;
        d=google.com; s=arc-20160816;
        b=SlkX0ndyAGkHMYq5lRQ/X3b9vQyYKXkiaoJrqsa+5YIueq+U9v2PeecrEzx1+D1sqn
         I5iN+f+U5CBfLc1UvUgmrhZvE6USDAQitzwIhzeYCPeyfoxpP27MIyaaaTngid7KCV/Y
         I+FIBTRY0onbd1d2m4HTvMpjl21lhzp+ohfWQb2EeYrYTCOkX4aJ/J62pKqisU2Jrld4
         96UwlDyhOhgYb2r9hH7joPUDwKfwoej4ZNySVHRRT0CClivxmDOyvnFQY9bxvZnZtH5A
         SVWDTmQFvimIU+3OOX1qVsc9yLY3BjEj88wA40O28R6hOCD0nhYp7Wspntf2u/FFMuYc
         Uhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TsQucG+omhJ6mgWABCcp5FJT07Qhvpa41K0AC8Xithw=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=enp5Td4U9dPirATx2O2XpsMoj9v2pDYGHAEW8pZNKPD+Gp1mEhSa/7YnnTHkF2ijUg
         cArzk/WXmXeu5+3xlorn0eAevD09tt81DH3r23mgEheY+XGNMlTk/pFpu4k2L4Vb/qn/
         h1DlfN41h/0OIn3KMQB0PNKdZj6giMC6yvbrFLj/udxj1ouYQA75qq+yc7I1TowVkq0X
         BAq5SwiH8IFsKQ57yRpQuJJWiUqS0b/zZ4iBtIXe6AyuUeIlY777TszOcTxiK6+mz2q8
         aKo+ga1PopVZK6jx7qjcM/QDZ3S9XInEeTqbS7QZmmWcOdGWDpf3UP8Z2xh4LNNjkExe
         BCCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIeUsYOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by3-20020a056102504300b004699c590f6asi2421326vsb.493.2024.02.23.09.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cIeUsYOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYtS-0005Ia-Fd; Fri, 23 Feb 2024 11:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYhP-0005fr-EL
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:46:59 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYhK-00022y-Gh
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:46:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so739179a12.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706810; x=1709311610; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TsQucG+omhJ6mgWABCcp5FJT07Qhvpa41K0AC8Xithw=;
 b=cIeUsYOLdC0CFTLwZzx9414w3fZUFS7Dg8hUR1iDUxwvZRJy5t7sb/a1M/vJqBrRV6
 8oPkGAoEGa7p8EMEe+CVk+FiJgryCfWgfZefAAKfNy/BmP1+sUpBArO+je5LA72LHO3v
 l9vXzRWZ1XosBWqyne7U51KnTfDQ1O50w3mLCsw66JlZi75/9iF4szTj6AN/semu67Z/
 rJHm/Zako5oeiaZox1uKGPTnu5Aix6HAFmdsPY1GGM18iLksHe36vZgmVlA6EsiIfPb9
 +jv6TwAEBDKX8pa7yh/n3i9/6y2xf7IOqT/XoF2YWvKu07SbZip5pQkoHytgVkh0xiyA
 CLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706810; x=1709311610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsQucG+omhJ6mgWABCcp5FJT07Qhvpa41K0AC8Xithw=;
 b=u3dQaEv3mr4jrhUgHaXqyLhPInX8t3bnRFpP6GLQivnEw7c+2AC4+ogmcHZXYxGroh
 xkr5ma2GScvXsPQnMDxmpbK+iG7izD1zHwx+X+C9S5NECYOaGDguecPzlb2/vPXupx3r
 d2WPuRPDXGmEYax8AsQSRJh9Rt1WRa8DjsE+MCNsfsEXOhp/9DeugBIkRxIAjBiVwOqO
 OIYRpz7F/lSRBhve/nABe/Bp76f7mjMHsdQqeHSl+zZaShJlSnezwZxSSep8z1MWE7el
 M0mWmO/Xuke9dy6Dmjp6zorHnE1ksD/pqdvvR587j7O+XpR7jujzAXohTPPQi85TK8T4
 14CA==
X-Gm-Message-State: AOJu0YxhM5BGhw8rSmxgvrGPhI6mRorQRwWFC/Mdf2aa9k92gRDuiWsw
 iO4zHueqJD0h/xIpG6Fe/KB2K5kOzy9/64VwxmAFOYf3WZIpVQ2zN59bvIIoqqOvfIYOjnsYYFd
 alBjh0z7jkBQRBfoSD7GsjP67b+bktHZ8Sx/kzg==
X-Received: by 2002:aa7:d916:0:b0:564:4504:cc2 with SMTP id
 a22-20020aa7d916000000b0056445040cc2mr283059edr.16.1708706810594; Fri, 23 Feb
 2024 08:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-12-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-12-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:46:39 +0000
Message-ID: <CAFEAcA8Uj1z4e9=OYo3ExxKZiCCQE4fuL4Cuwe_F730hFcEvGg@mail.gmail.com>
Subject: Re: [PATCH v5 11/41] Temporarily disable unimplemented rpi4b devices
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ENwIIW00FJuu

On Mon, 19 Feb 2024 at 01:21, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> This commit adds RPi4B device tree modifications:
> - disable pcie, rng200, thermal sensor and genet devices
>   (they're going to be re-enabled in the following commits)
> - create additional memory region in device tree
>   if RAM amount exceeds VC base address.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
