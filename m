Received: by 10.182.105.169 with SMTP id gn9csp1074098obb;
        Fri, 6 Nov 2015 05:45:49 -0800 (PST)
X-Received: by 10.31.8.15 with SMTP id 15mr13033336vki.10.1446817548779;
        Fri, 06 Nov 2015 05:45:48 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com. [2607:f8b0:400c:c05::235])
        by mx.google.com with ESMTPS id m198si176420vkd.166.2015.11.06.05.45.48
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:45:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) client-ip=2607:f8b0:400c:c05::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkbk63 with SMTP id k63so2440842vkb.0
        for <alex.bennee@linaro.org>; Fri, 06 Nov 2015 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=sAGlk24DeYnXbY3CgYfVj5gBQ59+4/Tieb+voU+MJzM=;
        b=SGaZPazOzXfMp8NlXOqs5pOAaQ2Zk/HX/G9VNNaNEvRP/wt24AM+reWXHljJ/o/rzy
         z/CiPDTQd/vdwbcRhAQk4xyMOXD90OoRkfKA67aJiOo7W3CsD29zkD5BPxJMtA9+kUMj
         HZcKv7BWVfYb0otjdZvKnuFQwucZS9j/RxH9D7xeFzbUokms2PKoE5Du+zPzSZXnPUcF
         HfDe3yklLLsQ9mtr/n4MhJs9Jasw5Wh0ohap3whCCLZUJMm3Wf/JC4ej7EJNdqKtdfIa
         X7YxmJb/LhyOZCsEv25RY6K49ezRsI+v8sbo5hj23lDAipXIytA58jepyH/wTCAHb5Fg
         3VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=sAGlk24DeYnXbY3CgYfVj5gBQ59+4/Tieb+voU+MJzM=;
        b=HTYV/oy8HIc0z/BUcEWeDMitzHumsJE1Dqks74KJ5LGlumCsDfnoxa8eW4BNWJcVzg
         7A4o8nlyOcUfE3bX45jX55VA+uSOYc5WMKGGcoAoPu3pGrtzkVOeQ3kakHyb6JpPaKkS
         xmnGALpkES8DtKK5yCwfRs89ZCyhlq+rQTf2zDVHcCWS32/5P9wnbcbzeRO6GmgrtwTS
         YZp6JyKG5+DnocsFldk8cXIZfBLfuO2tHQyiO7gbNC4gzxiSGzrrnkraQVq3F2w/jRYM
         uJRlxmoiT7aleuswXMgA2ev7u2A5SsOzTstEJbdtHxXrykU0cOj2QZe/3IBs2mAY03Ej
         d24g==
X-Gm-Message-State: ALoCoQnKCG3Mjt3hfV0bVitXO3Ymbt01FFwhMLgUpFC4nCzX14cfnzduuYVoywcCqGNAJQ4tOFWo
X-Received: by 10.31.160.79 with SMTP id j76mr13432185vke.37.1446817548540;
 Fri, 06 Nov 2015 05:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 05:45:29 -0800 (PST)
In-Reply-To: <20151106133448.GD13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-5-git-send-email-peter.maydell@linaro.org> <20151106133448.GD13308@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 13:45:29 +0000
Message-ID: <CAFEAcA_4Euo5vFnjwvBDYuOE28E6kpi22WPPFZjzwpt_sPR2+g@mail.gmail.com>
Subject: Re: [PATCH 04/16] exec.c: Add address space index to CPUIOTLBEntry
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: L4KPCmJahA82

On 6 November 2015 at 13:34, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 06:15:46PM +0000, Peter Maydell wrote:
>> Add the address space index to CPUIOTLBEntry, and use this to pass it
>> to iotlb_to_region(), so that we use the correct AddressSpace when
>> doing IO path lookups.
>
> Hi Peter,
>
> I think this works but eventually when we add support for CPUs behind
> IOMMUs I think things will be easier if we store a pointer to the
> AS instead of an index in the IOTLB. address_space_translate_for_iotlb()
> with IOMMU support may be implemented so that it returns a different
> address space as it walks tha memory hierarchy and translate things.
>
> Do you see any issues with storing pointers to the AS instead of an
> index?

Yeah, we can't deal with arbitrary AddressSpaces here. We need a
CPUAddressSpace, because we use the cached RCU-protected memory_dispatch
pointer. Once you know that you have to be dealing with one of the fixed
CPUAddressSpaces, then you might as well just keep the index rather than
an arbitrary pointer.

thanks
-- PMM
