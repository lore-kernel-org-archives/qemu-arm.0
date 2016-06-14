Received: by 10.25.21.96 with SMTP id l93csp66628lfi;
        Tue, 14 Jun 2016 05:51:58 -0700 (PDT)
X-Received: by 10.159.37.196 with SMTP id 62mr8538418uaf.68.1465908718791;
        Tue, 14 Jun 2016 05:51:58 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com. [2607:f8b0:400c:c05::230])
        by mx.google.com with ESMTPS id a192si9833324vkf.47.2016.06.14.05.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jun 2016 05:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) client-ip=2607:f8b0:400c:c05::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x230.google.com with SMTP id t129so91634359vka.1
        for <alex.bennee@linaro.org>; Tue, 14 Jun 2016 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qPrX203Q5sxwv8xSqFrtEopRuffgo86Dzyy/C2cJ4uo=;
        b=YN6he6yz22kcVs2YQIA4Bst9UjC69aWUuwkZA41qK6LM8o7xpB6cDhvPOAd2nseclP
         XjIjqJmZMSfk5bhAy918RRbUtVlGsQSLCjwN8MoFvFQ9EdHsnazh7dkD4dURZ3vxkO4H
         +qgRRiHyXzmXt0PGjeKKWYoCupkHrYTxAjNF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qPrX203Q5sxwv8xSqFrtEopRuffgo86Dzyy/C2cJ4uo=;
        b=XmuIvINp8pMET3SCMgkVjNKnTT79TJqQMSfxP6D4R0UaHdpp7CIYP5QqQRSqutFnom
         FD7hwVV06mHbWoXBKsBVIlq+QpypElA3+tx0MwMj64al1OB8tLeKw0oN17rXDnT5deMK
         vb4SbL1Cgot3vahWITNWvyeL0DADMaH9t5MxNO5gk82M1JR3eYrvdQCrR845BL+qSJto
         asJcuPn+r458xlfWhqS/F02WwnvdwwPbjQa6eUxXATMiBgj9NGo6ILp72MkQ883kcMS8
         XuHWrab5VrmrkEsvmmJXwMEFXJykxkzcrtjG59S3NUUWUI4o2xRkjR3ERDgqC+/dWWci
         AWuw==
X-Gm-Message-State: ALyK8tKRofUysHYP2M0o1v1Ow7Nzs94VyCepIg2bM6a4QBJ8oKbuZlo8DRF6N+aHtPIbRQpf5DGke0wKFSqrzwgcnAo=
X-Received: by 10.176.1.238 with SMTP id 101mr5993590ual.119.1465908718438;
 Tue, 14 Jun 2016 05:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Tue, 14 Jun 2016 05:51:39 -0700 (PDT)
In-Reply-To: <1465746713-30414-1-git-send-email-drjones@redhat.com>
References: <1465746713-30414-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 13:51:39 +0100
Message-ID: <CAFEAcA-Z=8sj0RqOZF_jkQ+KZQnebm-TxHNfJdcFodci+UKsjw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] create the mach-virt 2.7 machine type
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: +XLwIixokGMq

On 12 June 2016 at 16:51, Andrew Jones <drjones@redhat.com> wrote:
> v2:
>  - drop 'is_default' setting [Peter]
>  - fix checkpatch warning [Peter]
>  - add a couple R-b's
>
> This is the first new machine type mach-virt has received
> (2.6 being the first versioned machine type), so we need to
> do a bit more than the average "new machine type" patch.
> The first four patches prepare for easy-adding of machine
> types. The last patch adds the 2.7 type.
>
>
> Andrew Jones (4):
>   hw/arm/virt: separate versioned type-init code
>   hw/arm/virt: introduce DEFINE_VIRT_MACHINE
>   hw/arm/virt: introduce DEFINE_VIRT_MACHINE_AS_LATEST
>   hw/arm/virt: create the 2.7 machine type
>
>  hw/arm/virt.c | 66 ++++++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 50 insertions(+), 16 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
