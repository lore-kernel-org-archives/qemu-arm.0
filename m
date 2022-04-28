Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1622419lfu;
        Thu, 28 Apr 2022 03:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmcAsa+/drOd/rl7j+NNs0YJNKemmoQ/xpY1QD1H47lrXF6DhAbZXsD2dOAkHu3uW/zzg2
X-Received: by 2002:a0c:d7cd:0:b0:432:8df8:94e2 with SMTP id g13-20020a0cd7cd000000b004328df894e2mr23788352qvj.90.1651141716764;
        Thu, 28 Apr 2022 03:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651141716; cv=none;
        d=google.com; s=arc-20160816;
        b=QUYqvdFxdte6RO9poEX1QDqS4JAWJxw1ngWW3v5EU+SybiaXbMf5ovqR5Sb6ZloXyK
         nqcEawoeOYv5Tkibzq7OPzk/jITBb1zRnc+Ojq6yrGEOpJZCwpidhQR21/PLO/rf46Y5
         erDieXp09SgpbF3MQfHaRYBsTbsUZbRSI+OQ10fTKgZjEucjDRRf/fvjYVqyyLLDogut
         CfYEaF5I+9s64gMUVUNjvRr0IjtihEaZeHdf8+kkoP0weP3OEQq55bEyNWGp2Cj/Wfgg
         XWlDaAwq10OQA0Nswtb1ur1plzw/2M7NpJouLDkikgLk5oMsu2d13nnvNgxbqq4zYEWq
         +aVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kIO9FCCHj+hMXMfWhUrDz4/r16wzGBAm/zJPF71ee8=;
        b=wSm7GgQxaA/QF6LZ7EPNG+imqJjrxY1pXAUAj8QuGqBqXl6o4leSxNN0dHmeQLA97I
         sCTvhmRjaVM3JlnLjVRTehtjt63TiivY0xM0t3+5K03jMIUtujSaQqgz1a/rYh6qNoj9
         dtTsAN//vqxGOK5aAN39Whv+n1ugNlFEm+zzsWW8IQiYCBaiCcjgqGkUy6j3eaggo8Yj
         Y/jrc/10TghABio+4EZz0b8l+dPQ40U4ZUQ3gx14cIK3y/FdyGDbHdoVTEV3kJE7v6t/
         QER8cITwps/fz4mEBYE4ZTGl5jV76N3e1DEGGiHUrU5kzklpG64hxrswviDvrNCf6SS5
         lTUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkFFmiVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05622a118200b002f1f950d3a3si1525697qtk.383.2022.04.28.03.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkFFmiVG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1O0-0008D8-5K
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0x1-000213-Fk
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:00:48 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wz-000290-W8
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:00:43 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7d621d1caso46628197b3.11
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kIO9FCCHj+hMXMfWhUrDz4/r16wzGBAm/zJPF71ee8=;
 b=qkFFmiVGPbUNQkVVpqUjw89C+7VLT7k7MiO67aQmKq17pxk7oCw2BnUYlhxJh/ms1D
 xusCk7ASNWZzcyZL0LrhyQA7jrqyoxtR5do137CAvU3y46QmMbKsExVXmYYv1IyRVt3G
 jkJ5ROU7odAGWoR4IxuOX1OChFw5inqVf/RGcBvt+bTU4cUyeaE96YBPooJcAGZR9PK2
 NeKsNc3g3qpDSCPq636fkUc6dtn2AiuOdX4lMuz+Oe7KVMlj3qVUFQ8q3/stikl7PFyc
 PE4jAjLhjh69kyuUctL+ZLranjnTGDfG7QKUIKloSwZrS1tAsguhfa7XFV9wwr6x+LQq
 GF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kIO9FCCHj+hMXMfWhUrDz4/r16wzGBAm/zJPF71ee8=;
 b=3ZQXsjKg48jXCPtDkbTnyLPsXmM4Xrd7SpvKQ88uaw1CD0TJCtIC1KEnmfk0w1NVhx
 Ypiq09SZzXjn5+EUP5BrMueamEeOUaHMmfmjNxPFnDJpldY/UUAkZq59hmz6rnFCbqVY
 IP8Gd8NRIimNK5hjGbHRZX8vjK0YlxrTV33+tjYLGerSRYM6cjZSJKtiwS4i4Ija6y5i
 2g48AK1BjFpN5J65UwHwubfWeqefn0ftX8ESEpmHG6IX0lSCyWjWkZUGZoOe016xKq5k
 m44sY7C2zog9rwPDDTfdxOGHumQ5cSpxBa2fD2mG/gOihvGEiwh/XqO69P3fuq4djMd8
 YKmQ==
X-Gm-Message-State: AOAM530EGwEkZKI+3dQmZ4je6gZVEtH8b+Ty692JD5JgZqyA2wU9XOWy
 +RDWIwpwF8U3VddQEJUJ/E5yK0XS6Um7lw5dX4p+ngxLHGo=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32056758ywf.347.1651140040991; Thu, 28
 Apr 2022 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-16-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:00:29 +0100
Message-ID: <CAFEAcA-2H3fyjstzk64M0Z7y+6ie-15eWE2f6zhOXBtThCsPrw@mail.gmail.com>
Subject: Re: [PATCH 15/47] target/arm: Use tcg_constant in handle_{rev16,
 crc32}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yf0xqsmHZVOL

On Tue, 26 Apr 2022 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 7 ++-----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
