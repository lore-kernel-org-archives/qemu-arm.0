Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp204203lfp;
        Mon, 20 Jan 2020 05:32:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwASUn14oGVO4WowW6vSz0WNL1SaMNJhVSYTVjZ/sQEj7OzeT4qTEIGDvWSd6zq7oHcwD90
X-Received: by 2002:aa7:c550:: with SMTP id s16mr17279654edr.297.1579527124704;
        Mon, 20 Jan 2020 05:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579527124; cv=none;
        d=google.com; s=arc-20160816;
        b=GZjE1+ImnjyHeHinL5EzBMv81CYYztncHaidvNCI8CY2vvUYaDpPKih//63dLf0H0t
         IELaqJcutwNHOrYUlzzVc1Ys+lNzytsvUM4LElcTJOs690sUtqMQmV6giBFBxe8gXStw
         0hPx3QEu/JqAiu1uLACsi5PDoufl/pR/Z7APVVZ6+qHg9se0qfkuYw0jRUOsLUhfatoN
         0qpLlrZ8jiv62Fm3mBCj4vHCz03PcYPDXQcYSYRPPJjiWPuGZDeruNRRtOMQu/KeUJwR
         NQNHiLGrMy2Pkpye4OJEmPunM2X5+a3/w7ubmrFu9Z5BH604iKWPga9n1ALS+FdPApNe
         mK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRyNxs5Q9NG5xWtBvdkgzxPmO9+oLzgDCyhLAiXYDqA=;
        b=qChm7KbpgGtoh3IetWGkO8ldWsXZz+hxDijdY+3rLcUM8MzCGKyO3EK3udJYw0L14L
         YpgtygflJcW0Fc+I5SBkB1enxiXpKuVZro01HkU1aXwBSGctqMeiFXM3NrNhguzpeNvB
         u5o701O/zq5GRegfIgA5sYhLwnWn5+sSLGwdyNTDGzELNIOIe2o/guXJ9qzde+tqUs9R
         N0XpcEvenP+e6IhCvSjvhLsMcsNPcOe9j06j/4TVznEa+GSAlldJs4+2XlQSmcJaDJ9o
         BAWhuNcMLMaMQbmg6uldEokiykPLBa1QzYNbBxEJ61I1dO4N2/hv/vWK1KyVXCa6AYIA
         M/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wBJwumtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si24085222edc.128.2020.01.20.05.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 05:32:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wBJwumtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36489 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itX9u-0006ny-S8
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 08:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itX7H-00045w-Hw
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itX7G-0001KU-LL
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:19 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33574)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itX7G-0001K8-Gy
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:18 -0500
Received: by mail-ot1-x343.google.com with SMTP id b18so28701713otp.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pRyNxs5Q9NG5xWtBvdkgzxPmO9+oLzgDCyhLAiXYDqA=;
 b=wBJwumtgCHfmeh02DYqzEVAZRy4IEavqYPEJGpjhIXXkz6J7Un/lBLVgKC3mJrDk2Z
 6hZf89DMTs6svWTyopNM8LeX0qzT0EfXz9qEDeS6D0eXxul5HWGVQCfIHtf5j6Des1O1
 roxyRAOQo3i63cMFpjdcs+Qhqvo/bWZR/Qo8lMnP+vMryBYHhYMbgGxtv1bNVwEQ2Tuw
 d3NgBkGP7iImOwooI5vdWwLwF0SbpM4uZ4m8uq6JhhFYgq36KpXB4Q/yn4Rowg+SYD5Z
 0c5oiKjD5tQ7kHMmpyWaZ9FZ8WFjUBqXeUX+mYu0ta55l/xzUnIX5ZgB4wGsNfQX9Af0
 3yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pRyNxs5Q9NG5xWtBvdkgzxPmO9+oLzgDCyhLAiXYDqA=;
 b=rM+zYC/T0zHUFYZk49PWfe2v9Itv5+5dqTYdjn9pMLyEJpdfXRfAprlFVAV8nwpzeO
 wE9iDBPxtfGYbJBmuS5ANjzmowpfAT3klY0ZkRj7TXE8WqMbjHMgxxn/SdJimByFVTuO
 /e/vaOdHP7PybsdGz/qpbIhX+WWp0/z1CgWA9pyBNXwy/fUISBdTSJ4VEbX6axmgZywi
 xJuQpGQ0i8r9nxB/MGsuN8CXa32L2zGkodb6J5MRt3ywv07Vp0S379JDS4fbrOetRvC9
 jQK9tAaJvGVnqr6azKhFYvMAPbzLa7PDCQ8wPwWVK7AvvxRO0VMUSfQBIchYTfDX5Nbg
 OTmw==
X-Gm-Message-State: APjAAAUp4muanxg59JD5+VumfKQ8OgF/kPyI499QiUqqMiMYOUv4bas9
 lbqCvABEcKyGtc+pVsdUxyoqU8jPnEJH2r/9fPNC7g==
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr15239259otr.221.1579526957951; 
 Mon, 20 Jan 2020 05:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-5-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-5-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:29:06 +0000
Message-ID: <CAFEAcA8RYhLfYhq3UH6qVz=of0kBcsL9bHfAparH6UYKx3UgXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/char/exynos4210_uart: Implement post_load
 function
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMZgJYroI6hX

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> After restoring a VM, serial parameters need to be updated to reflect
> restored register values. Implement a post_load function to handle this
> situation.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
