Received: by 10.25.0.147 with SMTP id 141csp364047lfa;
        Fri, 3 Mar 2017 10:07:19 -0800 (PST)
X-Received: by 10.28.87.19 with SMTP id l19mr4258814wmb.95.1488564439687;
        Fri, 03 Mar 2017 10:07:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id e203si3858803wmf.29.2017.03.03.10.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 10:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x229.google.com with SMTP id n11so21397667wma.1
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2017 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=QvLTOBOuBt3kte1DuHDeNGbi1iFekSG9J9MrYIGWvH0=;
        b=HWdEdX4uP6bT/wFVNli5iAPYiACGG1J576f4+dzM06b8DdXuT3daMVsHvDkhek1hwm
         QLrbxQD53piigKhlKEZfm6xNUkPvyuXF5vXTVYUCTbtsIm1v+HB05cBAE5gOu+bW5YA2
         PlE0SLx661/XwfA1mP7K1i2HxPn+Km6fyWBQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=QvLTOBOuBt3kte1DuHDeNGbi1iFekSG9J9MrYIGWvH0=;
        b=IM/49ss+iuS6CdverAEQVsRrIWr+N9F/wvmXjdpkUOmLKgIyWbxYzC3gzhojEVETwx
         231SRbT1DSXGmDpTOMbt0HJYmVlmsqj1mCcTM2RUHcgMod/7sSnz+VxM3FW+h77J7SO7
         k7AGu+XdDxDoK7WyJFf6FnBA7TwOXAc2QWp6MezRp4FhF9m6dGLVEHnvLKswD6P3CMrH
         3tvMJD80ag9npRCZymdSHK6tVWrxbsljPkZdTxDTsoGLMZxOI2RBaK+NwSQe/fC0RNLp
         FukqFrnazIYPhYnjw++/mYW9m2aYlYI4UhqsxycfYhBK3QpjgUSKxeq3tvtoCosklupx
         dyqg==
X-Gm-Message-State: AMke39ntEAX0xpPtMIBih5TPQF1YdCJjMUfgKwPkB1jHW0bpy0hnhXlXfsZlN/JrIpJ7+VH9o5e1TCtNzDyCYTMfoog=
X-Received: by 10.28.157.67 with SMTP id g64mr4076643wme.111.1488564439366;
 Fri, 03 Mar 2017 10:07:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:06:58 -0800 (PST)
In-Reply-To: <20170303123232.4967-1-drjones@redhat.com>
References: <20170303123232.4967-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:06:58 +0000
Message-ID: <CAFEAcA8e-DX5OFPmND-9Oercr5vt6eW-tmDWcD7C81+T_uksXA@mail.gmail.com>
Subject: Re: [PATCH] [RFT] target/arm/arm-powerctl: Fix psci info return values
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: RNMcVyKF8hTE

On 3 March 2017 at 12:32, Andrew Jones <drjones@redhat.com> wrote:
> The power state spec section 5.1.5 AFFINITY_INFO defines the
> affinity info return values as
>
>   0 ON
>   1 OFF
>   2 ON_PENDING
>
> I grepped QEMU for power_state to ensure that no assumptions
> of OFF=0 were being made.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> ---
>
> I found this with the yet to be committed kvm-unit-tests test
> https://lists.cs.columbia.edu/pipermail/kvmarm/2017-February/023820.html
>
> I've added the RFT because I didn't bother to confirm Linux is still
> happy (although I can't see why it wouldn't be happier).

Nice catch. Without this patch:

root@genericarmv8:~# echo 0 > /sys/devices/system/cpu/cpu1/online
[  112.797621] CPU1: shutdown
[  112.822447] psci: Retrying again to check for CPU kill
[  112.841306] psci: Retrying again to check for CPU kill
[  112.861303] psci: Retrying again to check for CPU kill
[  112.881346] psci: Retrying again to check for CPU kill
[  112.901302] psci: Retrying again to check for CPU kill
[  112.921301] psci: Retrying again to check for CPU kill
[  112.941303] psci: Retrying again to check for CPU kill
[  112.961302] psci: Retrying again to check for CPU kill
[  112.981350] psci: Retrying again to check for CPU kill
[  113.001368] psci: Retrying again to check for CPU kill
[  113.001789] psci: CPU1 may not have shut down cleanly
(AFFINITY_INFO reports 0)
[  113.002429] CPU1 may not have shut down cleanly: -110

With the patch:
root@genericarmv8:~# echo 0 > /sys/devices/system/cpu/cpu1/online
[   83.303563] CPU1: shutdown
[   83.308003] psci: CPU1 killed.

Applied to target-arm.next for 2.9.

thanks
-- PMM
