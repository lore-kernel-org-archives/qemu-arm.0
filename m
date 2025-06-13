Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp243137njc;
        Fri, 13 Jun 2025 06:10:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmkUal/GIhUm2jiR6KJHWyvBVy+0y50fO30Ts/j8v35Pufp8A512DczADkDE3I9NU8777Hxg3QPat4BA==@linaro.org
X-Google-Smtp-Source: AGHT+IG04acoCTIwbYmQRCnyvnujTemSP1ZjsGMDooj4ALVEFaX8YQJffBSuM4iclhW8eKVZy2uQ
X-Received: by 2002:a05:600c:1c23:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45334ac72d5mr29762515e9.8.1749820217572;
        Fri, 13 Jun 2025 06:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749820217; cv=none;
        d=google.com; s=arc-20240605;
        b=cL4DU92meIXSFGiyc4AfbRBV0X4fYm+ZBWRTATKchCrBYl7fwgQbLQD5DBvBvBaEcJ
         qq47fFZeRFBvpT2fN4UgLvYOMqBv1kQSEWyn1VzEz5uZSDRcQcAQTnJ5epVEB1vbybHx
         exf104tMehUuNh/uKrh11PESvkMlHB8yQpTAnQyLyZZ2CFw2Cn1tW4BzLrDcPg1MO0B4
         EZG7eQsQsR+aryeCPljnLMNZ6ULHs0g825uCya+VmmzfdKzQym1BOWWh5gpNvSjxos4J
         IaWqL96oDIJLT5IvgmsLKmsABoPWRA/4TX/7o14hyv/Q9zRHYLqsb0KE3tOYUDMLC+rc
         Jkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=wv1wJgpXJHiSV4bjm+UKXI+m81yM87W2bonlynd8ceM=;
        fh=oDLjFSOamsMv4A51Yf2lSFFkJGeFX4zTdFZqA2DwPmw=;
        b=WsJNp43R3POQjRiHZGf0ldKXmd8wD2lJe9AMohoGOapyH15hMAE9xRIyGR7L7EEtnA
         2vNP2lhH/gnXCaxCrVvenSE3AfXobJsVYIARHYdnzDeZLJ0SVuu9qThc+8gxjLlvXZCR
         Vcxz+ttIOaYuNOBSHTSCmr9eYL3Se9lYtEEQr0zg7UXjanf5t+k4XwR3ysoN4pVMVx6o
         ffD8vw8CXtgrV0LlOv/4Wn4QCU1QKlPqBv9UcwnwSTIJayhMsdeIUWj0IIXF6aNDEokx
         ER0OnMKjoHuTwvsqD3prXd16NjDIuqnikNmTFla7dEPB4Dlbtoy4UVR3aIvzERUxzMSe
         mEDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-45325203efasi52854955e9.93.2025.06.13.06.10.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJfp55RkBz6K9kL;
	Fri, 13 Jun 2025 21:07:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1257414038F;
	Fri, 13 Jun 2025 21:09:56 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Jun
 2025 15:09:55 +0200
Date: Fri, 13 Jun 2025 14:09:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <mst@redhat.com>,
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>, <linuxarm@huawei.com>,
	<linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
	<wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 2/4] hw/cxl: Make the CXL fixed memory windows
 devices.
Message-ID: <20250613140954.000013f5@huawei.com>
In-Reply-To: <CAFEAcA8eC9TpGyrMARRUWs4q1o7LACD03zLAwPnTRU+m98LrWQ@mail.gmail.com>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
	<20250612134338.1871023-3-Jonathan.Cameron@huawei.com>
	<CAFEAcA8eC9TpGyrMARRUWs4q1o7LACD03zLAwPnTRU+m98LrWQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 52VJEZz2t1gh

On Fri, 13 Jun 2025 13:33:51 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 12 Jun 2025 at 14:44, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Previously these somewhat device like structures were tracked using a list
> > in the CXLState in each machine. This is proving restrictive in a few
> > cases where we need to iterate through these without being aware of the
> > machine type. Just make them sysbus devices.  
> 
> 
> > +static void cxl_fmw_realize(DeviceState *dev, Error **errp)
> > +{
> > +    CXLFixedWindow *fw = CXL_FMW(dev);
> > +
> > +    memory_region_init_io(&fw->mr, OBJECT(dev), &cfmws_ops, fw,
> > +                          "cxl-fixed-memory-region", fw->size);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &fw->mr);
> > +}
> > +
> > +static void cxl_fmw_class_init(ObjectClass *klass, const void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->desc = "CXL Fixed Memory Window";
> > +    dc->realize = cxl_fmw_realize;
> > +    /* Reason - created by machines as tightly coupled to machine memory map */
> > +    dc->user_creatable = false;
> > +}  
> 
> Do these things have any state that needs migrating or resetting?
> If they do, they need a reset function and a vmstate. If not,
> it's helpful to have a comment explaining that the device
> has no state to be reset or migrated, so future readers of
> the code know this wasn't just accidentally forgotten.

Hi Peter,

For these specific devices (the fixed memory windows) there isn't
any state as they are representing fixed configuration of the system.
The state is all in the host bridges and beyond. I'll add
a comment as you suggest.

Currently CXL emulation is completely broken wrt to migration and
there are some known issues for reset as well. Both are on the list
of things to fix. Migration is less important as the only current use
for this stuff is running software stack test cases and for that
migration isn't currently of interest - that will change for some
of the virtualization related work that is just getting started.
The reset thing needs more work for devices as we've tripped over
a few corner cases triggered by people rebooting the guest and device
state not being fully cleared.  On top of that we have a complex
nest of device reset types to cover at some point as some registers
are sticky over some types of reset.

Jonathan



> 
> thanks
> -- PMM
