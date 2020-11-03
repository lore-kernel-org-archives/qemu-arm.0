Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4693708lfa;
        Tue, 3 Nov 2020 02:57:21 -0800 (PST)
X-Received: by 2002:a5d:688c:: with SMTP id h12mr26201160wru.92.1604401041511;
        Tue, 03 Nov 2020 02:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604401041; cv=none;
        d=google.com; s=arc-20160816;
        b=n9j5cFQZa5AboGuZGpr5mMtIN67P6xBtlPU01tVXXMuMW/1WI74Nlzoz8FeXbMmJ40
         Xv5CXgGXPVuVrengrRcqQG9kx4jp1QS7haWgGjvIqdtDJnEn+8C8jxyW5PGB949kMIbS
         NO0FSboVsGaX9XnYUoGXKUT4+fR8yAP5D+dIObbBXmHYpe+dhLNvJgmmd/Ngsu4eH7Jf
         /Aplq+2MoJxZx4aYAgWAg76JEUMvPyxDinrbxi+91FLz95HRxJ+VSPpZoSJxspyPwTCe
         TGmj3kEzyXFFld6hXoMtKC81v9JGnFDL2mdn5cf70d3rgjEH5FMfwp493A2GnnImBRbX
         /OpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=VTPZGqRAI9Uhe/2ZQKlj2SlQo8KD39n58MrSR+FxS28=;
        b=GtKGhoyiOSAaTKQifXn05sVvp0zmIDet1cv6yrgP3ud2u1zDeAenrjC3erjFiRe0cI
         oXb/wKaGx4SvmJu/lGMOmSUludy3TK5Ly/HeRS/tjfFiar9l7d1WR+vYD5WaMbY2+l1B
         0cqPRRBH54V1YCq3rd20qAif1qp1YSnr94L/DvsIbc8wveyTEnwHNGSROd17tnZbtCbb
         wo6av21rOyI0wiLcZbJrmEX5Ea+6fMdgiRL4lj4hRiVR1Vub1X5uLdc9lHRvs+PWefpw
         S46uF3G16pudguE4kwRXURUkq6UKE1nL60pH3GlF8pr/2SU9zIz0NHG7RxQVipPJScj3
         M4dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Jxs4UuuU;
       spf=pass (google.com: domain of graeme@nuviainc.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=graeme@nuviainc.com
Return-Path: <graeme@nuviainc.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h79sor1328052wme.1.2020.11.03.02.57.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Nov 2020 02:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of graeme@nuviainc.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Jxs4UuuU;
       spf=pass (google.com: domain of graeme@nuviainc.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=graeme@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VTPZGqRAI9Uhe/2ZQKlj2SlQo8KD39n58MrSR+FxS28=;
        b=Jxs4UuuURzVR9gl5XQROjY8GG0Q+FXMhenObXxK5u+627IHvLG/KJZi20FsfBsPm22
         fK0pl2sgGSflKt+T03FhzWIAa+cjaGq+OOXbujBlnhMPZytsLJ30iGlg9gzBi7dKfQDI
         ZEFo0+XBYwNlXbIB0UPtCfVAxy4EVWdNLFgkxDKXjnZrSj/IMoJL7Iubut2M6sYik9Y5
         G/8JQelMnP5i3JXr/JmpcC/1qw8OL7BohcYMO29jezIxgf+iq3IcwQXA5luY3c53z4s4
         fOxBz76oMECGDsWGIYdt/67kAwOEvBoWGjmgkenmqzYSalAif2eGjsUrooiO9JFnBMwa
         rPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VTPZGqRAI9Uhe/2ZQKlj2SlQo8KD39n58MrSR+FxS28=;
        b=cgSr435WXun+BQETMY6h6yndvlpuNYbpYBoSFQVqmcuxargkOj6UgM5w3Esnr+6Jzx
         IyrxbArYAucP/pmaF3DtCfeVcIvOvInEgxaiX/WmcZnRxU2HN9w0TlNcMvKA5HgY+AG+
         ywCnx8Kw1MbPUYn4FsqOhkgYTktF6fofkBjg1ddcgZo/0fhv93rMzmyePdlBBKQgXjZS
         2bK3WbBHcs9ajGMVmWGOS+jrzSCKr1LG3YQ6nxY3qtqHiPdV/5/+MhPWYCXKERmDyiqB
         h2oPQftkt7dWPA8mR0JfkP4qRYQ/nIG0jwqEl6fuTTFFJtP9ja/QDaXR+mEJdVI4RCC+
         aGHA==
X-Gm-Message-State: AOAM531Rws0uFpxbIpIN2C+TRajMI1Dc2EXI6rmzNS9ES5DPHC2MEXOR
	GI932y/vahyzNkeNMIOKcvtTQ6aH2L15zdXDMXKXvUFGBzy/M/EV+R0+6VCABGxt8TFF8IwmTW0
	PktY/3L8I0zAL3yoc7WQW543iW5qnlJkfI0T2hz2bjWYFATKklO77TfDC05/GPFtM1q4csoCzrg
	==
X-Google-Smtp-Source: ABdhPJw5pMWxYYUkUCZjif0HEEEJs8i6Z+0hFHGNtwXTCJxmuKxBrSYr1oYlwl/pJhisO+o83k4s4w==
X-Received: by 2002:a1c:68c1:: with SMTP id d184mr2892296wmc.74.1604401040938;
        Tue, 03 Nov 2020 02:57:20 -0800 (PST)
Return-Path: <graeme@nuviainc.com>
Received: from xora-monster ([2a02:8010:64d6::1d89])
        by smtp.gmail.com with ESMTPSA id f20sm2575903wmc.26.2020.11.03.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 02:57:20 -0800 (PST)
Date: Tue, 3 Nov 2020 10:57:18 +0000
From: Graeme Gregory <graeme@nuviainc.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif@nuviainc.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] docs: add some notes on the sbsa-ref machine
Message-ID: <20201103105718.tlrx44tuhbu5u66e@xora-monster>
References: <20201103104710.27150-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201103104710.27150-1-alex.bennee@linaro.org>
X-TUID: mN1TUH9Afck3

On Tue, Nov 03, 2020 at 10:47:10AM +0000, Alex Bennée wrote:
> We should at least document what this machine is about.
> 
Looks good to me.

Reviewed-by: Graeme Gregory <graeme@nuviainc.com>

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
> +the firmware. As a result it must have a firmware specifically built
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
