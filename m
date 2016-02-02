Received: by 10.25.159.19 with SMTP id i19csp607996lfe;
        Tue, 2 Feb 2016 04:10:27 -0800 (PST)
X-Received: by 10.31.165.76 with SMTP id o73mr17804216vke.67.1454415027357;
        Tue, 02 Feb 2016 04:10:27 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com. [2607:f8b0:400c:c05::233])
        by mx.google.com with ESMTPS id w62si840427vkw.209.2016.02.02.04.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2016 04:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) client-ip=2607:f8b0:400c:c05::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x233.google.com with SMTP id n1so95489315vkb.3
        for <alex.bennee@linaro.org>; Tue, 02 Feb 2016 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=w4Ei2dFZTJvyWydyf4NQZg/0NurM6JKshvoJEtopSYk=;
        b=QlpuSSIsAu1se0WQL4/uiPDjxw12J8p7aEptDxb9mxHHNwEMI75NO+UPlJrACpj3C6
         5nqXzlA0hC4LiihUk5k4yc7vRCGC/+6fQnAQFTj1EDtfa309q8zZ5skE9gYUSXxkfzcS
         7AzXYyieiCGAdULoCD+ZeC3VnQ4xonbVpBhXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=w4Ei2dFZTJvyWydyf4NQZg/0NurM6JKshvoJEtopSYk=;
        b=AAFzqWzXg/XlQpzTNVpyMBHhI3ZIBR1Z+8AXgqfQLmW3XK7/wCkfd4gU0KOqampULI
         T2CKleJv8bJnyxnxQ9M/ObHuApd0EFCCcWaT5fXQn+9R+9vleI5CEUifMin1lIwM1JCL
         6J8aEizFyZTSSo773A3ct2Q/Ecv5pBrubTvJrXnwVBRoCoFbupss++CssUwXJwJG/WNG
         NarlaQ3XtnnRpaCo5Nc47cTr7k0HTCosOZcfNZfFdn5joZkxdCGVhlNJNYR6n3TB8AEJ
         WFamvfSCq6yiITUAgvPJLq7dLspBCARMFuyQvehyhsmvoMykYaZJI8JBZF2KOfWEHZJj
         dQcw==
X-Gm-Message-State: AG10YOR+OUWZI+pf6t4ozJ4NsfCdJCMmiTulLg+gXMbb8X2hkoQktqKjHHpWD4oOIUsPEj7+FXt8yABMl6UoRfXYnRc=
X-Received: by 10.31.194.130 with SMTP id s124mr19913666vkf.92.1454415026906;
 Tue, 02 Feb 2016 04:10:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 2 Feb 2016 04:10:07 -0800 (PST)
In-Reply-To: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453932970-14576-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2016 12:10:07 +0000
Message-ID: <CAFEAcA-FMXJCEvcpPMEqwzk5fg71S+CWfatSYKyqY4PER6pCoQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] target-arm: Add a few more S2 MMU input checks
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: GyA0i0x5zzFP

On 27 January 2016 at 22:16, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This adds the inputsize > pamax check and also fixes the
> startlevel checks to apply to the 64bit translations.
>
> Comments welcome!

Thanks, applied to target-arm.next.

-- PMM
