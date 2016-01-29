Received: by 10.25.159.19 with SMTP id i19csp1059866lfe;
        Fri, 29 Jan 2016 09:06:07 -0800 (PST)
X-Received: by 10.31.162.82 with SMTP id l79mr6820076vke.76.1454087166996;
        Fri, 29 Jan 2016 09:06:06 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com. [2607:f8b0:400c:c05::235])
        by mx.google.com with ESMTPS id d202si13928733vka.208.2016.01.29.09.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 09:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) client-ip=2607:f8b0:400c:c05::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x235.google.com with SMTP id e64so45662932vkg.0
        for <alex.bennee@linaro.org>; Fri, 29 Jan 2016 09:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=aN75FOMmnqhUrvQequ30eHwCr0B1Eef5Y7EAhNJbcb0=;
        b=UkV/KpiDdnwJllymkzwnq/uaoHEZemSiIw2dLAKocC3XymTDjnYjtj57lZo6R88Bf8
         80wwfqoChM6e4twPB4S8UKVnNVV3Gu6VnoI7dPiWBVCrrvVOEtLf0BhKJsiuSfplwgyR
         lrkNWrOywdIQOM9jxG/ds8ynZ0eMakHebldyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=aN75FOMmnqhUrvQequ30eHwCr0B1Eef5Y7EAhNJbcb0=;
        b=hWtIdoxPwVbn7S71wr+VjPnmkrrriN/qC8uY8wGT/AiRVuXvvR5OSWwvK/UTY7RPh5
         Re0zf3dHNSZ7CxJIcVxS1uCG1C/OEKX4bgXmPrTxWdDeO9AjCAdJKgk7Ajsrz+WjbhMp
         1oiw3nWm7MMFZxcviM+nQJH7RfNS88jpp6oT5YrJmtXcDT0Aly8WnrChehFFPx9DvtCR
         Msxd0MdKM56I1r52xKnD73wEOkklkZ+kxWaXUVBGM6c6CQj/nZiHm6tDhngsoBIKUGRS
         68EJWF+HHv+CCWKUy0PMC8OKNzLPsydh4weG5jNDUG6fPmKz4mgQJzFtferQWFHSGCva
         PAMg==
X-Gm-Message-State: AG10YOQ0Skq/e0xDpb2QJzpdaFph6l2rN7TN/EKRZW8J64rN9PNwlHrQJ5JS2fSiuhykuGmrq/mrIAwPx98gi9nT49k=
X-Received: by 10.31.180.85 with SMTP id d82mr5929531vkf.83.1454087166587;
 Fri, 29 Jan 2016 09:06:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 29 Jan 2016 09:05:47 -0800 (PST)
In-Reply-To: <56AB972A.5010007@gmail.com>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org> <56AB972A.5010007@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2016 17:05:47 +0000
Message-ID: <CAFEAcA908Y_a112aTXM46q7rhKHrHaK85pP7jKwZs5bc6evBug@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/8] target-arm: Properly support EL2 and EL3
 in arm_el_is_aa64()
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: 3KAsoVH+VVa5

On 29 January 2016 at 16:45, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 14.01.2016 21:34, Peter Maydell wrote:
>> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
>> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
>> as appropriate to determine the register width of lower exception
>> levels.
>
> Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

Thanks for the review, but this series went into master last week :-)

-- PMM
