Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4711908lfa;
        Tue, 3 Nov 2020 03:23:42 -0800 (PST)
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr2963411wmf.47.1604402622369;
        Tue, 03 Nov 2020 03:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604402622; cv=none;
        d=google.com; s=arc-20160816;
        b=QSjzItvyvSS3fwocLNE+zn3fcr2GRAij9SMvJl/vJYnzdnco48LFR3DyuEWEx+ci2V
         JXZGmIWIeR6b+UUtkYZoC4VHDO59UJ9WXIlt2gOeKx/yzRVNGGqzi4gGGlKDBZfW2xK+
         st5zZxcrdZqRjHQtJYWc6XRiiAJ7lLnwiYlgJn7W9mau9LqknYrFmjb4u/lfnJcBJkBd
         +6EZZdDVfGU0TP7KsZakO6S6WLifleCqYolSbJPuqP4vuFV/srP+vidSLfjjRI9o8JZC
         t60wwBpFMoVEFd9euh4jkyPHgsryIg5GpHW/98LL9kEedyKlkd7hYdRJmchWMEFikd0W
         Gt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=QrCy0ptCmo+IcRbkhv465ExulosTAPj5gllxESOYYNw=;
        b=AK0tx0/6npzRuluQljmQecfw9AdakBHGxBRHAOfxRtAVkaV85mv/aIWcFh4XvIMBvP
         LodUgJTzuxLXtkMHJYZpnlv/vErD9UiEkTimIDP2qYeyLaVw1A/HIFpjSUFMU95S5DFT
         Zq+MQiIp3i4EF9tq/r01GeOKP3Oi1pSLTeyVEiXn/dAcQFIIEhjTo0y94q6GMiibiMjP
         vN/iwCTHt9xuQmZItT7B/a6Q9IxIw+Jjf+SlpyWcoOpi/cx+wYynqQ+iwOyBK6lbJss+
         tgjEuByXhqw2MFA7QdSDpLO71pG8DoNgH9FplwKNSgSOtg5VJdffWPB0Zeia6psZvy5L
         tcyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Coa0etZS;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif@nuviainc.com
Return-Path: <leif@nuviainc.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 189sor1355777wmz.28.2020.11.03.03.23.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Nov 2020 03:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of leif@nuviainc.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Coa0etZS;
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=leif@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QrCy0ptCmo+IcRbkhv465ExulosTAPj5gllxESOYYNw=;
        b=Coa0etZSFfyeWp5V7U2tfjIGUhz39srC5jb4qAy2iiduICqJOgOzKZgXkI4eczzsrU
         o3qbVw6RQ1L1oqLASqigDvw4O5ic21GNC7dJ8GP83N17bDyMGkzkdkXSZpnrz7S3dYUu
         dk9Rq3OxHkYWebGP2JxInsC6YYW38LDDUQXGOsGSxdKnJrn5X6nwccoEUhL+kc2H72qo
         smoj+otVrF2F4r4g0cyy+1SEiXyw51hzy9ZFrMzP74wHPrfvLjQ3bH/NGbN/By/9JCXi
         +ti3W+U+HhKDTZfLqv3hgbmwdu/Tl4PViiCdMCwzFKt4crtfs9ywzWgzJuqQ/hM2ZgpX
         PAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QrCy0ptCmo+IcRbkhv465ExulosTAPj5gllxESOYYNw=;
        b=k8B86Ba2LRHipmFVu//mVRzTRaiPJCCSOfLcCn91dlEgKISsT4EKPKBmNktv1CFcBj
         m8e9h94BNhSpRuZXubfAiSXiLuAJrF9iMh9v2KwLs5QtvhRH/8Z/Z49Ot/5hNQ7PeOAQ
         eMKROPFkQU5Kp9fBWCLajaBAVN7QJ6+8CoTpBON/H+2cong2XnyejhpDFkfAYjVZ/yRN
         K3Dtg/S+i59eAeIJMlnXqqorMLn5HC4ZMooOfR+duUpZ/cD8obErlsQINls+nIbg/qp3
         6qMc7oUtu5FXp/rNXjbu8WbNbSBypnq89sgwmG7Nj+Vd6bHDIdaPvKcGotlDkKGgVn5C
         FoMA==
X-Gm-Message-State: AOAM532U/qlXUvB9mxndp37kBpdK9aWy5qshwl40V2KqN12so15tSi+U
	tK12RGiDDpeAxRhZ3lY9hD5e812b4mXvgJ1/stnDjPf03ucHrA/zOBegaZdwNzTK7rIhoqBtpk5
	7MRVw0Z7YoYYWios+NCIYmJyCsWSr1Gahd/mzkC6mdQ2DlowMg9PFzWOvnlKrLzCE/N/V
X-Google-Smtp-Source: ABdhPJwnYiXY40LQDyTVPMGqiYvIv0qs/6L1ShwTqYr+mPIYs3+7ccqUYFyuvkjFizZwiVJfwgl4vg==
X-Received: by 2002:a1c:1946:: with SMTP id 67mr3010886wmz.15.1604402621789;
        Tue, 03 Nov 2020 03:23:41 -0800 (PST)
Return-Path: <leif@nuviainc.com>
Received: from vanye (cpc92880-cmbg19-2-0-cust79.5-4.cable.virginm.net. [82.27.104.80])
        by smtp.gmail.com with ESMTPSA id b4sm17758251wro.57.2020.11.03.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 03:23:41 -0800 (PST)
Date: Tue, 3 Nov 2020 11:23:39 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Graeme Gregory <graeme@nuviainc.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] docs: add some notes on the sbsa-ref machine
Message-ID: <20201103112339.GP1664@vanye>
References: <20201103104710.27150-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201103104710.27150-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: hBEJQjSNqeJJ

On Tue, Nov 03, 2020 at 10:47:10 +0000, Alex Bennée wrote:
> We should at least document what this machine is about.

Thanks!
(comments below)

> Cc: Graeme Gregory <graeme@nuviainc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Hongbo Zhang <hongbo.zhang@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/system/arm/sbsa.rst   | 30 ++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 docs/system/arm/sbsa.rst
> 
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> new file mode 100644
> index 0000000000..a47c9360de
> --- /dev/null
> +++ b/docs/system/arm/sbsa.rst
> @@ -0,0 +1,30 @@
> +Arm Server Base System Architecture Reference board (``sbsa-ref``)
> +==================================================================
> +
> +While the `virt` board is a generic board platform that doesn't match
> +any real hardware the `sbsa-ref` board intends to look like real
> +hardware. The `Server Base System Architecture
> +<https://developer.arm.com/documentation/den0029/latest>` defines a
> +minimum base line of hardware support and importantly how the firmware
> +reports that to any operating system. It is a static system that
> +reports a very minimal DT to the firmware for command line input to
> +the firmware.

I think you mean the right thing, but ...
"a very minimal DT to the firmware for non-discoverable information
 about components affected by the qemu command line"
 (i.e. cpus and memory)

> As a result it must have a firmware specifically built
> +to expect a certain hardware layout (as you would in a real machine).
> +
> +It is intended to be a machine for developing firmware and testing
> +standards compliance with operating systems.
> +
> +Supported devices
> +"""""""""""""""""
> +
> +The sbsa-ref board supports:
> +
> +  - A configurable number of Cortex-A57 cpus
> +  - GIC version 3

The intent was always for sbsa-ref to be tracking SBSA development, so
I wonder whether we should be documenting specific versions of cpu and
gic (and then keep remembering to update the docs).
My short-term plan was to swap the a57 for "max", but
documentation-wise, could we just say "number of aarch64 cpus"?
Could we refer to the gic as "latest supported emulated"?

/
    Leif

> +  - System bus AHCI controller.
> +  - System bus EHCI controller.
> +  - CDROM and hard disc on AHCI bus.
> +  - E1000E ethernet card on PCIE bus.
> +  - VGA display adaptor on PCIE bus.
> +  - A generic SBSA watchdog device
> +
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index fdcf25c237..9636f3fd00 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -79,6 +79,7 @@ undocumented; you can get a complete list by running
>     arm/mps2
>     arm/musca
>     arm/realview
> +   arm/sbsa-ref
>     arm/versatile
>     arm/vexpress
>     arm/aspeed
> -- 
> 2.20.1
> 
