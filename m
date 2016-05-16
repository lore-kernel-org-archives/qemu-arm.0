Received: by 10.25.208.137 with SMTP id h131csp1381830lfg;
        Mon, 16 May 2016 11:16:44 -0700 (PDT)
X-Received: by 10.159.33.234 with SMTP id 97mr15340343uac.90.1463422604233;
        Mon, 16 May 2016 11:16:44 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com. [2607:f8b0:400c:c05::22d])
        by mx.google.com with ESMTPS id i5si12532294vkb.98.2016.05.16.11.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2016 11:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22d as permitted sender) client-ip=2607:f8b0:400c:c05::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22d as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x22d.google.com with SMTP id s184so223214805vkb.3
        for <alex.bennee@linaro.org>; Mon, 16 May 2016 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ETq1XX259iquxF+Q9v6+v8bdAdvM9BOjx0HIJ7Xnt0g=;
        b=iPw84gQ1ata/LSxK6ebIVO+zRae0FQdRUF4bylXPQSNBN3sVTulxlgbvqUqkxo15iU
         2OIVfujUSfJCTUZO0xEbY7N+menGc1qQlJ/H7kyt61zj7nnSIUQhRShSjk1iYPSGr5Gm
         wKZiwQQlQojTQEZuzQVEN65hyBz3+UaWHtnVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ETq1XX259iquxF+Q9v6+v8bdAdvM9BOjx0HIJ7Xnt0g=;
        b=mG0Ch/wVUMOAxQKfqPw3RY7o53u26DKKDE7hZECBmWAvaQ906gKoxHnMU1wf7nkhuu
         HEvnJN1lfNs3rsf/RosIV43fljPlea4PfFIpXwZJTMtQ002/f66YgAkAA5tI3VzuorrV
         XXTIXVmnu9dopaz4Afx9cjF+rpIuzsTQZi9AMZ5nM1mpN5Wys78PK8mRYbSZLat00ScN
         HWjKS8wf+ryIzCx2l7xde2Mio5udo55n3rF9vWMI1ipr1m+s6F9UMFHZyQSDmnJpRZw6
         ORHzDh8yas6wLgKR8csCOjk9JuaFVQvvbJB/uAgvaysTcNM26ff66IhSLvk61YqcUr+k
         ywrw==
X-Gm-Message-State: AOPr4FVipfegifuZYkocr80TTVXGKzUTaYejwzBix7g0L2H47Isrk1Km2tV+iocA/ZYGJ8hsgHeVCQ8oceRnefcEBqQ=
X-Received: by 10.176.6.100 with SMTP id f91mr13587773uaf.38.1463422603950;
 Mon, 16 May 2016 11:16:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 16 May 2016 11:16:24 -0700 (PDT)
In-Reply-To: <1462464601-10888-1-git-send-email-edgar.iglesias@gmail.com>
References: <1462464601-10888-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2016 19:16:24 +0100
Message-ID: <CAFEAcA-d4Ez5kOwo78whR8qh=bP46xKGx7RaKSKGJ9hACvWFEA@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] arm: Steps towards EL2 support round 6
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: x9dlmdvyZ2z0

On 5 May 2016 at 17:10, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> Another round of patches towards EL2 support. This one adds partial
> Instruction Syndrome generation for Data Aborts while running in AArch64.
>
> I don't feel very confident with the way I collect the regsize info used
> to fill out the SF field. Feedback on that would be great.
>
> Once we sort out the details on how this should be implemented we can
> fill out the parts needed for AArch32. Possibly in a future version of
> this same series.

Applied to target-arm.next, thanks.

-- PMM
