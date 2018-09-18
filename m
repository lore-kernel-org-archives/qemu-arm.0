Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5624254wrd;
        Tue, 18 Sep 2018 12:46:33 -0700 (PDT)
X-Received: by 2002:aca:6b87:: with SMTP id g129-v6mr2654773oic.88.1537299993067;
        Tue, 18 Sep 2018 12:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537299993; cv=none;
        d=google.com; s=arc-20160816;
        b=gfIQNg9yBMGgxsEYJesZN2g9tbhucKhrVZomlfBAHGWQYIwtXjzDahcmxYQre4z9xz
         L6pF2rpkr229Cnbr731GfEceBqUY1YpSLCS/2PDgDZQbkmLD10ADZFEAX9vMzJeGJlnx
         N8k/jDqjVOzHTme44+2pxNqtc0MeKvT0g25++C6Nt/fwKoVlDO55mqnxIlWufFdkiOKz
         LLR+DBDfgds9kqUbA3rghZ11x/Dq8V7CIXv9IYl0eNw3wwxrZxtVtRPAd/GdVH/APtxs
         LTgHGWms3iHy0+8T0a2VuhR2Ob1jO1LH1p7w+UYtCa1og3OowzHO9oNXKkqj+7oz64wk
         iemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=JQt23cc6gVJ1TPCBcuAh/QGVDGLhmrIbVlyhCodIM7c=;
        b=uDt1duRSt7Vm0l/xl9yFFSGJxgDlT9cRjGq2papGF/R9tfwKNdZWka5JeXxa3U29IV
         /QUHK5EL/uPFmoSuo0Ut4CnAMj4IBdtemjtKN1QBg+FZjDkFMeNh3QhgJ9yx8eq9NiO1
         laI8CHpXE5AgJ/5FOa7YgzWR7m0zV/31sgljpGDk1QDX2KRrtv5rn69EflT3GNygsEUA
         R//GjLRYxFPtUeZWWlueL5BlDoHR0pfaDSvjIwybhFZlwxnrhHgkPDJ27Vs9fLDybo7G
         TM/gLNU6uh2Q8ZOhL7cZpdNrleDQFKs1oA1TJv+4aHLHOfzZzec0MTpjZYQaZLYV3/Mx
         BrLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7Mjs+en;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e44-v6sor11975374otd.266.2018.09.18.12.46.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Sep 2018 12:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7Mjs+en;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=JQt23cc6gVJ1TPCBcuAh/QGVDGLhmrIbVlyhCodIM7c=;
        b=A7Mjs+en85DENVgJYw33GN0zu5uo/Pcnn4SPBkS0xM1eVTrv8P3YF/ZEx+C8WqmioZ
         PmI0tyKMaq/iP6xq8uGVLderK0YEyFnA7Xw4Ow3/ItC8w2xBDJoGpxXP8R60laPeHxbR
         4nqHU9MLOLi8/UQ8xVxWz2FlPJkbt+wpmLta0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=JQt23cc6gVJ1TPCBcuAh/QGVDGLhmrIbVlyhCodIM7c=;
        b=mejV9eZfPUkVV47daBR3AqRplyARKytJTSiIzlRvjGx0DolFxLLFY3nzi/5ee0YKMo
         pmpUP7T6LJVB6mopiog5aBoF4cJGLdh/0wfyk+x4LgU+R+wBdRiSEeIC4Zt7Kzo2mV+Y
         ZMU/Tyb9WBoZWExluNfcI/B8oyfJInHDCGwUrew3yumx48ALto+TvTh46hiTyQ9j1Fsg
         iSW89D4hCF35tJ38UoUldwPAzR9tHtD62+IbymD/zI1QrnY4zQz2yt2Qbc9mSmGGnZiW
         Ad/8Lwx49HRTnEQ6O0zPa4hcP/P4NTv1jjdLlOH4mzleTYr1oS98ViYBQ4UBzHZf9x8w
         mb3Q==
X-Gm-Message-State: APzg51BClfTFLTMXKlJ3YQ/lPE4PNSH/Ze4jBflPT4Iv7kYgJCEfBBV8
	QECPqkuTTDNZOm+M6Aqk+PQDnRxm93+WvBaUC7rBH3J1R5s=
X-Google-Smtp-Source: ANB0VdayvX9zbjcKXlrMfzRoEQqp81eVi5he8JtYmWS/zFbx6iMuGuu19vga/hg3szxWJfr3AOnNbqc+SkGJH+Kq4ko=
X-Received: by 2002:a9d:2e92:: with SMTP id w18-v6mr17410980ota.324.1537299990953;
 Tue, 18 Sep 2018 12:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 12:46:10
 -0700 (PDT)
In-Reply-To: <CAFEAcA-vg88gJKHKa8xOVdNvTp_dk3THwhY+eFdxvPtrXq8CjQ@mail.gmail.com>
References: <1536488638-29326-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-vg88gJKHKa8xOVdNvTp_dk3THwhY+eFdxvPtrXq8CjQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 12:46:10 -0700
Message-ID: <CAFEAcA9UPZC0csO-jGWF1Y-Bksh9PCkHGyNgjx9Osa4q3_uB9Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gIYrZZhUxOBV

On 18 September 2018 at 12:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 September 2018 at 03:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> +#include "hw/arm/primecell.h"
>> +#include "hw/arm/virt.h"Please remove all the code you don't need, rather than
> just copin

Oops, please ignore this line, it is stray editor junk that I failed
to delete when writing my reply (my gmail window is very laggy here...)

thanks
-- PMM
