Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4129404lfg;
        Tue, 11 May 2021 09:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2T+hcX//wC4pxOXL1/0uTuIX1ws7gZoEBq07n79JDweyQsIgXv+IGgpcwidiUnxIQtf4g
X-Received: by 2002:a19:ad03:: with SMTP id t3mr17881590lfc.359.1620749331776;
        Tue, 11 May 2021 09:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620749331; cv=none;
        d=google.com; s=arc-20160816;
        b=mBc8/C8bXkSUZ4gEWovaMbZGfnCnOPxVxnmQJ2p+xQWKuCPewSqIbND6qORO4IfQHk
         ClaCAxsDPcncINVISLRkR2ELRHXW/bBIL4nUK1T4JMcsgP0Vl/bHme3/eUQnYZUy52O9
         sXobtVw8uWOYvdHFM/66FI9bKveYahiTz+Bf7IsDUQjhYQIiZqiv+Ojro0sZDqguzKgV
         gBXFZX3Y6kKBffc/6EcKo0C8g68xje2YiCp9YwLKVdDvVK30oxidPs7kyRCDfuNLc7h/
         sCC9QwMD+TS0pEUyA3k5prIgcGkEBQHCAp+E1aDm9PrTd70E9OW56EbZtifeKUnd82Rr
         nZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+LrCg9st8R+uE5ASEw1kRHGm84WcB+AQ8vmkuUyzjHc=;
        b=QLm9qRaKGp59J/LLnT8VIylhk5PIIDwdLZBxBFdbEIKxdkx7g6Myn5rJXP6Ba6pQ4P
         6wEkdcRA/7U7bofCkXb59+kqUOjv0XNaBpJXzQjAZhGvsCIsFQXhGmIktCnaO7t1kZKT
         TG9ds+yGKGfGFn7pExIE4MeD9lBXO1N7hoW6ohPxelVRbgClzWyDbfJGXZiNZXrALfkC
         6kxw2c8I7px1vjRxbIdB1Q6CNji+3zcB2W1liucl9mYaf8I/IUaoSnCn0qXJCjcAWqGU
         pfSQRoEHBeViArNrOg04B/NfhHLrLv6SEG421AlsaCU4ClKNFNyAVhT1zwAryYW2dIWz
         etYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+sL4Ofz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si12658647lfq.228.2021.05.11.09.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 09:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b+sL4Ofz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUwE-0000qi-Ic
	for alex.bennee@linaro.org; Tue, 11 May 2021 12:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUn9-0004s7-Fr
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:59:27 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUn3-0003mM-B7
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:59:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id a4so30565354ejk.1
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LrCg9st8R+uE5ASEw1kRHGm84WcB+AQ8vmkuUyzjHc=;
 b=b+sL4OfzYaWX/h0b315/NJYOBAqXHBm6y96IV+w9KD8Hr45o8SSQ1VOntkrnfC2U3Q
 +NsadI3MkVHmlwZn/Rm/FjqByY1m/lJU7I8PxNBmFMWLwOgciTIKkA+9kWV89C7XZOrj
 fRJMvyNzHNAgbaQlo44qORT6cDhrZgOuFiE67mRThHrDn4Ozb1a1Wdwo+ulmdyEMfqpc
 fIfI1vQ76K5pKdfHSfrfkDEozCLkAPArNcgWrKyJQoZAmzmLeOv9iVG4AFJblVOak76H
 Bf97Ul8B7yaWMAmETX6UFFWAh7ZR0kAqiRipK2sYans5bnQBbdFOq0/+JRFiNevfHTUu
 vNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LrCg9st8R+uE5ASEw1kRHGm84WcB+AQ8vmkuUyzjHc=;
 b=ehpHkL4nXXYnb3eO3R6ZP3/pc8GTHYBkDBPQK6LXHz6SucodACRkoztUBnlGPoxkpp
 AgPMjuTr0RfdkFArHrdT41MFHL2vMSUHYrwGmW5sZvGGQNxZaBaeFYy+WMNddkMmu90z
 7lUk9VfltMdUkTxu/c5ttoCNlDCohI7vv9vnzYp5xzhME93bivfj0zP2pRJ5LQA9iZ0w
 WyuijoglYgimCBDxH1pSKHQ5R7kGMYGjf/v7quXVQjDIIcjuTPgscE4TkiDRGRbFZMdy
 34xqU3oOzvThfb/lucRGnOik3JrExN1VR4SWNZhEhboYYAA9XUbqURKyk8gWwkwMXm+5
 zxnQ==
X-Gm-Message-State: AOAM531xXExanHYH1c1M6ut3jTW5bMtIBOuCARByn7U0ayx6uuCT6Vtp
 2DHNcv3HzB6jUXRUONFV8zAV4uM5Vgh/0Z43eY6AIw==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr32169032ejb.382.1620748760024; 
 Tue, 11 May 2021 08:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-23-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:58:07 +0100
Message-ID: <CAFEAcA8apNueH4-554MCkj1SmkBJnrcuToJcPGHXXjcSte6eTQ@mail.gmail.com>
Subject: Re: [PATCH v6 22/82] target/arm: Implement SVE2 bitwise shift and
 insert
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxS6n6VUqnL7

On Fri, 30 Apr 2021 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  5 +++++
>  target/arm/translate-sve.c | 10 ++++++++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
