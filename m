Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1319436lfq;
        Thu, 8 Oct 2020 06:04:02 -0700 (PDT)
X-Received: by 2002:a19:c696:: with SMTP id w144mr2459350lff.257.1602162242445;
        Thu, 08 Oct 2020 06:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602162242; cv=none;
        d=google.com; s=arc-20160816;
        b=w5+ULQf8cGvNKhJ2AbWnrdN0KK/fZ71A+Lzynia+K4s24xYB64fQnOHGEGLDmq3ZDL
         37B6pC+bYEHmEHcfg95SE5tb2Urhw5hsmtvFhmfQqjsdQ7ZVpGr8f2LYBVzLODxNbP9u
         BZJ3GDXRI9SiOvxZEM54CX0aiSlXFcC8TilJL8M/eTwxCu3rXN6B/DSJ0KsuVjaad2Jv
         IkSwnPDgHFZAN5+Ge9ajpG7CDV6GUE74rFcprxWpaVxAI/dIQs6mR99geq0rkYCZRbXE
         hSa2H0psCb0jJtH/Y+7VmJtA5ReeHnjknrd9XHjwdcYXiaqy4j9HdrytmOBZ44WF9/LP
         qqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c+1D4f03yVA463ZeH3DdyuLhiwzm+9v0rsGvKpr+4wM=;
        b=iFHjw010Qc9WkwSY3iI9L3YibBusyV5jC/eR+778O8bD1x97ei36Sq031YqvlyskLX
         LSrX5SKaSs/TEYtqHwUk3u4ehRHQYHqIySgcM3+uY/6Wdvs7FbLA6XKwWLiKOZaPtw6N
         0VlR0/FBn2UXcstUJwlAABF4XtcqZrsMbnUTOoP6FnIasuA1NeHW0iPmJElC7EUJMVwt
         3R4rPGdIwR7F5fe2LUoT5eWgaIyxk/nesdxaAE0GuvLsCZN7x82onXG6cHA3juUJQ1CE
         y4w6YWzviQaUpBXWHZM3axWT68EvbkZVZI4JTYlx5FgK4qy9+0Q8nPc2cYHRlRIBDzqI
         vFrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QITGun6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p7sor5160744edw.11.2020.10.08.06.04.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Oct 2020 06:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QITGun6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+1D4f03yVA463ZeH3DdyuLhiwzm+9v0rsGvKpr+4wM=;
        b=QITGun6giRJzKt1HzgtoH1XWyakzw9Xek9TQRqAKyaX+ymWY+I6oQlQXwf1wPb453W
         EGYQHYEVixTzK8t0ZxCkImR8Tdrj4KIXr0iqosj9UDwTKOwhwQBEMYp//B8DHxLX+vyT
         Dc73jP1zrmcjl9E0QxEzr2B8SvekRrKNFlceiWjr2jKvjsiBWvf6+ZjWcYmekNFURxXj
         ZBUaNixS/N+cofa/e/qns575fDJ32WfqKyBIZPXxejX8QCjl/JRDqT6+2KG6UTXRZ6Bz
         R6ZXNw20g4p0SlZq99Lk+B4bWuoiz1Laiuvrid0kcuTcv1P2IhYKz6oCkO77II2Hvo8S
         WBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+1D4f03yVA463ZeH3DdyuLhiwzm+9v0rsGvKpr+4wM=;
        b=WaMy4lTcHVuAkI5CTsY8bkdmdWkVbXesrhdTXzdHE3iju0mV5LKdt4Gx/+GHBdYbaO
         /rL75oAReejU9jArvrKfc8o1Fo8AHAi1eMydSHKPUdpX0grl/hooFAs54OtLaB+qL9MN
         lQCuK/Hm7ComnwcQONttcbReSRNwyBS5cAC1G7oEHgxKnMl5OzkqnZNBXby9AK1BQBNe
         wO/MYCmJ4Zflr4Vn5EeuwiTQMdVjVROaz9aLvkoraCcb/9v5H9JVGaVcRqUQ11PvVsBN
         e2iOJqAb0BWP7Cva6NDNCr3OWWGIBee6cjde/Kg3nw5oHrskzGSDSEkpqSH+hTEfBxiu
         y9pA==
X-Gm-Message-State: AOAM533ZkOdmtl8myBN6mNtUvamuM1d50p+neyDhWCJyRLISTwDyKw+t
	kGQH4swoG8P++OFEwGIi4LG3Qp7/WqZq61s5JJOR7bRLVeMA56pI
X-Google-Smtp-Source: ABdhPJxHE57IWwlHyOtwYV/KvG51MmSnf4JRnEHkWSUT/UI0f0hEvw66pbxn9mQOKjFEW4jjqo/0vqg7RKaCTd/Lnxo=
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr8685420edw.251.1602162242124;
 Thu, 08 Oct 2020 06:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201002215955.254866-1-richard.henderson@linaro.org> <20201002215955.254866-6-richard.henderson@linaro.org>
In-Reply-To: <20201002215955.254866-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 14:03:50 +0100
Message-ID: <CAFEAcA_oOGrLAWDPOn=PEaoixYb+MdU-6BbW1uuoLC0ij7WXeg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] linux-user/elfload: Adjust iteration over phdr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vAF2cvZDX7MN

On Fri, 2 Oct 2020 at 23:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The second loop uses a loop induction variable, and the first
> does not.  Transform the first to match the second, to simplify
> a following patch moving code between them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
