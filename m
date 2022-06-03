Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5690026lfh;
        Fri, 3 Jun 2022 08:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVaN4XDYkw0EAOIiKalUw1gUI9ruH0Escm0zL812A2mG2Oe7o9iyORWpfHNqvEbwh3c7jS
X-Received: by 2002:a17:907:2c65:b0:70e:c2ee:781b with SMTP id ib5-20020a1709072c6500b0070ec2ee781bmr2601174ejc.281.1654268742286;
        Fri, 03 Jun 2022 08:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654268742; cv=none;
        d=google.com; s=arc-20160816;
        b=cmQHjgUPATW7fzaa/Z36Pbow9rMrAIrm0td897dqUkWfUDfEzkB0ttZCaakDVScUnw
         dnyVuSpPOT5571V4yON5so0deKXG0jphCguJiF1ZNK/SyAuliUFO6bjjEht9mo9VKxvm
         x4PJhxLfHz5zmQGoQWkaG4hSV9gT1BKuxT0pEGyUvQQxZVML6hIYAGuQrVwiBBk0mGG9
         VkWfVPqQKWT84d1BvT9kFswNq/CDYLYwq3ThRsaqo1T0AoOryB0eIX+pQ9jCpvs5zUON
         nsqUbtK3gqMbf4/koNBbWjuzjjHgQN/Oea4InGrx2zdHyU+NKP4wZrMp8x7wKPEkg01q
         H0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=WPOzktgP8+qV4fmhY1epDvCQ0q7ju+YfQIdYpZDIG+w=;
        b=ItVrs4vAErNZ7ID6tKahYTEzFT60mRwDDUCMj30fzt4On++KuGssTfZE82o8Ntx2VQ
         uhsDMvav6xN0d+yQA4HntiubM6b0AK1mWV980ywfoX9lvlzCmO2GJ6QbeAo88+aoNL5F
         oIqaDGP7dQhVAtEBvQL3l5d/Z2bNynML46xPMGsaqo4fNDcQ+1BfqVL/hrOrjLU4EEEX
         qdFl7w0pVbORbLv7CkukCu32a9Tn/CpmKsEY1JbZZv4LmasiG77lPN2HpSC6o7nfTW/S
         qlMDBlAC+4DNC0TfmewOqrrqXtv5hmTXz7cE84BDBSU3hTZqAmY0SRmckKWW2vqQSbud
         hDIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SxSbuHnG;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id go34-20020a1709070da200b006ff47216539si1445185ejc.537.2022.06.03.08.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 08:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SxSbuHnG;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654268741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPOzktgP8+qV4fmhY1epDvCQ0q7ju+YfQIdYpZDIG+w=;
	b=SxSbuHnGdpVtucmVKmEgCucMHV9AQkVovtCXEcaR7qjBtYH4KODFO7UzVRV/rkZAtUGRUe
	6KhXca8PyLuVfXnrTu6czlq0HbhDMOhLy18Jn5aHdHvjCribWXIh4CWNqwHxCaFq8MtcNl
	T9QmzLvOBvUkgswSLXWC9bs2dhJ75og=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-18bbfUE6O46XlpohIUNscw-1; Fri, 03 Jun 2022 11:05:40 -0400
X-MC-Unique: 18bbfUE6O46XlpohIUNscw-1
Received: by mail-ed1-f71.google.com with SMTP id k7-20020aa7d8c7000000b0042dd4a5a393so5668803eds.11
        for <alex.bennee@linaro.org>; Fri, 03 Jun 2022 08:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WPOzktgP8+qV4fmhY1epDvCQ0q7ju+YfQIdYpZDIG+w=;
        b=nbOIcNuwu/yskX7xCnQ/aPnG0SNTRaFNO1boJJ+wiuZzIgpiifDahcvYX1Y3s9pBE1
         xTz52shhv68/vrQQHWuOI5j/4Cs8tjf/vKD8beGwWC/P2oX9kE/DrV7GHntDm6aP0/5o
         IbJNfhv+tw445Y1uVGpxNK2acpu7Xz+HOXoIKwsw3uN6LChIBWigHW/7YRxo+yaQl9o9
         IhbijQu/VTvI43DTsLgHk1H1oCztW7TUlG1TqDeiHvVjtHEMDtI7H9h8diPOiRSk514z
         7K9vnMPV7LXPdnKt2E8eDHTrhp3cqVMvWGi4iKOZGPlb0Ip9RjXPvZDw+IpomLk/3OTe
         djYw==
X-Gm-Message-State: AOAM530gsoxFgaQTRo4yjNlyJwN38paqm9PRGcZ9AvzQYyJYh3o8VKdk
	ikJaHro7Lc/MlmGb6Il3m+/jpB8xmzkEDQ1nb5VfnFFuj00DZpNM2rlt5MsRoVdLkkYkrsOlLOU
	cVrJE5NaMMqP1EWI5
X-Received: by 2002:a05:6402:f17:b0:42d:d3f3:244c with SMTP id i23-20020a0564020f1700b0042dd3f3244cmr11309733eda.52.1654268739020;
        Fri, 03 Jun 2022 08:05:39 -0700 (PDT)
X-Received: by 2002:a05:6402:f17:b0:42d:d3f3:244c with SMTP id i23-20020a0564020f1700b0042dd3f3244cmr11309710eda.52.1654268738817;
        Fri, 03 Jun 2022 08:05:38 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
        by smtp.gmail.com with ESMTPSA id cz20-20020a0564021cb400b0042dd85bd23bsm3988813edb.55.2022.06.03.08.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:05:38 -0700 (PDT)
Date: Fri, 3 Jun 2022 17:05:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH] tests/avocado: Prefer max cpu type when using AArch64
 virt machine
Message-ID: <20220603150536.pt5jwmoeoqfkeixu@gator>
References: <20220603092505.1450350-1-drjones@redhat.com>
 <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
MIME-Version: 1.0
In-Reply-To: <892b330e-2b7c-0cf7-f7a7-3419ad9ea040@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: ydL1LfVTCR5f

On Fri, Jun 03, 2022 at 06:56:41AM -0700, Richard Henderson wrote:
> On 6/3/22 02:25, Andrew Jones wrote:
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> 
> This won't work without further changes.
> 
> > @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
> >           """
> >           :avocado: tags=arch:aarch64
> >           :avocado: tags=machine:virt
> > -        :avocado: tags=cpu:cortex-a53
> > +        :avocado: tags=cpu:max
> >           """
> >           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> >                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> 
> For a release this old, we'll see the kernel bugs wrt FEAT_LPA/FEAT_LPA2.
> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")

Thanks Richard. How about for each test with guest kernels which don't
work, I add a comment about LPA2 and use '-cpu max,lpa2=off' instead?

drew 
