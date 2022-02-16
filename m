Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1221520lfl;
        Wed, 16 Feb 2022 09:50:16 -0800 (PST)
X-Received: by 2002:a05:6000:188b:b0:1e3:1cfa:5851 with SMTP id a11-20020a056000188b00b001e31cfa5851mr3345698wri.510.1645033816620;
        Wed, 16 Feb 2022 09:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645033816; cv=none;
        d=google.com; s=arc-20160816;
        b=VsMKt8nlDYqElOebuzlCkvYA6ChZHDbhGlnAwERaSskC7dxjakIqgOekfKshwwujzZ
         PCjsS9U9E/ty084cq7n3DXNM46+Wfljl4wHy8KX9FQfUiZ1mlw9o+RaYSo76/yAH5NmV
         AtYuYvSzBnAKS6BBXPUJFh/tnmqQqZwQCUpbmiOtc7gOKRdZWBwc4ZWzvkky2scont9s
         CarJxSzVdOpBPYCXgJvF2/emOGsIsnubML9VDX8YISjxg+cnqNIqVVVBujcZd4J36tm3
         jxb3dtl9p3inx7X9Ro28cjKY1cb1jxRZC0mtJM984+EaR3OaIvjtX0MTgmslP4ECIRJN
         NSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D9+ntbNNi3DTGoJYbqPoXHLTHMxRXJp9W4fi+jSO4yc=;
        b=bAHfI5kmlc/QteoGxejOQaKP6g9m0sMRhquC3uMmJTESfHcyF3gncWk7nsL96UOfWe
         6QwoQMHb7cpUd3lrutCsIvq2a4gYJeivlplpqUntXZoL6t5FotsHyjGYkctCVqNEwI+n
         6yeorl2hLWkzGknL7VbLxaeaChlH7LHnsYrA/v9j2Ha8BJ+lUyQJ9OhnJD5JD8G1F/9R
         V8gSDzQfjnnAbespmMbHQ5n7cAw/sYv9BOqxVM4TUZiJVEQUetCwioCxn1Oqqt4W21ms
         ZddSFK6kJTfFNofFrB4i8CndUFNpIzNDpsuREaErjOoijUYiBdUI5iRbo4qJyiS5Hgnb
         QBBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf3UT32f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13sor6621445wrz.7.2022.02.16.09.50.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Feb 2022 09:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hf3UT32f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9+ntbNNi3DTGoJYbqPoXHLTHMxRXJp9W4fi+jSO4yc=;
        b=hf3UT32feMiXMTUIvkSUYRt6CSYUxSiXHJ4oSCZpDFH/nhjcdrQl8U2Nid+t9nEY1l
         dj9hQDUN9JkrCp+qkynnJCEIqTQMWeVAr7kDK/yz7zpcJ51PvRlnIg+EGlP575IYhCsw
         fpLzgu2HS+9DhfqGfwoEjP18+PMMlAyPFbXpslk4x7N2TxlD/lBvWTzcGDgjq+VyaX6B
         h4M3qeJn7+DUgM3ca0/2kqE/ufjejRkLCa9dvjXeAsuh7q+zk2cRtFovaZNa5+pA9jP4
         P+cFDaEKwrHH3xRnv09nfAmIexNB8mDv7z+JFlaSJJ+BXN9gJXXHVdSBS7Ia6sbX+o2y
         1/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9+ntbNNi3DTGoJYbqPoXHLTHMxRXJp9W4fi+jSO4yc=;
        b=8JVOo+U565y0OZqusc9RgWyYBT4Vmpd0k5OIWofQ3CgqOz50kmn9rwHQMhEroEdIlc
         6y+obyB86TqN7ZW0GQVIDkWAR7chhEQHhJHT4lbwcY5ZuDuwoXOzIDyvjQKKHQi5/XA4
         uZLCbjMiNbVLqjfw8aYnjtNxDndAngmFoer4g3gejl6vKkLZ+GEOpPDZh7wJMhd5+3Am
         AETrnhhN9D8YBBm8Ozww5kI5h2DCqej7TMbd+HZrM5uYjkjJ0nkrxK1QOVnYP/6+bXEn
         JkTXOrzxIROUYPNBBd06a0I2F2CT035FErMfg25ux/WsVlRW5U0QCFDoCzuqULPK/5/s
         uQ5A==
X-Gm-Message-State: AOAM530G/rX3CETxXIecz0ZgxSiHp0PDC1Ke2+WBxN4thj3pFdncW1xC
	ydN13AvKl0xJfX5DkIOs+ZVAorHhaHIgCjN7v+gqDTND
X-Google-Smtp-Source: ABdhPJxVuNg7ZZpCZrW1TzeB6SsFBLWYTlmkGk9CuI0whOyJfy/JupxlirLnOEZaKzow8SaRwX0aH7GnDbUNUX1Z/kQ=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr3224961wrm.521.1645033816390; Wed, 16
 Feb 2022 09:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-16-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:50:05 +0000
Message-ID: <CAFEAcA_tJHVbhpT5fRQyhUmYGE1fOn9uuemd5v+BH0XObr-02A@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] target/arm: Implement FEAT_LPA2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: oern1707j2FX

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature widens physical addresses (and intermediate physical
> addresses for 2-stage translation) from 48 to 52 bits, when using
> 4k or 16k pages.
>
> This introduces the DS bit to TCR_ELx, which is RES0 unless the
> page size is enabled and supports LPA2, resulting in the effective
> value of DS for a given table walk.  The DS bit changes the format
> of the page table descriptor slightly, moving the PS field out to
> TCR so that all pages have the same sharability and repurposing
> those bits of the page table descriptor for the highest bits of
> the output address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
