Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp149000lfo;
        Wed, 3 Feb 2021 03:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi85GdjvlmMotjr7rtiqXJM8QxW2B7NX045GxGmW4JvCEGP93By1e/8hWH/7eoePLWoidc
X-Received: by 2002:a25:344e:: with SMTP id b75mr3700033yba.377.1612352327869;
        Wed, 03 Feb 2021 03:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612352327; cv=none;
        d=google.com; s=arc-20160816;
        b=icUBxaPgcazyOSIe43ksc4uPTjWO86eCvEhrKz4HN9vAmMJo0iIRbXQwk/YHVA1alz
         4cxJXzg01rRzFcLBL9sf+jw6nlN7hU5A0aAstwW6ZXQwF3eSBBajAVQoDIVi11MLR2vT
         JBsptZCRdcp1haO/9X5H77GPbkEmRu8BXti12zYilfsr6trUTe43QYS8MJeK/2oWwzZI
         THLTww/4QuzRbsn1PXLSHogXr6nhq+evZvArzlMrQrNPYPa55hRfmIPgz0dqzK+ygI4w
         gRax8Akc4hmEk1F/NuWdEUSmas44sgIQhD43pBdFN2vfK5MhsC2uYk6h71sx7JwrNyiW
         p0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=kCe0wrxhIixQPpuqfAk/hnqjmpLhcYOLtawH01e4W7k=;
        b=CziUKnp/Sm8wN/HizUyTt2OpmQhL5eWhFdm7J4tzIDU6JFBIZbRzm83WOxZyO9uclE
         w+SWYY75RYAWVmTl3ROO0x07JxibDEpAfPx1ECr+B2MO/+SCs052oxfLAcTdU/z2E10J
         6wD/rYEvgHMMretBSH5xgjqp7m2g8ZyWHzbaNq+FIsy1xIVbLEkqF3dYCcB7eNG7Cv03
         JVPB4b6PGpzxb2O2zOYgzdq+tcHHtO+VjoyAwp/WVkqdDNJdNlliBzbXlwHdJQaABXyR
         WhlHai6F/5WSgUvy2+5J7FCN0aALscH0GYo1CtzC1S8E2FxUEJ01f81SjqLDDSAtoOxM
         QnIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NVwcNH6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si458898ybk.258.2021.02.03.03.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 03:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NVwcNH6j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7GUh-0007eF-88
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 06:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7GSN-0005JF-Pq
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 06:36:24 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7GSL-0006JT-G0
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 06:36:23 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u14so1959824wri.3
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kCe0wrxhIixQPpuqfAk/hnqjmpLhcYOLtawH01e4W7k=;
 b=NVwcNH6jfteO/c6zKUhsc2YB5yzzHbyiC7Kbe1TcwqsbREccFgjB2/IPt4PBX2Vjg5
 zcXP5gL+fPTt/SFOpBBePwb23D4MQpsH5aVrhIh1U0TSDEQ17gU++XHC+INKgWEs5POn
 EJvywQAaBcqMlg++0A7012anlaphxXwbEh4vul6GxW7W55URXg9ilnHvJ77UZ3mFs/us
 W5Nn5OtxSgrLgNcdEXrX15GdrsB4tOB6OSdOHZGFeY9HRL1H4Nm/BOT4EQat6dJEgMAJ
 Z4J7Lj9+xg89oKyolHAJ5ypmoAaGWDVF/0PxaLYjcJmbiPz7CzdRAGvgPHcyd1MlLCCh
 l0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kCe0wrxhIixQPpuqfAk/hnqjmpLhcYOLtawH01e4W7k=;
 b=npgxaBWLeX8sIgaLfX4BRmt1flhuICEdUlYli+RXKIf97zt89xBberzc6YoZrYSmw9
 QwqYjGXy/6II2hFGZrL9BLHTUYJ7qRaQObxz1XbnCxqC+lHnceWzi6uAmqkel9+EWh83
 CKQmAsZJBzSh5gN6lM7MyM2AdEAte5mBT5DEjXP+zM54T8ezacHCRIZbs4AB6x56eZ35
 kPFJwsVZl+FxYMsF6oESpzK0YpZte/jZQP6pP0nEzQ9nJdBM+tOqM9ZuOsZjpIKvj7wq
 lMug47lkp8Ry7HoLZ/sCokHG4BWJ/v3GGvBNMumUvDP7NOQM1kqTF6W8uanBrpRKRmb/
 lVGw==
X-Gm-Message-State: AOAM532aNWeotkqp6xDQ5RCTj5781Idzbrr64w3xYw4BUsCZKS162w5P
 HBf1lAetNvn6WPP9j/AbU0Lu6g==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr2959944wro.383.1612352179576; 
 Wed, 03 Feb 2021 03:36:19 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id c18sm14955709wmk.0.2021.02.03.03.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:36:19 -0800 (PST)
Date: Wed, 3 Feb 2021 11:36:17 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 4/4] hw/intc: make gicv3_idreg() distinguish between
 gicv3/gicv4
Message-ID: <20210203113617.GV1664@vanye>
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-5-leif@nuviainc.com>
 <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Neol2fgx0cfA

On Tue, Feb 02, 2021 at 10:31:16 +0000, Peter Maydell wrote:
> On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Make gicv3_idreg() able to return either gicv3 or gicv4 data.
> > Add a parameter to specify gic version.
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >  hw/intc/arm_gicv3_dist.c   |  2 +-
> >  hw/intc/arm_gicv3_redist.c |  2 +-
> >  hw/intc/gicv3_internal.h   | 12 ++++++++++--
> >  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> > -static inline uint32_t gicv3_idreg(int regoffset)
> > +static inline uint32_t gicv3_idreg(int regoffset, int revision)
> 
> I would prefer to pass in the GICv3State* and let the function
> look at s->revision.

Yeah, that'd be neater.

> >  {
> >      /* Return the value of the CoreSight ID register at the specified
> >       * offset from the first ID register (as found in the distributor
> > @@ -331,7 +331,15 @@ static inline uint32_t gicv3_idreg(int regoffset)
> >      static const uint8_t gicd_ids[] = {
> >          0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> >      };
> > -    return gicd_ids[regoffset / 4];
> > +    static const uint8_t gicdv4_ids[] = {
> > +        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x4B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> > +    };
> > +
> > +    if (revision == 3) {
> > +        return gicd_ids[regoffset / 4];
> > +    } else {
> > +        return gicdv4_ids[regoffset / 4];
> > +    }
> >  }
> 
> Updating the comment "These values indicate an ARM implementation of a GICv3"
> to add a note about what the new values are indicating would be nice.

Will do.

Regards,

Leif
